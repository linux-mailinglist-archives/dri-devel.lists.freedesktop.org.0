Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35AB704651
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8135F10E309;
	Tue, 16 May 2023 07:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92B910E18E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 09:49:48 +0000 (UTC)
X-UUID: d0980c8ef30511edb20a276fd37b9834-20230515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=h57jZNHQL2sJ49TfskDCqEYES50/wJ+p6Hr89+KIa9A=; 
 b=AYMv+Vu5T7HFVdNKn5oi+lQzUxsVw7tiUNkuvKEakcohja2ccT78cGxdmTVHZy1aWMAV2nVKQB7qmBVDTt47+cBEyVVCyBsf4y8Oftsk1FJK9c8BoVvosfX1KrbpV0alJV+vQ456LvG0KkZxAjrUnHBonY6zatHLIzRuRBxDGuo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24, REQID:3e02afdb-3a39-439d-864b-b8abb403e06a, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:178d4d4, CLOUDID:ffacd96b-2f20-4998-991c-3b78627e4938,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: d0980c8ef30511edb20a276fd37b9834-20230515
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <shuijing.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 516129809; Mon, 15 May 2023 17:49:41 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 15 May 2023 17:49:41 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 15 May 2023 17:49:40 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <neil.armstrong@linaro.org>, <sam@ravnborg.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 2/2] drm/panel: boe-tv101wum-nl6: Fine tune the panel power
 sequence
Date: Mon, 15 May 2023 17:49:55 +0800
Message-ID: <20230515094955.15982-3-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515094955.15982-1-shuijing.li@mediatek.com>
References: <20230515094955.15982-1-shuijing.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Tue, 16 May 2023 07:27:39 +0000
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
Cc: jitao.shi@mediatek.com, Xinlei Lee <xinlei.lee@mediatek.com>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Shuijing Li <shuijing.li@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For "boe,tv105wum-nw0" this special panel, it is stipulated in
the panel spec that MIPI needs to keep the LP11 state before
the lcm_reset pin is pulled high.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index a5652d38acda..64e462f49c60 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -36,6 +36,7 @@ struct panel_desc {
 	const struct panel_init_cmd *init_cmds;
 	unsigned int lanes;
 	bool discharge_on_disable;
+	bool lp11_before_reset;
 };
 
 struct boe_panel {
@@ -1365,6 +1366,10 @@ static int boe_panel_prepare(struct drm_panel *panel)
 
 	usleep_range(10000, 11000);
 
+	if (boe->desc->lp11_before_reset) {
+		mipi_dsi_dcs_nop(boe->dsi);
+		usleep_range(1000, 2000);
+	}
 	gpiod_set_value(boe->enable_gpio, 1);
 	usleep_range(1000, 2000);
 	gpiod_set_value(boe->enable_gpio, 0);
@@ -1591,6 +1596,7 @@ static const struct panel_desc boe_tv105wum_nw0_desc = {
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 		      MIPI_DSI_MODE_LPM,
 	.init_cmds = boe_init_cmd,
+	.lp11_before_reset = true,
 };
 
 static const struct drm_display_mode starry_qfh032011_53g_default_mode = {
-- 
2.40.1

