Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8CA6A449F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 15:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1DC10E038;
	Mon, 27 Feb 2023 14:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D55510E038;
 Mon, 27 Feb 2023 14:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677508611; x=1709044611;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xZKdK72TcTIThEssnf2juzQ6SrDR7CsZQzc763XRXPk=;
 b=KfUgvpniNn2Z6uIpm2FpNCUzqhvArmuCDEZoUpNSFbumow9X9VhSrknL
 xina8xX9UNapk5C3gRYZ88lNBJF3OlRTpyJSHylCSupCU8QN9/uqg8sC7
 71UNYq/AB/WOICTM0x2IvzXlXftfcBHoHpbjoPyVyZ3uWxyy5KrG0tdjU
 41vU8iB47QUdsclZbVKeedHYfZ7t71Q5+vjMOTZKGaSvuvU3HYHyp/aYI
 +Y/KFuxwlCknIBCUbE+VKkWeN9kjDyYFlIGQLhcgcMK4zy518ar1CnQN9
 zjY52iiEhP159mFLYP3TlyziosCh+wlUyawtUU8wKoQmLlI0tMhDw2u5I w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="336149658"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="336149658"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 06:36:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="816685967"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; d="scan'208";a="816685967"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga001.fm.intel.com with SMTP; 27 Feb 2023 06:36:49 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 27 Feb 2023 16:36:48 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: Fix csync detailed mode parsing
Date: Mon, 27 Feb 2023 16:36:48 +0200
Message-Id: <20230227143648.7776-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Remove the bogus csync check and replace it with something that:
- triggers for all forms of csync, not just the basic analog variant
- actually populates the mode csync flags so that drivers can
  decide what to do with the mode

Originally the code tried to outright reject csync, but that
apparently broke some bogus LCD monitor that claimed to have
a detailed mode that uses analog csync, despite also claiming
the monitor only support separate sync:
https://bugzilla.redhat.com/show_bug.cgi?id=540024
Potentially that monitor should just be quirked or something.

Anyways, what we are dealing with now is some kind of funny i915
JSL machine with eDP where the panel claims to support a sensible
60Hz separate sync mode, and a 50Hz mode with bipolar analog
csync. The 50Hz mode does not work so we want to not use it.
Easiest way is to just correctly flag it as csync and the driver
will reject it.

TODO: or should we just reject any form of csync (or at least
the analog variants) for digital display interfaces?

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8146
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 23 +++++++++++++++--------
 include/drm/drm_edid.h     | 12 +++++++++---
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ebab862b8b1a..fa20b1107ce3 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3424,10 +3424,6 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 			    connector->base.id, connector->name);
 		return NULL;
 	}
-	if (!(pt->misc & DRM_EDID_PT_SEPARATE_SYNC)) {
-		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Composite sync not supported\n",
-			    connector->base.id, connector->name);
-	}
 
 	/* it is incorrect if hsync/vsync width is zero */
 	if (!hsync_pulse_width || !vsync_pulse_width) {
@@ -3474,10 +3470,21 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 	if (info->quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
 		mode->flags |= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
 	} else {
-		mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
-			DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
-		mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
-			DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
+		switch (pt->misc & DRM_EDID_PT_SYNC_MASK) {
+		case DRM_EDID_PT_ANALOG_CSYNC:
+		case DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC:
+		case DRM_EDID_PT_DIGITAL_CSYNC:
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Composite sync!\n",
+				    connector->base.id, connector->name);
+			mode->flags |= DRM_MODE_FLAG_CSYNC | DRM_MODE_FLAG_NCSYNC;
+			break;
+		case DRM_EDID_PT_DIGITAL_SEPARATE_SYNC:
+			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
+				DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
+			mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
+				DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
+			break;
+		}
 	}
 
 set_size:
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 70ae6c290bdc..49ee10272603 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -61,9 +61,15 @@ struct std_timing {
 	u8 vfreq_aspect;
 } __attribute__((packed));
 
-#define DRM_EDID_PT_HSYNC_POSITIVE (1 << 1)
-#define DRM_EDID_PT_VSYNC_POSITIVE (1 << 2)
-#define DRM_EDID_PT_SEPARATE_SYNC  (3 << 3)
+#define DRM_EDID_PT_SYNC_MASK              (3 << 3)
+# define DRM_EDID_PT_ANALOG_CSYNC          (0 << 3)
+# define DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC  (1 << 3)
+# define DRM_EDID_PT_DIGITAL_CSYNC         (2 << 3)
+#  define DRM_EDID_PT_CSYNC_ON_RGB         (1 << 1) /* analog csync only */
+#  define DRM_EDID_PT_CSYNC_SERRATE        (1 << 2)
+# define DRM_EDID_PT_DIGITAL_SEPARATE_SYNC (3 << 3)
+#  define DRM_EDID_PT_HSYNC_POSITIVE       (1 << 1)
+#  define DRM_EDID_PT_VSYNC_POSITIVE       (1 << 2)
 #define DRM_EDID_PT_STEREO         (1 << 5)
 #define DRM_EDID_PT_INTERLACED     (1 << 7)
 
-- 
2.39.2

