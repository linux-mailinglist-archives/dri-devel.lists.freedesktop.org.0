Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01641B5A264
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 22:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FDF10E785;
	Tue, 16 Sep 2025 20:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ehgev9wP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CC310E785
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 20:25:50 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3e8ef75b146so2462392f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 13:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758054349; x=1758659149; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1Z7GnmkTaAdXN+TwZ1qp0XZ2z7Z2RdV2bNh+iEGCPco=;
 b=Ehgev9wPJZD8S8BlnjoVZClCC0bcFd7vemNUevNhWZF8dAj/irj7zCgbGBYlSF2Zpf
 M7A/N9khFpStZWtkej2NsMFSW7AZuvb69Fvd+EkiN0FQRR3ZufwasCwRxExEf7ISz8EQ
 tr1lZRVhL0CW01/jxfkXDRR49/o8m8brBHhNgU0pDd8pzVUMftU1xuOMstmiWSqPSfBc
 rIW61f8u2qDSZocD7OFVrEEy38xQCoBgMAqzjUTQn5TkeA/zrAFbQZnV25EMTtJ0zzQc
 nNUC7QTAUfpiQ2k8jcM3AFlAm+0WvIzUp0ptTYRyLRW175C9mDLR9DVKThjKfLBcxNlV
 ix4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758054349; x=1758659149;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Z7GnmkTaAdXN+TwZ1qp0XZ2z7Z2RdV2bNh+iEGCPco=;
 b=R2JleJhwkLQeHWqBOah/uPvmEZ/niKts3zEmhXyh98yTOS66dXcAoRGMq6iwpPXys8
 d7AD//7xN1GvVDDnwWJtyw4JfpEix3lB13J9SH4oxFGrhOTnYrqUeF662zRMGhqS9w4W
 BPwsPqoVZ1huHU+Mg92H+ZQk3tNLDf1BhFVLYPbizvatr/v8rKM3gEHY9GFjR33RDNgp
 zKz8XaR0AZg24WzqiQR/d/MERx/skXYnkcB2P4fn6opKMP2ZtFyQc4gkjWluB1H0Dr94
 l4AAdO/tNQVZKvnFv8VHWUwbuOf3ZuF5bRE8aVqPHZ2sqQ2IASeSYoJZbU+PddVvGBNK
 7WQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV55sXwKR3bHWzwGOFvA7TDez0courPqKCJ7BNg7SAerta0QKLB66bLzoGAbZcIuf0Ndsebx1IAR+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcIN+p/0tgwi2l+rA9s5SAJlksJ0D+HWGjesgjRmhepkaQClWe
 +4eJSBmPCYG82lR60gpGxiMLRk8pKk32eWSmEs4o654ONG0NX12wLYWZ
X-Gm-Gg: ASbGncseR8+PWfJ8GqO127N/MvmiwT1vgxx9QPpDOIBZgdJvRLMcS5qVf9wf2AuFbFG
 akE9LCRFT38/Y0JsDQD6bLqumHw48IKJHFaxnGe/Gz7pxwiYmGAtlq3f/7Aw1Ig5FKESSKGZHR6
 6E6JdYYbALnWRE1w0qHcimjEPXrj5qruRrsmd1dCvSOpv16uATlvdnrgbizCM2GitcmFb9NMeCo
 3xT2wcL9kjVqXwgMUjffPX4fnkZQZYdnMJoUcHK0YZBoUAlnhRsFA4TeKHRpRbXesaFRQhfkNv7
 9r4+2nJD/hBx4tZi31NJDR+/fdIlmnkRAedBi9IDZwXLljjSZiwqf0/HJbMIyRDrDeAxhNluNnh
 6H5lHH2XFvsq3wfZqe1IVbYdcOJWf5fynGsU=
X-Google-Smtp-Source: AGHT+IFYef1W20KdCqlCjiXb8p7T+iogcnhGNGzTT397wbKbR5kPv4DEsNQAhBPJAhFNJZRRTTSYYQ==
X-Received: by 2002:a05:6000:2209:b0:3cd:ac2b:7f0 with SMTP id
 ffacd0b85a97d-3e7659f3bccmr14918748f8f.49.1758054348300; 
 Tue, 16 Sep 2025 13:25:48 -0700 (PDT)
Received: from [192.168.1.12] ([156.204.69.171])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613869528bsm7470655e9.14.2025.09.16.13.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 13:25:47 -0700 (PDT)
Message-ID: <2d3fd438-06db-4ba2-82f9-22a5c9267952@gmail.com>
Date: Tue, 16 Sep 2025 23:25:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm: atmel-hlcdc: replace dev_* print functions with
 drm_* variants
To: Manikandan.M@microchip.com, Dharma.B@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250813224000.130292-1-eslam.medhat1993@gmail.com>
 <2e4334ac-ebd2-4686-8d5c-6d7a637a6d57@microchip.com>
 <CAFRctSHGG-7tx0o5-hi2pZbsw-9jGV1FZrFquOOnFAB=i+O8Gw@mail.gmail.com>
 <4e7faa33-6e39-4b9c-b5df-bccaa9cbb1cc@microchip.com>
Content-Language: en-US
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
In-Reply-To: <4e7faa33-6e39-4b9c-b5df-bccaa9cbb1cc@microchip.com>
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

Hi Manikandan,

Understood. thank you for the follow-up.

On 9/16/25 09:50, Manikandan.M@microchip.com wrote:
> Hi Eslam Khafagy,
>
> I am still awaiting approval for my commit access request to the
> drm-misc repository. I will be able to apply your changes as soon as the
> access is granted.Thank you for your patience.
>
> On 14/09/25 3:49 am, Eslam Khafagy wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hello Manikandan,
>> This patch has been reviewed for a while now. but i didn't get an
>> update if it's been pulled yet or not .
>>
>> kindly can you kindly update if it's been pulled or not ?
>> thanks in advance.
>>
>>
>> On Mon, Aug 18, 2025 at 12:16 PM <Manikandan.M@microchip.com> wrote:
>>> On 14/08/25 4:09 am, Eslam Khafagy wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Update the Atmel HLCDC code to use DRM print macros drm_*() instead of
>>>> dev_warn() and dev_err(). This change ensures consistency with DRM
>>>> subsystem logging conventions [1].
>>>>
>>>> [1]
>>>> Link: https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter
>>>>
>>>> Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
>>> Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
>>>
>>>> ---
>>>>     .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 21 ++++++++++---------
>>>>     drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 14 ++++++-------
>>>>     .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |  3 ++-
>>>>     .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  6 +++---
>>>>     4 files changed, 23 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>>>> index 0f7ffb3ced20..e0efc7309b1b 100644
>>>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>>>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>>>> @@ -20,6 +20,7 @@
>>>>     #include <drm/drm_atomic_helper.h>
>>>>     #include <drm/drm_crtc.h>
>>>>     #include <drm/drm_modeset_helper_vtables.h>
>>>> +#include <drm/drm_print.h>
>>>>     #include <drm/drm_probe_helper.h>
>>>>     #include <drm/drm_vblank.h>
>>>>
>>>> @@ -215,32 +216,32 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
>>>>                    if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                                 !(status & ATMEL_XLCDC_CM),
>>>>                                                 10, 1000))
>>>> -                       dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
>>>> +                       drm_warn(dev, "Atmel LCDC status register CMSTS timeout\n");
>>>>
>>>>                    regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_XLCDC_SD);
>>>>                    if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                                 status & ATMEL_XLCDC_SD,
>>>>                                                 10, 1000))
>>>> -                       dev_warn(dev->dev, "Atmel LCDC status register SDSTS timeout\n");
>>>> +                       drm_warn(dev, "Atmel LCDC status register SDSTS timeout\n");
>>>>            }
>>>>
>>>>            regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_DISP);
>>>>            if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                         !(status & ATMEL_HLCDC_DISP),
>>>>                                        10, 1000))
>>>> -               dev_warn(dev->dev, "Atmel LCDC status register DISPSTS timeout\n");
>>>> +               drm_warn(dev, "Atmel LCDC status register DISPSTS timeout\n");
>>>>
>>>>            regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_SYNC);
>>>>            if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                         !(status & ATMEL_HLCDC_SYNC),
>>>>                                        10, 1000))
>>>> -               dev_warn(dev->dev, "Atmel LCDC status register LCDSTS timeout\n");
>>>> +               drm_warn(dev, "Atmel LCDC status register LCDSTS timeout\n");
>>>>
>>>>            regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_PIXEL_CLK);
>>>>            if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                         !(status & ATMEL_HLCDC_PIXEL_CLK),
>>>>                                        10, 1000))
>>>> -               dev_warn(dev->dev, "Atmel LCDC status register CLKSTS timeout\n");
>>>> +               drm_warn(dev, "Atmel LCDC status register CLKSTS timeout\n");
>>>>
>>>>            clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
>>>>            pinctrl_pm_select_sleep_state(dev->dev);
>>>> @@ -269,32 +270,32 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
>>>>            if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                         status & ATMEL_HLCDC_PIXEL_CLK,
>>>>                                         10, 1000))
>>>> -               dev_warn(dev->dev, "Atmel LCDC status register CLKSTS timeout\n");
>>>> +               drm_warn(dev, "Atmel LCDC status register CLKSTS timeout\n");
>>>>
>>>>            regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_SYNC);
>>>>            if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                         status & ATMEL_HLCDC_SYNC,
>>>>                                         10, 1000))
>>>> -               dev_warn(dev->dev, "Atmel LCDC status register LCDSTS timeout\n");
>>>> +               drm_warn(dev, "Atmel LCDC status register LCDSTS timeout\n");
>>>>
>>>>            regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_DISP);
>>>>            if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                         status & ATMEL_HLCDC_DISP,
>>>>                                         10, 1000))
>>>> -               dev_warn(dev->dev, "Atmel LCDC status register DISPSTS timeout\n");
>>>> +               drm_warn(dev, "Atmel LCDC status register DISPSTS timeout\n");
>>>>
>>>>            if (crtc->dc->desc->is_xlcdc) {
>>>>                    regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_CM);
>>>>                    if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                                 status & ATMEL_XLCDC_CM,
>>>>                                                 10, 1000))
>>>> -                       dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
>>>> +                       drm_warn(dev, "Atmel LCDC status register CMSTS timeout\n");
>>>>
>>>>                    regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_SD);
>>>>                    if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                                 !(status & ATMEL_XLCDC_SD),
>>>>                                                 10, 1000))
>>>> -                       dev_warn(dev->dev, "Atmel LCDC status register SDSTS timeout\n");
>>>> +                       drm_warn(dev, "Atmel LCDC status register SDSTS timeout\n");
>>>>            }
>>>>
>>>>            pm_runtime_put_sync(dev->dev);
>>>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>>>> index fa8ad94e431a..acb017a2486b 100644
>>>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>>>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>>>> @@ -724,19 +724,19 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
>>>>
>>>>            ret = atmel_hlcdc_create_outputs(dev);
>>>>            if (ret) {
>>>> -               dev_err(dev->dev, "failed to create HLCDC outputs: %d\n", ret);
>>>> +               drm_err(dev, "failed to create HLCDC outputs: %d\n", ret);
>>>>                    return ret;
>>>>            }
>>>>
>>>>            ret = atmel_hlcdc_create_planes(dev);
>>>>            if (ret) {
>>>> -               dev_err(dev->dev, "failed to create planes: %d\n", ret);
>>>> +               drm_err(dev, "failed to create planes: %d\n", ret);
>>>>                    return ret;
>>>>            }
>>>>
>>>>            ret = atmel_hlcdc_crtc_create(dev);
>>>>            if (ret) {
>>>> -               dev_err(dev->dev, "failed to create crtc\n");
>>>> +               drm_err(dev, "failed to create crtc\n");
>>>>                    return ret;
>>>>            }
>>>>
>>>> @@ -778,7 +778,7 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>>>>
>>>>            ret = clk_prepare_enable(dc->hlcdc->periph_clk);
>>>>            if (ret) {
>>>> -               dev_err(dev->dev, "failed to enable periph_clk\n");
>>>> +               drm_err(dev, "failed to enable periph_clk\n");
>>>>                    return ret;
>>>>            }
>>>>
>>>> @@ -786,13 +786,13 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>>>>
>>>>            ret = drm_vblank_init(dev, 1);
>>>>            if (ret < 0) {
>>>> -               dev_err(dev->dev, "failed to initialize vblank\n");
>>>> +               drm_err(dev, "failed to initialize vblank\n");
>>>>                    goto err_periph_clk_disable;
>>>>            }
>>>>
>>>>            ret = atmel_hlcdc_dc_modeset_init(dev);
>>>>            if (ret < 0) {
>>>> -               dev_err(dev->dev, "failed to initialize mode setting\n");
>>>> +               drm_err(dev, "failed to initialize mode setting\n");
>>>>                    goto err_periph_clk_disable;
>>>>            }
>>>>
>>>> @@ -802,7 +802,7 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>>>>            ret = atmel_hlcdc_dc_irq_install(dev, dc->hlcdc->irq);
>>>>            pm_runtime_put_sync(dev->dev);
>>>>            if (ret < 0) {
>>>> -               dev_err(dev->dev, "failed to install IRQ handler\n");
>>>> +               drm_err(dev, "failed to install IRQ handler\n");
>>>>                    goto err_periph_clk_disable;
>>>>            }
>>>>
>>>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>>>> index 50fee6a93964..0b8a86afb096 100644
>>>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>>>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>>>> @@ -15,6 +15,7 @@
>>>>     #include <drm/drm_bridge.h>
>>>>     #include <drm/drm_encoder.h>
>>>>     #include <drm/drm_of.h>
>>>> +#include <drm/drm_print.h>
>>>>     #include <drm/drm_simple_kms_helper.h>
>>>>
>>>>     #include "atmel_hlcdc_dc.h"
>>>> @@ -92,7 +93,7 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
>>>>            output->bus_fmt = atmel_hlcdc_of_bus_fmt(ep);
>>>>            of_node_put(ep);
>>>>            if (output->bus_fmt < 0) {
>>>> -               dev_err(dev->dev, "endpoint %d: invalid bus width\n", endpoint);
>>>> +               drm_err(dev, "endpoint %d: invalid bus width\n", endpoint);
>>>>                    return -EINVAL;
>>>>            }
>>>>
>>>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
>>>> index 4a7ba0918eca..817284509b57 100644
>>>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
>>>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
>>>> @@ -1034,7 +1034,7 @@ static void atmel_hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
>>>>            if (isr &
>>>>                (ATMEL_HLCDC_LAYER_OVR_IRQ(0) | ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
>>>>                 ATMEL_HLCDC_LAYER_OVR_IRQ(2)))
>>>> -               dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
>>>> +               drm_dbg(plane->base.dev, "overrun on plane %s\n",
>>>>                            desc->name);
>>>>     }
>>>>
>>>> @@ -1051,7 +1051,7 @@ static void atmel_xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
>>>>            if (isr &
>>>>                (ATMEL_XLCDC_LAYER_OVR_IRQ(0) | ATMEL_XLCDC_LAYER_OVR_IRQ(1) |
>>>>                 ATMEL_XLCDC_LAYER_OVR_IRQ(2)))
>>>> -               dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
>>>> +               drm_dbg(plane->base.dev, "overrun on plane %s\n",
>>>>                            desc->name);
>>>>     }
>>>>
>>>> @@ -1140,7 +1140,7 @@ static void atmel_hlcdc_plane_reset(struct drm_plane *p)
>>>>            if (state) {
>>>>                    if (atmel_hlcdc_plane_alloc_dscrs(p, state)) {
>>>>                            kfree(state);
>>>> -                       dev_err(p->dev->dev,
>>>> +                       drm_err(p->dev,
>>>>                                    "Failed to allocate initial plane state\n");
>>>>                            return;
>>>>                    }
>>>> --
>>>> 2.43.0
>>>>
>>> --
>>> Thanks and Regards,
>>> Manikandan M.
>>>
>>
>> --
>>
>> Eslam Medhat Khafagy
>>
>> https://www.linkedin.com/in/eslam-khafagy-a8a68159/
