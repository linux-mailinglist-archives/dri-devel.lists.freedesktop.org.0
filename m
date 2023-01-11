Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9869E66620D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1392410E7B1;
	Wed, 11 Jan 2023 17:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5769D10E7B6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7hnudy0wkmxNkLHz09244h2KlIQRVcthBCtrNfe+Z4A=; b=ak8NxholPfQZ4uU023dvYBId8q
 RymRv0yrwlnwj3emHZ7CQUnTNaHZrJEBhjSsHdrpCMRGrQWEsQo0+rwbbfEzy+5gHUCSfT5HZFJan
 9z8e8+/e+oKbcPmkgNZOIW8RkwDoYVZr1ie+XAf5F/r003xqYqu6QH0KjVXIqKzda7qaqgkBCCO5R
 yfsExaLwgrtuEzj1X8EJs1sigsFA1YVROMDDzZ7hVrscO4ffM6t0S9oLN3SYVI+nFy1OGbCpDhVM+
 hSzNDw+60epO0iSqHmWtr/OKeTcuC4dcVRgWXPB6aLkKGQ9Bx9u8e7ytZ0FBLLSw87lCDSWSMETsl
 11PMNVBg==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pFf3Y-005Sku-Hh; Wed, 11 Jan 2023 18:38:33 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 02/13] drm/debugfs: Create helper to create debugfs files from
 list
Date: Wed, 11 Jan 2023 14:37:37 -0300
Message-Id: <20230111173748.752659-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111173748.752659-1-mcanal@igalia.com>
References: <20230111173748.752659-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a helper to encapsulate the code that creates a new debugfs file
from a linked list related to an object. Moreover, the helper also provides
more flexibily on the type of the object.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 255d2068ac16..23f6ed7b5d68 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -218,6 +218,16 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
 }
 EXPORT_SYMBOL(drm_debugfs_create_files);
 
+#define drm_create_file_from_list(component) do {					\
+		list_for_each_entry_safe(entry, tmp, &(component)->debugfs_list,	\
+					 list) {					\
+			debugfs_create_file(entry->file.name, 0444,			\
+					    minor->debugfs_root, entry,			\
+					    &drm_debugfs_entry_fops);			\
+			list_del(&entry->list);						\
+		}									\
+	} while (0)
+
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root)
 {
@@ -245,11 +255,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	if (dev->driver->debugfs_init)
 		dev->driver->debugfs_init(minor);
 
-	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
-		debugfs_create_file(entry->file.name, 0444,
-				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
-		list_del(&entry->list);
-	}
+	drm_create_file_from_list(dev);
 
 	return 0;
 }
@@ -262,11 +268,7 @@ void drm_debugfs_late_register(struct drm_device *dev)
 	if (!minor)
 		return;
 
-	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
-		debugfs_create_file(entry->file.name, 0444,
-				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
-		list_del(&entry->list);
-	}
+	drm_create_file_from_list(dev);
 }
 
 int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
-- 
2.39.0

