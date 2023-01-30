Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DD4680DC3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9F410E239;
	Mon, 30 Jan 2023 12:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D3810E239
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 12:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oT2hLpNFKGyJ3wJhnZtdrGsic4/uehcjPnc9HvQVqrQ=; b=A7EyGfqwWDRbx0YuSuKo5cs5RM
 i8fUWMh4YMhdv6mCgJYzaSoNFsRT6UTGwXBi61vzGRNeMwrkjTW4WkWXoEYCiF5ijil7lZoEXmT/e
 r6FOaXSb18XdCZqJiAvlJSV1mIGwv965QpsyvL1dqXPRdevUUHpIiFrQrhDbhPEaOx5OiPeUaT2XY
 N0vsgANvC7f35RhCGej4fERH3ulnlHFj2rwakApfYe1mxXknC7n9sh7qCiQuDF31TS7k6uwOV1Xvt
 obr0hYGZR4UlUoGa0MzgcLbqdpYg8JbWxrG5Ofnru7v/kB6rQkZZeUagsxSTWUB+F9Bp/ZsqYD5i8
 gS53gc5g==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pMTMc-004TG3-LN; Mon, 30 Jan 2023 13:34:23 +0100
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
Subject: [PATCH v2 6/6] drm/debugfs: Make the struct drm_debugfs_entry
 independent of DRM device
Date: Mon, 30 Jan 2023 09:30:14 -0300
Message-Id: <20230130123008.287141-7-mcanal@igalia.com>
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

In order to turn the API more expansible to other DRM objects, such as
the struct drm_connector, make the struct drm_debugfs_entry hold a void
pointer and cast the void pointer to the struct drm_device when needed.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c | 4 ++--
 include/drm/drm_debugfs.h     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 21f01c7d0ab1..f12c3fdf61bb 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -141,7 +141,7 @@ static int drm_debugfs_dev_show(struct seq_file *m, void *unused)
 	struct drm_debugfs_entry *entry = m->private;
 	int (*show)(struct seq_file *, struct drm_device *, void *) = entry->file.show;
 
-	return show(m, entry->dev, entry->file.data);
+	return show(m, entry->object, entry->file.data);
 }
 
 static int drm_debugfs_open(struct inode *inode, struct file *file)
@@ -362,7 +362,7 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 	entry->file.name = name;
 	entry->file.show = show;
 	entry->file.data = data;
-	entry->dev = dev;
+	entry->object = dev;
 
 	drm_debugfs_files_add(dev->debugfs_files, &entry->list);
 }
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 0fb7ad5f6893..4ab0557f55e0 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -130,8 +130,8 @@ struct drm_debugfs_info {
  * drm_debugfs_info on a &struct drm_device.
  */
 struct drm_debugfs_entry {
-	/** @dev: &struct drm_device for this node. */
-	struct drm_device *dev;
+	/** @object: The DRM object that owns this node. */
+	void *object;
 
 	/** @file: Template for this node. */
 	struct drm_debugfs_info file;
-- 
2.39.1

