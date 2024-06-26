Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA67917C2F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 11:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8BB10E7F5;
	Wed, 26 Jun 2024 09:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UaJX5dVP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BAF10E7F5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:15:34 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52ce674da85so3307160e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 02:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719393332; x=1719998132; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qqYdOJxs+VFbdv5Sum02xSfIfK4O1Ds0i5uQR9Cc/Lg=;
 b=UaJX5dVPWQwnwHkmk95DrfdUtosYk1ze9MLEwGkTgNsrPeZ1HjPa1o+jlufajckiP9
 j8JMWpg8VY0FCVQ9fDhgiWCNGt91eBsPIQxthtAe3uXYVMMRpDff1FwXYyMe4bk6FxLQ
 7R4KioOzAfDRDy/aMNlDy7PBpsG0JoIkYntunQbAQw2ePA37VGQwyXIMrW1yO7Akrg/L
 3xPYBe91b1/KhR0uiwATqsWr+59W5zIRb4OumTKwtOwO1kdsPHZcVyw2UW1Og+DWFBty
 LcOlqrMH3LTjTzHmTXcDhdfj7c9f+56VUDeb8cEBrDug/UAScb1ULofxxnUHGzRkfm32
 1WQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719393332; x=1719998132;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qqYdOJxs+VFbdv5Sum02xSfIfK4O1Ds0i5uQR9Cc/Lg=;
 b=VQPsOkIXjbKyQTzKeo6CPSoF5KMh9m4zv33ZQoESnN1bF5aovF46wihnKWEAR7HoiG
 JlK/cGU3NC8SoT37GdNmVX3yrv3YdS9cE+6D9/om5sT8QaKBxke134a1s2z/q1PNLDZj
 Ip4gNKURqufCwpMNCyoIDHHexmc8a5pXnV5oyy7XlNJm0eQzKJ8tlzaimfLlHUsn8IZ7
 F2KKFw66rAnK698TU3AXFcrBQVj0ThWGfgcSvTwI7gh/5oZB/eD11mfPG1j2okN81tM9
 Er1NGnSPkj8Dq0eeRz7mJ7YyhG1XPGwGSIeYqKI6Iytq9wm7+dQtLSvEB3QNeQCcqhgj
 +b4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBW0fYSrs1wPSmrPmaoAHBbYORoRVJXSYTjUCOz/dpO+UVVNw5cP2ksVskt9GoOXrHimItr7gGSQBLAGzPCu9nG9XuDY5IWNdvpl4uQc+X
X-Gm-Message-State: AOJu0YwtgGAgJ9Y1s5P/7ConLzhfK7lX/PftmmUOSJgaW7w5TbEM+DAG
 YS6INiFZ0Iuqyp2zYArTLKrwsjURDOLSl9MLlXUr/jaXK6CpKCZt5iaQeBV79oo=
X-Google-Smtp-Source: AGHT+IEoPEZ+Z1GDHwYgi6YwL3Dp42WEH58e9eBo3wjc+0KVQYyGcZlw/ZsNg8ZiVT7ZuwxnNv3rXg==
X-Received: by 2002:a19:e014:0:b0:52c:dfe6:6352 with SMTP id
 2adb3069b0e04-52ce185db23mr7675461e87.48.1719393332427; 
 Wed, 26 Jun 2024 02:15:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd641f655sm1496404e87.162.2024.06.26.02.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 02:15:31 -0700 (PDT)
Date: Wed, 26 Jun 2024 12:15:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/panel: add lincoln lcd197 support
Message-ID: <xc4laokjirwetexrcgfxq4kk3wrqn2i7k2kiqe7ivylhgmjw3w@pwwde5mlwxit>
References: <20240625142552.1000988-1-jbrunet@baylibre.com>
 <20240625142552.1000988-4-jbrunet@baylibre.com>
 <irzer3be5fj2rg2bmc2oqxqtaw6jybbdkgv3jgxpyhdvojwv24@e4i2v6d454nz>
 <1jmsn8gjq6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jmsn8gjq6.fsf@starbuckisacylon.baylibre.com>
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

On Wed, Jun 26, 2024 at 11:02:25AM GMT, Jerome Brunet wrote:
> On Wed 26 Jun 2024 at 07:41, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On Tue, Jun 25, 2024 at 04:25:50PM GMT, Jerome Brunet wrote:
> >> Add support for the Lincoln LCD197 1080x1920 DSI panel.
> >> 
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  drivers/gpu/drm/panel/Kconfig                |  11 +
> >>  drivers/gpu/drm/panel/Makefile               |   1 +
> >>  drivers/gpu/drm/panel/panel-lincoln-lcd197.c | 333 +++++++++++++++++++
> >>  3 files changed, 345 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/panel/panel-lincoln-lcd197.c
> >> 
> >
> > [...]
> >
> >> +
> >> +	mipi_dsi_dcs_write_seq(lcd->dsi, 0xB9, 0xFF, 0x83, 0x99);
> >
> > - Please use lowercase hex instead
> > - Please consider switching to _multi() functions.
> 
> Could you be a bit more specific about these '_multi' function ?
> I've looked at 'drm_mipi_dsi.h' and can't really make what you mean.
> 
> Maybe I'm not looking in the right place.

What is your baseline? Please see commits 966e397e4f60 ("drm/mipi-dsi:
Introduce mipi_dsi_*_write_seq_multi()") and f79d6d28d8fe
("drm/mipi-dsi: wrap more functions for streamline handling") (and
66055636a146 ("drm/mipi-dsi: fix handling of ctx in mipi_dsi_msleep") as
it fixes a mistake in those two).

> 
> >
> >
> >> +	usleep_range(200, 300);
> >
> > This will require new helper msm_dsi_usleep_range(ctx, 200, 300);
> 
> I don't really understand why I would need something else to just sleep
> ? Could you add some context please ?
> 
> Isn't 'msm_' usually something Qcom specific ?

Yes, mipi_dsi_usleep_range(). Mea culpa.

> >> +	mipi_dsi_dcs_write_seq(lcd->dsi, 0xB6, 0x92, 0x92);
> >> +	mipi_dsi_dcs_write_seq(lcd->dsi, 0xCC, 0x00);
> >> +	mipi_dsi_dcs_write_seq(lcd->dsi, 0xBF, 0x40, 0x41, 0x50, 0x49);
> >> +	mipi_dsi_dcs_write_seq(lcd->dsi, 0xC6, 0xFF, 0xF9);
> >> +	mipi_dsi_dcs_write_seq(lcd->dsi, 0xC0, 0x25, 0x5A);
> >> +	mipi_dsi_dcs_write_seq(lcd->dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x02);
> >> +
> >> +	err = mipi_dsi_dcs_exit_sleep_mode(lcd->dsi);
> >> +	if (err < 0) {
> >> +		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
> >> +		goto poweroff;
> >> +	}
> >> +	msleep(120);
> >> +
> >> +	err = mipi_dsi_dcs_read(lcd->dsi, MIPI_DCS_GET_DISPLAY_ID, display_id, 3);
> >
> > This probably needs new _multi helper too.
> >
> >> +	if (err < 0) {
> >> +		dev_err(panel->dev, "Failed to read display id: %d\n", err);
> >> +	} else {
> >> +		dev_dbg(panel->dev, "Display id: 0x%02x-0x%02x-0x%02x\n",
> >> +			display_id[0], display_id[1], display_id[2]);
> >> +	}
> >> +
> >> +	lcd->prepared = true;
> >
> > Should not be required anymore.
> 
> The whole driver is heavily inspired by what is already in
> drivers/gpu/drm/panel/ and a lot are doing something similar.
> 
> Maybe there has been a change since then and the existing have been
> reworked yet. Would you mind pointing me that change if that is
> the case ?

See d2aacaf07395 ("drm/panel: Check for already prepared/enabled in
drm_panel")

> 
> >
> >> +
> >> +	return 0;
> >> +
> >> +poweroff:
> >> +	gpiod_set_value_cansleep(lcd->enable_gpio, 0);
> >> +	gpiod_set_value_cansleep(lcd->reset_gpio, 1);
> >> +	regulator_disable(lcd->supply);
> >> +
> >> +	return err;
> >> +}
> >> +
> >
> >> +
> >> +static const struct drm_display_mode default_mode = {
> >> +	.clock = 154002,
> >> +	.hdisplay = 1080,
> >> +	.hsync_start = 1080 + 20,
> >> +	.hsync_end = 1080 + 20 + 6,
> >> +	.htotal = 1080 + 204,
> >> +	.vdisplay = 1920,
> >> +	.vsync_start = 1920 + 4,
> >> +	.vsync_end = 1920 + 4 + 4,
> >> +	.vtotal = 1920 + 79,
> >> +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >> +};
> >> +
> >> +static int lincoln_lcd197_panel_get_modes(struct drm_panel *panel,
> >> +					  struct drm_connector *connector)
> >> +{
> >> +	struct drm_display_mode *mode;
> >> +
> >> +	mode = drm_mode_duplicate(connector->dev, &default_mode);
> >> +	if (!mode) {
> >> +		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> >> +			default_mode.hdisplay, default_mode.vdisplay,
> >> +			drm_mode_vrefresh(&default_mode));
> >> +		return -ENOMEM;
> >> +	}
> >> +
> >> +	drm_mode_set_name(mode);
> >> +	drm_mode_probed_add(connector, mode);
> >> +	connector->display_info.width_mm = 79;
> >> +	connector->display_info.height_mm = 125;
> >
> > drm_connector_helper_get_modes_fixed()
> 
> Thanks for the hint
> 
> >
> >> +
> >> +	return 1;
> >> +}
> >> +
> >
> >
> >> +
> >> +static void lincoln_lcd197_panel_shutdown(struct mipi_dsi_device *dsi)
> >> +{
> >> +	struct lincoln_lcd197_panel *lcd = mipi_dsi_get_drvdata(dsi);
> >> +
> >> +	drm_panel_disable(&lcd->panel);
> >> +	drm_panel_unprepare(&lcd->panel);
> >> +}
> >
> > I think the agreement was that there should be no need for the panel's
> > shutdown, the DRM driver should shutdown the panel.
> 
> I'm happy to drop that if there is such agreement. Again, most panel
> drivers do implement that callback so I just did the same.
> 
> Could you point me to this 'agreement' please, so I can get a better
> understanding of it ? 

Quoting one of commit messages:

    It's the responsibility of a correctly written DRM modeset driver to
    call drm_atomic_helper_shutdown() at shutdown time and that should be
    disabling / unpreparing the panel if needed. Panel drivers shouldn't
    be calling these functions themselves.

I could not describe it better.

-- 
With best wishes
Dmitry
