Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3723599855
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 11:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6211610E27C;
	Fri, 19 Aug 2022 09:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1833D10E27C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 09:10:41 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id h67so2907738vsc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 02:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc;
 bh=gceGtQR7pN3tA4bpWaHztM36gTRwfMzq7TB6lAHZIbQ=;
 b=20LlkRUxOk9OSH2HUC00A7QOCVb9KORNdxXgJTkWZV/5CNUaKawvkid+0Yse0VsmB2
 uIiwP8HMKOJM2hCStx202z9w6bd+wzQgyPXuU8zF2H1m/ZIrchynwPoTc2LeNii/yEFQ
 wJlfQFfZncx3R3yyisLQfKBMKpoYnNijCnWepon+Z2HggYd3hbiXyMlsDP+a/1uEnC1/
 A2AMlS412rxDkv7eRNdCo8G5T5ysJf81+Tm2ilueNWbW4/i0vnxMXKt9xwQkkdAAH1Cj
 eL2/Yyi8ryHn/SK4KfTcx3Hq2VnxkVRHYIpzr/RduWoL3mS5c6co6JCYJOgI0qRwOKWf
 +jCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc;
 bh=gceGtQR7pN3tA4bpWaHztM36gTRwfMzq7TB6lAHZIbQ=;
 b=OC+Ziqy2vMS65i5wIMvnDVjZPi8KxERuLomOu44fDX89Zjqtz99W3ypU4/VMC3/ahs
 ju+2GuWhwb2+0UfRntl13ukxKLnXmnz5yz4S2k0BA6Vx3KD7WLgIDL1cXWOO4rwOXqs+
 Q4R2z/rH60ZnaptuA4y/E5G0F+cVG7NmRiLP0S+D+to3I8Hf21Edd4PH4zAsZ4fyD5mc
 CTAEK8hl9k8+shXAiKc1cosFHQp4b38wmS4SSQA4Xh2k4voLLjrl6gllZLoIXvv+kRCS
 4lIhtYnu7w25unty9J8fahCSIpQlFDOwmnZoN6NTUuiErBamp9fhSdW65dhwnnyOipCf
 d/6g==
X-Gm-Message-State: ACgBeo2I8GWe+lEKTukqwIYieR/lculyyOg8Qz0u2yQXiEhHGqlHY/If
 iL02OoofVva2JPX7g9ffBNbi947D+8StqxKvZQe++Q==
X-Google-Smtp-Source: AA6agR4VAifHFjtsXQEFSk53I+n4y/AbPeFwJdnNCRlp/l0XqClZjxeGHeOIPCXyTqEcYIizMqwbKSHFal8gxvlzvx4=
X-Received: by 2002:a67:b303:0:b0:38a:b12f:cbc4 with SMTP id
 a3-20020a67b303000000b0038ab12fcbc4mr2500381vsm.46.1660900239786; Fri, 19 Aug
 2022 02:10:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Aug 2022 02:10:39 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220819061456.8042-1-nancy.lin@mediatek.com>
 <20220819061456.8042-4-nancy.lin@mediatek.com>
In-Reply-To: <20220819061456.8042-4-nancy.lin@mediatek.com>
MIME-Version: 1.0
Date: Fri, 19 Aug 2022 02:10:39 -0700
Message-ID: <CABnWg9u994yOTFkWWK4kpNEZ5g1hjWmeBhOJBh52H6c8pXAUNw@mail.gmail.com>
Subject: Re: [PATCH v26 3/7] drm/mediatek: add ovl_adaptor support for MT8195
To: linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, nfraprado@collabora.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, "ancy . Lin" <nancy.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Aug 2022 08:14, "" wrote:
>Add ovl_adaptor driver for MT8195.
>Ovl_adaptor is an encapsulated module and designed for simplified
>DRM control flow. This module is composed of 8 RDMAs, 4 MERGEs and
>an ETHDR. Two RDMAs merge into one layer, so this module support 4
>layers.
>
Hi Nancy, sorry I'm late in the review process, but I just applied
your series and I stumbled upon a panic.
(see details inline)

This is due to the fact that my dts is missing the required ovl
components, though, I think the driver
shouldn't cause a panic whenever the dts is not complete.

I'm testing this out with an mt8195-demo board.

>Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>---
> drivers/gpu/drm/mediatek/Makefile             |   1 +
> drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  26 +
> .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 528 ++++++++++++++++++
> drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
> 4 files changed, 556 insertions(+)
> create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>
>diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
>index fb158a1e7f06..3abd27d7c91d 100644
>--- a/drivers/gpu/drm/mediatek/Makefile
>+++ b/drivers/gpu/drm/mediatek/Makefile
>@@ -6,6 +6,7 @@ mediatek-drm-y := mtk_disp_aal.o \
> 		  mtk_disp_gamma.o \
> 		  mtk_disp_merge.o \
> 		  mtk_disp_ovl.o \
>+		  mtk_disp_ovl_adaptor.o \
> 		  mtk_disp_rdma.o \
> 		  mtk_drm_crtc.o \
> 		  mtk_drm_ddp_comp.o \
>diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>index 33e61a136bbc..654f8e257984 100644
>--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>@@ -7,6 +7,8 @@
> #define _MTK_DISP_DRV_H_
>
> #include <linux/soc/mediatek/mtk-cmdq.h>
>+#include <linux/soc/mediatek/mtk-mmsys.h>
>+#include <linux/soc/mediatek/mtk-mutex.h>
> #include "mtk_drm_plane.h"
> #include "mtk_mdp_rdma.h"
>
>@@ -116,6 +118,30 @@ void mtk_rdma_unregister_vblank_cb(struct device *dev);
> void mtk_rdma_enable_vblank(struct device *dev);
> void mtk_rdma_disable_vblank(struct device *dev);
>
>+void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex);
>+void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex);
>+void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev,
>+			     unsigned int next);
>+void mtk_ovl_adaptor_disconnect(struct device *dev, struct device *mmsys_dev,
>+				unsigned int next);
>+int mtk_ovl_adaptor_clk_enable(struct device *dev);
>+void mtk_ovl_adaptor_clk_disable(struct device *dev);
>+void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
>+			    unsigned int h, unsigned int vrefresh,
>+			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
>+void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
>+				  struct mtk_plane_state *state,
>+				  struct cmdq_pkt *cmdq_pkt);
>+void mtk_ovl_adaptor_register_vblank_cb(struct device *dev, void (*vblank_cb)(void *),
>+					void *vblank_cb_data);
>+void mtk_ovl_adaptor_unregister_vblank_cb(struct device *dev);
>+void mtk_ovl_adaptor_enable_vblank(struct device *dev);
>+void mtk_ovl_adaptor_disable_vblank(struct device *dev);
>+void mtk_ovl_adaptor_start(struct device *dev);
>+void mtk_ovl_adaptor_stop(struct device *dev);
>+unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev);
>+struct device *mtk_ovl_adaptor_dma_dev_get(struct device *dev);
>+
> int mtk_mdp_rdma_clk_enable(struct device *dev);
> void mtk_mdp_rdma_clk_disable(struct device *dev);
> void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
>diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>new file mode 100644
>index 000000000000..267ee0a1b8fa
>--- /dev/null
>+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>@@ -0,0 +1,528 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+/*
>+ * Copyright (c) 2021 MediaTek Inc.
>+ */
>+
>+#include <drm/drm_fourcc.h>
>+#include <drm/drm_of.h>
>+#include <linux/clk.h>
>+#include <linux/component.h>
>+#include <linux/of_device.h>
>+#include <linux/of_address.h>
>+#include <linux/platform_device.h>
>+#include <linux/pm_runtime.h>
>+#include <linux/reset.h>
>+#include <linux/soc/mediatek/mtk-cmdq.h>
>+#include <linux/soc/mediatek/mtk-mmsys.h>
>+#include <linux/soc/mediatek/mtk-mutex.h>
>+
>+#include "mtk_disp_drv.h"
>+#include "mtk_drm_crtc.h"
>+#include "mtk_drm_ddp_comp.h"
>+#include "mtk_drm_drv.h"
>+#include "mtk_ethdr.h"
>+
>+#define MTK_OVL_ADAPTOR_RDMA_MAX_WIDTH 1920
>+#define MTK_OVL_ADAPTOR_LAYER_NUM 4
>+
>+enum mtk_ovl_adaptor_comp_type {
>+	OVL_ADAPTOR_TYPE_RDMA = 0,
>+	OVL_ADAPTOR_TYPE_MERGE,
>+	OVL_ADAPTOR_TYPE_ETHDR,
>+	OVL_ADAPTOR_TYPE_NUM,
>+};
>+
>+enum mtk_ovl_adaptor_comp_id {
>+	OVL_ADAPTOR_MDP_RDMA0,
>+	OVL_ADAPTOR_MDP_RDMA1,
>+	OVL_ADAPTOR_MDP_RDMA2,
>+	OVL_ADAPTOR_MDP_RDMA3,
>+	OVL_ADAPTOR_MDP_RDMA4,
>+	OVL_ADAPTOR_MDP_RDMA5,
>+	OVL_ADAPTOR_MDP_RDMA6,
>+	OVL_ADAPTOR_MDP_RDMA7,
>+	OVL_ADAPTOR_MERGE0,
>+	OVL_ADAPTOR_MERGE1,
>+	OVL_ADAPTOR_MERGE2,
>+	OVL_ADAPTOR_MERGE3,
>+	OVL_ADAPTOR_ETHDR0,
>+	OVL_ADAPTOR_ID_MAX
>+};
>+
>+struct ovl_adaptor_comp_match {
>+	enum mtk_ovl_adaptor_comp_type type;
>+	int alias_id;
>+};
>+
>+struct mtk_disp_ovl_adaptor {
>+	struct device *ovl_adaptor_comp[OVL_ADAPTOR_ID_MAX];
>+	struct device *mmsys_dev;
>+	bool children_bound;
>+};
>+
>+static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
>+	[OVL_ADAPTOR_TYPE_RDMA]		= "vdo1-rdma",
>+	[OVL_ADAPTOR_TYPE_MERGE]	= "merge",
>+	[OVL_ADAPTOR_TYPE_ETHDR]	= "ethdr",
>+};
>+
>+static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
>+	[OVL_ADAPTOR_MDP_RDMA0]	= { OVL_ADAPTOR_TYPE_RDMA, 0 },
>+	[OVL_ADAPTOR_MDP_RDMA1]	= { OVL_ADAPTOR_TYPE_RDMA, 1 },
>+	[OVL_ADAPTOR_MDP_RDMA2]	= { OVL_ADAPTOR_TYPE_RDMA, 2 },
>+	[OVL_ADAPTOR_MDP_RDMA3]	= { OVL_ADAPTOR_TYPE_RDMA, 3 },
>+	[OVL_ADAPTOR_MDP_RDMA4]	= { OVL_ADAPTOR_TYPE_RDMA, 4 },
>+	[OVL_ADAPTOR_MDP_RDMA5]	= { OVL_ADAPTOR_TYPE_RDMA, 5 },
>+	[OVL_ADAPTOR_MDP_RDMA6]	= { OVL_ADAPTOR_TYPE_RDMA, 6 },
>+	[OVL_ADAPTOR_MDP_RDMA7]	= { OVL_ADAPTOR_TYPE_RDMA, 7 },
>+	[OVL_ADAPTOR_MERGE0]	= { OVL_ADAPTOR_TYPE_MERGE, 1 },
>+	[OVL_ADAPTOR_MERGE1]	= { OVL_ADAPTOR_TYPE_MERGE, 2 },
>+	[OVL_ADAPTOR_MERGE2]	= { OVL_ADAPTOR_TYPE_MERGE, 3 },
>+	[OVL_ADAPTOR_MERGE3]	= { OVL_ADAPTOR_TYPE_MERGE, 4 },
>+	[OVL_ADAPTOR_ETHDR0]	= { OVL_ADAPTOR_TYPE_ETHDR, 0 },
>+};
>+
>+void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
>+				  struct mtk_plane_state *state,
>+				  struct cmdq_pkt *cmdq_pkt)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+	struct mtk_plane_pending_state *pending = &state->pending;
>+	struct mtk_mdp_rdma_cfg rdma_config = {0};
>+	struct device *rdma_l;
>+	struct device *rdma_r;
>+	struct device *merge;
>+	struct device *ethdr;
>+	const struct drm_format_info *fmt_info = drm_format_info(pending->format);
>+	bool use_dual_pipe = false;
>+	unsigned int align_width;
>+	unsigned int l_w = 0;
>+	unsigned int r_w = 0;
>+
>+	dev_dbg(dev, "%s+ idx:%d, enable:%d, fmt:0x%x\n", __func__, idx,
>+		pending->enable, pending->format);
>+	dev_dbg(dev, "addr 0x%pad, fb w:%d, {%d,%d,%d,%d}\n",
>+		&pending->addr, (pending->pitch / fmt_info->cpp[0]),
>+		pending->x, pending->y, pending->width, pending->height);
>+
>+	rdma_l = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * idx];
>+	rdma_r = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * idx + 1];
>+	merge = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + idx];
>+	ethdr = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0];
>+
>+	if (!pending->enable) {
>+		mtk_merge_stop_cmdq(merge, cmdq_pkt);
>+		mtk_mdp_rdma_stop(rdma_l, cmdq_pkt);
>+		mtk_mdp_rdma_stop(rdma_r, cmdq_pkt);
>+		mtk_ethdr_layer_config(ethdr, idx, state, cmdq_pkt);
>+		return;
>+	}
>+
>+	/* ETHDR is in 1T2P domain, width needs to be 2 pixels align */
>+	align_width = ALIGN_DOWN(pending->width, 2);
>+
>+	if (align_width > MTK_OVL_ADAPTOR_RDMA_MAX_WIDTH)
>+		use_dual_pipe = true;
>+
>+	if (use_dual_pipe) {
>+		l_w = (align_width / 2) + ((pending->width / 2) % 2);
>+		r_w = align_width - l_w;
>+	} else {
>+		l_w = align_width;
>+	}
>+	mtk_merge_advance_config(merge, l_w, r_w, pending->height, 0, 0, cmdq_pkt);
>+	mtk_mmsys_merge_async_config(ovl_adaptor->mmsys_dev, idx, align_width / 2,
>+				     pending->height, cmdq_pkt);
>+
>+	rdma_config.width = l_w;
>+	rdma_config.height = pending->height;
>+	rdma_config.addr0 = pending->addr;
>+	rdma_config.pitch = pending->pitch;
>+	rdma_config.fmt = pending->format;
>+	rdma_config.color_encoding = pending->color_encoding;
>+	mtk_mdp_rdma_config(rdma_l, &rdma_config, cmdq_pkt);
>+
>+	if (use_dual_pipe) {
>+		rdma_config.x_left = l_w;
>+		rdma_config.width = r_w;
>+		mtk_mdp_rdma_config(rdma_r, &rdma_config, cmdq_pkt);
>+	}
>+
>+	mtk_merge_start_cmdq(merge, cmdq_pkt);
>+
>+	mtk_mdp_rdma_start(rdma_l, cmdq_pkt);
>+	if (use_dual_pipe)
>+		mtk_mdp_rdma_start(rdma_r, cmdq_pkt);
>+	else
>+		mtk_mdp_rdma_stop(rdma_r, cmdq_pkt);
>+
>+	mtk_ethdr_layer_config(ethdr, idx, state, cmdq_pkt);
>+}
>+
>+void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
>+			    unsigned int h, unsigned int vrefresh,
>+			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	mtk_ethdr_config(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0], w, h,
>+			 vrefresh, bpc, cmdq_pkt);
>+}
>+
>+void mtk_ovl_adaptor_start(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	mtk_ethdr_start(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
>+}
>+
>+void mtk_ovl_adaptor_stop(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	mtk_ethdr_stop(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
>+}
>+
>+int mtk_ovl_adaptor_clk_enable(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+	struct device *comp;
>+	int ret;
>+	int i;
>+
>+	for (i = 0; i < OVL_ADAPTOR_MERGE0; i++) {
>+		comp = ovl_adaptor->ovl_adaptor_comp[i];
>+		ret = pm_runtime_get_sync(comp);
>+		if (ret < 0) {
>+			dev_err(dev, "Failed to enable power domain %d, err %d\n", i, ret);
>+			goto pwr_err;
>+		}
>+	}
>+
>+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
>+		comp = ovl_adaptor->ovl_adaptor_comp[i];
>+
>+		if (i < OVL_ADAPTOR_MERGE0)
>+			ret = mtk_mdp_rdma_clk_enable(comp);
>+		else if (i < OVL_ADAPTOR_ETHDR0)
>+			ret = mtk_merge_clk_enable(comp);
>+		else
>+			ret = mtk_ethdr_clk_enable(comp);
>+		if (ret) {
>+			dev_err(dev, "Failed to enable clock %d, err %d\n", i, ret);
>+			goto clk_err;
>+		}
>+	}
>+
>+	return ret;
>+
>+clk_err:
>+	while (--i >= 0) {
>+		comp = ovl_adaptor->ovl_adaptor_comp[i];
>+		if (i < OVL_ADAPTOR_MERGE0)
>+			mtk_mdp_rdma_clk_disable(comp);
>+		else if (i < OVL_ADAPTOR_ETHDR0)
>+			mtk_merge_clk_disable(comp);
>+		else
>+			mtk_ethdr_clk_disable(comp);
>+	}
>+	i = OVL_ADAPTOR_MERGE0;
>+
>+pwr_err:
>+	while (--i >= 0)
>+		pm_runtime_put(ovl_adaptor->ovl_adaptor_comp[i]);
>+
>+	return ret;
>+}
>+
>+void mtk_ovl_adaptor_clk_disable(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+	struct device *comp;
>+	int i;
>+
>+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
>+		comp = ovl_adaptor->ovl_adaptor_comp[i];
>+
>+		if (i < OVL_ADAPTOR_MERGE0) {
>+			mtk_mdp_rdma_clk_disable(comp);
>+			pm_runtime_put(comp);
>+		} else if (i < OVL_ADAPTOR_ETHDR0) {
>+			mtk_merge_clk_disable(comp);
>+		} else {
>+			mtk_ethdr_clk_disable(comp);
>+		}
>+	}
>+}
>+
>+unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev)
>+{
>+	return MTK_OVL_ADAPTOR_LAYER_NUM;
>+}
>+
>+struct device *mtk_ovl_adaptor_dma_dev_get(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	return ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0];
>+}
>+
>+void mtk_ovl_adaptor_register_vblank_cb(struct device *dev, void (*vblank_cb)(void *),
>+					void *vblank_cb_data)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	mtk_ethdr_register_vblank_cb(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0],
>+				     vblank_cb, vblank_cb_data);
>+}
>+
>+void mtk_ovl_adaptor_unregister_vblank_cb(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	mtk_ethdr_unregister_vblank_cb(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
>+}
>+
>+void mtk_ovl_adaptor_enable_vblank(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	mtk_ethdr_enable_vblank(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
>+}
>+
>+void mtk_ovl_adaptor_disable_vblank(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	mtk_ethdr_disable_vblank(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
>+}
>+
>+void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex)
>+{
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA0);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA1);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA2);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA3);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA4);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA5);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA6);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA7);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE1);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE2);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE3);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE4);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
>+}
>+
>+void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex)
>+{
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA0);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA1);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA2);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA3);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA4);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA5);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA6);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA7);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE1);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE2);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE3);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE4);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
>+}
>+
>+void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev, unsigned int next)
>+{
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MDP_RDMA0, DDP_COMPONENT_MERGE1);
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MDP_RDMA1, DDP_COMPONENT_MERGE1);
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MDP_RDMA2, DDP_COMPONENT_MERGE2);
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_ETHDR_MIXER, next);
>+}
>+
>+void mtk_ovl_adaptor_disconnect(struct device *dev, struct device *mmsys_dev, unsigned int next)
>+{
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MDP_RDMA0, DDP_COMPONENT_MERGE1);
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MDP_RDMA1, DDP_COMPONENT_MERGE1);
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MDP_RDMA2, DDP_COMPONENT_MERGE2);
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_ETHDR_MIXER, next);
>+}
>+
>+static int ovl_adaptor_comp_get_id(struct device *dev, struct device_node *node,
>+				   enum mtk_ovl_adaptor_comp_type type)
>+{
>+	int alias_id = of_alias_get_id(node, private_comp_stem[type]);
>+	int i;
>+
>+	for (i = 0; i < ARRAY_SIZE(comp_matches); i++)
>+		if (comp_matches[i].type == type &&
>+		    comp_matches[i].alias_id == alias_id)
>+			return i;
>+
>+	dev_warn(dev, "Failed to get id. type: %d, alias: %d\n", type, alias_id);
>+	return -EINVAL;
>+}
>+
>+static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
>+	{
>+		.compatible = "mediatek,mt8195-vdo1-rdma",
>+		.data = (void *)OVL_ADAPTOR_TYPE_RDMA,
>+	}, {
>+		.compatible = "mediatek,mt8195-disp-merge",
>+		.data = (void *)OVL_ADAPTOR_TYPE_MERGE,
>+	}, {
>+		.compatible = "mediatek,mt8195-disp-ethdr",
>+		.data = (void *)OVL_ADAPTOR_TYPE_ETHDR,
>+	},
>+	{},
>+};
>+
>+static int compare_of(struct device *dev, void *data)
>+{
>+	return dev->of_node == data;
>+}
>+
>+static int ovl_adaptor_comp_init(struct device *dev, struct component_match **match)
>+{
>+	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
>+	struct device_node *node, *parent;
>+	struct platform_device *comp_pdev;
>+
>+	parent = dev->parent->parent->of_node->parent;
>+
>+	for_each_child_of_node(parent, node) {
>+		const struct of_device_id *of_id;
>+		enum mtk_ovl_adaptor_comp_type type;
>+		int id;
>+
>+		of_id = of_match_node(mtk_ovl_adaptor_comp_dt_ids, node);
>+		if (!of_id)
>+			continue;
>+
>+		if (!of_device_is_available(node)) {
>+			dev_dbg(dev, "Skipping disabled component %pOF\n",
>+				node);
>+			continue;
>+		}
>+
>+		type = (enum mtk_ovl_adaptor_comp_type)of_id->data;
>+		id = ovl_adaptor_comp_get_id(dev, node, type);
>+		if (id < 0) {
>+			dev_warn(dev, "Skipping unknown component %pOF\n",
>+				 node);
>+			continue;
>+		}
>+
>+		comp_pdev = of_find_device_by_node(node);
>+		if (!comp_pdev)
>+			return -EPROBE_DEFER;
>+
>+		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
>+
>+		drm_of_component_match_add(dev, match, compare_of, node);
>+		dev_dbg(dev, "Adding component match for %pOF\n", node);
>+	}
>+
>+	return 0;
>+}
>+
>+static int mtk_disp_ovl_adaptor_comp_bind(struct device *dev, struct device *master,
>+					  void *data)
>+{
>+	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
>+
>+	if (!priv->children_bound)
>+		return -EPROBE_DEFER;
>+
>+	return 0;
>+}
>+
>+static void mtk_disp_ovl_adaptor_comp_unbind(struct device *dev, struct device *master,
>+					     void *data)
>+{
>+}
>+
>+static const struct component_ops mtk_disp_ovl_adaptor_comp_ops = {
>+	.bind	= mtk_disp_ovl_adaptor_comp_bind,
>+	.unbind = mtk_disp_ovl_adaptor_comp_unbind,
>+};
>+
>+static int mtk_disp_ovl_adaptor_master_bind(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
>+	int ret;
>+
>+	ret = component_bind_all(dev, priv->mmsys_dev);
>+	if (ret)
>+		return dev_err_probe(dev, ret, "component_bind_all failed!\n");
>+
>+	priv->children_bound = true;
>+	return 0;
>+}
>+
>+static void mtk_disp_ovl_adaptor_master_unbind(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
>+
>+	priv->children_bound = false;
>+}
>+
>+static const struct component_master_ops mtk_disp_ovl_adaptor_master_ops = {
>+	.bind		= mtk_disp_ovl_adaptor_master_bind,
>+	.unbind		= mtk_disp_ovl_adaptor_master_unbind,
>+};
>+
>+static int mtk_disp_ovl_adaptor_probe(struct platform_device *pdev)
>+{
>+	struct mtk_disp_ovl_adaptor *priv;
>+	struct device *dev = &pdev->dev;
>+	struct component_match *match = NULL;
>+	int ret;
>+
>+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>+	if (!priv)
>+		return -ENOMEM;
>+
>+	platform_set_drvdata(pdev, priv);
>+
>+	ret = ovl_adaptor_comp_init(dev, &match);
>+	if (ret < 0)
>+		return ret;
>+
>+	priv->mmsys_dev = pdev->dev.platform_data;
>+
>+	component_master_add_with_match(dev, &mtk_disp_ovl_adaptor_master_ops, match);

Here the code assumes match is not NULL and that
ovl_adaptor_comp_init() allocated it
with a call to drm_of_component_match_add() which never happens in
case of a buggy dts.
IMHO, ovl_adaptor_comp_init() should return an error in case no
components have been found.

[    0.936986] mediatek-disp-ovl-adaptor
mediatek-disp-ovl-adaptor.2.auto: Failed to get id. type: 1, alias:
-19
[    0.938238] mediatek-disp-ovl-adaptor
mediatek-disp-ovl-adaptor.2.auto: Skipping unknown component
/soc/merge@1c014000
[    0.939596] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000000
[    0.940701] Mem abort info:
[    0.941064]   ESR = 0x0000000096000004
[    0.941538]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.942208]   SET = 0, FnV = 0
[    0.942595]   EA = 0, S1PTW = 0
[    0.942993]   FSC = 0x04: level 0 translation fault
[    0.943607] Data abort info:
[    0.943972]   ISV = 0, ISS = 0x00000004
[    0.944455]   CM = 0, WnR = 0
[    0.944835] [0000000000000000] user address but active_mm is swapper
[    0.945636] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    0.946340] CPU: 6 PID: 1 Comm: swapper/0 Not tainted
6.0.0-rc1-next-20220818-mtk #17
[    0.947327] swapper/0[1] cmdline: b
[    0.947327]
[    0.947976] Hardware name: MediaTek MT8195 demo board (DT)
[    0.948666] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.949545] pc : component_master_add_with_match+0x24/0x100
[    0.950257] lr : mtk_disp_ovl_adaptor_probe+0x1d0/0x280
[    0.950925] sp : ffff80000a62b720
[    0.951344] x29: ffff80000a62b720 x28: 0000000000000000 x27: ffff0000048dac10
[    0.952248] x26: ffff00007fbbdda0 x25: 0000000000000001 x24: 0000000000000000
[    0.953149] x23: ffff0000048dac00 x22: ffff8000097e29d0 x21: ffff0000048dac10
[    0.954050] x20: 0000000000000000 x19: 0000000000000000 x18: ffffffffffffffff
[    0.954951] x17: 70696b53203a6f74 x16: 75612e322e726f74 x15: 0720072007200720
[    0.955852] x14: 0720072007200720 x13: ffff80000a3787e0 x12: 00000000000002af
[    0.956752] x11: 00000000000000e5 x10: ffff84000bfe5dc8 x9 : 0000000000000002
[    0.957653] x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : 01fefefefefefeff
[    0.958553] x5 : 0000000000000014 x4 : 0000000000000000 x3 : ffff0000048db000
[    0.959453] x2 : 0000000000000000 x1 : ffff8000097e29d0 x0 : ffff0000048dac10
[    0.960354] Call trace:
[    0.960664]  component_master_add_with_match+0x24/0x100
[    0.961326]  mtk_disp_ovl_adaptor_probe+0x1d0/0x280
[    0.961945]  platform_probe+0x6c/0xe0
[    0.962411]  really_probe+0xbc/0x2d4
[    0.962864]  __driver_probe_device+0x78/0xe0
[    0.963404]  driver_probe_device+0x40/0x12c
[    0.963933]  __device_attach_driver+0xec/0x154
[    0.964496]  bus_for_each_drv+0x78/0xd0
[    0.964982]  __device_attach+0xa8/0x1c0
[    0.965467]  device_initial_probe+0x18/0x2c
[    0.965997]  bus_probe_device+0x9c/0xa4
[    0.966482]  device_add+0x384/0x870
[    0.966927]  platform_device_add+0x118/0x23c
[    0.967470]  platform_device_register_full+0x104/0x18c
[    0.968120]  mtk_drm_probe+0x31c/0x440
[    0.968596]  platform_probe+0x6c/0xe0
[    0.969061]  really_probe+0xbc/0x2d4
[    0.969515]  __driver_probe_device+0x78/0xe0
[    0.970055]  driver_probe_device+0x40/0x12c
[    0.970584]  __driver_attach+0x120/0x1d0
[    0.971080]  bus_for_each_dev+0x70/0xcc
[    0.971569]  driver_attach+0x28/0x34
[    0.972022]  bus_add_driver+0x148/0x200
[    0.972507]  driver_register+0x7c/0x13c
[    0.972993]  __platform_register_drivers+0x54/0xdc
[    0.973600]  mtk_drm_init+0x24/0x30
[    0.974044]  do_one_initcall+0x6c/0x148
[    0.974530]  kernel_init_freeable+0x208/0x288
[    0.975080]  kernel_init+0x28/0x130
[    0.975526]  ret_from_fork+0x10/0x20
[    0.975984] Code: aa0203f4 a9025bf5 aa0003f5 aa0103f6 (a9400440)
[    0.976753] ---[ end trace 0000000000000000 ]---
[    0.977347] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[    0.978311] SMP: stopping secondary CPUs
[    0.978811] Kernel Offset: disabled
[    0.979252] CPU features: 0x2000,0001c029,19801c82
[    0.979856] Memory Limit: none
[    0.980243] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x0000000b ]---


Thx,
Guillaume.
>+	pm_runtime_enable(dev);
>+
>+	ret = component_add(dev, &mtk_disp_ovl_adaptor_comp_ops);
>+	if (ret != 0) {
>+		pm_runtime_disable(dev);
>+		dev_err(dev, "Failed to add component: %d\n", ret);
>+	}
>+
>+	return ret;
>+}
>+
>+static int mtk_disp_ovl_adaptor_remove(struct platform_device *pdev)
>+{
>+	component_master_del(&pdev->dev, &mtk_disp_ovl_adaptor_master_ops);
>+	pm_runtime_disable(&pdev->dev);
>+	return 0;
>+}
>+
>+struct platform_driver mtk_disp_ovl_adaptor_driver = {
>+	.probe		= mtk_disp_ovl_adaptor_probe,
>+	.remove		= mtk_disp_ovl_adaptor_remove,
>+	.driver		= {
>+		.name	= "mediatek-disp-ovl-adaptor",
>+		.owner	= THIS_MODULE,
>+	},
>+};
>diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>index 3b393e4b364a..51bee36579ef 100644
>--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>@@ -57,6 +57,7 @@ extern struct platform_driver mtk_disp_ccorr_driver;
> extern struct platform_driver mtk_disp_color_driver;
> extern struct platform_driver mtk_disp_gamma_driver;
> extern struct platform_driver mtk_disp_merge_driver;
>+extern struct platform_driver mtk_disp_ovl_adaptor_driver;
> extern struct platform_driver mtk_disp_ovl_driver;
> extern struct platform_driver mtk_disp_rdma_driver;
> extern struct platform_driver mtk_dpi_driver;
>--
>2.18.0
>
>
