Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8894D8AB485
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 19:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335FF10FF6B;
	Fri, 19 Apr 2024 17:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aCRdVpda";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364AE10FF69
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 17:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713548746;
 bh=tg8CNjSpWN2BcBDo2ESp9bjBzlZSzMIk0QNMl4nZYbA=;
 h=From:To:Cc:Subject:Date:From;
 b=aCRdVpdahXIbXIWgMggkkeyMfyj00RFePkKCUXa9vvmPOryTab8WeJK1xioUerVe3
 3j9qCE22dAYsDJfJO8IarsnMX9631nkI/BkTBHo7Me9zzVE4WjxJX3AiAP3pJm49A3
 YyTsRgMbvJzIbR76votXMr/ObHPp0UHTz16W1xGXS1QPXXz8BH/8JMRsGQ6pSpO5+g
 S+Bl8WxsE1pcL1869tsyNzY3JN97U3G23JLPyJd5zJ5Yh57tvkvv6PZCe+FLkRyYUt
 aBV6PSfWhGetcgqmwBh5gVx+IGooPEDOWMzvdfaxrJ45jAZFnl5EJE80zwNqeOOxZJ
 rWkisKZhhNqiA==
Received: from hermes-devbox.lan (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D62E83782154;
 Fri, 19 Apr 2024 17:45:45 +0000 (UTC)
From: Bob Beckett <bob.beckett@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com, Robert Beckett <bob.beckett@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: fix drm lastclose ignoring closed active fbs
Date: Fri, 19 Apr 2024 18:45:30 +0100
Message-ID: <20240419174531.1696581-1-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Beckett <bob.beckett@collabora.com>

when fb's have been marked as closed, if there is still something active
then don't restore fbdev during lastclose

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/drm_fb_helper.c |  3 +++
 drivers/gpu/drm/drm_plane.c     | 21 +++++++++++++++++++++
 include/drm/drm_plane.h         |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d612133e2cf7e..b7509b0cd926a 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -2002,6 +2002,9 @@ EXPORT_SYMBOL(drm_fb_helper_hotplug_event);
  */
 void drm_fb_helper_lastclose(struct drm_device *dev)
 {
+	if (drm_has_active_plane(dev))
+		return;
+
 	drm_fb_helper_restore_fbdev_mode_unlocked(dev->fb_helper);
 }
 EXPORT_SYMBOL(drm_fb_helper_lastclose);
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 672c655c7a8e7..7eb3d06696ca7 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -930,6 +930,27 @@ static int __setplane_check(struct drm_plane *plane,
 	return 0;
 }
 
+/**
+ * drm_has_active_plane - check whether any planes are currently active
+ * @dev: the DRM device
+ *
+ * Return true if any planes are currently active
+ */
+bool drm_has_active_plane(struct drm_device *dev)
+{
+	struct drm_plane *plane;
+
+	drm_for_each_plane(plane, dev) {
+		if (plane->state && plane->state->crtc && plane->state->fb)
+			return true;
+		if (plane->crtc && plane->fb)
+			return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL(drm_has_active_plane);
+
 /**
  * drm_any_plane_has_format - Check whether any plane supports this format and modifier combination
  * @dev: DRM device
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 641fe298052dc..74fec8cbee8c6 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -965,6 +965,8 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
 #define drm_for_each_plane(plane, dev) \
 	list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
 
+bool drm_has_active_plane(struct drm_device *dev);
+
 bool drm_any_plane_has_format(struct drm_device *dev,
 			      u32 format, u64 modifier);
 
-- 
2.44.0

