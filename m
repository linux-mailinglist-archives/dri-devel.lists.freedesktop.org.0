Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FFC760700
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 06:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C11F10E17F;
	Tue, 25 Jul 2023 04:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id 27C9C10E17F;
 Tue, 25 Jul 2023 04:07:09 +0000 (UTC)
Received: from [172.30.11.106] (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 2F9D46031EAE1; 
 Tue, 25 Jul 2023 12:06:51 +0800 (CST)
Message-ID: <352f7c10-3592-4a18-abdc-ab554a992d10@nfschina.com>
Date: Tue, 25 Jul 2023 12:06:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/tv: avoid possible division by
 zero
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <ZL62X3/CnsJcWWU4@ashyti-mobl2.lan>
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
Cc: mripard@kernel.org, tvrtko.ursulin@linux.intel.com,
 kernel-janitors@vger.kernel.org, llvm@lists.linux.dev, andrzej.hajda@intel.com,
 trix@redhat.com, intel-gfx@lists.freedesktop.org, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, nathan@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/7/25 01:35, Andi Shyti wrote:
> On Tue, Jul 18, 2023 at 09:32:17AM +0800, Su Hui wrote:
>> Clang warning: drivers/gpu/drm/i915/display/intel_tv.c:
>> line 991, column 22 Division by zero.
>> Assuming tv_mode->oversample=1 and (!tv_mode->progressive)=1,
>> then division by zero will happen.
>>
>> Fixes: 1bba5543e4fe ("drm/i915: Fix TV encoder clock computation")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_tv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
>> index 36b479b46b60..f59553f7c132 100644
>> --- a/drivers/gpu/drm/i915/display/intel_tv.c
>> +++ b/drivers/gpu/drm/i915/display/intel_tv.c
>> @@ -988,7 +988,7 @@ intel_tv_mode_to_mode(struct drm_display_mode *mode,
>>   		      const struct tv_mode *tv_mode,
>>   		      int clock)
>>   {
>> -	mode->clock = clock / (tv_mode->oversample >> !tv_mode->progressive);
>> +	mode->clock = clock / tv_mode->oversample << !tv_mode->progressive;
> but this does not provide the same value. Try with:
>
> 	8 / (2 >> 1)
>
> and
>
> 	8 / 2 << 1
>
> They are definitely different.
>
> The real check could be:
>
> 	if (!(tv_mode->oversample >> 1))
> 		return ...
>
> But first I would check if that's actually possible.

Oh, I have a v3 patch, like this:

-       mode->clock = clock / (tv_mode->oversample >> 
!tv_mode->progressive);
+       mode->clock = clock;
+       if (tv_mode->oversample >> !tv_mode->progressive)
+               mode->clock /= tv_mode->oversample >> 1;

But I'm not sure does it need to print some error messages or do some 
things  when
"tv_mode->oversample << !tv_mode->progressive" is zero?
If all right , I will send this v3 patch.

Su Hui

> Andi
