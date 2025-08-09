Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197F6B1F6BE
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 23:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1042310E22B;
	Sat,  9 Aug 2025 21:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="jG4NJyuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-78.smtpout.orange.fr
 [80.12.242.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22F110E22B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 21:21:20 +0000 (UTC)
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPA
 id kr08uPBBpkYfwkr09uKitS; Sat, 09 Aug 2025 23:21:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1754774479;
 bh=7WPR2/VqKI/KR7A58QvvxXBj2GcycEeUKgOSBlK9y7c=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=jG4NJyuMu88kcVXlXIfEygsgCwYT/Ss4rV0HcITFwYiknL3F51cNFGmc2wmmyO0i6
 Ywn6bYsp3H3FPViQ6mR4HMlDB5OSDNXxGQMRMNhiQ5Q8NfhYf2cjLfCTUyq/HTpGYR
 3bwm9C5ProE0Zgk166e6aym6bJ0IHOF5fCvB6vVe4kD9cepnRskcfqE0y/US2M6JvV
 nkYWabp5mrnaYJDdRmwMZKSOZ7IhKzKNcRh4mGy5OLIV5EmEdJcyR3zciWXLsFH0gs
 DKQxCyaeOaZEOQ3T2m9Y5qWINHD/j4+N0evzg6ufjnLHJ3CsGH8SETlJ6wYeXIGYI6
 SmCHM05GvAYOQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 09 Aug 2025 23:21:19 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/armada: Constify struct drm_info_list
Date: Sat,  9 Aug 2025 23:21:12 +0200
Message-ID: <ec8b238d044de971ca99716ca94ddf66a82b018e.1754774445.git.christophe.jaillet@wanadoo.fr>
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

'struct drm_info_list' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   1411	    320	      0	   1731	    6c3	drivers/gpu/drm/armada/armada_debugfs.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   1683	     48	      0	   1731	    6c3	drivers/gpu/drm/armada/armada_debugfs.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/gpu/drm/armada/armada_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/armada/armada_debugfs.c b/drivers/gpu/drm/armada/armada_debugfs.c
index 96aebd56272f..f15b2143279f 100644
--- a/drivers/gpu/drm/armada/armada_debugfs.c
+++ b/drivers/gpu/drm/armada/armada_debugfs.c
@@ -98,7 +98,7 @@ void armada_drm_crtc_debugfs_init(struct armada_crtc *dcrtc)
 			    dcrtc, &armada_debugfs_crtc_reg_fops);
 }
 
-static struct drm_info_list armada_debugfs_list[] = {
+static const struct drm_info_list armada_debugfs_list[] = {
 	{ "gem_linear", armada_debugfs_gem_linear_show, 0 },
 };
 #define ARMADA_DEBUGFS_ENTRIES ARRAY_SIZE(armada_debugfs_list)
-- 
2.50.1

