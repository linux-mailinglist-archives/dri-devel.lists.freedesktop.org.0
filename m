Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E946C2A37D6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 01:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BD36E5B6;
	Tue,  3 Nov 2020 00:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED8F6E5B4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 00:34:43 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7170122275;
 Tue,  3 Nov 2020 00:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604363683;
 bh=gbZH1psqQVOfFYRVGDfdWFHWQcwRxb/FRqAHy3ZGQ1A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KZTTBc4Y5TGlRxb+5S6Q1/vj2Hlz7rIRnb7gHHRYaTSTEJt0h5g2YIrPEfSfZ7EDq
 QIaAgSyYiIG17bu4uIWJfdDnxw22nTfVodvBrm4ra4p83tKgRQxDTi2KFVgh9Pkckd
 62qI8QkxKkOyCwaOO9AsSeKbJ4Ou2x96rwJXxEfE=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 01/11] drm/mediatek: Get CMDQ client register for all ddp
 component
Date: Tue,  3 Nov 2020 08:34:12 +0800
Message-Id: <20201103003422.17838-2-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201103003422.17838-1-chunkuang.hu@kernel.org>
References: <20201103003422.17838-1-chunkuang.hu@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only OVL, RDMA,and WDMA get CMDQ client register information,
but all ddp component should work with CMDQ, so get this
information for all ddp component.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 28 ++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 8eba44be3a8a..c17c0e4c030f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -506,6 +506,20 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 	if (IS_ERR(comp->clk))
 		return PTR_ERR(comp->clk);
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (of_address_to_resource(node, 0, &res) != 0) {
+		dev_err(dev, "Missing reg in %s node\n", node->full_name);
+		return -EINVAL;
+	}
+	comp->regs_pa = res.start;
+
+	ret = cmdq_dev_get_client_reg(dev, &cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+	else
+		comp->subsys = cmdq_reg.subsys;
+#endif
+
 	/* Only DMA capable components need the LARB property */
 	comp->larb_dev = NULL;
 	if (type != MTK_DISP_OVL &&
@@ -531,20 +545,6 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 
 	comp->larb_dev = &larb_pdev->dev;
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (of_address_to_resource(node, 0, &res) != 0) {
-		dev_err(dev, "Missing reg in %s node\n", node->full_name);
-		put_device(&larb_pdev->dev);
-		return -EINVAL;
-	}
-	comp->regs_pa = res.start;
-
-	ret = cmdq_dev_get_client_reg(dev, &cmdq_reg, 0);
-	if (ret)
-		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
-	else
-		comp->subsys = cmdq_reg.subsys;
-#endif
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
