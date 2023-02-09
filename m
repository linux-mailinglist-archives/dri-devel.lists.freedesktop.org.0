Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E8D690205
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 09:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FD210E942;
	Thu,  9 Feb 2023 08:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0099A10E92F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 08:18:43 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id bk16so902580wrb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 00:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gZxl+t+GTO8erzy1SnGbQeiKRaPLeiNEZAK8jbC2oDY=;
 b=p0m5VUuFOYW1GeDVwWT7/yUA+YGUkazNSY6vYiT/Yx/NZ4IxsTRYSdK9OsaVArAhMR
 h8G0DBKZsaNiBKNKW4cfviop77DmWEKjiSGw/2BssWA0/qbKuZ17qhDS39d+o8/ddzB5
 Fk29BJXHvbSAfOgmpj2qZJvSm2VZZY80eIaJP2t4DvZSNz9jqv93pFg/iP2I1g+VCrdM
 JlvgMMxiRWYbIRMEURxOgfp+myipIq5py/dUl4jhvo2Q0vXycAeU4eMjqzYrS2ZUqJ2b
 FgExk5CpVx/gyNcd7riXcGpeUhjV1FIfHEHAKGEhnmbaBqx7cHv6xClA8WP+hukCCl6m
 Rc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gZxl+t+GTO8erzy1SnGbQeiKRaPLeiNEZAK8jbC2oDY=;
 b=1otG0JkfO4kcR6Xcx+ynOwHVuIAWMCwWddt0YgmjnSP/xFVXGlGKwLqDNWuQkgPyXe
 G0tNPv0oG7Nb1uYoY8ZKXQwANHWI6H0VlXVK03fDsFBMzpIANJ2vQ4aciKSqRrPixZNT
 ljug/UdNWS1jFu663HvTJD93Wgv5ym33BcCYT2Q1rlc0mGhHtrnYLvzRHdmGqUOqiAfX
 snC2ORHKGAtMgD9NZtx1ZSPaO2kjdZGgte0F84EUHqpj86EZHrfjY6YL4piDgCr7DUdI
 rjOHE7dugI5nhF5evWpc1maljTT2Lv08HjC3XK/f0PzU6d4OxPCChl89tYlfSs7665z/
 Jozw==
X-Gm-Message-State: AO0yUKVyrxR1Ccw5hUCLRSYlPb9k4fORjnX6weUi6lzp7bBJ2Px5tWkf
 zBMQUnKhk5QyJY6Od02I0R0=
X-Google-Smtp-Source: AK7set8KFbL6ismRgGbcDgDtVJylaeD2M7SpuV/B19dnsjPKoIOW0BUN7/NcpSs2Oxjt4p4DsJsPSQ==
X-Received: by 2002:a05:6000:18b:b0:2c3:ede8:acff with SMTP id
 p11-20020a056000018b00b002c3ede8acffmr11323376wrx.28.1675930722627; 
 Thu, 09 Feb 2023 00:18:42 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 n10-20020adffe0a000000b002c3ec35f360sm602056wrr.56.2023.02.09.00.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 00:18:42 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch, wambui.karugax@gmail.com, mcanal@igalia.com,
 maxime@cerno.tech, mwen@igalia.com, mairacanal@riseup.net
Subject: [PATCH 1/3] drm/debugfs: separate debugfs creation into init and
 register
Date: Thu,  9 Feb 2023 09:18:36 +0100
Message-Id: <20230209081838.45273-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209081838.45273-1-christian.koenig@amd.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This way we can create debugfs files directly, even between init and register.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c  | 12 ++++++++----
 drivers/gpu/drm/drm_drv.c      | 15 +++++++--------
 drivers/gpu/drm/drm_internal.h |  1 +
 3 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4f643a490dc3..2724cac03509 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -221,8 +221,6 @@ EXPORT_SYMBOL(drm_debugfs_create_files);
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root)
 {
-	struct drm_device *dev = minor->dev;
-	struct drm_debugfs_entry *entry, *tmp;
 	char name[64];
 
 	INIT_LIST_HEAD(&minor->debugfs_list);
@@ -230,6 +228,14 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	sprintf(name, "%d", minor_id);
 	minor->debugfs_root = debugfs_create_dir(name, root);
 
+	return 0;
+}
+
+void drm_debugfs_register(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct drm_debugfs_entry *entry, *tmp;
+
 	drm_debugfs_add_files(minor->dev, drm_debugfs_list, DRM_DEBUGFS_ENTRIES);
 
 	if (drm_drv_uses_atomic_modeset(dev)) {
@@ -250,8 +256,6 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
 		list_del(&entry->list);
 	}
-
-	return 0;
 }
 
 void drm_debugfs_late_register(struct drm_device *dev)
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index c6eb8972451a..88ce22c04672 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -156,6 +156,10 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	if (IS_ERR(minor->kdev))
 		return PTR_ERR(minor->kdev);
 
+	r = drm_debugfs_init(minor, minor->index, drm_debugfs_root);
+	if (r)
+		return r;
+
 	*drm_minor_get_slot(dev, type) = minor;
 	return 0;
 }
@@ -172,15 +176,10 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 	if (!minor)
 		return 0;
 
-	if (minor->type == DRM_MINOR_ACCEL) {
+	if (minor->type == DRM_MINOR_ACCEL)
 		accel_debugfs_init(minor, minor->index);
-	} else {
-		ret = drm_debugfs_init(minor, minor->index, drm_debugfs_root);
-		if (ret) {
-			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
-			goto err_debugfs;
-		}
-	}
+	else
+		drm_debugfs_register(minor);
 
 	ret = device_add(minor->kdev);
 	if (ret)
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index ed2103ee272c..332fb65a935a 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -185,6 +185,7 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
 #if defined(CONFIG_DEBUG_FS)
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root);
+void drm_debugfs_register(struct drm_minor *minor);
 void drm_debugfs_cleanup(struct drm_minor *minor);
 void drm_debugfs_late_register(struct drm_device *dev);
 void drm_debugfs_connector_add(struct drm_connector *connector);
-- 
2.34.1

