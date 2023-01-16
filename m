Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A2166BBB7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 11:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D399E10E2E3;
	Mon, 16 Jan 2023 10:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8608F10E2DD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 10:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UpY5/+tv9fmUSHsfSoUPzhgX1OEPDrtOFzsGK1xGLKw=; b=kE9y+OvRoL0G6NyvQT6Z9gM+fd
 EaYBrSR5UWSFa9npZo5Oij/IMajX+eKHfgEzGdZhIS6BCVcYmrTMJfUE37oeDwINEmUWpGvOLxYaU
 D80ptgpPRpD0nHtSJBQ2KZ7bYlVShgikKr/1F4SurnMDW0xLm+JIN/okjNrAUIS4ui0Hw27K2hhM5
 F3yc6xL0I6+KF1FU/LExK3ruEUWF6lUiwouVeyt7xtpWqKR2QE7MvxJ3dtpnCFD2yjtl0Em123HMO
 TKnzIVNI3eSY0YLrE3Z38lZZOWI7GEq/nYhj7aZFRt+W2CbuediFnGZOp9QzhgDlwaoKU86S4uG8Z
 3Jxy2dGA==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pHMkd-009j44-9X; Mon, 16 Jan 2023 11:30:03 +0100
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
Subject: [PATCH 4/6] drm/debugfs: Create wrapper to register debugfs
Date: Mon, 16 Jan 2023 07:28:14 -0300
Message-Id: <20230116102815.95063-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116102815.95063-1-mcanal@igalia.com>
References: <20230116102815.95063-1-mcanal@igalia.com>
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
index aca460fa5d23..2d1e3072065a 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -236,11 +236,21 @@ static void drm_debugfs_list_add(struct list_head *entry, struct drm_debugfs_lis
 	mutex_unlock(&debugfs_list->mutex);
 }
 
+static void drm_debugfs_register(struct drm_minor *minor, struct drm_debugfs_list *debugfs_list)
+{
+	struct drm_debugfs_entry *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &debugfs_list->list, list) {
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
@@ -263,11 +273,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	if (dev->driver->debugfs_init)
 		dev->driver->debugfs_init(minor);
 
-	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list.list, list) {
-		debugfs_create_file(entry->file.name, 0444,
-				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
-		list_del(&entry->list);
-	}
+	drm_debugfs_register(minor, &dev->debugfs_list);
 
 	return 0;
 }
@@ -275,16 +281,11 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 void drm_debugfs_late_register(struct drm_device *dev)
 {
 	struct drm_minor *minor = dev->primary;
-	struct drm_debugfs_entry *entry, *tmp;
 
 	if (!minor)
 		return;
 
-	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list.list, list) {
-		debugfs_create_file(entry->file.name, 0444,
-				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
-		list_del(&entry->list);
-	}
+	drm_debugfs_register(minor, &dev->debugfs_list);
 }
 
 int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
-- 
2.39.0

