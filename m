Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B969FF017
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 16:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D6010E07B;
	Tue, 31 Dec 2024 15:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sK6rH8pN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5EC10E07B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 15:05:03 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb4so10305467e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 07:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735657442; x=1736262242; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wSbYedxgsZDo1h/bnCTgqN5CKNk8NG3PCiX/15LxWXU=;
 b=sK6rH8pNXV2zCwbzDIqsmv7ZMQ0ZAkBqXkVzLZ6WgAaCMbNT53xDhdhGFczIVE4Oz4
 0t6R5V8RfG/yuA3iLvPFrZ84xPrYlvf/uOnOVK4m7IUwe9NbPhksRuLjktREOkmT2x+E
 ZiUga5WNB+9aiwk1sTACOh12tjwiSTLBdc6RhWQ3Qnp1C+mKHrs9+lVClZUZosT+jJ2u
 H+kKqEBnJOgdIrXV/Nf+B5vPR3TSZmsmtrD7dMJuOFCjt56A3dwcUgS6+4EbFYMVw+qU
 mbNGNbZSpfeB9M9Q1W05l0uYRGzunCXfGQMPgWAvLshWAbKGgGO4v70K5vGLHR+Yory0
 5vpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735657442; x=1736262242;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wSbYedxgsZDo1h/bnCTgqN5CKNk8NG3PCiX/15LxWXU=;
 b=pTE6qOblX7fJI2/rePnsDYpeTB3aKcHOK1qxhViw+fFEF+WRFjHzZI3UfVeY0hTgVc
 AS5p/ZX5zSsje3m1sDJdOFSchi9JNgWj3kK/iho1W5GjPVgCD3mNFFheFlmhBrhvkbjz
 bxZf10X60YKLgnkT/j7/BCFMALuc0iuhY1Es33CoD3Zz6dlGXKB+bMO3fknaM6GlFIcM
 YeZnJu+j+IR96Gk/pMDYznhjL2aPG9KE19eY801r3rmPSxrlJUNJ+cJAmVci/aioagE6
 U/B6++DFuW0D2TB4h4c6AX9TeARoNNHQTd05zJizSTan31sUgRnrSFdqhcqKv4dYY5gM
 k3RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnIxEAifEaRy0n0NdQ8N3uo85eSa/dKvjrsgTrqjOM/EHZtqETpADLBV2cEmDNgsR3X4e+3X7cd+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9jIGf5SUXQoMkKuKZOtxg1gJPAmdl5BHiHuJucKI1V4I9Zthl
 PoxYxQ9s6dhxuduliTkrPuhiT10PAwOXchCUnOOb+3p/vniepAl5UIbaaI43Cw4QRUDNl174pby
 N
X-Gm-Gg: ASbGnctrLeLUDwTbelBlZB23Ue6glhbxS6HZZnfNtr8XfGXWVYs3ZCQUYVH0xShjI7x
 wN7NFYUaQLUuSZ/wAWQ9LoruTYxicKpAe0+YoRK6SqvQ/njmfdlzDJm2zi0XqMCqASX9Giv2PQW
 cp7UBRdVYbDhTsfouf6hmgbAdB21c37T9/HRzm2n+6TtSd/rH6JCuEDfAJSa2ZfE01cUY8xeKEx
 Gxz0SSnu51fgIiDfI8nnv5v/45RzQSqEHRtg+1mCHzz2e3WMUJK2/UXW/2Y+ZrofO6ycaQN2OC3
 QA+GyeVJfunwcI/V5tiHUlE1kYA0zDie+0Lw
X-Google-Smtp-Source: AGHT+IH0ONmDCEhLlEHy2uzXj//HEUZ4rdSJ/dCjW71fZ1AXASnnybyibGKtvWTX2k1vh0XHCssuRw==
X-Received: by 2002:a2e:be06:0:b0:302:16da:a052 with SMTP id
 38308e7fff4ca-3046860d39dmr113148231fa.27.1735657104745; 
 Tue, 31 Dec 2024 06:58:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b083ebbsm37802501fa.115.2024.12.31.06.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2024 06:58:23 -0800 (PST)
Date: Tue, 31 Dec 2024 16:58:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 09/10] drm/bridge: samsung-dsim: refcount the out_bridge
Message-ID: <anuafemrtp2wsksuhw4snigkmlki2qdehqj3s56pgyc4lfd2cw@pgs4aiwkbguk>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-9-173065a1ece1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231-hotplug-drm-bridge-v5-9-173065a1ece1@bootlin.com>
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

On Tue, Dec 31, 2024 at 11:40:03AM +0100, Luca Ceresoli wrote:
> Refcount the out_bridge to avoid a use-after-free in case it is
> hot-unplugged.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v5.
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index c4d1563fd32019efde523dfc0863be044c05a826..4d32c453265931b5aecdc125623368fecacf4be3 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1756,6 +1756,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  		return ret;
>  	}
>  
> +	drm_bridge_get(out_bridge);

Well... out_bridge might already be gone now. You got the pointer, but
it is not protected in any way. Gone.

>  	dsi->out_bridge = out_bridge;
>  
>  	DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
> @@ -1774,13 +1775,13 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
>  		ret = samsung_dsim_register_te_irq(dsi, &device->dev);
>  		if (ret)
> -			return ret;
> +			goto err_put_bridge;
>  	}
>  
>  	if (pdata->host_ops && pdata->host_ops->attach) {
>  		ret = pdata->host_ops->attach(dsi, device);
>  		if (ret)
> -			return ret;
> +			goto err_put_bridge;
>  	}
>  
>  	dsi->lanes = device->lanes;
> @@ -1788,6 +1789,10 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  	dsi->mode_flags = device->mode_flags;
>  
>  	return 0;
> +
> +err_put_bridge:
> +	drm_bridge_put_and_clear(dsi->out_bridge);
> +	return ret;
>  }
>  
>  static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi)
> @@ -1804,7 +1809,7 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
>  	struct samsung_dsim *dsi = host_to_dsi(host);
>  	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
>  
> -	dsi->out_bridge = NULL;
> +	drm_bridge_put_and_clear(dsi->out_bridge);
>  
>  	if (pdata->host_ops && pdata->host_ops->detach)
>  		pdata->host_ops->detach(dsi, device);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
