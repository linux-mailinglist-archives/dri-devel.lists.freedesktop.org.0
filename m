Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A888B2549A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 22:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A7910E7BF;
	Wed, 13 Aug 2025 20:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="M0EFtFBG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D1910E0A7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 20:41:17 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DKfAWI1779738;
 Wed, 13 Aug 2025 15:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755117670;
 bh=vFvShJKmb9MFgjZhNt/VbQnwnmM/LO1s48lIt5T65+U=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=M0EFtFBGuR/l7EG5+al4fp4bCx0a2yAkkkMpy4HRgAKCsOLQQNNtDXafCQTp3sUyw
 PvSJkDzoPzf/DbhWXdS4Mxx6tHFrjRf3+sex4cSVIxGS8FQHQBfkjd7aLBgVoRle1U
 8fwZNpAQYWfuvrbtCG/ek4BGzmVc5uSSUSZQuKZw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DKfA7v644855
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 13 Aug 2025 15:41:10 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 15:41:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 15:41:09 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DKf9TN2853526;
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
Subject: [PATCH V2 3/3] drm/bridge: it66121: Add it66122 support
Date: Wed, 13 Aug 2025 15:41:06 -0500
Message-ID: <20250813204106.580141-4-nm@ti.com>
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

For new platforms that do explicitly use IT66122, they can use the
appropriate compatible as well.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
- I think this is a more pragmatic approach with both compatibles
  functional and the option of being able to split this up at a later
  point if required in driver.

NOTE: I still retain the checkpatch --strict warning as v1 here.

V1: https://lore.kernel.org/all/20250813190835.344563-3-nm@ti.com/

 drivers/gpu/drm/bridge/ite-it66121.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 208e118df0e2..dcbbf7578046 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1625,6 +1625,7 @@ static const struct it66121_chip_info it66121_chip_info = {
 	.id = ID_IT66121,
 	.device_id = {
 		{.vid = 0x4954, .pid = 0x0612 },
+		{.vid = 0x4954, .pid = 0x0622 },
 		{ }
 	},
 };
@@ -1639,6 +1640,7 @@ static const struct it66121_chip_info it6610_chip_info = {
 
 static const struct of_device_id it66121_dt_match[] = {
 	{ .compatible = "ite,it66121", &it66121_chip_info },
+	{ .compatible = "ite,it66122", &it66121_chip_info },
 	{ .compatible = "ite,it6610", &it6610_chip_info },
 	{ }
 };
@@ -1646,6 +1648,7 @@ MODULE_DEVICE_TABLE(of, it66121_dt_match);
 
 static const struct i2c_device_id it66121_id[] = {
 	{ "it66121", (kernel_ulong_t) &it66121_chip_info },
+	{ "it66122", (kernel_ulong_t) &it66121_chip_info },
 	{ "it6610", (kernel_ulong_t) &it6610_chip_info },
 	{ }
 };
-- 
2.47.0

