Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2FAB2549C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 22:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6D510E7C1;
	Wed, 13 Aug 2025 20:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="MzRIwLaL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C17610E0A7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 20:41:18 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DKfAqH1727473;
 Wed, 13 Aug 2025 15:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755117670;
 bh=q+RaU6D8oPKsUsYlVoY8FLrYVu26TKlqINYhTvQ8xaQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=MzRIwLaLu7fwRmK/D5xZFlRTJqKkcaGxVMU9rZ7/iAHc0kaLEHp+iCsYBCcGehyXZ
 vxmUyAB6a7pMFRNd2Ec14dC03AEm8Zr2ZjVj8/D9i4luChKPq/A8u56l+5Q7b73Np6
 oDKNATpNOK+Cx/tAoIdRrm3eU/Zws040bBOJRAOc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DKfA0H644858
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 13 Aug 2025 15:41:10 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 15:41:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 15:41:09 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DKf9iR2853518;
 Wed, 13 Aug 2025 15:41:09 -0500
From: Nishanth Menon <nm@ti.com>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>, <afd@ti.com>, Nishanth Menon
 <nm@ti.com>
Subject: [PATCH V2 2/3] drm/bridge: it66121: Convert the vid/pid entries into
 a list
Date: Wed, 13 Aug 2025 15:41:05 -0500
Message-ID: <20250813204106.580141-3-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250813204106.580141-1-nm@ti.com>
References: <20250813204106.580141-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

The IT66122 is a drop in replacement for the IT66122. The part is
register compatible with what we use of the IT66121. The only relevant
change being the PID is now 0x0622 vs 0x0612. Add this extra PID so
probe does not fail during the PID check with these new parts.

Since production flow can result in multiple devices as the part gets
replaced, prepare for a match list that allows introducing additional
vid/pid matches for the same device profile.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
New Patch
- This sets up the stage for introducing it66122 support

 drivers/gpu/drm/bridge/ite-it66121.c | 29 ++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index aa7b1dcc5d70..208e118df0e2 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -289,9 +289,13 @@ enum chip_id {
 	ID_IT66121,
 };
 
+struct it66121_device_id {
+	u16 vid, pid;
+};
+
 struct it66121_chip_info {
 	enum chip_id id;
-	u16 vid, pid;
+	struct it66121_device_id device_id[]; /* NULL terminated List */
 };
 
 struct it66121_ctx {
@@ -1511,6 +1515,7 @@ static int it66121_probe(struct i2c_client *client)
 	int ret;
 	struct it66121_ctx *ctx;
 	struct device *dev = &client->dev;
+	const struct it66121_device_id *device_id;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_err(dev, "I2C check functionality failed.\n");
@@ -1574,11 +1579,15 @@ static int it66121_probe(struct i2c_client *client)
 	revision_id = FIELD_GET(IT66121_REVISION_MASK, device_ids[1]);
 	device_ids[1] &= IT66121_DEVICE_ID1_MASK;
 
-	if ((vendor_ids[1] << 8 | vendor_ids[0]) != ctx->info->vid ||
-	    (device_ids[1] << 8 | device_ids[0]) != ctx->info->pid) {
-		return -ENODEV;
+	for (device_id = ctx->info->device_id; device_id->vid; device_id++) {
+		if ((vendor_ids[1] << 8 | vendor_ids[0]) == device_id->vid &&
+		    (device_ids[1] << 8 | device_ids[0]) == device_id->pid)
+			break;
 	}
 
+	if (!device_id->vid)
+		return -ENODEV;
+
 	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	ctx->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
@@ -1614,14 +1623,18 @@ static void it66121_remove(struct i2c_client *client)
 
 static const struct it66121_chip_info it66121_chip_info = {
 	.id = ID_IT66121,
-	.vid = 0x4954,
-	.pid = 0x0612,
+	.device_id = {
+		{.vid = 0x4954, .pid = 0x0612 },
+		{ }
+	},
 };
 
 static const struct it66121_chip_info it6610_chip_info = {
 	.id = ID_IT6610,
-	.vid = 0xca00,
-	.pid = 0x0611,
+	.device_id = {
+		{ .vid = 0xca00, .pid = 0x0611},
+		{ }
+	},
 };
 
 static const struct of_device_id it66121_dt_match[] = {
-- 
2.47.0

