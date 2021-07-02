Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C263B9D31
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 09:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0155F89F77;
	Fri,  2 Jul 2021 07:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCA189F89
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 07:56:45 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 269D32290A;
 Fri,  2 Jul 2021 07:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625212604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7oi5DxXKTUI4mpJOWY3MLaVZS8bsrlorEI8YTlVSoU=;
 b=gSUgMTsxu6nHZHzOcFnsc4154UHvPfoGxbxUp3/k20bms/UA5dueSm7TuSKpcFGpnTAUD+
 loFHOAWgyJdYV537q006LtOeY345ZG3YRWoZEyWmCiNUPK7dl8tXp0RbSd1vbzwfF112/m
 D6W/INHTY0fLd4fcKauL2kYoTtxYF40=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625212604;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7oi5DxXKTUI4mpJOWY3MLaVZS8bsrlorEI8YTlVSoU=;
 b=pBvBAGpqJVyTxPiwgA4Wx/H7adluyheCcZG62Y2PgdeEyjC5PNM3ZjvN6SZAKBnEQezA6J
 x4h+OqYEKe+pJeBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id F0DC311CD6;
 Fri,  2 Jul 2021 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625212604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7oi5DxXKTUI4mpJOWY3MLaVZS8bsrlorEI8YTlVSoU=;
 b=gSUgMTsxu6nHZHzOcFnsc4154UHvPfoGxbxUp3/k20bms/UA5dueSm7TuSKpcFGpnTAUD+
 loFHOAWgyJdYV537q006LtOeY345ZG3YRWoZEyWmCiNUPK7dl8tXp0RbSd1vbzwfF112/m
 D6W/INHTY0fLd4fcKauL2kYoTtxYF40=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625212604;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7oi5DxXKTUI4mpJOWY3MLaVZS8bsrlorEI8YTlVSoU=;
 b=pBvBAGpqJVyTxPiwgA4Wx/H7adluyheCcZG62Y2PgdeEyjC5PNM3ZjvN6SZAKBnEQezA6J
 x4h+OqYEKe+pJeBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id YObyObvG3mBSDwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Jul 2021 07:56:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@redhat.com,
	sam@ravnborg.org
Subject: [PATCH v2 2/4] drm/mgag200: Inline mgag200_device_init()
Date: Fri,  2 Jul 2021 09:56:40 +0200
Message-Id: <20210702075642.27834-3-tzimmermann@suse.de>
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

Inline mgag200_device_init() into mgag200_device_create(), which is
the only caller. Also remove a duplicate error message for
mgag200_modeset_init(). The function will print an error if/where it
failed.

v2:
	* include a note about the removed error message in
	  changelog (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 41 +++++++++------------------
 1 file changed, 13 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index b616fbbd4493..2bbbf7d537a9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -262,17 +262,26 @@ static void mgag200_g200se_init_unique_id(struct mga_device *mdev)
 		mdev->model.g200se.unique_rev_id);
 }
 
-static int mgag200_device_init(struct mga_device *mdev, unsigned long flags)
+static struct mga_device *
+mgag200_device_create(struct pci_dev *pdev, unsigned long flags)
 {
-	struct drm_device *dev = &mdev->base;
+	struct mga_device *mdev;
+	struct drm_device *dev;
 	int ret;
 
+	mdev = devm_drm_dev_alloc(&pdev->dev, &mgag200_driver, struct mga_device, base);
+	if (IS_ERR(mdev))
+		return mdev;
+	dev = &mdev->base;
+
+	pci_set_drvdata(pdev, dev);
+
 	mdev->flags = mgag200_flags_from_driver_data(flags);
 	mdev->type = mgag200_type_from_driver_data(flags);
 
 	ret = mgag200_regs_init(mdev);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
 	if (mdev->type == G200_PCI || mdev->type == G200_AGP)
 		mgag200_g200_init_refclk(mdev);
@@ -281,33 +290,9 @@ static int mgag200_device_init(struct mga_device *mdev, unsigned long flags)
 
 	ret = mgag200_mm_init(mdev);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
 	ret = mgag200_modeset_init(mdev);
-	if (ret) {
-		drm_err(dev, "Fatal error during modeset init: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-static struct mga_device *
-mgag200_device_create(struct pci_dev *pdev, unsigned long flags)
-{
-	struct drm_device *dev;
-	struct mga_device *mdev;
-	int ret;
-
-	mdev = devm_drm_dev_alloc(&pdev->dev, &mgag200_driver,
-				  struct mga_device, base);
-	if (IS_ERR(mdev))
-		return mdev;
-	dev = &mdev->base;
-
-	pci_set_drvdata(pdev, dev);
-
-	ret = mgag200_device_init(mdev, flags);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.32.0

