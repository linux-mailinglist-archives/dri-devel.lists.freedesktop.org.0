Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A003E9141F5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 07:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91F610E346;
	Mon, 24 Jun 2024 05:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sd14xJTx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7841210E346
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 05:31:22 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52ce6c8db7bso616568e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 22:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719207080; x=1719811880; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oEeMqLzWPtuHbd7DMdLxKIfGpNKakGZfL/lhpzQLB6U=;
 b=Sd14xJTxlnYDvlJyIU3A56wIsugGFR6Hwhx4AN1I4uVZnV6EW/MRMKSERACf2nK31D
 TyjMIC9SGsRogU+GNZAZj4e37EgI16KBQ9l44by4pBOaAFVjnEqlE4XJdKGX9U2BR42O
 a1tTAuZ57gzI0ohO1kWeKrj13sS3FEoMMAp+PLXymm94X6A0WCYbFFaFKN6MBSj2JvgL
 7kaHras4PruJELAikAZFQO9u2gl1NGrryzWMdf2FCg5y2JqzpCyM3DmSoqZVVXiVUoMX
 9/WAcb9S1E0nmNnkUBXxSK+RqZNyUKpdSrdRudi5Q5PsCtQP/Ut7f9Y4lKvR6cbhIo+p
 ukOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719207080; x=1719811880;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oEeMqLzWPtuHbd7DMdLxKIfGpNKakGZfL/lhpzQLB6U=;
 b=D/lgztA0l5Qfbvpgyp/sDfXsBXWlWpTvZMxezcg2Gx13RcntPj2RpWbT8MvxN4gK50
 mIbpmfxkPbif09BONxZ2H8KMTRT8B1MEQCytH9CqWX7SrVCWYkd4L+3Mk4UFNX0yu8Lg
 m3YnwXN+6BIHLU2jUmN2ZuChouikP+YwOHpQPIvuBLEW1zIisB91dmcKCGDSSjNvIagY
 xp2tARb1SR+fKhljvchJOIIG13FrB+A6dFjKWRkVlfhx7BS8qWWKhQ7M/VagZrT7s5ef
 Kh5pU75lSs/hZICI0qNpBuw5sj+5rNQKJbNsWiJwDAZi2rLDMsA4hKprHXzYRv/LTTGu
 E5HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/A+B8PPodoA6jPV7Ev/NvFpcHOhEtv29dd43ye5I11ANMRqY26Eo7zSu0JOk4wXti1G6PBZ6uu2Dled82LccTK2akgnAniijbFy9e3pRP
X-Gm-Message-State: AOJu0Yww33XqG9+U020N4IXH9m5h/Zd51ef67VcbpIoavZdcMbDEGOE/
 VRqWM4VSIHrmTLbuVJNPsfesp6rTwtVjCXVBQxEiKfUg1F55r2rohwyBNW7bpa8=
X-Google-Smtp-Source: AGHT+IGDR4WXp3BrtdW/oZ54TDqH52mJ/FrYWjDaLO9Oi22YZv6nU3DEUmhIjwPYW7xV1aybF8+z8Q==
X-Received: by 2002:ac2:5e83:0:b0:52c:e41a:b666 with SMTP id
 2adb3069b0e04-52ce41ab71fmr1575041e87.7.1719207080428; 
 Sun, 23 Jun 2024 22:31:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd810d633sm864075e87.165.2024.06.23.22.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 22:31:19 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:31:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 5/7] drm/panel: add driver for samsung amb655x
Message-ID: <mnxpybk4nqdyp2xo22dxbprtxt5v6spr2ax4p3vrpwafqcbonv@ga4o2xxtkkov>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <20240624-oneplus8-v1-5-388eecf2dff7@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-oneplus8-v1-5-388eecf2dff7@postmarketos.org>
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

On Mon, Jun 24, 2024 at 03:30:29AM GMT, Caleb Connolly wrote:
> This is a 1080x2400 120hz panel used on the OnePlus 8T. It uses DSC but
> uses non-standard DCS commands.

Please add a note regarding the panel using long packets for all the
commands.

Also the cover letter had a mention of the panel not fully comming up
after being reset, is that still true? If so, it should be mentioned in
the commit message too.

> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-amb655x.c | 420 ++++++++++++++++++++++++++
>  4 files changed, 437 insertions(+)



> +static int samsung_amb655x_on(struct samsung_amb655x *amb655x)
> +{
> +	struct drm_dsc_picture_parameter_set pps;
> +	struct mipi_dsi_device *dsi = amb655x->dsi;
> +	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	drm_dsc_pps_payload_pack(&pps, &amb655x->dsc);
> +
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_buffer_multi(&ctx, &pps, sizeof(pps));
> +	mipi_dsi_dcs_write_long(&ctx, 0x9d, 0x01);
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0xa5, 0xa5);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);

_multi. Shouldn't it be a long package too?

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	usleep_range(11000, 12000);

mipi_dsi_msleep() or add mipi_dsi_usleep_range().

> +	ret = mipi_dsi_dcs_set_column_address(dsi, 0x0000, 1080 - 1);

_multi, adding the function as required

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set column address: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_page_address(dsi, 0x0000, 2400 - 1);

_multi

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set page address: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* FD Setting */
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_long(&ctx, 0xd5, 0x8d);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb0, 0x0a);
> +	mipi_dsi_dcs_write_long(&ctx, 0xd5, 0x05);
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0xa5, 0xa5);
> +
> +	/* FFC Function */
> +	mipi_dsi_dcs_write_long(&ctx, 0xfc, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb0, 0x01);
> +	mipi_dsi_dcs_write_long(&ctx, 0xe4, 0xa6, 0x75, 0xa3);
> +	mipi_dsi_dcs_write_long(&ctx, 0xe9,
> +			       0x11, 0x75, 0xa6, 0x75, 0xa3, 0x4b, 0x17, 0xac,
> +			       0x4b, 0x17, 0xac, 0x00, 0x19, 0x19);
> +	mipi_dsi_dcs_write_long(&ctx, 0xfc, 0xa5, 0xa5);
> +	msleep(61);

mipi_dsi_msleep

> +
> +	/* Dimming Setting */
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb0, 0x06);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb7, 0x01);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb0, 0x05);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb7, 0x13);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb0, 0x01);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb7, 0x4c);
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0xa5, 0xa5);
> +
> +	mipi_dsi_dcs_write_long(&ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
> +
> +	/* refresh rate Transition */
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0x5a, 0x5a);
> +	/* 60 Hz */
> +	//mipi_dsi_dcs_write_long(&ctx, 0x60, 0x00);
> +	/* 120 Hz */
> +	mipi_dsi_dcs_write_long(&ctx, 0x60, 0x10);
> +
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0xa5, 0xa5);
> +
> +	/* ACL Mode */
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_long(&ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);

_multi

> +	msleep(110);

mipi_dsi_msleep()

> +
> +	/* Enable backlight */
> +	mipi_dsi_dcs_write_long(&ctx, 0x9F, 0x5A, 0x5A);
> +	mipi_dsi_dcs_set_display_on(dsi);

_multi

> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_ENTER_NORMAL_MODE);

_multi

> +	mipi_dsi_dcs_write_long(&ctx, 0x9F, 0xA5, 0xA5);
> +
> +	return ctx.accum_err;
> +}
> +
> +static int samsung_amb655x_off(struct samsung_amb655x *amb655x)
> +{
> +	struct mipi_dsi_device *dsi = amb655x->dsi;
> +	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_write_long(&ctx, 0x9f, 0x5a, 0x5a);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);

_multi

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display on: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(20);

mipi_dsi_msleep

> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);

_multi

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display off: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(20);

mipi_dsi_msleep
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);

_multi

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +
> +	mipi_dsi_dcs_write_long(&ctx, 0x9f, 0xa5, 0xa5);
> +	msleep(150);
> +
> +	return ctx.accum_err;
> +}
> +

-- 
With best wishes
Dmitry
