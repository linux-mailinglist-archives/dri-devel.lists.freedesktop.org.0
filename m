Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4DFCEF8D5
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 01:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA7C10E2E4;
	Sat,  3 Jan 2026 00:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="H5y40XQt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1376 seconds by postgrey-1.36 at gabe;
 Fri, 02 Jan 2026 14:39:31 UTC
Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk
 [78.40.148.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C90C10E237;
 Fri,  2 Jan 2026 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
 References; bh=HLPGvzeL9FDx8j3KBcLz8alWItePfaw6cRYUaugcHHo=; b=H5y40XQtCjWgbc
 V6OHVp8Yae9jzqvXhNTk1OL7LudsGgkHt9stHoPENXKtgt8dcEAnEQ4D8+jxecsgX0apPLFEeSSrz
 59pcuWNdf9WSxdPQ/x+QTyi5jMGATI7CrwcfCxh+Y92Ep/jepJtHTomST/1xG5vfrVIH5pyY8G3JP
 w6XJ/xHwlV1tozVRgOOglRWv+rdA52NEBVh/fCmLRcv+Jop0SrGT+lfGQfPOh+3bsq8bBywYDX/oT
 lNq2UBCdbdk1n63Yct1kfVYjJm0c85WDZHRdZc2+cECSlpO3O++KizAEGPrtSojykfxcVuSVaZm4S
 HxDlPCHYBNWSIzRggD9g==;
Received: from [167.98.27.226] (helo=rainbowdash)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1vbfx8-0002z4-Pq; Fri, 02 Jan 2026 14:16:30 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
 (envelope-from <ben@rainbowdash>) id 1vbfx8-00000002akg-2O98;
 Fri, 02 Jan 2026 14:16:30 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com,
 alexander.deucher@amd.com, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] drm/radeon: fix signed v unsigned print formats
Date: Fri,  2 Jan 2026 14:16:29 +0000
Message-Id: <20260102141629.617921-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 03 Jan 2026 00:36:07 +0000
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

Fix several places where %ld or %d has been used in place of
%lu or %u.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/drm/radeon/radeon_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index f86773f3db20..891ef929cfa8 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -110,7 +110,7 @@ int radeon_gem_object_create(struct radeon_device *rdev, unsigned long size,
 	 */
 	max_size = rdev->mc.gtt_size - rdev->gart_pin_size;
 	if (size > max_size) {
-		DRM_DEBUG("Allocation size %ldMb bigger than %ldMb limit\n",
+		DRM_DEBUG("Allocation size %luMb bigger than %luMb limit\n",
 			  size >> 20, max_size >> 20);
 		return -ENOMEM;
 	}
@@ -560,7 +560,7 @@ int radeon_gem_set_tiling_ioctl(struct drm_device *dev, void *data,
 	struct radeon_bo *robj;
 	int r = 0;
 
-	DRM_DEBUG("%d \n", args->handle);
+	DRM_DEBUG("%u \n", args->handle);
 	gobj = drm_gem_object_lookup(filp, args->handle);
 	if (gobj == NULL)
 		return -ENOENT;
@@ -886,7 +886,7 @@ static int radeon_debugfs_gem_info_show(struct seq_file *m, void *unused)
 			placement = " CPU";
 			break;
 		}
-		seq_printf(m, "bo[0x%08x] %8ldkB %8ldMB %s pid %8ld\n",
+		seq_printf(m, "bo[0x%08x] %8lukB %8luMB %s pid %8lu\n",
 			   i, radeon_bo_size(rbo) >> 10, radeon_bo_size(rbo) >> 20,
 			   placement, (unsigned long)rbo->pid);
 		i++;
-- 
2.37.2.352.g3c44437643

