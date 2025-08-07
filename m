Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F18B1DF13
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 23:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DB910E190;
	Thu,  7 Aug 2025 21:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yp34Tfgf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA80710E13E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 18:33:55 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so11189895e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 11:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754591634; x=1755196434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u+wSeTgD+KyHlh1LNjtbFb9cuhDfBkha0K0sJfYhWTQ=;
 b=Yp34TfgfdjfHvINlFRtp2cXYqjEgk12XxknTOESTM95Ea13ulAbtMz8Y6eX/XbxhFU
 Ts9qWLwiQXU2UhB6V6xdfEjHhF4wammDgRw3tw5NvGLjzF1c9HPUyjNHHQdjAXAv/Xnr
 3KBVm0lqQSz1XLU6HwMzskZXpKGIwoG+F20j2YWXflVppVfF0fk5JiRU+hy9Eb4CnZfS
 v1Snh86ZqjnuA0TnoajJ1XZGcYprFO4s20d9nGy5kvDiL9jNg6jF936+KFseuSYHHfOp
 Og5t+PpsOQb0SRlwxOeE9pRBxskqvrHfj/KO/qE8WhL4PVDWfXjWOp002ozcWBRBPaYC
 AXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591634; x=1755196434;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u+wSeTgD+KyHlh1LNjtbFb9cuhDfBkha0K0sJfYhWTQ=;
 b=P+L3t6XLCW/QM3MetlfVH0V9v6MsfgwclowdtTr6j0jbtfAipAFp332Z2VMRZoZIXV
 ZSW0CM9W93t5NJjH4Pzsqx9ziyY/AyysK4ZMFW/7rrIX1fZF9QX7XJbVxA7+hI/Zln9G
 uxXeAnAXKJt8k+NfHXW/R/E5RSTZqKNs6a1YN6NyCZtWD4R1GkJWPpqYGJxs5mh1VWBh
 t7RD+CX3FZ3T79dofq+8A1zdiBkLZ4bTBOU1962VxvZ148Fq/81WD9aUfmHAGnB7hEEI
 gjj2ogIW2Ai9blFHUi3i5JyVtpOJFhHbULOT8QIbXosUTW46QJvm5p7tKIzzJ+jrrcee
 YBFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBT28RLmdMyVDD3/92aE5O9oJ2VsvKnFcuT9EyhDr4IqQ0V8erT8ragsbknil+SHFJtYWqZWxz0w8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDn5fpdBklS1xWLu8qYf2MIKmD9/AlyNXhiCyN8umX+KfGeOmq
 OATywG9QgoaOjAcimschDYEeEWpcw6Q/5dWRrseHkLTUZc2AcZLzc01R
X-Gm-Gg: ASbGncuZrKWxrNN67M9p7GidNROYQYuhrThBT6jrwfePjVaoOtnmgrB0XAq46gMoMYW
 8rSg/v80MDe9OhEDLRQqfE4682c/kUD1NBi/7oeiytF1NdZAnVMLfMOb50/6d3/cHqiX7FcDZAe
 WuPOE6djIpYdAsttn3PhpL1qWpQd6ES8MOEewzXkqYr6EJ77/+EYSOlsrO40zEXvEeM9+3Awghd
 x9IqcKcL7FwxJQ0F9DMiklofjxZJ/vrqOUo0PyDe9+garBgaLPQeHVAXSbiqWzw5CdioW9tqgjR
 QZlH4/rzNIHzeIR+qLD1XkFngkjB3Sx2FgQKmPw4g3wWDuwBE5HHeYcMHnlSBG4oGlEEYGf8gR7
 jfPjgwznODsSy2LrAu1IOCiag1p7xFK+bnWw=
X-Google-Smtp-Source: AGHT+IFb4+WXBcmMoW0cDyf2/cXHSKSUU3eLFCEXiDD/KNdBemcmwemt2zGCACE2Ixg6JsmlwXBZMg==
X-Received: by 2002:a05:600c:a03:b0:459:d9a2:e952 with SMTP id
 5b1f17b1804b1-459f4e9e738mr321815e9.1.1754591633873; 
 Thu, 07 Aug 2025 11:33:53 -0700 (PDT)
Received: from [192.168.1.3] ([156.204.172.189])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e577d0f5sm104736335e9.0.2025.08.07.11.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 11:33:53 -0700 (PDT)
Message-ID: <0856a87c-9f7f-41c8-a35b-49d90094e5b1@gmail.com>
Date: Thu, 7 Aug 2025 21:33:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm: atmel-hlcdc: replace dev_* print funtions
 with drm_* variants
To: Manikandan.M@microchip.com
Cc: skhan@linuxfoundation.com, Dharma.B@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250806183049.52112-1-eslam.medhat1993@gmail.com>
 <20250806183049.52112-2-eslam.medhat1993@gmail.com>
 <09cc3c77-d5e8-47d2-9bbe-f82b5a8a8447@microchip.com>
Content-Language: en-US
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
In-Reply-To: <09cc3c77-d5e8-47d2-9bbe-f82b5a8a8447@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 07 Aug 2025 21:53:54 +0000
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


On 8/7/25 10:05, Manikandan.M@microchip.com wrote:
> Hi Eslam Khafagy,
>
> On 07/08/25 12:00 am, Eslam Khafagy wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> According to documentation[1] drm_* variants are preferred over dev_*
>> print functions.
>>
>> [1] https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter
>>
>> v1->v2
>> replace dev_dbg with drm_dbg  in atmel_hlcdc_plane.c
> The change logs should be placed after Signed-off-by and below a
> separate 3 dash lines.
ok
> IMO
> The commit message can be -
> 'Update the Atmel HLCDC code to use DRM print macros drm_*() instead of
> dev_warn() and dev_err(). This change ensures consistency with DRM
> subsystem logging conventions [1].
>
> [1]
> https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter'
yes it's better . thanks.
>> Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
>> ---
>>    .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 20 +++++++++----------
>>    drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 14 ++++++-------
>>    .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |  2 +-
>>    .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  6 +++---
>>    4 files changed, 21 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> index 0f7ffb3ced20..da94ab0540bb 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> @@ -215,32 +215,32 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
>>                   if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                                !(status & ATMEL_XLCDC_CM),
>>                                                10, 1000))
>> -                       dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
>> +                       drm_warn(dev, "Atmel LCDC status register CMSTS timeout\n");
> The files atmel_hlcdc_crtc.c and atmel_hlcdc_output.c failes to compile
> due to missing headers for drm_(warn/err) macros.
yes. thanks for pointing this out. i was already planning for a fix 
today in v3.
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
>> @@ -269,32 +269,32 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
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
>> index 50fee6a93964..945a475c33ac 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>> @@ -92,7 +92,7 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
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
