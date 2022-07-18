Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AAE577E9D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 11:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E8914BDAA;
	Mon, 18 Jul 2022 09:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5C018BEDC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 09:27:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E17C420D40;
 Mon, 18 Jul 2022 09:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658136476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HkiryluuB3PjNPMpBvbSW1T1XwTjXyNJCBHM1S6m1OI=;
 b=Js4bFcX4ijARNj760RatI8EoXbOE2Mp+x2mgehHvfJRHy+VN4Bh0QRY5RsT6uEnTguPGij
 Egv1c4/NlhbcUiJylHuRXI6Rt51nt//0GBMkcWdGt830XmHjZFWdg+m8L6HgTMB78uIsb/
 +y/CTj+jmjuMs+i7g/CUrjcxSaGnUNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658136476;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HkiryluuB3PjNPMpBvbSW1T1XwTjXyNJCBHM1S6m1OI=;
 b=X8ySQWpt5I8VPhkb92tIN+jnr66zoQO1tMXlYnaD3zeb3/HVdjofhuwIfxUrMXQSR/naTz
 iPtFZ9OpbLu53MDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AAEE713AB4;
 Mon, 18 Jul 2022 09:27:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QPHhKJwn1WJ6LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 09:27:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, airlied@redhat.com, airlied@linux.ie,
 jfalempe@redhat.com, daniel@ffwll.ch
Subject: [PATCH v2 10/14] drm/mgag200: Provide per-device callbacks for BMC
 synchronization
Date: Mon, 18 Jul 2022 11:27:49 +0200
Message-Id: <20220718092753.9598-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718092753.9598-1-tzimmermann@suse.de>
References: <20220718092753.9598-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the BMC-related code into its own file and wire it up with device
callbacks.

While programming a new display mode, G200EW3 and G200WB have to de-
synchronize with the BMC. Synchronization is done via VIDRST pins
and controlled via VRSTEN and HRSTEN bits. Move the BMC code behind
a serviceable interface and call it from the CRTC's enable and
disable functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/Makefile          |   1 +
 drivers/gpu/drm/mgag200/mgag200_bmc.c     |  99 ++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  15 +++
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |   2 +
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |   2 +
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 107 ++--------------------
 6 files changed, 129 insertions(+), 97 deletions(-)
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_bmc.c

diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/Makefile
index 89558549c3af..94d465a2b753 100644
--- a/drivers/gpu/drm/mgag200/Makefile
+++ b/drivers/gpu/drm/mgag200/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 mgag200-y := \
+	mgag200_bmc.o \
 	mgag200_drv.o \
 	mgag200_g200.o \
 	mgag200_g200eh.o \
diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
new file mode 100644
index 000000000000..2ba2e3c5086a
--- /dev/null
+++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/delay.h>
+
+#include "mgag200_drv.h"
+
+void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
+{
+	u8 tmp;
+	int iter_max;
+
+	/*
+	 * 1 - The first step is to inform the BMC of an upcoming mode
+	 * change. We are putting the misc<0> to output.
+	 */
+
+	WREG8(DAC_INDEX, MGA1064_GEN_IO_CTL);
+	tmp = RREG8(DAC_DATA);
+	tmp |= 0x10;
+	WREG_DAC(MGA1064_GEN_IO_CTL, tmp);
+
+	/* we are putting a 1 on the misc<0> line */
+	WREG8(DAC_INDEX, MGA1064_GEN_IO_DATA);
+	tmp = RREG8(DAC_DATA);
+	tmp |= 0x10;
+	WREG_DAC(MGA1064_GEN_IO_DATA, tmp);
+
+	/*
+	 * 2- Second step to mask any further scan request. This is
+	 * done by asserting the remfreqmsk bit (XSPAREREG<7>)
+	 */
+
+	WREG8(DAC_INDEX, MGA1064_SPAREREG);
+	tmp = RREG8(DAC_DATA);
+	tmp |= 0x80;
+	WREG_DAC(MGA1064_SPAREREG, tmp);
+
+	/*
+	 * 3a- The third step is to verify if there is an active scan.
+	 * We are waiting for a 0 on remhsyncsts <XSPAREREG<0>).
+	 */
+	iter_max = 300;
+	while (!(tmp & 0x1) && iter_max) {
+		WREG8(DAC_INDEX, MGA1064_SPAREREG);
+		tmp = RREG8(DAC_DATA);
+		udelay(1000);
+		iter_max--;
+	}
+
+	/*
+	 * 3b- This step occurs only if the remove is actually
+	 * scanning. We are waiting for the end of the frame which is
+	 * a 1 on remvsyncsts (XSPAREREG<1>)
+	 */
+	if (iter_max) {
+		iter_max = 300;
+		while ((tmp & 0x2) && iter_max) {
+			WREG8(DAC_INDEX, MGA1064_SPAREREG);
+			tmp = RREG8(DAC_DATA);
+			udelay(1000);
+			iter_max--;
+		}
+	}
+}
+
+void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
+{
+	u8 tmp;
+
+	/* Ensure that the vrsten and hrsten are set */
+	WREG8(MGAREG_CRTCEXT_INDEX, 1);
+	tmp = RREG8(MGAREG_CRTCEXT_DATA);
+	WREG8(MGAREG_CRTCEXT_DATA, tmp | 0x88);
+
+	/* Assert rstlvl2 */
+	WREG8(DAC_INDEX, MGA1064_REMHEADCTL2);
+	tmp = RREG8(DAC_DATA);
+	tmp |= 0x8;
+	WREG8(DAC_DATA, tmp);
+
+	udelay(10);
+
+	/* Deassert rstlvl2 */
+	tmp &= ~0x08;
+	WREG8(DAC_INDEX, MGA1064_REMHEADCTL2);
+	WREG8(DAC_DATA, tmp);
+
+	/* Remove mask of scan request */
+	WREG8(DAC_INDEX, MGA1064_SPAREREG);
+	tmp = RREG8(DAC_DATA);
+	tmp &= ~0x80;
+	WREG8(DAC_DATA, tmp);
+
+	/* Put back a 0 on the misc<0> line */
+	WREG8(DAC_INDEX, MGA1064_GEN_IO_DATA);
+	tmp = RREG8(DAC_DATA);
+	tmp &= ~0x10;
+	WREG_DAC(MGA1064_GEN_IO_DATA, tmp);
+}
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index db29eef8981b..e78c1b2f5c27 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -263,6 +263,17 @@ struct mgag200_device_info {
 	}
 
 struct mgag200_device_funcs {
+	/*
+	 * Disables an external reset source (i.e., BMC) before programming
+	 * a new display mode.
+	 */
+	void (*disable_vidrst)(struct mga_device *mdev);
+
+	/*
+	 * Enables an external reset source (i.e., BMC) after programming
+	 * a new display mode.
+	 */
+	void (*enable_vidrst)(struct mga_device *mdev);
 };
 
 struct mga_device {
@@ -354,6 +365,10 @@ resource_size_t mgag200_device_probe_vram(struct mga_device *mdev);
 void mgag200_init_registers(struct mga_device *mdev);
 int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_fb_available);
 
+				/* mgag200_bmc.c */
+void mgag200_bmc_disable_vidrst(struct mga_device *mdev);
+void mgag200_bmc_enable_vidrst(struct mga_device *mdev);
+
 				/* mgag200_i2c.c */
 int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 202db00bb62e..19a870120ebc 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -21,6 +21,8 @@ static const struct mgag200_device_info mgag200_g200ew3_device_info =
 	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, true, 0, 1, false);
 
 static const struct mgag200_device_funcs mgag200_g200ew3_device_funcs = {
+	.disable_vidrst = mgag200_bmc_disable_vidrst,
+	.enable_vidrst = mgag200_bmc_enable_vidrst,
 };
 
 static resource_size_t mgag200_g200ew3_device_probe_vram(struct mga_device *mdev)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index 2b5dd0cc38e2..91d2848b4b06 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -36,6 +36,8 @@ static const struct mgag200_device_info mgag200_g200wb_device_info =
 	MGAG200_DEVICE_INFO_INIT(1280, 1024, 31877, true, 0, 1, false);
 
 static const struct mgag200_device_funcs mgag200_g200wb_device_funcs = {
+	.disable_vidrst = mgag200_bmc_disable_vidrst,
+	.enable_vidrst = mgag200_bmc_enable_vidrst,
 };
 
 struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 789e02b8615f..7bcd3f6d891d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -132,95 +132,6 @@ static inline void mga_wait_busy(struct mga_device *mdev)
 	} while ((status & 0x01) && time_before(jiffies, timeout));
 }
 
-static void mgag200_g200wb_hold_bmc(struct mga_device *mdev)
-{
-	u8 tmp;
-	int iter_max;
-
-	/* 1- The first step is to warn the BMC of an upcoming mode change.
-	 * We are putting the misc<0> to output.*/
-
-	WREG8(DAC_INDEX, MGA1064_GEN_IO_CTL);
-	tmp = RREG8(DAC_DATA);
-	tmp |= 0x10;
-	WREG_DAC(MGA1064_GEN_IO_CTL, tmp);
-
-	/* we are putting a 1 on the misc<0> line */
-	WREG8(DAC_INDEX, MGA1064_GEN_IO_DATA);
-	tmp = RREG8(DAC_DATA);
-	tmp |= 0x10;
-	WREG_DAC(MGA1064_GEN_IO_DATA, tmp);
-
-	/* 2- Second step to mask and further scan request
-	 * This will be done by asserting the remfreqmsk bit (XSPAREREG<7>)
-	 */
-	WREG8(DAC_INDEX, MGA1064_SPAREREG);
-	tmp = RREG8(DAC_DATA);
-	tmp |= 0x80;
-	WREG_DAC(MGA1064_SPAREREG, tmp);
-
-	/* 3a- the third step is to verifu if there is an active scan
-	 * We are searching for a 0 on remhsyncsts <XSPAREREG<0>)
-	 */
-	iter_max = 300;
-	while (!(tmp & 0x1) && iter_max) {
-		WREG8(DAC_INDEX, MGA1064_SPAREREG);
-		tmp = RREG8(DAC_DATA);
-		udelay(1000);
-		iter_max--;
-	}
-
-	/* 3b- this step occurs only if the remove is actually scanning
-	 * we are waiting for the end of the frame which is a 1 on
-	 * remvsyncsts (XSPAREREG<1>)
-	 */
-	if (iter_max) {
-		iter_max = 300;
-		while ((tmp & 0x2) && iter_max) {
-			WREG8(DAC_INDEX, MGA1064_SPAREREG);
-			tmp = RREG8(DAC_DATA);
-			udelay(1000);
-			iter_max--;
-		}
-	}
-}
-
-static void mgag200_g200wb_release_bmc(struct mga_device *mdev)
-{
-	u8 tmp;
-
-	/* 1- The first step is to ensure that the vrsten and hrsten are set */
-	WREG8(MGAREG_CRTCEXT_INDEX, 1);
-	tmp = RREG8(MGAREG_CRTCEXT_DATA);
-	WREG8(MGAREG_CRTCEXT_DATA, tmp | 0x88);
-
-	/* 2- second step is to assert the rstlvl2 */
-	WREG8(DAC_INDEX, MGA1064_REMHEADCTL2);
-	tmp = RREG8(DAC_DATA);
-	tmp |= 0x8;
-	WREG8(DAC_DATA, tmp);
-
-	/* wait 10 us */
-	udelay(10);
-
-	/* 3- deassert rstlvl2 */
-	tmp &= ~0x08;
-	WREG8(DAC_INDEX, MGA1064_REMHEADCTL2);
-	WREG8(DAC_DATA, tmp);
-
-	/* 4- remove mask of scan request */
-	WREG8(DAC_INDEX, MGA1064_SPAREREG);
-	tmp = RREG8(DAC_DATA);
-	tmp &= ~0x80;
-	WREG8(DAC_DATA, tmp);
-
-	/* 5- put back a 0 on the misc<0> line */
-	WREG8(DAC_INDEX, MGA1064_GEN_IO_DATA);
-	tmp = RREG8(DAC_DATA);
-	tmp &= ~0x10;
-	WREG_DAC(MGA1064_GEN_IO_DATA, tmp);
-}
-
 /*
  * This is how the framebuffer base address is stored in g200 cards:
  *   * Assume @offset is the gpu_addr variable of the framebuffer object
@@ -804,14 +715,15 @@ static void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = to_mga_device(dev);
+	const struct mgag200_device_funcs *funcs = mdev->funcs;
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
 	const struct drm_format_info *format = mgag200_crtc_state->format;
 	struct mgag200_pll *pixpll = &mdev->pixpll;
 
-	if (mdev->type == G200_WB || mdev->type == G200_EW3)
-		mgag200_g200wb_hold_bmc(mdev);
+	if (funcs->disable_vidrst)
+		funcs->disable_vidrst(mdev);
 
 	mgag200_set_format_regs(mdev, format);
 	mgag200_set_mode_regs(mdev, adjusted_mode);
@@ -828,22 +740,23 @@ static void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_enable_display(mdev);
 
-	if (mdev->type == G200_WB || mdev->type == G200_EW3)
-		mgag200_g200wb_release_bmc(mdev);
+	if (funcs->enable_vidrst)
+		funcs->enable_vidrst(mdev);
 }
 
 static void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc,
 					       struct drm_atomic_state *old_state)
 {
 	struct mga_device *mdev = to_mga_device(crtc->dev);
+	const struct mgag200_device_funcs *funcs = mdev->funcs;
 
-	if (mdev->type == G200_WB || mdev->type == G200_EW3)
-		mgag200_g200wb_hold_bmc(mdev);
+	if (funcs->disable_vidrst)
+		funcs->disable_vidrst(mdev);
 
 	mgag200_disable_display(mdev);
 
-	if (mdev->type == G200_WB || mdev->type == G200_EW3)
-		mgag200_g200wb_release_bmc(mdev);
+	if (funcs->enable_vidrst)
+		funcs->enable_vidrst(mdev);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_crtc_helper_funcs = {
-- 
2.36.1

