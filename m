Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612A19E173D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 10:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728A510E9A2;
	Tue,  3 Dec 2024 09:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JLx99sYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9E110E9A2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 09:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733217756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uuIioa/RetWfFDBs7Af7eXY+ivmFuGDXjAhfN3lId/8=;
 b=JLx99sYawOn5hLK+v3rhT/J9lAC6P7XGrDORvLRgnUSWBAt+D723w+OUJggNSMFQPQEvN2
 nJh+ZDQp8cNf4ypN5q32nnnNkOpSMowP59rlTxUPxVApVWbgPwWtZGZjF4QcDOVIofwHTq
 oeowDBLiiaF5E8EVPA34B2hQSuThoW0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-5xeqBkbhP5u1zYFU3mn7Gg-1; Tue, 03 Dec 2024 04:22:34 -0500
X-MC-Unique: 5xeqBkbhP5u1zYFU3mn7Gg-1
X-Mimecast-MFC-AGG-ID: 5xeqBkbhP5u1zYFU3mn7Gg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385ea3a3fe2so1480345f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 01:22:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733217753; x=1733822553;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uuIioa/RetWfFDBs7Af7eXY+ivmFuGDXjAhfN3lId/8=;
 b=WDsnVVHwJuj7lP+qFYG+6hd8lZ8xSKKSnE7E1GGn5UTlvBB1IUSwUt+4RpQIY/1j3D
 88tt0qmM5biQ8PwvFo4ye/B3j6/1F38dyOXyNtAKRoVEa3jIoB2N7sv5Of4kMdH9qTfS
 HAtpYEbMQ32fQxeGhIrZZHs2AF/nVXDP5m84yIXEEuTry1+sg4fLJbeJzXzhmfl1bEyG
 wQl2tIIO6sihDp1h1aNEDSNq93AzkbEyzQSruDfCgC00sn+VZtTkAWUB9RiLut5h/U2L
 jQ3I308xUUIJrPruInH/XD2nOFQWtyUkVuWAQlI6FFojMjOSp9lrZuLJL0QKYVAuNNmc
 MsTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgsgukTOk89491Kb9EYZEcypecwafRlSRtQcONrVxQexXG/F73E91HcaxUeV3sc2pCwtVQHNc2krU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGc/tGesYendnN8sjdEAT06eSB4Blis5uNo+wT+96e11XZjrBX
 a6uRYv3rCq2tQfr8os7EDS+LSz25tCX+jH3wi6PPOE4cPX+1Px2LOln5V8ds6vG44J5kbx2rcSb
 nvrsr8btImETWeHsAVAGL0xmywFlxXuHi71bDOfvG7b70w6JjJBsWxoRP5eZ0kepusQ==
X-Gm-Gg: ASbGncsuKiuSoO426S8+e3NxPA2xCGikieG8fRBwMKaKNEdSTlY2bYMfh2wUHOSGaGg
 erPzG0zzjFDQHsfqYsgohJuoxx3kPNk2KSLa4RWILuXyxx3Wh3FQHCG0hD9WQk9gsvkmKMTQc4r
 8BGjZJAt4ghxaNIynFeZsNbwX+qV+7QN5h/j9O+FM0rCHDhSLTguXEtUNEztefeTrAra0m+av8u
 KiI3EuUU5GLLQ+GQmn+iQHD8GJPcrvEEs85g00OdPdmD1WBlDE+9Z8ZZtguYwZjU5QRFUVOhiff
 1OoFZpggUWVWOg==
X-Received: by 2002:a5d:5f45:0:b0:385:e4a7:def9 with SMTP id
 ffacd0b85a97d-385fd532811mr1271305f8f.50.1733217753250; 
 Tue, 03 Dec 2024 01:22:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtJlcwK+6B6VQ1wv9XdHWlHPJ05od1R2iKoI+lPjWWtwUST2TLSXGqc430KU5Sl1J/TBCc3g==
X-Received: by 2002:a5d:5f45:0:b0:385:e4a7:def9 with SMTP id
 ffacd0b85a97d-385fd532811mr1271280f8f.50.1733217752647; 
 Tue, 03 Dec 2024 01:22:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385dea1e4ebsm12634938f8f.1.2024.12.03.01.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 01:22:32 -0800 (PST)
Message-ID: <26a483f9-ec17-43aa-9edf-8d9c877a0ee1@redhat.com>
Date: Tue, 3 Dec 2024 10:22:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241115142950.1758007-1-jfalempe@redhat.com>
 <20241115142950.1758007-3-jfalempe@redhat.com>
 <0d1bd1b6-40a2-4626-b641-fb1e60ae781b@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <0d1bd1b6-40a2-4626-b641-fb1e60ae781b@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ctr8Z5R-Zha-YWLP2AwN4M3_VSrwrwLLLfbW3CLC03w_1733217753
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/12/2024 09:48, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 15.11.24 um 14:40 schrieb Jocelyn Falempe:
>> drm_log is a simple logger that uses the drm_client API to print the
>> kmsg boot log on the screen. This is not a full replacement to fbcon,
>> as it will only print the kmsg. It will never handle user input, or a
>> terminal because this is better done in userspace.
>>
>> Design decisions:
>>   * It uses the drm_client API, so it should work on all drm drivers
>>     from the start.
>>   * It doesn't scroll the message, that way it doesn't need to redraw
>>     the whole screen for each new message.
>>     It also means it doesn't have to keep drawn messages in memory, to
>>     redraw them when scrolling.
>>   * It uses the new non-blocking console API, so it should work well
>>     with PREEMPT_RT.
>>
>> This patch also adds a Kconfig menu to select the drm client to use.
>> It can be overwritten on the kernel command line with:
>> drm_client_lib.default=log or drm_client_lib.default=fbdev
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Reviewed-by: John Ogness <john.ogness@linutronix.de> # console API
>> ---
>>
>> v2:
>>   * Use vmap_local() api, with that change, I've tested it 
>> successfully on simpledrm, virtio-gpu, amdgpu, and nouveau.
>>   * Stop drawing when the drm_master is taken. This avoid wasting CPU 
>> cycle if the buffer is not visible.
>>   * Use deferred probe. Only do the probe the first time there is a 
>> log to draw. With this, if you boot with quiet, drm_log won't do any 
>> modeset.
>>   * Add color support for the timestamp prefix, like what dmesg does.
>>   * Add build dependency on  disabling the fbdev emulation, as they 
>> are both drm_client, and there is no way to choose which one gets the 
>> focus.
>>
>> v3:
>>   * Remove the work thread and circular buffer, and use the new 
>> write_thread() console API.
>>   * Register a console for each drm driver.
>>
>> v4:
>>   * Can be built as a module, even if that's not really useful.
>>   * Rebased on top of "drm: Introduce DRM client library" series from 
>> Thomas Zimmermann.
>>   * Add a Kconfig menu to choose between drm client.
>> v5:
>>   * Build drm_log in drm_client_lib module, to avoid circular dependency.
>>
>> v8:
>>   * Rebased after drm client moved to drivers/gpu/drm/clients/
>>   * Rename DRM_LOG to DRM_CLIENT_LOG (Thomas Zimmermann)
>>   * Add an info message if no clients are initialized in 
>> drm_client_setup()
>>
>>   drivers/gpu/drm/clients/Kconfig               |  48 +++
>>   drivers/gpu/drm/clients/Makefile              |   1 +
>>   drivers/gpu/drm/clients/drm_client_internal.h |   6 +
>>   drivers/gpu/drm/clients/drm_client_setup.c    |  29 +-
>>   drivers/gpu/drm/clients/drm_log.c             | 370 ++++++++++++++++++
>>   5 files changed, 450 insertions(+), 4 deletions(-)
>>   create mode 100644 drivers/gpu/drm/clients/drm_log.c
>>
>> diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/ 
>> clients/Kconfig
>> index 01ad3b0001303..7cbdb1b881b45 100644
>> --- a/drivers/gpu/drm/clients/Kconfig
>> +++ b/drivers/gpu/drm/clients/Kconfig
>> @@ -13,6 +13,7 @@ config DRM_CLIENT_SELECTION
>>       tristate
>>       depends on DRM
>>       select DRM_CLIENT_LIB if DRM_FBDEV_EMULATION
>> +    select DRM_CLIENT_LIB if DRM_CLIENT_LOG
> 
> 'if <>' sorted alphabetically please.

Yes, sure.
> 
>>       help
>>         Drivers that support in-kernel DRM clients have to select this
>>         option.
>> @@ -70,4 +71,51 @@ config DRM_FBDEV_LEAK_PHYS_SMEM
>>         If in doubt, say "N" or spread the word to your closed source
>>         library vendor.
>> +config DRM_CLIENT_LOG
>> +    bool "Print the kernel boot message on the screen"
>> +    depends on DRM_CLIENT_SELECTION
>> +    select DRM_DRAW
>> +    select DRM_CLIENT
>> +    select DRM_CLIENT_SETUP
> 
> Select sorted alphabetically please.

Agreed too
> 
>> +    help
>> +      This enable a drm logger, that will print the kernel messages 
>> to the
>> +      screen until the userspace is ready to take over.
>> +
>> +      If you only need logs, but no terminal, or if you prefer userspace
>> +      terminal, say "Y".
>> +
>> +choice
>> +    prompt "Default DRM Client"
>> +    depends on DRM_CLIENT_SELECTION
>> +    default DRM_CLIENT_DEFAULT_FBDEV
>> +    help
>> +      Selects the default drm client.
>> +
>> +      The selection made here can be overridden by using the kernel
>> +      command line 'drm_client_lib.default=fbdev' option.
>> +
>> +config DRM_CLIENT_DEFAULT_FBDEV
>> +    bool "fbdev"
>> +    depends on DRM_FBDEV_EMULATION
>> +    help
>> +      Use fbdev emulation as default drm client. This is needed to have
>> +      fbcon on top of a drm driver.
>> +
>> +config DRM_CLIENT_DEFAULT_LOG
>> +    bool "log"
>> +    depends on DRM_CLIENT_LOG
>> +    help
>> +      Use drm log as default drm client. This will display boot logs 
>> on the
>> +      screen, but doesn't implement a full terminal. For that you 
>> will need
>> +      a userspace terminal using drm/kms.
>> +
>> +endchoice
>> +
>> +config DRM_CLIENT_DEFAULT
>> +       string
>> +       depends on DRM_CLIENT
>> +       default "fbdev" if DRM_CLIENT_DEFAULT_FBDEV
>> +       default "log" if DRM_CLIENT_DEFAULT_LOG
>> +       default ""
>> +
>>   endmenu
>> diff --git a/drivers/gpu/drm/clients/Makefile b/drivers/gpu/drm/ 
>> clients/Makefile
>> index 1d004ec92e1ea..9fb776590efe7 100644
>> --- a/drivers/gpu/drm/clients/Makefile
>> +++ b/drivers/gpu/drm/clients/Makefile
>> @@ -2,4 +2,5 @@
>>   drm_client_lib-y := drm_client_setup.o
>>   drm_client_lib-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_client.o
>> +drm_client_lib-$(CONFIG_DRM_CLIENT_LOG) += drm_log.o
>>   obj-$(CONFIG_DRM_CLIENT_LIB) += drm_client_lib.o
>> diff --git a/drivers/gpu/drm/clients/drm_client_internal.h b/drivers/ 
>> gpu/drm/clients/drm_client_internal.h
>> index 23258934956aa..6dc078bf6503b 100644
>> --- a/drivers/gpu/drm/clients/drm_client_internal.h
>> +++ b/drivers/gpu/drm/clients/drm_client_internal.h
>> @@ -16,4 +16,10 @@ static inline int drm_fbdev_client_setup(struct 
>> drm_device *dev,
>>   }
>>   #endif
>> +#ifdef CONFIG_DRM_CLIENT_LOG
>> +void drm_log_register(struct drm_device *dev);
>> +#else
>> +static inline void drm_log_register(struct drm_device *dev) {}
>> +#endif
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/clients/drm_client_setup.c b/drivers/gpu/ 
>> drm/clients/drm_client_setup.c
>> index 4b211a4812b5b..92a7b3c180d19 100644
>> --- a/drivers/gpu/drm/clients/drm_client_setup.c
>> +++ b/drivers/gpu/drm/clients/drm_client_setup.c
>> @@ -7,6 +7,12 @@
>>   #include "drm_client_internal.h"
>> +static char drm_client_default[16] = CONFIG_DRM_CLIENT_DEFAULT;
>> +module_param_string(client, drm_client_default, 
>> sizeof(drm_client_default), 0444);
>> +MODULE_PARM_DESC(client,
>> +         "Choose which drm client to start, default is"
>> +         CONFIG_DRM_CLIENT_DEFAULT "]");
> 
> CONFIG_DRM_CLIENT_DEFAULT is good for the config option. But using 
> 'drm_client_lib.client=log' seems imprecise to me. The module parameter 
> itself should maybe called something like 'setup' or 'active'.

Ok, I can rename it to drm_client_lib.active=log

> 
> (As a sidenote, if we ever have more clients, we could then modify the 
> parameter to be separated by comma. The user would then be able to 
> specify a set of clients from the ones available.)

I'm a bit confused about this.
The goal is to allow to build any number of drm clients in the kernel, 
but only one can run. There are no way to switch from one client to 
another at runtime. So what would be the purpose of specifying multiple 
clients?

> 
> 
>> +
>>   /**
>>    * drm_client_setup() - Setup in-kernel DRM clients
>>    * @dev: DRM device
>> @@ -25,11 +31,26 @@
>>    */
>>   void drm_client_setup(struct drm_device *dev, const struct 
>> drm_format_info *format)
>>   {
>> -    int ret;
>> -    ret = drm_fbdev_client_setup(dev, format);
>> -    if (ret)
>> -        drm_warn(dev, "Failed to set up DRM client; error %d\n", ret);
>> +#ifdef CONFIG_DRM_FBDEV_EMULATION
>> +    if (!strcmp(drm_client_default, "fbdev")) {
>> +        int ret;
>> +
>> +        ret = drm_fbdev_client_setup(dev, format);
>> +        if (ret)
>> +            drm_warn(dev, "Failed to set up DRM client; error %d\n", 
>> ret);
>> +        return;
>> +    }
>> +#endif
>> +
>> +#ifdef CONFIG_DRM_CLIENT_LOG
>> +    if (!strcmp(drm_client_default, "log")) {
>> +        drm_log_register(dev);
>> +        return;
>> +    }
>> +#endif
>> +
>> +    drm_info(dev, "No drm client registered\n");
> 
> Let's remain silent here. If anything, debug please.

If you get there, it's either a typo, or a misconfiguration, but yes I 
can move it as debug.

> 
>>   }
>>   EXPORT_SYMBOL(drm_client_setup);
>> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/ 
>> clients/drm_log.c
>> new file mode 100644
>> index 0000000000000..cb793a348f1f9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/clients/drm_log.c
>> @@ -0,0 +1,370 @@
>> +// SPDX-License-Identifier: GPL-2.0 or MIT
>> +/*
>> + * Copyright (c) 2024 Red Hat.
>> + * Author: Jocelyn Falempe <jfalempe@redhat.com>
>> + */
>> +
>> +#include <linux/console.h>
>> +#include <linux/font.h>
>> +#include <linux/init.h>
>> +#include <linux/iosys-map.h>
>> +#include <linux/module.h>
>> +#include <linux/types.h>
>> +
>> +#include <drm/drm_client.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_fourcc.h>
>> +#include <drm/drm_framebuffer.h>
>> +#include <drm/drm_print.h>
>> +
>> +#include "drm_client_internal.h"
>> +#include "../drm_draw.h"
>> +
>> +MODULE_AUTHOR("Jocelyn Falempe");
>> +MODULE_DESCRIPTION("DRM boot logger");
>> +MODULE_LICENSE("GPL");
>> +
>> +/**
>> + * DOC: overview
>> + *
>> + * This is a simple graphic logger, to print the kernel message on 
>> screen, until
>> + * a userspace application is able to take over.
>> + * It is only for debugging purpose.
>> + */
>> +
>> +struct drm_log_scanout {
>> +    struct drm_client_buffer *buffer;
>> +    const struct font_desc *font;
>> +    u32 rows;
>> +    u32 columns;
>> +    u32 line;
>> +    u32 format;
>> +    u32 px_width;
>> +    u32 front_color;
>> +};
>> +
>> +struct drm_log {
>> +    struct mutex lock;
>> +    struct drm_client_dev client;
>> +    struct console con;
>> +    bool probed;
>> +    u32 n_scanout;
>> +    struct drm_log_scanout *scanout;
>> +};
>> +
>> +static struct drm_log *client_to_drm_log(struct drm_client_dev *client)
>> +{
>> +    return container_of(client, struct drm_log, client);
>> +}
>> +
>> +static struct drm_log *console_to_drm_log(struct console *con)
>> +{
>> +    return container_of(con, struct drm_log, con);
>> +}
>> +
>> +static void drm_log_blit(struct iosys_map *dst, unsigned int dst_pitch,
>> +             const u8 *src, unsigned int src_pitch,
>> +             u32 height, u32 width, u32 scale, u32 px_width, u32 color)
>> +{
>> +    switch (px_width) {
>> +    case 2:
>> +        drm_draw_blit16(dst, dst_pitch, src, src_pitch, height, 
>> width, scale, color);
>> +        break;
>> +    case 3:
>> +        drm_draw_blit24(dst, dst_pitch, src, src_pitch, height, 
>> width, scale, color);
>> +        break;
>> +    case 4:
>> +        drm_draw_blit32(dst, dst_pitch, src, src_pitch, height, 
>> width, scale, color);
>> +        break;
>> +    default:
>> +        WARN_ONCE(1, "Can't blit with pixel width %d\n", px_width);
>> +    }
>> +}
>> +
>> +static void drm_log_clear_line(struct drm_log_scanout *scanout, u32 
>> line)
>> +{
>> +    struct drm_framebuffer *fb = scanout->buffer->fb;
>> +    unsigned long height = scanout->font->height;
>> +    struct iosys_map map;
>> +    struct drm_rect r = DRM_RECT_INIT(0, line * height, fb->width, 
>> height);
>> +
>> +    if (drm_client_buffer_vmap_local(scanout->buffer, &map))
>> +        return;
>> +    iosys_map_memset(&map, r.y1 * fb->pitches[0], 0, height * fb- 
>> >pitches[0]);
>> +    drm_client_buffer_vunmap_local(scanout->buffer);
>> +    drm_client_framebuffer_flush(scanout->buffer, &r);
>> +}
>> +
>> +static void drm_log_draw_line(struct drm_log_scanout *scanout, const 
>> char *s,
>> +                  unsigned int len)
>> +{
>> +    struct drm_framebuffer *fb = scanout->buffer->fb;
>> +    struct iosys_map map;
>> +    const struct font_desc *font = scanout->font;
>> +    size_t font_pitch = DIV_ROUND_UP(font->width, 8);
>> +    const u8 *src;
>> +    u32 px_width = fb->format->cpp[0];
>> +    struct drm_rect r = DRM_RECT_INIT(0, scanout->line * font->height,
>> +                      fb->width, (scanout->line + 1) * font->height);
>> +    u32 i;
>> +
>> +    if (drm_client_buffer_vmap_local(scanout->buffer, &map))
>> +        return;
>> +
>> +    iosys_map_incr(&map, r.y1 * fb->pitches[0]);
>> +    for (i = 0; i < len && i < scanout->columns; i++) {
>> +        src = drm_draw_get_char_bitmap(font, s[i], font_pitch);
>> +        drm_log_blit(&map, fb->pitches[0], src, font_pitch, font- 
>> >height, font->width,
>> +                 1, px_width, scanout->front_color);
>> +        iosys_map_incr(&map, font->width * px_width);
>> +    }
>> +
>> +    scanout->line++;
>> +    if (scanout->line >= scanout->rows)
>> +        scanout->line = 0;
>> +    drm_client_buffer_vunmap_local(scanout->buffer);
>> +    drm_client_framebuffer_flush(scanout->buffer, &r);
>> +}
>> +
>> +static void drm_log_draw_new_line(struct drm_log_scanout *scanout,
>> +                  const char *s, unsigned int len)
>> +{
>> +    if (scanout->line == 0) {
>> +        drm_log_clear_line(scanout, 0);
>> +        drm_log_clear_line(scanout, 1);
>> +        drm_log_clear_line(scanout, 2);
>> +    } else if (scanout->line + 2 < scanout->rows)
>> +        drm_log_clear_line(scanout, scanout->line + 2);
>> +
>> +    drm_log_draw_line(scanout, s, len);
>> +}
>> +
>> +static void drm_log_draw_kmsg_record(struct drm_log_scanout *scanout,
>> +                     const char *s, unsigned int len)
>> +{
>> +    /* do not print the ending \n character */
>> +    if (s[len - 1] == '\n')
>> +        len--;
>> +
>> +    while (len > scanout->columns) {
>> +        drm_log_draw_new_line(scanout, s, scanout->columns);
>> +        s += scanout->columns;
>> +        len -= scanout->columns;
>> +    }
>> +    if (len)
>> +        drm_log_draw_new_line(scanout, s, len);
>> +}
>> +
>> +static u32 drm_log_find_usable_format(struct drm_plane *plane)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < plane->format_count; i++)
>> +        if (drm_draw_color_from_xrgb8888(0xffffff, plane- 
>> >format_types[i]) != 0)
>> +            return plane->format_types[i];
>> +    return DRM_FORMAT_INVALID;
>> +}
>> +
>> +static int drm_log_setup_modeset(struct drm_client_dev *client,
>> +                 struct drm_mode_set *mode_set,
>> +                 struct drm_log_scanout *scanout)
>> +{
>> +    struct drm_crtc *crtc = mode_set->crtc;
>> +    u32 width = mode_set->mode->hdisplay;
>> +    u32 height = mode_set->mode->vdisplay;
>> +    u32 format;
>> +
>> +    scanout->font = get_default_font(width, height, NULL, NULL);
>> +    if (!scanout->font)
>> +        return -ENOENT;
>> +
>> +    format = drm_log_find_usable_format(crtc->primary);
>> +    if (format == DRM_FORMAT_INVALID)
>> +        return -EINVAL;
>> +
>> +    scanout->buffer = drm_client_framebuffer_create(client, width, 
>> height, format);
>> +    if (IS_ERR(scanout->buffer)) {
>> +        drm_warn(client->dev, "drm_log can't create framebuffer %d %d 
>> %p4cc\n",
>> +             width, height, &format);
>> +        return -ENOMEM;
>> +    }
>> +    mode_set->fb = scanout->buffer->fb;
>> +    scanout->rows = height / scanout->font->height;
>> +    scanout->columns = width / scanout->font->width;
>> +    scanout->front_color = drm_draw_color_from_xrgb8888(0xffffff, 
>> format);
>> +    return 0;
>> +}
>> +
>> +static int drm_log_count_modeset(struct drm_client_dev *client)
>> +{
>> +    struct drm_mode_set *mode_set;
>> +    int count = 0;
>> +
>> +    mutex_lock(&client->modeset_mutex);
>> +    drm_client_for_each_modeset(mode_set, client)
>> +        count++;
>> +    mutex_unlock(&client->modeset_mutex);
>> +    return count;
>> +}
>> +
>> +static void drm_log_init_client(struct drm_log *dlog)
>> +{
>> +    struct drm_client_dev *client = &dlog->client;
>> +    struct drm_mode_set *mode_set;
>> +    int i, max_modeset;
>> +    int n_modeset = 0;
>> +
>> +    dlog->probed = true;
>> +
>> +    if (drm_client_modeset_probe(client, 0, 0))
>> +        return;
>> +
>> +    max_modeset = drm_log_count_modeset(client);
>> +    if (!max_modeset)
>> +        return;
>> +
>> +    dlog->scanout = kcalloc(max_modeset, sizeof(*dlog->scanout), 
>> GFP_KERNEL);
>> +    if (!dlog->scanout)
>> +        return;
>> +
>> +    mutex_lock(&client->modeset_mutex);
>> +    drm_client_for_each_modeset(mode_set, client) {
>> +        if (!mode_set->mode)
>> +            continue;
>> +        if (drm_log_setup_modeset(client, mode_set, &dlog- 
>> >scanout[n_modeset]))
>> +            continue;
>> +        n_modeset++;
>> +    }
>> +    mutex_unlock(&client->modeset_mutex);
>> +    if (n_modeset == 0)
>> +        goto err_nomodeset;
>> +
>> +    if (drm_client_modeset_commit(client))
>> +        goto err_failed_commit;
>> +
>> +    dlog->n_scanout = n_modeset;
>> +    return;
>> +
>> +err_failed_commit:
>> +    for (i = 0; i < n_modeset; i++)
>> +        drm_client_framebuffer_delete(dlog->scanout[i].buffer);
>> +
>> +err_nomodeset:
>> +    kfree(dlog->scanout);
>> +    dlog->scanout = NULL;
>> +}
>> +
>> +static void drm_log_free_scanout(struct drm_client_dev *client)
>> +{
>> +    struct drm_log *dlog = client_to_drm_log(client);
>> +    int i;
>> +
>> +    if (dlog->n_scanout) {
>> +        for (i = 0; i < dlog->n_scanout; i++)
>> +            drm_client_framebuffer_delete(dlog->scanout[i].buffer);
>> +        dlog->n_scanout = 0;
>> +        kfree(dlog->scanout);
>> +        dlog->scanout = NULL;
>> +    }
>> +}
>> +
>> +static void drm_log_client_unregister(struct drm_client_dev *client)
>> +{
>> +    struct drm_log *dlog = client_to_drm_log(client);
>> +    struct drm_device *dev = client->dev;
>> +
>> +    unregister_console(&dlog->con);
>> +
>> +    mutex_lock(&dlog->lock);
>> +    drm_log_free_scanout(client);
>> +    drm_client_release(client);
>> +    mutex_unlock(&dlog->lock);
>> +    kfree(dlog);
>> +    drm_info(dev, "Unregistered with drm log\n");
> 
> We don't do such messages anywhere. So if anything, debug output here.

Agreed.
> 
>> +}
>> +
>> +static int drm_log_client_hotplug(struct drm_client_dev *client)
>> +{
>> +    struct drm_log *dlog = client_to_drm_log(client);
>> +
>> +    mutex_lock(&dlog->lock);
>> +    drm_log_free_scanout(client);
>> +    dlog->probed = false;
>> +    mutex_unlock(&dlog->lock);
>> +    return 0;
>> +}
>> +
>> +static const struct drm_client_funcs drm_log_client_funcs = {
>> +    .owner        = THIS_MODULE,
>> +    .unregister    = drm_log_client_unregister,
>> +    .hotplug    = drm_log_client_hotplug,
>> +};
>> +
>> +static void drm_log_write_thread(struct console *con, struct 
>> nbcon_write_context *wctxt)
>> +{
>> +    struct drm_log *dlog = console_to_drm_log(con);
>> +    int i;
>> +
>> +    if (!dlog->probed)
>> +        drm_log_init_client(dlog);
>> +
>> +    for (i = 0; i < dlog->n_scanout; i++)
>> +        drm_log_draw_kmsg_record(&dlog->scanout[i], wctxt->outbuf, 
>> wctxt->len);
>> +}
>> +
>> +static void drm_log_lock(struct console *con, unsigned long *flags)
>> +{
>> +    struct drm_log *dlog = console_to_drm_log(con);
>> +
>> +    mutex_lock(&dlog->lock);
>> +    migrate_disable();
>> +}
>> +
>> +static void drm_log_unlock(struct console *con, unsigned long flags)
>> +{
>> +    struct drm_log *dlog = console_to_drm_log(con);
>> +
>> +    migrate_enable();
>> +    mutex_unlock(&dlog->lock);
>> +}
>> +
>> +static void drm_log_register_console(struct console *con)
>> +{
>> +    strscpy(con->name, "drm_log");
>> +    con->write_thread = drm_log_write_thread;
>> +    con->device_lock = drm_log_lock;
>> +    con->device_unlock = drm_log_unlock;
>> +    con->flags = CON_PRINTBUFFER | CON_NBCON;
>> +    con->index = -1;
>> +
>> +    register_console(con);
>> +}
>> +
>> +/**
>> + * drm_log_register() - Register a drm device to drm_log
>> + * @dev: the drm device to register.
>> + */
>> +void drm_log_register(struct drm_device *dev)
>> +{
>> +    struct drm_log *new;
>> +
>> +    new = kzalloc(sizeof(*new), GFP_KERNEL);
>> +    if (!new)
>> +        goto err_warn;
>> +
>> +    mutex_init(&new->lock);
>> +    if (drm_client_init(dev, &new->client, "drm_log", 
>> &drm_log_client_funcs))
>> +        goto err_free;
>> +
>> +    drm_client_register(&new->client);
>> +
>> +    drm_log_register_console(&new->con);
>> +
>> +    drm_info(dev, "Registered with drm log as %s\n", new->con.name);
> 
> Debug please. Don't spam the kernel log with status messages.

Yes I will move that to debug, but it's still much less verbose than the 
current situation with fbdev/fbcon.

[    1.631473] fbcon: Deferring console take-over
[    1.631475] simple-framebuffer simple-framebuffer.0: [drm] fb0: 
simpledrmdrmfb frame buffer device
[    7.058770] fbcon: i915drmfb (fb0) is primary device
[    7.058772] fbcon: Deferring console take-over
[    7.058774] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device

> 
> Best regards
> Thomas
> 
>> +    return;
>> +
>> +err_free:
>> +    kfree(new);
>> +err_warn:
>> +    drm_warn(dev, "Failed to register with drm log\n");
>> +}
> 

