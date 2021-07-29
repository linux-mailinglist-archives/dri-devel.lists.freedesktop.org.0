Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0C33D9F97
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 10:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912476ECE5;
	Thu, 29 Jul 2021 08:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671D76ECA0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 08:29:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="276612148"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="276612148"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 01:29:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="507013880"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 01:29:50 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v1 1/4] drm: Add a capability flag to support deferred out_fence
 signalling
Date: Thu, 29 Jul 2021 01:16:56 -0700
Message-Id: <20210729081659.2255499-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a driver supports this capability, it means that it will take
ownership of signalling the OUT_FENCE from drm core. Therefore, the
OUT_FENCE will no longer be signalled at pageflip completion time but
instead at a later time as chosen by the driver.

This capability may only be relevant for VKMS drivers. And, it can
provide a potential solution for:
https://gitlab.freedesktop.org/wayland/weston/-/issues/514

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/drm_file.c    | 11 +++++++----
 drivers/gpu/drm/drm_ioctl.c   |  3 +++
 include/drm/drm_mode_config.h |  9 +++++++++
 include/uapi/drm/drm.h        |  1 +
 4 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ceb1a9723855..9337938cfa12 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -787,10 +787,13 @@ static void drm_send_event_helper(struct drm_device *dev,
 	}
 
 	if (e->fence) {
-		if (timestamp)
-			dma_fence_signal_timestamp(e->fence, timestamp);
-		else
-			dma_fence_signal(e->fence);
+		if (!dev->mode_config.deferred_out_fence) {
+			if (timestamp)
+				dma_fence_signal_timestamp(e->fence, timestamp);
+			else
+				dma_fence_signal(e->fence);
+		}
+
 		dma_fence_put(e->fence);
 	}
 
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index f454e0424086..d6ff36fe0b72 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -302,6 +302,9 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
 	case DRM_CAP_CRTC_IN_VBLANK_EVENT:
 		req->value = 1;
 		break;
+	case DRM_CAP_DEFERRED_OUT_FENCE:
+		req->value = dev->mode_config.deferred_out_fence;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 1ddf7783fdf7..a9ac9f5ce6ad 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -929,6 +929,15 @@ struct drm_mode_config {
 	 */
 	bool normalize_zpos;
 
+	/**
+	 * @deferred_out_fence:
+	 *
+	 * If this option is set, the drm core would no longer signal the
+	 * out_fence at pageflip completion time. Instead, the driver would
+	 * signal the out_fence at a time when it deems appropriate.
+	 */
+	bool deferred_out_fence;
+
 	/**
 	 * @modifiers_property: Plane property to list support modifier/format
 	 * combination.
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 3b810b53ba8b..6a85a6892972 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -767,6 +767,7 @@ struct drm_gem_open {
  * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
  */
 #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
+#define DRM_CAP_DEFERRED_OUT_FENCE	0x15
 
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
-- 
2.30.2

