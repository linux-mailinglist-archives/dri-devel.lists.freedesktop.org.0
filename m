Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB77EBF5025
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 09:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6C010E57E;
	Tue, 21 Oct 2025 07:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jkz5cwDI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6C310E57E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:42:56 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b3f5a6e114dso94901866b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761032575; x=1761637375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GStPgF6qWg8eBpq7k/CjdOQ6h0CGmfUgYnZon0KO2vw=;
 b=Jkz5cwDIxV+dWMNvCwAvHQSKsIxzqsW/JDwfS7m1Lq6QaUCUFn0aNfV1A+h5i2IrJf
 fNEr8SVxzw4rZ+PRhNAlJ6UhDDY8BO7UQ7ABZCRfrrkmMO7ZDtOF9iAbke3zCYw1ry8I
 +dlkQp8ZkREWTwhD8DX/oaaHZIAlLfumNEhODe+gYje1JGpRcgk2AmOMm+T5YnyCCe3U
 9M5KhwlFFqNh0OJaXgyAp+Kyx1hj+YRmuYffrWTlekHPf2eOoL7KIiPrGZZSDgeM5CRD
 oRne0Crli0SG6s8IvqU1Jd1GbnHaWHhRNInDFnnmc61OMwBo4BxDadCTWuM3g9R/PWUq
 7faQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761032575; x=1761637375;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GStPgF6qWg8eBpq7k/CjdOQ6h0CGmfUgYnZon0KO2vw=;
 b=QD7B10JD2CbqW3E8BpYlqIzyeR1FH3wlgOGOo7H6+boY4HSBNWYd1u/91ZmmOEt9zn
 VRc0QPnIvNQslc9Lo8rxRi2De2jpsuOShprR3atTrwPBS1ZJ8lW/a64YnkYH9zrM14xz
 A+2CEHMRIShxBroZYpaeuEYkLEVDOvSOlnHYfFIOuzOSaXWA7kFDNvyTATN3DxTPdAdm
 U20gEe5BbjthL+Ks2t4CabyB5SuNUqP6uBPqe2fi30Wu5o4lqtA5lf+YgDEEeidGGTpy
 ZDDW6VVWIP9BtWpuxu1UtUypE1bXQxr9V36QOMXVm3YZ/RT6wokZlnSINQE4Z0o3ump0
 BZyg==
X-Gm-Message-State: AOJu0Ywywus0CXR5mYd+J8JQ1DjW+hyew24CofMhDUEKQnPn4G2A5KWl
 SGOSoQFAPu9thSXj6MhRPMaLDwqczkanU8p6K0dN6VNrjBiaMHqADnYd
X-Gm-Gg: ASbGncvoj2rGNBqWCzNE7gtvGkUNNINZV4t7L+FpsVTHdgl3YGjO5zjQbaT803RljcL
 0pGfe5lrxBYRhqVyilU2kKHVIfjbmXrERRMg4hz4+ZgC3UKtjvK33gULy4Y6C3Q+yWL6PRbZhgS
 FoGm4lBEp1d+7c/Lkflw8ZNH4pxUb/vh6ii7U9kklwdbs0rcNZ+2pileREApqWB2X/5fr2d800b
 LuhtDgNhg0p2gA/jdeXX0LXx/3JqwE5ntYy2221gnTfap4uYI+f13QAzlY0GvGdu6gGy/tD+Rot
 6AuJc8HItztIOuv5KiVPFV6aotFu+0nG1m8IUJZlTn5eE/8Ba9F9EhVwhqlv5JKK3xl5F2HxKEC
 PAL5kU5JZD0pJzYCEZ1StOR17NPdeIxGXbCwjpfsEC09MjhLJ3ulunmujXwu/y+6wNkT8lmU4ou
 89WDPe3sEv20B39hS/RT13IOsxqfF/
X-Google-Smtp-Source: AGHT+IGTAHitbAGYUoiDBb3JjyGZ6zbzSc2aytK1cYPhymZfc5cQ/shi+4Gz6sE1cziBWlkHoCqTpg==
X-Received: by 2002:a17:907:6ea3:b0:b65:c8b8:144f with SMTP id
 a640c23a62f3a-b6c793063bbmr164905566b.6.1761032574440; 
 Tue, 21 Oct 2025 00:42:54 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e7da25c9sm1018929566b.11.2025.10.21.00.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 00:42:54 -0700 (PDT)
Message-ID: <dfb3d547-9842-443b-80a2-94bf715bb46e@gmail.com>
Date: Tue, 21 Oct 2025 09:42:46 +0100
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
 <a37d83c7-dc2d-4e1d-a8d4-5628e0ac52a2@suse.de>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <a37d83c7-dc2d-4e1d-a8d4-5628e0ac52a2@suse.de>
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

On 10/21/25 7:57 AM, Thomas Zimmermann wrote:
> 
> 
> Am 21.10.25 um 08:51 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 20.10.25 um 13:57 schrieb Mehdi Ben Hadj Khelifa:
>>> Use drm_format_info_min_pitch() to calculate the framebuffer line pitch
>>> instead of directly multiplying width and height. This aligns with DRM
>>> helpers for determining per-line byte size and avoids manual assumptions
>>> about bytes per pixel.
>>>
>>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>> ---
>>>   drivers/gpu/drm/tiny/repaper.c | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/ 
>>> repaper.c
>>> index 4824f863fdba..aeff49bc6ba7 100644
>>> --- a/drivers/gpu/drm/tiny/repaper.c
>>> +++ b/drivers/gpu/drm/tiny/repaper.c
>>> @@ -517,6 +517,8 @@ static int repaper_fb_dirty(struct 
>>> drm_framebuffer *fb, const struct iosys_map *
>>>       unsigned int dst_pitch = 0;
>>>       struct iosys_map dst;
>>>       struct drm_rect clip;
>>> +    const struct drm_format_info *info = fb->format;
>>
>> This is the wrong format. You're allocating the output buffer here, 
>> but you're using the input format. IIUC the output format is 
>> DRM_FORMAT_R1. The input is _XRGB8888.
>>
>> Best regards
>> Thomas
>>
>>> +    size_t pitch;
>>>       int idx, ret = 0;
>>>       u8 *buf = NULL;
>>>   @@ -534,7 +536,9 @@ static int repaper_fb_dirty(struct 
>>> drm_framebuffer *fb, const struct iosys_map *
>>>       DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>>             epd->factored_stage_time);
>>>   -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>>> +    pitch = drm_format_info_min_pitch(info, 0, fb->width);
>>> +
>>> +    buf = kmalloc_array(fb->height, pitch, GFP_KERNEL);
> 
> And TBH I'm not sure if we should really convert this call. It's not an 
> array in the sense of that API.
> 
> Good candidates look like 'kmalloc(count * sizeof(<some type or 
> variable>))'
> 
I will leave kmalloc in v3. Do you want me to send deep testing 
information on this patch?
BR,
Mehdi>>>       if (!buf) {
>>>           ret = -ENOMEM;
>>>           goto out_exit;
>>
> 

