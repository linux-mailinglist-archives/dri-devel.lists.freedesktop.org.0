Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA9583F1A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 14:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFA697334;
	Thu, 28 Jul 2022 12:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF2497334
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 12:41:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E89632055D;
 Thu, 28 Jul 2022 12:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659012067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdDBIXPwFaWFidYjdP+FxO22AXJADvX+75oYcYSOU6Y=;
 b=ATIZeBmEwj6f/VsuzG/gFqVuroZzbWczElkEydItxzZerq+KaBHBJmCF7vbpnQltl9kgxb
 xoWGjZvmJ/RwSTJu8Z9d5PCxEdQ6b6UxuKQB/uHDISsvLWzG8t1RnTMw5fuBrM4eGk/rRp
 k7VvF05BrnULBH3l+1aZtQ7NHYrlD6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659012067;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdDBIXPwFaWFidYjdP+FxO22AXJADvX+75oYcYSOU6Y=;
 b=IOmFKqGZvA4rtsHdHih6tpWR4/V/JSIDbllD22i7UshRQy6wkBDIAyBgrFYJUC4VYibebm
 p7KSL599mwKW4ACQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFC3A13A7E;
 Thu, 28 Jul 2022 12:41:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GIzmKeOD4mJwMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Jul 2022 12:41:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, sam@ravnborg.org, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3 14/14] drm/mgag200: Remove type field from struct mga_device
Date: Thu, 28 Jul 2022 14:41:03 +0200
Message-Id: <20220728124103.30159-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728124103.30159-1-tzimmermann@suse.de>
References: <20220728124103.30159-1-tzimmermann@suse.de>
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

Each model's specific code is located in a separate file. The type
field in struct mga_device is no unused. Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c     | 17 +++++++------
 drivers/gpu/drm/mgag200/mgag200_drv.h     | 29 ++++++++++-------------
 drivers/gpu/drm/mgag200/mgag200_g200.c    |  5 ++--
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  5 ++--
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  5 ++--
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  5 ++--
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  5 ++--
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  5 ++--
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  5 ++--
 10 files changed, 35 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 9296b9f5455b..4d38b8e18030 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -155,7 +155,7 @@ int mgag200_device_preinit(struct mga_device *mdev)
 	return 0;
 }
 
-int mgag200_device_init(struct mga_device *mdev, enum mga_type type,
+int mgag200_device_init(struct mga_device *mdev,
 			const struct mgag200_device_info *info,
 			const struct mgag200_device_funcs *funcs)
 {
@@ -165,7 +165,6 @@ int mgag200_device_init(struct mga_device *mdev, enum mga_type type,
 
 	mdev->info = info;
 	mdev->funcs = funcs;
-	mdev->type = type;
 
 	ret = drmm_mutex_init(dev, &mdev->rmmio_lock);
 	if (ret)
@@ -228,29 +227,29 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	switch (type) {
 	case G200_PCI:
 	case G200_AGP:
-		mdev = mgag200_g200_device_create(pdev, &mgag200_driver, type);
+		mdev = mgag200_g200_device_create(pdev, &mgag200_driver);
 		break;
 	case G200_SE_A:
 	case G200_SE_B:
 		mdev = mgag200_g200se_device_create(pdev, &mgag200_driver, type);
 		break;
 	case G200_WB:
-		mdev = mgag200_g200wb_device_create(pdev, &mgag200_driver, type);
+		mdev = mgag200_g200wb_device_create(pdev, &mgag200_driver);
 		break;
 	case G200_EV:
-		mdev = mgag200_g200ev_device_create(pdev, &mgag200_driver, type);
+		mdev = mgag200_g200ev_device_create(pdev, &mgag200_driver);
 		break;
 	case G200_EH:
-		mdev = mgag200_g200eh_device_create(pdev, &mgag200_driver, type);
+		mdev = mgag200_g200eh_device_create(pdev, &mgag200_driver);
 		break;
 	case G200_EH3:
-		mdev = mgag200_g200eh3_device_create(pdev, &mgag200_driver, type);
+		mdev = mgag200_g200eh3_device_create(pdev, &mgag200_driver);
 		break;
 	case G200_ER:
-		mdev = mgag200_g200er_device_create(pdev, &mgag200_driver, type);
+		mdev = mgag200_g200er_device_create(pdev, &mgag200_driver);
 		break;
 	case G200_EW3:
-		mdev = mgag200_g200ew3_device_create(pdev, &mgag200_driver, type);
+		mdev = mgag200_g200ew3_device_create(pdev, &mgag200_driver);
 		break;
 	default:
 		dev_err(&pdev->dev, "Device type %d is unsupported\n", type);
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 26038fa3cf09..f0c2349404b4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -292,8 +292,6 @@ struct mga_device {
 	void __iomem			*vram;
 	resource_size_t			vram_available;
 
-	enum mga_type			type;
-
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
@@ -337,31 +335,28 @@ int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2);
 resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size);
 resource_size_t mgag200_device_probe_vram(struct mga_device *mdev);
 int mgag200_device_preinit(struct mga_device *mdev);
-int mgag200_device_init(struct mga_device *mdev, enum mga_type type,
+int mgag200_device_init(struct mga_device *mdev,
 			const struct mgag200_device_info *info,
 			const struct mgag200_device_funcs *funcs);
 
 				/* mgag200_<device type>.c */
-struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-					      enum mga_type type);
+struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct drm_driver *drv);
 struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type);
 void mgag200_g200wb_init_registers(struct mga_device *mdev);
 void mgag200_g200wb_pixpllc_atomic_update(struct drm_crtc *crtc, struct drm_atomic_state *old_state);
-struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type);
-struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type);
+struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const struct drm_driver *drv);
+struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const struct drm_driver *drv);
 void mgag200_g200eh_init_registers(struct mga_device *mdev);
 void mgag200_g200eh_pixpllc_atomic_update(struct drm_crtc *crtc, struct drm_atomic_state *old_state);
-struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type);
-struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						 enum mga_type type);
-struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type);
-struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						 enum mga_type type);
+struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev,
+						const struct drm_driver *drv);
+struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
+						 const struct drm_driver *drv);
+struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev,
+						const struct drm_driver *drv);
+struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
+						 const struct drm_driver *drv);
 
 /*
  * mgag200_mode.c
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index dffcfa83ae74..bf5d7fe525a3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -398,8 +398,7 @@ static const struct mgag200_device_funcs mgag200_g200_device_funcs = {
 	.pixpllc_atomic_update = mgag200_g200_pixpllc_atomic_update,
 };
 
-struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-					      enum mga_type type)
+struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct drm_driver *drv)
 {
 	struct mgag200_g200_device *g200;
 	struct mga_device *mdev;
@@ -425,7 +424,7 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
 
 	mgag200_g200_init_refclk(g200);
 
-	ret = mgag200_device_init(mdev, type, &mgag200_g200_device_info,
+	ret = mgag200_device_init(mdev, &mgag200_g200_device_info,
 				  &mgag200_g200_device_funcs);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index 54568d1f603a..fad62453a91d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -274,8 +274,7 @@ static const struct mgag200_device_funcs mgag200_g200eh_device_funcs = {
 	.pixpllc_atomic_update = mgag200_g200eh_pixpllc_atomic_update,
 };
 
-struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type)
+struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const struct drm_driver *drv)
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
@@ -297,7 +296,7 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, &mgag200_g200eh_device_info,
+	ret = mgag200_device_init(mdev, &mgag200_g200eh_device_info,
 				  &mgag200_g200eh_device_funcs);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index 3e2929fd6145..0f7d8112cd49 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -179,8 +179,7 @@ static const struct mgag200_device_funcs mgag200_g200eh3_device_funcs = {
 };
 
 struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
-						 const struct drm_driver *drv,
-						 enum mga_type type)
+						 const struct drm_driver *drv)
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
@@ -202,7 +201,7 @@ struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, &mgag200_g200eh3_device_info,
+	ret = mgag200_device_init(mdev, &mgag200_g200eh3_device_info,
 				  &mgag200_g200eh3_device_funcs);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index ae9bb38c1ac0..bce267e0f7de 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -312,8 +312,7 @@ static const struct mgag200_device_funcs mgag200_g200er_device_funcs = {
 	.pixpllc_atomic_update = mgag200_g200er_pixpllc_atomic_update,
 };
 
-struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type)
+struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const struct drm_driver *drv)
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
@@ -331,7 +330,7 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, &mgag200_g200er_device_info,
+	ret = mgag200_device_init(mdev, &mgag200_g200er_device_info,
 				  &mgag200_g200er_device_funcs);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index ec324d942b47..ac957f42abe1 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -313,8 +313,7 @@ static const struct mgag200_device_funcs mgag200_g200ev_device_funcs = {
 	.pixpllc_atomic_update = mgag200_g200ev_pixpllc_atomic_update,
 };
 
-struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type)
+struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const struct drm_driver *drv)
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
@@ -336,7 +335,7 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, &mgag200_g200ev_device_info,
+	ret = mgag200_device_init(mdev, &mgag200_g200ev_device_info,
 				  &mgag200_g200ev_device_funcs);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 25b7bce31e0b..170934414d7d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -199,8 +199,7 @@ static resource_size_t mgag200_g200ew3_device_probe_vram(struct mga_device *mdev
 }
 
 struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
-						 const struct drm_driver *drv,
-						 enum mga_type type)
+						 const struct drm_driver *drv)
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
@@ -222,7 +221,7 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, &mgag200_g200ew3_device_info,
+	ret = mgag200_device_init(mdev, &mgag200_g200ew3_device_info,
 				  &mgag200_g200ew3_device_funcs);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 0addc3750413..be389ed91cbd 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -535,7 +535,7 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
 	else
 		funcs = &mgag200_g200se_00_device_funcs;
 
-	ret = mgag200_device_init(mdev, type, info, funcs);
+	ret = mgag200_device_init(mdev, info, funcs);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index 01d21b6a4ce9..9baa727ac6f9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -323,8 +323,7 @@ static const struct mgag200_device_funcs mgag200_g200wb_device_funcs = {
 	.pixpllc_atomic_update = mgag200_g200wb_pixpllc_atomic_update,
 };
 
-struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type)
+struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const struct drm_driver *drv)
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
@@ -346,7 +345,7 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, &mgag200_g200wb_device_info,
+	ret = mgag200_device_init(mdev, &mgag200_g200wb_device_info,
 				  &mgag200_g200wb_device_funcs);
 	if (ret)
 		return ERR_PTR(ret);
-- 
2.37.1

