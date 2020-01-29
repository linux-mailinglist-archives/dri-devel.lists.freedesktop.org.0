Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1781A14CF37
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 18:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F07B89836;
	Wed, 29 Jan 2020 17:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 56E346F5F3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 17:07:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,378,1574089200"; d="scan'208";a="37927966"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 30 Jan 2020 02:02:08 +0900
Received: from marian-VirtualBox.ree.adwin.renesas.com (unknown
 [10.226.36.164])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id EF90640083F5;
 Thu, 30 Jan 2020 02:02:06 +0900 (JST)
From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/panel: simple: Add EDT panel support
Date: Wed, 29 Jan 2020 17:01:58 +0000
Message-Id: <1580317318-32071-3-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580317318-32071-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
References: <1580317318-32071-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
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
Cc: Chris Paterson <chris.paterson2@renesas.com>,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

EDT ET043080DH6-GP is a 4.3" WQVGA 480x272 RGB LCD panel used on the iWave
Generic SODIMM Development Platform.

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5d48768..aa64790 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1268,6 +1268,36 @@ static const struct panel_desc edt_et035012dm6 = {
 	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
 };
 
+static const struct drm_display_mode edt_etm043080dh6gp_mode = {
+	.clock = 10870,
+	.hdisplay = 480,
+	.hsync_start = 480 + 8,
+	.hsync_end = 480 + 8 + 4,
+	.htotal = 480 + 8 + 4 + 41,
+
+	/*
+	 * IWG22M: Y resolution changed for "dc_linuxfb" module crashing while
+	 * fb_align
+	 */
+
+	.vdisplay = 288,
+	.vsync_start = 288 + 2,
+	.vsync_end = 288 + 2 + 4,
+	.vtotal = 288 + 2 + 4 + 10,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc edt_etm043080dh6gp = {
+	.modes = &edt_etm043080dh6gp_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 100,
+		.height = 65,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+};
+
 static const struct drm_display_mode edt_etm0430g0dh6_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -3189,6 +3219,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "edt,et035012dm6",
 		.data = &edt_et035012dm6,
 	}, {
+		.compatible = "edt,etm043080dh6gp",
+		.data = &edt_etm043080dh6gp,
+	}, {
 		.compatible = "edt,etm0430g0dh6",
 		.data = &edt_etm0430g0dh6,
 	}, {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
