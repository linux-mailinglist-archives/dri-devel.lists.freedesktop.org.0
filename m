Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C130B516CE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 14:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7458A10E914;
	Wed, 10 Sep 2025 12:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ViWdco+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE06410E913
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757507114;
 bh=5JjAxvBeGPkdlUxhEZHOh+k4JHwDhBMqj4GdJqTmpyI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ViWdco+2ehXePtufEEpFOzGS5Bat+R0kHwG84m7PQgza2h8bAM6twFkiirp7I4XJ/
 H1Q6I2XwNinque0i+p4AAKvjplegFRpSz3xpS92oMviiOnj1nxOHq1MNuR1bHezL/Y
 lpll5MIk2+reHd1isewFgTBkcB1a+BERw2ShSjocmtilBieHlfwveYo6RyfKXusCr6
 3VFawxHz353wPcxY89aI2JnaPDmmWdrN6MRnQnvy+k6KYF4lQA/X3oC0Z0LfarMI/j
 cbS2FTV9bduslKG3rjp1O+ApoqEib1khF4z8vcksSOnqA9NjZJq6jWXIeWm0BZZCVH
 LDzZ7Xp4u+mtw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B36D17E12AE;
 Wed, 10 Sep 2025 14:25:13 +0200 (CEST)
Message-ID: <07d84e2b-a81f-461c-a222-554efeacdb0b@collabora.com>
Date: Wed, 10 Sep 2025 14:25:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/19] drm/mediatek: add ovlsys_adaptor support for
 MT8196
To: Paul Chen <paul-pl.chen@mediatek.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, singo.chang@mediatek.com,
 xiandong.wang@mediatek.com, sirius.wang@mediatek.com,
 sunny.shen@mediatek.com, fshao@chromium.org, treapking@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-18-paul-pl.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250828080855.3502514-18-paul-pl.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 28/08/25 10:07, Paul Chen ha scritto:
> From: Nancy Lin <nancy.lin@mediatek.com>
> 
> Ovlsys_adaptor is an encapsulated module designed to
> simplify the DRM control flow. This module is composed
> of 20 EXDMAs, 20 BLENDERs, and 12 OUTPROCs.
> Two EXDMAs merge into one layer, allowing the module
> to support 20 layers for 3 display paths.
> Ovlsys_adaptor driver is integrated within the
> mtk_ddp_comp framework.
> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/Makefile             |   1 +
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  28 +
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   1 +
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  32 +
>   .../drm/mediatek/mtk_disp_ovlsys_adaptor.c    | 717 ++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  69 +-
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  11 +-
>   7 files changed, 835 insertions(+), 24 deletions(-)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovlsys_adaptor.c
> 

..snip..

> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovlsys_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovlsys_adaptor.c
> new file mode 100644
> index 000000000000..c390a93d4a30
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovlsys_adaptor.c
> @@ -0,0 +1,717 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + */
> +
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_device.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
> +#include <linux/soc/mediatek/mtk-mutex.h>
> +
> +#include "mtk_crtc.h"
> +#include "mtk_ddp_comp.h"
> +#include "mtk_disp_blender.h"
> +#include "mtk_disp_drv.h"
> +#include "mtk_disp_outproc.h"
> +#include "mtk_drm_drv.h"
> +
> +#define OVLSYS_ADAPTOR_DRIVER_DATA_MAX_SIZE 8191
> +
> +enum mtk_ovlsys_adaptor_comp_type {
> +	OVLSYS_ADAPTOR_TYPE_EXDMA = 0,
> +	OVLSYS_ADAPTOR_TYPE_BLENDER,
> +	OVLSYS_ADAPTOR_TYPE_OUTPROC,
> +	OVLSYS_ADAPTOR_TYPE_NUM,
> +};
> +
> +enum mtk_ovlsys_adaptor_comp_id {
> +	OVLSYS_ADAPTOR_EXDMA0,
> +	OVLSYS_ADAPTOR_EXDMA1,
> +	OVLSYS_ADAPTOR_EXDMA2,
> +	OVLSYS_ADAPTOR_EXDMA3,
> +	OVLSYS_ADAPTOR_EXDMA4,
> +	OVLSYS_ADAPTOR_EXDMA5,
> +	OVLSYS_ADAPTOR_EXDMA6,
> +	OVLSYS_ADAPTOR_EXDMA7,
> +	OVLSYS_ADAPTOR_EXDMA8,
> +	OVLSYS_ADAPTOR_EXDMA9,
> +	OVLSYS_ADAPTOR_EXDMA10,
> +	OVLSYS_ADAPTOR_EXDMA11,
> +	OVLSYS_ADAPTOR_EXDMA12,
> +	OVLSYS_ADAPTOR_EXDMA13,
> +	OVLSYS_ADAPTOR_EXDMA14,
> +	OVLSYS_ADAPTOR_EXDMA15,
> +	OVLSYS_ADAPTOR_EXDMA16,
> +	OVLSYS_ADAPTOR_EXDMA17,
> +	OVLSYS_ADAPTOR_EXDMA18,
> +	OVLSYS_ADAPTOR_EXDMA19,
> +	OVLSYS_ADAPTOR_BLENDER0,
> +	OVLSYS_ADAPTOR_BLENDER1,
> +	OVLSYS_ADAPTOR_BLENDER2,
> +	OVLSYS_ADAPTOR_BLENDER3,
> +	OVLSYS_ADAPTOR_BLENDER4,
> +	OVLSYS_ADAPTOR_BLENDER5,
> +	OVLSYS_ADAPTOR_BLENDER6,
> +	OVLSYS_ADAPTOR_BLENDER7,
> +	OVLSYS_ADAPTOR_BLENDER8,
> +	OVLSYS_ADAPTOR_BLENDER9,
> +	OVLSYS_ADAPTOR_BLENDER10,
> +	OVLSYS_ADAPTOR_BLENDER11,
> +	OVLSYS_ADAPTOR_BLENDER12,
> +	OVLSYS_ADAPTOR_BLENDER13,
> +	OVLSYS_ADAPTOR_BLENDER14,
> +	OVLSYS_ADAPTOR_BLENDER15,
> +	OVLSYS_ADAPTOR_BLENDER16,
> +	OVLSYS_ADAPTOR_BLENDER17,
> +	OVLSYS_ADAPTOR_BLENDER18,
> +	OVLSYS_ADAPTOR_BLENDER19,
> +	OVLSYS_ADAPTOR_OUTPROC0,
> +	OVLSYS_ADAPTOR_OUTPROC1,
> +	OVLSYS_ADAPTOR_OUTPROC2,
> +	OVLSYS_ADAPTOR_OUTPROC3,
> +	OVLSYS_ADAPTOR_OUTPROC4,
> +	OVLSYS_ADAPTOR_OUTPROC5,
> +	OVLSYS_ADAPTOR_OUTPROC6,
> +	OVLSYS_ADAPTOR_OUTPROC7,
> +	OVLSYS_ADAPTOR_OUTPROC8,
> +	OVLSYS_ADAPTOR_OUTPROC9,
> +	OVLSYS_ADAPTOR_OUTPROC10,
> +	OVLSYS_ADAPTOR_OUTPROC11,
> +	OVLSYS_ADAPTOR_ID_MAX
> +};
> +
> +struct ovlsys_adaptor_comp_match {
> +	enum mtk_ovlsys_adaptor_comp_type type;
> +	int alias_id;
> +	enum mtk_ddp_comp_id comp_id;
> +};
> +
> +struct mtk_disp_ovlsys_adaptor {
> +	struct device *ovl_adaptor_comp[OVLSYS_ADAPTOR_ID_MAX];
> +	struct device *mmsys_dev;
> +	const unsigned int *path;
> +	unsigned int path_size;
> +	unsigned int layer_nr;
> +	bool children_bound;
> +};
> +
> +static const char * const private_comp_stem[OVLSYS_ADAPTOR_TYPE_NUM] = {
> +	[OVLSYS_ADAPTOR_TYPE_EXDMA]	= "exdma",
> +	[OVLSYS_ADAPTOR_TYPE_BLENDER]	= "blender",
> +	[OVLSYS_ADAPTOR_TYPE_OUTPROC]	= "outproc",
> +};
> +
> +static const struct ovlsys_adaptor_comp_match comp_matches[OVLSYS_ADAPTOR_ID_MAX] = {
> +	[OVLSYS_ADAPTOR_EXDMA2]	  = { OVLSYS_ADAPTOR_TYPE_EXDMA, 2, DDP_COMPONENT_OVL0_EXDMA2},
> +	[OVLSYS_ADAPTOR_EXDMA3]	  = { OVLSYS_ADAPTOR_TYPE_EXDMA, 3, DDP_COMPONENT_OVL0_EXDMA3},
> +	[OVLSYS_ADAPTOR_EXDMA4]	  = { OVLSYS_ADAPTOR_TYPE_EXDMA, 4, DDP_COMPONENT_OVL0_EXDMA4},
> +	[OVLSYS_ADAPTOR_EXDMA5]	  = { OVLSYS_ADAPTOR_TYPE_EXDMA, 5, DDP_COMPONENT_OVL0_EXDMA5},
> +	[OVLSYS_ADAPTOR_EXDMA6]	  = { OVLSYS_ADAPTOR_TYPE_EXDMA, 6, DDP_COMPONENT_OVL0_EXDMA6},
> +	[OVLSYS_ADAPTOR_EXDMA7]	  = { OVLSYS_ADAPTOR_TYPE_EXDMA, 7, DDP_COMPONENT_OVL0_EXDMA7},
> +	[OVLSYS_ADAPTOR_EXDMA8]	  = { OVLSYS_ADAPTOR_TYPE_EXDMA, 8, DDP_COMPONENT_OVL0_EXDMA8},
> +	[OVLSYS_ADAPTOR_EXDMA9]	  = { OVLSYS_ADAPTOR_TYPE_EXDMA, 9, DDP_COMPONENT_OVL0_EXDMA9},
> +	[OVLSYS_ADAPTOR_EXDMA12]   = { OVLSYS_ADAPTOR_TYPE_EXDMA, 12, DDP_COMPONENT_OVL1_EXDMA2},
> +	[OVLSYS_ADAPTOR_EXDMA13]   = { OVLSYS_ADAPTOR_TYPE_EXDMA, 13, DDP_COMPONENT_OVL1_EXDMA3},
> +	[OVLSYS_ADAPTOR_EXDMA14]   = { OVLSYS_ADAPTOR_TYPE_EXDMA, 14, DDP_COMPONENT_OVL1_EXDMA4},
> +	[OVLSYS_ADAPTOR_EXDMA15]   = { OVLSYS_ADAPTOR_TYPE_EXDMA, 15, DDP_COMPONENT_OVL1_EXDMA5},
> +	[OVLSYS_ADAPTOR_EXDMA16]   = { OVLSYS_ADAPTOR_TYPE_EXDMA, 16, DDP_COMPONENT_OVL1_EXDMA6},
> +	[OVLSYS_ADAPTOR_EXDMA17]   = { OVLSYS_ADAPTOR_TYPE_EXDMA, 17, DDP_COMPONENT_OVL1_EXDMA7},
> +	[OVLSYS_ADAPTOR_EXDMA18]   = { OVLSYS_ADAPTOR_TYPE_EXDMA, 18, DDP_COMPONENT_OVL1_EXDMA8},
> +	[OVLSYS_ADAPTOR_EXDMA19]   = { OVLSYS_ADAPTOR_TYPE_EXDMA, 19, DDP_COMPONENT_OVL1_EXDMA9},
> +	[OVLSYS_ADAPTOR_BLENDER1] = { OVLSYS_ADAPTOR_TYPE_BLENDER, 1, DDP_COMPONENT_OVL0_BLENDER1},
> +	[OVLSYS_ADAPTOR_BLENDER2] = { OVLSYS_ADAPTOR_TYPE_BLENDER, 2, DDP_COMPONENT_OVL0_BLENDER2},
> +	[OVLSYS_ADAPTOR_BLENDER3] = { OVLSYS_ADAPTOR_TYPE_BLENDER, 3, DDP_COMPONENT_OVL0_BLENDER3},
> +	[OVLSYS_ADAPTOR_BLENDER4] = { OVLSYS_ADAPTOR_TYPE_BLENDER, 4, DDP_COMPONENT_OVL0_BLENDER4},
> +	[OVLSYS_ADAPTOR_BLENDER5] = { OVLSYS_ADAPTOR_TYPE_BLENDER, 5, DDP_COMPONENT_OVL0_BLENDER5},
> +	[OVLSYS_ADAPTOR_BLENDER6] = { OVLSYS_ADAPTOR_TYPE_BLENDER, 6, DDP_COMPONENT_OVL0_BLENDER6},
> +	[OVLSYS_ADAPTOR_BLENDER7] = { OVLSYS_ADAPTOR_TYPE_BLENDER, 7, DDP_COMPONENT_OVL0_BLENDER7},
> +	[OVLSYS_ADAPTOR_BLENDER8] = { OVLSYS_ADAPTOR_TYPE_BLENDER, 8, DDP_COMPONENT_OVL0_BLENDER8},
> +	[OVLSYS_ADAPTOR_BLENDER9] = { OVLSYS_ADAPTOR_TYPE_BLENDER, 9, DDP_COMPONENT_OVL0_BLENDER9},
> +	[OVLSYS_ADAPTOR_BLENDER11] = {
> +		OVLSYS_ADAPTOR_TYPE_BLENDER, 11, DDP_COMPONENT_OVL1_BLENDER1},
> +	[OVLSYS_ADAPTOR_BLENDER12] = {
> +		OVLSYS_ADAPTOR_TYPE_BLENDER, 12, DDP_COMPONENT_OVL1_BLENDER2},
> +	[OVLSYS_ADAPTOR_BLENDER13] = {
> +		OVLSYS_ADAPTOR_TYPE_BLENDER, 13, DDP_COMPONENT_OVL1_BLENDER3},
> +	[OVLSYS_ADAPTOR_BLENDER14] = {
> +		OVLSYS_ADAPTOR_TYPE_BLENDER, 14, DDP_COMPONENT_OVL1_BLENDER4},
> +	[OVLSYS_ADAPTOR_BLENDER15] = {
> +		OVLSYS_ADAPTOR_TYPE_BLENDER, 15, DDP_COMPONENT_OVL1_BLENDER5},
> +	[OVLSYS_ADAPTOR_BLENDER16] = {
> +		OVLSYS_ADAPTOR_TYPE_BLENDER, 16, DDP_COMPONENT_OVL1_BLENDER6},
> +	[OVLSYS_ADAPTOR_BLENDER17] = {
> +		OVLSYS_ADAPTOR_TYPE_BLENDER, 17, DDP_COMPONENT_OVL1_BLENDER7},
> +	[OVLSYS_ADAPTOR_BLENDER18] = {
> +		OVLSYS_ADAPTOR_TYPE_BLENDER, 18, DDP_COMPONENT_OVL1_BLENDER8},
> +	[OVLSYS_ADAPTOR_BLENDER19] = {
> +		OVLSYS_ADAPTOR_TYPE_BLENDER, 19, DDP_COMPONENT_OVL1_BLENDER9},
> +	[OVLSYS_ADAPTOR_OUTPROC0] = { OVLSYS_ADAPTOR_TYPE_OUTPROC, 0, DDP_COMPONENT_OVL0_OUTPROC0},
> +	[OVLSYS_ADAPTOR_OUTPROC1] = { OVLSYS_ADAPTOR_TYPE_OUTPROC, 1, DDP_COMPONENT_OVL0_OUTPROC1},
> +	[OVLSYS_ADAPTOR_OUTPROC6] = { OVLSYS_ADAPTOR_TYPE_OUTPROC, 6, DDP_COMPONENT_OVL1_OUTPROC0},
> +};
> +
> +static const unsigned int mt8196_mtk_ovl_main[] = {

This is a step back from what I solved with the OF Graph(s) in all legacy MediaTek
SoCs - it happened and will happen again: hardcoded paths will work for one board
but not for the other, and also the SoC list will grow exponentially as much as
the number of arrays in this driver.

Please stop hardcoding the paths and walk an OF Graph to do the same; check how it
is already implemented (and perfectly working) for all of the other MediaTek SoCs.

You shall not have any hardcoded path at all and rely only on the graph.

Oh, unless you can avoid *both* the hardcoding *and* the graph, if there's any way
to auto-select the components (exdma/blender/outproc/etc) based on the display
output requirements (single or dual dsi/dpi/hdmi/etc). If there *is* indeed a way
to do auto-selection between registered components to form a path, I'd prefer
having that instead.

> +	OVLSYS_ADAPTOR_EXDMA2,
> +	OVLSYS_ADAPTOR_BLENDER1,
> +	OVLSYS_ADAPTOR_EXDMA3,
> +	OVLSYS_ADAPTOR_BLENDER2,
> +	OVLSYS_ADAPTOR_EXDMA4,
> +	OVLSYS_ADAPTOR_BLENDER3,
> +	OVLSYS_ADAPTOR_EXDMA5,
> +	OVLSYS_ADAPTOR_BLENDER4,
> +	OVLSYS_ADAPTOR_OUTPROC0,
> +};
> +
> +static const unsigned int mt8196_mtk_ovl_ext[] = {
> +	OVLSYS_ADAPTOR_EXDMA6,
> +	OVLSYS_ADAPTOR_BLENDER5,
> +	OVLSYS_ADAPTOR_EXDMA7,
> +	OVLSYS_ADAPTOR_BLENDER6,
> +	OVLSYS_ADAPTOR_EXDMA8,
> +	OVLSYS_ADAPTOR_BLENDER7,
> +	OVLSYS_ADAPTOR_EXDMA9,
> +	OVLSYS_ADAPTOR_BLENDER8,
> +	OVLSYS_ADAPTOR_OUTPROC1,
> +};
> +
> +static const unsigned int mt8196_mtk_ovl_third[] = {
> +	OVLSYS_ADAPTOR_EXDMA12,
> +	OVLSYS_ADAPTOR_BLENDER11,
> +	OVLSYS_ADAPTOR_EXDMA13,
> +	OVLSYS_ADAPTOR_BLENDER12,
> +	OVLSYS_ADAPTOR_EXDMA14,
> +	OVLSYS_ADAPTOR_BLENDER13,
> +	OVLSYS_ADAPTOR_EXDMA15,
> +	OVLSYS_ADAPTOR_BLENDER14,
> +	OVLSYS_ADAPTOR_OUTPROC6,
> +};
> +
> +static enum mtk_ovlsys_adaptor_comp_type get_type(enum mtk_ovlsys_adaptor_comp_id id)
> +{
> +	return comp_matches[id].type;
> +}
> +
> +static enum mtk_ddp_comp_id get_ddp_comp_id(enum mtk_ovlsys_adaptor_comp_id id)
> +{
> +	return comp_matches[id].comp_id;
> +}
> +
> +int mtk_ovlsys_adaptor_power_on(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +	struct device *comp;
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < priv->path_size; i++) {
> +		comp = priv->ovl_adaptor_comp[priv->path[i]];
> +		if (!comp || get_type(priv->path[i]) != OVLSYS_ADAPTOR_TYPE_EXDMA)
> +			continue;
> +

Think about frequent PM calls which want to power on/off: this is not much of a
problem right now, but in the future I can foresee having more components in the
path array.

In that case, anyway, you're walking through the entire path array to try and find
the EXDMA components, effectively wasting cycles and slowing down the operation.

While this works, can we please find a more performant solution?
Hint: caching exdma entries and walking only through them is one possible solution.

> +		ret = pm_runtime_get_sync(comp);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to enable power domain %d, err %d\n", i, ret);
> +			goto pwr_err;
> +		}
> +	}
> +
> +	return 0;
> +
> +pwr_err:
> +	while (--i >= 0) {
> +		comp = priv->ovl_adaptor_comp[i];
> +		if (!comp || get_type(priv->path[i]) != OVLSYS_ADAPTOR_TYPE_EXDMA)
> +			continue;
> +
> +		pm_runtime_put(priv->ovl_adaptor_comp[i]);
> +	}
> +
> +	return ret;
> +}
> +
> +void mtk_ovlsys_adaptor_power_off(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +	struct device *comp;
> +	int i;
> +
> +	for (i = 0; i < priv->path_size; i++) {
> +		comp = priv->ovl_adaptor_comp[priv->path[i]];
> +		if (!comp || get_type(priv->path[i]) != OVLSYS_ADAPTOR_TYPE_EXDMA)
> +			continue;
> +
> +		pm_runtime_put(comp);
> +	}
> +}
> +
> +void mtk_ovlsys_adaptor_layer_config(struct device *dev, unsigned int idx,
> +				     struct mtk_plane_state *state,
> +				     struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_plane_pending_state *pending = &state->pending;
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +	struct device *exdma;
> +	struct device *blender;
> +	const struct drm_format_info *fmt_info = drm_format_info(pending->format);
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "idx:%d enable:%d fmt:0x%x addr:0x%pad fb_w:%d {%d,%d,%d,%d}\n",
> +			     idx, pending->enable, pending->format,
> +			     &pending->addr, (pending->pitch / fmt_info->cpp[0]),
> +			     pending->x, pending->y, pending->width, pending->height);
> +
> +	exdma = priv->ovl_adaptor_comp[priv->path[idx * 2]];
> +	if (!exdma) {
> +		dev_err(dev, "%s: exdma%d comp not found\n", __func__, idx);
> +		return;
> +	}
> +
> +	blender = priv->ovl_adaptor_comp[priv->path[idx * 2 + 1]];
> +	if (!blender) {
> +		dev_err(dev, "%s: blender%d comp not found\n", __func__, idx);
> +		return;
> +	}
> +
> +	mtk_disp_exdma_layer_config(exdma, state, cmdq_pkt);
> +	mtk_disp_blender_layer_config(blender, state, cmdq_pkt);
> +}
> +
> +void mtk_ovlsys_adaptor_config(struct device *dev, unsigned int w,
> +			       unsigned int h, unsigned int vrefresh,
> +			       unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +	int i;
> +
> +	for (i = 0; i < priv->layer_nr; i++)
> +		mtk_disp_blender_config(priv->ovl_adaptor_comp[priv->path[i * 2 + 1]], w, h,
> +					i == (priv->layer_nr - 1),
> +					i == 0, cmdq_pkt);
> +
> +	mtk_disp_outproc_config(priv->ovl_adaptor_comp[priv->path[i * 2]], w, h,
> +				vrefresh, bpc, cmdq_pkt);
> +}
> +
> +int mtk_ovlsys_adaptor_layer_check(struct device *dev,
> +				   unsigned int idx,
> +				   struct mtk_plane_state *mtk_state)
> +{
> +	struct drm_plane_state *state = &mtk_state->base;
> +
> +	/* Check if any unsupported rotation is set */
> +	if (state->rotation & ~DRM_MODE_ROTATE_0)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +void mtk_ovlsys_adaptor_start(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +	int i;
> +
> +	for (i = 0; i < (priv->path_size - 1); i += 2) {
> +		mtk_disp_exdma_start(priv->ovl_adaptor_comp[priv->path[i]]);
> +		mtk_disp_blender_start(priv->ovl_adaptor_comp[priv->path[i + 1]]);
> +	}
> +
> +	mtk_disp_outproc_start(priv->ovl_adaptor_comp[priv->path[i]]);
> +}
> +
> +void mtk_ovlsys_adaptor_stop(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +	int i;
> +
> +	for (i = 0; i < (priv->path_size - 1); i += 2) {
> +		mtk_disp_exdma_stop(priv->ovl_adaptor_comp[priv->path[i]]);
> +		mtk_disp_blender_stop(priv->ovl_adaptor_comp[priv->path[i + 1]]);
> +	}
> +
> +	mtk_disp_outproc_stop(priv->ovl_adaptor_comp[priv->path[i]]);
> +}
> +
> +int mtk_ovlsys_adaptor_clk_enable(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +	struct device *comp;
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < priv->path_size; i++) {
> +		comp = priv->ovl_adaptor_comp[priv->path[i]];
> +

enum ovlsys_adaptor_comp_id comp_type = get_type(priv->path[i]);

switch (comp_type) {
case OVLSYS_ADAPTOR ....
.....
default:
	return -ENOENT;

P.S.: Are we *ever* enabling clocks for one but not for the other?
P.P.S.: As a performance improvement, can't you just assign function pointers
         and call those instead of checking the component type?

> +		if (get_type(priv->path[i]) == OVLSYS_ADAPTOR_TYPE_EXDMA)
> +			ret = mtk_disp_exdma_clk_enable(comp);
> +		else if (get_type(priv->path[i]) == OVLSYS_ADAPTOR_TYPE_BLENDER)
> +			ret = mtk_disp_blender_clk_enable(comp);
> +		else
> +			ret = mtk_disp_outproc_clk_enable(comp);
> +
> +		if (ret) {
> +			dev_err(dev, "Failed to enable clock %d, err %d\n", i, ret);
> +			goto clk_err;
> +		}
> +	}
> +
> +	return 0;
> +
> +clk_err:
> +	while (--i >= 0) {
> +		comp = priv->ovl_adaptor_comp[priv->path[i]];
> +		if (!comp)
> +			continue;
> +
> +		if (get_type(priv->path[i]) == OVLSYS_ADAPTOR_TYPE_EXDMA)
> +			mtk_disp_exdma_clk_disable(comp);
> +		else if (get_type(priv->path[i]) == OVLSYS_ADAPTOR_TYPE_BLENDER)
> +			mtk_disp_blender_clk_disable(comp);
> +		else
> +			mtk_disp_outproc_clk_disable(comp);
> +	}
> +
> +	return ret;
> +}
> +
> +void mtk_ovlsys_adaptor_clk_disable(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +	struct device *comp;
> +	int i;
> +
> +	for (i = 0; i < priv->path_size; i++) {
> +		comp = priv->ovl_adaptor_comp[priv->path[i]];
> +		if (!comp)
> +			continue;
> +
> +		if (get_type(priv->path[i]) == OVLSYS_ADAPTOR_TYPE_EXDMA)
> +			mtk_disp_exdma_clk_disable(comp);
> +		else if (get_type(priv->path[i]) == OVLSYS_ADAPTOR_TYPE_BLENDER)
> +			mtk_disp_blender_clk_disable(comp);
> +		else
> +			mtk_disp_outproc_clk_disable(comp);
> +	}
> +}
> +
> +unsigned int mtk_ovlsys_adaptor_layer_nr(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +
> +	return priv->layer_nr;
> +}
> +
> +struct device *mtk_ovlsys_adaptor_dma_dev_get(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +
> +	return priv->ovl_adaptor_comp[priv->path[0]];
> +}
> +
> +void mtk_ovlsys_adaptor_register_vblank_cb(struct device *dev, void (*vblank_cb)(void *),
> +					   void *vblank_cb_data)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +
> +	mtk_disp_outproc_register_vblank_cb(priv->ovl_adaptor_comp[priv->path[priv->path_size - 1]],
> +					    vblank_cb, vblank_cb_data);
> +}
> +
> +void mtk_ovlsys_adaptor_unregister_vblank_cb(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +	struct device *comp = priv->ovl_adaptor_comp[priv->path[priv->path_size - 1]];
> +
> +	mtk_disp_outproc_unregister_vblank_cb(comp);
> +}
> +
> +void mtk_ovlsys_adaptor_enable_vblank(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +
> +	mtk_disp_outproc_enable_vblank(priv->ovl_adaptor_comp[priv->path[priv->path_size - 1]]);
> +}
> +
> +void mtk_ovlsys_adaptor_disable_vblank(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +
> +	mtk_disp_outproc_disable_vblank(priv->ovl_adaptor_comp[priv->path[priv->path_size - 1]]);
> +}
> +
> +u32 mtk_ovlsys_adaptor_get_blend_modes(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +
> +	return mtk_disp_blender_get_blend_modes(priv->ovl_adaptor_comp[priv->path[1]]);
> +}
> +
> +const u32 *mtk_ovlsys_adaptor_get_formats(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +
> +	return mtk_disp_exdma_get_formats(priv->ovl_adaptor_comp[priv->path[0]]);
> +}
> +
> +size_t mtk_ovlsys_adaptor_get_num_formats(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +
> +	return mtk_disp_exdma_get_num_formats(priv->ovl_adaptor_comp[priv->path[0]]);
> +}
> +
> +void mtk_ovlsys_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +	int i;
> +
> +	for (i = 0; i < priv->path_size; i++)
> +		mtk_mutex_add_comp(mutex, get_ddp_comp_id(priv->path[i]));
> +}
> +
> +void mtk_ovlsys_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +	int i;
> +
> +	for (i = 0; i < priv->path_size; i++)
> +		mtk_mutex_remove_comp(mutex, get_ddp_comp_id(priv->path[i]));
> +}
> +
> +void mtk_ovlsys_adaptor_connect(struct device *dev, struct device *mmsys_dev, unsigned int next)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +	int i;
> +
> +	for (i = 0; i < priv->path_size - 1; i++)
> +		mtk_mmsys_ddp_connect(mmsys_dev, get_ddp_comp_id(priv->path[i]),
> +				      get_ddp_comp_id(priv->path[i + 1]));
> +
> +	mtk_mmsys_ddp_connect(mmsys_dev, get_ddp_comp_id(priv->path[i]), next);
> +}
> +
> +void mtk_ovlsys_adaptor_disconnect(struct device *dev, struct device *mmsys_dev, unsigned int next)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +	int i;
> +
> +	for (i = 0; i < priv->path_size - 1; i++)
> +		mtk_mmsys_ddp_disconnect(mmsys_dev, get_ddp_comp_id(priv->path[i]),
> +					 get_ddp_comp_id(priv->path[i + 1]));
> +
> +	mtk_mmsys_ddp_disconnect(mmsys_dev, get_ddp_comp_id(priv->path[i]), next);
> +}
> +
> +static int ovlsys_adaptor_comp_get_id(struct device *dev, struct device_node *node,
> +				      enum mtk_ovlsys_adaptor_comp_type type)
> +{
> +	int alias_id = of_alias_get_id(node, private_comp_stem[type]);
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(comp_matches); i++)
> +		if (comp_matches[i].type == type &&
> +		    comp_matches[i].alias_id == alias_id)
> +			return i;
> +

This is exactly the same function as ovl_adaptor_comp_get_id(), and I'm sure that
at least this one can be commonized.

> +	dev_warn(dev, "Failed to get id. type: %d, alias: %d\n", type, alias_id);
> +	return -EINVAL;
> +}
> +
> +static const struct of_device_id mtk_ovlsys_adaptor_comp_dt_ids[] = {
> +	{
> +		.compatible = "mediatek,mt8196-exdma",
> +		.data = (void *)OVLSYS_ADAPTOR_TYPE_EXDMA,
> +	}, {
> +		.compatible = "mediatek,mt8196-blender",
> +		.data = (void *)OVLSYS_ADAPTOR_TYPE_BLENDER,
> +	}, {
> +		.compatible = "mediatek,mt8196-outproc",
> +		.data = (void *)OVLSYS_ADAPTOR_TYPE_OUTPROC,
> +	},
> +	{},
> +};
> +
> +static int ovlsys_adaptor_comp_init(struct device *dev, struct component_match **match)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +	struct device_node *parent;
> +	struct platform_device *comp_pdev;
> +	int i;
> +
> +	parent = dev->parent->parent->of_node->parent;
> +
> +	for_each_child_of_node_scoped(parent, node) {
> +		enum mtk_ovlsys_adaptor_comp_type type;
> +		const struct of_device_id *of_id;
> +		int id;
> +		bool found = false;
> +
> +		of_id = of_match_node(mtk_ovlsys_adaptor_comp_dt_ids, node);

This entire thing also seems to be a copy-paste of an earlier version of function
ovl_adaptor_comp_init() (before my changes for adding OF Graphs).

When you will implement support for the graph in this, you'll end up with the very
same function - so you can commonize them for sure.

> +		if (!of_id)
> +			continue;
> +
> +		if (!of_device_is_available(node)) {
> +			dev_dbg(dev, "Skipping disabled component %pOF\n",
> +				node);
> +			continue;
> +		}
> +
> +		type = (enum mtk_ovlsys_adaptor_comp_type)(uintptr_t)of_id->data;
> +
> +		id = ovlsys_adaptor_comp_get_id(dev, node, type);
> +		if (id < 0) {
> +			dev_warn(dev, "Skipping unknown component %pOF\n",
> +				 node);
> +			continue;
> +		}
> +
> +		for (i = 0; i < priv->path_size; i++)
> +			if (priv->path[i] == id)
> +				found = true;
> +
> +		if (!found)
> +			continue;
> +
> +		comp_pdev = of_find_device_by_node(node);
> +		if (!comp_pdev)
> +			return -EPROBE_DEFER;
> +
> +		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
> +
> +		drm_of_component_match_add(dev, match, component_compare_of, node);
> +		dev_dbg(dev, "Adding component match for %pOF\n", node);
> +	}
> +
> +	if (!*match) {
> +		dev_err(dev, "No match device for ovlsys_adaptor\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_disp_ovlsys_adaptor_comp_bind(struct device *dev, struct device *master,
> +					     void *data)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +

mtk_disp_ovl_adaptor_comp_bind() is exactly the same function as this (bar the
different struct, of course).

> +	if (!priv->children_bound)
> +		return -EPROBE_DEFER;
> +
> +	return 0;
> +}
> +
> +static void mtk_disp_ovlsys_adaptor_comp_unbind(struct device *dev, struct device *master,
> +						void *data)
> +{
> +}
> +
> +static const struct component_ops mtk_disp_ovlsys_adaptor_comp_ops = {
> +	.bind	= mtk_disp_ovlsys_adaptor_comp_bind,
> +	.unbind = mtk_disp_ovlsys_adaptor_comp_unbind,
> +};
> +
> +static int mtk_disp_ovlsys_adaptor_master_bind(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = component_bind_all(dev, priv->mmsys_dev);
> +
> +	if (ret)
> +		return dev_err_probe(dev, ret, "component_bind_all failed!\n");
> +
> +	priv->children_bound = true;
> +
> +	/*
> +	 * Based on the hardware design, both 3 Display Pipe blender layer
> +	 * is half of the path size.
> +	 */
> +	priv->layer_nr = priv->path_size / 2;

This line is the only difference (always bar the different struct) between this
and mtk_disp_ovl_adaptor_master_bind().

> +
> +	return 0;
> +}
> +
> +static void mtk_disp_ovlsys_adaptor_master_unbind(struct device *dev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv = dev_get_drvdata(dev);
> +

...same comment applies

> +	priv->children_bound = false;
> +}
> +
> +static const struct component_master_ops mtk_disp_ovlsys_adaptor_master_ops = {
> +	.bind		= mtk_disp_ovlsys_adaptor_master_bind,
> +	.unbind		= mtk_disp_ovlsys_adaptor_master_unbind,
> +};
> +
> +static int mtk_disp_ovlsys_adaptor_probe(struct platform_device *pdev)
> +{
> +	struct mtk_disp_ovlsys_adaptor *priv;
> +	struct device *dev = &pdev->dev;
> +	struct component_match *match = NULL;
> +	struct mtk_ovlsys_platform_data *ovlsys_priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	ovlsys_priv = pdev->dev.platform_data;
> +	priv->mmsys_dev = ovlsys_priv->mmsys_dev;
> +

This snippet....

> +	if (ovlsys_priv->use_path == CRTC_MAIN) {
> +		priv->path = mt8196_mtk_ovl_main;
> +		priv->path_size = ARRAY_SIZE(mt8196_mtk_ovl_main);
> +	} else if (ovlsys_priv->use_path == CRTC_EXT) {
> +		priv->path = mt8196_mtk_ovl_ext;
> +		priv->path_size = ARRAY_SIZE(mt8196_mtk_ovl_ext);
> +	} else if (ovlsys_priv->use_path == CRTC_THIRD) {
> +		priv->path = mt8196_mtk_ovl_third;
> +		priv->path_size = ARRAY_SIZE(mt8196_mtk_ovl_third);
> +	}

...will disappear once you implement graphs.

> +
> +	ret = ovlsys_adaptor_comp_init(dev, &match);
> +	if (ret < 0)
> +		return ret;
> +
> +	component_master_add_with_match(dev, &mtk_disp_ovlsys_adaptor_master_ops, match);
> +
> +	pm_runtime_enable(dev);
> +
> +	ret = component_add(dev, &mtk_disp_ovlsys_adaptor_comp_ops);
> +	if (ret != 0) {
> +		pm_runtime_disable(dev);
> +		dev_err(dev, "Failed to add component: %d\n", ret);
> +	}
> +
> +	return ret;
> +}
> +
> +static void mtk_disp_ovlsys_adaptor_remove(struct platform_device *pdev)
> +{
> +	component_master_del(&pdev->dev, &mtk_disp_ovlsys_adaptor_master_ops);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +struct platform_driver mtk_disp_ovlsys_adaptor_driver = {
> +	.probe		= mtk_disp_ovlsys_adaptor_probe,
> +	.remove		= mtk_disp_ovlsys_adaptor_remove,
> +	.driver		= {
> +		.name	= "mediatek-disp-ovlsys-adaptor",
> +		.owner	= THIS_MODULE,
> +	},
> +};
> +
> +MODULE_AUTHOR("Nancy Lin <nancy.lin@mediatek.com>");
> +MODULE_DESCRIPTION("MediaTek Ovlsys Adaptor Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index cf5f9b8fc335..7972a0506616 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -428,32 +428,41 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
>   	return false;
>   }
>   
> -static bool mtk_drm_find_mmsys_comp(struct mtk_drm_private *private, int comp_id)
> +static bool mtk_drm_find_mmsys_comp(struct mtk_drm_private *private, int comp_id, int *use_path)
>   {
>   	const struct mtk_mmsys_driver_data *drv_data = private->data;
> -	int i;
> +	int i, path = MAX_CRTC;
>   
>   	if (drv_data->main_path)
>   		for (i = 0; i < drv_data->main_len; i++)
> -			if (drv_data->main_path[i] == comp_id)
> -				return true;
> +			if (drv_data->main_path[i] == comp_id) {
> +				path = CRTC_MAIN;
> +				goto found;
> +			}
>   
>   	if (drv_data->ext_path)
>   		for (i = 0; i < drv_data->ext_len; i++)
> -			if (drv_data->ext_path[i] == comp_id)
> -				return true;
> -
> +			if (drv_data->ext_path[i] == comp_id) {
> +				path = CRTC_EXT;
> +				goto found;
> +			}
>   	if (drv_data->third_path)
>   		for (i = 0; i < drv_data->third_len; i++)
> -			if (drv_data->third_path[i] == comp_id)
> -				return true;
> +			if (drv_data->third_path[i] == comp_id) {
> +				path = CRTC_THIRD;
> +				goto found;
> +			}
>   
>   	if (drv_data->num_conn_routes)
>   		for (i = 0; i < drv_data->num_conn_routes; i++)
>   			if (drv_data->conn_routes[i].route_ddp == comp_id)
> -				return true;
> +				goto found;
>   
>   	return false;
> +found:
> +	if (use_path)
> +		*use_path = path;
> +	return true;
>   }
>   
>   static int mtk_drm_kms_init(struct drm_device *drm)
> @@ -1069,6 +1078,26 @@ static int mtk_drm_of_ddp_path_build(struct device *dev, struct device_node *nod
>   	return 0;
>   }
>   
> +static void mtk_drm_ovl_adaptor_probe(struct device *dev, struct mtk_drm_private *private,
> +				      struct component_match **match, enum mtk_ddp_comp_id id)
> +{
> +	struct platform_device *ovl_adaptor;
> +	struct mtk_ovlsys_platform_data ovlsys_priv;
> +	bool is_ovlsys = (id != DDP_COMPONENT_DRM_OVL_ADAPTOR);
> +	char *dev_name = is_ovlsys ? "mediatek-disp-ovlsys-adaptor" : "mediatek-disp-ovl-adaptor";
> +	void *drv_data = is_ovlsys ? (void *)&ovlsys_priv : (void *)private->mmsys_dev;
> +	size_t data_size = is_ovlsys ? sizeof(ovlsys_priv) : sizeof(*private->mmsys_dev);
> +
> +	if (mtk_drm_find_mmsys_comp(private, id, &ovlsys_priv.use_path)) {
> +		ovlsys_priv.mmsys_dev = private->mmsys_dev;
> +		ovl_adaptor = platform_device_register_data(dev, dev_name, PLATFORM_DEVID_AUTO,
> +							    drv_data, data_size);
> +		private->ddp_comp[id].dev = &ovl_adaptor->dev;
> +		mtk_ddp_comp_init(NULL, &private->ddp_comp[id], id);
> +		component_match_add(dev, match, compare_dev, &ovl_adaptor->dev);
> +	}
> +}
> +
>   static int mtk_drm_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -1078,7 +1107,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
>   	struct mtk_mmsys_driver_data *mtk_drm_data;
>   	struct device_node *node;
>   	struct component_match *match = NULL;
> -	struct platform_device *ovl_adaptor;
>   	int ret;
>   	int i;
>   
> @@ -1124,17 +1152,11 @@ static int mtk_drm_probe(struct platform_device *pdev)
>   	if (!private->all_drm_private)
>   		return -ENOMEM;
>   
> -	/* Bringup ovl_adaptor */
> -	if (mtk_drm_find_mmsys_comp(private, DDP_COMPONENT_DRM_OVL_ADAPTOR)) {
> -		ovl_adaptor = platform_device_register_data(dev, "mediatek-disp-ovl-adaptor",
> -							    PLATFORM_DEVID_AUTO,
> -							    (void *)private->mmsys_dev,
> -							    sizeof(*private->mmsys_dev));
> -		private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR].dev = &ovl_adaptor->dev;
> -		mtk_ddp_comp_init(NULL, &private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR],
> -				  DDP_COMPONENT_DRM_OVL_ADAPTOR);
> -		component_match_add(dev, &match, compare_dev, &ovl_adaptor->dev);
> -	}
> +	/* Bringup ovl_adaptor and ovlsys_adaptor*/
> +	mtk_drm_ovl_adaptor_probe(dev, private, &match, DDP_COMPONENT_DRM_OVL_ADAPTOR);
> +	mtk_drm_ovl_adaptor_probe(dev, private, &match, DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0);
> +	mtk_drm_ovl_adaptor_probe(dev, private, &match, DDP_COMPONENT_DRM_OVLSYS_ADAPTOR1);
> +	mtk_drm_ovl_adaptor_probe(dev, private, &match, DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2);

You can call that in a loop at least for the OVLSYS_ADAPTORx components, or maybe
even for the OVL_ADAPTOR one. Just do a loop then.


Regards,
Angelo

>   
>   	/* Iterate over sibling DISP function blocks */
>   	for_each_child_of_node(phandle->parent, node) {
> @@ -1169,7 +1191,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
>   			continue;
>   		}
>   
> -		if (!mtk_drm_find_mmsys_comp(private, comp_id))
> +		if (!mtk_drm_find_mmsys_comp(private, comp_id, NULL))
>   			continue;
>   
>   		private->comp_node[comp_id] = of_node_get(node);
> @@ -1297,6 +1319,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
>   	&mtk_disp_outproc_driver,
>   	&mtk_disp_ovl_adaptor_driver,
>   	&mtk_disp_ovl_driver,
> +	&mtk_disp_ovlsys_adaptor_driver,
>   	&mtk_disp_rdma_driver,
>   	&mtk_dpi_driver,
>   	&mtk_drm_platform_driver,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index c4717c37b0f1..d04a7ed5d39f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -11,7 +11,10 @@
>   
>   #define MAX_CONNECTOR	2
>   #define DDP_COMPONENT_DRM_OVL_ADAPTOR (DDP_COMPONENT_ID_MAX + 1)
> -#define DDP_COMPONENT_DRM_ID_MAX (DDP_COMPONENT_DRM_OVL_ADAPTOR + 1)
> +#define DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0 (DDP_COMPONENT_DRM_OVL_ADAPTOR + 1)
> +#define DDP_COMPONENT_DRM_OVLSYS_ADAPTOR1 (DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0 + 1)
> +#define DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2 (DDP_COMPONENT_DRM_OVLSYS_ADAPTOR1 + 1)
> +#define DDP_COMPONENT_DRM_ID_MAX (DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2 + 1)
>   
>   enum mtk_crtc_path {
>   	CRTC_MAIN,
> @@ -69,6 +72,11 @@ struct mtk_drm_private {
>   	struct mtk_drm_private **all_drm_private;
>   };
>   
> +struct mtk_ovlsys_platform_data {
> +	struct device *mmsys_dev;
> +	unsigned int use_path;
> +};
> +
>   extern struct platform_driver mtk_disp_aal_driver;
>   extern struct platform_driver mtk_disp_blender_driver;
>   extern struct platform_driver mtk_disp_ccorr_driver;
> @@ -79,6 +87,7 @@ extern struct platform_driver mtk_disp_merge_driver;
>   extern struct platform_driver mtk_disp_outproc_driver;
>   extern struct platform_driver mtk_disp_ovl_adaptor_driver;
>   extern struct platform_driver mtk_disp_ovl_driver;
> +extern struct platform_driver mtk_disp_ovlsys_adaptor_driver;
>   extern struct platform_driver mtk_disp_rdma_driver;
>   extern struct platform_driver mtk_dpi_driver;
>   extern struct platform_driver mtk_dsi_driver;


