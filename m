Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD36CE505D
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 14:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6774D10F89B;
	Sun, 28 Dec 2025 13:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zRrPGK7F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C07C10F89B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 13:17:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3E4B760055;
 Sun, 28 Dec 2025 13:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C61C4CEFB;
 Sun, 28 Dec 2025 13:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1766927830;
 bh=crYlwRlqaJavxXix+Gjl2xj2LDbppnAwbmN4FTzg9ic=;
 h=From:To:Cc:Subject:Date:From;
 b=zRrPGK7F2ivs+i4NLX3/FhOTS7NVru6dZU3YM325f292MShJ2UJuTFC0DroXDK5tP
 wSofBsZ21lJT0naY66oiK5X6E1D3yFRbgVkP7gBoNCmNFgHZ7w/oa7cLfnlJItMKc9
 wWdfCp0OmF2EuipK4XkMpDxOrQiSf/PG2RjZFj2U=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tianchu Chen <flynnnchen@tencent.com>, stable <stable@kernel.org>,
 Steve Glendinning <steve.glendinning@shawell.net>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: smscufx: properly copy ioctl memory to kernelspace
Date: Sun, 28 Dec 2025 14:17:03 +0100
Message-ID: <2025122802-radiance-vacancy-11da@gregkh>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Lines: 50
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=crYlwRlqaJavxXix+Gjl2xj2LDbppnAwbmN4FTzg9ic=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDJmBuufOG3/fNvnx1slm+70bti9Z4xwoUDShZerMGdv3r
 zp7f2ZVQUcsC4MgE4OsmCLLl208R/dXHFL0MrQ9DTOHlQlkCAMXpwBMJKibYX6QvDH//tAMg9XH
 nfx8WTbLb3Ge9ZxhDl//HfdoJp6ExxKNNyXVDi+b8c2YEwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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

The UFX_IOCTL_REPORT_DAMAGE ioctl does not properly copy data from
userspace to kernelspace, and instead directly references the memory,
which can cause problems if invalid data is passed from userspace.  Fix
this all up by correctly copying the memory before accessing it within
the kernel.

Reported-by: Tianchu Chen <flynnnchen@tencent.com>
Cc: stable <stable@kernel.org>
Cc: Steve Glendinning <steve.glendinning@shawell.net>
Cc: Helge Deller <deller@gmx.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/fbdev/smscufx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 5f0dd01fd834..891ce7b76d63 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -932,7 +932,6 @@ static int ufx_ops_ioctl(struct fb_info *info, unsigned int cmd,
 			 unsigned long arg)
 {
 	struct ufx_data *dev = info->par;
-	struct dloarea *area = NULL;
 
 	if (!atomic_read(&dev->usb_active))
 		return 0;
@@ -947,6 +946,10 @@ static int ufx_ops_ioctl(struct fb_info *info, unsigned int cmd,
 
 	/* TODO: Help propose a standard fb.h ioctl to report mmap damage */
 	if (cmd == UFX_IOCTL_REPORT_DAMAGE) {
+		struct dloarea *area __free(kfree) = kmalloc(sizeof(*area), GFP_KERNEL);
+		if (!area)
+			return -ENOMEM;
+
 		/* If we have a damage-aware client, turn fb_defio "off"
 		 * To avoid perf imact of unnecessary page fault handling.
 		 * Done by resetting the delay for this fb_info to a very
@@ -956,7 +959,8 @@ static int ufx_ops_ioctl(struct fb_info *info, unsigned int cmd,
 		if (info->fbdefio)
 			info->fbdefio->delay = UFX_DEFIO_WRITE_DISABLE;
 
-		area = (struct dloarea *)arg;
+		if (copy_from_user(area, (u8 __user *)arg, sizeof(*area)))
+			return -EFAULT;
 
 		if (area->x < 0)
 			area->x = 0;
-- 
2.52.0

