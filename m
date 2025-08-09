Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E4CB1F64A
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 23:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C3710E228;
	Sat,  9 Aug 2025 21:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="F8R0mMZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr
 [80.12.242.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F35810E228
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 21:17:01 +0000 (UTC)
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPA
 id kqvxuMZTICThEkqvxuji24; Sat, 09 Aug 2025 23:16:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1754774219;
 bh=gRjOuSVm0vyW/KeKNVV0XzdhAD9WM43tL7z8dD//4s4=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=F8R0mMZZGRWpLzWwCxgv62qxAjuqJWsym4+TnvQVLvmtATFUS34JS2O2ip+29jtNN
 yO9lzwk8sEJTlyXHRag0oxxNTzbJd+Jpou2QSVFWCEgD/MH2Ke2TBFkTSchWtJNraH
 1q4+bTik6NmpOnNnm+WDmmOhmXUlzveAVl//CHFnwVNLNzTOTanzMaqiHAfBVOPv0m
 EKcrvmONPj1KZMQ9BKt+fsMknHX+KZxdsK5xz1JX6S/iO1cp97Fsu8kX3x2UvqSIcx
 uguG+QTySiKVvEAe3dmafLaiTFx6yoAXj72FvTqUPueqhaC41y8zkkF6zNpMAUkpqW
 cREoK2XtF6Pmw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 09 Aug 2025 23:16:59 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Russell King <rmk+kernel@arm.linux.org.uk>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/armada: Use the correct prototype for a struct
 file_operations .write function
Date: Sat,  9 Aug 2025 23:16:52 +0200
Message-ID: <8085f9c18ab06158b9adbbdadb8554c85972d390.1754774176.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.1
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

.write functions from struct file_operations return a ssize_t not an int.

This is maybe not an issue for architectures that use this driver, but it
is nicer to explicitly use the correct return type.

Fixes: 96f60e37dc66 ("DRM: Armada: Add Armada DRM driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Spotted while looking at something else and trying to compile the file on a
x86_64 using:
  make -j8 drivers/gpu/drm/armada/armada_debugfs.o
---
 drivers/gpu/drm/armada/armada_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/armada/armada_debugfs.c b/drivers/gpu/drm/armada/armada_debugfs.c
index a763349dd89f..96aebd56272f 100644
--- a/drivers/gpu/drm/armada/armada_debugfs.c
+++ b/drivers/gpu/drm/armada/armada_debugfs.c
@@ -49,7 +49,7 @@ static int armada_debugfs_crtc_reg_open(struct inode *inode, struct file *file)
 			   inode->i_private);
 }
 
-static int armada_debugfs_crtc_reg_write(struct file *file,
+static ssize_t armada_debugfs_crtc_reg_write(struct file *file,
 	const char __user *ptr, size_t len, loff_t *off)
 {
 	struct armada_crtc *dcrtc;
-- 
2.50.1

