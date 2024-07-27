Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7ED93E05F
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 19:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54A910E03E;
	Sat, 27 Jul 2024 17:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dwuGDYmr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF9110E03E
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 17:45:51 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6b7aed340daso11051706d6.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 10:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722102350; x=1722707150; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8pmwdOzAAYQk9MWD3B/2QLF82FPJ/g3mXDK7WgTp34w=;
 b=dwuGDYmrqq+YXLaQJ6Ix3w+6lk7+LykSdIDlPV1hw5tAKGt2UtWlDztcST3Kzd55DI
 BcMDcqnAF04vwF5qynYBm51lqWPvE5zB1fT0EQ5hmY7mV0cIaU1UvEdVNRECkyT2xjPz
 iIfjxlJuUUVz7DGzIDnfPS6PqMbki9i9c5vPbA48XkKKk1ttsKD6f5ORmvUqDCja5+yz
 DEHHSJ8dQuysQW3eVKhDrmbwr7MRRgDfjlIvfxm/7w9oFZ0INIY+G6xkMEJ4ssqBmVAZ
 PKOPyhrcYIPbakNsIFpjtxuTA286mP0kOnDKDsLjG9j+MMiPLReatexRnAlYYATumjWC
 8nGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722102350; x=1722707150;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8pmwdOzAAYQk9MWD3B/2QLF82FPJ/g3mXDK7WgTp34w=;
 b=XPI2PA0nDjdgDtysZ8M9YaSwq5RzGbKcQALqxr5JSr0ia1e2rBru93q24gktA6Kg42
 RzxuZ88IoTWE/Suv/0t73Lnm/vJ+INWKm1f0Wb3NaaAaOzNP3apocVO3aRpili38QB56
 tba2tRTHg1dbQvbEeGqQR+wgZO1tbj0nmbojYbiss5HLzi7QNOmP02jKrp9tWX0i+cqb
 S4KPq3OfPXmPURmZAeI/NRzMQJZtYM2CeFBpwYOAGlTEn2RRVTRS9l26IPVir/46tkB4
 8x4Lfh5zt0VooZo34s0lSiA0snwiwrChURF8P5NEXYz9OfH8Z1TV/IxxyVE9XDXneSJv
 7gww==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9ea/cOOfjuAdJ9pe7yK7RnmvHtZTvh1q2iGIUcjxVZ1qHW7EbDEzx3WaXvTM7ye23oaeFCVK1vDjSHSPh0Bsxd1CbWcxkKDoLHR7R6GAr
X-Gm-Message-State: AOJu0Yzc39g36jP1oqHoeyNhJ4mPNkRgg/YC3h1Xr9caK4IJ1i7Lejgh
 Is5TNGp8mwn5/khrrYc5IrDGQwRS9XA8rdZhYGCLT13V8D0B5y/2
X-Google-Smtp-Source: AGHT+IE14pOI2M+jO6I4WVMjoCLnvDHHifoaQC1Cu3BUPD84mSzyABvc6MfZSvqbp0vtmijCMfw3dA==
X-Received: by 2002:a05:6214:2527:b0:6b5:6a1:f89a with SMTP id
 6a1803df08f44-6bb55977e17mr33835136d6.2.1722102350240; 
 Sat, 27 Jul 2024 10:45:50 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f904131sm31826886d6.51.2024.07.27.10.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 10:45:49 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:45:47 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mehdi.djait@bootlin.com, christophe.jaillet@wanadoo.fr, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <rm4n7iii4jm6y2nllwh7uwzw5ufmbgiu3juw5t7tzrk7hcympp@hkzi2lqkdtbd>
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240726194456.1336484-1-lanzano.alex@gmail.com>
 <20240726194456.1336484-3-lanzano.alex@gmail.com>
 <3b6297d6-f954-499a-9504-233b27ff686a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b6297d6-f954-499a-9504-233b27ff686a@kernel.org>
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

On Sat, Jul 27, 2024 at 11:03:19AM GMT, Krzysztof Kozlowski wrote:
> On 26/07/2024 21:44, Alex Lanzano wrote:
> > Add support for the monochrome Sharp Memory LCDs.
> > 
> > Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> > Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > ---
> >  MAINTAINERS                         |   7 +
> >  drivers/gpu/drm/tiny/Kconfig        |  20 +
> >  drivers/gpu/drm/tiny/Makefile       |   1 +
> >  drivers/gpu/drm/tiny/sharp-memory.c | 726 ++++++++++++++++++++++++++++
> >  4 files changed, 754 insertions(+)
> >  create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 71b739b40921..b5b08247a994 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7123,6 +7123,13 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> >  F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> >  
> > +DRM DRIVER FOR SHARP MEMORY LCD
> > +M:	Alex Lanzano <lanzano.alex@gmail.com>
> > +S:	Maintained
> > +T:	git git://anongit.freedesktop.org/drm/drm-misc
> 
> 
> Do you have drm-misc commit rights? If not, drop it. There is no point
> to put some other maintainer's tree in your entry. Git tree is already
> present in the maintainer's entry who is going to apply the patches.
> 
> 

Will remove.

> > +F:	Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml
> 
> If you rename the file in your patchset, you must rename it EVERYWHERE.
> 
> 

Will do.

> > +F:	drivers/gpu/drm/tiny/sharp-memory.c
> > +
> >  DRM DRIVER FOR SITRONIX ST7586 PANELS
> 
> 
> ...
> 

Oh! Did you need me to rename sharp-memory.c as well?

> > +	smd->spi = spi;
> > +	drm = &smd->drm;
> > +	ret = drmm_mode_config_init(drm);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to initialize drm config\n");
> > +
> > +	smd->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> > +	if (smd->enable_gpio == NULL)
> > +		dev_warn(&spi->dev, "Enable gpio not defined\n");
> > +
> > +	/*
> > +	 * VCOM is a signal that prevents DC bias from being built up in
> > +	 * the panel resulting in pixels being forever stuck in one state.
> > +	 *
> > +	 * This driver supports three different methods to generate this
> > +	 * signal depending on EXTMODE pin:
> > +	 *
> > +	 * software (EXTMODE = L) - This mode uses a kthread to
> > +	 * periodically send a "maintain display" message to the display,
> > +	 * toggling the vcom bit on and off with each message
> > +	 *
> > +	 * external (EXTMODE = H) - This mode relies on an external
> > +	 * clock to generate the signal on the EXTCOMM pin
> > +	 *
> > +	 * pwm (EXTMODE = H) - This mode uses a pwm device to generate
> > +	 * the signal on the EXTCOMM pin
> > +	 *
> > +	 */
> > +	smd->vcom = 0;
> > +	if (device_property_read_string(&spi->dev, "vcom-mode", &vcom_mode_str))
> > +		return dev_err_probe(dev, -EINVAL,
> > +				     "Unable to find vcom-mode node in device tree\n");
> > +
> > +	if (!strcmp("software", vcom_mode_str)) {
> > +		smd->vcom_mode = SHARP_MEMORY_SOFTWARE_VCOM;
> > +
> > +	} else if (!strcmp("external", vcom_mode_str)) {
> > +		smd->vcom_mode = SHARP_MEMORY_EXTERNAL_VCOM;
> > +
> > +	} else if (!strcmp("pwm", vcom_mode_str)) {
> > +		smd->vcom_mode = SHARP_MEMORY_PWM_VCOM;
> > +		ret = sharp_memory_init_pwm_vcom_signal(smd);
> > +		if (ret)
> > +			return dev_err_probe(dev, ret,
> > +					     "Failed to initialize external COM signal\n");
> > +	} else {
> > +		return dev_err_probe(dev, -EINVAL, "Invalid value set for vcom-mode\n");
> > +	}
> > +
> > +	drm->mode_config.funcs = &sharp_memory_mode_config_funcs;
> > +
> > +	/* Set the DRM display mode depending on panel model */
> > +	model = (uintptr_t)spi_get_device_match_data(spi);
> > +	switch (model) {
> > +	case LS013B7DH03:
> > +		smd->mode = &sharp_memory_ls013b7dh03_mode;
> > +		break;
> > +
> > +	case LS010B7DH04:
> > +		smd->mode = &sharp_memory_ls010b7dh04_mode;
> > +		break;
> > +
> > +	case LS011B7DH03:
> > +		smd->mode = &sharp_memory_ls011b7dh03_mode;
> > +		break;
> > +
> > +	case LS012B7DD01:
> > +		smd->mode = &sharp_memory_ls012b7dd01_mode;
> > +		break;
> > +
> > +	case LS013B7DH05:
> > +		smd->mode = &sharp_memory_ls013b7dh05_mode;
> > +		break;
> > +
> > +	case LS018B7DH02:
> > +		smd->mode = &sharp_memory_ls018b7dh02_mode;
> > +		break;
> > +
> > +	case LS027B7DH01:
> > +		fallthrough;
> > +	case LS027B7DH01A:
> > +		smd->mode = &sharp_memory_ls027b7dh01_mode;
> > +		break;
> > +
> > +	case LS032B7DD02:
> > +		smd->mode = &sharp_memory_ls032b7dd02_mode;
> > +		break;
> > +
> > +	case LS044Q7DH01:
> > +		smd->mode = &sharp_memory_ls044q7dh01_mode;
> > +		break;
> 
> This is over-complicated. Just store the mode in device match data.
> 
> 

Will simplify in v3

> > +
> > +	default:
> > +		return dev_err_probe(&spi->dev, -EINVAL, "Invalid DRM display mode\n");
> > +	}
> 
> 
> Best regards,
> Krzysztof
> 

Thank you for taking the time to review!

Best regards,
Alex
