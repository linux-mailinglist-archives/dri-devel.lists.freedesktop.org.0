Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF973B9D2E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 09:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9DB89F99;
	Fri,  2 Jul 2021 07:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD7189F99
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 07:56:45 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5798A20534;
 Fri,  2 Jul 2021 07:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625212604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voXEJxv/C42AaDpakkDdA7CCgM0fZ36R9BOHaBK3rxM=;
 b=vwMSt9H+UvE2EsAExMqI3arUMhnerTEN85101ZDmiNv0P/KKwO+JD6etARruefn13yOeg9
 xNFeU1sl3jLmjmvUCrlvK9zufyHPnoEic9KKdu5TfIPfbyk64SgW8l/AlZLjZWHsUSYRYe
 zv0apLfX5VlHHJTOE5Dpj492QMG6FI8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625212604;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voXEJxv/C42AaDpakkDdA7CCgM0fZ36R9BOHaBK3rxM=;
 b=teEncyTgdW5SZzlGYzisas0AFIK2uXbbAvMZAlUKhWlzud+LbE/MrZGh+no/QGu5ltnBeR
 7pXSrJ45NHFQ1RDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2A48E11CD7;
 Fri,  2 Jul 2021 07:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625212604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voXEJxv/C42AaDpakkDdA7CCgM0fZ36R9BOHaBK3rxM=;
 b=vwMSt9H+UvE2EsAExMqI3arUMhnerTEN85101ZDmiNv0P/KKwO+JD6etARruefn13yOeg9
 xNFeU1sl3jLmjmvUCrlvK9zufyHPnoEic9KKdu5TfIPfbyk64SgW8l/AlZLjZWHsUSYRYe
 zv0apLfX5VlHHJTOE5Dpj492QMG6FI8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625212604;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voXEJxv/C42AaDpakkDdA7CCgM0fZ36R9BOHaBK3rxM=;
 b=teEncyTgdW5SZzlGYzisas0AFIK2uXbbAvMZAlUKhWlzud+LbE/MrZGh+no/QGu5ltnBeR
 7pXSrJ45NHFQ1RDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id +HV5CbzG3mBSDwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Jul 2021 07:56:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@redhat.com,
	sam@ravnborg.org
Subject: [PATCH v2 3/4] drm/mgag200: Extract device type and flags in
 mgag200_pci_probe()
Date: Fri,  2 Jul 2021 09:56:41 +0200
Message-Id: <20210702075642.27834-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210702075642.27834-1-tzimmermann@suse.de>
References: <20210702075642.27834-1-tzimmermann@suse.de>
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

The type and flags values are stored in the PCI ID list. Extract them
in the probe function. Makes the device initialization more readable.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 21 +++++++++++++++++----
 drivers/gpu/drm/mgag200/mgag200_drv.h | 12 ------------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 2bbbf7d537a9..6b9243713b3c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -263,7 +263,7 @@ static void mgag200_g200se_init_unique_id(struct mga_device *mdev)
 }
 
 static struct mga_device *
-mgag200_device_create(struct pci_dev *pdev, unsigned long flags)
+mgag200_device_create(struct pci_dev *pdev, enum mga_type type, unsigned long flags)
 {
 	struct mga_device *mdev;
 	struct drm_device *dev;
@@ -276,8 +276,8 @@ mgag200_device_create(struct pci_dev *pdev, unsigned long flags)
 
 	pci_set_drvdata(pdev, dev);
 
-	mdev->flags = mgag200_flags_from_driver_data(flags);
-	mdev->type = mgag200_type_from_driver_data(flags);
+	mdev->flags = flags;
+	mdev->type = type;
 
 	ret = mgag200_regs_init(mdev);
 	if (ret)
@@ -320,9 +320,22 @@ static const struct pci_device_id mgag200_pciidlist[] = {
 
 MODULE_DEVICE_TABLE(pci, mgag200_pciidlist);
 
+static enum mga_type mgag200_type_from_driver_data(kernel_ulong_t driver_data)
+{
+	return (enum mga_type)(driver_data & MGAG200_TYPE_MASK);
+}
+
+static unsigned long mgag200_flags_from_driver_data(kernel_ulong_t driver_data)
+{
+	return driver_data & MGAG200_FLAG_MASK;
+}
+
 static int
 mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
+	kernel_ulong_t driver_data = ent->driver_data;
+	enum mga_type type = mgag200_type_from_driver_data(driver_data);
+	unsigned long flags = mgag200_flags_from_driver_data(driver_data);
 	struct mga_device *mdev;
 	struct drm_device *dev;
 	int ret;
@@ -335,7 +348,7 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	mdev = mgag200_device_create(pdev, ent->driver_data);
+	mdev = mgag200_device_create(pdev, type, flags);
 	if (IS_ERR(mdev))
 		return PTR_ERR(mdev);
 	dev = &mdev->base;
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 749a075fe9e4..75ae1809fb5a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -192,18 +192,6 @@ static inline struct mga_device *to_mga_device(struct drm_device *dev)
 	return container_of(dev, struct mga_device, base);
 }
 
-static inline enum mga_type
-mgag200_type_from_driver_data(kernel_ulong_t driver_data)
-{
-	return (enum mga_type)(driver_data & MGAG200_TYPE_MASK);
-}
-
-static inline unsigned long
-mgag200_flags_from_driver_data(kernel_ulong_t driver_data)
-{
-	return driver_data & MGAG200_FLAG_MASK;
-}
-
 				/* mgag200_mode.c */
 int mgag200_modeset_init(struct mga_device *mdev);
 
-- 
2.32.0

