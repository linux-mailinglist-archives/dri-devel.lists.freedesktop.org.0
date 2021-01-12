Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC192F29BD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF696E113;
	Tue, 12 Jan 2021 08:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF006E10E;
 Tue, 12 Jan 2021 08:10:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2FF41AC95;
 Tue, 12 Jan 2021 08:10:42 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com
Subject: [PATCH 6/6] drm: Move struct drm_device.hose to legacy section
Date: Tue, 12 Jan 2021 09:10:35 +0100
Message-Id: <20210112081035.6882-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112081035.6882-1-tzimmermann@suse.de>
References: <20210112081035.6882-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The field is only relevant for legacy DRM drivers. Its only non-legacy
user in the DRM core is in drm_file.c. This code is now protected by
CONFIG_DRM_LEGACY. Radeon, the only driver that used the field, has been
changed to maintain it's own copy.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_file.c | 2 ++
 include/drm/drm_device.h   | 9 +++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 80886d50d0f1..86c405d86a68 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -370,6 +370,7 @@ static int drm_open_helper(struct file *filp, struct drm_minor *minor)
 	list_add(&priv->lhead, &dev->filelist);
 	mutex_unlock(&dev->filelist_mutex);
 
+#ifdef CONFIG_DRM_LEGACY
 #ifdef __alpha__
 	/*
 	 * Default the hose
@@ -389,6 +390,7 @@ static int drm_open_helper(struct file *filp, struct drm_minor *minor)
 				dev->hose = b->sysdata;
 		}
 	}
+#endif
 #endif
 
 	return 0;
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 939904ae88fc..d647223e8390 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -282,10 +282,6 @@ struct drm_device {
 	/** @pdev: PCI device structure */
 	struct pci_dev *pdev;
 
-#ifdef __alpha__
-	/** @hose: PCI hose, only used on ALPHA platforms. */
-	struct pci_controller *hose;
-#endif
 	/** @num_crtcs: Number of CRTCs on this device */
 	unsigned int num_crtcs;
 
@@ -328,6 +324,11 @@ struct drm_device {
 	/* List of devices per driver for stealth attach cleanup */
 	struct list_head legacy_dev_list;
 
+#ifdef __alpha__
+	/** @hose: PCI hose, only used on ALPHA platforms. */
+	struct pci_controller *hose;
+#endif
+
 	/* Context handle management - linked list of context handles */
 	struct list_head ctxlist;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
