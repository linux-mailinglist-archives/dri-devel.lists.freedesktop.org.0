Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0AB797140
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 11:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508B610E7AA;
	Thu,  7 Sep 2023 09:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF6410E7AA;
 Thu,  7 Sep 2023 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694078944; x=1725614944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=syQbZ5qRJK2FNj80CB+7mqUwCsFDRJzEz+YgluFuyJg=;
 b=RhROVW+vdg00J2FYVD/efL2xwFZTZVMzcecsQE49zJSL4A5xbIcbDQLx
 blLUSr4G0CmE4T1a7wmYKg/IcJItqNAXoPrQc3pbjd/wXMDstZ1GSSSD/
 j5crcdhfW0JSbrjnv/+BuMsvG3GpSY6FtXRXXICx1W9rsX4Ex7zd2wR66
 GTmugTkjRP/vH5gIgbS14cv27RixJK57mzzxqiAURWBxw0FAvjIHYF6BZ
 TE6zGilQnc6NLcIEVt2+x5+Ti0s0UAllU2YMvKQxY5QA9XSAE1weWBp+O
 faRuR+M6Q5LnLjJZRfqJk+TAS9+b1x7tmiffqyoDtwBOR08tvU0ehGPvX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="376217301"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="376217301"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:28:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="735425511"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="735425511"
Received: from iraduica-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.61.21])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:28:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/edid: add helpers to get/set struct cea_sad from/to
 3-byte sad
Date: Thu,  7 Sep 2023 12:28:23 +0300
Message-Id: <eba53a0904126fb904a5190750002695350f44eb.1694078430.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1694078430.git.jani.nikula@intel.com>
References: <cover.1694078430.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helpers to pack/unpack SADs. Both ways and non-static, as follow-up
work needs them.

Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c     | 33 ++++++++++++++++++++++++---------
 drivers/gpu/drm/drm_internal.h |  6 ++++++
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index fcdc2c314cde..1260e2688bd7 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5499,6 +5499,27 @@ static void clear_eld(struct drm_connector *connector)
 	connector->audio_latency[1] = 0;
 }
 
+/*
+ * Get 3-byte SAD buf from struct cea_sad.
+ */
+void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad)
+{
+	sad[0] = cta_sad->format << 3 | cta_sad->channels;
+	sad[1] = cta_sad->freq;
+	sad[2] = cta_sad->byte2;
+}
+
+/*
+ * Set struct cea_sad from 3-byte SAD buf.
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
@@ -5593,21 +5614,15 @@ static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
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
index ab9a472f4a47..5b7c661da459 100644
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
@@ -265,3 +267,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 				const struct drm_framebuffer *fb);
 void drm_framebuffer_debugfs_init(struct drm_device *dev);
+
+/* drm_edid.c */
+void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad);
+void drm_edid_cta_sad_set(struct cea_sad *cta_sad, const u8 *sad);
-- 
2.39.2

