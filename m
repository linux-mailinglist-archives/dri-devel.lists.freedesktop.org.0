Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B470934BDE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 12:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790E410E743;
	Thu, 18 Jul 2024 10:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DWHmFLxc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XbbawYgw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DWHmFLxc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XbbawYgw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0688610E743
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 10:45:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7FB8021AF5;
 Thu, 18 Jul 2024 10:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721299556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lX4F+lK3cVKTd57NKPjWboQlsX76lS4eX0f+ky0AE2M=;
 b=DWHmFLxc71FFWPxygYAclcu5wzj1Tum1ejsLs2VH7OM9XZIRIDNBO9eW7EqewPzgo9itLB
 9V6JDv0Qv51bRQ7tWdq9B7Arljc3c3R/Dh+8pMI3eocZQSL9ka0Llj5HYoYvL5eB7asgi7
 Ohck5o+p9aOH/yeOygfiqFlVpkB4iDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721299556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lX4F+lK3cVKTd57NKPjWboQlsX76lS4eX0f+ky0AE2M=;
 b=XbbawYgwSwaYauGyP695zV8vL5AlEOTUntMJ+MvYTYzNjiI4e6z09isTZhuuu3liV9IQ5w
 hfmBakjfJIqu7QBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721299556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lX4F+lK3cVKTd57NKPjWboQlsX76lS4eX0f+ky0AE2M=;
 b=DWHmFLxc71FFWPxygYAclcu5wzj1Tum1ejsLs2VH7OM9XZIRIDNBO9eW7EqewPzgo9itLB
 9V6JDv0Qv51bRQ7tWdq9B7Arljc3c3R/Dh+8pMI3eocZQSL9ka0Llj5HYoYvL5eB7asgi7
 Ohck5o+p9aOH/yeOygfiqFlVpkB4iDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721299556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lX4F+lK3cVKTd57NKPjWboQlsX76lS4eX0f+ky0AE2M=;
 b=XbbawYgwSwaYauGyP695zV8vL5AlEOTUntMJ+MvYTYzNjiI4e6z09isTZhuuu3liV9IQ5w
 hfmBakjfJIqu7QBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37CA0137EB;
 Thu, 18 Jul 2024 10:45:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GPN0DGTymGbeUAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Jul 2024 10:45:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 emil.l.velikov@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v5 6/7] drm/mgag200: Add vblank support
Date: Thu, 18 Jul 2024 12:44:16 +0200
Message-ID: <20240718104551.575912-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718104551.575912-1-tzimmermann@suse.de>
References: <20240718104551.575912-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; REPLY(-4.00)[];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ravnborg.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[11];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
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

There's no VBLANK interrupt on Matrox chipsets. The workaround that is
being used here and in other free Matrox drivers is to program <linecomp>
to the value of <vblkstr> and enable the VLINE interrupt. This triggers
an interrupt at the time when VBLANK begins.

VLINE uses separate registers for enabling and clearing pending interrupts.
No extra synchronization between irq handler and the rest of the driver is
required.

v5:
- disable all interrupts before registering IRQ (Jocelyn)
- don't read from ICLEAR (Jocelyn)

v4:
- recreate patch on latest upstream
- use devm_request_irq() for managed cleanup
- fail if vblanking cannot be initialized
- rename register constants (Sam, Emil)
- clear interrupt before registering handler (Ville)
- move <linecomp> programming into separate commit
- set <linecomp> to <vblkstr>
- fix typo in commit message

v3:
- set <linecomp> to <vdisplay> + 1 to trigger at VBLANK
- expand comment on linecomp

v2:
- only signal vblank on CRTC 0
- use constants for registers and fields
- set VLINECLR before enabling interrupt
- test against STATUS and IEN in irq handler
- coding-style fixes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c     | 40 +++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  6 ++-
 drivers/gpu/drm/mgag200/mgag200_g200.c    |  5 +++
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  5 +++
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  5 +++
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  5 +++
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  5 +++
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  5 +++
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |  5 +++
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  5 +++
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 52 ++++++++++++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_reg.h     |  7 +++
 12 files changed, 143 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 62080cf0f2da..c33d4be4ef9d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -18,6 +18,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_module.h>
 #include <drm/drm_pciids.h>
+#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -84,6 +85,34 @@ resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size)
 	return offset - 65536;
 }
 
+static irqreturn_t mgag200_irq_handler(int irq, void *arg)
+{
+	struct drm_device *dev = arg;
+	struct mga_device *mdev = to_mga_device(dev);
+	struct drm_crtc *crtc;
+	u32 status, ien;
+
+	status = RREG32(MGAREG_STATUS);
+
+	if (status & MGAREG_STATUS_VLINEPEN) {
+		ien = RREG32(MGAREG_IEN);
+		if (!(ien & MGAREG_IEN_VLINEIEN))
+			goto out;
+
+		crtc = drm_crtc_from_index(dev, 0);
+		if (WARN_ON_ONCE(!crtc))
+			goto out;
+		drm_crtc_handle_vblank(crtc);
+
+		WREG32(MGAREG_ICLEAR, MGAREG_ICLEAR_VLINEICLR);
+
+		return IRQ_HANDLED;
+	}
+
+out:
+	return IRQ_NONE;
+}
+
 /*
  * DRM driver
  */
@@ -167,6 +196,7 @@ int mgag200_device_init(struct mga_device *mdev,
 			const struct mgag200_device_funcs *funcs)
 {
 	struct drm_device *dev = &mdev->base;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	u8 crtcext3, misc;
 	int ret;
 
@@ -192,6 +222,16 @@ int mgag200_device_init(struct mga_device *mdev,
 
 	mutex_unlock(&mdev->rmmio_lock);
 
+	WREG32(MGAREG_IEN, 0);
+	WREG32(MGAREG_ICLEAR, 0);
+
+	ret = devm_request_irq(&pdev->dev, pdev->irq, mgag200_irq_handler, IRQF_SHARED,
+			       dev->driver->name, dev);
+	if (ret) {
+		drm_err(dev, "Failed to acquire interrupt, error %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index f97eaa49b089..829d32f50915 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -411,6 +411,8 @@ void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic
 void mgag200_crtc_reset(struct drm_crtc *crtc);
 struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc);
 void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state);
+int mgag200_crtc_enable_vblank(struct drm_crtc *crtc);
+void mgag200_crtc_disable_vblank(struct drm_crtc *crtc);
 
 #define MGAG200_CRTC_FUNCS \
 	.reset = mgag200_crtc_reset, \
@@ -418,7 +420,9 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
 	.set_config = drm_atomic_helper_set_config, \
 	.page_flip = drm_atomic_helper_page_flip, \
 	.atomic_duplicate_state = mgag200_crtc_atomic_duplicate_state, \
-	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state
+	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state, \
+	.enable_vblank = mgag200_crtc_enable_vblank, \
+	.disable_vblank = mgag200_crtc_disable_vblank
 
 void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode,
 			   bool set_vidrst);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index f874e2949840..77ce8d36cef0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -8,6 +8,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -403,5 +404,9 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
+	ret = drm_vblank_init(dev, 1);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index 52bf49ead5c5..72bd8e3421c2 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -8,6 +8,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -279,5 +280,9 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
+	ret = drm_vblank_init(dev, 1);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index e7f89b2a59fd..1bbb0745b84a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -7,6 +7,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -184,5 +185,9 @@ struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
+	ret = drm_vblank_init(dev, 1);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 737a48aa9160..6d727ab1a7aa 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -8,6 +8,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -315,5 +316,9 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
+	ret = drm_vblank_init(dev, 1);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 8d1ccc2ad94a..e6c9ba61bf97 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -8,6 +8,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -320,5 +321,9 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
+	ret = drm_vblank_init(dev, 1);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 265f3e95830a..fbaa97c7e0da 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -7,6 +7,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -202,5 +203,9 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
+	ret = drm_vblank_init(dev, 1);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index cf7f6897838f..2a53ebf41539 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -8,6 +8,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -520,5 +521,9 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
+	ret = drm_vblank_init(dev, 1);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index e25477347c3e..33ef35c95acb 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -8,6 +8,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "mgag200_drv.h"
 
@@ -326,5 +327,9 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
 	drm_mode_config_reset(dev);
 	drm_kms_helper_poll_init(dev);
 
+	ret = drm_vblank_init(dev, 1);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index ff90f29b0612..afabf693df64 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -22,6 +22,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_panic.h>
 #include <drm/drm_print.h>
+#include <drm/drm_vblank.h>
 
 #include "mgag200_ddc.h"
 #include "mgag200_drv.h"
@@ -226,7 +227,14 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 	vblkstr = mode->crtc_vblank_start;
 	vblkend = vtotal + 1;
 
-	linecomp = vdispend;
+	/*
+	 * There's no VBLANK interrupt on Matrox chipsets, so we use
+	 * the VLINE interrupt instead. It triggers when the current
+	 * <linecomp> has been reached. For VBLANK, this is the first
+	 * non-visible line at the bottom of the screen. Therefore,
+	 * keep <linecomp> in sync with <vblkstr>.
+	 */
+	linecomp = vblkstr;
 
 	misc = RREG8(MGA_MISC_IN);
 
@@ -640,6 +648,8 @@ void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_s
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = to_mga_device(dev);
+	struct drm_pending_vblank_event *event;
+	unsigned long flags;
 
 	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
 		const struct drm_format_info *format = mgag200_crtc_state->format;
@@ -649,6 +659,18 @@ void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_s
 		else
 			mgag200_crtc_set_gamma_linear(mdev, format);
 	}
+
+	event = crtc->state->event;
+	if (event) {
+		crtc->state->event = NULL;
+
+		spin_lock_irqsave(&dev->event_lock, flags);
+		if (drm_crtc_vblank_get(crtc) != 0)
+			drm_crtc_send_vblank_event(crtc, event);
+		else
+			drm_crtc_arm_vblank_event(crtc, event);
+		spin_unlock_irqrestore(&dev->event_lock, flags);
+	}
 }
 
 void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
@@ -676,12 +698,16 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 
 	if (mdev->info->sync_bmc)
 		mgag200_bmc_start_scanout(mdev);
+
+	drm_crtc_vblank_on(crtc);
 }
 
 void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
 	struct mga_device *mdev = to_mga_device(crtc->dev);
 
+	drm_crtc_vblank_off(crtc);
+
 	if (mdev->info->sync_bmc)
 		mgag200_bmc_stop_scanout(mdev);
 
@@ -732,6 +758,30 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
 	kfree(mgag200_crtc_state);
 }
 
+int mgag200_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct mga_device *mdev = to_mga_device(crtc->dev);
+	u32 ien;
+
+	WREG32(MGAREG_ICLEAR, MGAREG_ICLEAR_VLINEICLR);
+
+	ien = RREG32(MGAREG_IEN);
+	ien |= MGAREG_IEN_VLINEIEN;
+	WREG32(MGAREG_IEN, ien);
+
+	return 0;
+}
+
+void mgag200_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct mga_device *mdev = to_mga_device(crtc->dev);
+	u32 ien;
+
+	ien = RREG32(MGAREG_IEN);
+	ien &= ~(MGAREG_IEN_VLINEIEN);
+	WREG32(MGAREG_IEN, ien);
+}
+
 /*
  * Mode config
  */
diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/mgag200/mgag200_reg.h
index aa73463674e4..d4fef8f25871 100644
--- a/drivers/gpu/drm/mgag200/mgag200_reg.h
+++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
@@ -102,10 +102,17 @@
 #define MGAREG_EXEC		0x0100
 
 #define	MGAREG_FIFOSTATUS	0x1e10
+
 #define	MGAREG_STATUS		0x1e14
+#define MGAREG_STATUS_VLINEPEN	BIT(5)
+
 #define MGAREG_CACHEFLUSH       0x1fff
+
 #define	MGAREG_ICLEAR		0x1e18
+#define MGAREG_ICLEAR_VLINEICLR	BIT(5)
+
 #define	MGAREG_IEN		0x1e1c
+#define MGAREG_IEN_VLINEIEN	BIT(5)
 
 #define	MGAREG_VCOUNT		0x1e20
 
-- 
2.45.2

