Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD62B51408
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 12:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3008E10E8C0;
	Wed, 10 Sep 2025 10:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bregans-1.gladserv.net (bregans-1.gladserv.net [185.128.211.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B9410E2C9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 10:28:22 +0000 (UTC)
From: Brett A C Sheffield <bacs@librecast.net>
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 Murad Masimov <m.masimov@mt-integration.ru>,
 Yongzhen Zhang <zhangyongzhen@kylinos.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, Brett A C Sheffield <bacs@librecast.net>
Subject: [PATCH 1/1] Revert "fbdev: Disable sysfb device registration when
 removing conflicting FBs"
Date: Wed, 10 Sep 2025 09:38:03 +0000
Message-ID: <20250910095124.6213-5-bacs@librecast.net>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250910095124.6213-3-bacs@librecast.net>
References: <20250910095124.6213-3-bacs@librecast.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 10 Sep 2025 10:30:10 +0000
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

This reverts commit 13d28e0c79cbf69fc6f145767af66905586c1249.

Commit ee7a69aa38d8 ("fbdev: Disable sysfb device registration when
removing conflicting FBs") was backported to 5.15.y LTS. This causes a
regression where all virtual consoles stop responding during boot at:

"Populating /dev with existing devices through uevents ..."

Reverting the commit fixes the regression.

Signed-off-by: Brett A C Sheffield <bacs@librecast.net>
---
 drivers/video/fbdev/core/fbmem.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index d938c31e8f90..3b52ddfe0350 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -19,7 +19,6 @@
 #include <linux/kernel.h>
 #include <linux/major.h>
 #include <linux/slab.h>
-#include <linux/sysfb.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
 #include <linux/vt.h>
@@ -1795,17 +1794,6 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
 		do_free = true;
 	}
 
-	/*
-	 * If a driver asked to unregister a platform device registered by
-	 * sysfb, then can be assumed that this is a driver for a display
-	 * that is set up by the system firmware and has a generic driver.
-	 *
-	 * Drivers for devices that don't have a generic driver will never
-	 * ask for this, so let's assume that a real driver for the display
-	 * was already probed and prevent sysfb to register devices later.
-	 */
-	sysfb_disable();
-
 	mutex_lock(&registration_lock);
 	do_remove_conflicting_framebuffers(a, name, primary);
 	mutex_unlock(&registration_lock);
-- 
2.49.1

