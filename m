Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC83099DE90
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 08:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D5310E128;
	Tue, 15 Oct 2024 06:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GZLz+I1z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/Jp0zK4P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GZLz+I1z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/Jp0zK4P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA17110E128
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 06:39:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4E74C1FD89;
 Tue, 15 Oct 2024 06:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728974374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nLi8kIJ4ZsWin+P6ypSo3CR+rzZUlPN15V3AzxuqhzM=;
 b=GZLz+I1zDRi2AqHNi2erHRmNO4RjDHvcAm65HcSqvMP7T7VCqLOUG0T8sfROdcRZz3SmpE
 TkzJCRzIlP7xFqfQC1y2xNNdMiYOr1peGMCjAwUh6wYWpyP3ODAwXW3HXqCVgQJoXNGbOr
 pQpZhQQ7IpnhnEkPIiGOFKIyfAcbqPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728974374;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nLi8kIJ4ZsWin+P6ypSo3CR+rzZUlPN15V3AzxuqhzM=;
 b=/Jp0zK4PTRc2SYu97Dl0gezt3vcjdFLUoZIL2arlRxRbF34AL92v1FzpA2WCeU3Rgd4U2D
 r0UJCOhGOQCFbsBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GZLz+I1z;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/Jp0zK4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728974374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nLi8kIJ4ZsWin+P6ypSo3CR+rzZUlPN15V3AzxuqhzM=;
 b=GZLz+I1zDRi2AqHNi2erHRmNO4RjDHvcAm65HcSqvMP7T7VCqLOUG0T8sfROdcRZz3SmpE
 TkzJCRzIlP7xFqfQC1y2xNNdMiYOr1peGMCjAwUh6wYWpyP3ODAwXW3HXqCVgQJoXNGbOr
 pQpZhQQ7IpnhnEkPIiGOFKIyfAcbqPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728974374;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nLi8kIJ4ZsWin+P6ypSo3CR+rzZUlPN15V3AzxuqhzM=;
 b=/Jp0zK4PTRc2SYu97Dl0gezt3vcjdFLUoZIL2arlRxRbF34AL92v1FzpA2WCeU3Rgd4U2D
 r0UJCOhGOQCFbsBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 127BB13A53;
 Tue, 15 Oct 2024 06:39:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xC0vAyYODmfzbQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Oct 2024 06:39:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, kraxel@redhat.com, airlied@redhat.com,
 tony.luck@intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] Revert "drm/mgag200: Add vblank support"
Date: Tue, 15 Oct 2024 08:37:13 +0200
Message-ID: <20241015063932.8620-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4E74C1FD89
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_EQ_ENVFROM(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCPT_COUNT_FIVE(0.00)[6];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:dkim, suse.de:mid,
 intel.com:email, imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
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

This reverts commit 6c9e14ee9f519ee605a3694fbfa4711284781d22.
This reverts commit d5070c9b29440c270b534bbacd636b8fa558e82b.
This reverts commit 89c6ea2006e2d39b125848fb0195c08fa0b354be.

The VLINE interrupt doesn't work correctly on G200SE-A (at least). We
have also seen missing interrupts on G200ER. So revert vblank support.
Fixes frozen displays and warnings about missed vblanks.

[   33.818362] [CRTC:34:crtc-0] vblank wait timed out

From the vblank code, the driver only keeps the register constants and
the line that disables all interrupts in mgag200_device_init(). Both
is still useful without vblank handling.

Reported-by: Tony Luck <tony.luck@intel.com>
Closes: https://lore.kernel.org/dri-devel/Zvx6lSi7oq5xvTZb@agluck-desk3.sc.intel.com/raw
Tested-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c     | 38 -----------
 drivers/gpu/drm/mgag200/mgag200_drv.h     | 14 +----
 drivers/gpu/drm/mgag200/mgag200_g200.c    |  5 --
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  5 --
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  5 --
 drivers/gpu/drm/mgag200/mgag200_g200er.c  | 10 +--
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  | 10 +--
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  5 --
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 10 +--
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  5 --
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 77 +----------------------
 11 files changed, 6 insertions(+), 178 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 42fabe817e21..97fd7eb765b4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -20,7 +20,6 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_module.h>
 #include <drm/drm_pciids.h>
-#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -87,34 +86,6 @@ resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size)
 	return offset - 65536;
 }
 
-static irqreturn_t mgag200_irq_handler(int irq, void *arg)
-{
-	struct drm_device *dev = arg;
-	struct mga_device *mdev = to_mga_device(dev);
-	struct drm_crtc *crtc;
-	u32 status, ien;
-
-	status = RREG32(MGAREG_STATUS);
-
-	if (status & MGAREG_STATUS_VLINEPEN) {
-		ien = RREG32(MGAREG_IEN);
-		if (!(ien & MGAREG_IEN_VLINEIEN))
-			goto out;
-
-		crtc = drm_crtc_from_index(dev, 0);
-		if (WARN_ON_ONCE(!crtc))
-			goto out;
-		drm_crtc_handle_vblank(crtc);
-
-		WREG32(MGAREG_ICLEAR, MGAREG_ICLEAR_VLINEICLR);
-
-		return IRQ_HANDLED;
-	}
-
-out:
-	return IRQ_NONE;
-}
-
 /*
  * DRM driver
  */
@@ -199,7 +170,6 @@ int mgag200_device_init(struct mga_device *mdev,
 			const struct mgag200_device_funcs *funcs)
 {
 	struct drm_device *dev = &mdev->base;
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	u8 crtcext3, misc;
 	int ret;
 
@@ -226,14 +196,6 @@ int mgag200_device_init(struct mga_device *mdev,
 	mutex_unlock(&mdev->rmmio_lock);
 
 	WREG32(MGAREG_IEN, 0);
-	WREG32(MGAREG_ICLEAR, MGAREG_ICLEAR_VLINEICLR);
-
-	ret = devm_request_irq(&pdev->dev, pdev->irq, mgag200_irq_handler, IRQF_SHARED,
-			       dev->driver->name, dev);
-	if (ret) {
-		drm_err(dev, "Failed to acquire interrupt, error %d\n", ret);
-		return ret;
-	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 4760ba92871b..988967eafbf2 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -391,24 +391,17 @@ int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_st
 void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *old_state);
 void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *old_state);
 void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state);
-bool mgag200_crtc_helper_get_scanout_position(struct drm_crtc *crtc, bool in_vblank_irq,
-					      int *vpos, int *hpos,
-					      ktime_t *stime, ktime_t *etime,
-					      const struct drm_display_mode *mode);
 
 #define MGAG200_CRTC_HELPER_FUNCS \
 	.mode_valid = mgag200_crtc_helper_mode_valid, \
 	.atomic_check = mgag200_crtc_helper_atomic_check, \
 	.atomic_flush = mgag200_crtc_helper_atomic_flush, \
 	.atomic_enable = mgag200_crtc_helper_atomic_enable, \
-	.atomic_disable = mgag200_crtc_helper_atomic_disable, \
-	.get_scanout_position = mgag200_crtc_helper_get_scanout_position
+	.atomic_disable = mgag200_crtc_helper_atomic_disable
 
 void mgag200_crtc_reset(struct drm_crtc *crtc);
 struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc);
 void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state);
-int mgag200_crtc_enable_vblank(struct drm_crtc *crtc);
-void mgag200_crtc_disable_vblank(struct drm_crtc *crtc);
 
 #define MGAG200_CRTC_FUNCS \
 	.reset = mgag200_crtc_reset, \
@@ -416,10 +409,7 @@ void mgag200_crtc_disable_vblank(struct drm_crtc *crtc);
 	.set_config = drm_atomic_helper_set_config, \
 	.page_flip = drm_atomic_helper_page_flip, \
 	.atomic_duplicate_state = mgag200_crtc_atomic_duplicate_state, \
-	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state, \
-	.enable_vblank = mgag200_crtc_enable_vblank, \
-	.disable_vblank = mgag200_crtc_disable_vblank, \
-	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp
+	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state
 
 void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode,
 			   bool set_vidrst);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index 77ce8d36cef0..f874e2949840 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -8,7 +8,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -404,9 +403,5 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
-	ret = drm_vblank_init(dev, 1);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index 09ced65c1d2f..e2305f8e00f8 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -8,7 +8,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -276,9 +275,5 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
-	ret = drm_vblank_init(dev, 1);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index 5daa469137bd..11ae76eb081d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -7,7 +7,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -181,9 +180,5 @@ struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
-	ret = drm_vblank_init(dev, 1);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 09cfffafe130..c20ed0ab50ec 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -8,7 +8,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -206,8 +205,6 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 		mgag200_crtc_set_gamma_linear(mdev, format);
 
 	mgag200_enable_display(mdev);
-
-	drm_crtc_vblank_on(crtc);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200er_crtc_helper_funcs = {
@@ -215,8 +212,7 @@ static const struct drm_crtc_helper_funcs mgag200_g200er_crtc_helper_funcs = {
 	.atomic_check = mgag200_crtc_helper_atomic_check,
 	.atomic_flush = mgag200_crtc_helper_atomic_flush,
 	.atomic_enable = mgag200_g200er_crtc_helper_atomic_enable,
-	.atomic_disable = mgag200_crtc_helper_atomic_disable,
-	.get_scanout_position = mgag200_crtc_helper_get_scanout_position,
+	.atomic_disable = mgag200_crtc_helper_atomic_disable
 };
 
 static const struct drm_crtc_funcs mgag200_g200er_crtc_funcs = {
@@ -312,9 +308,5 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
-	ret = drm_vblank_init(dev, 1);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 3d48baa91d8b..78be964eb97c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -8,7 +8,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -207,8 +206,6 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 		mgag200_crtc_set_gamma_linear(mdev, format);
 
 	mgag200_enable_display(mdev);
-
-	drm_crtc_vblank_on(crtc);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200ev_crtc_helper_funcs = {
@@ -216,8 +213,7 @@ static const struct drm_crtc_helper_funcs mgag200_g200ev_crtc_helper_funcs = {
 	.atomic_check = mgag200_crtc_helper_atomic_check,
 	.atomic_flush = mgag200_crtc_helper_atomic_flush,
 	.atomic_enable = mgag200_g200ev_crtc_helper_atomic_enable,
-	.atomic_disable = mgag200_crtc_helper_atomic_disable,
-	.get_scanout_position = mgag200_crtc_helper_get_scanout_position,
+	.atomic_disable = mgag200_crtc_helper_atomic_disable
 };
 
 static const struct drm_crtc_funcs mgag200_g200ev_crtc_funcs = {
@@ -317,9 +313,5 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
-	ret = drm_vblank_init(dev, 1);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index dabc778e64e8..31624c9ab7b7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -7,7 +7,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -199,9 +198,5 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
-	ret = drm_vblank_init(dev, 1);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 9dcbe8304271..7a32d3b1d226 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -8,7 +8,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -338,8 +337,6 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 		mgag200_crtc_set_gamma_linear(mdev, format);
 
 	mgag200_enable_display(mdev);
-
-	drm_crtc_vblank_on(crtc);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200se_crtc_helper_funcs = {
@@ -347,8 +344,7 @@ static const struct drm_crtc_helper_funcs mgag200_g200se_crtc_helper_funcs = {
 	.atomic_check = mgag200_crtc_helper_atomic_check,
 	.atomic_flush = mgag200_crtc_helper_atomic_flush,
 	.atomic_enable = mgag200_g200se_crtc_helper_atomic_enable,
-	.atomic_disable = mgag200_crtc_helper_atomic_disable,
-	.get_scanout_position = mgag200_crtc_helper_get_scanout_position,
+	.atomic_disable = mgag200_crtc_helper_atomic_disable
 };
 
 static const struct drm_crtc_funcs mgag200_g200se_crtc_funcs = {
@@ -517,9 +513,5 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
-	ret = drm_vblank_init(dev, 1);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index 83a24aedbf2f..a0e7b9ad46cd 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -8,7 +8,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -323,9 +322,5 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
-	ret = drm_vblank_init(dev, 1);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 7159909aca1e..fb71658c3117 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -22,7 +22,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_panic.h>
 #include <drm/drm_print.h>
-#include <drm/drm_vblank.h>
 
 #include "mgag200_ddc.h"
 #include "mgag200_drv.h"
@@ -227,14 +226,7 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 	vblkstr = mode->crtc_vblank_start;
 	vblkend = vtotal + 1;
 
-	/*
-	 * There's no VBLANK interrupt on Matrox chipsets, so we use
-	 * the VLINE interrupt instead. It triggers when the current
-	 * <linecomp> has been reached. For VBLANK, this is the first
-	 * non-visible line at the bottom of the screen. Therefore,
-	 * keep <linecomp> in sync with <vblkstr>.
-	 */
-	linecomp = vblkstr;
+	linecomp = vdispend;
 
 	misc = RREG8(MGA_MISC_IN);
 
@@ -645,8 +637,6 @@ void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_s
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = to_mga_device(dev);
-	struct drm_pending_vblank_event *event;
-	unsigned long flags;
 
 	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
 		const struct drm_format_info *format = mgag200_crtc_state->format;
@@ -656,18 +646,6 @@ void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_s
 		else
 			mgag200_crtc_set_gamma_linear(mdev, format);
 	}
-
-	event = crtc->state->event;
-	if (event) {
-		crtc->state->event = NULL;
-
-		spin_lock_irqsave(&dev->event_lock, flags);
-		if (drm_crtc_vblank_get(crtc) != 0)
-			drm_crtc_send_vblank_event(crtc, event);
-		else
-			drm_crtc_arm_vblank_event(crtc, event);
-		spin_unlock_irqrestore(&dev->event_lock, flags);
-	}
 }
 
 void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
@@ -692,44 +670,15 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 		mgag200_crtc_set_gamma_linear(mdev, format);
 
 	mgag200_enable_display(mdev);
-
-	drm_crtc_vblank_on(crtc);
 }
 
 void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
 	struct mga_device *mdev = to_mga_device(crtc->dev);
 
-	drm_crtc_vblank_off(crtc);
-
 	mgag200_disable_display(mdev);
 }
 
-bool mgag200_crtc_helper_get_scanout_position(struct drm_crtc *crtc, bool in_vblank_irq,
-					      int *vpos, int *hpos,
-					      ktime_t *stime, ktime_t *etime,
-					      const struct drm_display_mode *mode)
-{
-	struct mga_device *mdev = to_mga_device(crtc->dev);
-	u32 vcount;
-
-	if (stime)
-		*stime = ktime_get();
-
-	if (vpos) {
-		vcount = RREG32(MGAREG_VCOUNT);
-		*vpos = vcount & GENMASK(11, 0);
-	}
-
-	if (hpos)
-		*hpos = mode->htotal >> 1; // near middle of scanline on average
-
-	if (etime)
-		*etime = ktime_get();
-
-	return true;
-}
-
 void mgag200_crtc_reset(struct drm_crtc *crtc)
 {
 	struct mgag200_crtc_state *mgag200_crtc_state;
@@ -774,30 +723,6 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
 	kfree(mgag200_crtc_state);
 }
 
-int mgag200_crtc_enable_vblank(struct drm_crtc *crtc)
-{
-	struct mga_device *mdev = to_mga_device(crtc->dev);
-	u32 ien;
-
-	WREG32(MGAREG_ICLEAR, MGAREG_ICLEAR_VLINEICLR);
-
-	ien = RREG32(MGAREG_IEN);
-	ien |= MGAREG_IEN_VLINEIEN;
-	WREG32(MGAREG_IEN, ien);
-
-	return 0;
-}
-
-void mgag200_crtc_disable_vblank(struct drm_crtc *crtc)
-{
-	struct mga_device *mdev = to_mga_device(crtc->dev);
-	u32 ien;
-
-	ien = RREG32(MGAREG_IEN);
-	ien &= ~(MGAREG_IEN_VLINEIEN);
-	WREG32(MGAREG_IEN, ien);
-}
-
 /*
  * Mode config
  */
-- 
2.46.0

