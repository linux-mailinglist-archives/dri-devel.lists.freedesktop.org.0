Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D1C83168E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 11:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EB010E724;
	Thu, 18 Jan 2024 10:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2920D10E724
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 10:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705573037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ccve+7qKwfDQCzQYsobD6iw8gFTekXyAQDA13dvnjkQ=;
 b=Ag7u4BX3hHojnchUZj8Yvl+nzrSXUfijdO76wz2htysJk9PTNZGWYYLwRSuZW8C3QankzK
 jTxcvqaLiWZEhEL1yd+f2mcNVHIijS7BUBlmqEEx+N/BRXLUghQssW7L0DPg5zO4Fo8mto
 hzBKcMyYxoZ/nN7P+vjiXl+qInFO+S0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-eOvOUwW-N3W811Nfufn-ww-1; Thu, 18 Jan 2024 05:17:15 -0500
X-MC-Unique: eOvOUwW-N3W811Nfufn-ww-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40e5317c7a5so57282865e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 02:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705573034; x=1706177834;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ccve+7qKwfDQCzQYsobD6iw8gFTekXyAQDA13dvnjkQ=;
 b=dOoHLpGMHfF6T78p8KfSwcFVCCBSx6aoXi82hv+D/mCUbNNb6pMuTIRhhFkWlp5swG
 lg/Jm3hPcCf0KkKCtAZC9a7JwEsiaFiYibMrG10+WPxzTFDWz0pWkSdV/hGu/MW72Wam
 iR3Crd/67t+M2A7cQeOtaslz2ADNNeF9iT6kR47pt+efPIm4uIBuzDb2tYKJccZQUukW
 x2rjEgxbQ82ZbczwVwcz++QgUIZtXLjX3lLtdiIorehD3zwXBxE0m2Nwjzyhvsa541mg
 BPTDopf4fRTt3o1glsDya+xOpRU8Ne0+A/8IfWpXce3Chk7I6S81GucfHtVF2Lzj77Ln
 SBFg==
X-Gm-Message-State: AOJu0YyBqFjF/XdxPWeHLRmUXALrPv9QnoDz02xOofFIHIWdwD0QQE+O
 Ux29icuC4G3CDeiF4/VPfzhcrJcC6Ozh+u8TPRQEWPGJ6xL0xOVAHxXdUoKeZzOOxLupTnu3c3J
 SXud5Ymba9Qijm4GqSKoidBye4ugWJeoO+Esr6B6ZdlYigzR4ViBMpxthWcdAee1uupeOVrMyTa
 nO
X-Received: by 2002:a1c:7c16:0:b0:40d:8380:8648 with SMTP id
 x22-20020a1c7c16000000b0040d83808648mr397315wmc.66.1705573034145; 
 Thu, 18 Jan 2024 02:17:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2dnCi76Gquj3zRomfhH5AoRio9cjzzYxIBPhVpee0OB3VPFBAla+653NGc6AXNYVUMhgUFA==
X-Received: by 2002:a1c:7c16:0:b0:40d:8380:8648 with SMTP id
 x22-20020a1c7c16000000b0040d83808648mr397309wmc.66.1705573033815; 
 Thu, 18 Jan 2024 02:17:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b0040e541ddcb1sm25421392wms.33.2024.01.18.02.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 02:17:13 -0800 (PST)
Message-ID: <76d7c04c-dad1-4073-bd20-cb1c85b0563c@redhat.com>
Date: Thu, 18 Jan 2024 11:17:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] drm/panic: Add a drm panic handler
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-3-jfalempe@redhat.com>
 <ebe50f10-03cc-44ad-8ec7-226c5ff96256@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ebe50f10-03cc-44ad-8ec7-226c5ff96256@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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



On 17/01/2024 16:49, Thomas Zimmermann wrote:
> Hi
> 
> Am 04.01.24 um 17:00 schrieb Jocelyn Falempe:
> [...]
>> +    /**
>> +     * @get_scanout_buffer:
>> +     *
>> +     * Get the current scanout buffer, to display a panic message 
>> with drm_panic.
>> +     * The driver should do the minimum changes to provide a linear 
>> buffer, that
>> +     * can be used to display the panic screen.
>> +     * It is called from a panic callback, and must follow its 
>> restrictions.
>> +     * (no locks, no memory allocation, no sleep, no 
>> thread/workqueue, ...)
>> +     * It's a best effort mode, so it's expected that in some complex 
>> cases the
>> +     * panic screen won't be displayed.
>> +     * Some hardware cannot provide a linear buffer, so there is a 
>> draw_pixel_xy()
>> +     * callback in the struct drm_scanout_buffer that can be used in 
>> this case.
>> +     *
>> +     * Returns:
>> +     *
>> +     * Zero on success, negative errno on failure.
>> +     */
>> +    int (*get_scanout_buffer)(struct drm_device *dev,
>> +                  struct drm_scanout_buffer *sb);
>> +
> 
> After reading through Sima's comments on (try-)locking, I'd like to 
> propose a different interface: instead of having the panic handler 
> search for the scanout buffer, let each driver explicitly set the 
> scanout buffer after each page flip. The algorithm for mode programming 
> then looks like this:
> 
>   1) Maybe clear the panic handler's buffer at the beginning of 
> atomic_commit_tail, if necessary
>   2) Do the mode setting as usual
>   3) In the driver's atomic_flush or atomic_update, call something like
> 
>      void drm_panic_set_scanout_buffer(dev, scanout_buffer)
> 
> to set the panic handler's new output.
> 
> This avoids all the locking and the second guessing about the pipeline 
> status.
> 
> I don't see an easy way of reliably showing a panic screen during a 
> modeset. But during a modeset, the old scanout buffer should 
> (theoretically) not disappear until the new scanout buffer is in place. 
> So if the panic happens, it would blit to the old address at worst. 
> Well, that assumption needs to be verified per driver.

That's an interesting approach, and I will give it a try.
I think you still need a callback in the driver, to actually send the 
data to the GPU.

Also one thing that I don't handle yet, is when there are multiple 
outputs, so we may want to set and update multiple scanout buffers ?

Best regards,

-- 

Jocelyn


> 
> Best regards
> Thomas
> 
> 
>>       /** @major: driver major number */
>>       int major;
>>       /** @minor: driver minor number */
>> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
>> new file mode 100644
>> index 000000000000..bcf392b6fa1b
>> --- /dev/null
>> +++ b/include/drm/drm_panic.h
>> @@ -0,0 +1,97 @@
>> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
>> +#ifndef __DRM_PANIC_H__
>> +#define __DRM_PANIC_H__
>> +
>> +/*
>> + * Copyright (c) 2023 Red Hat.
>> + * Author: Jocelyn Falempe <jfalempe@redhat.com>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/types.h>
>> +#include <linux/iosys-map.h>
>> +
>> +struct drm_device;
>> +
>> +/**
>> + * struct drm_scanout_buffer - DRM scanout buffer
>> + *
>> + * This structure holds the information necessary for drm_panic to 
>> draw the
>> + * panic screen, and display it.
>> + * If the driver can't provide a linear buffer, it must clear @map with
>> + * iosys_map_clear() and provide a draw_pixel_xy() function.
>> + */
>> +struct drm_scanout_buffer {
>> +    /**
>> +     * @format:
>> +     *
>> +     * drm format of the scanout buffer.
>> +     */
>> +    const struct drm_format_info *format;
>> +    /**
>> +     * @map:
>> +     *
>> +     * Virtual address of the scanout buffer, either in memory or iomem.
>> +     * The scanout buffer should be in linear format, and can be 
>> directly
>> +     * sent to the display hardware. Tearing is not an issue for the 
>> panic
>> +     * screen.
>> +     */
>> +    struct iosys_map map;
>> +    /**
>> +     * @width: Width of the scanout buffer, in pixels.
>> +     */
>> +    unsigned int width;
>> +    /**
>> +     * @height: Height of the scanout buffer, in pixels.
>> +     */
>> +    unsigned int height;
>> +    /**
>> +     * @pitch: Length in bytes between the start of two consecutive 
>> lines.
>> +     */
>> +    unsigned int pitch;
>> +    /**
>> +     * @private:
>> +     *
>> +     * In case the driver can't provide a linear buffer, this is a 
>> pointer to
>> +     * some private data, that will be passed when calling 
>> @draw_pixel_xy()
>> +     * and @flush()
>> +     */
>> +    void *private;
>> +    /**
>> +     * @draw_pixel_xy:
>> +     *
>> +     * In case the driver can't provide a linear buffer, this is a 
>> function
>> +     * that drm_panic will call for each pixel to draw.
>> +     * Color will be converted to the format specified by @format.
>> +     */
>> +    void (*draw_pixel_xy)(unsigned int x, unsigned int y, u32 color, 
>> void *private);
>> +    /**
>> +     * @flush:
>> +     *
>> +     * This function is called after the panic screen is drawn, 
>> either using
>> +     * the iosys_map or the draw_pixel_xy path. In this function, the 
>> driver
>> +     * can send additional commands to the hardware, to make the buffer
>> +     * visible.
>> +     */
>> +    void (*flush)(void *private);
>> +};
>> +
>> +#ifdef CONFIG_DRM_PANIC
>> +
>> +void drm_panic_init(void);
>> +void drm_panic_exit(void);
>> +
>> +void drm_panic_register(struct drm_device *dev);
>> +void drm_panic_unregister(struct drm_device *dev);
>> +
>> +#else
>> +
>> +static inline void drm_panic_init(void) {}
>> +static inline void drm_panic_exit(void) {}
>> +
>> +static inline void drm_panic_register(struct drm_device *dev) {}
>> +static inline void drm_panic_unregister(struct drm_device *dev) {}
>> +
>> +#endif
>> +
>> +#endif /* __DRM_PANIC_H__ */
> 

