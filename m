Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D4166620C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E70310E0B4;
	Wed, 11 Jan 2023 17:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D96A10E7B5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BAuTiLzPk50vqXqF9ZBIcFufRjndH82IbE0TexouuM4=; b=jGomHbW22nFenQE008vYlc2zvW
 MWDGcOckLpyf3hjphmWYkcXVkn0wGo73W16grq50KHOuft6w+Flr3bDYCRDoaFO14pHhtRD63Ey57
 DGQevTNviUUNAOnAYBI1aIUT0IHWcFaLoIk7bZkPm9Qu7NNJpzJ4sphGwMc7HzZg/Z7kxJERCMNlG
 ofZxUxep08AczvKBXZrTF2xr6X+TqVK+aVhQ8NKwp84q0Z9IyQucvfsOiOfibQMKpg7pECCgoRKJY
 bi/AJ42gbaUS1ohckqqiTgbh5DihYjXUBNN5n2p6n/Yce8AMmdl3od8JqpJj61yM6dJgzhM9bWt5c
 EIkorQVg==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pFf3T-005Sku-Vw; Wed, 11 Jan 2023 18:38:28 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 01/13] drm/debugfs: Create helper to add debugfs files to
 device's list
Date: Wed, 11 Jan 2023 14:37:36 -0300
Message-Id: <20230111173748.752659-2-mcanal@igalia.com>
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

Create a helper to encapsulate the code that adds a new debugfs file to
a linked list related to a object. Moreover, the helper also provides
more flexibily on the type of the object, allowing to use the helper for
other types of drm_debugfs_entry.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4f643a490dc3..255d2068ac16 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -316,6 +316,17 @@ void drm_debugfs_cleanup(struct drm_minor *minor)
 	minor->debugfs_root = NULL;
 }
 
+#define drm_debugfs_add_file_to_list(component) do {			\
+		entry->file.name = name;				\
+		entry->file.show = show;				\
+		entry->file.data = data;				\
+		entry->component = (component);				\
+									\
+		mutex_lock(&(component)->debugfs_mutex);		\
+		list_add(&entry->list, &(component)->debugfs_list);	\
+		mutex_unlock(&(component)->debugfs_mutex);		\
+	} while (0)
+
 /**
  * drm_debugfs_add_file - Add a given file to the DRM device debugfs file list
  * @dev: drm device for the ioctl
@@ -334,14 +345,7 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 	if (!entry)
 		return;
 
-	entry->file.name = name;
-	entry->file.show = show;
-	entry->file.data = data;
-	entry->dev = dev;
-
-	mutex_lock(&dev->debugfs_mutex);
-	list_add(&entry->list, &dev->debugfs_list);
-	mutex_unlock(&dev->debugfs_mutex);
+	drm_debugfs_add_file_to_list(dev);
 }
 EXPORT_SYMBOL(drm_debugfs_add_file);
 
-- 
2.39.0

