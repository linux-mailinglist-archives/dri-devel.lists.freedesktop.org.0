Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6687C80896C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 14:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACF710E1ED;
	Thu,  7 Dec 2023 13:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8C910E1ED;
 Thu,  7 Dec 2023 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701956779; x=1733492779;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uuX+Y2nKDcntwCH6QDVAbVOLKdstZR0K27Ib7Gvxpg0=;
 b=OiXjtQZ8PsHhTugipm+jlTu2hbph1nLZdUWYX68FLtvHPVh552hP1s3v
 P2gCA3zWYvWWKfumhxfBp++q/sXqaq1rjpVZFUg8rDMlpLNmENS6SbQaj
 yJb82TePoCHFGqJ11GSkqfod+aeleEjTilGMSKyGR9T2rdn4vGa/cBKOP
 jmy/tj9386WEC+U7IgwkF1UA4l2D8wcVwVO+Zv+5VQpKfmcX+5rEXNcFj
 mB4t/L427D+5ptHrdO20YTaTXI+gktEIesADzVwdGcgAalRjy+XoGdTLN
 Bbfs6pcIoXolobIBq6eZXxC+n394TuDARByH/r18VdyowLtgSAaTEqZX3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="384636953"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="384636953"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:46:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="771734713"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="771734713"
Received: from jbuller-mobl.ger.corp.intel.com (HELO [10.213.214.207])
 ([10.213.214.207])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:45:58 -0800
Message-ID: <8b4cec4c-8d39-4fd0-8e2d-f66f89527117@linux.intel.com>
Date: Thu, 7 Dec 2023 13:45:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/i915/selftests: Fix engine reset count storage
 for multi-tile
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231201122109.729006-1-tvrtko.ursulin@linux.intel.com>
 <ZXGr7s7wkYZexDuc@ashyti-mobl2.lan>
 <3b38e862-7a45-48b9-9310-b751d797a9ef@linux.intel.com>
 <ZXGwjTj3vsI6NAcI@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZXGwjTj3vsI6NAcI@ashyti-mobl2.lan>
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
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/12/2023 11:46, Andi Shyti wrote:
> On Thu, Dec 07, 2023 at 11:43:28AM +0000, Tvrtko Ursulin wrote:
>>
>> On 07/12/2023 11:26, Andi Shyti wrote:
>>> Hi Tvrtko,
>>>
>>>> Engine->id namespace is per-tile so struct igt_live_test->reset_engine[]
>>>> needs to be two-dimensional so engine reset counts from all tiles can be
>>>> stored with no aliasing. With aliasing, if we had a real multi-tile
>>>> platform, the reset counts would be incorrect for same engine instance on
>>>> different tiles.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Fixes: 0c29efa23f5c ("drm/i915/selftests: Consider multi-gt instead of to_gt()")
>>>> Reported-by: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
>>>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>
>>> sorry for being late here... the patch makes sense to me and the
>>> CI failures don't look related.
>>>
>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>
>> Thanks pushed!
>>
>> There is more work to be done with the fact i915_reset_engine_count has it's
>> own aliasing when used like this, but I opted to leave that for some other
>> time.
> 
> feel free to share if you have some preparatory work done already
> and I can try to help out. Otherwise I can take a look at it, as
> well.

I don't have any patches I was just noticed when doing this that even 
though i915_reset_engine_count takes the engine as parameter, the 
i915->gpu_error is a single gt construct and as such I think using 
i915_reset_engine_count from per gt selftests is a mismatch.

I thought options were to add engine reset counts in the engine itself 
and use that from selftests. Leaving i915_reset_engine_count to be used 
from error capture paths. And it probably needs to be renamed 
accordingly so it is not misleading.

But then there may be issues around virtual engines though which this 
helper conveniently and quietly side stepped.

At that point I stopped thinking about it, given how real multi-tile for 
i915 is not happening, I didn't see it worth the effort. Still the sour 
taste of a mess remains so if you can think of an elegant and relatively 
cheap solution I think it would be good to tidy.

Regards,

Tvrtko
