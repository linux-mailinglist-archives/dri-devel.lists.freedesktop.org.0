Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BEA370B2B
	for <lists+dri-devel@lfdr.de>; Sun,  2 May 2021 12:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692B56E210;
	Sun,  2 May 2021 10:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4974A6E523
 for <dri-devel@lists.freedesktop.org>; Sun,  2 May 2021 10:49:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D5E2B133;
 Sun,  2 May 2021 10:49:57 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH 7/7] drm: Remove pdev field from struct drm_device
Date: Sun,  2 May 2021 12:49:53 +0200
Message-Id: <20210502104953.21768-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210502104953.21768-1-tzimmermann@suse.de>
References: <20210502104953.21768-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The field pdev in struct drm_device is unused. Remove it. The
value can be obtained by upcasting from the structure's dev field.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_pci.c | 1 -
 include/drm/drm_device.h  | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 1a1a2d4046e9..03bd863ff0b2 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -162,7 +162,6 @@ static int drm_get_pci_dev(struct pci_dev *pdev,
 	if (ret)
 		goto err_free;
 
-	dev->pdev = pdev;
 #ifdef __alpha__
 	dev->hose = pdev->sysdata;
 #endif
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index c5a195676e8f..e5d6305e64a2 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -321,9 +321,6 @@ struct drm_device {
 	/* List of devices per driver for stealth attach cleanup */
 	struct list_head legacy_dev_list;
 
-	/* PCI device structure */
-	struct pci_dev *pdev;
-
 #ifdef __alpha__
 	/** @hose: PCI hose, only used on ALPHA platforms. */
 	struct pci_controller *hose;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
