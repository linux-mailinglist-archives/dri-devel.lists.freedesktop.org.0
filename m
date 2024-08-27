Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7678396120C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 17:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2622010E353;
	Tue, 27 Aug 2024 15:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="tky1Hq3+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEE410E353
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 15:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1724772360;
 bh=2e4vyf28xxH0Hr6la1wTNPqSQ1+adyxwjIEbYSuV2ZQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tky1Hq3+/fxIo0PR0yLhX4NeR2JZSc/FpDc/+iBEYIVZx4tKdGLw00kqmM651bNzx
 sd/ivrIlYFCsOdOLZ7rW7yGaUt5cSBkW2IUp7YpXHJZ7zqNPzqlNN6f+cUB8uQtxj4
 agBtu0KwAJHvWLvPv1OlQD8y27tatHW9ABsom+58=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 27 Aug 2024 17:25:16 +0200
Subject: [PATCH 5/5] fbdev/efifb: Use driver-private screen_info for sysfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240827-efifb-sysfs-v1-5-c9cc3e052180@weissschuh.net>
References: <20240827-efifb-sysfs-v1-0-c9cc3e052180@weissschuh.net>
In-Reply-To: <20240827-efifb-sysfs-v1-0-c9cc3e052180@weissschuh.net>
To: Peter Jones <pjones@redhat.com>, Helge Deller <deller@gmx.de>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724772358; l=1194;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=2e4vyf28xxH0Hr6la1wTNPqSQ1+adyxwjIEbYSuV2ZQ=;
 b=+Pk0n0e5P2rpmmg2vlrNRCkM2i9FDYVDXSk03eilvNcK3JU9PZrT56fs06i4gUziwWgueLNAH
 XoyCQh/LzQbAT60VaYMbFxlv0u10WFRv1JQti4gSy+KJhNvN/dOi9qd
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

Since commit b9cfd1d271ab ("fbdev/efifb: Use screen_info pointer from device")
efifb uses a local copy of screen_info and applies its modifications
there. Adapt the sysfs attributes to also work with the custom copy
instead of the unmodified platform data.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/video/fbdev/efifb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 7215973ef602..1f86a07bf292 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -304,7 +304,7 @@ static ssize_t name##_show(struct device *dev,				\
 			   struct device_attribute *attr,		\
 			   char *buf)					\
 {									\
-	struct screen_info *si = dev_get_platdata(dev);			\
+	struct screen_info *si = dev_get_drvdata(dev);			\
 	if (!si)							\
 		return -ENODEV;						\
 	return sprintf(buf, fmt "\n", (si->lfb_##name));		\
@@ -369,6 +369,8 @@ static int efifb_probe(struct platform_device *dev)
 	if (!si)
 		return -ENOMEM;
 
+	dev_set_drvdata(&dev->dev, si);
+
 	if (si->orig_video_isVGA != VIDEO_TYPE_EFI)
 		return -ENODEV;
 

-- 
2.46.0

