Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF8653A403
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 13:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C8310E8C4;
	Wed,  1 Jun 2022 11:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7361F10E7A7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 11:25:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 14C051F942;
 Wed,  1 Jun 2022 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654082725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b9YnJ2jqrZPzjPqtiKNCPzcv+BIwe6n3aEAru588pWU=;
 b=GCg8KwfNQ1jdg/8v0zW0mX+zMTN+UwAohnDHRH3e942Gvm8N9yxImV1KzKaidfJXeqBWBc
 xU6b9uqWE/P8IeGO+gUKkVM+4UUUaaZimMv1dMtymVvIhzzK9vjAKbMhOnTTAjEGoJvebW
 fTryeghKlRvf2HLc2YXZ/cuTfBP751E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654082725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b9YnJ2jqrZPzjPqtiKNCPzcv+BIwe6n3aEAru588pWU=;
 b=xo1XDiW9hvt5ADJIs69nI7heUazHlEyzcuh4niiCuMNiaYv98aTmB3LG0IAZXRZCoHWqV0
 /9M8OK/ccoaNHLBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2A7213B2D;
 Wed,  1 Jun 2022 11:25:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WE1+NqRMl2JqMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Jun 2022 11:25:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 07/10] drm/mgag200: Store HW_BUG_NO_STARTADD flag in device
 info
Date: Wed,  1 Jun 2022 13:25:19 +0200
Message-Id: <20220601112522.5774-8-tzimmermann@suse.de>
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

Flag devices with broken handling of the startadd field in
struct mgag200_device_info, instead of PCI driver data. This
reduces the driver data to a simple type constant.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c     | 36 +++++++----------------
 drivers/gpu/drm/mgag200/mgag200_drv.h     | 35 +++++++++++-----------
 drivers/gpu/drm/mgag200/mgag200_g200.c    |  6 ++--
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  6 ++--
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  6 ++--
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  6 ++--
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  6 ++--
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  6 ++--
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 23 ++++++++++++---
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  6 ++--
 drivers/gpu/drm/mgag200/mgag200_mode.c    |  2 +-
 11 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 90ed7770ff72..361eb7dffda1 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -162,14 +162,13 @@ int mgag200_device_preinit(struct mga_device *mdev)
 	return 0;
 }
 
-int mgag200_device_init(struct mga_device *mdev, enum mga_type type, unsigned long flags,
+int mgag200_device_init(struct mga_device *mdev, enum mga_type type,
 			const struct mgag200_device_info *info)
 {
 	struct drm_device *dev = &mdev->base;
 	u8 crtcext3, misc;
 	int ret;
 
-	mdev->flags = flags;
 	mdev->info = info;
 	mdev->type = type;
 
@@ -202,8 +201,7 @@ int mgag200_device_init(struct mga_device *mdev, enum mga_type type, unsigned lo
 static const struct pci_device_id mgag200_pciidlist[] = {
 	{ PCI_VENDOR_ID_MATROX, 0x520, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_PCI },
 	{ PCI_VENDOR_ID_MATROX, 0x521, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_AGP },
-	{ PCI_VENDOR_ID_MATROX, 0x522, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-		G200_SE_A | MGAG200_FLAG_HW_BUG_NO_STARTADD},
+	{ PCI_VENDOR_ID_MATROX, 0x522, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_SE_A },
 	{ PCI_VENDOR_ID_MATROX, 0x524, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_SE_B },
 	{ PCI_VENDOR_ID_MATROX, 0x530, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_EV },
 	{ PCI_VENDOR_ID_MATROX, 0x532, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_WB },
@@ -216,22 +214,10 @@ static const struct pci_device_id mgag200_pciidlist[] = {
 
 MODULE_DEVICE_TABLE(pci, mgag200_pciidlist);
 
-static enum mga_type mgag200_type_from_driver_data(kernel_ulong_t driver_data)
-{
-	return (enum mga_type)(driver_data & MGAG200_TYPE_MASK);
-}
-
-static unsigned long mgag200_flags_from_driver_data(kernel_ulong_t driver_data)
-{
-	return driver_data & MGAG200_FLAG_MASK;
-}
-
 static int
 mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
-	kernel_ulong_t driver_data = ent->driver_data;
-	enum mga_type type = mgag200_type_from_driver_data(driver_data);
-	unsigned long flags = mgag200_flags_from_driver_data(driver_data);
+	enum mga_type type = (enum mga_type)ent->driver_data;
 	struct mga_device *mdev;
 	struct drm_device *dev;
 	int ret;
@@ -247,29 +233,29 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	switch (type) {
 	case G200_PCI:
 	case G200_AGP:
-		mdev = mgag200_g200_device_create(pdev, &mgag200_driver, type, flags);
+		mdev = mgag200_g200_device_create(pdev, &mgag200_driver, type);
 		break;
 	case G200_SE_A:
 	case G200_SE_B:
-		mdev = mgag200_g200se_device_create(pdev, &mgag200_driver, type, flags);
+		mdev = mgag200_g200se_device_create(pdev, &mgag200_driver, type);
 		break;
 	case G200_WB:
-		mdev = mgag200_g200wb_device_create(pdev, &mgag200_driver, type, flags);
+		mdev = mgag200_g200wb_device_create(pdev, &mgag200_driver, type);
 		break;
 	case G200_EV:
-		mdev = mgag200_g200ev_device_create(pdev, &mgag200_driver, type, flags);
+		mdev = mgag200_g200ev_device_create(pdev, &mgag200_driver, type);
 		break;
 	case G200_EH:
-		mdev = mgag200_g200eh_device_create(pdev, &mgag200_driver, type, flags);
+		mdev = mgag200_g200eh_device_create(pdev, &mgag200_driver, type);
 		break;
 	case G200_EH3:
-		mdev = mgag200_g200eh3_device_create(pdev, &mgag200_driver, type, flags);
+		mdev = mgag200_g200eh3_device_create(pdev, &mgag200_driver, type);
 		break;
 	case G200_ER:
-		mdev = mgag200_g200er_device_create(pdev, &mgag200_driver, type, flags);
+		mdev = mgag200_g200er_device_create(pdev, &mgag200_driver, type);
 		break;
 	case G200_EW3:
-		mdev = mgag200_g200ew3_device_create(pdev, &mgag200_driver, type, flags);
+		mdev = mgag200_g200ew3_device_create(pdev, &mgag200_driver, type);
 		break;
 	default:
 		dev_err(&pdev->dev, "Device type %d is unsupported\n", type);
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 89cb4e476119..b05becb3d4b7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -188,24 +188,23 @@ enum mga_type {
 	G200_EW3,
 };
 
-/* HW does not handle 'startadd' field correct. */
-#define MGAG200_FLAG_HW_BUG_NO_STARTADD	(1ul << 8)
-
-#define MGAG200_TYPE_MASK	(0x000000ff)
-#define MGAG200_FLAG_MASK	(0x00ffff00)
-
 #define IS_G200_SE(mdev) (mdev->type == G200_SE_A || mdev->type == G200_SE_B)
 
 struct mgag200_device_info {
+	/*
+	 * HW does not handle 'startadd' register correctly. Always set
+	 * it's value to 0.
+	 */
+	bool bug_no_startadd:1;
 };
 
-#define MGAG200_DEVICE_INFO_INIT() \
+#define MGAG200_DEVICE_INFO_INIT(_bug_no_startadd) \
 	{ \
+		.bug_no_startadd = (_bug_no_startadd), \
 	}
 
 struct mga_device {
-	struct drm_device		base;
-	unsigned long			flags;
+	struct drm_device base;
 
 	const struct mgag200_device_info *info;
 
@@ -261,26 +260,26 @@ int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2);
 resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size);
 resource_size_t mgag200_device_probe_vram(struct mga_device *mdev);
 int mgag200_device_preinit(struct mga_device *mdev);
-int mgag200_device_init(struct mga_device *mdev, enum mga_type type, unsigned long flags,
+int mgag200_device_init(struct mga_device *mdev, enum mga_type type,
 			const struct mgag200_device_info *info);
 
 				/* mgag200_<device type>.c */
 struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-					      enum mga_type type, unsigned long flags);
+					      enum mga_type type);
 struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type, unsigned long flags);
+						enum mga_type type);
 struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type, unsigned long flags);
+						enum mga_type type);
 struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type, unsigned long flags);
+						enum mga_type type);
 struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type, unsigned long flags);
+						enum mga_type type);
 struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						 enum mga_type type, unsigned long flags);
+						 enum mga_type type);
 struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type, unsigned long flags);
+						enum mga_type type);
 struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						 enum mga_type type, unsigned long flags);
+						 enum mga_type type);
 
 				/* mgag200_mode.c */
 resource_size_t mgag200_device_probe_vram(struct mga_device *mdev);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index b2969a1f1e0b..90b33a7352e5 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -34,7 +34,7 @@ static int mgag200_g200_init_pci_options(struct pci_dev *pdev)
  */
 
 static const struct mgag200_device_info mgag200_g200_device_info =
-	MGAG200_DEVICE_INFO_INIT();
+	MGAG200_DEVICE_INFO_INIT(false);
 
 static void mgag200_g200_interpret_bios(struct mgag200_g200_device *g200,
 					const unsigned char *bios, size_t size)
@@ -160,7 +160,7 @@ static void mgag200_g200_init_refclk(struct mgag200_g200_device *g200)
 }
 
 struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-					      enum mga_type type, unsigned long flags)
+					      enum mga_type type)
 {
 	struct mgag200_g200_device *g200;
 	struct mga_device *mdev;
@@ -186,7 +186,7 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
 
 	mgag200_g200_init_refclk(g200);
 
-	ret = mgag200_device_init(mdev, type, flags, &mgag200_g200_device_info);
+	ret = mgag200_device_init(mdev, type, &mgag200_g200_device_info);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index 6284fedc1b8a..14bec513e441 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -11,10 +11,10 @@
  */
 
 static const struct mgag200_device_info mgag200_g200eh_device_info =
-	MGAG200_DEVICE_INFO_INIT();
+	MGAG200_DEVICE_INFO_INIT(false);
 
 struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type, unsigned long flags)
+						enum mga_type type)
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
@@ -36,7 +36,7 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, flags, &mgag200_g200eh_device_info);
+	ret = mgag200_device_init(mdev, type, &mgag200_g200eh_device_info);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index c8e46b89286f..c982533de9e7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -11,11 +11,11 @@
  */
 
 static const struct mgag200_device_info mgag200_g200eh3_device_info =
-	MGAG200_DEVICE_INFO_INIT();
+	MGAG200_DEVICE_INFO_INIT(false);
 
 struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 						 const struct drm_driver *drv,
-						 enum mga_type type, unsigned long flags)
+						 enum mga_type type)
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
@@ -37,7 +37,7 @@ struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, flags, &mgag200_g200eh3_device_info);
+	ret = mgag200_device_init(mdev, type, &mgag200_g200eh3_device_info);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index ef16ce4adecd..d84039eef982 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -11,10 +11,10 @@
  */
 
 static const struct mgag200_device_info mgag200_g200er_device_info =
-	MGAG200_DEVICE_INFO_INIT();
+	MGAG200_DEVICE_INFO_INIT(false);
 
 struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type, unsigned long flags)
+						enum mga_type type)
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
@@ -32,7 +32,7 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, flags, &mgag200_g200er_device_info);
+	ret = mgag200_device_init(mdev, type, &mgag200_g200er_device_info);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 75d08fb503bb..14a891d47270 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -11,10 +11,10 @@
  */
 
 static const struct mgag200_device_info mgag200_g200ev_device_info =
-	MGAG200_DEVICE_INFO_INIT();
+	MGAG200_DEVICE_INFO_INIT(false);
 
 struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type, unsigned long flags)
+						enum mga_type type)
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
@@ -36,7 +36,7 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, flags, &mgag200_g200ev_device_info);
+	ret = mgag200_device_init(mdev, type, &mgag200_g200ev_device_info);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 7cb18685b98d..b09f345ba29b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200ew3_device_info =
-	MGAG200_DEVICE_INFO_INIT();
+	MGAG200_DEVICE_INFO_INIT(false);
 
 static resource_size_t mgag200_g200ew3_device_probe_vram(struct mga_device *mdev)
 {
@@ -24,7 +24,7 @@ static resource_size_t mgag200_g200ew3_device_probe_vram(struct mga_device *mdev
 
 struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
 						 const struct drm_driver *drv,
-						 enum mga_type type, unsigned long flags)
+						 enum mga_type type)
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
@@ -46,7 +46,7 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, flags, &mgag200_g200ew3_device_info);
+	ret = mgag200_device_init(mdev, type, &mgag200_g200ew3_device_info);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 69a17f057b32..9c0fc57366f2 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -32,8 +32,11 @@ static int mgag200_g200se_init_pci_options(struct pci_dev *pdev)
  * DRM device
  */
 
-static const struct mgag200_device_info mgag200_g200se_device_info =
-	MGAG200_DEVICE_INFO_INIT();
+static const struct mgag200_device_info mgag200_g200se_a_device_info =
+	MGAG200_DEVICE_INFO_INIT(true);
+
+static const struct mgag200_device_info mgag200_g200se_b_device_info =
+	MGAG200_DEVICE_INFO_INIT(false);
 
 static void mgag200_g200se_init_unique_id(struct mgag200_g200se_device *g200se)
 {
@@ -47,9 +50,10 @@ static void mgag200_g200se_init_unique_id(struct mgag200_g200se_device *g200se)
 }
 
 struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type, unsigned long flags)
+						enum mga_type type)
 {
 	struct mgag200_g200se_device *g200se;
+	const struct mgag200_device_info *info;
 	struct mga_device *mdev;
 	struct drm_device *dev;
 	resource_size_t vram_available;
@@ -73,7 +77,18 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
 
 	mgag200_g200se_init_unique_id(g200se);
 
-	ret = mgag200_device_init(mdev, type, flags, &mgag200_g200se_device_info);
+	switch (type) {
+	case G200_SE_A:
+		info = &mgag200_g200se_a_device_info;
+		break;
+	case G200_SE_B:
+		info = &mgag200_g200se_b_device_info;
+		break;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+
+	ret = mgag200_device_init(mdev, type, info);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index 921c55ec309e..c9bf2176726e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -11,10 +11,10 @@
  */
 
 static const struct mgag200_device_info mgag200_g200wb_device_info =
-	MGAG200_DEVICE_INFO_INIT();
+	MGAG200_DEVICE_INFO_INIT(false);
 
 struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
-						enum mga_type type, unsigned long flags)
+						enum mga_type type)
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
@@ -36,7 +36,7 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = mgag200_device_init(mdev, type, flags, &mgag200_g200wb_device_info);
+	ret = mgag200_device_init(mdev, type, &mgag200_g200wb_device_info);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index effe5160bb79..f5e1a89e0bfe 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -245,7 +245,7 @@ static void mgag200_set_startadd(struct mga_device *mdev,
 	startadd = offset / 8;
 
 	if (startadd > 0)
-		drm_WARN_ON_ONCE(dev, mdev->flags & MGAG200_FLAG_HW_BUG_NO_STARTADD);
+		drm_WARN_ON_ONCE(dev, mdev->info->bug_no_startadd);
 
 	/*
 	 * Can't store addresses any higher than that, but we also
-- 
2.36.1

