Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66221AA3C26
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 01:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D9510E46E;
	Tue, 29 Apr 2025 23:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IPg6exgw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618C410E46E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 23:29:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A925836;
 Wed, 30 Apr 2025 01:29:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745969348;
 bh=Ubbxx9GRRvc9M5rWBNuyZt4BJC2EZzHPJGyWZKI0m7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IPg6exgwByhyfMbQqIgMZDscVvt3pdSMIAZ1nOgnglUQcY55oNQXYATWJqkLrIEYE
 4ojD3oZc82vf3Qpx/Vm9qSufhkH599A2wB63g9eL8bgIclmmDKE52vgy3NyxTJNCEm
 gBcLb4IkYYvBh7plWH+jRmfqYNC1QYLi9cbpmSIE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 2/9] media: renesas: vsp1: Make HSI and HST modules optional
Date: Wed, 30 Apr 2025 02:28:57 +0300
Message-ID: <20250429232904.26413-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Not all VSP instance incorporate the HSI and HST modules. Add a
VSP1_HAS_HSIT feature flag, and create the modules only on VSP instances
that implement them.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1.h    |  1 +
 .../media/platform/renesas/vsp1/vsp1_drv.c    | 59 ++++++++++---------
 2 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
index 2f6f0c6ae555..44cb991f094f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1.h
@@ -56,6 +56,7 @@ struct vsp1_uif;
 #define VSP1_HAS_BRS		BIT(9)
 #define VSP1_HAS_EXT_DL		BIT(10)
 #define VSP1_HAS_NON_ZERO_LBA	BIT(11)
+#define VSP1_HAS_HSIT		BIT(12)
 
 struct vsp1_device_info {
 	u32 version;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 9fc6bf624a52..4697bf790954 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -302,22 +302,6 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
 		list_add_tail(&vsp1->clu->entity.list_dev, &vsp1->entities);
 	}
 
-	vsp1->hsi = vsp1_hsit_create(vsp1, true);
-	if (IS_ERR(vsp1->hsi)) {
-		ret = PTR_ERR(vsp1->hsi);
-		goto done;
-	}
-
-	list_add_tail(&vsp1->hsi->entity.list_dev, &vsp1->entities);
-
-	vsp1->hst = vsp1_hsit_create(vsp1, false);
-	if (IS_ERR(vsp1->hst)) {
-		ret = PTR_ERR(vsp1->hst);
-		goto done;
-	}
-
-	list_add_tail(&vsp1->hst->entity.list_dev, &vsp1->entities);
-
 	if (vsp1_feature(vsp1, VSP1_HAS_HGO) && vsp1->info->uapi) {
 		vsp1->hgo = vsp1_hgo_create(vsp1);
 		if (IS_ERR(vsp1->hgo)) {
@@ -340,6 +324,24 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
 			      &vsp1->entities);
 	}
 
+	if (vsp1_feature(vsp1, VSP1_HAS_HSIT)) {
+		vsp1->hsi = vsp1_hsit_create(vsp1, true);
+		if (IS_ERR(vsp1->hsi)) {
+			ret = PTR_ERR(vsp1->hsi);
+			goto done;
+		}
+
+		list_add_tail(&vsp1->hsi->entity.list_dev, &vsp1->entities);
+
+		vsp1->hst = vsp1_hsit_create(vsp1, false);
+		if (IS_ERR(vsp1->hst)) {
+			ret = PTR_ERR(vsp1->hst);
+			goto done;
+		}
+
+		list_add_tail(&vsp1->hst->entity.list_dev, &vsp1->entities);
+	}
+
 	/*
 	 * The LIFs are only supported when used in conjunction with the DU, in
 	 * which case the userspace API is disabled. If the userspace API is
@@ -683,8 +685,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.model = "VSP1-S",
 		.gen = 2,
 		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_HGO
-			  | VSP1_HAS_HGT | VSP1_HAS_LUT | VSP1_HAS_SRU
-			  | VSP1_HAS_WPF_VFLIP,
+			  | VSP1_HAS_HGT | VSP1_HAS_HSIT | VSP1_HAS_LUT
+			  | VSP1_HAS_SRU | VSP1_HAS_WPF_VFLIP,
 		.rpf_count = 5,
 		.uds_count = 3,
 		.wpf_count = 4,
@@ -694,7 +696,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.version = VI6_IP_VERSION_MODEL_VSPR_H2,
 		.model = "VSP1-R",
 		.gen = 2,
-		.features = VSP1_HAS_BRU | VSP1_HAS_SRU | VSP1_HAS_WPF_VFLIP,
+		.features = VSP1_HAS_BRU | VSP1_HAS_HSIT | VSP1_HAS_SRU
+			   | VSP1_HAS_WPF_VFLIP,
 		.rpf_count = 5,
 		.uds_count = 3,
 		.wpf_count = 4,
@@ -704,7 +707,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.version = VI6_IP_VERSION_MODEL_VSPD_GEN2,
 		.model = "VSP1-D",
 		.gen = 2,
-		.features = VSP1_HAS_BRU | VSP1_HAS_HGO | VSP1_HAS_LUT,
+		.features = VSP1_HAS_BRU | VSP1_HAS_HGO | VSP1_HAS_HSIT
+			  | VSP1_HAS_LUT,
 		.lif_count = 1,
 		.rpf_count = 4,
 		.uds_count = 1,
@@ -716,8 +720,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.model = "VSP1-S",
 		.gen = 2,
 		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_HGO
-			  | VSP1_HAS_HGT | VSP1_HAS_LUT | VSP1_HAS_SRU
-			  | VSP1_HAS_WPF_VFLIP,
+			  | VSP1_HAS_HGT | VSP1_HAS_HSIT | VSP1_HAS_LUT
+			  | VSP1_HAS_SRU | VSP1_HAS_WPF_VFLIP,
 		.rpf_count = 5,
 		.uds_count = 1,
 		.wpf_count = 4,
@@ -727,8 +731,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.version = VI6_IP_VERSION_MODEL_VSPS_V2H,
 		.model = "VSP1V-S",
 		.gen = 2,
-		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_LUT
-			  | VSP1_HAS_SRU | VSP1_HAS_WPF_VFLIP,
+		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_HSIT
+			  | VSP1_HAS_LUT | VSP1_HAS_SRU | VSP1_HAS_WPF_VFLIP,
 		.rpf_count = 4,
 		.uds_count = 1,
 		.wpf_count = 4,
@@ -738,7 +742,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.version = VI6_IP_VERSION_MODEL_VSPD_V2H,
 		.model = "VSP1V-D",
 		.gen = 2,
-		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_LUT,
+		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_HSIT
+			  | VSP1_HAS_LUT,
 		.lif_count = 1,
 		.rpf_count = 4,
 		.uds_count = 1,
@@ -750,8 +755,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.model = "VSP2-I",
 		.gen = 3,
 		.features = VSP1_HAS_CLU | VSP1_HAS_HGO | VSP1_HAS_HGT
-			  | VSP1_HAS_LUT | VSP1_HAS_SRU | VSP1_HAS_WPF_HFLIP
-			  | VSP1_HAS_WPF_VFLIP,
+			  | VSP1_HAS_HSIT | VSP1_HAS_LUT | VSP1_HAS_SRU
+			  | VSP1_HAS_WPF_HFLIP | VSP1_HAS_WPF_VFLIP,
 		.rpf_count = 1,
 		.uds_count = 1,
 		.wpf_count = 1,
-- 
Regards,

Laurent Pinchart

