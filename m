Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DADC9B418
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 12:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1434610E61E;
	Tue,  2 Dec 2025 11:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="fizXDXuZ";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="iRS0rPgQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C34C10E619;
 Tue,  2 Dec 2025 11:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764673364; bh=Qh7YqhBCuHUkxJm9JuEEP0E
 bjHsrdO1GDFDIlcSDNtE=; b=fizXDXuZG64kcngL5Rk2LcjGulmW41f8PBznFKHl6rczAL8hcY
 4fKXee86cDAzLTm+8Nv0Ky3IWdxSU+tuupKF7HRtZDYk/KSrGKaCwmpyMmvLUmNELyScYTGChw+
 yfguGkthEoDvOiaKOz9Us52WBlDteCfd//TnqKNO7KdRm7JstjjKbl8VC8ttrcDSf7ISLuQBIjl
 jt15d9sTMKmbw8ziJlklW1GYHWJidO+LPWs1peb2S8/OusktDOQpNze/TdpyUdfbPoPRhm2lHbg
 0uQ9PIqVFCDTnUMoI64EKFS7pSpiI07heDuSdiaotgXNH/nZWopSB/4SOtmP3Cb8LEA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764673364; bh=Qh7YqhBCuHUkxJm9JuEEP0E
 bjHsrdO1GDFDIlcSDNtE=; b=iRS0rPgQzbC3s9eMbyaRYyV4mvwFIGUnplnqy49W8FlvzEYCNQ
 xZ5C+cqozqbhk2vJ8ZaZ7Tjh559+5UN2ejCg==;
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
Subject: [PATCH v7 3/7] drm/edid: MSO should only be used for non-eDP displays
Date: Tue,  2 Dec 2025 12:02:14 +0100
Message-ID: <20251202110218.9212-4-iam@lach.pw>
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

As per DisplayID v2.1a spec:
If Offset 06h[2:0] is programmed to 001b (External DisplayPort), this
field shall be cleared to 00b (Not supported).

Link: https://lore.kernel.org/lkml/3abc1087618c822e5676e67a3ec2e64e506dc5ec@intel.com/
Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/drm_displayid_internal.h |  4 +++
 drivers/gpu/drm/drm_edid.c               | 36 +++++++++++++++---------
 2 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
index 5b1b32f73516..72f107ae832f 100644
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
index a0a6ccf12475..380a9dda275f 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6533,6 +6533,7 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
 	struct displayid_vesa_vendor_specific_block *vesa =
 		(struct displayid_vesa_vendor_specific_block *)block;
 	struct drm_display_info *info = &connector->display_info;
+	int dp_type;
 
 	if (block->num_bytes < 3) {
 		drm_dbg_kms(connector->dev,
@@ -6551,20 +6552,29 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
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
+	/* MSO is only supported for eDP */
+	if (dp_type == DISPLAYID_VESA_DP_TYPE_EDP) {
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
2.51.2
