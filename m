Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF216A2FEA
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 15:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447D310E0E6;
	Sun, 26 Feb 2023 14:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 460 seconds by postgrey-1.36 at gabe;
 Sun, 26 Feb 2023 14:19:15 UTC
Received: from forward105j.mail.yandex.net (forward105j.mail.yandex.net
 [5.45.198.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D7F10E0E6;
 Sun, 26 Feb 2023 14:19:15 +0000 (UTC)
Received: from iva2-656890eaceb5.qloud-c.yandex.net
 (iva2-656890eaceb5.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:6902:0:640:6568:90ea])
 by forward105j.mail.yandex.net (Yandex) with ESMTP id AD4604EC894E;
 Sun, 26 Feb 2023 17:11:26 +0300 (MSK)
Received: by iva2-656890eaceb5.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id tATvDFdaca61-3BIj2fmR; Sun, 26 Feb 2023 17:11:25 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lach.pw; s=mail;
 t=1677420686; bh=WCeZwLUOEBKexfa/7u2+rQMXS0gvx0CaGysSJoeK89Q=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=XB+45PhK8q59oOnfG2pxmN0+6rYNEUdPO4jgO5jZKH8wbkpiNICukBKb01jjQOb7r
 wnoKOvNmZFrZusvgfuKJMonK5nQF6q7Q7658XWAdPKJOsp2YdaO07CT+nEfhX0FjVV
 1ybZR9if96vPutvx8UI9fCwa/QvfPrQ9dLEK8LiM=
Authentication-Results: iva2-656890eaceb5.qloud-c.yandex.net;
 dkim=pass header.i=@lach.pw
From: Yaroslav Bolyukin <iam@lach.pw>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] drm/edid: parse DRM VESA dsc bpp target
Date: Sun, 26 Feb 2023 15:10:50 +0100
Message-Id: <20230226141051.21767-2-iam@lach.pw>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230226141051.21767-1-iam@lach.pw>
References: <20230226141051.21767-1-iam@lach.pw>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Jani Nikula <jani.nikula@intel.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yaroslav Bolyukin <iam@lach.pw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per DisplayID v2.0 Errata E9 spec "DSC pass-through timing support"
VESA vendor-specific data block may contain target DSC bits per pixel
fields

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/drm_edid.c  | 38 +++++++++++++++++++++++++------------
 include/drm/drm_connector.h |  6 ++++++
 include/drm/drm_displayid.h |  4 ++++
 3 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 3d0a4da661bc..aa88ac82cbe0 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6338,7 +6338,7 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != VESA_IEEE_OUI)
 		return;
 
-	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
+	if (block->num_bytes < 5) {
 		drm_dbg_kms(connector->dev,
 			    "[CONNECTOR:%d:%s] Unexpected VESA vendor block size\n",
 			    connector->base.id, connector->name);
@@ -6361,24 +6361,37 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 		break;
 	}
 
-	if (!info->mso_stream_count) {
-		info->mso_pixel_overlap = 0;
-		return;
-	}
+	info->mso_pixel_overlap = 0;
+
+	if (info->mso_stream_count) {
+		info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
+
+		if (info->mso_pixel_overlap > 8) {
+			drm_dbg_kms(connector->dev,
+				    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
+				    connector->base.id, connector->name,
+				    info->mso_pixel_overlap);
+			info->mso_pixel_overlap = 8;
+		}
 
-	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
-	if (info->mso_pixel_overlap > 8) {
 		drm_dbg_kms(connector->dev,
-			    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
+			    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
 			    connector->base.id, connector->name,
-			    info->mso_pixel_overlap);
-		info->mso_pixel_overlap = 8;
+			    info->mso_stream_count, info->mso_pixel_overlap);
+	}
+
+	if (block->num_bytes < 7) {
+		/* DSC bpp is optional */
+		return;
 	}
 
+	info->dp_dsc_bpp = FIELD_GET(DISPLAYID_VESA_DSC_BPP_INT, vesa->dsc_bpp_int) * 16
+		+ FIELD_GET(DISPLAYID_VESA_DSC_BPP_FRACT, vesa->dsc_bpp_fract);
+
 	drm_dbg_kms(connector->dev,
-		    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
+		    "[CONNECTOR:%d:%s] DSC bits per pixel %u\n",
 		    connector->base.id, connector->name,
-		    info->mso_stream_count, info->mso_pixel_overlap);
+		    info->dp_dsc_bpp);
 }
 
 static void drm_update_mso(struct drm_connector *connector,
@@ -6425,6 +6438,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	info->mso_stream_count = 0;
 	info->mso_pixel_overlap = 0;
 	info->max_dsc_bpp = 0;
+	info->dp_dsc_bpp = 0;
 
 	kfree(info->vics);
 	info->vics = NULL;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 7b5048516185..1d01e0146a7f 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -719,6 +719,12 @@ struct drm_display_info {
 	 */
 	u32 max_dsc_bpp;
 
+	/**
+	 * @dp_dsc_bpp: DP Display-Stream-Compression (DSC) timing's target
+	 * DST bits per pixel in 6.4 fixed point format. 0 means undefined
+	 */
+	u16 dp_dsc_bpp;
+
 	/**
 	 * @vics: Array of vics_len VICs. Internal to EDID parsing.
 	 */
diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
index 49649eb8447e..0fc3afbd1675 100644
--- a/include/drm/drm_displayid.h
+++ b/include/drm/drm_displayid.h
@@ -131,12 +131,16 @@ struct displayid_detailed_timing_block {
 
 #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
 #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
+#define DISPLAYID_VESA_DSC_BPP_INT	GENMASK(5, 0)
+#define DISPLAYID_VESA_DSC_BPP_FRACT	GENMASK(3, 0)
 
 struct displayid_vesa_vendor_specific_block {
 	struct displayid_block base;
 	u8 oui[3];
 	u8 data_structure_type;
 	u8 mso;
+	u8 dsc_bpp_int;
+	u8 dsc_bpp_fract;
 } __packed;
 
 /* DisplayID iteration */
-- 
2.39.1

