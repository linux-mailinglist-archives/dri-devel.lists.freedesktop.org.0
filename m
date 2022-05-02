Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5F65175A9
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 19:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A7410EB2C;
	Mon,  2 May 2022 17:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 450 seconds by postgrey-1.36 at gabe;
 Mon, 02 May 2022 17:18:27 UTC
Received: from forward103j.mail.yandex.net (forward103j.mail.yandex.net
 [IPv6:2a02:6b8:0:801:2::106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAA210EB2C;
 Mon,  2 May 2022 17:18:27 +0000 (UTC)
Received: from forward101q.mail.yandex.net (forward101q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb98])
 by forward103j.mail.yandex.net (Yandex) with ESMTP id 22C80100A0A;
 Mon,  2 May 2022 20:10:55 +0300 (MSK)
Received: from vla1-692e383ae130.qloud-c.yandex.net
 (vla1-692e383ae130.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:4e82:0:640:692e:383a])
 by forward101q.mail.yandex.net (Yandex) with ESMTP id 1D94E13E80013;
 Mon,  2 May 2022 20:10:55 +0300 (MSK)
Received: from vla3-3dd1bd6927b2.qloud-c.yandex.net
 (vla3-3dd1bd6927b2.qloud-c.yandex.net [2a02:6b8:c15:350f:0:640:3dd1:bd69])
 by vla1-692e383ae130.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 wAlxiCjCOW-Arg8C3hQ; Mon, 02 May 2022 20:10:55 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lach.pw; s=mail;
 t=1651511455; bh=EL8vW3m6OCPjznoXCXY4p2BDvFflry15CcmJdzjBFzA=;
 h=In-Reply-To:References:Date:Subject:Cc:To:From:Message-Id;
 b=RPvmFqyXyvXTbC7t2B4nTfJalnZxzc+ZnNhCz/ep8OGSnG0IjIKX1qMACxgxOCGil
 lxgKYO5D8uCFhUUwa9VNVNUD08ctt9zK+iVWnseEnYmWJgpGb86KnMj4bsF4jwceOQ
 NbqsrEgGtiuYr7bGiUu85sqiRrFPQCTzAQgkBBi4=
Authentication-Results: vla1-692e383ae130.qloud-c.yandex.net;
 dkim=pass header.i=@lach.pw
Received: by vla3-3dd1bd6927b2.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id xTgxo8AHyR-ApMSX4BE; Mon, 02 May 2022 20:10:52 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Yaroslav Bolyukin <iam@lach.pw>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [RESEND PATCH v2 1/2] drm/edid: parse DRM VESA dsc bpp target
Date: Mon,  2 May 2022 20:10:30 +0300
Message-Id: <20220502171031.11797-1-iam@lach.pw>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220151940.58327-1-iam@lach.pw>
References: <20220220151940.58327-1-iam@lach.pw>
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
 Xinhui" <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>, "Lin,
 Wayne" <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yaroslav Bolyukin <iam@lach.pw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per DisplayID v2.0 Errata E9 spec "DSC pass-through timing support"
VESA vendor-specific data block may contain target DSC bits per pixel
fields

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/drm_edid.c  | 33 ++++++++++++++++++++++-----------
 include/drm/drm_connector.h |  6 ++++++
 include/drm/drm_displayid.h |  4 ++++
 3 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bc43e1b32092..e2ced222a081 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5433,7 +5433,7 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != VESA_IEEE_OUI)
 		return;
 
-	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
+	if (block->num_bytes < 5) {
 		drm_dbg_kms(connector->dev, "Unexpected VESA vendor block size\n");
 		return;
 	}
@@ -5453,20 +5453,29 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
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
@@ -5511,6 +5520,8 @@ drm_reset_display_info(struct drm_connector *connector)
 
 	info->mso_stream_count = 0;
 	info->mso_pixel_overlap = 0;
+
+	info->dp_dsc_bpp = 0;
 }
 
 u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid)
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 3ac4bf87f257..77ce9515afc4 100644
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
index 7ffbd9f7bfc7..1be6deddcce3 100644
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

base-commit: 6a47a16dcef3fdda79a95452964d001a620db473
-- 
2.35.1

