Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F03D7B4CAC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 09:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0394D10E061;
	Mon,  2 Oct 2023 07:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from halley.uberspace.de (halley.uberspace.de [185.26.156.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB80010E1FD
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Oct 2023 11:48:27 +0000 (UTC)
Received: (qmail 19704 invoked by uid 498); 1 Oct 2023 11:48:25 -0000
Authentication-Results: halley.uberspace.de;
	auth=pass (plain)
From: Kai Uwe Broulik <foss-linux@broulik.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: panel-orientation-quirks: Add quirk for One Mix 2S
Date: Sun,  1 Oct 2023 13:47:10 +0200
Message-Id: <20231001114710.336172-1-foss-linux@broulik.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.986423) MIME_GOOD(-0.1)
 R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.586423
Received: from unknown (HELO unkown) (::1)
 by halley.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Sun, 01 Oct 2023 13:48:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broulik.de; s=uberspace;
 h=from; bh=D5MBsAkyvt0fqWpX/dd/Wz1+4BBD8R0ZGdeNAsn88Qg=;
 b=ActS/PrcHuFhGo6d9xJaGCb/O0eO/AZDvVqlNBDxwSTRnPlVkg9Vn8TdX70IRBY3AAWkD4aorD
 W/Zer4lobybEMn71cyfUZ62t7cZr8S3vfDqJtr1LXOa0xIVXTUk75k5hiTgYkp5Y1oSENmUO/mCd
 L+UUQ6h8ecQn78Pt5GBSxF6MrSuwxN1AUVdGJ1IATUrGyqMNz0na7ayFcTkHveIWWICoWCbnbXvK
 tpoKaQK20KKhf8pSAJlvvGr6Fl5Fb7hi4vNlP+cyHXL14FbW2CLrGZlRTipFOB3zxPPN1ivFnY8O
 Uds3alYB347Ps0yMH8Utk+qXEYxZoCi8/EXTncO+wI5ETIi7CPWT+aD2A6UzKUUx5b+tWfhDimqy
 /jF49eef9QMf/2svbCFEditSt3QYuzi1hTBsU4RW1aa8Xn+O8rA9wmbeG7Cc2bzDE92hoedfnGih
 kCwrW3Qt90v0RhXMel2HtpTxnjsCTBqK1GMXAV+v0uOP5A7WDqqx/BB2dW3eNLk9xsKMEkmj9Q4l
 liIyMYgqFXAB4yM1Sq22a5kTRGvemmOdMGX9lm1iHTTP6p909tkuXt6PnWC+UxlNIvXJ4Kz6B2MG
 BkeZHzzs4CBfSFm/YPdE3mkWlvXBK3pfwviAoGJWpOeoovS2TU167PVny7PIKD4uQdPOn+JgwIKo
 I=
X-Mailman-Approved-At: Mon, 02 Oct 2023 07:39:30 +0000
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
Cc: Kai Uwe Broulik <foss-linux@broulik.de>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The One Mix 2S is a mini laptop with a 1200x1920 portrait screen
mounted in a landscape oriented clamshell case. Because of the too
generic DMI strings this entry is also doing bios-date matching.

Signed-off-by: Kai Uwe Broulik <foss-linux@broulik.de>
---
Changes since v1:
* Got two more BIOS dates reported

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 0cb646cb04ee..d5c15292ae93 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -38,6 +38,14 @@ static const struct drm_dmi_panel_orientation_data gpd_micropc = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data gpd_onemix2s = {
+	.width = 1200,
+	.height = 1920,
+	.bios_dates = (const char * const []){ "05/21/2018", "10/26/2018",
+		"03/04/2019", NULL },
+	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data gpd_pocket = {
 	.width = 1200,
 	.height = 1920,
@@ -401,6 +409,14 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LTH17"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* One Mix 2S (generic strings, also match on bios date) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Default string"),
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Default string"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
+		},
+		.driver_data = (void *)&gpd_onemix2s,
 	},
 	{}
 };
-- 
2.34.1

