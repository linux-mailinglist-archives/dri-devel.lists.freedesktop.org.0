Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A2D8D5630
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 01:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBA810E409;
	Thu, 30 May 2024 23:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sSgj45C8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929A610E409
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 23:21:12 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52b87505f01so294479e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 16:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717111270; x=1717716070; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YE7nBWRP2r6qptkkjnhfqlN+45c+PRv7G0Q2JOIxAzQ=;
 b=sSgj45C8aDeEXKTmdaOmiBpe3jNEcWSmGJpKsp0q/pie19flltnws5NQ9J09p+DUOJ
 2r00CqWdQuaLiW4uqaIHbgicwwrTC60feVrEbKSKil8+I8/MhC8FHnXKNLdsEhIz0K09
 wqDLU50C3fuCYYgJc/9roh2I2AvDGusyH/Tf6hZ8hNOQu+mQVquMePPPQI+3Gp3DqLKM
 EzgbAza91lR4by11nibd5+UTb0IMdCS49fbGWOhsekfSI938GU1pGWT+iPtjoMRZoTEp
 T1Z3Y4AQCSsDPDcNtHfN0a9VjhpxIGmUTvso7UPxz+yJGtg8GW3n69hRYxgMJ1Fg6KeC
 HUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717111270; x=1717716070;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YE7nBWRP2r6qptkkjnhfqlN+45c+PRv7G0Q2JOIxAzQ=;
 b=YsOb07TcIt5KgRbuUCtl5J/1gz5qtF0KFcycwWMSNX0Nfz6sY/nPtuZyiRBzHjoJ4O
 TezWRys1TdgMKUYnxwyinDj1rwJyk61m0o+SHjKk4b9uDtAHBTH0RmE4LMQvfIOyp0G5
 PP7lP2RQg0PV8fZk/ZzXCWeOYXGxUom8wdhoIOFsyHelhXQlNgGPnh/BqQkJjpL9EYGb
 NGFsAbYKQ6HYZvY1XIOaBUAN4B6Rk8cgha8y+HE5ZB45dV9QDoo5LmED76my2QrfMSdP
 7vC3E5OXx385v78LU3d9LN1nhet3qMhLOygYztaVURBh0uI3EmWtDFIPO22fpeKYFV00
 ytxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKi/r37iF4gG3WWZQJOadXgBBUatqK4s0VzF1euL/wiXHYKNHdRUw9pHnzq5qxWifEMhW/JVQsX6vnPN7Ik5MFzEa8J4mT/G4x+kbiqWg7
X-Gm-Message-State: AOJu0YwEEF20ahBDn7XSJdtWGZWof+aRPAyTRc2nIPXfW3wfYLyqtrzw
 Tlx4GoaJQTsQhWX+RJah2Ilyjjb8ZS15Y4e/GR6PTC8AK508KILQ4Bdz/vU/yxs=
X-Google-Smtp-Source: AGHT+IGSYTyCk7NZstVbr2ZMY+F7VW77DKpKIwwwGH/JGXdol+c9u1s5nysiBUlt9LCyDxtOBxQSfg==
X-Received: by 2002:a19:6a09:0:b0:523:8a14:9149 with SMTP id
 2adb3069b0e04-52b8956b5c9mr47305e87.21.1717111270420; 
 Thu, 30 May 2024 16:21:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d89c2dsm121896e87.258.2024.05.30.16.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 16:21:10 -0700 (PDT)
Date: Fri, 31 May 2024 02:21:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>, 
 Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH v2 7/9] drm/bridge: cdns-dsi: Support atomic bridge APIs
Message-ID: <4fsu5fa5zbrqgc5bepxscoenrax5c6p5b4eyomavioy3bhwuq3@rjjbur3v52e3>
References: <20240530093621.1925863-1-a-bhatia1@ti.com>
 <20240530093621.1925863-8-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530093621.1925863-8-a-bhatia1@ti.com>
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

On Thu, May 30, 2024 at 03:06:19PM +0530, Aradhya Bhatia wrote:
> Change the existing (and deprecated) bridge hooks, to the bridge
> atomic APIs.
> 
> Add drm helpers for duplicate_state, destroy_state, and bridge_reset
> bridge hooks.
> 
> Further add support for the input format negotiation hook.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 70 ++++++++++++++++---
>  1 file changed, 62 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below.

> 
> @@ -915,13 +920,62 @@ static void cdns_dsi_bridge_pre_enable(struct drm_bridge *bridge)
>  	cdns_dsi_hs_init(dsi);
>  }
>  
> +static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
> +					       struct drm_bridge_state *bridge_state,
> +					       struct drm_crtc_state *crtc_state,
> +					       struct drm_connector_state *conn_state,
> +					       u32 output_fmt,
> +					       unsigned int *num_input_fmts)
> +{

This code below looks pretty generic. Would be logical to extract it to
a helper and allow it to be used by other DSI host bridges?

> +	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
> +	struct cdns_dsi *dsi = input_to_dsi(input);
> +	struct cdns_dsi_output *output = &dsi->output;
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	switch (output->dev->format) {
> +	case MIPI_DSI_FMT_RGB888:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +
> +	case MIPI_DSI_FMT_RGB666:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
> +		break;
> +
> +	case MIPI_DSI_FMT_RGB666_PACKED:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X18;
> +		break;
> +
> +	case MIPI_DSI_FMT_RGB565:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB565_1X16;
> +		break;
> +
> +	default:
> +		/* Unsupported DSI Format */
> +		return NULL;
> +	}
> +
> +	*num_input_fmts = 1;
> +
> +	return input_fmts;
> +}
> +

-- 
With best wishes
Dmitry
