Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C363B3FB7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 10:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040C86ECD7;
	Fri, 25 Jun 2021 08:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9F36ECD7;
 Fri, 25 Jun 2021 08:47:43 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EA72B1FE62;
 Fri, 25 Jun 2021 08:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624610861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wuLYqErPOMbu7umnF9/KmkwiFJ37raOGMSvKGugotnk=;
 b=0hfdpMPDud+pr58YzxDK8cZZve8hyyvdXJfKaEa3+dfBSCLIDLPHB9GV3ZbTmTgFOk5PFg
 nZWMrqDwkqzP7Rqt5Su3FgWqioB+kwiE1WOv4dnsFsTSKTVEfjnvTdai6sCDFQQxgyezHY
 4Cvq9UCsHdEbuY37uXMYpbvECBz6t6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624610861;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wuLYqErPOMbu7umnF9/KmkwiFJ37raOGMSvKGugotnk=;
 b=qQ8lGn7nqNw4BaY29LJu+/fK0lbhcYc6koFRt82Z8TiamUvCi+A4/k7NPXesOLPMVAVfZl
 M7G2vkuqDvr/72DA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A7E9211A97;
 Fri, 25 Jun 2021 08:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624610861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wuLYqErPOMbu7umnF9/KmkwiFJ37raOGMSvKGugotnk=;
 b=0hfdpMPDud+pr58YzxDK8cZZve8hyyvdXJfKaEa3+dfBSCLIDLPHB9GV3ZbTmTgFOk5PFg
 nZWMrqDwkqzP7Rqt5Su3FgWqioB+kwiE1WOv4dnsFsTSKTVEfjnvTdai6sCDFQQxgyezHY
 4Cvq9UCsHdEbuY37uXMYpbvECBz6t6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624610861;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wuLYqErPOMbu7umnF9/KmkwiFJ37raOGMSvKGugotnk=;
 b=qQ8lGn7nqNw4BaY29LJu+/fK0lbhcYc6koFRt82Z8TiamUvCi+A4/k7NPXesOLPMVAVfZl
 M7G2vkuqDvr/72DA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id nXApKC2Y1WBZWAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 25 Jun 2021 08:47:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, mika.kuoppala@linux.intel.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH] drm/i915: Drop all references to DRM IRQ midlayer
Date: Fri, 25 Jun 2021 10:47:40 +0200
Message-Id: <20210625084740.1586-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove all references to DRM's IRQ midlayer.

The code in xcs_resume() probably didn't work as intended. It uses
struct drm_device.irq, which is allocated to 0, but never initialized
by i915 to the device's interrupt number.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 536f77b1caa0 ("drm/i915/gt: Call stop_ring() from ring resume, again")
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ring_submission.c | 3 ++-
 drivers/gpu/drm/i915/i915_drv.c                 | 1 -
 drivers/gpu/drm/i915/i915_irq.c                 | 1 -
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 5d42a12ef3d6..d893aaaed74f 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -180,12 +180,13 @@ static bool stop_ring(struct intel_engine_cs *engine)
 static int xcs_resume(struct intel_engine_cs *engine)
 {
 	struct intel_ring *ring = engine->legacy.ring;
+	struct pci_dev *pdev = to_pci_dev(engine->i915->drm.dev);
 
 	ENGINE_TRACE(engine, "ring:{HEAD:%04x, TAIL:%04x}\n",
 		     ring->head, ring->tail);
 
 	/* Double check the ring is empty & disabled before we resume */
-	synchronize_hardirq(engine->i915->drm.irq);
+	synchronize_hardirq(pdev->irq);
 	if (!stop_ring(engine))
 		goto err;
 
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 850b499c71c8..73de45472f60 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -42,7 +42,6 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_ioctl.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index a11bdb667241..eef616d96f12 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -33,7 +33,6 @@
 #include <linux/sysrq.h>
 
 #include <drm/drm_drv.h>
-#include <drm/drm_irq.h>
 
 #include "display/intel_de.h"
 #include "display/intel_display_types.h"

base-commit: 8c1323b422f8473421682ba783b5949ddd89a3f4
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
-- 
2.32.0

