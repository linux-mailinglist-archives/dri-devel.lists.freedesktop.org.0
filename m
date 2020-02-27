Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8511717FC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1BA6E8CB;
	Thu, 27 Feb 2020 12:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9656EC94
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:02:54 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y17so2995070wrn.6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hzppef4BJunGtSqUEs9qFTuC3AbcvnqYyUkjMbmkHM8=;
 b=mS/SQ/FfVlFzndl6TvaUp2euA7txpxt6OY8g5TkPEKDeO3z4TWgirzqKTvzhoBsGgo
 BOKqyL2p/l6dC2l4uc9ZExg+kyi5SewPGNOuUSkizF8GspyvgQ0fL+4pFkYsOvdNe8qs
 PQpvF5LB8gvwn8sSHkBVgYs6u4oaweqHRfBOeuAAMTDYxNKl87mfQOLZhORP0WrHfYft
 Yc/ZI/1VA97xOeWkJwYRNpPZyXXjiIRkdkt+351y85GZ56+5R417lXhieIKNkc1H80Pn
 YKaW202BTYNMTz4nxl9QicYnf+gVNu23EFTMuqM50NWwNR+UDW8HzSA3npaaiHsBXex3
 sYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hzppef4BJunGtSqUEs9qFTuC3AbcvnqYyUkjMbmkHM8=;
 b=Rigri9/FffdXcy6ySTJbcQCDQp3sWC3DX2OSrSjI16LH2BRWWe78EpCBUkmIMbxmuV
 mZLsKBlN0srgy5r4AjZFZcjt7Yh43hQz6IS7fLjw040QSQG/sldmOCZ36PYYwN0sRV30
 Jpgwg9w9Er2olsPeR4vR+YOxpNsiZd1nl/NsdHLswe1O5SUz7XPRN1gxBg+pALt6Ks73
 6Rmfa5IHy4AKbJv3JSgGmXVXKGdtdeMCfHLl/dtivmp6P2FbjmXx401iuzYso/uwmooY
 jsl3CgW+WWOa4qt0/05HGaRyjEGCOxgAYc8zEqnldcy5hi3mTTXAwUWPNh5EJRByjRyU
 bKzA==
X-Gm-Message-State: APjAAAW9ka+8WIN84yOcE69mLv0RrkoITaYNtqEdFYRYw+SR8KFhAzSz
 gqeneuboQCCydlEVBGgvin8=
X-Google-Smtp-Source: APXvYqw1LKi63DfoJA/bsez9eXzpdWdTO2EiKYpktEZc2TxtMs4XIfVV8ZovRQEVIJI/SQc391HeHw==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr4675637wrr.352.1582804973171; 
 Thu, 27 Feb 2020 04:02:53 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:02:52 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH 03/21] drm: convert drm_debugfs functions to return void
Date: Thu, 27 Feb 2020 15:02:14 +0300
Message-Id: <20200227120232.19413-4-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227120232.19413-1-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since 987d65d01356 (drm: debugfs: make drm_debugfs_create_files() never
fail), drm_debug_create_files() never fails and should return void.
Therefore, drop return value from various drm_debugfs functions that return
drm_debug_create_files() and convert the functions to return void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/drm_atomic.c        | 8 ++++----
 drivers/gpu/drm/drm_client.c        | 8 ++++----
 drivers/gpu/drm/drm_crtc_internal.h | 2 +-
 drivers/gpu/drm/drm_framebuffer.c   | 8 ++++----
 drivers/gpu/drm/drm_internal.h      | 2 +-
 include/drm/drm_client.h            | 2 +-
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 9ccfbf213d72..965173fd0ac2 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1641,10 +1641,10 @@ static const struct drm_info_list drm_atomic_debugfs_list[] = {
 	{"state", drm_state_info, 0},
 };
 
-int drm_atomic_debugfs_init(struct drm_minor *minor)
+void drm_atomic_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(drm_atomic_debugfs_list,
-			ARRAY_SIZE(drm_atomic_debugfs_list),
-			minor->debugfs_root, minor);
+	drm_debugfs_create_files(drm_atomic_debugfs_list,
+				 ARRAY_SIZE(drm_atomic_debugfs_list),
+				 minor->debugfs_root, minor);
 }
 #endif
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index b031b45aa8ef..2a147d1c3a13 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -457,10 +457,10 @@ static const struct drm_info_list drm_client_debugfs_list[] = {
 	{ "internal_clients", drm_client_debugfs_internal_clients, 0 },
 };
 
-int drm_client_debugfs_init(struct drm_minor *minor)
+void drm_client_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(drm_client_debugfs_list,
-					ARRAY_SIZE(drm_client_debugfs_list),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(drm_client_debugfs_list,
+				 ARRAY_SIZE(drm_client_debugfs_list),
+				 minor->debugfs_root, minor);
 }
 #endif
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 16f2413403aa..1b620ba9244b 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -224,7 +224,7 @@ int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
 /* drm_atomic.c */
 #ifdef CONFIG_DEBUG_FS
 struct drm_minor;
-int drm_atomic_debugfs_init(struct drm_minor *minor);
+void drm_atomic_debugfs_init(struct drm_minor *minor);
 #endif
 
 int __drm_atomic_helper_disable_plane(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 57ac94ce9b9e..0375b3d7f8d0 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1207,10 +1207,10 @@ static const struct drm_info_list drm_framebuffer_debugfs_list[] = {
 	{ "framebuffer", drm_framebuffer_info, 0 },
 };
 
-int drm_framebuffer_debugfs_init(struct drm_minor *minor)
+void drm_framebuffer_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(drm_framebuffer_debugfs_list,
-				ARRAY_SIZE(drm_framebuffer_debugfs_list),
-				minor->debugfs_root, minor);
+	drm_debugfs_create_files(drm_framebuffer_debugfs_list,
+				 ARRAY_SIZE(drm_framebuffer_debugfs_list),
+				 minor->debugfs_root, minor);
 }
 #endif
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index aeec2e68d772..f0c99d00b201 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -235,7 +235,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 /* drm_framebuffer.c */
 void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 				const struct drm_framebuffer *fb);
-int drm_framebuffer_debugfs_init(struct drm_minor *minor);
+void drm_framebuffer_debugfs_init(struct drm_minor *minor);
 
 /* drm_hdcp.c */
 int drm_setup_hdcp_srm(struct class *drm_class);
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 3ed5dee899fd..7402f852d3c4 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -188,6 +188,6 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
 	drm_for_each_connector_iter(connector, iter) \
 		if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 
-int drm_client_debugfs_init(struct drm_minor *minor);
+void drm_client_debugfs_init(struct drm_minor *minor);
 
 #endif
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
