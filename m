Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDECC8856F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 07:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D1B10E513;
	Wed, 26 Nov 2025 06:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="mOIkQpnd";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="XHLTXA3J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1421810E514;
 Wed, 26 Nov 2025 06:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764139914; bh=iaxEEdgH2YAVL2ApCrS8e3i
 bBCzX6SObbdVb4noOHbQ=; b=mOIkQpndX5Yx99dLSnVXh3hNhyRyM/r0WZUVWeEAxGXLpYOgnv
 guzST+oRkrfsz1/jfk8SRLgx3djz7m2Oa7I9+XYyL1V43KTsG7m2qgM45IaJGi8i8iwX2p5qYge
 1xfOnTojc+LBqZ15mxKui9ht3eJ4NtR1MZMCkUHjLN/TraAOuC9tr/+1c8M0wx7pUaeBXXSx1oC
 yOveni6TF6gfnosun8fYmHNHSvpS7cXjNdBQ08puVxaHV3CFruYvByr0/LR9dflbTE8iPXHCRn/
 QC8J3PgyXhgK6nw2H2syjf9PYE49SvbhVfNpFnyd7pH07NhG8lBGVp5OtwUKLZhObeQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764139914; bh=iaxEEdgH2YAVL2ApCrS8e3i
 bBCzX6SObbdVb4noOHbQ=; b=XHLTXA3JyZOZCArz6PYp+hulL5tLt7RMDAzOn3dgrAH0MFahl1
 6cKA16i2qFDk8WnJ4mOr81y4DN+Da26Z3YCQ==;
From: Yaroslav Bolyukin <iam@lach.pw>
To: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yaroslav Bolyukin <iam@lach.pw>
Subject: [PATCH v6 6/7] drm/edid: parse DRM VESA dsc bpp target
Date: Wed, 26 Nov 2025 07:51:25 +0100
Message-ID: <20251126065126.54016-7-iam@lach.pw>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251126065126.54016-1-iam@lach.pw>
References: <20251126065126.54016-1-iam@lach.pw>
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
---
 drivers/gpu/drm/drm_displayid_internal.h |  4 ++++
 drivers/gpu/drm/drm_edid.c               | 16 ++++++++++++++++
 include/drm/drm_connector.h              |  6 ++++++
 3 files changed, 26 insertions(+)

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
index 7bdc99d5084a..b2502be2e807 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6591,6 +6591,21 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
 			    connector->base.id, connector->name,
 			    info->mso_stream_count, info->mso_pixel_overlap);
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
+			    "[CONNECTOR:%d:%s] DSC bits per pixel x16 %u\n",
+			    connector->base.id, connector->name,
+			    info->dp_dsc_bpp_x16);
+	}
 }
 
 static void drm_update_vesa_specific_block(struct drm_connector *connector,
@@ -6639,6 +6654,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
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
