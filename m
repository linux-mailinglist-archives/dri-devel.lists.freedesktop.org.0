Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BD3399D88
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 11:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527E36F467;
	Thu,  3 Jun 2021 09:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AE96F45D;
 Thu,  3 Jun 2021 09:17:11 +0000 (UTC)
IronPort-SDR: J3TSOnt0XRYgj8N4/8+UfGGrdMtfnSOZ/D4qMiD/qq+5EIPE6Me9Vs1y8dEBczgSW/U7SR5jVA
 WS+8ATSD2wkQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="203815095"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="203815095"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 02:17:08 -0700
IronPort-SDR: GiFlEA2d98S0y3fZX2hwn2y9S0cggQtERcJvUzDDX14kZt+3xkig3EyHLndhd45VWF76KFBNLM
 XY2WVcRmIijA==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="483398225"
Received: from aburk3x-mobl2.ger.corp.intel.com (HELO [10.213.243.139])
 ([10.213.243.139])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 02:17:06 -0700
Subject: Re: [Intel-gfx] i915 and swiotlb_max_segment
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: <20210510152525.GA30093@lst.de> <YKZ8eqnSnaso3aoe@0xbeefdead.lan>
 <162270961054.11739.9148402963893484386@jlahtine-mobl.ger.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <d7bd2bde-2b95-44fa-18b0-fd883c78e3b6@linux.intel.com>
Date: Thu, 3 Jun 2021 10:17:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <162270961054.11739.9148402963893484386@jlahtine-mobl.ger.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 03/06/2021 09:40, Joonas Lahtinen wrote:
> + Tvrtko to take a look
> 
> Quoting Konrad Rzeszutek Wilk (2021-05-20 18:12:58)
>> On Mon, May 10, 2021 at 05:25:25PM +0200, Christoph Hellwig wrote:
>>> Hi all,
>>>
>>> swiotlb_max_segment is a rather strange "API" export by swiotlb.c,
>>> and i915 is the only (remaining) user.
>>>
>>> swiotlb_max_segment returns 0 if swiotlb is not in use, 1 if
>>> SWIOTLB_FORCE is set or swiotlb-zen is set, and the swiotlb segment
>>> size when swiotlb is otherwise enabled.
>>>
>>> i915 then uses it to:
>>>
>>>   a) decided on the max order in i915_gem_object_get_pages_internal
>>>   b) decide on a max segment size in i915_sg_segment_size
>>>
>>> for a) it really seems i915 should switch to dma_alloc_noncoherent
>>> or dma_alloc_noncontigous ASAP instead of using alloc_page and
>>> streaming DMA mappings.  Any chance I could trick one of the i915
>>> maintaines into doing just that given that the callchain is not
>>> exactly trivial?
>>>
>>> For b) I'm not sure swiotlb and i915 really agree on the meaning
>>> of the value.  swiotlb_set_max_segment basically returns the entire
>>> size of the swiotlb buffer, while i915 seems to use it to limit
>>> the size each scatterlist entry.  It seems like dma_max_mapping_size
>>> might be the best value to use here.
>>
>> Yes. The background behind that was SWIOTLB would fail because well, the
>> size of the sg was too large. And some way to limit it to max size
>> was needed - the dma_max_mapping_size "should" be just fine.

Can't say I am 100% at home here but what I remember is that the limiting factor was maximum size of a sg segment and not total size of the mapping.

Looking at the code today, if we would replace usage swiotlb_max_segment() with dma_max_mapping_size(), I don't see that would work when we call dma_map_sg_attrs().

Because AFAICT code can end up in dma_direct_max_mapping_size() (not sure when the ops->map_sg path is active and where to trace that) where we have:

size_t dma_direct_max_mapping_size(struct device *dev)
{
	/* If SWIOTLB is active, use its maximum mapping size */
	if (is_swiotlb_active() &&
	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
		return swiotlb_max_mapping_size(dev);
	return SIZE_MAX;
}

So for all swiotlb cases, including force, we get:

size_t swiotlb_max_mapping_size(struct device *dev)
{
	return ((size_t)IO_TLB_SIZE) * IO_TLB_SEGSIZE;
}

Which is fixed and doesn't align with swiotlb_max_segment(). But you guys are the experts here so please feel to correct me.

Regards,

Tvrtko
