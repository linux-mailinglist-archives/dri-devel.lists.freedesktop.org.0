Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D216765F47E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 20:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1D610E489;
	Thu,  5 Jan 2023 19:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5828D10E49B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 19:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6ng+7yFDWt9LxupRFip41Ax8DmuR3ZIMGl3JGKRkSCM=; b=IhWo/ViZZotddgwnge91joIdD4
 0QJtZLN9QO/xB3TuOerTdBCV+0q+Ka/r6dheIvcSdSucO+ZSAkRZ0mKMiTDkXJ/tQkrg+BMR8H6d4
 NCk83lxooSipqYGYT9e/skAoPgW9mn0JriK44nCGuYwjrW04uZtcHUy15JZA9bffX190DdUsnoIGp
 GPLGaVm/0QgJy837Y7FYfdgaGjqVvLDtboQlLk7iVC9xsIu34VbeelE1JpjqFXNmqXWnUYCptin6K
 CSl8wzC62l18t5Fc4fkAUUp5BgkvUrcOdSJPyPFq6ZaO+wVorKUbe8Rf1kXy8tx72/wnHpzmF7rNI
 GAd3OWFQ==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pDVx0-000Kcs-7a; Thu, 05 Jan 2023 20:30:54 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm/debugfs: use octal permissions instead of symbolic
 permissions
Date: Thu,  5 Jan 2023 16:30:38 -0300
Message-Id: <20230105193039.287677-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, debugfs functions are using symbolic macros as permission
bits, but checkpatch reinforces permission bits in the octal form, as
they are more readable and easier to understand [1].

Therefore, use octal permission bits in all debugfs functions.

[1] https://docs.kernel.org/dev-tools/checkpatch.html#permissions

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 5ea237839439..4f643a490dc3 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -207,7 +207,7 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
 
 		tmp->minor = minor;
 		tmp->dent = debugfs_create_file(files[i].name,
-						S_IFREG | S_IRUGO, root, tmp,
+						0444, root, tmp,
 						&drm_debugfs_fops);
 		tmp->info_ent = &files[i];
 
@@ -246,7 +246,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		dev->driver->debugfs_init(minor);
 
 	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
-		debugfs_create_file(entry->file.name, S_IFREG | S_IRUGO,
+		debugfs_create_file(entry->file.name, 0444,
 				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
 		list_del(&entry->list);
 	}
@@ -263,7 +263,7 @@ void drm_debugfs_late_register(struct drm_device *dev)
 		return;
 
 	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
-		debugfs_create_file(entry->file.name, S_IFREG | S_IRUGO,
+		debugfs_create_file(entry->file.name, 0444,
 				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
 		list_del(&entry->list);
 	}
@@ -508,15 +508,15 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
 	connector->debugfs_entry = root;
 
 	/* force */
-	debugfs_create_file("force", S_IRUGO | S_IWUSR, root, connector,
+	debugfs_create_file("force", 0644, root, connector,
 			    &drm_connector_fops);
 
 	/* edid */
-	debugfs_create_file("edid_override", S_IRUGO | S_IWUSR, root, connector,
+	debugfs_create_file("edid_override", 0644, root, connector,
 			    &drm_edid_fops);
 
 	/* vrr range */
-	debugfs_create_file("vrr_range", S_IRUGO, root, connector,
+	debugfs_create_file("vrr_range", 0444, root, connector,
 			    &vrr_range_fops);
 
 	/* max bpc */
-- 
2.39.0

