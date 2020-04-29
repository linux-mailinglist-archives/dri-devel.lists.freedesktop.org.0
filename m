Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4141BDB74
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 14:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3BD6EAB6;
	Wed, 29 Apr 2020 12:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE0C6EAB6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 12:10:29 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TCARvl063448
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 07:10:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1588162227;
 bh=tG2mE5xsoq/ZjnSoa1q/MX1MiQadsmeEKVE/NFK4NFo=;
 h=From:To:CC:Subject:Date;
 b=FCtIrls0L40IwOQOcMJMzEwrRDnO+gKEmXNKsrI26wgZbV3iMeRGtb/sDva6cR5Ti
 iOUqkAIf74XL4F6m/bNmpivwVXC/4BDOJTY0XHrv+crDHnuOg6eoylFveHQETJa/Qi
 KrqTbDQ8djABN85wckgxehoL/FyjjmxwoeXUga78=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TCARxl091342
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 07:10:27 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 07:10:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 07:10:27 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TCAQLu075160;
 Wed, 29 Apr 2020 07:10:26 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>
Subject: [PATCH] drm/tidss: remove AM65x PG1 YUV erratum code
Date: Wed, 29 Apr 2020 15:10:22 +0300
Message-ID: <20200429121022.3871-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AM65x PG1 has a HW issue with YUV pixel formats, resulting in wrong
colors on the screen. This issue is fixed in PG2 hardware.

The driver currently has code to hide YUV pixel formats from the
userspace. To support PG2, we would need to add code to detect the SoC
version and hide the YUV formats based on that.

However, as PG1 will be phased out and PG2 will be the main platform, a
much simpler solution is just to drop the code in question. The downside
is that the users will be able to use YUV formats on PG1, getting wrong
colors on the screen. On the other hand, that may also be a plus, as the
same applications will now work on PG1 and PG2, even if the colors are
wrong on PG1.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 11 ++---------
 drivers/gpu/drm/tidss/tidss_dispc.h |  5 -----
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 29f42768e294..629dd06393f6 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -181,10 +181,6 @@ const struct dispc_features dispc_am65x_feats = {
 	.vid_name = { "vid", "vidl1" },
 	.vid_lite = { false, true, },
 	.vid_order = { 1, 0 },
-
-	.errata = {
-		.i2000 = true,
-	},
 };
 
 static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
@@ -2674,12 +2670,9 @@ int dispc_init(struct tidss_device *tidss)
 		return -ENOMEM;
 
 	num_fourccs = 0;
-	for (i = 0; i < ARRAY_SIZE(dispc_color_formats); ++i) {
-		if (feat->errata.i2000 &&
-		    dispc_fourcc_is_yuv(dispc_color_formats[i].fourcc))
-			continue;
+	for (i = 0; i < ARRAY_SIZE(dispc_color_formats); ++i)
 		dispc->fourccs[num_fourccs++] = dispc_color_formats[i].fourcc;
-	}
+
 	dispc->num_fourccs = num_fourccs;
 	dispc->tidss = tidss;
 	dispc->dev = dev;
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index a4a68249e44b..1228b166b255 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -46,10 +46,6 @@ struct dispc_features_scaling {
 	u32 xinc_max;
 };
 
-struct dispc_errata {
-	bool i2000; /* DSS Does Not Support YUV Pixel Data Formats */
-};
-
 enum dispc_vp_bus_type {
 	DISPC_VP_DPI,		/* DPI output */
 	DISPC_VP_OLDI,		/* OLDI (LVDS) output */
@@ -84,7 +80,6 @@ struct dispc_features {
 	bool vid_lite[TIDSS_MAX_PLANES];
 	u32 vid_order[TIDSS_MAX_PLANES];
 
-	struct dispc_errata errata;
 };
 
 extern const struct dispc_features dispc_k2g_feats;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
