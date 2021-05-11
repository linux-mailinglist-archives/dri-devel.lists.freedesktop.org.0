Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5647C379C56
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 03:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96B96E99D;
	Tue, 11 May 2021 01:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8B26E99B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 01:57:05 +0000 (UTC)
IronPort-SDR: Ob4F2dibUzrWzCSwhDgkbgmBQKr37Ad99OU0XOFBhkW0JS9SUMGMxUt5N7LE/3oQ59H0NJO61y
 ad9dJpI9ouDg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="196239147"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="196239147"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 18:57:00 -0700
IronPort-SDR: RDE+T5p3xlMsTG0pDUpcnNl6m1baaDH5mx5RKu4+5nJiJWsPeE1MTRg4GvF0z0EKqhBGlgmEn/
 OuElEzPywBpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="434067386"
Received: from test.bj.intel.com ([10.238.158.204])
 by fmsmga008.fm.intel.com with ESMTP; 10 May 2021 18:56:58 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 1/3] drm: Add drm_plane_add_modifiers()
Date: Mon, 10 May 2021 21:49:38 -0400
Message-Id: <20210511014940.2067715-2-tina.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511014940.2067715-1-tina.zhang@intel.com>
References: <20210511014940.2067715-1-tina.zhang@intel.com>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Tina Zhang <tina.zhang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a function to add modifiers to a plane.

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/drm_plane.c | 41 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_plane.h     |  3 +++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index b570a480090a..793b16d84f86 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -288,6 +288,47 @@ int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
 }
 EXPORT_SYMBOL(drm_universal_plane_init);
 
+int drm_plane_add_modifiers(struct drm_device *dev,
+				  struct drm_plane *plane,
+				  const uint64_t *format_modifiers)
+{
+	struct drm_mode_config *config = &dev->mode_config;
+	const uint64_t *temp_modifiers = format_modifiers;
+	unsigned int format_modifier_count = 0;
+
+	/*
+	 * Only considering adding modifiers when no modifier was
+	 * added to that plane before.
+	 */
+	if (!temp_modifiers || plane->modifier_count)
+		return -EINVAL;
+
+	while (*temp_modifiers++ != DRM_FORMAT_MOD_INVALID)
+		format_modifier_count++;
+
+	if (format_modifier_count)
+		config->allow_fb_modifiers = true;
+
+	plane->modifier_count = format_modifier_count;
+	plane->modifiers = kmalloc_array(format_modifier_count,
+					 sizeof(format_modifiers[0]),
+					 GFP_KERNEL);
+
+	if (format_modifier_count && !plane->modifiers) {
+		DRM_DEBUG_KMS("out of memory when allocating plane\n");
+		return -ENOMEM;
+	}
+
+	memcpy(plane->modifiers, format_modifiers,
+		   format_modifier_count * sizeof(format_modifiers[0]));
+	if (config->allow_fb_modifiers)
+		create_in_format_blob(dev, plane);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_add_modifiers);
+
+
 int drm_plane_register_all(struct drm_device *dev)
 {
 	unsigned int num_planes = 0;
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 50c23eb432b7..0dacdeffc3bc 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -827,6 +827,9 @@ int drm_universal_plane_init(struct drm_device *dev,
 			     const uint64_t *format_modifiers,
 			     enum drm_plane_type type,
 			     const char *name, ...);
+int drm_plane_add_modifiers(struct drm_device *dev,
+			       struct drm_plane *plane,
+			       const uint64_t *format_modifiers);
 int drm_plane_init(struct drm_device *dev,
 		   struct drm_plane *plane,
 		   uint32_t possible_crtcs,
-- 
2.25.1

