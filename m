Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5493099C0C9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 09:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A41510E1FA;
	Mon, 14 Oct 2024 07:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qf9UNn7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB0A10E0FA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 07:10:25 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2fb443746b8so5176401fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728889824; x=1729494624; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vaSk6MvJTraXtkEXPaCgc+gi7dKimM6BaWMyPcB8SXg=;
 b=qf9UNn7tTiE+SH9YnR6mviSEdpptuq9FvMh9r76tbSguYOV7xEvA/ewWMqVJaSpv1H
 GDnTSKopMdNMy+QYkMfu691oPZ4yHOLoBkopcEzSCC9j27+hZAuNvUDiSizy7VnDj7Om
 PkArdLP6T7WlLA4wxPsndVrtmEYKtOgGfXPCn226D/b3huEvYrld0pngYyHIDskCtesL
 kfQ8HzejWEXlEHdVrmjp5t4pvHg4CnxCpw4A+kmK3XQT5KAsUErRCAjtD1eVfdAljBbx
 3RcentO1UutNa5htrLO6wulwebNWbqiXBQrGid+Q8JG21oHqNP2SkuToeDoTwYfs2gPQ
 apnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728889824; x=1729494624;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vaSk6MvJTraXtkEXPaCgc+gi7dKimM6BaWMyPcB8SXg=;
 b=EjyEfLM12xR+/nHVGnx+GZreKxWnQN2CWN5E+/+yK5L7CzdyMOtEX1gW7EQAR6PwnP
 DOWJ7xua7PLfkaVFIBYeokCJmwAZedHDRgeeAoA431ob307+soP0jpoQqsxeIF6vDeNx
 b2Ea2Ek5wSZqn4Se9ZkjZLnrcWvogd83a63QUJquGsWVRMCsic6ZDdJfIM7eaGma5MIc
 2iihpLoplNSaht95c8tm5vHwyM1nTd/RRgywqtUe8Y+PEzBI8ctG/1HqeGOVfdxF+sEc
 RLawt9IqRjmOsTbkQAVYeUSXDGPXvXr0Xzip1qPQTTXEoidkUOTIybIJbQmAUT3tXqCJ
 vLfw==
X-Gm-Message-State: AOJu0Yzaxnw0+VowqftBhercIB3+rYhpwCBqv/PlewkOVZmssDrxMVkP
 tU+ajUHYZdQGIMZCsvGIoEa9jgJTAhWQLdDXXJ3U3z5QvwKKRZghiF1R+zoMVWM=
X-Google-Smtp-Source: AGHT+IGAd9UjWxXud+NWbfMZgYsAU4lizOECIK9dLoFGOaFd9MGxBfs40mqKeTPH0r6byj/NCWRwuQ==
X-Received: by 2002:a2e:4e19:0:b0:2f7:ad6b:a31e with SMTP id
 38308e7fff4ca-2fb327a672emr38410631fa.31.1728889823683; 
 Mon, 14 Oct 2024 00:10:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb4aa297f7sm4681891fa.15.2024.10.14.00.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 00:10:22 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:10:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, 
 o.rempel@pengutronix.de, y.moog@phytec.de, marex@denx.de,
 isaac.scott@ideasonboard.com, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Message-ID: <dtloyyghjep5rm34qjjinvhvrar5jzj3n24czvpdmnkfesntjq@t2uijuez7myj>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-7-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012073543.1388069-7-victor.liu@nxp.com>
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

On Sat, Oct 12, 2024 at 03:35:40PM +0800, Liu Ying wrote:
> Add basic HDMI video output support. Currently, only RGB888 output
> pixel format is supported.  At the LVDS input side, the driver
> supports single LVDS link and dual LVDS links with "jeida-24" LVDS
> mapping.
> 
> Product link:
> https://www.ite.com.tw/en/product/cate1/IT6263
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * Add AVI inforframe support.  (Maxime)
> * Add DRM_MODE_CONNECTOR_HDMIA.  (Biju)
> * Rename it6263_reset() to it6263_hw_reset().  (Biju)
> * Check number of LVDS link data lanes.  (Biju)
> 
>  drivers/gpu/drm/bridge/Kconfig      |   8 +
>  drivers/gpu/drm/bridge/Makefile     |   1 +
>  drivers/gpu/drm/bridge/ite-it6263.c | 919 ++++++++++++++++++++++++++++
>  3 files changed, 928 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c
> 

[...]

> +static int it6263_parse_dt(struct it6263 *it)
> +{
> +	struct device *dev = it->dev;
> +	struct device_node *port0, *port1;
> +	int ret;
> +
> +	ret = of_property_read_u8(dev->of_node, "ite,lvds-link-num-data-lanes",
> +				  &it->lvds_link_num_dlanes);
> +	if (ret) {
> +		dev_err(dev, "failed to get LVDS link number of data lanes: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	it->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
> +	if (IS_ERR(it->next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(it->next_bridge),
> +				     "failed to get next bridge\n");
> +
> +	port0 = of_graph_get_port_by_id(dev->of_node, 0);
> +	port1 = of_graph_get_port_by_id(dev->of_node, 1);
> +	if (port0 && port1) {
> +		if (of_property_read_bool(port0, "dual-lvds-even-pixels") &&
> +		    of_property_read_bool(port1, "dual-lvds-odd-pixels")) {
> +			it->lvds_dual_link = true;
> +			it->lvds_link12_swap = true;
> +		} else if (of_property_read_bool(port0, "dual-lvds-odd-pixels") &&
> +			   of_property_read_bool(port1, "dual-lvds-even-pixels")) {
> +			it->lvds_dual_link = true;
> +		}
> +
> +		if (!it->lvds_dual_link) {
> +			dev_err(dev,
> +				"failed to get LVDS dual link pixel order\n");
> +			ret = -EINVAL;
> +		}

Please use drm_of_lvds_get_dual_link_pixel_order(), it validates that
the DT definition is sound: one port for odd pixels, one port for even
pixels.

> +	} else if (port1) {
> +		ret = -EINVAL;
> +		dev_err(dev, "single input LVDS port1 is not supported\n");
> +	} else if (!port0) {
> +		ret = -EINVAL;
> +		dev_err(dev, "no input LVDS port\n");
> +	}
> +
> +	of_node_put(port0);
> +	of_node_put(port1);
> +
> +	return ret;
> +}
> +

-- 
With best wishes
Dmitry
