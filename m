Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C64D23129C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269196E32F;
	Tue, 28 Jul 2020 19:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D136E27A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 11:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1595935439;
 bh=pm4hEMlP1SzMjKQ+uHyoY76koqrhvWkeRDQON2vGLX0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=AmFbzykNBZQTRiIV9oPTEnRUx7QCUGkI2O6YEfw0WAyK0+r+tOoib/AU+kniqitxb
 NkIiEcBVyMuHl4R6qFdSe5T5VzUHTbGVGYirvbPO8rcbBaOyrZ4I0T2pRbgLNTxL+J
 0V9PmJZEmP0sIFXb1CXFZZ0gFsSw5RRcJr7t0tKM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.208.215.239]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MWRVb-1kGiTE44Mt-00Xw1i; Tue, 28 Jul 2020 13:18:24 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/5] drm: Add get_possible_crtc API for dpi, dsi
Date: Tue, 28 Jul 2020 13:17:58 +0200
Message-Id: <20200728111800.77641-4-frank-w@public-files.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200728111800.77641-1-frank-w@public-files.de>
References: <20200728111800.77641-1-frank-w@public-files.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:hmgR7ODYKvx8oPlcDw8Lc1GdvQDfiX/JgJnDv87nXPtte2migzq
 ZD98y+zmB/ZdT2oYW7Y7j8ofZCmyvZqa5eJRoXNRmZdV4lhEsqqiCqPF33I3WAZ5nzXzcip
 5b5gV7A/c4AzsF40MizKtDOUfJhcDZss5KO+Y5HIkLY1uKWgvNw03Vd+wONHCMSGrAmN1Ya
 g9M6z+lByXTke2b9AhiEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oPyIn61eoKU=:nWp+QYvJjVVqkKeqzkZ3Ph
 iYhrAl39Sn+LkOU9rBjxbm1Vm302BuYvnEEl79NA0BLBarrTogeumxQ8QBX2Busheudtwlrq1
 J+WMPwzQPO3EYSsgAAgblYGL5AMT2YrnLZiUsv5kNcml3yIpeLCSl/s2mCKgC5Zxl8a1UUM5R
 nkePdaBfmvSjaSbrnJw20XLTVNLLaMLeLyF9duUS4M8PXJTAs5uXDXmNXyRX4YlsgZ1uhWG7q
 o8g7b1jQpVgjFOuwHiX7kHLhiYGo2rWJN0zKxNtaYoldIiHmpsVrUqzaRCuPR1RjZIetMiJHP
 4Qw9D5or4wG8KN/c5JbSv4BmGP+dluzqv0lkjO1H9AA/4bljZ3426xJSYA/L8qjgkWX8kG6Sb
 gEiTgAjCvEKwYEtA0kFn2+GOs17x9jFd4eMSwwPgvXnrtF0BCSDDUUIyInlkPTpr5VKj85/cx
 F70WQabQqC0M8rKPBnJjdM3C3c+wZViza8PNlmfJ6zYZxd8qSdRD6TTMtrN9cghoqEInljPMz
 0VLmSycUjPNKA7u3mqMM543Clt2LSwkT7qGicuITH1guySLNmA9L7juadcD4BJXP0DmXNOTqc
 22pE1vaQmO6sx7DgMXo7lR/R1ZmyFSJw/2ozGLn3wyMp9k4d0JSy74BVpmjxHEDjrfyMJniNN
 WdPjXUPCoYStIchNH9FOAIp0eItPLe3phG2d7Ahi5HnvDlV6r/StUs/lKlZqynOsbHDfZFVAn
 JzJodKpBU2BeoocRiP7eXxdmndwIihGWqb5qRPwmd4moZEcPS7t4gZOKHgiiYV5qlanSx2ugV
 s4yCVIRTFu695Eqlc9yvzCZk907gQwPBNgPbgz3KySazB1SY4cpBkH1wgHzfgsp5F1uyQQHzG
 84twun77hsqG7a2WazqIlRY7X3pfQZWKc/Jn5fJ3qSiCUdMd5V/OTwwSs0nBk3VD4g/vMZKCM
 eqkEwLBht4YhNNmraQqwONSZaXzBmKxBuko8FczOeeV5E7CplE9TruMzrvi1I+9k3VNmhbpgV
 mdWz9RTLUBoDl/xBfID6snAOoQjDboLe8Y7W0buefuFL6RIhXomKz8WHDYuiIbbjKuO9U6glZ
 AziyPftih3jgg4K+q1MSxUw3PkEta0kLJmB3iCuFVjndDfAHhcxZcLCmpqBQ74PNhpDTltSyf
 AfC6WNyz14AT4VICmDb3+2HdldqdOLQcIHKvobkolRkJoNLn363uLOMSE6X8yKZLLpE+fFfeM
 W3ECbbV6zftFuw7D8ngkScRVyKWmQRlqzr9m/lw==
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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

Test: build pass and run ok

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
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
