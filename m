Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410D9B2170C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 23:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A814010E0B7;
	Mon, 11 Aug 2025 21:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cimdigUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6689210E0B7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 21:09:04 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so41455575e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 14:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754946543; x=1755551343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9nd6uUzXaSR6qkFSyGw/hvNkLx6tLkM/B6UqTDLBsI0=;
 b=cimdigUDlA6VdbXIzKicJJkeTU4SRoG4zlfPz/650JuqPdRKFWrtrw5kLx/aMo7X/d
 bskGKK5G/YYSt+zX1xg2dn5UxiDpETvmkUK37KdukSTPTFxSUpjBa/7qKVFsg95dij87
 N2hHzCl/jUupJ3WKAi5eNVCwZHxCW09+9uE8grsbEhZZnmI5bz4DGFksnbdtp1O+nLvm
 Dqx0TBzV9rPoMf2BYUT2qorTgugDY0Rgi5E93u5GPXlCedaP8jvwAcLdp4jbtDAjbZsh
 VOTdeTAxmQJetd+d/axJiVD7UgcGfRjIZ8n4Wo8TNe2Rs879bFzBXw1Rf746mH4btDiE
 L1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754946543; x=1755551343;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9nd6uUzXaSR6qkFSyGw/hvNkLx6tLkM/B6UqTDLBsI0=;
 b=m4e6MjnTIH2RIQBE8ifjj1ZI+fdVa9/YAWwwBhCUu7lb5g5s0K75PW+NTE3XCZ370l
 UzVw44HZWnv5BdCZbooQBGGI4XHvJh5SkKhBrRbdtifKzxLSVwb9OzvRZOBmcwms3BXV
 cET5m4Qx6OzznYPHRKMZg+BA+Mae20mKYWLy5/5I/vWNHfrnbhcEtOkjJLD883BXv8jN
 /WE4Laev3oqyCEzDwcL7u34NneSGEOl9oUFA16nwAYIlZTkw640lXDP84NuHWegJHXCt
 oPErqQ9Vo6tAf0Jj3+vFdj0Hs94ThoKvO97kK/tc72d+OVaAC3PIhBQSqL2mil308tpR
 PX4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVldPRiGKQEJS1YVqeo3OI7K3FKA1OrS+yX4IvpkOpJzCtNS5HfnjZRIGjHjxiUZP5FUsOiIxZJCFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFBYa7Y+HX/bY9QWMpwn7PSiLGMrVLk/d7NyxcHtKfLw58Zhyu
 L+Djs2gPxW5v2qHNVUudoRY5RHOe5nYm7E+NSu3JmKv2HmmLzy6+uO77
X-Gm-Gg: ASbGncu5CJIR7Oq3crzSeWx3l/3Fx6kTpGXdR+Ry6mCqEwZOmKOM/rZLKtN8vyBhV1p
 EHTAfKf1sXmIORwsFgLeby5gDm8MmNafxMc/dJjFQScSvWpkQbA9c1yl6DhnSNFhE3SkxGKhKOc
 y34Mh+PYtI2VlwMscojBYsVWVK0dKY9D7Iz6kd/MzMR3XUfoHd04/wYlmt7mgY6Q/kRXwmAk9fT
 Yk5XTr5yjpJvrQ95NAQk5ObWe9yYOt8xZySTOWT1HT5mxhrLaf2p83CCw+huybt+7us67TZkjc9
 slkRSik9V/TAf0d4DtW0I4RDn7jcFDYHQY6u7V4tTh6iiG+GXuOpwb3yVdI/an2NbzH5UX1jtBP
 vKMzfKcBlLXxeDdpQA8LeGLEDrkZ6WjGxTo54Fy5pXmQ=
X-Google-Smtp-Source: AGHT+IErQtpmXh1g8vSy5qbvpdmc6lj7oC4wS4Sz70CDtHckb2+a4JBWdmZXp8VmbH4r/uUE6PKmGw==
X-Received: by 2002:a05:600c:a03:b0:458:bc2c:b2ed with SMTP id
 5b1f17b1804b1-459f4e9e7dfmr125883185e9.7.1754946542542; 
 Mon, 11 Aug 2025 14:09:02 -0700 (PDT)
Received: from [192.168.1.3] ([41.40.216.213])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8f8b1bc81sm19679242f8f.69.2025.08.11.14.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 14:09:02 -0700 (PDT)
Message-ID: <1df2b47e-74d1-4232-957a-21d7a6f5da1d@gmail.com>
Date: Tue, 12 Aug 2025 00:08:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm: atmel-hlcdc: replace dev_* print funtions with
 drm_* variants
To: Manikandan.M@microchip.com
Cc: skhan@linuxfoundation.com, Dharma.B@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250807190857.92431-1-eslam.medhat1993@gmail.com>
 <d26192c9-bba0-4fb8-aff8-fc4164a89a73@microchip.com>
Content-Language: en-US
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
In-Reply-To: <d26192c9-bba0-4fb8-aff8-fc4164a89a73@microchip.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/11/25 11:54, Manikandan.M@microchip.com wrote:
> Hi Eslam Khafagy,
Hi Manikandan,
>
> The patch appears to have been sent with spaces in place of
> tabs in the diff, which breaks kernel coding style [1] and makes it fail
> to apply.
> Please ensure your editor is configured to use tabs for indentation and
> use `git send-email` or b4 directly, not via an email client that may
> alter whitespace.

Thank you for the feedback.

But i have rechecked the patch. I don't seem to have altered any tabs 
with spaces.

>
> Could you please run checkpatch.sh and fix any reported errors or
> warnings before submitting the patch?

checkpatch.sh only reports two warnings:

WARNING: 'funtions' may be misspelled - perhaps 'functions'?
#78:
Subject: [PATCH v3] drm: atmel-hlcdc: replace dev_* print funtions with drm_* variants
                                                           ^^^^^^^^

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#95:
https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter

but no errors regarding tabs or spaces.
I'll fix the first one in v4. can you confirm indeed i have not altered tabs with spaces first?

>
> [1] Documentation/process/coding-style.rst
>
> On 08/08/25 12:33 am, Eslam Khafagy wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Update the Atmel HLCDC code to use DRM print macros drm_*() instead of
>> dev_warn() and dev_err(). This change ensures consistency with DRM
>> subsystem logging conventions [1].
>>
>> [1]
>> https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter
>>
>> Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
>> ---
>> v3:
>> * include header file to fix compilation. Thanks Manikandan.
>>
>> v2:
>> * replace dev_dbg with drm_dbg  in atmel_hlcdc_plane.c
>> * https://lore.kernel.org/all/20250806183049.52112-2-eslam.medhat1993@gmail.com/
>>
>> v1:
>> * replace dev_* print funtions with drm_* variants
>> *https://lore.kernel.org/all/20250806000141.239753-2-eslam.medhat1993@gmail.com/
>>
>>    .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 21 ++++++++++---------
>>    drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 14 ++++++-------
>>    .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |  3 ++-
>>    .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  6 +++---
>>    4 files changed, 23 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> index 0f7ffb3ced20..e0efc7309b1b 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> @@ -20,6 +20,7 @@
>>    #include <drm/drm_atomic_helper.h>
>>    #include <drm/drm_crtc.h>
>>    #include <drm/drm_modeset_helper_vtables.h>
>> +#include <drm/drm_print.h>
>>    #include <drm/drm_probe_helper.h>
>>    #include <drm/drm_vblank.h>
>>
>> @@ -215,32 +216,32 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
>>                   if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                                !(status & ATMEL_XLCDC_CM),
>>                                                10, 1000))
>> -                       dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
>> +                       drm_warn(dev, "Atmel LCDC status register CMSTS timeout\n");
>>
>>                   regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_XLCDC_SD);
>>                   if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                                status & ATMEL_XLCDC_SD,
>>                                                10, 1000))
>> -                       dev_warn(dev->dev, "Atmel LCDC status register SDSTS timeout\n");
>> +                       drm_warn(dev, "Atmel LCDC status register SDSTS timeout\n");
>>           }
>>
>>           regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_DISP);
>>           if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                        !(status & ATMEL_HLCDC_DISP),
>>                                       10, 1000))
>> -               dev_warn(dev->dev, "Atmel LCDC status register DISPSTS timeout\n");
>> +               drm_warn(dev, "Atmel LCDC status register DISPSTS timeout\n");
>>
>>           regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_SYNC);
>>           if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                        !(status & ATMEL_HLCDC_SYNC),
>>                                       10, 1000))
>> -               dev_warn(dev->dev, "Atmel LCDC status register LCDSTS timeout\n");
>> +               drm_warn(dev, "Atmel LCDC status register LCDSTS timeout\n");
>>
>>           regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_PIXEL_CLK);
>>           if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                        !(status & ATMEL_HLCDC_PIXEL_CLK),
>>                                       10, 1000))
>> -               dev_warn(dev->dev, "Atmel LCDC status register CLKSTS timeout\n");
>> +               drm_warn(dev, "Atmel LCDC status register CLKSTS timeout\n");
>>
>>           clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
>>           pinctrl_pm_select_sleep_state(dev->dev);
>> @@ -269,32 +270,32 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
>>           if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                        status & ATMEL_HLCDC_PIXEL_CLK,
>>                                        10, 1000))
>> -               dev_warn(dev->dev, "Atmel LCDC status register CLKSTS timeout\n");
>> +               drm_warn(dev, "Atmel LCDC status register CLKSTS timeout\n");
>>
>>           regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_SYNC);
>>           if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                        status & ATMEL_HLCDC_SYNC,
>>                                        10, 1000))
>> -               dev_warn(dev->dev, "Atmel LCDC status register LCDSTS timeout\n");
>> +               drm_warn(dev, "Atmel LCDC status register LCDSTS timeout\n");
>>
>>           regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_DISP);
>>           if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                        status & ATMEL_HLCDC_DISP,
>>                                        10, 1000))
>> -               dev_warn(dev->dev, "Atmel LCDC status register DISPSTS timeout\n");
>> +               drm_warn(dev, "Atmel LCDC status register DISPSTS timeout\n");
>>
>>           if (crtc->dc->desc->is_xlcdc) {
>>                   regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_CM);
>>                   if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                                status & ATMEL_XLCDC_CM,
>>                                                10, 1000))
>> -                       dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
>> +                       drm_warn(dev, "Atmel LCDC status register CMSTS timeout\n");
>>
>>                   regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_SD);
>>                   if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                                !(status & ATMEL_XLCDC_SD),
>>                                                10, 1000))
>> -                       dev_warn(dev->dev, "Atmel LCDC status register SDSTS timeout\n");
>> +                       drm_warn(dev, "Atmel LCDC status register SDSTS timeout\n");
>>           }
>>
>>           pm_runtime_put_sync(dev->dev);
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> index fa8ad94e431a..acb017a2486b 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> @@ -724,19 +724,19 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
>>
>>           ret = atmel_hlcdc_create_outputs(dev);
>>           if (ret) {
>> -               dev_err(dev->dev, "failed to create HLCDC outputs: %d\n", ret);
>> +               drm_err(dev, "failed to create HLCDC outputs: %d\n", ret);
>>                   return ret;
>>           }
>>
>>           ret = atmel_hlcdc_create_planes(dev);
>>           if (ret) {
>> -               dev_err(dev->dev, "failed to create planes: %d\n", ret);
>> +               drm_err(dev, "failed to create planes: %d\n", ret);
>>                   return ret;
>>           }
>>
>>           ret = atmel_hlcdc_crtc_create(dev);
>>           if (ret) {
>> -               dev_err(dev->dev, "failed to create crtc\n");
>> +               drm_err(dev, "failed to create crtc\n");
>>                   return ret;
>>           }
>>
>> @@ -778,7 +778,7 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>>
>>           ret = clk_prepare_enable(dc->hlcdc->periph_clk);
>>           if (ret) {
>> -               dev_err(dev->dev, "failed to enable periph_clk\n");
>> +               drm_err(dev, "failed to enable periph_clk\n");
>>                   return ret;
>>           }
>>
>> @@ -786,13 +786,13 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>>
>>           ret = drm_vblank_init(dev, 1);
>>           if (ret < 0) {
>> -               dev_err(dev->dev, "failed to initialize vblank\n");
>> +               drm_err(dev, "failed to initialize vblank\n");
>>                   goto err_periph_clk_disable;
>>           }
>>
>>           ret = atmel_hlcdc_dc_modeset_init(dev);
>>           if (ret < 0) {
>> -               dev_err(dev->dev, "failed to initialize mode setting\n");
>> +               drm_err(dev, "failed to initialize mode setting\n");
>>                   goto err_periph_clk_disable;
>>           }
>>
>> @@ -802,7 +802,7 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>>           ret = atmel_hlcdc_dc_irq_install(dev, dc->hlcdc->irq);
>>           pm_runtime_put_sync(dev->dev);
>>           if (ret < 0) {
>> -               dev_err(dev->dev, "failed to install IRQ handler\n");
>> +               drm_err(dev, "failed to install IRQ handler\n");
>>                   goto err_periph_clk_disable;
>>           }
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>> index 50fee6a93964..0b8a86afb096 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>> @@ -15,6 +15,7 @@
>>    #include <drm/drm_bridge.h>
>>    #include <drm/drm_encoder.h>
>>    #include <drm/drm_of.h>
>> +#include <drm/drm_print.h>
>>    #include <drm/drm_simple_kms_helper.h>
>>
>>    #include "atmel_hlcdc_dc.h"
>> @@ -92,7 +93,7 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
>>           output->bus_fmt = atmel_hlcdc_of_bus_fmt(ep);
>>           of_node_put(ep);
>>           if (output->bus_fmt < 0) {
>> -               dev_err(dev->dev, "endpoint %d: invalid bus width\n", endpoint);
>> +               drm_err(dev, "endpoint %d: invalid bus width\n", endpoint);
>>                   return -EINVAL;
>>           }
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
>> index 4a7ba0918eca..817284509b57 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
>> @@ -1034,7 +1034,7 @@ static void atmel_hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
>>           if (isr &
>>               (ATMEL_HLCDC_LAYER_OVR_IRQ(0) | ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
>>                ATMEL_HLCDC_LAYER_OVR_IRQ(2)))
>> -               dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
>> +               drm_dbg(plane->base.dev, "overrun on plane %s\n",
>>                           desc->name);
>>    }
>>
>> @@ -1051,7 +1051,7 @@ static void atmel_xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
>>           if (isr &
>>               (ATMEL_XLCDC_LAYER_OVR_IRQ(0) | ATMEL_XLCDC_LAYER_OVR_IRQ(1) |
>>                ATMEL_XLCDC_LAYER_OVR_IRQ(2)))
>> -               dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
>> +               drm_dbg(plane->base.dev, "overrun on plane %s\n",
>>                           desc->name);
>>    }
>>
>> @@ -1140,7 +1140,7 @@ static void atmel_hlcdc_plane_reset(struct drm_plane *p)
>>           if (state) {
>>                   if (atmel_hlcdc_plane_alloc_dscrs(p, state)) {
>>                           kfree(state);
>> -                       dev_err(p->dev->dev,
>> +                       drm_err(p->dev,
>>                                   "Failed to allocate initial plane state\n");
>>                           return;
>>                   }
>> --
>> 2.43.0
>>
