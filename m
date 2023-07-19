Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09EA758B33
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 04:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786F210E094;
	Wed, 19 Jul 2023 02:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id 0F32E10E094;
 Wed, 19 Jul 2023 02:12:51 +0000 (UTC)
Received: from [172.30.11.106] (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id CD47B60484988; 
 Wed, 19 Jul 2023 10:12:47 +0800 (CST)
Message-ID: <40db9ac5-84b7-dc98-786c-2e651404534b@nfschina.com>
Date: Wed, 19 Jul 2023 10:12:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/i915/tv: avoid possible division by zero
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <3c7dfc18-539f-2b0c-0c77-48b89ef96560@intel.com>
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
 linux-kernel@vger.kernel.org, nathan@kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>, mripard@kernel.org,
 rodrigo.vivi@intel.com, ankit.k.nautiyal@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/7/18 19:28, Andrzej Hajda wrote:
> On 18.07.2023 12:10, Su Hui wrote:
>> On 2023/7/18 13:39, Dan Carpenter wrote:
>>> On Mon, Jul 17, 2023 at 04:52:51PM +0200, Andrzej Hajda wrote:
>>>> On 17.07.2023 08:22, Su Hui wrote:
>>>>> Clang warning: drivers/gpu/drm/i915/display/intel_tv.c:
>>>>> line 991, column 22 Division by zero.
>>>>> Assuming tv_mode->oversample=1 and (!tv_mode->progressive)=1,
>>>>> then division by zero will happen.
>>>>>
>>>>> Fixes: 1bba5543e4fe ("drm/i915: Fix TV encoder clock computation")
>>>>> Signed-off-by: Su Hui <suhui@nfschina.com>
>>>>> ---
>>>>>    drivers/gpu/drm/i915/display/intel_tv.c | 3 ++-
>>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_tv.c 
>>>>> b/drivers/gpu/drm/i915/display/intel_tv.c
>>>>> index 36b479b46b60..82b54af51f23 100644
>>>>> --- a/drivers/gpu/drm/i915/display/intel_tv.c
>>>>> +++ b/drivers/gpu/drm/i915/display/intel_tv.c
>>>>> @@ -988,7 +988,8 @@ intel_tv_mode_to_mode(struct drm_display_mode 
>>>>> *mode,
>>>>>                  const struct tv_mode *tv_mode,
>>>>>                  int clock)
>>>>>    {
>>>>> -    mode->clock = clock / (tv_mode->oversample >> 
>>>>> !tv_mode->progressive);
>>>>> +    mode->clock = clock / (tv_mode->oversample != 1 ?
>>>>> +            tv_mode->oversample >> !tv_mode->progressive : 1);
>>>> Seems too smart to me, why not just:
>>>> mode->clock = clock / tv_mode->oversample;
>>>> if (!tv_mode->progressive)
>>>>      mode->clock <<= 1;
>>> This is nice.
>>
>> mode->clock = clock / tv_mode->oversample << !tv_mode->progressive;
>>
>> But I think this one is much better,  it has less code and run faster.
>> Should I resend v3 to add some explanation or follow Dan's advice?
>
> Speed gain here is irrelevant here, and disputable.
>
> One thing which could be problematic is that we could loose the least 
> significant bit in mode->clock,
> in case non-progressive, but I am not sure if it really matters, as 
> mode->clock is not precise value anyway.
> Alternatively we could 1st shift, then divide, but in this case 
> overflow can occur, at least in theory - I suspect there are no such 
> big clocks (in kHz).
>
> Finally I would agree with Dan, readability is better with conditional.
>
How about this one?

-       mode->clock = clock / (tv_mode->oversample >> !tv_mode->progressive);
+       mode->clock = clock;
+       if (tv_mode->oversample >> !tv_mode->progressive)
+               mode->clock /= tv_mode->oversample >> 1;

Prevent loss of accuracy and also make it more readable.
If it's OK, I will send v3 patch.

By the way, do we need to print some error messages or do some things  when
"tv_mode->oversample << !tv_mode->progressive" is zero? I'm not sure about
this.

Su Hui

> Regards
> Andrzej
