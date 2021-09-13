Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B7340A1BA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 01:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C46E6E2E1;
	Mon, 13 Sep 2021 23:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222C46E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 23:48:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="285516272"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="285516272"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:48:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="543534426"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:48:38 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [RFC v1 3/6] drm: Add a capability flag to support additional flip
 completion signalling
Date: Mon, 13 Sep 2021 16:35:26 -0700
Message-Id: <20210913233529.3194401-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
References: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
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

If a driver supports this capability, it means that there would be an
additional signalling mechanism for a page flip completion in addition
to out_fence or DRM_MODE_PAGE_FLIP_EVENT.

This capability may only be relevant for Virtual KMS drivers and is currently
used only by virtio-gpu. Also, it can provide a potential solution for:
https://gitlab.freedesktop.org/wayland/weston/-/issues/514

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/drm_ioctl.c   | 3 +++
 include/drm/drm_mode_config.h | 8 ++++++++
 include/uapi/drm/drm.h        | 1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 8b8744dcf691..8a420844f8bc 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -302,6 +302,9 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
 	case DRM_CAP_CRTC_IN_VBLANK_EVENT:
 		req->value = 1;
 		break;
+	case DRM_CAP_RELEASE_FENCE:
+		req->value = dev->mode_config.release_fence;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 12b964540069..944bebf359d7 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -935,6 +935,14 @@ struct drm_mode_config {
 	 */
 	bool normalize_zpos;
 
+	/**
+	 * @release_fence:
+	 *
+	 * If this option is set, it means there would be an additional signalling
+	 * mechanism for a page flip completion.
+	 */
+	bool release_fence;
+
 	/**
 	 * @modifiers_property: Plane property to list support modifier/format
 	 * combination.
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 3b810b53ba8b..8b8985f65581 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -767,6 +767,7 @@ struct drm_gem_open {
  * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
  */
 #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
+#define DRM_CAP_RELEASE_FENCE		0x15
 
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
-- 
2.30.2

