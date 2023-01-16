Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E3D66BBB6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 11:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8C510E2DD;
	Mon, 16 Jan 2023 10:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3110C10E2DD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eUSEC2loK6JmCn4KYmfo6SNuJBTfIHXxRbVWdo/L9nQ=; b=CPXztSGvmnBvFbIbVD6y3D83U1
 VZ5mUlvi27F2iqkI8GXzjsYOMabpglA0H8a1lowDTKzDdNDbI7jC0+cf2DCxHFYPmXTt7viR3jv8Z
 IUgwYLYGwxBHyfDdz0T2xHy2XB95WfHntRs9woR+bKIrBbaaxTYjwiA/SeqRFROsBgXZ4GM/sdQIN
 rUI/CDEFhlqTMmapEKKIpOtD7RRezPL/XDbTQXcsQKF6YqwvE+S2sJoPSYBHj8H5USvf993dnUbOH
 8wOVGNrj36AmdLAJYg18y32EmbncFg7PLZ8aSqE/NOv9BgDLMq6JTzuN486nug/d6KUlH1ExB/e91
 1ZtyNGHA==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pHMkX-009j44-TP; Mon, 16 Jan 2023 11:29:58 +0100
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
Subject: [PATCH 3/6] drm/debugfs: Create wrapper to add files to debugfs list
Date: Mon, 16 Jan 2023 07:28:13 -0300
Message-Id: <20230116102815.95063-4-mcanal@igalia.com>
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

Create a helper to encapsulate the code that adds a new debugfs file to
a linked list related to a object. Moreover, the helper also provides
more flexibily, as the parameter is a struct drm_debugfs_list.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 176b0f8614e5..aca460fa5d23 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -229,6 +229,13 @@ void drm_debugfs_list_destroy(struct drm_debugfs_list *debugfs_list)
 	mutex_destroy(&debugfs_list->mutex);
 }
 
+static void drm_debugfs_list_add(struct list_head *entry, struct drm_debugfs_list *debugfs_list)
+{
+	mutex_lock(&debugfs_list->mutex);
+	list_add(entry, &debugfs_list->list);
+	mutex_unlock(&debugfs_list->mutex);
+}
+
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root)
 {
@@ -350,9 +357,7 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 	entry->file.data = data;
 	entry->dev = dev;
 
-	mutex_lock(&dev->debugfs_list.mutex);
-	list_add(&entry->list, &dev->debugfs_list.list);
-	mutex_unlock(&dev->debugfs_list.mutex);
+	drm_debugfs_list_add(&entry->list, &dev->debugfs_list);
 }
 EXPORT_SYMBOL(drm_debugfs_add_file);
 
-- 
2.39.0

