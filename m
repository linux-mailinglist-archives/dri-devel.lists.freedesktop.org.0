Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 667C866BBBA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 11:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A49910E363;
	Mon, 16 Jan 2023 10:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA04210E331
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4js2on2hKIFqimOWZfiBBpTEC28sxfMAfJJXBhkDVQk=; b=grgRVJ44nbET0i0mjrVxsmrxqM
 FYfOgMESBB2v1arklPMjVub4YozRwDo3qP7GDYmthITC9oyhz8YJLJhoNk0TvLUnItPZF9u/PCY/b
 qIgz+PcH4fQL6ROrVwzjF3SkWIOuPDEbE1IcHmB/u5X2ysV0rDipZs47J4x8usowDXDnkYwQw20ax
 SOd86BeH056bSeeCctHstcf6G4GGeavr+K789luCTzHZ1tAytc+OYG9j3e9JPDzUSzDN79fePGSwZ
 xbIsPD8OeEVROjxukQxHYxpHXPKSQUqyKJF/LQQaOt5TJXQVd9QkTfTRTjNUkpesK3RLBjIS/dXRb
 hiV5GUKw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pHMki-009j44-Qd; Mon, 16 Jan 2023 11:30:09 +0100
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
Subject: [PATCH 5/6] drm/debugfs: Make the struct drm_debugfs_entry
 independent of DRM device
Date: Mon, 16 Jan 2023 07:28:15 -0300
Message-Id: <20230116102815.95063-6-mcanal@igalia.com>
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

In order to turn the API more expansible to other DRM objects, such as
the struct drm_connector, make the struct drm_debugfs_entry hold a void
pointer and cast the void pointer to the struct drm_device when needed.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c | 2 +-
 include/drm/drm_debugfs.h     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 2d1e3072065a..912f5c0a4ad5 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -356,7 +356,7 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 	entry->file.name = name;
 	entry->file.show = show;
 	entry->file.data = data;
-	entry->dev = dev;
+	entry->object = dev;
 
 	drm_debugfs_list_add(&entry->list, &dev->debugfs_list);
 }
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index b4e22e7d4016..d1243b433997 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -131,8 +131,8 @@ struct drm_debugfs_info {
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
2.39.0

