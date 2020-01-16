Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E2F13D1FE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 03:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14506EBB0;
	Thu, 16 Jan 2020 02:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id D4B8C6EBB0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 02:15:29 +0000 (UTC)
X-UUID: f6febd604f064cc2878b7004d03748cc-20200116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+VvUdG5czMFQ6vj3bLpdxYbfWO+M89EVYUK9328VdMQ=; 
 b=GlLuzYVEcGzvZ/TfRlq0XpBvBVsSvecEtKzkYW/UddzGodIpT6fZI8Tqb0+hCHCf4do/OVcJE5buLB2I8WWIrMMmxzFJ+gS4PKpfO05OXwLsrUgculvnkPQhwbIySRJHyxXV+Lhf5PGrZSaNemi+s5OM3yB/1zGP0qtJ4QcqMlA=;
X-UUID: f6febd604f064cc2878b7004d03748cc-20200116
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 550764611; Thu, 16 Jan 2020 10:15:24 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 16 Jan 2020 10:12:06 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 16 Jan 2020 10:14:29 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 4/5] drm/panel: support for boe,
 tv101wum-n53 wuxga dsi video mode panel
Date: Thu, 16 Jan 2020 10:15:10 +0800
Message-ID: <20200116021511.22675-5-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200116021511.22675-1-jitao.shi@mediatek.com>
References: <20200116021511.22675-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FAF22AD0A3DD6B2AF3AB04947F472BD4E082D584A9AAFC91FC73C7D0AC42B8AB2000:8
X-MTK: N
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Boe,tv101wum-n53's connector is same as boe,tv101wum-nl6.
The most codes can be reuse.
So boe,tv101wum-n53 and boe,tv101wum-nl6 use one driver file.
Add the different parts in driver data.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 2160144ca51b..e77ea577d93a 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -593,6 +593,34 @@ static const struct panel_desc auo_kd101n80_45na_desc = {
 	.discharge_on_disable = true,
 };
 
+static const struct drm_display_mode boe_tv101wum_n53_default_mode = {
+	.clock = 159916,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 80,
+	.hsync_end = 1200 + 80 + 24,
+	.htotal = 1200 + 80 + 24 + 40,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 20,
+	.vsync_end = 1920 + 20 + 4,
+	.vtotal = 1920 + 20 + 4 + 10,
+	.vrefresh = 60,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct panel_desc boe_tv101wum_n53_desc = {
+	.modes = &boe_tv101wum_n53_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 135,
+		.height_mm = 216,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init_cmds = boe_init_cmd,
+};
+
 static int boe_panel_get_modes(struct drm_panel *panel,
 			       struct drm_connector *connector)
 {
@@ -725,6 +753,9 @@ static const struct of_device_id boe_of_match[] = {
 	{ .compatible = "auo,kd101n80-45na",
 	  .data = &auo_kd101n80_45na_desc
 	},
+	{ .compatible = "boe,tv101wum-n53",
+	  .data = &boe_tv101wum_n53_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, boe_of_match);
-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
