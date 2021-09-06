Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A590E4020B9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 22:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CFE8941D;
	Mon,  6 Sep 2021 20:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283FE8941D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 20:39:24 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 7dd8ca8d-0f52-11ec-9416-0050568cd888;
 Mon, 06 Sep 2021 20:39:11 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 7FFA5194CF3;
 Mon,  6 Sep 2021 22:39:14 +0200 (CEST)
Date: Mon, 6 Sep 2021 22:39:21 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 6/6] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <YTZ8eds/IgpW/RBL@ravnborg.org>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-7-msp@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210906193529.718845-7-msp@baylibre.com>
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

On Mon, Sep 06, 2021 at 09:35:29PM +0200, Markus Schneider-Pargmann wrote:
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> 
> It supports both functional units on the mt8195, the embedded
> DisplayPort as well as the external DisplayPort units. It offers
> hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> to 4 lanes.
> 
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes RFC -> v1:
>     - Removed unused register definitions.
>     - Replaced workqueue with threaded irq.
>     - Removed connector code.
>     - Move to atomic_* drm functions.
>     - General cleanups of the code.
>     - Remove unused select GENERIC_PHY.
> 
>  drivers/gpu/drm/mediatek/Kconfig      |    6 +
>  drivers/gpu/drm/mediatek/Makefile     |    2 +
>  drivers/gpu/drm/mediatek/mtk_dp.c     | 2881 +++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h |  580 +++++
>  4 files changed, 3469 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> 


> +
> +static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.attach = mtk_dp_bridge_attach,
> +	.detach = mtk_dp_bridge_detach,
> +	.pre_enable = mtk_dp_bridge_pre_enable,
Use the atomic variant here as pre_enable is deprecated.

> +	.atomic_enable = mtk_dp_bridge_atomic_enable,
> +	.atomic_disable = mtk_dp_bridge_atomic_disable,
> +	.post_disable = mtk_dp_bridge_post_disable,
Use the atomic variant here as .post_disable is deprecated.

> +	.get_edid = mtk_dp_get_edid,
> +	.detect = mtk_dp_bdg_detect,
> +};

Everything else I skimmed looked fine. But it was a quick skim so..

	Sam
