Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7059F2489
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 16:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3232E10E051;
	Sun, 15 Dec 2024 15:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="C1SQVUIU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1209 seconds by postgrey-1.36 at gabe;
 Sun, 15 Dec 2024 15:15:32 UTC
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22BC10E051
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 15:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1734275730;
 bh=l8v0K6EgV9Pof7Es2dXxC+hC3jDa2lWcOg0k1aPIngM=;
 h=From:Date:Subject:To:Cc:From;
 b=C1SQVUIUJyT6+MoeQKs0VpFs8aQPrqZsUEW8jLMWqBgMj5cwNqRFQLzIWgl47U0uh
 StqSBvKdrsmw4x1LaL+Z0cDts1bBUPGrcJjPwRQKMp+JIaaa4vEqwc94+yhGU0GnnP
 CvgqVwA98gSwADsW76RVB8r/UY1aRbmyqv9HYKQE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 15 Dec 2024 16:15:21 +0100
Subject: [PATCH] fbdev/udlfb: Remove world-writability from EDID attribute
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241215-udlfb-perms-v1-1-2d1f8c96b1ab@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAIjyXmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0NT3dKUnLQk3YLUotxi3aQks9QUI3ODtMTkNCWgjoKi1LTMCrBp0bG
 1tQCtWVrdXQAAAA==
X-Change-ID: 20241215-udlfb-perms-bb6ed270facf
To: Bernie Thompson <bernie@plugable.com>, Helge Deller <deller@gmx.de>, 
 Greg Kroah-Hartman <gregkh@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734275729; l=1213;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=l8v0K6EgV9Pof7Es2dXxC+hC3jDa2lWcOg0k1aPIngM=;
 b=7bTT4KHzbC+9GZPr4wRIw5/OMEXrR2T3SlEtOAfkRzjYmGDvyHWpa5VH4dS42jxKDP0D3d+Ok
 WbKQVF2WowxCc6VS30+DYCj81RVkYkGQo9MHVHQGjqIVHLsHkeqzGhz
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

It should not be possible for every user to override the EDID.
Limit it to the system administrator.

Fixes: 8ef8cc4fca4a ("staging: udlfb: support for writing backup EDID to sysfs file")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
The EDID passed through sysfs is only used as a fallback if the hardware
does not provide one. To me it still feels incorrect to have this
world-writable.
---
 drivers/video/fbdev/udlfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index 71ac9e36f67c68aa7a54dce32323047a2a9a48bf..391bdb71197549caa839d862f0ce7456dc7bf9ec 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -1480,7 +1480,7 @@ static ssize_t metrics_reset_store(struct device *fbdev,
 
 static const struct bin_attribute edid_attr = {
 	.attr.name = "edid",
-	.attr.mode = 0666,
+	.attr.mode = 0644,
 	.size = EDID_LENGTH,
 	.read = edid_show,
 	.write = edid_store

---
base-commit: 2d8308bf5b67dff50262d8a9260a50113b3628c6
change-id: 20241215-udlfb-perms-bb6ed270facf

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

