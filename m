Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A74806DA8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 12:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AF510E6C7;
	Wed,  6 Dec 2023 11:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4ABC10E087
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 08:40:50 +0000 (UTC)
Received: by air.basealt.ru (Postfix, from userid 490)
 id 8A6AD2F20244; Wed,  6 Dec 2023 08:40:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
 sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.1
Received: from altlinux.malta.altlinux.ru (obninsk.basealt.ru [217.15.195.17])
 by air.basealt.ru (Postfix) with ESMTPSA id C8A132F20242;
 Wed,  6 Dec 2023 08:40:46 +0000 (UTC)
From: kovalev@altlinux.org
To: kovalev@altlinux.org
Subject: [PATCH 1/1] Revert "drm/edid: Fix csync detailed mode parsing"
Date: Wed,  6 Dec 2023 11:40:45 +0300
Message-Id: <20231206084045.111544-2-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
In-Reply-To: <20231206084045.111544-1-kovalev@altlinux.org>
References: <20231206084045.111544-1-kovalev@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Dec 2023 11:17:13 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vasiliy Kovalev <kovalev@altlinux.org>

This reverts commit 5a46dc8e4a064769e916d87bf9bccae75afc7289.

Commit 50b6f2c8297793f7f3315623db78dcff85158e96 upstream.

Commit 5a46dc8e4a0647 ("drm/edid: Fix csync detailed mode parsing") fixed
EDID detailed mode sync parsing. Unfortunately, there are quite a few
displays out there that have bogus (zero) sync field that are broken by
the change. Zero means analog composite sync, which is not right for
digital displays, and the modes get rejected. Regardless, it used to
work, and it needs to continue to work. Revert the change.

Rejecting modes with analog composite sync was the part that fixed the
gitlab issue 8146 [1]. We'll need to get back to the drawing board with
that.

[1] https://gitlab.freedesktop.org/drm/intel/-/issues/8146

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8789
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8930
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9044
Fixes: 5a46dc8e4a0647 ("drm/edid: Fix csync detailed mode parsing")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.4+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230815101907.2900768-1-jani.nikula@intel.com
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 drivers/gpu/drm/drm_edid.c | 26 +++++++-------------------
 include/drm/drm_edid.h     | 12 +++---------
 2 files changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index a26c6c57a627c0..5ed77e3361fd72 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3307,6 +3307,9 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 		DRM_DEBUG_KMS("stereo mode not supported\n");
 		return NULL;
 	}
+	if (!(pt->misc & DRM_EDID_PT_SEPARATE_SYNC)) {
+		DRM_DEBUG_KMS("composite sync not supported\n");
+	}
 
 	/* it is incorrect if hsync/vsync width is zero */
 	if (!hsync_pulse_width || !vsync_pulse_width) {
@@ -3353,25 +3356,10 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 	if (quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
 		mode->flags |= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
 	} else {
-		switch (pt->misc & DRM_EDID_PT_SYNC_MASK) {
-		case DRM_EDID_PT_ANALOG_CSYNC:
-		case DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC:
-			drm_dbg_kms(dev, "Analog composite sync!\n");
-			mode->flags |= DRM_MODE_FLAG_CSYNC | DRM_MODE_FLAG_NCSYNC;
-			break;
-		case DRM_EDID_PT_DIGITAL_CSYNC:
-			drm_dbg_kms(dev, "Digital composite sync!\n");
-			mode->flags |= DRM_MODE_FLAG_CSYNC;
-			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
-				DRM_MODE_FLAG_PCSYNC : DRM_MODE_FLAG_NCSYNC;
-			break;
-		case DRM_EDID_PT_DIGITAL_SEPARATE_SYNC:
-			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
-				DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
-			mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
-				DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
-			break;
-		}
+		mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
+			DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
+		mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
+			DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
 	}
 
 set_size:
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 008d2ed39822ec..1ed61e2b30a41c 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -61,15 +61,9 @@ struct std_timing {
 	u8 vfreq_aspect;
 } __attribute__((packed));
 
-#define DRM_EDID_PT_SYNC_MASK              (3 << 3)
-# define DRM_EDID_PT_ANALOG_CSYNC          (0 << 3)
-# define DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC  (1 << 3)
-# define DRM_EDID_PT_DIGITAL_CSYNC         (2 << 3)
-#  define DRM_EDID_PT_CSYNC_ON_RGB         (1 << 1) /* analog csync only */
-#  define DRM_EDID_PT_CSYNC_SERRATE        (1 << 2)
-# define DRM_EDID_PT_DIGITAL_SEPARATE_SYNC (3 << 3)
-#  define DRM_EDID_PT_HSYNC_POSITIVE       (1 << 1) /* also digital csync */
-#  define DRM_EDID_PT_VSYNC_POSITIVE       (1 << 2)
+#define DRM_EDID_PT_HSYNC_POSITIVE (1 << 1)
+#define DRM_EDID_PT_VSYNC_POSITIVE (1 << 2)
+#define DRM_EDID_PT_SEPARATE_SYNC  (3 << 3)
 #define DRM_EDID_PT_STEREO         (1 << 5)
 #define DRM_EDID_PT_INTERLACED     (1 << 7)
 
-- 
2.33.8

