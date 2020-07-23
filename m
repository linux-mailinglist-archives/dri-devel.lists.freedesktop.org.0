Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5929722B4AF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 19:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BDD6E2A0;
	Thu, 23 Jul 2020 17:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404916E260;
 Thu, 23 Jul 2020 17:21:35 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 21910647-1500050 
 for multiple; Thu, 23 Jul 2020 18:21:21 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm: Restore driver.preclose() for all to use
Date: Thu, 23 Jul 2020 18:21:17 +0100
Message-Id: <20200723172119.17649-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: stable@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Gustavo Padovan <gustavo.padovan@collabora.com>, CQ Tang <cq.tang@intel.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

An unfortunate sequence of events, but it turns out there is a valid
usecase for being able to free/decouple the driver objects before they
are freed by the DRM core. In particular, if we have a pointer into a
drm core object from inside a driver object, that pointer needs to be
nerfed *before* it is freed so that concurrent access (e.g. debugfs)
does not following the dangling pointer.

The legacy marker was adding in the code movement from drp_fops.c to
drm_file.c

References: 9acdac68bcdc ("drm: rename drm_fops.c to drm_file.c")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>
Cc: CQ Tang <cq.tang@intel.com>
Cc: <stable@vger.kernel.org> # v4.12+
---
 drivers/gpu/drm/drm_file.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 0ac4566ae3f4..7b4258d6f7cc 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -258,8 +258,7 @@ void drm_file_free(struct drm_file *file)
 		  (long)old_encode_dev(file->minor->kdev->devt),
 		  atomic_read(&dev->open_count));
 
-	if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
-	    dev->driver->preclose)
+	if (dev->driver->preclose)
 		dev->driver->preclose(dev, file);
 
 	if (drm_core_check_feature(dev, DRIVER_LEGACY))
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
