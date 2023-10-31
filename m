Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369AF7DCA8F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 11:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5497710E45B;
	Tue, 31 Oct 2023 10:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A413610E456;
 Tue, 31 Oct 2023 10:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698747437; x=1730283437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AbNIyw8SH6/so0eHqDYkawBbzmVG9dmVKNzDjUwWzU8=;
 b=Crxy4Pq92LMr0/+BVWvwc9xqtE21HmLI0x+bjcVM40WRAHc4EuoEnr9o
 hFnX6OlhfBVWSqNtUOI8Yf1DhX2780AMHgqYX539bya+Xsfdr/UodXvSD
 wN/+diuXuNfSoD9kSHrodj7t/qquyQNR0fnbyoUYKCdfB6QEXsW6J6R4J
 bAdUkcMgJwVIpK7qHmmIocO2+HhRnBbu3JynOKNr9+uYNk1EM/SBmeNz1
 q1s3/y40L/rUkPcCCnU5s/Yct8MCMtFcvVWVNkw39ISh+RMfey2kUaiq1
 AJpD0jkuy07+zm4ZqcebqL3HqdJf0SHp/zDsmp/BqFPJF6roXN59Y3NM1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="391127662"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="391127662"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 03:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="754096530"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="754096530"
Received: from moelschl-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.45])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 03:17:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/6] drm/edid: add helpers to get/set struct cea_sad
 from/to 3-byte sad
Date: Tue, 31 Oct 2023 12:16:42 +0200
Message-Id: <21d657ca854ce26423b461c0bb71e7a0727ba437.1698747331.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1698747331.git.jani.nikula@intel.com>
References: <cover.1698747331.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helpers to pack/unpack SADs. Both ways and non-static, as follow-up
work needs them.

v2: Add include to get the declarations

Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c     | 34 +++++++++++++++++++++++++---------
 drivers/gpu/drm/drm_internal.h |  6 ++++++
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c0d50082b504..cb4031d5dcbb 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -46,6 +46,7 @@
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
+#include "drm_internal.h"
 
 static int oui(u8 first, u8 second, u8 third)
 {
@@ -5510,6 +5511,27 @@ static void clear_eld(struct drm_connector *connector)
 	connector->audio_latency[1] = 0;
 }
 
+/*
+ * Get 3-byte SAD buffer from struct cea_sad.
+ */
+void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad)
+{
+	sad[0] = cta_sad->format << 3 | cta_sad->channels;
+	sad[1] = cta_sad->freq;
+	sad[2] = cta_sad->byte2;
+}
+
+/*
+ * Set struct cea_sad from 3-byte SAD buffer.
+ */
+void drm_edid_cta_sad_set(struct cea_sad *cta_sad, const u8 *sad)
+{
+	cta_sad->format = (sad[0] & 0x78) >> 3;
+	cta_sad->channels = sad[0] & 0x07;
+	cta_sad->freq = sad[1] & 0x7f;
+	cta_sad->byte2 = sad[2];
+}
+
 /*
  * drm_edid_to_eld - build ELD from EDID
  * @connector: connector corresponding to the HDMI/DP sink
@@ -5604,21 +5626,15 @@ static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_AUDIO) {
 			struct cea_sad *sads;
-			int j;
+			int i;
 
 			count = cea_db_payload_len(db) / 3; /* SAD is 3B */
 			sads = kcalloc(count, sizeof(*sads), GFP_KERNEL);
 			*psads = sads;
 			if (!sads)
 				return -ENOMEM;
-			for (j = 0; j < count; j++) {
-				const u8 *sad = &db->data[j * 3];
-
-				sads[j].format = (sad[0] & 0x78) >> 3;
-				sads[j].channels = sad[0] & 0x7;
-				sads[j].freq = sad[1] & 0x7F;
-				sads[j].byte2 = sad[2];
-			}
+			for (i = 0; i < count; i++)
+				drm_edid_cta_sad_set(&sads[i], &db->data[i * 3]);
 			break;
 		}
 	}
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 8462b657c375..b12c463bc460 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -22,6 +22,7 @@
  */
 
 #include <linux/kthread.h>
+#include <linux/types.h>
 
 #include <drm/drm_ioctl.h>
 #include <drm/drm_vblank.h>
@@ -31,6 +32,7 @@
 
 #define DRM_IF_VERSION(maj, min) (maj << 16 | min)
 
+struct cea_sad;
 struct dentry;
 struct dma_buf;
 struct iosys_map;
@@ -267,3 +269,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 				const struct drm_framebuffer *fb);
 void drm_framebuffer_debugfs_init(struct drm_device *dev);
+
+/* drm_edid.c */
+void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad);
+void drm_edid_cta_sad_set(struct cea_sad *cta_sad, const u8 *sad);
-- 
2.39.2

