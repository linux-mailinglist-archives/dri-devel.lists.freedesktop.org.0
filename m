Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3716E9F247E
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 15:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAF110E27A;
	Sun, 15 Dec 2024 14:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="Na4fR/kt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD4510E27A
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 14:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1734274688;
 bh=w9nvy9g1FOojXUI4vOJQb1SM3VY2aQLrTqmaDrLN1Xk=;
 h=From:Date:Subject:To:Cc:From;
 b=Na4fR/kt6LgwpxNgI6tz2AcZDhoefq7v24LZjhBbrFRcfq5/hGSzfj9rQPhPaeIlw
 BipUGzrVTVGAon1OKBSlZXU77dYHXW6NvkiVIlsJiwNantLuZY6vbldTG3zAJe7s4S
 nfaoH5kWQG/Znv7vZrubEv+Fg3JT4dlaV33U2514=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 15 Dec 2024 15:58:04 +0100
Subject: [PATCH] fbdev/radeon: Use const 'struct bin_attribute' callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241215-sysfs-const-bin_attr-radeonfb-v1-1-577bcffa1100@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAHvuXmcC/x3MwQrCMAwA0F8ZORtoyxS3XxkibZe6XNKRFFHG/
 t3i8V3eAUbKZDAPByi92bhKh78MkLcoL0JeuyG4MPrgr2hfK4a5ijVMLM/YmqLGlaqUhDeX8uT
 clO4jQT92pcKf/788zvMHA+6DgW8AAAA=
X-Change-ID: 20241215-sysfs-const-bin_attr-radeonfb-60bc9009b84e
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734274687; l=1982;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=w9nvy9g1FOojXUI4vOJQb1SM3VY2aQLrTqmaDrLN1Xk=;
 b=BslxGOrxS0iJMK1+ZAjFPUiwzPYaJt0wmnvkgiMQ/6rEGZThdAkBroJrhihP8t2YCdX351uoG
 sufuPtSdUjmDMjTcW+35fDzfdIB1D2AKD9OuLYqxXHSD7rfQ24p1fx8
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

The sysfs core now provides callback variants that explicitly take a
const pointer. Make use of it to match the attribute definitions.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/video/fbdev/aty/radeon_base.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index 36bfb6deb8abde5268953082d096b97786ba3644..d866608da8d18f1987ea831f97a7f304ae62fa2f 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -2199,7 +2199,7 @@ static ssize_t radeon_show_one_edid(char *buf, loff_t off, size_t count, const u
 
 
 static ssize_t radeon_show_edid1(struct file *filp, struct kobject *kobj,
-				 struct bin_attribute *bin_attr,
+				 const struct bin_attribute *bin_attr,
 				 char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -2211,7 +2211,7 @@ static ssize_t radeon_show_edid1(struct file *filp, struct kobject *kobj,
 
 
 static ssize_t radeon_show_edid2(struct file *filp, struct kobject *kobj,
-				 struct bin_attribute *bin_attr,
+				 const struct bin_attribute *bin_attr,
 				 char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -2227,7 +2227,7 @@ static const struct bin_attribute edid1_attr = {
 		.mode	= 0444,
 	},
 	.size	= EDID_LENGTH,
-	.read	= radeon_show_edid1,
+	.read_new	= radeon_show_edid1,
 };
 
 static const struct bin_attribute edid2_attr = {
@@ -2236,7 +2236,7 @@ static const struct bin_attribute edid2_attr = {
 		.mode	= 0444,
 	},
 	.size	= EDID_LENGTH,
-	.read	= radeon_show_edid2,
+	.read_new	= radeon_show_edid2,
 };
 
 static int radeonfb_pci_register(struct pci_dev *pdev,

---
base-commit: 2d8308bf5b67dff50262d8a9260a50113b3628c6
change-id: 20241215-sysfs-const-bin_attr-radeonfb-60bc9009b84e

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

