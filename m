Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D9C666218
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8253110E7BA;
	Wed, 11 Jan 2023 17:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD08210E7B9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VuknvR/eX5vfDCyU1tH62dyNfEz79ebOqLZs6uv4njU=; b=UPKIDJCPRDYWzvh/KFT+vgSWbl
 58mW1sa55xEAXl0pjEWQOY7oaVne7nFfw2cV5Agj4JnRNgsHYXC0PNWAOU+WiHUYWyuBa+fmMfwD6
 yOdByqpYo5QfcJVlsruZxWXnt4szMZjDtvSiwAK22e7HxdUaU2bZVkFvgocLNJAQ9nJlIrIOHCJOC
 iv3dwlxazRZ2sBKSxoU/4pbr0LfHgT45TzA7L1UQK88V+zVmgtZK3ZfCgDdBxx3md7nrjNZ+tgeWU
 e8oWLQQSx//Dl4tIbAwRFXBvwFGA56d6gd9QD+vGM/q+jChk2WsOxsgY4ycnhRrh7bWaWpM4X2JgF
 t9jE6F9w==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pFf4G-005Sku-OC; Wed, 11 Jan 2023 18:39:17 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 12/13] drm/debugfs: Remove the debugfs late register function
Date: Wed, 11 Jan 2023 14:37:47 -0300
Message-Id: <20230111173748.752659-13-mcanal@igalia.com>
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

With the new debugfs infrastructure for kms objects, there is no need to
have a late register helper for debugfs, as the late register debugfs
function was only created because drm_debugfs_init() is not able to
create debugfs files for modeset components, as they are registered after
the primary and the render drm_minor are registered.

Now that each kms object has its own debugfs init function, remove the
debugfs late register function.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c     | 11 -----------
 drivers/gpu/drm/drm_internal.h    |  5 -----
 drivers/gpu/drm/drm_mode_config.c |  2 --
 3 files changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index e1f71a03a581..fe470a896527 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -294,17 +294,6 @@ void drm_debugfs_encoder_init(struct drm_encoder *encoder)
 	drm_create_file_from_list(encoder);
 }
 
-void drm_debugfs_late_register(struct drm_device *dev)
-{
-	struct drm_minor *minor = dev->primary;
-	struct drm_debugfs_entry *entry, *tmp;
-
-	if (!minor)
-		return;
-
-	drm_create_file_from_list(dev);
-}
-
 int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
 			     struct drm_minor *minor)
 {
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 9be697f7f8f9..eb6a0545249a 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -189,7 +189,6 @@ void drm_debugfs_crtc_init(struct drm_crtc *crtc);
 void drm_debugfs_connector_init(struct drm_connector *connector);
 void drm_debugfs_encoder_init(struct drm_encoder *encoder);
 void drm_debugfs_cleanup(struct drm_minor *minor);
-void drm_debugfs_late_register(struct drm_device *dev);
 void drm_debugfs_connector_add(struct drm_connector *connector);
 void drm_debugfs_connector_remove(struct drm_connector *connector);
 void drm_debugfs_crtc_add(struct drm_crtc *crtc);
@@ -218,10 +217,6 @@ static inline void drm_debugfs_cleanup(struct drm_minor *minor)
 {
 }
 
-static inline void drm_debugfs_late_register(struct drm_device *dev)
-{
-}
-
 static inline void drm_debugfs_connector_add(struct drm_connector *connector)
 {
 }
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 87eb591fe9b5..8525ef851540 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -54,8 +54,6 @@ int drm_modeset_register_all(struct drm_device *dev)
 	if (ret)
 		goto err_connector;
 
-	drm_debugfs_late_register(dev);
-
 	return 0;
 
 err_connector:
-- 
2.39.0

