Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C749A3E73
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 14:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7B710E901;
	Fri, 18 Oct 2024 12:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e3bE0oQm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F3D10E901
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 12:31:25 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539fb49c64aso3016320e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729254683; x=1729859483; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8AGZam4n06viI04ibKwIHu8ebEmTULIu0XIfkMmLleM=;
 b=e3bE0oQmQp+x7mw263M124Z+iDlLmyiooOLfQny01hXTXBRetifCQe/CREqDYG3G6k
 dlPTxyn6vXqxuJtujBdqB/FJPzf3PUEi5sEa95DMxEPqZ+R4FV0broKYgmaB9DNDnmvT
 NSZLl0/i3FF409IjDw5Ltl1BvJDxoa9IvJextZDNRBVkXWH5vq2mr82o2RzG2CtmPkTy
 iaDUvpaI7v2HYpD7ZPys18WNdK8F6LMSDwt//qd4jEdctfUak75gow3JApCKwkl+2D9h
 2gn3IAIF8TZb1El9/kJRFoV1GALWwWW8lOEihVRDFnnHRm9N89VNrzBlqEM3nIlIxmv/
 tXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729254683; x=1729859483;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8AGZam4n06viI04ibKwIHu8ebEmTULIu0XIfkMmLleM=;
 b=ETWuSZDbh82iizGwFlwdKIhDaicehdSd7JxN2cfT/lcokTpyzD90cBjX9cpngz25qF
 AQm+UNtJvy5o294iWcz/3io5BM+N3Q0UWCkEsVWt4MtJEK8O/j2hy+2yY1/D3AWCvBE1
 wcRIW77rvHnREEnwhLAyg20RvNjEwMHXzY3rRdAzjs7nZVbqBoF8zfOJPwqVG4/RKD5k
 hqAz6BoFOMNhsW/bf40az9sRFlqODsHCi+ve6nSHinOzvYMQ40E93ciR/l9UhyS2+AWC
 mGG1WeW/0yAsQgYcrvUStav+pk+UGhIdBVAKK8YAAc+aG8gCeOy8VeLpNueWjtwBlUwD
 Oapg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK+HlyRnGOyqop/H9FsDpzmRKuFTRoTCOTXM5R+nmoj/Wg2LV8+iWb1b61c3LM3Hk9JGhC4VwG0ts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe8C/jqqq+QcKgnZNJVTgWfua36H3kAZE+oIcoweJ5kWayIdJ7
 zhAWNtV/B7c/jSXQQs90bhmoRNiLksvNXFzvWOh+hZ/BFPYvLpNLWXPs41iVCHE=
X-Google-Smtp-Source: AGHT+IF5+uQbidjUeJm/YIP54JRQhHenrE8LF08c1wGN7AL7hbF7Y70yrjPM2DsLa+7UkJwLWiqkDA==
X-Received: by 2002:a05:6512:1384:b0:53a:64:6818 with SMTP id
 2adb3069b0e04-53a154c9d93mr2164357e87.47.1729254683205; 
 Fri, 18 Oct 2024 05:31:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a1521fecdsm206273e87.298.2024.10.18.05.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 05:31:22 -0700 (PDT)
Date: Fri, 18 Oct 2024 15:31:20 +0300
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
Subject: Re: [PATCH 4/5] drm/bridge: imx8mp-hdmi-tx: Set output_port to 1
Message-ID: <vvsj6ri2ke25nzocbq736yv7rphzma6pn3yk2uh7iu43zfe2sa@2fwye4k4w6he>
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-5-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018064813.2750016-5-victor.liu@nxp.com>
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

On Fri, Oct 18, 2024 at 02:48:12PM +0800, Liu Ying wrote:
> Set DW HDMI platform data's output_port to 1 in imx8mp_dw_hdmi_probe()
> so that dw_hdmi_probe() called by imx8mp_dw_hdmi_probe() can tell the
> DW HDMI bridge core driver about the output port we are using, hence
> the next bridge can be found in dw_hdmi_parse_dt() according to the port
> index, and furthermore the next bridge can be attached to bridge chain in
> dw_hdmi_bridge_attach() when the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is
> set.  The output_port value aligns to the value used by devicetree.
> This is a preparation for making the i.MX8MP LCDIF driver use
> drm_bridge_connector which requires the DRM_BRIDGE_ATTACH_NO_CONNECTOR
> flag.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 8fcc6d18f4ab..54a53f96929a 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -96,6 +96,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(hdmi->pixclk),
>  				     "Unable to get pixel clock\n");
>  
> +	plat_data->output_port = 1;

This will break compatibility with older DT files, which don't have
output port. I think you need to add output_port_optional flag to
dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
is set, but there is no remote node.

Last, but not least, this changes behaviour of the connector.
dw_hdmi_connector_create() implements CEC support, handles
ycbcr_420_allowed, HDR metadata, etc.

We are slowly moving towards the supporting all of this in bridge
connector via the HDMI Connector framework, but this is not
implemented for now.

>  	plat_data->mode_valid = imx8mp_hdmi_mode_valid;
>  	plat_data->phy_ops = &imx8mp_hdmi_phy_ops;
>  	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
