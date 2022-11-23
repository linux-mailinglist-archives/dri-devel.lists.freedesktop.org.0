Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F274C636738
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 18:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595EB10E5DA;
	Wed, 23 Nov 2022 17:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0683410E5CF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 17:30:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.96,187,1665414000"; d="scan'208";a="140988311"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 24 Nov 2022 02:30:07 +0900
Received: from localhost.localdomain (unknown [10.226.92.61])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 58ADB40AE61B;
 Thu, 24 Nov 2022 02:30:04 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 16/19] drm: rcar-du: Move rcar_du_properties_init()
Date: Wed, 23 Nov 2022 17:29:03 +0000
Message-Id: <20221123172906.2919734-17-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
References: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move rcar_du_properties_init() to RCar DU kms lib, so that it can be
shared by both RCar and RZ/G2L kms drivers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Rebase to drm-misc-next.
v5:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 16 ----------------
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 16 ++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |  2 ++
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 94f1602ea707..01ffe36f9d44 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -69,22 +69,6 @@ static const struct drm_mode_config_funcs rcar_du_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static int rcar_du_properties_init(struct rcar_du_device *rcdu)
-{
-	/*
-	 * The color key is expressed as an RGB888 triplet stored in a 32-bit
-	 * integer in XRGB8888 format. Bit 24 is used as a flag to disable (0)
-	 * or enable source color keying (1).
-	 */
-	rcdu->props.colorkey =
-		drm_property_create_range(&rcdu->ddev, 0, "colorkey",
-					  0, 0x01ffffff);
-	if (rcdu->props.colorkey == NULL)
-		return -ENOMEM;
-
-	return 0;
-}
-
 static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
 {
 	const struct device_node *np = rcdu->dev->of_node;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
index 5fe2a1bd8de2..21777d782018 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -608,3 +608,19 @@ int rcar_du_encoders_init(struct rcar_du_device *rcdu,
 
 	return num_encoders;
 }
+
+int rcar_du_properties_init(struct rcar_du_device *rcdu)
+{
+	/*
+	 * The color key is expressed as an RGB888 triplet stored in a 32-bit
+	 * integer in XRGB8888 format. Bit 24 is used as a flag to disable (0)
+	 * or enable source color keying (1).
+	 */
+	rcdu->props.colorkey =
+		drm_property_create_range(&rcdu->ddev, 0, "colorkey",
+					  0, 0x01ffffff);
+	if (rcdu->props.colorkey == NULL)
+		return -ENOMEM;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
index 1028ce490484..8fcba1b9c28f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -52,4 +52,6 @@ int rcar_du_encoders_init(struct rcar_du_device *rcdu,
 						 enum rcar_du_output output,
 						 struct device_node *enc_node));
 
+int rcar_du_properties_init(struct rcar_du_device *rcdu);
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

