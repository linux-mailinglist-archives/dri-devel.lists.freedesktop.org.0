Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0811577E9B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 11:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858CB90556;
	Mon, 18 Jul 2022 09:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D5790556
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 09:27:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A23C220D41;
 Mon, 18 Jul 2022 09:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658136477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8/Q+ldShYflw/2m5JXWH6cO/cn8WUbYbDB23n3Ypfc=;
 b=ahSkRhoyA+eDUIZQk7tF7+yqDW7IjmRDARuo9ZAfjaKPY9IAidz/Ehu0d2+1YZ04ZHA3aa
 3ZIeQdAScq+ulrXv/4owJK8utjRRFPLmVObZ96xqtNzNjFw/5xMUpk/WMbf4I3aiZHrGkw
 CicIW1+2vhn/sdWSh3SoSfSx1ZtCj6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658136477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8/Q+ldShYflw/2m5JXWH6cO/cn8WUbYbDB23n3Ypfc=;
 b=QzFdUqeyoAkBEweD1W6pyMpUKHAdRLhIGpqJC1Pv4vhZ/x1Hry0KSiAhQ13jNbifREvtw8
 ezOH6WiqSVBbrtBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 78B5313754;
 Mon, 18 Jul 2022 09:27:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0DOeHJ0n1WJ6LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 09:27:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, airlied@redhat.com, airlied@linux.ie,
 jfalempe@redhat.com, daniel@ffwll.ch
Subject: [PATCH v2 13/14] drm/mgag200: Move CRTC atomic_enable to
 model-specfic code
Date: Mon, 18 Jul 2022 11:27:52 +0200
Message-Id: <20220718092753.9598-14-tzimmermann@suse.de>
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

The CRTC atomic_enable helper contains per-model branches for
G200ER, G200EV and G200SE devices. Implement a dedicated helper
for each of them and remove the branches from the shared helper.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  6 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c | 50 ++++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c | 39 ++++++++++-
 drivers/gpu/drm/mgag200/mgag200_g200se.c | 80 ++++++++++++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_mode.c   | 82 +-----------------------
 5 files changed, 172 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 272ac61d992d..b5a866c0b42f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -210,8 +210,6 @@ enum mga_type {
 	G200_EW3,
 };
 
-#define IS_G200_SE(mdev) (mdev->type == G200_SE_A || mdev->type == G200_SE_B)
-
 struct mgag200_device_info {
 	u16 max_hdisplay;
 	u16 max_vdisplay;
@@ -438,7 +436,9 @@ int mgag200_vga_connector_helper_get_modes(struct drm_connector *connector);
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state, \
 	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state
 
-resource_size_t mgag200_device_probe_vram(struct mga_device *mdev);
+void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode);
+void mgag200_set_format_regs(struct mga_device *mdev, const struct drm_format_info *format);
+void mgag200_enable_display(struct mga_device *mdev);
 void mgag200_init_registers(struct mga_device *mdev);
 int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_available);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 00d90bd40d75..e388edc90a54 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -36,6 +36,22 @@ static void mgag200_g200er_init_registers(struct mga_device *mdev)
 	WREG_ECRT(0x24, 0x5); /* G200ER specific */
 }
 
+static void mgag200_g200er_reset_tagfifo(struct mga_device *mdev)
+{
+	static const uint32_t RESET_FLAG = 0x00200000; /* undocumented magic value */
+	u32 memctl;
+
+	memctl = RREG32(MGAREG_MEMCTL);
+
+	memctl |= RESET_FLAG;
+	WREG32(MGAREG_MEMCTL, memctl);
+
+	udelay(1000);
+
+	memctl &= ~RESET_FLAG;
+	WREG32(MGAREG_MEMCTL, memctl);
+}
+
 /*
  * PIXPLLC
  */
@@ -164,8 +180,40 @@ static const struct drm_plane_funcs mgag200_g200er_primary_plane_funcs = {
 	MGAG200_PRIMARY_PLANE_FUNCS,
 };
 
+static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+						     struct drm_atomic_state *old_state)
+{
+	struct drm_device *dev = crtc->dev;
+	struct mga_device *mdev = to_mga_device(dev);
+	const struct mgag200_device_funcs *funcs = mdev->funcs;
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
+	const struct drm_format_info *format = mgag200_crtc_state->format;
+
+	if (funcs->disable_vidrst)
+		funcs->disable_vidrst(mdev);
+
+	mgag200_set_format_regs(mdev, format);
+	mgag200_set_mode_regs(mdev, adjusted_mode);
+
+	if (funcs->pixpllc_atomic_update)
+		funcs->pixpllc_atomic_update(crtc, old_state);
+
+	mgag200_g200er_reset_tagfifo(mdev);
+
+	mgag200_enable_display(mdev);
+
+	if (funcs->enable_vidrst)
+		funcs->enable_vidrst(mdev);
+}
+
 static const struct drm_crtc_helper_funcs mgag200_g200er_crtc_helper_funcs = {
-	MGAG200_CRTC_HELPER_FUNCS,
+	.mode_valid = mgag200_crtc_helper_mode_valid,
+	.atomic_check = mgag200_crtc_helper_atomic_check,
+	.atomic_flush = mgag200_crtc_helper_atomic_flush,
+	.atomic_enable = mgag200_g200er_crtc_helper_atomic_enable,
+	.atomic_disable = mgag200_crtc_helper_atomic_disable
 };
 
 static const struct drm_crtc_funcs mgag200_g200er_crtc_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 7a4fcad2d8f2..0084825e18e0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -36,6 +36,11 @@ static void mgag200_g200ev_init_registers(struct mga_device *mdev)
 	mgag200_init_registers(mdev);
 }
 
+static void mgag200_g200ev_set_hiprilvl(struct mga_device *mdev)
+{
+	WREG_ECRT(0x06, 0x00);
+}
+
 /*
  * PIXPLLC
  */
@@ -176,8 +181,40 @@ static const struct drm_plane_funcs mgag200_g200ev_primary_plane_funcs = {
 	MGAG200_PRIMARY_PLANE_FUNCS,
 };
 
+static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+						     struct drm_atomic_state *old_state)
+{
+	struct drm_device *dev = crtc->dev;
+	struct mga_device *mdev = to_mga_device(dev);
+	const struct mgag200_device_funcs *funcs = mdev->funcs;
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
+	const struct drm_format_info *format = mgag200_crtc_state->format;
+
+	if (funcs->disable_vidrst)
+		funcs->disable_vidrst(mdev);
+
+	mgag200_set_format_regs(mdev, format);
+	mgag200_set_mode_regs(mdev, adjusted_mode);
+
+	if (funcs->pixpllc_atomic_update)
+		funcs->pixpllc_atomic_update(crtc, old_state);
+
+	mgag200_g200ev_set_hiprilvl(mdev);
+
+	mgag200_enable_display(mdev);
+
+	if (funcs->enable_vidrst)
+		funcs->enable_vidrst(mdev);
+}
+
 static const struct drm_crtc_helper_funcs mgag200_g200ev_crtc_helper_funcs = {
-	MGAG200_CRTC_HELPER_FUNCS,
+	.mode_valid = mgag200_crtc_helper_mode_valid,
+	.atomic_check = mgag200_crtc_helper_atomic_check,
+	.atomic_flush = mgag200_crtc_helper_atomic_flush,
+	.atomic_enable = mgag200_g200ev_crtc_helper_atomic_enable,
+	.atomic_disable = mgag200_crtc_helper_atomic_disable
 };
 
 static const struct drm_crtc_funcs mgag200_g200ev_crtc_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index b36346faa560..e62cd52a1dad 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -61,6 +61,52 @@ static void mgag200_g200se_init_registers(struct mgag200_g200se_device *g200se)
 	mgag200_init_registers(mdev);
 }
 
+static void mgag200_g200se_set_hiprilvl(struct mga_device *mdev,
+					const struct drm_display_mode *mode,
+					const struct drm_format_info *format)
+{
+	struct mgag200_g200se_device *g200se = to_mgag200_g200se_device(&mdev->base);
+	unsigned int hiprilvl;
+	u8 crtcext6;
+
+	if  (g200se->unique_rev_id >= 0x04) {
+		hiprilvl = 0;
+	} else if (g200se->unique_rev_id >= 0x02) {
+		unsigned int bpp;
+		unsigned long mb;
+
+		if (format->cpp[0] * 8 > 16)
+			bpp = 32;
+		else if (format->cpp[0] * 8 > 8)
+			bpp = 16;
+		else
+			bpp = 8;
+
+		mb = (mode->clock * bpp) / 1000;
+		if (mb > 3100)
+			hiprilvl = 0;
+		else if (mb > 2600)
+			hiprilvl = 1;
+		else if (mb > 1900)
+			hiprilvl = 2;
+		else if (mb > 1160)
+			hiprilvl = 3;
+		else if (mb > 440)
+			hiprilvl = 4;
+		else
+			hiprilvl = 5;
+
+	} else if (g200se->unique_rev_id >= 0x01) {
+		hiprilvl = 3;
+	} else {
+		hiprilvl = 4;
+	}
+
+	crtcext6 = hiprilvl; /* implicitly sets maxhipri to 0 */
+
+	WREG_ECRT(0x06, crtcext6);
+}
+
 /*
  * PIXPLLC
  */
@@ -265,8 +311,40 @@ static const struct drm_plane_funcs mgag200_g200se_primary_plane_funcs = {
 	MGAG200_PRIMARY_PLANE_FUNCS,
 };
 
+static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+						     struct drm_atomic_state *old_state)
+{
+	struct drm_device *dev = crtc->dev;
+	struct mga_device *mdev = to_mga_device(dev);
+	const struct mgag200_device_funcs *funcs = mdev->funcs;
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
+	const struct drm_format_info *format = mgag200_crtc_state->format;
+
+	if (funcs->disable_vidrst)
+		funcs->disable_vidrst(mdev);
+
+	mgag200_set_format_regs(mdev, format);
+	mgag200_set_mode_regs(mdev, adjusted_mode);
+
+	if (funcs->pixpllc_atomic_update)
+		funcs->pixpllc_atomic_update(crtc, old_state);
+
+	mgag200_g200se_set_hiprilvl(mdev, adjusted_mode, format);
+
+	mgag200_enable_display(mdev);
+
+	if (funcs->enable_vidrst)
+		funcs->enable_vidrst(mdev);
+}
+
 static const struct drm_crtc_helper_funcs mgag200_g200se_crtc_helper_funcs = {
-	MGAG200_CRTC_HELPER_FUNCS,
+	.mode_valid = mgag200_crtc_helper_mode_valid,
+	.atomic_check = mgag200_crtc_helper_atomic_check,
+	.atomic_flush = mgag200_crtc_helper_atomic_flush,
+	.atomic_enable = mgag200_g200se_crtc_helper_atomic_enable,
+	.atomic_disable = mgag200_crtc_helper_atomic_disable
 };
 
 static const struct drm_crtc_funcs mgag200_g200se_crtc_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 639c33ce6090..1df1f3433418 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -199,8 +199,7 @@ void mgag200_init_registers(struct mga_device *mdev)
 	WREG8(MGA_MISC_OUT, misc);
 }
 
-static void mgag200_set_mode_regs(struct mga_device *mdev,
-				  const struct drm_display_mode *mode)
+void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode)
 {
 	const struct mgag200_device_info *info = mdev->info;
 	unsigned int hdisplay, hsyncstart, hsyncend, htotal;
@@ -324,7 +323,7 @@ static void mgag200_set_offset(struct mga_device *mdev,
 	WREG_ECRT(0x00, crtcext0);
 }
 
-static void mgag200_set_format_regs(struct mga_device *mdev, const struct drm_format_info *format)
+void mgag200_set_format_regs(struct mga_device *mdev, const struct drm_format_info *format)
 {
 	struct drm_device *dev = &mdev->base;
 	unsigned int bpp, bppshift, scale;
@@ -387,74 +386,7 @@ static void mgag200_set_format_regs(struct mga_device *mdev, const struct drm_fo
 	WREG_ECRT(3, crtcext3);
 }
 
-static void mgag200_g200er_reset_tagfifo(struct mga_device *mdev)
-{
-	static uint32_t RESET_FLAG = 0x00200000; /* undocumented magic value */
-	u32 memctl;
-
-	memctl = RREG32(MGAREG_MEMCTL);
-
-	memctl |= RESET_FLAG;
-	WREG32(MGAREG_MEMCTL, memctl);
-
-	udelay(1000);
-
-	memctl &= ~RESET_FLAG;
-	WREG32(MGAREG_MEMCTL, memctl);
-}
-
-static void mgag200_g200se_set_hiprilvl(struct mga_device *mdev,
-					const struct drm_display_mode *mode,
-					const struct drm_format_info *format)
-{
-	struct mgag200_g200se_device *g200se = to_mgag200_g200se_device(&mdev->base);
-	unsigned int hiprilvl;
-	u8 crtcext6;
-
-	if  (g200se->unique_rev_id >= 0x04) {
-		hiprilvl = 0;
-	} else if (g200se->unique_rev_id >= 0x02) {
-		unsigned int bpp;
-		unsigned long mb;
-
-		if (format->cpp[0] * 8 > 16)
-			bpp = 32;
-		else if (format->cpp[0] * 8 > 8)
-			bpp = 16;
-		else
-			bpp = 8;
-
-		mb = (mode->clock * bpp) / 1000;
-		if (mb > 3100)
-			hiprilvl = 0;
-		else if (mb > 2600)
-			hiprilvl = 1;
-		else if (mb > 1900)
-			hiprilvl = 2;
-		else if (mb > 1160)
-			hiprilvl = 3;
-		else if (mb > 440)
-			hiprilvl = 4;
-		else
-			hiprilvl = 5;
-
-	} else if (g200se->unique_rev_id >= 0x01) {
-		hiprilvl = 3;
-	} else {
-		hiprilvl = 4;
-	}
-
-	crtcext6 = hiprilvl; /* implicitly sets maxhipri to 0 */
-
-	WREG_ECRT(0x06, crtcext6);
-}
-
-static void mgag200_g200ev_set_hiprilvl(struct mga_device *mdev)
-{
-	WREG_ECRT(0x06, 0x00);
-}
-
-static void mgag200_enable_display(struct mga_device *mdev)
+void mgag200_enable_display(struct mga_device *mdev)
 {
 	u8 seq0, crtcext1;
 
@@ -710,14 +642,6 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 	if (funcs->pixpllc_atomic_update)
 		funcs->pixpllc_atomic_update(crtc, old_state);
 
-	if (mdev->type == G200_ER)
-		mgag200_g200er_reset_tagfifo(mdev);
-
-	if (IS_G200_SE(mdev))
-		mgag200_g200se_set_hiprilvl(mdev, adjusted_mode, format);
-	else if (mdev->type == G200_EV)
-		mgag200_g200ev_set_hiprilvl(mdev);
-
 	mgag200_enable_display(mdev);
 
 	if (funcs->enable_vidrst)
-- 
2.36.1

