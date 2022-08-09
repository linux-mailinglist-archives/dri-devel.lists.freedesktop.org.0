Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A64CA58D84C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 13:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2162D170B;
	Tue,  9 Aug 2022 11:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960BBD16E3;
 Tue,  9 Aug 2022 11:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660045022; x=1691581022;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=X/dHIiLosgMB7zWLY1AkVGmw+kNUfgf9G3XdNu373VA=;
 b=Y32teML4ZaWYJ6Et7JhyHNaFLDWOTGXS4gTlU5IVrlDmtezvEYVB8h6f
 NnsFhx5MwZ0kM3Ct4G0LTT9k1oO49bbCmLjY96KdzAGihCMIG5EKFY993
 tq1hYgKAnwWYz1YksbWg9kO9yptu0ExxpRCIfoP/+WkuY/FC8yI4zZ/KR
 vfOEUHC2a7jvghp2/v4kgveg/Pcq9SJ+7g7tInVp1njuvkvJMpVnN8P3n
 FoXgT6LhpchrLnodfzK6dyDNiGF3wOAQQCAerLPMC7OFxoipi/diiQmP4
 EWDaTvwgVnxhVxzc872M+8Rbsgigia2OoxYQF4lUg9PKwxPK0/xn1nR4W Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="316742534"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="316742534"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 04:37:01 -0700
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="747008545"
Received: from mram-mobl1.amr.corp.intel.com (HELO [10.213.184.71])
 ([10.213.184.71])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 04:36:59 -0700
Message-ID: <db9f787e-c3e4-d353-da57-80cb7a135d86@linux.intel.com>
Date: Tue, 9 Aug 2022 12:36:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5] drm/i915: stop using swiotlb
Content-Language: en-US
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "bob.beckett@collabora.com" <bob.beckett@collabora.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>
References: <20220726153935.2272777-1-bob.beckett@collabora.com>
 <1160a7c31084ab2259088e4bfe88b41ad61c2bcc.camel@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <1160a7c31084ab2259088e4bfe88b41ad61c2bcc.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "kernel@collabora.com" <kernel@collabora.com>, "hch@lst.de" <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/08/2022 16:48, Hellstrom, Thomas wrote:
> Hi, [back from vacation]
> 
> On Tue, 2022-07-26 at 16:39 +0100, Robert Beckett wrote:
>> Calling swiotlb functions directly is nowadays considered harmful.
>> See
>> https://lore.kernel.org/intel-gfx/20220711082614.GA29487@lst.de/
>>
>> Replace swiotlb_max_segment() calls with dma_max_mapping_size().
>> In i915_gem_object_get_pages_internal() no longer consider
>> max_segment
>> only if CONFIG_SWIOTLB is enabled. There can be other (iommu related)
>> causes of specific max segment sizes.
>>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Thomas Hellstrom <thomas.hellstrom@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>>
>> v2: - restore UINT_MAX clamp in i915_sg_segment_size()
>>      - drop PAGE_SIZE check as it will always be >= PAGE_SIZE
>> v3: - actually clamp to UINT_MAX in i915_sg_segment_size()
>> v4: - round down max segment size to PAGE_SIZE
>> v5: - fix checkpatch whitespace issue
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> 
> Hmm,
> 
> This whole thing looks a bit strange to me since with SWIOTLB actually
> used for i915, the driver should malfunction anyway as it doesn't do
> any dma_sync_sg_for_cpu() or dma_sync_sg_for_device(), and the driver
> assumes all coherent dma. Is that SWIOTLB=force kernel option still
> available?

Don't know about these - but pretty sure in the past we had i915 break 
if we did not respect swiotlb_max_segment.

Digging through git history at least running as Xen dom0 looks to have 
been impacted, but commits such as abb0deacb5a6 ("drm/i915: Fallback to 
single PAGE_SIZE segments for DMA remapping") are older and suggest 
problem was generic. 1625e7e549c5 ("drm/i915: make compact dma scatter 
lists creation work with SWIOTLB backend.") as well. So it looks it did 
work behind swiotlb despite those missing calls you highlighted.

> Also, correct me if I'm wrong, but the original driver segment size
> appears to mean "the largest contiguous area that can be handled either
> by the device or the dma mapping layer" rather than the total space
> available for dma mappings? Not completely sure what
> dma_max_mapping_size() is returning, though?

AFAIU looks to be compatible on paper at least.:

dma_max_mapping_size -> "Returns the maximum size of a mapping for the 
device."

So an individual mapping.

But then in case of swiotlb is implemented in swiotlb_max_mapping_size, 
and not the same code as swiotlb_max_segment. I agree, ideally if 
someone could clarify they are returning the same thing or there is a 
miss somewhere.

Regards,

Tvrtko
