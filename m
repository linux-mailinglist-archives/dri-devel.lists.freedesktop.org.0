Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A2999C15B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 09:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF72910E246;
	Mon, 14 Oct 2024 07:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eo2OoidV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B803A10E246
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 07:32:08 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2fad784e304so37869241fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 00:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728891127; x=1729495927; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0l5Vpt48y+wyU8Bmw/8CtDa7S7s/PIqP43uNSVoXr+M=;
 b=eo2OoidVPrbcYJuvPddRW8Q1zqZVh4wk+T5YLClXNxRINeGdk654N8J7CgW8qrpOCb
 z9LWmQHz/Zmw9TJSRmUd9oyoal4LgCbqGRygrbtPhLj6o3AtcanL2UlEKyIalitbbAPm
 UYRvRi61TgONdK7oKOndV7RAOt+7TgALgTvb6KFEE3DWkkiZNQQlIS9QTJTNntflW1gM
 xEMQdkHTKOknVbmCxle6zoF4wtpapPfhJ8wICQljfVTs9eXZyChy3w5bfyOl+K1/yLui
 tetzzvu06z5sU28WsXfT4xHqUriOY31iZgy4K6obubIcAaEVO/aIgIIwyVKmjf6dFzfQ
 bchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728891127; x=1729495927;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0l5Vpt48y+wyU8Bmw/8CtDa7S7s/PIqP43uNSVoXr+M=;
 b=RuSUXYr7KqjxzgUhFJgiexFFBg7zxrfhUI1Rlp+MhLjlMdSlz40dYcPabqAo/K7KQB
 ybF5jQWqqyD5EEYa3EqPaGHqTh62AN8X4OLe6dRV2ZOF4dxxDBrQ+0HxnD51UAngHZKK
 Lwl9Rk1mplqCSx0WN4lXPqfxMV6Yrglj3pRo3kuWgIG/67EQ7SK4BsFQXDg6pZYeyep9
 evLHl95uWIJG7RoCzNxI2BjdMQglDtFlkNMbOEB2mbP/Y4y6BLNCCkPI3v0BJwC5D0N2
 CBEW80ZPOQ4OrSBdEaVB0RE0SirpZtX5Zv5IQxBthngaipSm/09GX4zVV13iA61Aj7yQ
 CFpA==
X-Gm-Message-State: AOJu0Ywl10kcc8HqkBWx3m4MOhfNSXtVS/pvqID04MXk2xIRUTh2xJHo
 9K8OQkaW+Q/ryCYf6FN5n7WGdRjLfkqDugcEATB2sOiDjzJsxJZSkapZhjIr9X8=
X-Google-Smtp-Source: AGHT+IGiaLeQf8+Vr/79F1V0S+ghGnacb+eZWAJIcx/Xabv/TekeMK0rkcfw0OdHNeB4hMf+D9aZrg==
X-Received: by 2002:a2e:4a19:0:b0:2fb:3d91:f218 with SMTP id
 38308e7fff4ca-2fb3f1d10e8mr20878621fa.26.1728891126669; 
 Mon, 14 Oct 2024 00:32:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb497affa6sm5058111fa.74.2024.10.14.00.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 00:32:05 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:32:02 +0300
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
Message-ID: <kaoqse23we5lyhaawk6xe2ouxwwjtjfpkiqb3j7xe64o2jscny@3yswlkjhuuxw>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-7-victor.liu@nxp.com>
 <dtloyyghjep5rm34qjjinvhvrar5jzj3n24czvpdmnkfesntjq@t2uijuez7myj>
 <f47bc3f1-20d9-4f7e-acdd-85eabdb8d743@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f47bc3f1-20d9-4f7e-acdd-85eabdb8d743@nxp.com>
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

On Mon, Oct 14, 2024 at 03:18:15PM +0800, Liu Ying wrote:
> On 10/14/2024, Dmitry Baryshkov wrote:
> > On Sat, Oct 12, 2024 at 03:35:40PM +0800, Liu Ying wrote:
> >> Add basic HDMI video output support. Currently, only RGB888 output
> >> pixel format is supported.  At the LVDS input side, the driver
> >> supports single LVDS link and dual LVDS links with "jeida-24" LVDS
> >> mapping.
> >>
> >> Product link:
> >> https://www.ite.com.tw/en/product/cate1/IT6263
> >>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >> v2:
> >> * Add AVI inforframe support.  (Maxime)
> >> * Add DRM_MODE_CONNECTOR_HDMIA.  (Biju)
> >> * Rename it6263_reset() to it6263_hw_reset().  (Biju)
> >> * Check number of LVDS link data lanes.  (Biju)
> >>
> >>  drivers/gpu/drm/bridge/Kconfig      |   8 +
> >>  drivers/gpu/drm/bridge/Makefile     |   1 +
> >>  drivers/gpu/drm/bridge/ite-it6263.c | 919 ++++++++++++++++++++++++++++
> >>  3 files changed, 928 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c
> >>
> > 
> > [...]
> > 
> >> +static int it6263_parse_dt(struct it6263 *it)
> >> +{
> >> +	struct device *dev = it->dev;
> >> +	struct device_node *port0, *port1;
> >> +	int ret;
> >> +
> >> +	ret = of_property_read_u8(dev->of_node, "ite,lvds-link-num-data-lanes",
> >> +				  &it->lvds_link_num_dlanes);
> >> +	if (ret) {
> >> +		dev_err(dev, "failed to get LVDS link number of data lanes: %d\n",
> >> +			ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	it->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
> >> +	if (IS_ERR(it->next_bridge))
> >> +		return dev_err_probe(dev, PTR_ERR(it->next_bridge),
> >> +				     "failed to get next bridge\n");
> >> +
> >> +	port0 = of_graph_get_port_by_id(dev->of_node, 0);
> >> +	port1 = of_graph_get_port_by_id(dev->of_node, 1);
> >> +	if (port0 && port1) {
> >> +		if (of_property_read_bool(port0, "dual-lvds-even-pixels") &&
> >> +		    of_property_read_bool(port1, "dual-lvds-odd-pixels")) {
> >> +			it->lvds_dual_link = true;
> >> +			it->lvds_link12_swap = true;
> >> +		} else if (of_property_read_bool(port0, "dual-lvds-odd-pixels") &&
> >> +			   of_property_read_bool(port1, "dual-lvds-even-pixels")) {
> >> +			it->lvds_dual_link = true;
> >> +		}
> >> +
> >> +		if (!it->lvds_dual_link) {
> >> +			dev_err(dev,
> >> +				"failed to get LVDS dual link pixel order\n");
> >> +			ret = -EINVAL;
> >> +		}
> > 
> > Please use drm_of_lvds_get_dual_link_pixel_order(), it validates that
> > the DT definition is sound: one port for odd pixels, one port for even
> > pixels.
> 
> It cannot be used, because it get the pixel order for the LVDS
> source not sink. IT6263 is the LVDS sink.

Then you need a similar function for the sink side. Add it to the
drm_of.c

> 
>  * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link pixel order        
>  * @port1: First DT port node of the Dual-link LVDS source                       
>  * @port2: Second DT port node of the Dual-link LVDS source      
> 
> > 
> >> +	} else if (port1) {
> >> +		ret = -EINVAL;
> >> +		dev_err(dev, "single input LVDS port1 is not supported\n");
> >> +	} else if (!port0) {
> >> +		ret = -EINVAL;
> >> +		dev_err(dev, "no input LVDS port\n");
> >> +	}
> >> +
> >> +	of_node_put(port0);
> >> +	of_node_put(port1);
> >> +
> >> +	return ret;
> >> +}
> >> +
> > 
> 
> -- 
> Regards,
> Liu Ying
> 

-- 
With best wishes
Dmitry
