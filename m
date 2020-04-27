Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E611BBDE7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760CE6E3B5;
	Tue, 28 Apr 2020 12:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id BBED16E0CB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:28:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.73,323,1583161200"; d="scan'208";a="45816403"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 27 Apr 2020 17:22:59 +0900
Received: from renesas-VirtualBox.ree.adwin.renesas.com (unknown
 [172.29.51.26])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id BC8874017274;
 Mon, 27 Apr 2020 17:22:55 +0900 (JST)
From: Gareth Williams <gareth.williams.jx@renesas.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/3] drm/panel: simple: Add Newhaven ATXL#-CTP panel
Date: Mon, 27 Apr 2020 09:21:49 +0100
Message-Id: <1587975709-2092-4-git-send-email-gareth.williams.jx@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587975709-2092-1-git-send-email-gareth.williams.jx@renesas.com>
References: <1587975709-2092-1-git-send-email-gareth.williams.jx@renesas.com>
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: Phil Edworthy <phil.edworthy@renesas.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Gareth Williams <gareth.williams.jx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit adds support for the Newhaven ATXL#-CTP panel used by the
Renesas RZ/N1 Demo Board.

Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5a93c4e..0b57b0e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2021,6 +2021,30 @@ static const struct panel_desc newhaven_nhd_43_480272ef_atxl = {
 		     DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
 };
 
+static const struct display_timing newhaven_nhd_50_800480tf_atxl_timing = {
+	.pixelclock = { 33300000, 33400000, 33500000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 40, 40, 40 },
+	.hback_porch = { 88, 88, 88 },
+	.hsync_len = { 1, 1, 1 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 13, 13, 13 },
+	.vback_porch = { 32, 32, 32 },
+	.vsync_len = { 3, 3, 3 },
+	.flags = DISPLAY_FLAGS_HSYNC_HIGH | DISPLAY_FLAGS_VSYNC_HIGH,
+};
+
+static const struct panel_desc newhaven_nhd_50_800480tf_atxl = {
+		.timings = &newhaven_nhd_50_800480tf_atxl_timing,
+		.num_timings = 1,
+		.bpc = 8,
+		.size = {
+			.width = 400,
+			.height = 300,
+		},
+		.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+};
+
 static const struct display_timing nlt_nl192108ac18_02d_timing = {
 	.pixelclock = { 130000000, 148350000, 163000000 },
 	.hactive = { 1920, 1920, 1920 },
@@ -2964,6 +2988,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "newhaven,nhd-4.3-480272ef-atxl",
 		.data = &newhaven_nhd_43_480272ef_atxl,
 	}, {
+		.compatible = "newhaven,nhd-5.0-800480tf-atxl",
+		.data = &newhaven_nhd_50_800480tf_atxl,
+	}, {
 		.compatible = "nlt,nl192108ac18-02d",
 		.data = &nlt_nl192108ac18_02d,
 	}, {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
