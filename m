Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967D2BF5532
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBDE10E599;
	Tue, 21 Oct 2025 08:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lIRTEssO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFB110E599
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:44:22 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b3c82276592so102151266b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 01:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761036261; x=1761641061; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GYiwgwtNxK6/rIcMjyR2at6k/Vxbv6cWYDWAIm9NAlQ=;
 b=lIRTEssO9tLRZmPEVKMIOT0G/sG+mwqF7dMppnjcr9CWDDykVVb9fb7aKyOj1YTTfi
 iQF7KXRBJa9GHOfSkCYLOXgt69GVtgHzldkizaicUSaxS+toQuvLn49eoNSlRyQqrrZ3
 4PWoj8ah9gPFzvTEU4qi26hjAqR/48X1hZHmtcCb7I+TqtAC0vSlhva/J6oQYtZRKscB
 mbgR42HGeZHbFi3EbciojsWd5qfXkYcd8u4KtUVi53TRqozNJtTtHmSJjdOQ/c2iY4jz
 R/xMWpl2NQnPq6m2aRVsVPLxLEaH8d11Z8l8+tuRlYxKNQSSwnT7AKZmhuFc9JzD7rhJ
 9jdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761036261; x=1761641061;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GYiwgwtNxK6/rIcMjyR2at6k/Vxbv6cWYDWAIm9NAlQ=;
 b=KhFeQohZ1A/UHCgpp/3TYfOOJmhDNTlr7D0NHTdOxODYgTIs+MtLAPMFwYiGQZQtu0
 G5BcQE3lX3Rlavgb4xf3VezUniGpql1A91MUo7fyTigxkdZFh2XKLdJ2w28/PvvvXp7H
 iMeJWRCHWuxYBOS5JnG9G9dE0KH62GIMKH9oeiexOstBJI2hA+O3pDwR6lTwbJX0+rZ4
 Srgt0sYdqFokOB7oD0Fs85PGEmJKetSP/VpNMls4v1BWCV6q9gbEty6zzU57KZkh2ibR
 M9oMSQH0pPN40gSi2UATAD0/k/QbAA0HCs3YeCQ7QDoGEDO4Lc/moKBKRauepFkt0+YB
 Btig==
X-Gm-Message-State: AOJu0YxSs/wZnvJznAJIQr1OjsnYp2hMZBrnF1RNmZLpWlUaheBlDh4N
 qXIPsKmglXyXaURKVaAc0cVKkr/5gTcLoaPwZr4Wp97vy7LbdvxoEVmXiyNRRA==
X-Gm-Gg: ASbGncs4BnvKMPogsMx1c3Io2yMQoli6dIrGQOnPu0gFGDl+5SlMY3B7W88+hgbkXnP
 YD1mOG8XfugDpT17mIceQV8eiNuSYv/8v9/DTWrKglj5TrYq73eM4JSazhXUmxGxxOtdxvNHllq
 3WopJXQzswg/TH+egBfhfmHgqukgqKe3gawt/BWMWLFkPiwJpbwr6DH4eoTVJVSFU0Em7GxRJQr
 lO5MJkHW2QqsELnnxY1LwI0Wote9Pyz1Rt/C/7upWVZW8zVsBaNKCR/+WnPL0Cw54ASyrA+HLrN
 0M5IaDtzdz743wgTxRtflIl6cK/iM3waLUjJxjRSSYaAVnap/ZNauckrXLANzBqCtnZaTXXHJO1
 FSRmFS2Zn9g5HmmyPrBvNqs4Hj8bmZ/uNQ1ac3oQZ4+79qstpYZiAdKebUj+N5MJKhV8jw0cKu5
 /tw48QqnSaeSWl8ulYlT/vR3LvPJ3R
X-Google-Smtp-Source: AGHT+IHgFcbQCcTMOQ9kPtrRGAEFN37W9IGTKfgQiKIn3e3zPC+cubu+IIUXeREIVPhgLeQPlMhorw==
X-Received: by 2002:a17:907:9708:b0:b04:2d89:5d3a with SMTP id
 a640c23a62f3a-b6475505d94mr1071125466b.7.1761036261251; 
 Tue, 21 Oct 2025 01:44:21 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e7da2bbcsm1000822466b.5.2025.10.21.01.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 01:44:21 -0700 (PDT)
Message-ID: <d7e06f84-c555-4eb7-b781-b8444eedd625@gmail.com>
Date: Tue, 21 Oct 2025 10:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tiny: Refactor framebuffer's size calculation
To: Thomas Zimmermann <tzimmermann@suse.de>, lanzano.alex@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251020115803.192572-1-mehdi.benhadjkhelifa@gmail.com>
 <1de3112b-6349-46d8-b90b-69d0849c7659@suse.de>
 <6a917f07-18dd-4f8f-bfc5-b85d9051339d@gmail.com>
 <4b01c775-f87a-4c3c-88f1-f5c52261d9b2@suse.de>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <4b01c775-f87a-4c3c-88f1-f5c52261d9b2@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/21/25 9:32 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 21.10.25 um 10:41 schrieb Mehdi Ben Hadj Khelifa:
>> On 10/21/25 7:51 AM, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 20.10.25 um 13:57 schrieb Mehdi Ben Hadj Khelifa:
>>>> Use drm_format_info_min_pitch() to calculate the framebuffer line pitch
>>>> instead of directly multiplying width and height. This aligns with DRM
>>>> helpers for determining per-line byte size and avoids manual 
>>>> assumptions
>>>> about bytes per pixel.
>>>>
>>>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>>> ---
>>>>   drivers/gpu/drm/tiny/repaper.c | 6 +++++-
>>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/ 
>>>> repaper.c
>>>> index 4824f863fdba..aeff49bc6ba7 100644
>>>> --- a/drivers/gpu/drm/tiny/repaper.c
>>>> +++ b/drivers/gpu/drm/tiny/repaper.c
>>>> @@ -517,6 +517,8 @@ static int repaper_fb_dirty(struct 
>>>> drm_framebuffer *fb, const struct iosys_map *
>>>>       unsigned int dst_pitch = 0;
>>>>       struct iosys_map dst;
>>>>       struct drm_rect clip;
>>>> +    const struct drm_format_info *info = fb->format;
>>>
>>> This is the wrong format. You're allocating the output buffer here, 
>>> but you're using the input format. IIUC the output format is 
>>> DRM_FORMAT_R1. The input is _XRGB8888.
>>>
>> Ah. Thanks for clarification.I thought since it had the same output 
>> format. I will send a v3 shortly.> Best regards
> 
> Maybe just don't do it. This is just churn with no clear goal.
> 
Okay,I will abort working on it.Though my goal was to remove the manual 
assumption that height is multiple of 8 and to align with other 
'correct' API used in other drm drivers as you suggested[1].

[1]:https://lore.kernel.org/all/cb0f0a36-0593-4d4c-8450-d086b9c99d87@suse.de/

Best Regards,
Mehdi Ben Hadj Khelifa> Best regards
> Thomas
> 
>>> Thomas
>>>
>>>> +    size_t pitch;
>>>>       int idx, ret = 0;
>>>>       u8 *buf = NULL;
>>>> @@ -534,7 +536,9 @@ static int repaper_fb_dirty(struct 
>>>> drm_framebuffer *fb, const struct iosys_map *
>>>>       DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>>>             epd->factored_stage_time);
>>>> -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>>>> +    pitch = drm_format_info_min_pitch(info, 0, fb->width);
>>>> +
>>>> +    buf = kmalloc_array(fb->height, pitch, GFP_KERNEL);
>>>>       if (!buf) {
>>>>           ret = -ENOMEM;
>>>>           goto out_exit;
>>>
>>
> 

