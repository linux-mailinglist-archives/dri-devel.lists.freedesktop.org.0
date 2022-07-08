Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43B356B5B0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE8610FC1F;
	Fri,  8 Jul 2022 09:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC22310FBE7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:39:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 412951FA40;
 Fri,  8 Jul 2022 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657273171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lhcwJEZ9pedFk8+J0A0E7kHGvRlD8S/9makY115kH3s=;
 b=J6XI77/8WpbLOUNLiBXBVP1YjlOePib6vVlLSPFCegLuF6XrQpEXgMKRkKoATma1BdciZP
 dlqc1IPu4emBfwjqAqAk0RnlvZaKbwKpNK2Bzl9dvpdwNeB7QMtbwUf+OxuF9H90vnWrfx
 lQ8spZTgHuvRMWWkWvK4u1U0tVFlVxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657273171;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lhcwJEZ9pedFk8+J0A0E7kHGvRlD8S/9makY115kH3s=;
 b=AYbNGtLqswZcMFWgfKrXcv6QkjUivmMrTY3hjTxMd4m+UeXOYXo0QTcqVjd+h/E86m4FPf
 KCF38m42cNEIeHBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 132AB13A7D;
 Fri,  8 Jul 2022 09:39:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yDCVA1P7x2J5TwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Jul 2022 09:39:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, jfalempe@redhat.com, daniel@ffwll.ch
Subject: [PATCH 02/14] drm/mgag200: Move DAC-register setup into
 model-specific code
Date: Fri,  8 Jul 2022 11:39:17 +0200
Message-Id: <20220708093929.4446-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708093929.4446-1-tzimmermann@suse.de>
References: <20220708093929.4446-1-tzimmermann@suse.de>
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

Provide an init function for each model's DAC registers. Remove
the shared helper.

The code for initializing the DAC registers consisted of a large
table of default value, plus many exceptions for the various G200
models. Providing a per-model implementation makes if more readable.
At some point, some of the initialization should probably move into
the modesetting code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  3 +
 drivers/gpu/drm/mgag200/mgag200_g200.c    | 37 +++++++++++
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  | 36 ++++++++++
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  2 +
 drivers/gpu/drm/mgag200/mgag200_g200er.c  | 34 ++++++++++
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  | 40 ++++++++++++
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  2 +
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 45 +++++++++++++
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  | 34 ++++++++++
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 80 +----------------------
 10 files changed, 234 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 301c4ab46539..6a2a1ad914c1 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -295,10 +295,12 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
 					      enum mga_type type);
 struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type);
+void mgag200_g200wb_init_registers(struct mga_device *mdev);
 struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type);
 struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type);
+void mgag200_g200eh_init_registers(struct mga_device *mdev);
 struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type);
 struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
@@ -310,6 +312,7 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev, const str
 
 				/* mgag200_mode.c */
 resource_size_t mgag200_device_probe_vram(struct mga_device *mdev);
+void mgag200_init_registers(struct mga_device *mdev);
 int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_fb_available);
 
 				/* mgag200_i2c.c */
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index 674385921b7f..c6303fcb8fe7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -30,6 +30,41 @@ static int mgag200_g200_init_pci_options(struct pci_dev *pdev)
 	return mgag200_init_pci_options(pdev, option, 0x00008000);
 }
 
+static void mgag200_g200_init_registers(struct mgag200_g200_device *g200)
+{
+	static const u8 dacvalue[] = {
+		/* 0x00: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x08: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x10: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x18: */     0x00,    0, 0xC9, 0xFF, 0xBF, 0x20, 0x1F, 0x20,
+		/* 0x20: */     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		/* 0x28: */     0x00, 0x00, 0x00, 0x00,
+		/* 0x2c: */	0x04, /* G200 specific: MGA1064_SYS_PLL_M */
+		/* 0x2d: */     0x2d, /* G200 specific: MGA1064_SYS_PLL_N */
+		/* 0x2e: */     0x19, /* G200 specific: MGA1064_SYS_PLL_P */
+		/* 0x2f: */     0x40,
+		/* 0x30: */     0x00, 0xB0, 0x00, 0xC2, 0x34, 0x14, 0x02, 0x83,
+		/* 0x38: */     0x00, 0x93, 0x00, 0x77, 0x00, 0x00, 0x00, 0x3A,
+		/* 0x40: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x48: */        0,    0,    0,    0,    0,    0,    0,    0
+	};
+
+	struct mga_device *mdev = &g200->base;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(dacvalue); ++i) {
+		if ((i <= 0x17) ||
+		    (i == 0x1b) ||
+		    (i == 0x1c) ||
+		    ((i >= 0x1f) && (i <= 0x29)) ||
+		    ((i >= 0x30) && (i <= 0x37)))
+			continue;
+		WREG_DAC(i, dacvalue[i]);
+	}
+
+	mgag200_init_registers(mdev);
+}
+
 /*
  * DRM Device
  */
@@ -191,6 +226,8 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
 	if (ret)
 		return ERR_PTR(ret);
 
+	mgag200_g200_init_registers(g200);
+
 	vram_available = mgag200_device_probe_vram(mdev);
 
 	ret = mgag200_modeset_init(mdev, vram_available);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index 1b9a22728744..365f486d3ce7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -6,6 +6,40 @@
 
 #include "mgag200_drv.h"
 
+void mgag200_g200eh_init_registers(struct mga_device *mdev)
+{
+	static const u8 dacvalue[] = {
+		/* 0x00: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x08: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x10: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x18: */     0x00,    0, 0xC9, 0xFF, 0xBF, 0x20,
+		/* 0x1e: */     MGA1064_MISC_CTL_VGA8 | /* G200EH specific: MGA1064_MISC_CTL */
+				MGA1064_MISC_CTL_DAC_RAM_CS,
+		/* 0x1f: */     0x20,
+		/* 0x20: */     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		/* 0x28: */     0x00, 0x00, 0x00, 0x00,    0,    0,    0, 0x40,
+		/* 0x30: */     0x00, 0xB0, 0x00, 0xC2, 0x34, 0x14, 0x02, 0x83,
+		/* 0x38: */     0x00, 0x93, 0x00, 0x77, 0x00, 0x00, 0x00, 0x3A,
+		/* 0x40: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x48: */        0,    0,    0,    0,    0,    0,    0,    0
+	};
+
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(dacvalue); i++) {
+		if ((i <= 0x17) ||
+		    (i == 0x1b) ||
+		    (i == 0x1c) ||
+		    ((i >= 0x1f) && (i <= 0x29)) ||
+		    ((i >= 0x30) && (i <= 0x37)) ||
+		    ((i >= 0x44) && (i <= 0x4e)))
+			continue;
+		WREG_DAC(i, dacvalue[i]);
+	}
+
+	mgag200_init_registers(mdev);
+}
+
 /*
  * DRM device
  */
@@ -40,6 +74,8 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
+	mgag200_g200eh_init_registers(mdev);
+
 	vram_available = mgag200_device_probe_vram(mdev);
 
 	ret = mgag200_modeset_init(mdev, vram_available);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index 438cda1b14c9..adb9190b62af 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -41,6 +41,8 @@ struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	mgag200_g200eh_init_registers(mdev); // same as G200EH
+
 	vram_available = mgag200_device_probe_vram(mdev);
 
 	ret = mgag200_modeset_init(mdev, vram_available);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 0790d4e6463d..acdccc419944 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -6,6 +6,38 @@
 
 #include "mgag200_drv.h"
 
+static void mgag200_g200er_init_registers(struct mga_device *mdev)
+{
+	static const u8 dacvalue[] = {
+		/* 0x00: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x08: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x10: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x18: */     0x00,    0, 0xC9, 0xFF, 0xBF, 0x20, 0x1F, 0x20,
+		/* 0x20: */     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		/* 0x28: */     0x00, 0x00, 0x00, 0x00,    0,    0,    0, 0x40,
+		/* 0x30: */     0x00, 0xB0, 0x00, 0xC2, 0x34, 0x14, 0x02, 0x83,
+		/* 0x38: */     0x00, 0x93, 0x00, 0x77, 0x00, 0x00, 0x00, 0x3A,
+		/* 0x40: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x48: */        0,    0,    0,    0,    0,    0,    0,    0
+	};
+
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(dacvalue); i++) {
+		if ((i <= 0x17) ||
+		    (i == 0x1b) ||
+		    (i == 0x1c) ||
+		    ((i >= 0x1f) && (i <= 0x29)) ||
+		    ((i >= 0x30) && (i <= 0x37)))
+			continue;
+		WREG_DAC(i, dacvalue[i]);
+	}
+
+	WREG_DAC(0x90, 0); /* G200ER specific */
+
+	mgag200_init_registers(mdev);
+}
+
 /*
  * DRM device
  */
@@ -36,6 +68,8 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
+	mgag200_g200er_init_registers(mdev);
+
 	vram_available = mgag200_device_probe_vram(mdev);
 
 	ret = mgag200_modeset_init(mdev, vram_available);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 5353422d0eef..ce26d48c9691 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -6,6 +6,44 @@
 
 #include "mgag200_drv.h"
 
+static void mgag200_g200ev_init_registers(struct mga_device *mdev)
+{
+	static const u8 dacvalue[] = {
+		/* 0x00: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x08: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x10: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x18: */     0x00,    0,
+				/* G200EV specific: MGA1064_PIX_CLK_CTL */
+		/* 0x1a: */     MGA1064_PIX_CLK_CTL_SEL_PLL,
+		/* 0x1b: */     0xFF, 0xBF, 0x20,
+				/* G200EV specific: MGA1064_MISC_CTL */
+		/* 0x1e: */     MGA1064_MISC_CTL_VGA8 |
+				MGA1064_MISC_CTL_DAC_RAM_CS,
+		/* 0x1f: */     0x20,
+		/* 0x20: */     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		/* 0x28: */     0x00, 0x00, 0x00, 0x00,    0,    0,    0, 0x40,
+		/* 0x30: */     0x00, 0xB0, 0x00, 0xC2, 0x34, 0x14, 0x02, 0x83,
+		/* 0x38: */     0x00, 0x93, 0x00, 0x77, 0x00, 0x00, 0x00, 0x3A,
+		/* 0x40: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x48: */        0,    0,    0,    0,    0,    0,    0,    0
+	};
+
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(dacvalue); i++) {
+		if ((i <= 0x17) ||
+		    (i == 0x1b) ||
+		    (i == 0x1c) ||
+		    ((i >= 0x1f) && (i <= 0x29)) ||
+		    ((i >= 0x30) && (i <= 0x37)) ||
+		    ((i >= 0x44) && (i <= 0x4e)))
+			continue;
+		WREG_DAC(i, dacvalue[i]);
+	}
+
+	mgag200_init_registers(mdev);
+}
+
 /*
  * DRM device
  */
@@ -40,6 +78,8 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
+	mgag200_g200ev_init_registers(mdev);
+
 	vram_available = mgag200_device_probe_vram(mdev);
 
 	ret = mgag200_modeset_init(mdev, vram_available);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 3bfc1324cf78..d86284c0eb4d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -50,6 +50,8 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	mgag200_g200wb_init_registers(mdev); // same as G200WB
+
 	vram_available = mgag200_g200ew3_device_probe_vram(mdev);
 
 	ret = mgag200_modeset_init(mdev, vram_available);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 0a3e66695e22..9f51be8ef731 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -28,6 +28,49 @@ static int mgag200_g200se_init_pci_options(struct pci_dev *pdev)
 	return mgag200_init_pci_options(pdev, option, 0x00008000);
 }
 
+static void mgag200_g200se_init_registers(struct mgag200_g200se_device *g200se)
+{
+	static const u8 dacvalue[] = {
+		/* 0x00: */        0,    0,    0,    0,    0,    0, 0x00,    0,
+		/* 0x08: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x10: */        0,    0,    0,    0,    0,    0,    0,    0,
+				/* G200SE specific: MGA1064_VREF_CTL */
+		/* 0x18: */     0x03,
+		/* 0x19: */        0,
+				/* G200EV specific: MGA1064_PIX_CLK_CTL */
+		/* 0x1a: */     MGA1064_PIX_CLK_CTL_SEL_PLL,
+		/* 0x1b: */     0xFF, 0xBF, 0x20,
+				/* G200EV specific: MGA1064_MISC_CTL */
+		/* 0x1e: */     MGA1064_MISC_CTL_DAC_EN |
+				MGA1064_MISC_CTL_VGA8 |
+				MGA1064_MISC_CTL_DAC_RAM_CS,
+
+		/* 0x19: */        0, 0xC9, 0xFF, 0xBF, 0x20, 0x1F, 0x20,
+		/* 0x20: */     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		/* 0x28: */     0x00, 0x00, 0x00, 0x00,    0,    0,    0, 0x40,
+		/* 0x30: */     0x00, 0xB0, 0x00, 0xC2, 0x34, 0x14, 0x02, 0x83,
+		/* 0x38: */     0x00, 0x93, 0x00, 0x77, 0x00, 0x00, 0x00, 0x3A,
+		/* 0x40: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x48: */        0,    0,    0,    0,    0,    0,    0,    0
+	};
+
+	struct mga_device *mdev = &g200se->base;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(dacvalue); i++) {
+		if ((i <= 0x17) ||
+		    (i == 0x1b) ||
+		    (i == 0x1c) ||
+		    ((i >= 0x1f) && (i <= 0x29)) ||
+		    ((i == 0x2c) || (i == 0x2d) || (i == 0x2e)) ||
+		    ((i >= 0x30) && (i <= 0x37)))
+			continue;
+		WREG_DAC(i, dacvalue[i]);
+	}
+
+	mgag200_init_registers(mdev);
+}
+
 /*
  * DRM device
  */
@@ -120,6 +163,8 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
+	mgag200_g200se_init_registers(g200se);
+
 	vram_available = mgag200_device_probe_vram(mdev);
 
 	ret = mgag200_modeset_init(mdev, vram_available);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index c8450ac8eaec..e4de4b2dc2e2 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -6,6 +6,38 @@
 
 #include "mgag200_drv.h"
 
+void mgag200_g200wb_init_registers(struct mga_device *mdev)
+{
+	static const u8 dacvalue[] = {
+		/* 0x00: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x08: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x10: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x18: */     0x07, /* G200WB specific: MGA1064_VREF_CTL */
+		/* 0x19: */        0, 0xC9, 0xFF, 0xBF, 0x20, 0x1F, 0x20,
+		/* 0x20: */     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		/* 0x28: */     0x00, 0x00, 0x00, 0x00,    0,    0,    0, 0x40,
+		/* 0x30: */     0x00, 0xB0, 0x00, 0xC2, 0x34, 0x14, 0x02, 0x83,
+		/* 0x38: */     0x00, 0x93, 0x00, 0x77, 0x00, 0x00, 0x00, 0x3A,
+		/* 0x40: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x48: */        0,    0,    0,    0,    0,    0,    0,    0
+	};
+
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(dacvalue); i++) {
+		if ((i <= 0x17) ||
+		    (i == 0x1b) ||
+		    (i == 0x1c) ||
+		    ((i >= 0x1f) && (i <= 0x29)) ||
+		    ((i >= 0x30) && (i <= 0x37)) ||
+		    ((i >= 0x44) && (i <= 0x4e)))
+			continue;
+		WREG_DAC(i, dacvalue[i]);
+	}
+
+	mgag200_init_registers(mdev);
+}
+
 /*
  * DRM device
  */
@@ -40,6 +72,8 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
+	mgag200_g200wb_init_registers(mdev);
+
 	vram_available = mgag200_device_probe_vram(mdev);
 
 	ret = mgag200_modeset_init(mdev, vram_available);
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index e08852482fe2..f9868d728e6d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -267,86 +267,10 @@ static void mgag200_set_startadd(struct mga_device *mdev,
 	WREG_ECRT(0x00, crtcext0);
 }
 
-static void mgag200_set_dac_regs(struct mga_device *mdev)
-{
-	size_t i;
-	u8 dacvalue[] = {
-		/* 0x00: */        0,    0,    0,    0,    0,    0, 0x00,    0,
-		/* 0x08: */        0,    0,    0,    0,    0,    0,    0,    0,
-		/* 0x10: */        0,    0,    0,    0,    0,    0,    0,    0,
-		/* 0x18: */     0x00,    0, 0xC9, 0xFF, 0xBF, 0x20, 0x1F, 0x20,
-		/* 0x20: */     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-		/* 0x28: */     0x00, 0x00, 0x00, 0x00,    0,    0,    0, 0x40,
-		/* 0x30: */     0x00, 0xB0, 0x00, 0xC2, 0x34, 0x14, 0x02, 0x83,
-		/* 0x38: */     0x00, 0x93, 0x00, 0x77, 0x00, 0x00, 0x00, 0x3A,
-		/* 0x40: */        0,    0,    0,    0,    0,    0,    0,    0,
-		/* 0x48: */        0,    0,    0,    0,    0,    0,    0,    0
-	};
-
-	switch (mdev->type) {
-	case G200_PCI:
-	case G200_AGP:
-		dacvalue[MGA1064_SYS_PLL_M] = 0x04;
-		dacvalue[MGA1064_SYS_PLL_N] = 0x2D;
-		dacvalue[MGA1064_SYS_PLL_P] = 0x19;
-		break;
-	case G200_SE_A:
-	case G200_SE_B:
-		dacvalue[MGA1064_VREF_CTL] = 0x03;
-		dacvalue[MGA1064_PIX_CLK_CTL] = MGA1064_PIX_CLK_CTL_SEL_PLL;
-		dacvalue[MGA1064_MISC_CTL] = MGA1064_MISC_CTL_DAC_EN |
-					     MGA1064_MISC_CTL_VGA8 |
-					     MGA1064_MISC_CTL_DAC_RAM_CS;
-		break;
-	case G200_WB:
-	case G200_EW3:
-		dacvalue[MGA1064_VREF_CTL] = 0x07;
-		break;
-	case G200_EV:
-		dacvalue[MGA1064_PIX_CLK_CTL] = MGA1064_PIX_CLK_CTL_SEL_PLL;
-		dacvalue[MGA1064_MISC_CTL] = MGA1064_MISC_CTL_VGA8 |
-					     MGA1064_MISC_CTL_DAC_RAM_CS;
-		break;
-	case G200_EH:
-	case G200_EH3:
-		dacvalue[MGA1064_MISC_CTL] = MGA1064_MISC_CTL_VGA8 |
-					     MGA1064_MISC_CTL_DAC_RAM_CS;
-		break;
-	case G200_ER:
-		break;
-	}
-
-	for (i = 0; i < ARRAY_SIZE(dacvalue); i++) {
-		if ((i <= 0x17) ||
-		    (i == 0x1b) ||
-		    (i == 0x1c) ||
-		    ((i >= 0x1f) && (i <= 0x29)) ||
-		    ((i >= 0x30) && (i <= 0x37)))
-			continue;
-		if (IS_G200_SE(mdev) &&
-		    ((i == 0x2c) || (i == 0x2d) || (i == 0x2e)))
-			continue;
-		if ((mdev->type == G200_EV ||
-		    mdev->type == G200_WB ||
-		    mdev->type == G200_EH ||
-		    mdev->type == G200_EW3 ||
-		    mdev->type == G200_EH3) &&
-		    (i >= 0x44) && (i <= 0x4e))
-			continue;
-
-		WREG_DAC(i, dacvalue[i]);
-	}
-
-	if (mdev->type == G200_ER)
-		WREG_DAC(0x90, 0);
-}
-
-static void mgag200_init_regs(struct mga_device *mdev)
+void mgag200_init_registers(struct mga_device *mdev)
 {
 	u8 crtc11, misc;
 
-	mgag200_set_dac_regs(mdev);
-
 	WREG_SEQ(2, 0x0f);
 	WREG_SEQ(3, 0x00);
 	WREG_SEQ(4, 0x0e);
@@ -1127,8 +1051,6 @@ int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_available
 	struct drm_device *dev = &mdev->base;
 	int ret;
 
-	mgag200_init_regs(mdev);
-
 	ret = mgag200_mode_config_init(mdev, vram_available);
 	if (ret)
 		return ret;
-- 
2.36.1

