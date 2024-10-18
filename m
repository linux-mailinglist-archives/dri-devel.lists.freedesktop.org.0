Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E889A3DF3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 14:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64C110E110;
	Fri, 18 Oct 2024 12:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TZCTyURO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F07510E110
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 12:15:07 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2fb5740a03bso24289331fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729253706; x=1729858506; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QjL3pHhlawZmked9cDer2cCqaq7RfeznftLlGVpNcgU=;
 b=TZCTyUROLHYob1z+B2BzQD1GY9Vev4sV21gfe04CquJAcaoCZjuDN9/4ZFN5PEcdus
 uxPVZH5s4Ehypk7a/ZmNYhJAf0nBjzwiHmQG8cVs6IsGudG3rgntq3fEApg7eMxnS9vP
 BfVjncdzVyGpmIQFTgJ4p7+A3dunMyAyt4CZtKrWXTmZU4fam1bNAgRhG7RP8mmChQKY
 /GjzCJPMd/ywwIqpwvzPkXrwrc5D0qMnu2aJ4oxMvIIN8A5zMGjiIJRRHuX1jIbTCocY
 5yR5PItwpLk5Fy9Cyg3uYlr9tbWvvACwZoUNnHzvAK7HsAXHzMbMIVEn68I4KZpMvY8Q
 g4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729253706; x=1729858506;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QjL3pHhlawZmked9cDer2cCqaq7RfeznftLlGVpNcgU=;
 b=QwKus4KKSMgCpnUqCOkS3Zn09cLKwVWszefPVpt1RsHaDXxdd3Nm5QohJuMt2EO4Uu
 9yqmezbsMR7EApJxmSncVMITfYIQ/X7xew2fE4Dss0+gaCxJWAnLoc6sqpZj/LWetMSz
 V3BB97B/ygus87psmaPEQ+qoeA3bQv9yD+r7y+SGQcznqn+c/1taw+4xzSyZijFfw/OB
 e7KiUQAolz4ZVfoXPSc6LSBmbpzH2wQBCDedW9Dkhs1DY+ZzEfgbRBEMvHy4YebLGWmG
 tOM46+TJqe7+8nZg/8X/kb91dnfUseo0YGuufAxKLQX/HX5Aghjk4W1eyKdcR7A1lHI3
 KB1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhCfaHx+32+b535sPOMtMnl+aWHLXj00UmKU3/UUDHHXdIlYu7MyW3k0XijdsYJR1CMIYk8BHUztQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo68XFMxaJj/+FDddOYF4UDr6X8nbTUttUKVgrGF4GQy59fOj6
 iqjOImjUMZ5BHqS9YP4/Cm11JzK+aVXJU72tOGkUR2T4r29w6yYOrO05Bn7w/Fg=
X-Google-Smtp-Source: AGHT+IF5eDKvPUdoitD+7fdWywacF4U/7oQTrEfnwaNWZvVwt8eJAqa0dkV02VzR/63JN4AWDeU6JA==
X-Received: by 2002:a05:651c:b13:b0:2fb:569a:553d with SMTP id
 38308e7fff4ca-2fb8323b1fdmr11544041fa.42.1729253705640; 
 Fri, 18 Oct 2024 05:15:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb809f9b62sm2015311fa.96.2024.10.18.05.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 05:15:04 -0700 (PDT)
Date: Fri, 18 Oct 2024 15:15:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, marex@denx.de, stefan@agner.ch
Subject: Re: [PATCH 5/5] drm: lcdif: Use drm_bridge_connector
Message-ID: <7isauhmti3vtyseanqveizlhrwmg2iade6kixhhx27edfk4bbm@yj4mekgbvpj4>
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-6-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018064813.2750016-6-victor.liu@nxp.com>
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

On Fri, Oct 18, 2024 at 02:48:13PM +0800, Liu Ying wrote:
> Initialize a connector by calling drm_bridge_connector_init() for
> each encoder so that down stream bridge drivers don't need to create
> connectors any more.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 17 ++++++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 264e74f45554..06c95e556380 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -27,6 +27,7 @@ config DRM_IMX_LCDIF
>  	depends on DRM && OF
>  	depends on COMMON_CLK
>  	depends on ARCH_MXC || COMPILE_TEST
> +	select DRM_BRIDGE_CONNECTOR
>  	select DRM_CLIENT_SELECTION

Missing `select DRM_DISPLAY_HELPER`. LGTM otherwise.

>  	select DRM_MXS
>  	select DRM_KMS_HELPER
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index 58ccad9c425d..d4521da6675e 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -16,7 +16,9 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_client_setup.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fbdev_dma.h>
> @@ -56,6 +58,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>  		struct device_node *remote;
>  		struct of_endpoint of_ep;
>  		struct drm_encoder *encoder;
> +		struct drm_connector *connector;
>  
>  		remote = of_graph_get_remote_port_parent(ep);
>  		if (!of_device_is_available(remote)) {
> @@ -97,13 +100,25 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>  			return ret;
>  		}
>  
> -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> +		ret = drm_bridge_attach(encoder, bridge, NULL,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  		if (ret) {
>  			of_node_put(ep);
>  			return dev_err_probe(dev, ret,
>  					     "Failed to attach bridge for endpoint%u\n",
>  					     of_ep.id);
>  		}
> +
> +		connector = drm_bridge_connector_init(lcdif->drm, encoder);
> +		if (IS_ERR(connector)) {
> +			ret = PTR_ERR(connector);
> +			dev_err(dev, "Failed to initialize bridge connector: %d\n",
> +				ret);
> +			of_node_put(ep);
> +			return ret;
> +		}
> +
> +		drm_connector_attach_encoder(connector, encoder);
>  	}
>  
>  	return 0;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
