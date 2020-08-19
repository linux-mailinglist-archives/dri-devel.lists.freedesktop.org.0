Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9188824AFA9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194DB6E8BA;
	Thu, 20 Aug 2020 07:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxwww.masterlogin.de (mxwww.masterlogin.de
 [IPv6:2a03:2900:1:1::a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F8C6E204
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 08:20:03 +0000 (UTC)
Received: from mxout2.routing.net (unknown [192.168.10.82])
 by backup.mxwww.masterlogin.de (Postfix) with ESMTPS id 945A82C6A9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 08:18:05 +0000 (UTC)
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
 by mxout2.routing.net (Postfix) with ESMTP id 58E385FA8E;
 Wed, 19 Aug 2020 08:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1597825082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fCnnVcg/G7GdQeEsbRfkh+kAyhmqBcsohyCq/tDvKFE=;
 b=vjUoPMp+9XfEPRWmYrmUWhu6Uw/jLdSKBUxWfiu4QLed6scFY7gTJfFYXacf99d/9LiUm6
 TNUC/lAVlEisZIkgneLnPrXoLs18FN5Ks8XAnp7CBpv/4Bg8zWx84/j3cDhFirFLD0Gk7K
 VAHFEqyTe/4daKSB82ass/Sec6QmSXc=
Received: from localhost.localdomain (fttx-pool-185.76.97.101.bambit.de
 [185.76.97.101])
 by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 7409610058A;
 Wed, 19 Aug 2020 08:18:01 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v5 4/7] drm/mediatek: Add get_possible_crtc API for dpi, dsi
Date: Wed, 19 Aug 2020 10:17:49 +0200
Message-Id: <20200819081752.4805-5-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200819081752.4805-1-linux@fw-web.de>
References: <20200819081752.4805-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 Stu Hsieh <stu.hsieh@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stu Hsieh <stu.hsieh@mediatek.com>

For current mediatek dsi encoder, its possible crtc is fixed in crtc
0, and mediatek dpi encoder's possible crtc is fixed in crtc 1. In
some SoC the possible crtc is not fixed in this case, so search
pipeline information to find out the correct possible crtc.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 42 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  2 +
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 57c88de9a329..a5f2ff6bea93 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -13,6 +13,8 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
+#include <drm/drm_print.h>
+
 #include "mtk_drm_drv.h"
 #include "mtk_drm_plane.h"
 #include "mtk_drm_ddp_comp.h"
@@ -412,6 +414,22 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
 };
 
+static bool mtk_drm_find_comp_in_ddp(struct mtk_ddp_comp ddp_comp,
+					 const enum mtk_ddp_comp_id *path,
+					 unsigned int path_len)
+{
+	unsigned int i;
+
+	if (path == NULL)
+		return false;
+
+	for (i = 0U; i < path_len; i++)
+		if (ddp_comp.id == path[i])
+			return true;
+
+	return false;
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type)
 {
@@ -427,6 +445,30 @@ int mtk_ddp_comp_get_id(struct device_node *node,
 	return -EINVAL;
 }
 
+unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
+						struct mtk_ddp_comp ddp_comp)
+{
+	struct mtk_drm_private *private = drm->dev_private;
+	unsigned int ret;
+
+	if (mtk_drm_find_comp_in_ddp(ddp_comp, private->data->main_path,
+		private->data->main_len) == true) {
+		ret = BIT(0);
+	} else if (mtk_drm_find_comp_in_ddp(ddp_comp,
+		private->data->ext_path,
+		private->data->ext_len) == true) {
+		ret = BIT(1);
+	} else if (mtk_drm_find_comp_in_ddp(ddp_comp,
+		private->data->third_path,
+		private->data->third_len) == true) {
+		ret = BIT(2);
+	} else {
+		DRM_INFO("Failed to find comp in ddp table\n");
+		ret = 0;
+	}
+	return ret;
+}
+
 int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 		      struct mtk_ddp_comp *comp, enum mtk_ddp_comp_id comp_id,
 		      const struct mtk_ddp_comp_funcs *funcs)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index debe36395fe7..1d9e00b69462 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -202,6 +202,8 @@ static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
 
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
+unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
+						struct mtk_ddp_comp ddp_comp);
 int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node,
 		      struct mtk_ddp_comp *comp, enum mtk_ddp_comp_id comp_id,
 		      const struct mtk_ddp_comp_funcs *funcs);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
