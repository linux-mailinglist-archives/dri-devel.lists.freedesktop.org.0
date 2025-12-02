Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAC3C9B414
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 12:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC3D10E61C;
	Tue,  2 Dec 2025 11:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="qCJd8ACe";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="qNTPJahk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346E210E61B;
 Tue,  2 Dec 2025 11:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764673364; bh=mMVF9F5ivLgdaRrSFpWUdY9
 2OM3S8hL4DQz5bXExt80=; b=qCJd8ACevc7Gpr/dY31UJV808Zff2NQSihFOEeYu9TppEKzdNA
 F+VGm+XDbd4h4KeMsNyES8YzUgAEc2iZ8AwAZaybx8PLBmdVUjop6Jf8l56x/nBtvSCmjw2L2tf
 Tf69+LTGNjgeJczf49WMkEoWxQcBTbj+j9ZMuKx71FmpSV3HdGtY5fWhJnAFOZeLX6kdtfnrbXv
 bPcKdOHupZRgFHyiFevXmdZb0sbWfRi3XVDEaWMEL180EATAsTDn3Mzd2r9aVJbK8gZwMlbZuEV
 KWe0KABqLEX77Lpam0CO6JJFXttl4zkPH9elUO7Iz4giaLgoi5ggJ1dqDcbbyT1CdFg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764673364; bh=mMVF9F5ivLgdaRrSFpWUdY9
 2OM3S8hL4DQz5bXExt80=; b=qNTPJahkG/kpDC04ShWjiGkvuTdzlF7b24xsIwyOY5XTKXweDm
 Gm32lIQ2loSx3nneb1ZYNnEstpkM4CRMjtBw==;
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
 Yaroslav Bolyukin <iam@lach.pw>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v7 2/7] drm/edid: prepare for VESA vendor-specific data block
 extension
Date: Tue,  2 Dec 2025 12:02:13 +0100
Message-ID: <20251202110218.9212-3-iam@lach.pw>
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

Current VESA vendor-specific block parsing expects real block size to be
the same as the defined struct size, use real offsets in conditionals
instead to add struct fields in future commits.

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 64f7a94dd9e4..a0a6ccf12475 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6544,7 +6544,7 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
 	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != VESA_IEEE_OUI)
 		return;
 
-	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
+	if (block->num_bytes < 5) {
 		drm_dbg_kms(connector->dev,
 			    "[CONNECTOR:%d:%s] Unexpected VESA vendor block size\n",
 			    connector->base.id, connector->name);
@@ -6567,24 +6567,22 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
 		break;
 	}
 
-	if (!info->mso_stream_count) {
-		info->mso_pixel_overlap = 0;
-		return;
-	}
-
-	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
-	if (info->mso_pixel_overlap > 8) {
+	if (info->mso_stream_count) {
+		info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
+		if (info->mso_pixel_overlap > 8) {
+			drm_dbg_kms(connector->dev,
+				    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
+				    connector->base.id, connector->name,
+				    info->mso_pixel_overlap);
+			info->mso_pixel_overlap = 8;
+		}
 		drm_dbg_kms(connector->dev,
-			    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
+			    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
 			    connector->base.id, connector->name,
-			    info->mso_pixel_overlap);
-		info->mso_pixel_overlap = 8;
+			    info->mso_stream_count, info->mso_pixel_overlap);
+	} else {
+		info->mso_pixel_overlap = 0;
 	}
-
-	drm_dbg_kms(connector->dev,
-		    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
-		    connector->base.id, connector->name,
-		    info->mso_stream_count, info->mso_pixel_overlap);
 }
 
 static void drm_update_vesa_specific_block(struct drm_connector *connector,
-- 
2.51.2
