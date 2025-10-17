Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25218BEAB17
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E10B10EC79;
	Fri, 17 Oct 2025 16:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="SdZ8/Tg6";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="pwafDzmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B1110EC79;
 Fri, 17 Oct 2025 16:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760718484; bh=tkZaVmRUXdPAjuJv58gTfdS
 fvXH8Wk5tCy/l7rSz2E4=; b=SdZ8/Tg6ZhrAMckZVyASP1JREdO7KvYPiSNbVktIDgwkryrAhb
 ks7Ex/wcg5RbW/seWTgMf6sxwN/g+NgdQ39UtVn0tE8k7TLVlAYBZOA/nEWSRRM3vchc/9S3afQ
 CE7WFG9ID258nHZKQFDyoGWrnposCZpb0xDqIrxAvvfOUqgHHyH13IPmkbdmze3l/+FNhl9+nVJ
 EKRSqOxZWctPm5BsdsQxRuPIwe2bJZA90t2U+WghfGXI3C1DW5psbwPXCkkP2dT/m8By6mDgIGg
 C1a9J1+KUHBG3zKKX5LUNHw9w8DgXs9w+Ca4K6ilGyCaudw9Pp5ZEOk9+OAlbRpn3YQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760718484; bh=tkZaVmRUXdPAjuJv58gTfdS
 fvXH8Wk5tCy/l7rSz2E4=; b=pwafDzmip/JEI2Frv5sDrI2Jrclax1j2N8a9zBdLUYSDopSNoD
 +AVcbiYg31S5N0vO9Xto9x/J3ag+6WUWNQBQ==;
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
Subject: [PATCH v5 3/7] drm/edid: MSO should only be used for non-eDP displays
Date: Fri, 17 Oct 2025 18:27:32 +0200
Message-ID: <20251017162736.45368-4-iam@lach.pw>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017162736.45368-1-iam@lach.pw>
References: <20251017162736.45368-1-iam@lach.pw>
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

As per DisplayID v2.1a spec:
If Offset 06h[2:0] is programmed to 001b (External DisplayPort), this field shallbe cleared to 00b (Not supported).

Ref: https://lore.kernel.org/lkml/3abc1087618c822e5676e67a3ec2e64e506dc5ec@intel.com/
Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/drm_displayid_internal.h |  4 +++
 drivers/gpu/drm/drm_edid.c               | 36 +++++++++++++++---------
 2 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
index 957dd0619f5c..cf02647b41b4 100644
--- a/drivers/gpu/drm/drm_displayid_internal.h
+++ b/drivers/gpu/drm/drm_displayid_internal.h
@@ -142,9 +142,13 @@ struct displayid_formula_timing_block {
 	struct displayid_formula_timings_9 timings[];
 } __packed;
 
+#define DISPLAYID_VESA_DP_TYPE		GENMASK(2, 0)
 #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
 #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
 
+#define DISPLAYID_VESA_DP_TYPE_EDP	0
+#define DISPLAYID_VESA_DP_TYPE_DP	1
+
 struct displayid_vesa_vendor_specific_block {
 	struct displayid_block base;
 	u8 oui[3];
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 725ae5f9d160..13df2854617c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6530,6 +6530,7 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
 	struct displayid_vesa_vendor_specific_block *vesa =
 		(struct displayid_vesa_vendor_specific_block *)block;
 	struct drm_display_info *info = &connector->display_info;
+	int dp_type;
 
 	if (block->num_bytes < 3) {
 		drm_dbg_kms(connector->dev,
@@ -6548,20 +6549,29 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
 		return;
 	}
 
-	switch (FIELD_GET(DISPLAYID_VESA_MSO_MODE, vesa->mso)) {
-	default:
-		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Reserved MSO mode value\n",
+	dp_type = FIELD_GET(DISPLAYID_VESA_DP_TYPE, vesa->data_structure_type);
+	if (dp_type > 1) {
+		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Reserved dp type value\n",
 			    connector->base.id, connector->name);
-		fallthrough;
-	case 0:
-		info->mso_stream_count = 0;
-		break;
-	case 1:
-		info->mso_stream_count = 2; /* 2 or 4 links */
-		break;
-	case 2:
-		info->mso_stream_count = 4; /* 4 links */
-		break;
+	}
+
+	/* MSO is not supported for eDP */
+	if (dp_type != DISPLAYID_VESA_DP_TYPE_EDP) {
+		switch (FIELD_GET(DISPLAYID_VESA_MSO_MODE, vesa->mso)) {
+		default:
+			drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Reserved MSO mode value\n",
+				    connector->base.id, connector->name);
+			fallthrough;
+		case 0:
+			info->mso_stream_count = 0;
+			break;
+		case 1:
+			info->mso_stream_count = 2; /* 2 or 4 links */
+			break;
+		case 2:
+			info->mso_stream_count = 4; /* 4 links */
+			break;
+		}
 	}
 
 	if (info->mso_stream_count) {
-- 
2.51.0
