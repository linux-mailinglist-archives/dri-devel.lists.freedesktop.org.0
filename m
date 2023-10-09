Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76CE7BD4CB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 10:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D6910E21B;
	Mon,  9 Oct 2023 08:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD4210E21B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 08:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696838479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=raZ23kp/WXXY0B321ISegIvlbt+qBCJD3Dyq0vRWkK0=;
 b=YdljsfGlaz2b4Lx7q0W66Z3QcLQ+U/NA5DFHzH7fzQ1y6uE+aTFxcseo4U3PV7Dl3+zAGx
 mTpZDbmb4bzV57KXJevpBG3BXzUvikJ8ey6oXeAq8DV15uhVt4AT0PYGOLupk+BBMk0zhA
 cr+Pdgi+puB3/NunwZU6q1H8uX3zEKU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-qJUWojcDMtCtsntd041fAA-1; Mon, 09 Oct 2023 04:01:08 -0400
X-MC-Unique: qJUWojcDMtCtsntd041fAA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so30059415e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 01:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696838467; x=1697443267;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=raZ23kp/WXXY0B321ISegIvlbt+qBCJD3Dyq0vRWkK0=;
 b=wGm5DFyuQulsxw4E9S2tmFBTedMIhDh3VsJW9b//LD2jWvUowNokLQcIGf2YSM67xg
 lDCxtmZI6u5+UoN+S7Ncmk7VR6iT9KxcgQ7y/4hFr7Thrv7w0QmP64rDtrfyf20ikscF
 9YaOXWp8Vu404rm2Yi+b+IMqurQheHz51/Br9bi5E5Lao9RkBAq/Jx0+mtfUJ3p88eOI
 Mt3HjNGNyiSjroasKsotqRsicQLyx+EW66DxqAqytQ80h21osVZGjkeDgz2N43j5VSPw
 v98rUg6kdkRIGCMmj0S+8M6vRVAIFZsu+W8+rZIMohTGpX/6/Puh+Mu3EgPU9lZUUTkD
 usIg==
X-Gm-Message-State: AOJu0YxSE3py48yrGFdqKlmnaTQbbohCmVb1ReYW/7zzwWPMns+BGRpz
 JEt+moSMmtgWl0nEuuxqKAKCYh3uRwGXQayOisH1mfoABPRQvbkThlX7Z6pxTlAaXOxPUmRml4W
 uL+FlDek3nKCuBy3iIOBIuLp+m6Bh2CExs1WT
X-Received: by 2002:a5d:67c4:0:b0:31f:b120:143 with SMTP id
 n4-20020a5d67c4000000b0031fb1200143mr12761841wrw.59.1696838467409; 
 Mon, 09 Oct 2023 01:01:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSZRfsWPPvLrUkNoNefIwQMiZL7NCyFgvVYWgZJyuyGqwm8UxWBSQ7Hs8sINDai+veUwb9OA==
X-Received: by 2002:a5d:67c4:0:b0:31f:b120:143 with SMTP id
 n4-20020a5d67c4000000b0031fb1200143mr12761772wrw.59.1696838466219; 
 Mon, 09 Oct 2023 01:01:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 a12-20020adff7cc000000b0031423a8f4f7sm8843615wrq.56.2023.10.09.01.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 01:01:05 -0700 (PDT)
Message-ID: <52339812-ffae-0d76-e8ba-db6d1de7e832@redhat.com>
Date: Mon, 9 Oct 2023 10:01:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-3-jfalempe@redhat.com>
 <7eee2ca0-d2d4-4bfe-b253-fe6147aec173@tronnes.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <7eee2ca0-d2d4-4bfe-b253-fe6147aec173@tronnes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: gpiccoli@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/10/2023 14:38, Noralf Trønnes wrote:
> 
> 
> On 10/3/23 16:22, Jocelyn Falempe wrote:
>> This module displays a user friendly message when a kernel panic
>> occurs. It currently doesn't contain any debug information,
>> but that can be added later.
>>
>> v2
>>   * Use get_scanout_buffer() instead of the drm client API.
>>    (Thomas Zimmermann)
>>   * Add the panic reason to the panic message (Nerdopolis)
>>   * Add an exclamation mark (Nerdopolis)
>>
>> v3
>>   * Rework the drawing functions, to write the pixels line by line and
>>   to use the drm conversion helper to support other formats.
>>   (Thomas Zimmermann)
>>
>> v4
>>   * Use drm_fb_r1_to_32bit for fonts (Thomas Zimmermann)
>>   * Remove the default y to DRM_PANIC config option (Thomas Zimmermann)
>>   * Add foreground/background color config option
>>   * Fix the bottom lines not painted if the framebuffer height
>>     is not a multiple of the font height.
>>   * Automatically register the device to drm_panic, if the function
>>     get_scanout_buffer exists. (Thomas Zimmermann)
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/Kconfig     |  22 ++
>>   drivers/gpu/drm/Makefile    |   1 +
>>   drivers/gpu/drm/drm_drv.c   |   8 +
>>   drivers/gpu/drm/drm_panic.c | 413 ++++++++++++++++++++++++++++++++++++
>>   include/drm/drm_drv.h       |  14 ++
>>   include/drm/drm_panic.h     |  41 ++++
>>   6 files changed, 499 insertions(+)
>>   create mode 100644 drivers/gpu/drm/drm_panic.c
>>   create mode 100644 include/drm/drm_panic.h
>>
> 
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> new file mode 100644
> 
>> +static void draw_panic_device(struct drm_device *dev, const char *msg)
>> +{
>> +	struct drm_scanout_buffer sb;
>> +
>> +	if (dev->driver->get_scanout_buffer(dev, &sb))
>> +		return;
>> +	if (!drm_panic_line_buf)
>> +		return;
>> +
> 
> Unless something has changed since 2019 we need to make sure fbcon
> hasn't already printed the panic to avoid jumbled output. See [1] for
> more info.

I think DRM_PANIC and fbcon are incompatible, so in Kconfig I prevent 
them to be built together:

config DRM_PANIC
   bool "Display a user-friendly message when a kernel panic occurs"
   depends on DRM && !FRAMEBUFFER_CONSOLE

So DRM_PANIC should be used with a userspace console, either kmscon, or 
some lightweight terminal emulator/wayland compositor, like cage/foot.

As fbcon has lost scrolling support, it's time to switch to something 
better. [1]

-- 

Jocelyn

[1]
https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/

> 
> Noralf.
> 
> [1]
> https://lore.kernel.org/dri-devel/20190312095320.GX2665@phenom.ffwll.local/
> 
>> +	/* to avoid buffer overflow on drm_panic_line_buf */
>> +	if (sb.width > DRM_PANIC_MAX_WIDTH)
>> +		sb.width = DRM_PANIC_MAX_WIDTH;
>> +
>> +	draw_panic_static(&sb, msg);
>> +}
> 

