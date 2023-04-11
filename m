Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195276DD9D5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 13:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6871710E3C3;
	Tue, 11 Apr 2023 11:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C7A010E3C3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 11:44:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,336,1673881200"; d="scan'208";a="155597425"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 11 Apr 2023 20:44:03 +0900
Received: from localhost.localdomain (unknown [10.226.93.123])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id D7C51400195D;
 Tue, 11 Apr 2023 20:43:58 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v7 16/17] drm: rcar-du: Move rcar_du_properties_init()
Date: Tue, 11 Apr 2023 12:42:34 +0100
Message-Id: <20230411114235.366042-17-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411114235.366042-1-biju.das.jz@bp.renesas.com>
References: <20230411114235.366042-1-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move rcar_du_properties_init() to RCar DU kms lib, so that it can be
shared by both RCar and RZ/G2L kms drivers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Rebased to drm-tip.
v1->v6:
 * Rebased on drm-misc-next and DU-next.
v1:
 * Created the lib suggested by Laurent.
Ref:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220316131100.30685-6-biju.das.jz@bp.renesas.com/
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
index 781e666a45a8..438a56c550f2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -637,3 +637,19 @@ int rcar_du_encoders_init(struct rcar_du_device *rcdu,
 
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
index ace973b80fe6..50e92a19d98c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -51,4 +51,6 @@ int rcar_du_encoders_init(struct rcar_du_device *rcdu,
 						 enum rcar_du_output output,
 						 struct device_node *enc_node));
 
+int rcar_du_properties_init(struct rcar_du_device *rcdu);
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

