Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F3A53A3F9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 13:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F5910E743;
	Wed,  1 Jun 2022 11:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001C310E79E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 11:25:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97B4D1F940;
 Wed,  1 Jun 2022 11:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654082724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXica4UTkCxYtl2mVm6x2GB1dqbz1kijqmO/+rlv6BM=;
 b=p/1L6PogtViY7Ptn1ePwKPSW3LJ7Ska323R5dJhIsEvBHPaI4VJfTdJVDgkogrI2AF3N/9
 kbIMkLptAsbCQGwFu18ZO1WB/j1iM1i11ORa8i8RTMoccs9lwO3ETEBa97YHCePQyN7skn
 OFElIhLtaQK6cOgy8oaxK/1DnMWoLW0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654082724;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXica4UTkCxYtl2mVm6x2GB1dqbz1kijqmO/+rlv6BM=;
 b=uwqakZD3rk3Paofw7er45Utnmd45bcjvx0rmNRL7Xpalo++34yod6O7vQ1i2Zx4ndOLgDx
 drFfqmiNHbU0QfAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 712E51330F;
 Wed,  1 Jun 2022 11:25:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OM7FGqRMl2JqMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Jun 2022 11:25:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 04/10] drm/mgag200: Call mgag200_device_probe_vram() from
 per-model init
Date: Wed,  1 Jun 2022 13:25:16 +0200
Message-Id: <20220601112522.5774-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601112522.5774-1-tzimmermann@suse.de>
References: <20220601112522.5774-1-tzimmermann@suse.de>
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

Call mgag200_device_probe_vram() from each model's initializer. The
G200EW3 uses a special helper with additional instructions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c     | 39 +++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  6 ++-
 drivers/gpu/drm/mgag200/mgag200_g200.c    |  5 ++-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  5 ++-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  5 ++-
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  5 ++-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  5 ++-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c | 14 ++++++-
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |  5 ++-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  5 ++-
 drivers/gpu/drm/mgag200/mgag200_mm.c      | 47 +----------------------
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 11 +++++-
 12 files changed, 94 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index ea765c1abcc1..1d53ddcc00df 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -50,6 +50,45 @@ int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
 	return 0;
 }
 
+resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size)
+{
+	int offset;
+	int orig;
+	int test1, test2;
+	int orig1, orig2;
+	size_t vram_size;
+
+	/* Probe */
+	orig = ioread16(mem);
+	iowrite16(0, mem);
+
+	vram_size = size;
+
+	for (offset = 0x100000; offset < vram_size; offset += 0x4000) {
+		orig1 = ioread8(mem + offset);
+		orig2 = ioread8(mem + offset + 0x100);
+
+		iowrite16(0xaa55, mem + offset);
+		iowrite16(0xaa55, mem + offset + 0x100);
+
+		test1 = ioread16(mem + offset);
+		test2 = ioread16(mem);
+
+		iowrite16(orig1, mem + offset);
+		iowrite16(orig2, mem + offset + 0x100);
+
+		if (test1 != 0xaa55)
+			break;
+
+		if (test2)
+			break;
+	}
+
+	iowrite16(orig, mem);
+
+	return offset - 65536;
+}
+
 /*
  * DRM driver
  */
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index d188382d60ca..21c7a689ed33 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -214,7 +214,7 @@ struct mga_device {
 	struct mga_mc			mc;
 
 	void __iomem			*vram;
-	size_t				vram_fb_available;
+	resource_size_t			vram_available;
 
 	enum mga_type			type;
 
@@ -257,6 +257,7 @@ static inline struct mgag200_g200se_device *to_mgag200_g200se_device(struct drm_
 
 				/* mgag200_drv.c */
 int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2);
+resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size);
 int mgag200_regs_init(struct mga_device *mdev);
 
 				/* mgag200_<device type>.c */
@@ -278,7 +279,8 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev, const str
 						 enum mga_type type, unsigned long flags);
 
 				/* mgag200_mode.c */
-int mgag200_modeset_init(struct mga_device *mdev);
+resource_size_t mgag200_device_probe_vram(struct mga_device *mdev);
+int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_fb_available);
 
 				/* mgag200_i2c.c */
 int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index b9ec6367719c..4e30b54a2677 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -162,6 +162,7 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
 	struct mgag200_g200_device *g200;
 	struct mga_device *mdev;
 	struct drm_device *dev;
+	resource_size_t vram_available;
 	int ret;
 
 	g200 = devm_drm_dev_alloc(&pdev->dev, drv, struct mgag200_g200_device, base.base);
@@ -189,7 +190,9 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_modeset_init(mdev);
+	vram_available = mgag200_device_probe_vram(mdev);
+
+	ret = mgag200_modeset_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index 3a531148c523..a16493db0512 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -15,6 +15,7 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
+	resource_size_t vram_available;
 	int ret;
 
 	mdev = devm_drm_dev_alloc(&pdev->dev, drv, struct mga_device, base);
@@ -39,7 +40,9 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_modeset_init(mdev);
+	vram_available = mgag200_device_probe_vram(mdev);
+
+	ret = mgag200_modeset_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index fbb53e624d90..478ca578b839 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -16,6 +16,7 @@ struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
+	resource_size_t vram_available;
 	int ret;
 
 	mdev = devm_drm_dev_alloc(&pdev->dev, drv, struct mga_device, base);
@@ -40,7 +41,9 @@ struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_modeset_init(mdev);
+	vram_available = mgag200_device_probe_vram(mdev);
+
+	ret = mgag200_modeset_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 1c5e757ec016..2f38fb470f4e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -15,6 +15,7 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
+	resource_size_t vram_available;
 	int ret;
 
 	mdev = devm_drm_dev_alloc(&pdev->dev, drv, struct mga_device, base);
@@ -35,7 +36,9 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_modeset_init(mdev);
+	vram_available = mgag200_device_probe_vram(mdev);
+
+	ret = mgag200_modeset_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index e55dd01ed42e..ff3c7b17ac44 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -15,6 +15,7 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
+	resource_size_t vram_available;
 	int ret;
 
 	mdev = devm_drm_dev_alloc(&pdev->dev, drv, struct mga_device, base);
@@ -39,7 +40,9 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_modeset_init(mdev);
+	vram_available = mgag200_device_probe_vram(mdev);
+
+	ret = mgag200_modeset_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 6dd62135f0b2..971d40874cf3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -10,12 +10,22 @@
  * DRM device
  */
 
+static resource_size_t mgag200_g200ew3_device_probe_vram(struct mga_device *mdev)
+{
+	resource_size_t vram_size = mdev->mc.vram_size;
+
+	if (vram_size >= 0x1000000)
+		vram_size = vram_size - 0x400000;
+	return mgag200_probe_vram(mdev->vram, vram_size);
+}
+
 struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
 						 const struct drm_driver *drv,
 						 enum mga_type type, unsigned long flags)
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
+	resource_size_t vram_available;
 	int ret;
 
 	mdev = devm_drm_dev_alloc(&pdev->dev, drv, struct mga_device, base);
@@ -40,7 +50,9 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_modeset_init(mdev);
+	vram_available = mgag200_g200ew3_device_probe_vram(mdev);
+
+	ret = mgag200_modeset_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 75d284abb2a2..cd2987b58fcb 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -49,6 +49,7 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
 	struct mgag200_g200se_device *g200se;
 	struct mga_device *mdev;
 	struct drm_device *dev;
+	resource_size_t vram_available;
 	int ret;
 
 	g200se = devm_drm_dev_alloc(&pdev->dev, drv, struct mgag200_g200se_device, base.base);
@@ -76,7 +77,9 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_modeset_init(mdev);
+	vram_available = mgag200_device_probe_vram(mdev);
+
+	ret = mgag200_modeset_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index c622d5418731..38e374c00419 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -15,6 +15,7 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
+	resource_size_t vram_available;
 	int ret;
 
 	mdev = devm_drm_dev_alloc(&pdev->dev, drv, struct mga_device, base);
@@ -39,7 +40,9 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_modeset_init(mdev);
+	vram_available = mgag200_device_probe_vram(mdev);
+
+	ret = mgag200_modeset_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mm.c b/drivers/gpu/drm/mgag200/mgag200_mm.c
index fa996d46feed..fc19c2369641 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mm.c
@@ -32,49 +32,6 @@
 
 #include "mgag200_drv.h"
 
-static size_t mgag200_probe_vram(struct mga_device *mdev, void __iomem *mem,
-				 size_t size)
-{
-	int offset;
-	int orig;
-	int test1, test2;
-	int orig1, orig2;
-	size_t vram_size;
-
-	/* Probe */
-	orig = ioread16(mem);
-	iowrite16(0, mem);
-
-	vram_size = size;
-
-	if ((mdev->type == G200_EW3) && (vram_size >= 0x1000000))
-		vram_size = vram_size - 0x400000;
-
-	for (offset = 0x100000; offset < vram_size; offset += 0x4000) {
-		orig1 = ioread8(mem + offset);
-		orig2 = ioread8(mem + offset + 0x100);
-
-		iowrite16(0xaa55, mem + offset);
-		iowrite16(0xaa55, mem + offset + 0x100);
-
-		test1 = ioread16(mem + offset);
-		test2 = ioread16(mem);
-
-		iowrite16(orig1, mem + offset);
-		iowrite16(orig2, mem + offset + 0x100);
-
-		if (test1 != 0xaa55)
-			break;
-
-		if (test2)
-			break;
-	}
-
-	iowrite16(orig, mem);
-
-	return offset - 65536;
-}
-
 int mgag200_mm_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
@@ -106,11 +63,9 @@ int mgag200_mm_init(struct mga_device *mdev)
 	if (!mdev->vram)
 		return -ENOMEM;
 
-	mdev->mc.vram_size = mgag200_probe_vram(mdev, mdev->vram, len);
+	mdev->mc.vram_size = len;
 	mdev->mc.vram_base = start;
 	mdev->mc.vram_window = len;
 
-	mdev->vram_fb_available = mdev->mc.vram_size;
-
 	return 0;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 2b034255a4af..c254988e5bcb 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -32,6 +32,11 @@
  * This file contains setup code for the CRTC.
  */
 
+resource_size_t mgag200_device_probe_vram(struct mga_device *mdev)
+{
+	return mgag200_probe_vram(mdev->vram, mdev->mc.vram_size);
+}
+
 static void mgag200_crtc_set_gamma_linear(struct mga_device *mdev,
 					  const struct drm_format_info *format)
 {
@@ -1030,7 +1035,7 @@ static enum drm_mode_status mgag200_mode_config_mode_valid(struct drm_device *de
 	unsigned long fbsize, fbpages, max_fbpages;
 	struct mgag200_g200se_device *g200se;
 
-	max_fbpages = mdev->vram_fb_available >> PAGE_SHIFT;
+	max_fbpages = mdev->vram_available >> PAGE_SHIFT;
 
 	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
 	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
@@ -1075,7 +1080,7 @@ static const struct drm_mode_config_funcs mgag200_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-int mgag200_modeset_init(struct mga_device *mdev)
+int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_available)
 {
 	struct drm_device *dev = &mdev->base;
 	struct mga_i2c_chan *i2c = &mdev->i2c;
@@ -1086,6 +1091,8 @@ int mgag200_modeset_init(struct mga_device *mdev)
 
 	mgag200_init_regs(mdev);
 
+	mdev->vram_available = vram_available;
+
 	ret = drmm_mode_config_init(dev);
 	if (ret) {
 		drm_err(dev, "drmm_mode_config_init() failed, error %d\n",
-- 
2.36.1

