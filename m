Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E599F307E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 13:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C9110E5FA;
	Mon, 16 Dec 2024 12:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="UxT2AXiL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D83D10E5FA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 12:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1734351914;
 bh=RA82AkSXi61D6nUmUNT7oSNDv8q3l7RKH4P+1ooMy8Y=;
 h=From:Date:Subject:To:Cc:From;
 b=UxT2AXiLbLGPc4bbt2HSvMzZe5Ai8TLCtDg7zxs8t5FeXdf3N5pPQvCLicHAD2TYR
 +iHtHDIJmbe+gBaQj/qM4vKnPpu0YH/wrQOZnXX9QYojZiRLd0Mevoi4lrtJjmrji8
 LGNEhKaJPNd7mnUeFuPHnHaO+29MUAyBL4jEYLxE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 13:25:12 +0100
Subject: [PATCH] accel/habanalabs: constify 'struct bin_attribute'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-sysfs-const-bin_attr-habanalabs-v1-1-b35463197efb@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIACccYGcC/x3N0QqDMAxA0V+RPC+wljm6/YoMSds4AyNKU8Qh/
 vvKHs/LvQcYF2GDZ3dA4U1MFm1wlw7STPpmlNwM/upvzrs72tcmw7SoVYyiI9VacKZISh+KhiE
 9eg69zzkQtMpaeJL9fxhe5/kDCYLO5XEAAAA=
X-Change-ID: 20241216-sysfs-const-bin_attr-habanalabs-8c95e852dd8a
To: Ofir Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734351913; l=2078;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=RA82AkSXi61D6nUmUNT7oSNDv8q3l7RKH4P+1ooMy8Y=;
 b=OxYVpD7XCbhY4fhUwtBnLpZA0zeWUdS30JDxhVpWu8msJfjhMPB2GHAQI9HYTc+D/HqlA0Gq1
 SKaUCGk2U0dCOwsVHg/tq5aUjI5802594mnJmGFpJ8ZvtnaUhI5xh6f
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/accel/habanalabs/common/sysfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/habanalabs/common/sysfs.c b/drivers/accel/habanalabs/common/sysfs.c
index e9f8ccc0bbf9d4dabec1b51072d07170c51ffc9e..9d58efa2ff380c8773bd79bea613dc79a5a98020 100644
--- a/drivers/accel/habanalabs/common/sysfs.c
+++ b/drivers/accel/habanalabs/common/sysfs.c
@@ -368,7 +368,7 @@ static ssize_t max_power_store(struct device *dev,
 }
 
 static ssize_t eeprom_read_handler(struct file *filp, struct kobject *kobj,
-			struct bin_attribute *attr, char *buf, loff_t offset,
+			const struct bin_attribute *attr, char *buf, loff_t offset,
 			size_t max_size)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -443,10 +443,10 @@ static DEVICE_ATTR_RO(security_enabled);
 static DEVICE_ATTR_RO(module_id);
 static DEVICE_ATTR_RO(parent_device);
 
-static struct bin_attribute bin_attr_eeprom = {
+static const struct bin_attribute bin_attr_eeprom = {
 	.attr = {.name = "eeprom", .mode = (0444)},
 	.size = PAGE_SIZE,
-	.read = eeprom_read_handler
+	.read_new = eeprom_read_handler
 };
 
 static struct attribute *hl_dev_attrs[] = {
@@ -472,14 +472,14 @@ static struct attribute *hl_dev_attrs[] = {
 	NULL,
 };
 
-static struct bin_attribute *hl_dev_bin_attrs[] = {
+static const struct bin_attribute *const hl_dev_bin_attrs[] = {
 	&bin_attr_eeprom,
 	NULL
 };
 
 static struct attribute_group hl_dev_attr_group = {
 	.attrs = hl_dev_attrs,
-	.bin_attrs = hl_dev_bin_attrs,
+	.bin_attrs_new = hl_dev_bin_attrs,
 };
 
 static struct attribute_group hl_dev_clks_attr_group;

---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241216-sysfs-const-bin_attr-habanalabs-8c95e852dd8a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

