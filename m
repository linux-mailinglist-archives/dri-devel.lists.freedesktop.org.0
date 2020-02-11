Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AACE1159232
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 15:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5526E4D2;
	Tue, 11 Feb 2020 14:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014A76E4D2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 14:47:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 06:47:59 -0800
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="226523058"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 06:47:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/irq: remove check on dev->dev_private
Date: Tue, 11 Feb 2020 16:47:53 +0200
Message-Id: <20200211144753.3175-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no real reason to require drivers to set and use
dev->dev_private. Indeed, the current recommendation, as documented in
drm_device.h, is to embed struct drm_device in the per-device struct
instead of using dev_private.

Remove the requirement for dev_private to have been set to indicate
driver initialization.

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Any ideas for something else drm_irq_install() could/should check to
ensure "Driver must have been initialized"?

There are only a few instances of dev_private uses in i915, also to be
removed, and we could stop initializing dev_private altogether. We could
in fact do that without this patch too, as we don't use
drm_irq_install(). But it would be cleaner to not have any checks for
driver private stuff outside of drivers.
---
 drivers/gpu/drm/drm_irq.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index 03bce566a8c3..588be45abd7a 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -111,10 +111,6 @@ int drm_irq_install(struct drm_device *dev, int irq)
 	if (irq == 0)
 		return -EINVAL;
 
-	/* Driver must have been initialized */
-	if (!dev->dev_private)
-		return -EINVAL;
-
 	if (dev->irq_enabled)
 		return -EBUSY;
 	dev->irq_enabled = true;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
