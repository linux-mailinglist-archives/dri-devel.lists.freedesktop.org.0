Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEC9916A56
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F1F10E67A;
	Tue, 25 Jun 2024 14:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uFtuS6KG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA2710E67A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:30:04 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52cdd03d6aaso3470434e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719325802; x=1719930602; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TIW+BEEpFZxcaSiuFdd6E7EOCLgPKt/xKVONfeyzByw=;
 b=uFtuS6KG5W4PzZAdN06ob7SxJezcx2d6OIeHBla0qrOJz6Time0kc8iwFDbHApAcDw
 TL+MQSxNvWozltkTiF8t2SxtDRlxfQ+Y9V+mTZo8Tzj8fugMYMSJY2+mlqjS0kNFLlXY
 waeSUwBxoDdQAddyFffsT+XB5uOkvmWep+4kBZAmjVET1tZxNeMDfidbTgvPCmnO0hET
 1gxPdlhGSvcwrCYrfGWclXkObBbmI+dEmW0ccsCksKw7BtUm/8qr3r+u2+7AcAJLfAFX
 c/AcyWSw3ETHUi0k5hMf6IJlBqeg37SmCeSuts/mtjp1sIxhAHzU1zMa15MpvGMfwXWh
 9hbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719325802; x=1719930602;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIW+BEEpFZxcaSiuFdd6E7EOCLgPKt/xKVONfeyzByw=;
 b=tUDfyF8xjG00wwmfET/PYHzMkcg02bjE+HR2AWsQAzhegH2sG5y3ekuYA7o0zKTzKZ
 +TLpCeuOoofMyuOTN8jEmPjIqVs/T3ylgsbIYIXhmZk1CWSXnVPxRVzs0q3liUfJ2lJx
 EAWaGLmJeRjgW7bYmR2w3EhpMtgDJkPCYHaVER30qoTcDqIwdgxiD+m6OxImgRqB4vGl
 +JWVy5fc1SaQpr6fb7+AgHs+y1CSIdpTU7NwXDrZbUZp2sKcimcUZ1Zj20b/c4hsBR5e
 ya15VLc6ukONyHm6uk6dZg/aYcGSJLNjXHDePxfSsgoQerU7mPNgya8WzG3Fe2ZPLLS3
 WpLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKU0B55TdpkU5k1hXKEPpX++/XNMBt8hbnt9Xe1YEXCH7b7uGr6wJdih+S6QprqoKHcy5+l545UXEzBF3SXLW8+mp+YqFkxK3IrHEGE7p0
X-Gm-Message-State: AOJu0Yx7o2hdFzElDJ3rCeVgANlRomDqXBhwWx3b/P4NFs9Fj2HC2JRz
 kbs1duQKsuyJtzXj1sZAoFugs3V9H2iiveQ9bq+bimtkAa+OrGos499aK21MZjI=
X-Google-Smtp-Source: AGHT+IHZ8OaLyMHtv2S65EE9rCSfAJ0Z6PqtA32z4W6qeFVbOuiH5///ycCmgXTPqmIPXgTzGR093g==
X-Received: by 2002:a19:9115:0:b0:52c:df63:bebd with SMTP id
 2adb3069b0e04-52ce0673528mr5256172e87.49.1719325801936; 
 Tue, 25 Jun 2024 07:30:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63bd28dsm1258950e87.92.2024.06.25.07.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:30:01 -0700 (PDT)
Date: Tue, 25 Jun 2024 17:29:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>
Subject: Re: [PATCH 2/2] drm/panel: add Ilitek ILI9806E panel driver
Message-ID: <d23fsb53p2at6rldkkolujgjfmbxpc7ulbsd5cak3pksacsvk7@b37rq4vnskjl>
References: <20240625133317.2869038-1-mwalle@kernel.org>
 <20240625133317.2869038-3-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625133317.2869038-3-mwalle@kernel.org>
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

On Tue, Jun 25, 2024 at 03:33:17PM GMT, Michael Walle wrote:
> The Ortustech COM35H3P70ULC panel is based on the ILI9806E DSI display
> controller.
> 

[...]

> +static int ili9806e_get_modes(struct drm_panel *panel,
> +			      struct drm_connector *connector)
> +{
> +	struct ili9806e_panel *ctx = to_ili9806e_panel(panel);
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, ctx->desc->display_mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);

drm_connector_helper_get_modes_fixed(), please.

> +
> +	return 1;
> +}
> +

-- 
With best wishes
Dmitry
