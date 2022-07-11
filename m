Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94907570794
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA618F458;
	Mon, 11 Jul 2022 15:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDD78F451
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:50:40 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by xavier.telenet-ops.be with bizsmtp
 id trqf270054C55Sk01rqf58; Mon, 11 Jul 2022 17:50:39 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgE-0036x2-H5; Mon, 11 Jul 2022 17:50:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgC-006shk-Vj; Mon, 11 Jul 2022 17:50:36 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 06/10] video: fbdev: atari: Remove unneeded casts to void *
Date: Mon, 11 Jul 2022 17:50:30 +0200
Message-Id: <d1da8bf1b21759bcda39c572bc102c5a6380b1a8.1657554353.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657554353.git.geert@linux-m68k.org>
References: <cover.1657554353.git.geert@linux-m68k.org>
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arbitrary pointers can be passed to functions accepting "void *" without
casting.

Remove the casts, as they make it impossible to validate types.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/atafb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index f20535ea3e549384..fbc333d5615df5d5 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -2599,14 +2599,14 @@ atafb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
 	switch (cmd) {
 #ifdef FBCMD_GET_CURRENTPAR
 	case FBCMD_GET_CURRENTPAR:
-		if (copy_to_user((void *)arg, (void *)&current_par,
+		if (copy_to_user((void *)arg, &current_par,
 				 sizeof(struct atafb_par)))
 			return -EFAULT;
 		return 0;
 #endif
 #ifdef FBCMD_SET_CURRENTPAR
 	case FBCMD_SET_CURRENTPAR:
-		if (copy_from_user((void *)&current_par, (void *)arg,
+		if (copy_from_user(&current_par, (void *)arg,
 				   sizeof(struct atafb_par)))
 			return -EFAULT;
 		ata_set_par(&current_par);
-- 
2.25.1

