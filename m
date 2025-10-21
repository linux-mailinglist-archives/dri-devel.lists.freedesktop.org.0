Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411FCBF501C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 09:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F08510E57D;
	Tue, 21 Oct 2025 07:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gMTTTz+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A1F10E57D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:41:59 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b3c76f3703cso90742266b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 00:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761032518; x=1761637318; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qq2A1Kd0gSkqieCWoXvyag5Ixf7jlTaGJ4OOCGbMDnM=;
 b=gMTTTz+NlET0MXkZWfAIoBCIAJnoay91wiZDiI7VhB1vw9mP4W83Z8Vy2e6niiZxeX
 01R8UQPimS9uj+BJNj0sZ0/N3asz393tfD9LrPT6FMqoLJ7JhVgtlHAfuMDWhfZp03K8
 2J5NLtW7LBw9AOSuRRs8RZ9CZDKO6zePi7TuzIMU4Vv5WmxBWWAVMD+4C8duYZ8x7YQ2
 ExRcI2I0s8ORpraitRTb3MYnzn37GsGnerNEOr/rxNQUnD8Qe/99+qpsQmtwmqXgDtH9
 NyFvjuLpi3X86dmlAY3eMfteCnJe1JljoMP9BrSz5UcFHx8pVozAawi7m1peA7REtc2y
 XMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761032518; x=1761637318;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qq2A1Kd0gSkqieCWoXvyag5Ixf7jlTaGJ4OOCGbMDnM=;
 b=UdNmNJyPjMM2je7pU6EAlCYfZY7R2k4pYmsZZ+AO4fJPqNVqSzMkiBfSmJlBFSsS7a
 zcgc8n6bAu3hSVZkGz4KJyUoxTy5wdzUruz1U8+MFoCIfQGYAzZT7qU9BidUgaLIuE0c
 d40N0hToQJJbAJ9SVhx8ZHz63HAnEpG/nedBJCZRTHuO0B3kb3Pd8ZEQ3rPuEne2MJhG
 mnJfPLa9Va6m01eyzQX0jwiV8hHxdt4sULn7/nC0PnKt1ckKQ7H1dhJCwH2fitANKBYl
 YjUf1am4e+eEJtHC3Ti2Ppiki8ofoBCbPYwhPpNK4fMQvbuy1N/LG1UG/v5s+WlZ+pwV
 Te8g==
X-Gm-Message-State: AOJu0YyljX0bTJnHXd2EfDA8VX8Fa5mxHpG+1x4eNSFxbDfi6BQZaHZp
 2vBKP6NdOQZtSUTqsPRe6t755toFpqJ/KMRFK/U1usSaiZex9qKUYQiV
X-Gm-Gg: ASbGncspER9JhL3SjMRNDTJKuZ8utgOOxy2SdIGkWBQtxIrV7tzJwoaxFf4GDQVqYAr
 MizEwzvKWUo6VPLon2KAWp2KGbVWj8LCAtWyTUuc59mEa2m/x8i21QFVxD/38CRT9CdKXD05wcw
 VgQE2Fy4YArv8sfj1EawrhOB9AXJ6Y0S2gSgpWfJS/MCOWqnZPqUdL3n3pEX+xREH1aT36KZDvi
 jDNgq+DlyQyzuJGo/BjMKY74jIgzd7zYa+05Y/hujBuffBJdy0XEmpkjLLZckULLXKLxSYtwX96
 Ax4v/c2IF8mpFEnTn0IfnmG5wmALIw9hMCkgr+AXjj6G7dZc0/U/jPF/CGhhtyDBkfXaejMjgy8
 x1vZ2F6CO6Oa0cRk4z1vDuGYByZGNQI+jPZMxW4QiKakbqkhmlX2zX+Y9CTHIxUf8HG7A2Jr6+v
 rHwK1l2gYGbiIEBcgn1hs/v7mGtxc6
X-Google-Smtp-Source: AGHT+IGodTzNkYb0f/6+s9/q8PjxsWVWjCrsIvbWBLyQaGYptSG386KqvkxQNtg9R8tF9hr8VXvYZA==
X-Received: by 2002:a17:907:3cd5:b0:b3b:44a8:c64b with SMTP id
 a640c23a62f3a-b6c77583751mr151353866b.1.1761032517726; 
 Tue, 21 Oct 2025 00:41:57 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb52621csm1007794266b.59.2025.10.21.00.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 00:41:57 -0700 (PDT)
Message-ID: <6a917f07-18dd-4f8f-bfc5-b85d9051339d@gmail.com>
Date: Tue, 21 Oct 2025 09:41:49 +0100
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
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <1de3112b-6349-46d8-b90b-69d0849c7659@suse.de>
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

On 10/21/25 7:51 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 20.10.25 um 13:57 schrieb Mehdi Ben Hadj Khelifa:
>> Use drm_format_info_min_pitch() to calculate the framebuffer line pitch
>> instead of directly multiplying width and height. This aligns with DRM
>> helpers for determining per-line byte size and avoids manual assumptions
>> about bytes per pixel.
>>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>> ---
>>   drivers/gpu/drm/tiny/repaper.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/ 
>> repaper.c
>> index 4824f863fdba..aeff49bc6ba7 100644
>> --- a/drivers/gpu/drm/tiny/repaper.c
>> +++ b/drivers/gpu/drm/tiny/repaper.c
>> @@ -517,6 +517,8 @@ static int repaper_fb_dirty(struct drm_framebuffer 
>> *fb, const struct iosys_map *
>>       unsigned int dst_pitch = 0;
>>       struct iosys_map dst;
>>       struct drm_rect clip;
>> +    const struct drm_format_info *info = fb->format;
> 
> This is the wrong format. You're allocating the output buffer here, but 
> you're using the input format. IIUC the output format is DRM_FORMAT_R1. 
> The input is _XRGB8888.
> 
Ah. Thanks for clarification.I thought since it had the same output 
format. I will send a v3 shortly.> Best regards
> Thomas
> 
>> +    size_t pitch;
>>       int idx, ret = 0;
>>       u8 *buf = NULL;
>> @@ -534,7 +536,9 @@ static int repaper_fb_dirty(struct drm_framebuffer 
>> *fb, const struct iosys_map *
>>       DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>             epd->factored_stage_time);
>> -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>> +    pitch = drm_format_info_min_pitch(info, 0, fb->width);
>> +
>> +    buf = kmalloc_array(fb->height, pitch, GFP_KERNEL);
>>       if (!buf) {
>>           ret = -ENOMEM;
>>           goto out_exit;
> 

