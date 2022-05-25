Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582E453447D
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 21:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30A210E14F;
	Wed, 25 May 2022 19:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CA310E14F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 19:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653507989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FlY4/miZ0ZZ5mykQm8iKYxJ93QNr/0vOOCu9Zd6xe4s=;
 b=e3wFUfMm+0+vx4TFtKk8WLrGHMS1HdibqBDS7DkAMo/gRy09B2Ga5cbl+xrzawV+IXxTnx
 CX8GiwcjvwP5BqyEAX3cgh/cOP93v5e72u6iMePbtOOaKH7+qaAtIRh/qJh1prRLI8+eHt
 zSp8s5zqGRBqXq4HLAYgL5Ks+HHXuTE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-RDsRBx6ROnyfVRZ5M_mG8g-1; Wed, 25 May 2022 15:46:27 -0400
X-MC-Unique: RDsRBx6ROnyfVRZ5M_mG8g-1
Received: by mail-wm1-f72.google.com with SMTP id
 n25-20020a05600c3b9900b0039733081b4dso3288675wms.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 12:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FlY4/miZ0ZZ5mykQm8iKYxJ93QNr/0vOOCu9Zd6xe4s=;
 b=QVDwXI6Vk64yR5p16m32Gjx/6QPUMGKoVUz8XVK+KDjgGtmaGCKM0AxhUNH3peNMRf
 63habK9xDkfes9rOFyYsxerSAq0adtlbJvvTXVgllzw9oW6Nr8svaDxGG/vE/ZrTzKxT
 aa0nB1bTLlB3v2uyDOjvyKphk1r42s9xU40z/uK2JYG/Y62QHvcWrbhjnu/TF1EMid3u
 F51vJo1zVyZvg7vCmfEOKt0sv/mq8Qo+d2eTJhHQYK+H/OmNUb5BXEBhr0+RFVIGzJCg
 qXrU0xvLErS8l8UpEHxJv7V3PTO1i9KdkkAY8S96bF8Yi7ruJc82mNByNIwLN3CcM5yK
 u6zg==
X-Gm-Message-State: AOAM533BbF04Jl2IVmcFDfb4r/wrVJ8rHD4InIG7Q7naXnzydeWa70AW
 CXqQGxPP9++5h+B2Y/NgCJlhmr4reLoGGy4hf45JjGaLA1OKg6zUOaJK3RfqEQNs0mAKF6FO+J1
 wpbCH/yJlsQcHY+PMO53N10dTXgjX
X-Received: by 2002:adf:e10d:0:b0:20c:dc8f:e5a5 with SMTP id
 t13-20020adfe10d000000b0020cdc8fe5a5mr28558848wrz.265.1653507986466; 
 Wed, 25 May 2022 12:46:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN6am5Dh8UvetDovx7vfD9hTP6i2AqQoA9EwjhjbLeWDqxc/tSG2JvHPjMZ6Nuy7uMwB9blw==
X-Received: by 2002:adf:e10d:0:b0:20c:dc8f:e5a5 with SMTP id
 t13-20020adfe10d000000b0020cdc8fe5a5mr28558829wrz.265.1653507986094; 
 Wed, 25 May 2022 12:46:26 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p23-20020a1c7417000000b003972dcfb614sm2827756wmc.14.2022.05.25.12.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 12:46:25 -0700 (PDT)
Message-ID: <536d4700-6f28-176d-7883-5793f5cd7c8e@redhat.com>
Date: Wed, 25 May 2022 21:46:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 3/6] drm: Add driver for Solomon SSD130x OLED displays
To: Dominik Kierner <dkierner@dh-electronics.com>
References: <5d817ea54144414aa7865a72694b5811@dh-electronics.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <5d817ea54144414aa7865a72694b5811@dh-electronics.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "noralf@tronnes.org" <noralf@tronnes.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Dominik,

I missed this email before and never answered. Sorry about that.

On 3/10/22 14:11, Dominik Kierner wrote:
> Hello Javier,
> 
> I was working on a SSD130x driver as well, although with a different
> (drm_panel) approach and hit a bit of a roadblock.

My first attempt also was using a panel driver but then decided that it didn't
fit that well and a standalone DRM driver would be a better option.

> Now that Your driver is quite a bit maturer than mine,
> I will happily provide You with the source of my draft,
> so that any useful bits can be incorporated in Your driver.
> I know that links are a bit frowned upon,
> but I'd rather avoid cluttering the thread with my draft code,
> which is unfinished and incompatible with the code in this thread.
> 
> https://github.com/dh-electronics/panel-solomon-ssd130x-draft
> https://github.com/dh-electronics/panel-solomon-ssd130x-draft/tree/drm-ssd130x/drivers/gpu/drm/panel
>

Thanks, I looked at the code briefly and think that there are things there that we
could use. I.e the 3-wire SPI support that's in panel-solomon-ssd130x-spi-3wire.c.
 
> The code was designed as a rewrite from scratch, as I assumed that a new
> DRM driver that accommodates for I2C, 3- and 4-wire-SPI,
> will probably need a new DTS interface for differentiating the
> protocol-specific drivers, which would obviously break compatibility.
>

I wondered this too but then the drivers/staging/fbtft/fb_ssd1306.c supports both
both 4-wire/8-bit shift register and 3-wire/9-bits shift register SPI transports.

The driver does this by using a "buswidth" DT property to figure out which mode is
used. Since 4-wire seems to be the most common case and (at least with all the SPI
OLED displays I could find) one need to do some hardware modifications to support
the 3-wire SPI mode, I decided to just support 4-wire in the ssd130x-spi.c that is
going to be in v5.19.
 
> I do have few suggestions though:
> 
> # Atomic Configuration of Display Driving Regulator and the Charge Pump
> 
> The regulator VBAT is the SSD1306-specific low-voltage (3.3 V to 5 V)
> regulator for the charge pump and takes the place of the voltage
> regulator VCC, that would otherwise supply the OLED driver block with
> 7 V to 15 V.
> The charge pump is never enabled when a VCC with 7 V to 15 V is present.
> Configuring the charge pump based on the available regulators,
> would provide an atomic configuration for either low-voltage +
> charge pump or the regular voltage.
>

Ah I see, I didn't notice this when reading the ssd1306 datasheet.
 
> This way, the device tree boolean for enabling the charge pump could be
> removed by probing for an optional VBAT first, which replaces VCC,
> and falling back to a mandatory VCC otherwise:
>

Interesting, this makes sense to me.
 
> ```
> [...]
> struct ssd130x_panel {
> ...
> 	struct regulator *vdd;		/* Core logic supply */
> 	union {
> 		struct regulator *vcc;	/* Panel driving supply */
> 		struct regulator *vbat;	/* Charge pump regulator supply */
> 	};
> 	struct backlight_device *backlight;
> 		struct {
> 		unsigned int com_scan_dir_inv : 1;
> 		unsigned int com_seq_pin_cfg : 1;
> 		unsigned int com_lr_remap : 1;
> 		unsigned int seg_remap : 1;
> 		unsigned int inverse_display : 1;
> 		unsigned int use_charge_pump : 1;
> 		uint8_t height;
> 		uint8_t width;
> 		uint8_t height_mm;
> 		uint8_t width_mm;
> 		uint8_t display_start_line;
> 		uint8_t com_offset ;
> 		uint8_t contrast;
> 		uint8_t pre_charge_period_dclocks_phase1;
> 		uint8_t pre_charge_period_dclocks_phase2;
> 		uint8_t vcomh_deselect_level;
> 		uint8_t clock_divide_ratio;
> 		uint8_t oscillator_frequency;
> 	} display_settings;
> 	bool prepared;
> 	bool enabled;
> 
> [...]
> 
> ssd130x->vbat = devm_regulator_get_optional(dev, "vbat");
> if (IS_ERR(ssd130x->vbat)) {
> 	ret = PTR_ERR(ssd130x->vbat);
> 
> 	if (ret != -ENODEV) {
> 		if (ret != -EPROBE_DEFER)
> 			dev_err(dev,
> 				"failed to request regulator: %d\n",
> 				ret);
> 		return ret;
> 	}
> 
> 	ssd130x->vbat = NULL;
> }
> else {
> 	ssd130x->display_settings.use_charge_pump = true;
> }
> 
> /* Get panel driving supply */
> If (!ssd130x->vbat) {
> 	ssd130x->vcc = devm_regulator_get(dev, "vcc");
> 	if (IS_ERR(ssd130x->vcc)){
> 		ret = PTR_ERR(ssd130x->vcc);
> 		return ret;
> 	}
> 	else {
> 		ssd130x->display_settings.use_charge_pump = false;
> 	}
> }
> ```
> 
> Splitting in VCC/VBAT and VDD and enforcing their presence is
> of course compatibility breaking.
>
> https://github.com/dh-electronics/panel-solomon-ssd130x-draft/blob/drm-ssd130x/drivers/gpu/drm/panel/panel-solomon-ssd130x.h#L85
> https://github.com/dh-electronics/panel-solomon-ssd130x-draft/blob/drm-ssd130x/drivers/gpu/drm/panel/panel-solomon-ssd130x.c#L80
>

It is a break in the DT binding indeed but on the other hand it seems that the
regulator story is lacking in the current solomon,ssd1307fb.yaml anyways.

That is, the binding schema only mentions a "vbat-supply" but the DRM driver is
not looking for that but instead for "vcc-supply" (I think that was changed due
some feedback I got on some revisions, but didn't update the DT binding). The
fbdev drivers/video/fbdev/ssd1307fb.c driver does lookup "vbat-supply" but all
the DTS and DTS overlays I find don't set one.

Also the "vbat-supply" is not a required property in the current binding. One
thing to notice is that regulator_get() and regulator_get_optional() semantics
are confusing (at least for me). Since doesn't mean whether the regulator must
be present or not but rather if a dummy regulator must be provided if a supply
is not found.

In other words, I don't think that any of these supplies should be made required
in the DT binding but just leave the current "vbat-supply" and add properties for
"vcc-supply" and explain the relationship between these and just make the logic in
the driver to override struct ssd130x_deviceinfo .need_chargepump if are present.

> 
> # Static or Dynamic Configuration for SPI-Modes 3-Wire and 4-Wire
> 
> For the SPI-protocol drivers I see two possible approaches:
> * Dynamic configuration by determining the presence/absence of the
>   D/C-GPIO and assigning the functions accordingly.
>   This way a single driver file for both SPI modes could be sufficient.
> * Static configuration by using the device-tree names
>   (ssd130x-spi-3wire/-4wire) to differentiate between the SPI protocol
>   drivers.
>   This would obviously necessitate two drivers files.
> 
> Which one do you think would be the best approach for this?
>

I think that prefer the first approach. As mentioned the staging driver has a
"buswidth" property but as you said we could just use the "dc-gpios" presence
as indication on whether is a 4-wire or 3-wire SPI mode.
 
> 
> # DRM Mode Configuration via Device Tree
> 
> In the old fbdev driver, the display modes are hard-coded, which means
> for every new display configuration, a new patch needs to be mainlined,
> which slows down official Kernel support and
> puts burden on the maintainers.
> Additionally, with the DRM-subsystem supporting height and length
> information, for scaling, this opens up a lot of new combinations.
> The SSD1306 for example, is available in multiple resolutions like
> 128x64 and 96x16 and comes in different sizes per resolution as well.
> Just to name a few:
> * 128x64 0.96" (22x11mm)
> * 128x64 1.3" (30x15mm)
> * 96x16 0.69" (18x3mm)
>> Instead of hard-coding, I would suggest something along the lines of
> of_get_drm_display_mode().
> The displays won't need to support multiple modes at the same time,
> let alone support for switching between them,
> so the one-time invocation of this expensive function might be worth it. 
> maybe a new and simpler function that could be named:
> of_get_drm_display_mode_simple()
>

This makes sense to me as well.
 
> Providing a mode could later prove useful for a conversion to
> drm_panel, if that is feasible.
> 
> But for a function like this, I have to chicken out.
> 
> 
> # DRM Panel
> 
> The reason why I decided for the drm_panel approach in my code,
> was power management and a clean handling of the software backlight
> dependency, which requires powered display regulators to be powered.
> 
> Prepare/unprepare would power on/off the display logic regulator VDD.
> 
> Enable/disable would power on/off VCC/VBAT, optionally turn on/off
> the charge pump and send the DISPLAY_ON/OFF commands.

Yes, that's the reason why I started with a drm_panel driver as well.

> The SSD1305's PWM part would likely be placed in enable/disable as well.
> 
> What is Your opinion on using drm_panel for Your driver?
>

I can't remember exactly why I decided to stop using drm_panel, but I think
that was because struct drm_panel doesn't have a DRM device and so couldn't
use any of the helper functions that needed one?

At the end I found that having a standalone DRM driver and using the simple
display pipeline infrastructure was a much better way to implement it.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

