Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AE3680DC0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B8C10E235;
	Mon, 30 Jan 2023 12:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AD310E235
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WbB+xSaDpA0umq7LVyFlekhthbh1N0bVz7hcdwyYfmo=; b=lkwJ6LBHZmJo3JUwSg3i+pj6lP
 zxC+krFxA6fAiOfVXbHTnGcuhdUOGQT2Rf9epHB/mndQ/uC6fdjrg2KbgrD2FIZMjtPPCHWdoHRIk
 3fbtCSzG8Kz95jXY2m/lXHmEN6J0hD5pRPeNjg8nOJXCY4EjzdS358j18O4SfIQfqgoEV/JJd9GJe
 m+jSGowVqm28G/OCOCrnhakNCN7557zZMP5Dud3jJ0q+dlPUBAsg0j4Ol3u5+w8vMDPhf1wOqKDOk
 nafDw2fsbAz/JXOyEMCBOJ8ekBolVoYtCCJtYMpQcDCfq7/04mSzf3XvjFzx7kLa1O9bQU0qTTwS+
 63rAh0dQ==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pMTM3-004TG3-RF; Mon, 30 Jan 2023 13:33:48 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v2 4/6] drm/debugfs: Create wrapper to register debugfs
Date: Mon, 30 Jan 2023 09:30:11 -0300
Message-Id: <20230130123008.287141-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130123008.287141-1-mcanal@igalia.com>
References: <20230130123008.287141-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a helper to encapsulate the code that creates a new debugfs files
from a linked list related to an object. Moreover, the helper also
provides more flexibily on the type of the object.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 0e3f3ffa9f88..b4d2e7dd87f5 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -243,11 +243,21 @@ static void drm_debugfs_files_add(struct drm_debugfs_files *debugfs_files, struc
 	mutex_unlock(&debugfs_files->mutex);
 }
 
+static void drm_debugfs_register(struct drm_minor *minor, struct drm_debugfs_files *debugfs_files)
+{
+	struct drm_debugfs_entry *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &debugfs_files->list, list) {
+		debugfs_create_file(entry->file.name, 0444,
+				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
+		list_del(&entry->list);
+	}
+}
+
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root)
 {
 	struct drm_device *dev = minor->dev;
-	struct drm_debugfs_entry *entry, *tmp;
 	char name[64];
 
 	INIT_LIST_HEAD(&minor->debugfs_list);
@@ -270,11 +280,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	if (dev->driver->debugfs_init)
 		dev->driver->debugfs_init(minor);
 
-	list_for_each_entry_safe(entry, tmp, &dev->debugfs_files->list, list) {
-		debugfs_create_file(entry->file.name, 0444,
-				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
-		list_del(&entry->list);
-	}
+	drm_debugfs_register(minor, dev->debugfs_files);
 
 	return 0;
 }
@@ -282,16 +288,11 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 void drm_debugfs_late_register(struct drm_device *dev)
 {
 	struct drm_minor *minor = dev->primary;
-	struct drm_debugfs_entry *entry, *tmp;
 
 	if (!minor)
 		return;
 
-	list_for_each_entry_safe(entry, tmp, &dev->debugfs_files->list, list) {
-		debugfs_create_file(entry->file.name, 0444,
-				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
-		list_del(&entry->list);
-	}
+	drm_debugfs_register(minor, dev->debugfs_files);
 }
 
 int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
-- 
2.39.1

