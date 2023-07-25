Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFB17617A4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 13:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DD010E083;
	Tue, 25 Jul 2023 11:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DA210E083;
 Tue, 25 Jul 2023 11:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690285937; x=1721821937;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eeNZxsYZVE0Brk/Q/h9Taab7dCmBLzOz2M0riI0Gq04=;
 b=AuDj12W11T1GHWr9GLE+lqXUtB4h+JbUV3bGduPTYZ853grxp06qMtcx
 lw77e4Swnads8UwsMaHvFodWKHLTUoMX+8Q7g0klPn0j1UdpPXUyMmPY8
 skPNzEs4x8rAIzoZ9iv/DJOeA68gYVcxHVIE9eeb4BKl6XU2id3JtNKND
 8WsViFrwpFB+MReQy+fZbKfOLc0nKLegaCIh7Nwn34dmUtnd+1Iwv3L3H
 +IB4/PSHvhRo/BvuNsZPFt0bXuRZsfK4zpPsn3VxBAR9ZU6Q9uf7sl/cp
 b116TOAW6wNrB3SFLEiY6fB+itNxi1dtPCaHqUP3mIYL+XMbnakn3taAx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="370368492"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="370368492"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="816224003"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="816224003"
Received: from grdarcy-mobl1.ger.corp.intel.com (HELO [10.213.228.4])
 ([10.213.228.4])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:52:15 -0700
Message-ID: <d76a8009-0193-9bc9-15d1-e672cb5bd3d6@linux.intel.com>
Date: Tue, 25 Jul 2023 12:52:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Avoid GGTT flushing on non-GGTT
 paths of i915_vma_pin_iomap
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230724125633.1490543-1-tvrtko.ursulin@linux.intel.com>
 <ZL7cBvXCdtx3yzkB@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZL7cBvXCdtx3yzkB@ashyti-mobl2.lan>
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
Cc: Intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/07/2023 21:16, Andi Shyti wrote:
> Hi Tvrtko,
> 
> On Mon, Jul 24, 2023 at 01:56:33PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Commit 4bc91dbde0da ("drm/i915/lmem: Bypass aperture when lmem is available")
>> added a code path which does not map via GGTT, but was still setting the
>> ggtt write bit, and so triggering the GGTT flushing.
>>
>> Fix it by not setting that bit unless the GGTT mapping path was used, and
>> replace the flush with wmb() in i915_vma_flush_writes().
>>
>> This also works for the i915_gem_object_pin_map path added in
>> d976521a995a ("drm/i915: extend i915_vma_pin_iomap()").
>>
>> It is hard to say if the fix has any observable effect, given that the
>> write-combine buffer gets flushed from intel_gt_flush_ggtt_writes too, but
>> apart from code clarity, skipping the needless GGTT flushing could be
>> beneficial on platforms with non-coherent GGTT. (See the code flow in
>> intel_gt_flush_ggtt_writes().)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Fixes: 4bc91dbde0da ("drm/i915/lmem: Bypass aperture when lmem is available")
>> References: d976521a995a ("drm/i915: extend i915_vma_pin_iomap()")
>> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> Cc: <stable@vger.kernel.org> # v5.14+
>> ---
>>   drivers/gpu/drm/i915/i915_vma.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index ffb425ba591c..f2b626cd2755 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -602,7 +602,9 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
>>   	if (err)
>>   		goto err_unpin;
>>   
>> -	i915_vma_set_ggtt_write(vma);
>> +	if (!i915_gem_object_is_lmem(vma->obj) &&
>> +	    i915_vma_is_map_and_fenceable(vma))
>> +		i915_vma_set_ggtt_write(vma);
>>   
>>   	/* NB Access through the GTT requires the device to be awake. */
>>   	return page_mask_bits(ptr);
>> @@ -617,6 +619,8 @@ void i915_vma_flush_writes(struct i915_vma *vma)
>>   {
>>   	if (i915_vma_unset_ggtt_write(vma))
>>   		intel_gt_flush_ggtt_writes(vma->vm->gt);
>> +	else
>> +		wmb(); /* Just flush the write-combine buffer. */
> 
> is flush the right word? Can you expand more the explanation in
> this comment and why this point of synchronization is needed
> here? (I am even wondering if it is really needed).

If you are hinting flush isn't the right word then I am not remembering 
what else do we use for it?

It is needed because i915_flush_writes()'s point AFAIU is to make sure 
CPU writes after i915_vma_pin_iomap() have landed in RAM. All three 
methods the latter can map the buffer are WC, therefore "flushing" of 
the WC buffer is needed for former to do something (what it promises).

Currently the wmb() is in intel_gt_flush_ggtt_writes(). But only one of 
the three mapping paths is via GGTT. So my logic is that calling it for 
paths not interacting with GGTT is confusing and not needed.

> Anyway, it looks good:
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks. If you don't see a hole in my logic I can improve the comment. I 
considered it initially but then thought it is obvious enough from 
looking at the i915_vma_pin_iomap. I can comment it more.

Regards,

Tvrtko

> 
> Andi
> 
>>   }
>>   
>>   void i915_vma_unpin_iomap(struct i915_vma *vma)
>> -- 
>> 2.39.2
