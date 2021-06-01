Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31EB3970E9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B1B6E9D6;
	Tue,  1 Jun 2021 10:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC116E145;
 Tue,  1 Jun 2021 10:05:59 +0000 (UTC)
IronPort-SDR: 5V1DZD4/79WrE0U+qZPU/pD2aQPuMXjB6986f4fnUr9vfehJ/iB2y54o3v6B/8E+yM7Gh2w84g
 HfjTxtlq2IPg==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="183197744"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="183197744"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:52 -0700
IronPort-SDR: wbEzqGlcbpVKa76dE9z4+w5pw/SjahScsbqaoAnNSI0sRFMXPF9d7jiRom/J2TNrXLMHwll+3d
 EgZf+HZHdFMA==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="399245238"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:50 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm: Add Client Cap for advance gamma mode
Date: Tue,  1 Jun 2021 16:11:31 +0530
Message-Id: <20210601104135.29020-6-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601104135.29020-1-uma.shankar@intel.com>
References: <20210601104135.29020-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>, bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduced a client cap for advance cap mode capability. Userspace
should set this to get to be able to use the new gamma_mode property.

If this is not set, driver will work in legacy mode.

Note: This is suggested by Ville and based on his idea, the new
gamma mode handling is designed.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 3 +++
 drivers/gpu/drm/drm_ioctl.c       | 5 +++++
 include/drm/drm_atomic.h          | 1 +
 include/drm/drm_crtc.h            | 8 ++++++++
 include/drm/drm_file.h            | 8 ++++++++
 include/uapi/drm/drm.h            | 8 ++++++++
 6 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index a5470a0ebbe6..7ee35bc14455 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1036,6 +1036,8 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			break;
 		}
 
+		crtc_state->advance_gamma_mode_active =
+					state->advance_gamma_mode_active;
 		ret = drm_atomic_crtc_set_property(crtc,
 				crtc_state, prop, prop_value);
 		break;
@@ -1372,6 +1374,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
+	state->advance_gamma_mode_active = file_priv->advance_gamma_mode_active;
 
 retry:
 	copied_objs = 0;
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 53d314103a37..d51f72213882 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -361,6 +361,11 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			return -EINVAL;
 		file_priv->writeback_connectors = req->value;
 		break;
+	case DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES:
+		if (req->value > 1)
+			return -EINVAL;
+		file_priv->advance_gamma_mode_active = req->value;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index ac5a28eff2c8..5a398a249c80 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -379,6 +379,7 @@ struct drm_atomic_state {
 	 * states.
 	 */
 	bool duplicated : 1;
+	bool advance_gamma_mode_active : 1;
 	struct __drm_planes_state *planes;
 	struct __drm_crtcs_state *crtcs;
 	int num_connector;
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 5a594f134a81..f4339fbad086 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -170,6 +170,11 @@ struct drm_crtc_state {
 	 */
 	bool color_mgmt_changed : 1;
 
+	/**
+	 * This is to indicate advance gamma mode support
+	 */
+	bool advance_gamma_mode_active : 1;
+
 	/**
 	 * @no_vblank:
 	 *
@@ -1036,6 +1041,9 @@ struct drm_crtc {
 	 */
 	bool enabled;
 
+	/** To handle advance gamma mode support */
+	bool advance_gamma_mode_active : 1;
+
 	/**
 	 * @mode:
 	 *
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index b81b3bfb08c8..4af3e1a2a158 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -201,6 +201,14 @@ struct drm_file {
 	 */
 	bool writeback_connectors;
 
+	/**
+	 * This is to enable advance gamma modes using
+	 * gamma_mode property
+	 *
+	 * True if client understands advance gamma
+	 */
+	bool advance_gamma_mode_active : 1;
+
 	/**
 	 * @was_master:
 	 *
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 67b94bc3c885..661efdf0c969 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -816,6 +816,14 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
 
+/**
+ * Add support for advance gamma mode UAPI
+ * If set to 1, DRM will enable advance gamma mode
+ * UAPI to process the gamma mode based on extended
+ * range and segments.
+ */
+#define DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES     6
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
-- 
2.26.2

