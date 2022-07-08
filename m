Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9EB56B5BC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC1510FBA4;
	Fri,  8 Jul 2022 09:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1DF10FBAA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:39:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74AB41FEFE;
 Fri,  8 Jul 2022 09:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657273172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRpd1UjBpCsAD/+smBPJYttRvYTQFmvCTzC2wu6RFnE=;
 b=gQCnOIp7lW4LrQJjJrFkuCg96/z+elfAxYn8fM9a52JS6YqIvexiotBIRQWs6baj3VVccW
 aGFU3fZuhJxt02hxg5Hs+sFQezpqKCbdiSbTTk2BpGR+4NoAWgpD3sor8FQRDHi0DXYaa5
 FmwRnQuFqDoeY9ASCSd5A5dWibjNM8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657273172;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRpd1UjBpCsAD/+smBPJYttRvYTQFmvCTzC2wu6RFnE=;
 b=4RmDKnWD6oQaXZD/4zYt/mGvuFKmLkIRTDnQuRr/dmp62u9M2zwJ2KlxS7neXx1JJ7C+1b
 +3trSmfv1Ux9eXCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4BEAE13B24;
 Fri,  8 Jul 2022 09:39:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YEivEVT7x2J5TwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Jul 2022 09:39:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, jfalempe@redhat.com, daniel@ffwll.ch
Subject: [PATCH 09/14] drm/mgag200: Add per-device callbacks
Date: Fri,  8 Jul 2022 11:39:24 +0200
Message-Id: <20220708093929.4446-10-tzimmermann@suse.de>
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

While currently empty, the device callbacks will allow mgag200's
modesetting code to interact with the BMC and PIXPLLC.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c     | 4 +++-
 drivers/gpu/drm/mgag200/mgag200_drv.h     | 7 ++++++-
 drivers/gpu/drm/mgag200/mgag200_g200.c    | 6 +++++-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  | 6 +++++-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c | 6 +++++-
 drivers/gpu/drm/mgag200/mgag200_g200er.c  | 6 +++++-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  | 6 +++++-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c | 6 +++++-
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 5 ++++-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  | 6 +++++-
 10 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 73e8e4e9e54b..c20a59a2cd91 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -162,13 +162,15 @@ int mgag200_device_preinit(struct mga_device *mdev)
 }
 
 int mgag200_device_init(struct mga_device *mdev, enum mga_type type,
-			const struct mgag200_device_info *info)
+			const struct mgag200_device_info *info,
+			const struct mgag200_device_funcs *funcs)
 {
 	struct drm_device *dev = &mdev->base;
 	u8 crtcext3, misc;
 	int ret;
 
 	mdev->info = info;
+	mdev->funcs = funcs;
 	mdev->type = type;
 
 	ret = drmm_mutex_init(dev, &mdev->rmmio_lock);
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 84579c2e1f3c..68c0b72f7430 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -235,10 +235,14 @@ struct mgag200_device_info {
 		.bug_no_startadd = (_bug_no_startadd), \
 	}
 
+struct mgag200_device_funcs {
+};
+
 struct mga_device {
 	struct drm_device base;
 
 	const struct mgag200_device_info *info;
+	const struct mgag200_device_funcs *funcs;
 
 	struct resource			*rmmio_res;
 	void __iomem			*rmmio;
@@ -295,7 +299,8 @@ resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size);
 resource_size_t mgag200_device_probe_vram(struct mga_device *mdev);
 int mgag200_device_preinit(struct mga_device *mdev);
 int mgag200_device_init(struct mga_device *mdev, enum mga_type type,
-			const struct mgag200_device_info *info);
+			const struct mgag200_device_info *info,
+			const struct mgag200_device_funcs *funcs);
 
 				/* mgag200_<device type>.c */
 struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index c6303fcb8fe7..5de77ef637f7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -195,6 +195,9 @@ static void mgag200_g200_init_refclk(struct mgag200_g200_device *g200)
 	pci_unmap_rom(pdev, rom);
 }
 
+static const struct mgag200_device_funcs mgag200_g200_device_funcs = {
+};
+
 struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 					      enum mga_type type)
 {
@@ -222,7 +225,8 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
 
 	mgag200_g200_init_refclk(g200);
 
-	ret = mgag200_device_init(mdev, type, &mgag200_g200_device_info);
+	ret = mgag200_device_init(mdev, type, &mgag200_g200_device_info,
+				  &mgag200_g200_device_funcs);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index 365f486d3ce7..6acfc9eeeda9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -47,6 +47,9 @@ void mgag200_g200eh_init_registers(struct mga_device *mdev)
 static const struct mgag200_device_info mgag200_g200eh_device_info =
 	MGAG200_DEVICE_INFO_INIT(2048, 2048, 37500, false, 1, 0, false);
 
+static const struct mgag200_device_funcs mgag200_g200eh_device_funcs = {
+};
+
 struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
 {
@@ -70,7 +73,8 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, &mgag200_g200eh_device_info);
+	ret = mgag200_device_init(mdev, type, &mgag200_g200eh_device_info,
+				  &mgag200_g200eh_device_funcs);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index adb9190b62af..99e00aa848e1 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -13,6 +13,9 @@
 static const struct mgag200_device_info mgag200_g200eh3_device_info =
 	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false, 1, 0, false);
 
+static const struct mgag200_device_funcs mgag200_g200eh3_device_funcs = {
+};
+
 struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 						 const struct drm_driver *drv,
 						 enum mga_type type)
@@ -37,7 +40,8 @@ struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, &mgag200_g200eh3_device_info);
+	ret = mgag200_device_init(mdev, type, &mgag200_g200eh3_device_info,
+				  &mgag200_g200eh3_device_funcs);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 4489b382ebd0..76eb4776658a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -47,6 +47,9 @@ static void mgag200_g200er_init_registers(struct mga_device *mdev)
 static const struct mgag200_device_info mgag200_g200er_device_info =
 	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false, 1, 0, false);
 
+static const struct mgag200_device_funcs mgag200_g200er_device_funcs = {
+};
+
 struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
 {
@@ -66,7 +69,8 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, &mgag200_g200er_device_info);
+	ret = mgag200_device_init(mdev, type, &mgag200_g200er_device_info,
+				  &mgag200_g200er_device_funcs);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index ce26d48c9691..e9ea09195471 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -51,6 +51,9 @@ static void mgag200_g200ev_init_registers(struct mga_device *mdev)
 static const struct mgag200_device_info mgag200_g200ev_device_info =
 	MGAG200_DEVICE_INFO_INIT(2048, 2048, 32700, false, 0, 1, false);
 
+static const struct mgag200_device_funcs mgag200_g200ev_device_funcs = {
+};
+
 struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
 {
@@ -74,7 +77,8 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, &mgag200_g200ev_device_info);
+	ret = mgag200_device_init(mdev, type, &mgag200_g200ev_device_info,
+				  &mgag200_g200ev_device_funcs);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index a4ecdd3784a3..202db00bb62e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -20,6 +20,9 @@ static void mgag200_g200ew3_init_registers(struct mga_device *mdev)
 static const struct mgag200_device_info mgag200_g200ew3_device_info =
 	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, true, 0, 1, false);
 
+static const struct mgag200_device_funcs mgag200_g200ew3_device_funcs = {
+};
+
 static resource_size_t mgag200_g200ew3_device_probe_vram(struct mga_device *mdev)
 {
 	resource_size_t vram_size = resource_size(mdev->vram_res);
@@ -53,7 +56,8 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, &mgag200_g200ew3_device_info);
+	ret = mgag200_device_init(mdev, type, &mgag200_g200ew3_device_info,
+				  &mgag200_g200ew3_device_funcs);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 9f51be8ef731..5bdc20db3810 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -108,6 +108,9 @@ static int mgag200_g200se_init_unique_rev_id(struct mgag200_g200se_device *g200s
 	return 0;
 }
 
+static const struct mgag200_device_funcs mgag200_g200se_device_funcs = {
+};
+
 struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
 {
@@ -159,7 +162,7 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = mgag200_device_init(mdev, type, info);
+	ret = mgag200_device_init(mdev, type, info, &mgag200_g200se_device_funcs);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index e4de4b2dc2e2..3ca016b33e9a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -45,6 +45,9 @@ void mgag200_g200wb_init_registers(struct mga_device *mdev)
 static const struct mgag200_device_info mgag200_g200wb_device_info =
 	MGAG200_DEVICE_INFO_INIT(1280, 1024, 31877, true, 0, 1, false);
 
+static const struct mgag200_device_funcs mgag200_g200wb_device_funcs = {
+};
+
 struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
 {
@@ -68,7 +71,8 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, &mgag200_g200wb_device_info);
+	ret = mgag200_device_init(mdev, type, &mgag200_g200wb_device_info,
+				  &mgag200_g200wb_device_funcs);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.36.1

