Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1476836F9
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 21:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F5210E38E;
	Tue, 31 Jan 2023 20:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B9D10E0B4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 20:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WbB+xSaDpA0umq7LVyFlekhthbh1N0bVz7hcdwyYfmo=; b=CDPfTD0H40LmZI0St6f8PleEM8
 UaQ9jfxhdjgQHywIAv+ws+jFTZCtxTZpHjwpqC24j3HroZVJb2kVieaZ0SDa6JyZV4EnAhv4lHvbP
 J7twLxy2mWe2Q8a5ozfIkkfIvUUwF2PYmyAp7dKfP4KdbwJFNfXwOlum8glk9ry251TqY3iCT5T4u
 wNylVYjMt2IFvSyTjpAhca0J+Eta7jPN5ilV9RPCTXama4EGDEJ7PLQvforuRclwuH/HYp0GhYWXH
 Q1BpZdDbkxGz1i5Uf5GzUAlUUD3DzAz02nDEGGMM7pk2qjANqPuksydCMnawLM5f6d7F4j+FiOQrw
 6S8AJpIw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pMwpL-005kjr-0t; Tue, 31 Jan 2023 21:01:59 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v3 4/6] drm/debugfs: Create wrapper to register debugfs
Date: Tue, 31 Jan 2023 16:58:24 -0300
Message-Id: <20230131195825.677487-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131195825.677487-1-mcanal@igalia.com>
References: <20230131195825.677487-1-mcanal@igalia.com>
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

