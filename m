Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C9F8D115C
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 03:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F2310E197;
	Tue, 28 May 2024 01:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ja9OqeDq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D6710E197
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 01:13:15 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2e73359b900so2252531fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 18:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716858794; x=1717463594; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=36RWKNrP4AYHlU1TA6h/HdCgVv4/9cbRkwmUoeRlg5E=;
 b=ja9OqeDqnF4TWE3F6tckyDCTlSGdhnEOg75f0IDNnhB9SrsI6GFeqd53R3mAv9lafw
 B1H1SEsSUThBhSSpwY/quQ/MuzS71eZEdcGCc/vho2SCCEVIqUqfShFkaOVRKVXkK0Iv
 vhrbHpUd/UnpSvqHH4lPamnH/X+o2WrCTeWjX/a6oCKv9TylGvikoyyrB5JBAplvsSo0
 sZNKoRIhfJza0gLZS5sU50fH9UOIo8LGbLz7XFS94Uy8T8MymATR8gfc2r8gaKYo1LnL
 PLK8o3vYRwvgMH7rJLdbiqo11kzwlkkVNx4HHsIloba3TR6pmyTHrdVqMxLdmb9j7Nr3
 CE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716858794; x=1717463594;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=36RWKNrP4AYHlU1TA6h/HdCgVv4/9cbRkwmUoeRlg5E=;
 b=Nk0eHUE0ibi8ozqC461NbibUKnu15tuQA2flZhOrRuaLz02avfA6ldGi/cjjC2SmTT
 eNP+K+cBGeenB/ECDzDP5Rl3tVLV+Q//9QpziyQ6jVZUGxOJCiKehLVOyRfgj0OLPNCh
 AyA1AhG8/ouVuut1o4IQ7X6jivStFpUMFYrzEEJY2MjSLm9+tJcKcw7RasyPQ4npLwtG
 9Bg7h5c+8vao4iGEFD0XcbeKQXLaNW/xe+YHBFHZGjJTfJybtJY6biZkyKWIEIKjKg5a
 NO2E1mF+ayM1mQWdakDm9MiiQqlm+k87S3AJeWsr8MfakG5kyLa3OjyC680F5Lda4aJm
 3hFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXp0nq8yH6MRA5yn2mZ8IiDR982WwNSoXcio3IWF8UNYrbI1zAcqxVqZ3KCNiov+g8tcf3G4USnJJDRF34mOHsVMY2snOeS3SpRCv2SSB4
X-Gm-Message-State: AOJu0YwBzI3D2P9D61cVqnX6MG6gLeTw7qZoeQXNuiZyZy7DZJ84Zz0L
 2kkgPA2fbUI40V+zmsOg0Mk83MN14p1csgzZjtzQDVLezSV/lyOmRhovQcZnx2w=
X-Google-Smtp-Source: AGHT+IEN86uEmRXPd/YXZpiSabVNLGJ0NRRyZEDeYQryIaeW7O66HdesM9dufy1dM+sALrWTmKCkXA==
X-Received: by 2002:a2e:a7d1:0:b0:2e9:6346:143f with SMTP id
 38308e7fff4ca-2e963461b48mr63626491fa.45.1716858793821; 
 Mon, 27 May 2024 18:13:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bdcd1fcsm21150271fa.87.2024.05.27.18.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 18:13:13 -0700 (PDT)
Date: Tue, 28 May 2024 04:13:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 DRI <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Subject: Re: [PATCH v2] drm/bridge: simple-bridge: Add support for TI TDP158
Message-ID: <ddd5joylbkovcdogfwhvzaepd3d6wxsnccgvpq2x3h6fmpo2hk@2sitzl6bjt7d>
References: <b41f2f86-0d99-4199-92a9-42cbb9d6a6d5@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b41f2f86-0d99-4199-92a9-42cbb9d6a6d5@freebox.fr>
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

On Mon, May 27, 2024 at 06:06:05PM +0200, Marc Gonzalez wrote:
> From: Arnaud Vrac <avrac@freebox.fr>
> 
> The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver supporting
> DVI 1.0 and HDMI 1.4b and 2.0b output signals.
> 
> Since it's an I2C-programmable bridge, it could have a proper driver,
> but the default settings work fine, thus simple bridge is sufficient.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
> Change in v2: send from correct address
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index 5813a2c4fc5ee..b138279864750 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -292,6 +292,11 @@ static const struct of_device_id simple_bridge_match[] = {
>  			.timings = &ti_ths8134_bridge_timings,
>  			.connector_type = DRM_MODE_CONNECTOR_VGA,
>  		},
> +	}, {
> +		.compatible = "ti,tdp158",
> +		.data = &(const struct simple_bridge_info) {
> +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,

Bindings please. Also, note that per the datasheet the bridge uses two
supplies, Vcc for 3.3V and Vdd for 1.1V, so it doesn't fully fit the
simple-bridge.c (which might need to be adjusted for the second supply).
Chapter 7.3.2 of the datasheet points out that Vcc should be brought up
before Vdd.

> +		},
>  	},
>  	{},
>  };
> -- 
> 2.34.1

-- 
With best wishes
Dmitry
