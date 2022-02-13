Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904014B3B91
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 14:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52EC10E1B9;
	Sun, 13 Feb 2022 13:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from forward100p.mail.yandex.net (forward100p.mail.yandex.net
 [77.88.28.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B38E10E1B9
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 13:32:18 +0000 (UTC)
Received: from forward101q.mail.yandex.net (forward101q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb98])
 by forward100p.mail.yandex.net (Yandex) with ESMTP id 480ED4F08177;
 Sun, 13 Feb 2022 16:32:13 +0300 (MSK)
Received: from vla1-25221a47e1d2.qloud-c.yandex.net
 (vla1-25221a47e1d2.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3c06:0:640:2522:1a47])
 by forward101q.mail.yandex.net (Yandex) with ESMTP id 4305513E80002;
 Sun, 13 Feb 2022 16:32:13 +0300 (MSK)
Received: from vla5-047c0c0d12a6.qloud-c.yandex.net
 (vla5-047c0c0d12a6.qloud-c.yandex.net [2a02:6b8:c18:3484:0:640:47c:c0d])
 by vla1-25221a47e1d2.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 iarXuVZ1oX-WCd0hlAt; Sun, 13 Feb 2022 16:32:13 +0300
X-Yandex-Fwd: 2
Authentication-Results: vla1-25221a47e1d2.qloud-c.yandex.net; dkim=pass
Received: by vla5-047c0c0d12a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id lKwSmfPfvd-WAIGJwTH; Sun, 13 Feb 2022 16:32:11 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Yaroslav Bolyukin <iam@lach.pw>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] edid: parse DRM VESA dsc bpp target
Date: Sun, 13 Feb 2022 16:31:27 +0300
Message-Id: <20220213133128.5833-1-iam@lach.pw>
X-Mailer: git-send-email 2.35.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yaroslav Bolyukin <iam@lach.pw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per DisplayID v2.0 Errata E9 spec

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/drm_edid.c  | 31 ++++++++++++++++++++-----------
 include/drm/drm_connector.h |  6 ++++++
 include/drm/drm_displayid.h |  4 ++++
 3 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index a7663f9a1..83ee685c8 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5270,7 +5270,7 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != VESA_IEEE_OUI)
 		return;
 
-	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
+	if (block->num_bytes < 5) {
 		drm_dbg_kms(connector->dev, "Unexpected VESA vendor block size\n");
 		return;
 	}
@@ -5290,20 +5290,29 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 		break;
 	}
 
-	if (!info->mso_stream_count) {
-		info->mso_pixel_overlap = 0;
-		return;
+	info->mso_pixel_overlap = 0;
+
+	if (info->mso_stream_count) {
+		info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
+		if (info->mso_pixel_overlap > 8) {
+			drm_dbg_kms(connector->dev, "Reserved MSO pixel overlap value %u\n",
+				info->mso_pixel_overlap);
+			info->mso_pixel_overlap = 8;
+		}
+
+		drm_dbg_kms(connector->dev, "MSO stream count %u, pixel overlap %u\n",
+			info->mso_stream_count, info->mso_pixel_overlap);
 	}
 
-	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
-	if (info->mso_pixel_overlap > 8) {
-		drm_dbg_kms(connector->dev, "Reserved MSO pixel overlap value %u\n",
-			    info->mso_pixel_overlap);
-		info->mso_pixel_overlap = 8;
+	if (block->num_bytes < 7) {
+		/* DSC bpp is optional */
+		return;
 	}
 
-	drm_dbg_kms(connector->dev, "MSO stream count %u, pixel overlap %u\n",
-		    info->mso_stream_count, info->mso_pixel_overlap);
+	info->dp_dsc_bpp = FIELD_GET(DISPLAYID_VESA_DSC_BPP_INT, vesa->dsc_bpp_int) * 16 +
+		FIELD_GET(DISPLAYID_VESA_DSC_BPP_FRACT, vesa->dsc_bpp_fract);
+
+	drm_dbg_kms(connector->dev, "DSC bits per pixel %u\n", info->dp_dsc_bpp);
 }
 
 static void drm_update_mso(struct drm_connector *connector, const struct edid *edid)
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5e36eb3df..04ef0e995 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -634,6 +634,12 @@ struct drm_display_info {
 	 * @mso_pixel_overlap: eDP MSO segment pixel overlap, 0-8 pixels.
 	 */
 	u8 mso_pixel_overlap;
+
+	/**
+	 * @dp_dsc_bpp: DP Display-Stream-Compression (DSC) timing's target
+	 * DST bits per pixel in 6.4 fixed point format. 0 means undefined
+	 */
+	u16 dp_dsc_bpp;
 };
 
 int drm_display_info_set_bus_formats(struct drm_display_info *info,
diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
index 7ffbd9f7b..1be6deddc 100644
--- a/include/drm/drm_displayid.h
+++ b/include/drm/drm_displayid.h
@@ -131,12 +131,16 @@ struct displayid_detailed_timing_block {
 
 #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
 #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
+#define DISPLAYID_VESA_DSC_BPP_INT	GENMASK(5, 0)
+#define DISPLAYID_VESA_DSC_BPP_FRACT GENMASK(3, 0)
 
 struct displayid_vesa_vendor_specific_block {
 	struct displayid_block base;
 	u8 oui[3];
 	u8 data_structure_type;
 	u8 mso;
+	u8 dsc_bpp_int;
+	u8 dsc_bpp_fract;
 } __packed;
 
 /* DisplayID iteration */

base-commit: 1528038385c0a706aac9ac165eeb24044fef6825
-- 
2.35.1

