Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F3D3EDF5D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 23:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC17D89EB7;
	Mon, 16 Aug 2021 21:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1481389EB7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 21:36:18 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id f63889c8-fed9-11eb-b37b-0050568c148b;
 Mon, 16 Aug 2021 21:36:05 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 96A23194B06;
 Mon, 16 Aug 2021 23:36:24 +0200 (CEST)
Date: Mon, 16 Aug 2021 23:36:13 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 5/5] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <YRraTWcY4yVuJANQ@ravnborg.org>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-6-msp@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816192523.1739365-6-msp@baylibre.com>
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

Hi Markus,

A few general things in the following. This is what I look for first in
a bridge driver - and I had no time today to review the driver in full.
Please address these, then cc: me on next revision where I hopefully
have more time.

	Sam

> +static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
> +                               enum drm_bridge_attach_flags flags)
> +{
> +       struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +       int ret;
> +
> +       mtk_dp_poweron(mtk_dp);
> +
> +       if (mtk_dp->next_bridge) {
> +               ret = drm_bridge_attach(bridge->encoder, mtk_dp->next_bridge,
> +                                       &mtk_dp->bridge, flags);
> +               if (ret) {
> +                       drm_warn(mtk_dp->drm_dev,
> +                                "Failed to attach external bridge: %d\n", ret);
> +                       return ret;
> +               }
> +       }
> +
> +       if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> +               drm_err(mtk_dp->drm_dev,
> +                       "Fix bridge driver to make connector optional!");
> +               return 0;
> +       }

This driver is only used by mediatek, and I thought all of mediatek is
converted so the display driver creates the connector.

It would be better to migrate mediatek over to always let the display
driver create the connector and drop the connector support in this
driver.


> + struct drm_bridge_funcs mtk_dp_bridge_funcs = {
> +	.attach = mtk_dp_bridge_attach,
> +	.mode_fixup = mtk_dp_bridge_mode_fixup,
> +	.disable = mtk_dp_bridge_disable,
> +	.post_disable = mtk_dp_bridge_post_disable,
> +	.mode_set = mtk_dp_bridge_mode_set,
> +	.pre_enable = mtk_dp_bridge_pre_enable,
> +	.enable = mtk_dp_bridge_enable,
> +	.get_edid = mtk_get_edid,
> +	.detect = mtk_dp_bdg_detect,
> +};


For new drivers please avoid the recently deprecated functions.

- Use the atomic versions of pre_enable, enable, disable and post_disable.

- Merge mode_set with atomic_enable - as there is no need for the mode_Set
  operation.

- Use atomic_check in favour of mode_fixup, albeit the rules for
  atomic_check is at best vauge at the moment.
 

