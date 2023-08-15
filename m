Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141377CB14
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 12:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CD210E15D;
	Tue, 15 Aug 2023 10:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1D610E15D;
 Tue, 15 Aug 2023 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692094754; x=1723630754;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZwudxVOEqX7y3DSNyKC+Qf9C63chH+gEjZJLdd1Mve8=;
 b=g5aqB4gL5zMN4LS0YRVg8Yp3L9dLBiRxO1SJv2T9M6Dzwe0QlqU9k2Dw
 +kwUjIEhyZn2JORVYpyGgpCQ+5fzpyJJw1KbUTILZFceFHJAWK1spamCk
 5BACIUgjLG+Gz66uAA539oxLOMzJE5ELitlbkQa0uKmcIDkufr83mlath
 scMRmP9afJ0dzbqv4KRV+eYpQjF8Tzumpv6S7NRBWWCO1aaAxIrBiDNCX
 KVVbdgrmG7IO71sf23pp+exrHtZKICNlcD5n/mBgK+xiNP+3B61SziBw9
 nnzy9ftQKpe+SJUyolWzzRVMiQne3uPKYi8OE0rYFoxF78z1jcx8BAKhl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="351835824"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="351835824"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 03:19:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="683611422"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="683611422"
Received: from cristina-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.52.75])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 03:19:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "drm/edid: Fix csync detailed mode parsing"
Date: Tue, 15 Aug 2023 13:19:07 +0300
Message-Id: <20230815101907.2900768-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit ca62297b2085b5b3168bd891ca24862242c635a1.

Commit ca62297b2085 ("drm/edid: Fix csync detailed mode parsing") fixed
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
Fixes: ca62297b2085 ("drm/edid: Fix csync detailed mode parsing")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.4+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 29 ++++++++---------------------
 include/drm/drm_edid.h     | 12 +++---------
 2 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f95152fac427..340da8257b51 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3457,6 +3457,10 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 			    connector->base.id, connector->name);
 		return NULL;
 	}
+	if (!(pt->misc & DRM_EDID_PT_SEPARATE_SYNC)) {
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Composite sync not supported\n",
+			    connector->base.id, connector->name);
+	}
 
 	/* it is incorrect if hsync/vsync width is zero */
 	if (!hsync_pulse_width || !vsync_pulse_width) {
@@ -3503,27 +3507,10 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 	if (info->quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
 		mode->flags |= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
 	} else {
-		switch (pt->misc & DRM_EDID_PT_SYNC_MASK) {
-		case DRM_EDID_PT_ANALOG_CSYNC:
-		case DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC:
-			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Analog composite sync!\n",
-				    connector->base.id, connector->name);
-			mode->flags |= DRM_MODE_FLAG_CSYNC | DRM_MODE_FLAG_NCSYNC;
-			break;
-		case DRM_EDID_PT_DIGITAL_CSYNC:
-			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Digital composite sync!\n",
-				    connector->base.id, connector->name);
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
index 169755d3de19..48e93f909ef6 100644
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
2.39.2

