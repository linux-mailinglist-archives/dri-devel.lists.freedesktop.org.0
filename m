Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9325780E9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 13:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF4999377;
	Mon, 18 Jul 2022 11:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF10699377;
 Mon, 18 Jul 2022 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658144223; x=1689680223;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/TOoxU+a0Q0WlWXmx9lahsQlI3SkWPXIx7AujtPA5uk=;
 b=drJr3vnjdhSg9LmEgXDlb/i2Ho/thhu5JkRp6u/F7mIgSJbZ2mh10hnV
 VJSNMF4mCzvbwRMk6EswUjN/CJBUUpIDeeFf9ez5AGZh9L7cziCIiR8ag
 KvigVce3KDD3CQw6iiTy38J57+PYu3Nd0AoSh9fNDxgPf2kAVBfIu8hZI
 lk5kf8C36qQFIhamYX2s8rgB4PdDEviyDYntr4dqhZWSXwb7guxMxNP+K
 Sg6Je9Snlge2zhd58A7HaGPAqp1prTwCicR1aJzpIOAb9EG4rL+TRAbMd
 a7dbJzLmD2YYao2QvpWIbmbj10KqPjFVqWv7l/o+JG8NxgMuOXPuneadm g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="350159513"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="350159513"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 04:37:03 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="723828947"
Received: from smyint-mobl1.amr.corp.intel.com (HELO [10.212.107.15])
 ([10.212.107.15])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 04:37:00 -0700
Message-ID: <46938a7a-0b89-0bd3-d137-851a037b644f@linux.intel.com>
Date: Mon, 18 Jul 2022 12:36:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: susetting the remaining swioltb couplin in DRM
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20220711082614.GA29487@lst.de> <YsyItfiuccW7iQln@intel.com>
 <20220712050055.GA4727@lst.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220712050055.GA4727@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Robert Beckett <bob.beckett@collabora.com>, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 12/07/2022 06:00, Christoph Hellwig wrote:
> On Mon, Jul 11, 2022 at 04:31:49PM -0400, Rodrigo Vivi wrote:
>> On Mon, Jul 11, 2022 at 10:26:14AM +0200, Christoph Hellwig wrote:
>>> Hi i915 and nouveau maintainers,
>>>
>>> any chance I could get some help to remove the remaining direct
>>> driver calls into swiotlb, namely swiotlb_max_segment and
>>> is_swiotlb_active.  Either should not matter to a driver as they
>>> should be written to the DMA API.
>>
>> Hi Christoph,
>>
>> while we take a look here, could you please share the reasons
>> behind sunsetting this calls?
> 
> Because they are a completely broken layering violation.  A driver has
> absolutely no business knowing the dma-mapping violation.  The DMA
> API reports what we think is all useful constraints (e.g.
> dma_max_mapping_size()), and provides useful APIs to (e.g.
> dma_alloc_noncoherent or dma_alloc_noncontiguous) to allocate pages
> that can be mapped without bounce buffering and drivers should use
> the proper API instead of poking into one particular implementation
> and restrict it from changing.
> 
> swiotlb_max_segment in particular returns a value that isn't actually
> correct (a driver can't just use all of swiotlb) AND actually doesn't
> work as is in various scenarious that are becoming more common,
> most notably host with memory encryption schemes that always require
> bounce buffering.

All these are either in the internal backend or in the old shmem 
backend. I understand both are soon to be retired or deprecated. I think.

+ Matt & Thomas, and Bob actually as well, as I think authorities in the 
shmem, TTM and internal backend at the moment. Could you guys please 
have look if and how the TTM backend needs to handle this and what is 
the timeline of retirement if relevant?

Regards,

Tvrtko
