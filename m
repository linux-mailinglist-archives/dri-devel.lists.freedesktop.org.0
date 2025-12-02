Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F04C9B421
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 12:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E7A10E61D;
	Tue,  2 Dec 2025 11:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="DQWPYgod";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="4a1II04o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6D010E619;
 Tue,  2 Dec 2025 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764673366; bh=96Xx6pEA6IrK7KXRzHy93Ni
 ixWaJOWO8cK1KcI4cmBA=; b=DQWPYgodW9ZDxXKDNQ2kyOBxLem+Mg69hTqahxpofEZwaJq8w3
 KoV45fdTwGzeIx4mK2ZoyjQIvthQh1HI5OsajT3ZwUsmCDQXtJ45hs0KnRN9gKp/oBL9Bb6TafY
 l9BhRizdm+Dri/hGCYNQVUsvAeM5R7GUYbjONswbj3rmkGgKo5Hviw+aCt4+bs0GmcI+J64c4u6
 SkQ7r91MSyoDwKy4uB8zG+beqgYcV+L3pkEjCUf3qDBjD0kWyBUcTGWJtjcutf4FMfGZSSlHO+6
 g4nldV2y8br1uYjBJRJJReUk5QhyhcmWEk0TxBl8H1x+9lDrZEebsimDInb8Jm+IapQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764673366; bh=96Xx6pEA6IrK7KXRzHy93Ni
 ixWaJOWO8cK1KcI4cmBA=; b=4a1II04oNIArJk4JPmVJHLVcoB7LyMpwoIt0MLygDJaJA0HZnf
 QvYH6OQ9XWj338Ok4FtR6RjO9Xb/laUfKHDw==;
From: Yaroslav Bolyukin <iam@lach.pw>
To: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yaroslav Bolyukin <iam@lach.pw>
Subject: [PATCH v7 6/7] drm/edid: parse DRM VESA dsc bpp target
Date: Tue,  2 Dec 2025 12:02:17 +0100
Message-ID: <20251202110218.9212-7-iam@lach.pw>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251202110218.9212-1-iam@lach.pw>
References: <20251202110218.9212-1-iam@lach.pw>
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

As per DisplayID v2.1a spec "DSC pass-through timing support",
VESA vendor-specific data block may contain target DSC bits per pixel
fields, that should be always used for the VII modes that declare they
only support working with this value (Pass-through Timing Support for
Target DSC Bits per Pixel).

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>

fixup parse DRM vesa dsc bpp target
---
 drivers/gpu/drm/drm_displayid_internal.h |  4 ++++
 drivers/gpu/drm/drm_edid.c               | 17 +++++++++++++++++
 include/drm/drm_connector.h              |  6 ++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
index 55f972d32847..8f1a2f33ca1a 100644
--- a/drivers/gpu/drm/drm_displayid_internal.h
+++ b/drivers/gpu/drm/drm_displayid_internal.h
@@ -148,6 +148,8 @@ struct displayid_formula_timing_block {
 #define DISPLAYID_VESA_DP_TYPE		GENMASK(2, 0)
 #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
 #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
+#define DISPLAYID_VESA_DSC_BPP_INT	GENMASK(5, 0)
+#define DISPLAYID_VESA_DSC_BPP_FRACT	GENMASK(3, 0)
 
 #define DISPLAYID_VESA_DP_TYPE_EDP	0
 #define DISPLAYID_VESA_DP_TYPE_DP	1
@@ -157,6 +159,8 @@ struct displayid_vesa_vendor_specific_block {
 	u8 oui[3];
 	u8 data_structure_type;
 	u8 mso;
+	u8 dsc_bpp_int;
+	u8 dsc_bpp_fract;
 } __packed;
 
 /*
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index be8715632b91..8273920f5ba4 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -45,6 +45,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_fixed.h>
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
@@ -6593,6 +6594,21 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
 	} else {
 		info->mso_pixel_overlap = 0;
 	}
+
+	if (block->num_bytes < 7) {
+		/* DSC bpp is optional */
+		return;
+	}
+
+	info->dp_dsc_bpp_x16 = FIELD_GET(DISPLAYID_VESA_DSC_BPP_INT, vesa->dsc_bpp_int) << 4 |
+			       FIELD_GET(DISPLAYID_VESA_DSC_BPP_FRACT, vesa->dsc_bpp_fract);
+
+	if (info->dp_dsc_bpp_x16 > 0) {
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s] DSC bits per pixel " FXP_Q4_FMT "\n",
+			    connector->base.id, connector->name,
+			    FXP_Q4_ARGS(info->dp_dsc_bpp_x16));
+	}
 }
 
 static void drm_update_vesa_specific_block(struct drm_connector *connector,
@@ -6641,6 +6657,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	info->mso_stream_count = 0;
 	info->mso_pixel_overlap = 0;
 	info->max_dsc_bpp = 0;
+	info->dp_dsc_bpp_x16 = 0;
 
 	kfree(info->vics);
 	info->vics = NULL;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..7decfc288aa3 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -837,6 +837,12 @@ struct drm_display_info {
 	 */
 	u32 max_dsc_bpp;
 
+	/**
+	 * @dp_dsc_bpp: DP Display-Stream-Compression (DSC) timing's target
+	 * DSC bits per pixel in 6.4 fixed point format. 0 means undefined.
+	 */
+	u16 dp_dsc_bpp_x16;
+
 	/**
 	 * @vics: Array of vics_len VICs. Internal to EDID parsing.
 	 */
-- 
2.51.2
