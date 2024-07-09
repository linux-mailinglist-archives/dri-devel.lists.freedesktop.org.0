Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBBF92B1A8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 09:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC1510E4B4;
	Tue,  9 Jul 2024 07:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGl0yokE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A51C10E4AF;
 Tue,  9 Jul 2024 07:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720511813; x=1752047813;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6ptuGwoZrUxoJAquvrWJdxw46J4xJZQdWCe53L7kfBs=;
 b=IGl0yokEWoFUPu157MRBP89D4bpiKb4S5/TCmWLO5yAdDy94N1UhYcx+
 hi59OkzDcrpoeqZ56daXHDKOU3lUVqOHKEuLhitF5aUO+zjfXQ80VhGXE
 Cmk7j4S735RBk+LnKOd1BgK/uRrjOe8OfViV1vUFfxspuNgtOezrVrY4V
 acrKFHfGZ1gnEPiW14HPCcqf0tmlZZO/rwWejiLDFz5CaguHxnHU1nmhw
 n2+SYBNgHYKbSbk6AOS18MF0Hm1xdHN1CoHRx3he5MkLi8ahWDNVmfaTF
 WRzPevXxznW3kKVHNHtGsfEnQNnE6U6ln+vjoc268z45WQV1neOX8gnmK w==;
X-CSE-ConnectionGUID: b8SLo2ltQYSiZjttLQUX/Q==
X-CSE-MsgGUID: YxkbUz7FSOCDP0f8NMJ2qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21513646"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="21513646"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 00:56:52 -0700
X-CSE-ConnectionGUID: hWhEzyxxSyyed4YQKgYNyw==
X-CSE-MsgGUID: M/hdRh+TT8qWLrdYE4pz1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="52097278"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 09 Jul 2024 00:56:49 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
 interoperability
Date: Tue,  9 Jul 2024 13:16:56 +0530
Message-Id: <20240709074656.1389387-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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

Each plane has its own capability or interoperability based on the
harware restrictions. If this is exposed to the user, then user can read
it once on boot and store this. Later can be used as a lookup table to
check a corresponding capability is supported by plane then only go
ahead with the framebuffer creation/calling atomic_ioctl.

For Ex: There are few restiction as to async flip doesnt support all the
formats/modifiers. Similar restrictions on scaling. With the
availabililty of this info to user, failures in atomic_check can be
avoided as these are more the hardware capabilities.

There are two options on how this can be acheived.
Option 1:

Add a new element to struct drm_mode_get_plane that holds the addr to
the array of a new struct. This new struct consists of the formats
supported and the corresponding plane capabilities.

Option 2:

These can be exposed to user as a plane property so that the user can get to
know the limitation ahead and avoid failures in atomic_check.

Usually atomic_get_property is controlled over the state struct for the
parameters/elements that can change. But here these capabilities or the
interoperabilities are rather hardware restrictions and wont change over
flips. Hence having as a plane_property may not make much sense.
On the other hand, Option 1 include changes in the uapi struct
drm_mode_get_plane. Shouldnt have impact on backward compatibility, but
if userspace has some implementation so as to check the size of the
struct, then it might a challenge.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
 include/drm/drm_plane.h           |  8 ++++++++
 include/uapi/drm/drm_mode.h       | 20 ++++++++++++++++++++
 3 files changed, 31 insertions(+)

=============Option 2========================

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 22bbb2d83e30..b46177d5fc8c 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -631,6 +631,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->hotspot_x;
 	} else if (property == plane->hotspot_y_property) {
 		*val = state->hotspot_y;
+	} else if (property == config->prop_plane_caps) {
+		*val = (state->plane_caps) ?
+			state->plane_caps->base.id : 0;
 	} else {
 		drm_dbg_atomic(dev,
 			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]\n",
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index dd718c62ac31..dfe931677d0a 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -260,6 +260,14 @@ struct drm_plane_state {
 	 * flow.
 	 */
 	bool color_mgmt_changed : 1;
+
+	/**
+	 * @plane_caps:
+	 *
+	 * Blob representing plane capcabilites and interoperability.
+	 * This element is a pointer to the array of struct drm_format_blob.
+	 */
+	struct drm_property_blob *plane_caps;
 };
 
 static inline struct drm_rect

=============Option 1========================

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index d390011b89b4..0b5c1b65ef63 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -312,6 +312,20 @@ struct drm_mode_set_plane {
 	__u32 src_w;
 };
 
+#define DRM_FORMAT_PLANE_CAP_LINEAR_TILE	BIT(0)
+#define DRM_FORMAT_PLANE_CAP_X_TILE		BIT(1)
+#define DRM_FORMAT_PLANE_CAP_Y_TILE		BIT(2)
+#define DRM_FORMAT_PLANE_CAP_Yf_TILE		BIT(3)
+#define DRM_FORMAT_PLANE_CAP_ASYNC_FLIP		BIT(4)
+#define DRM_FORMAT_PLANE_CAP_FBC		BIT(5)
+#define DRM_FORMAT_PLANE_CAP_RC			BIT(6)
+
+struct drm_format_blob {
+	__u64 modifier;
+	__u32 plane_caps;
+
+};
+
 /**
  * struct drm_mode_get_plane - Get plane metadata.
  *
@@ -355,6 +369,12 @@ struct drm_mode_get_plane {
 	 * supported by the plane. These formats do not require modifiers.
 	 */
 	__u64 format_type_ptr;
+	/**
+	 * @ format_blob_ptr: Pointer to the array of struct drm_format_blob.
+	 * Specify the plane capabilites/restrictions w.r.t tiling/sync-async
+	 * flips etc
+	 */
+	__u64 format_blob_ptr;
 };
 
 struct drm_mode_get_plane_res {
-- 
2.25.1

