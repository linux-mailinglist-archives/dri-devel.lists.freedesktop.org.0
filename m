Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98338757A79
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 13:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C0910E324;
	Tue, 18 Jul 2023 11:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AC010E325;
 Tue, 18 Jul 2023 11:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689679730; x=1721215730;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eG9i8FoJlSyTJM2sgpvziVRwaPmDaVtbaL3UEyeheKw=;
 b=HLHGSo4IzWWhKBlmILxnn7kjRXwIF0VaH44Fm/6YbpNpaSj20fXWPEtq
 i8HSg5uZIeexfCAlB0u70Mb+pjw8dGeu68UWPQjcfDvspc7ZR4mg+3Okw
 a7R8vpUBi6LAwvL2BSfO9gTLZDTPYFf3HUFZ9xQFgIsbE3xRe7bZF5biO
 ijhniZdgCnSVN9EZhugI1MXVd6cEqX+BVkguZK8vQK47D9jp46fsPs++g
 NEAf2P0N9qr4+UqHPKHXBZIIv5netA2ev5bCAn5RvvmCOCthWAOnxGH+c
 ZoIvb/p59r8vIl0E/xt7HmtTTbglHi0T1ZkIXlX0ilw5VnSfDfBkCP47C w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="368821005"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="368821005"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 04:28:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="813719404"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="813719404"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.19.167])
 ([10.213.19.167])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 04:28:42 -0700
Message-ID: <3c7dfc18-539f-2b0c-0c77-48b89ef96560@intel.com>
Date: Tue, 18 Jul 2023 13:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/i915/tv: avoid possible division by zero
Content-Language: en-US
To: Su Hui <suhui@nfschina.com>, Dan Carpenter <dan.carpenter@linaro.org>
References: <8e3e945b-9cae-71e9-fc68-dc1c64e5ea86@nfschina.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <8e3e945b-9cae-71e9-fc68-dc1c64e5ea86@nfschina.com>
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
Cc: tvrtko.ursulin@linux.intel.com, kernel-janitors@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, trix@redhat.com,
 intel-gfx@lists.freedesktop.org, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, nathan@kernel.org, mripard@kernel.org,
 rodrigo.vivi@intel.com, ankit.k.nautiyal@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18.07.2023 12:10, Su Hui wrote:
> On 2023/7/18 13:39, Dan Carpenter wrote:
>> On Mon, Jul 17, 2023 at 04:52:51PM +0200, Andrzej Hajda wrote:
>>>
>>> On 17.07.2023 08:22, Su Hui wrote:
>>>> Clang warning: drivers/gpu/drm/i915/display/intel_tv.c:
>>>> line 991, column 22 Division by zero.
>>>> Assuming tv_mode->oversample=1 and (!tv_mode->progressive)=1,
>>>> then division by zero will happen.
>>>>
>>>> Fixes: 1bba5543e4fe ("drm/i915: Fix TV encoder clock computation")
>>>> Signed-off-by: Su Hui <suhui@nfschina.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/display/intel_tv.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_tv.c 
>>>> b/drivers/gpu/drm/i915/display/intel_tv.c
>>>> index 36b479b46b60..82b54af51f23 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_tv.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_tv.c
>>>> @@ -988,7 +988,8 @@ intel_tv_mode_to_mode(struct drm_display_mode 
>>>> *mode,
>>>>                  const struct tv_mode *tv_mode,
>>>>                  int clock)
>>>>    {
>>>> -    mode->clock = clock / (tv_mode->oversample >> 
>>>> !tv_mode->progressive);
>>>> +    mode->clock = clock / (tv_mode->oversample != 1 ?
>>>> +            tv_mode->oversample >> !tv_mode->progressive : 1);
>>> Seems too smart to me, why not just:
>>> mode->clock = clock / tv_mode->oversample;
>>> if (!tv_mode->progressive)
>>>      mode->clock <<= 1;
>> This is nice.
>
> mode->clock = clock / tv_mode->oversample << !tv_mode->progressive;
>
> But I think this one is much better,  it has less code and run faster.
> Should I resend v3 to add some explanation or follow Dan's advice?

Speed gain here is irrelevant here, and disputable.

One thing which could be problematic is that we could loose the least 
significant bit in mode->clock,
in case non-progressive, but I am not sure if it really matters, as 
mode->clock is not precise value anyway.
Alternatively we could 1st shift, then divide, but in this case overflow 
can occur, at least in theory - I suspect there are no such big clocks 
(in kHz).

Finally I would agree with Dan, readability is better with conditional.

Regards
Andrzej

>
> Su Hui
>
>> regards,
>> dan carpenter

