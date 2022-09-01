Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CF05A8CC4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 06:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C6010E572;
	Thu,  1 Sep 2022 04:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60CC10E572
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 04:41:59 +0000 (UTC)
X-UUID: c6a0209cf4434120a7668b596b47d92f-20220901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=MT469mAZdLOi7u1NfcVVV5Shgb4xV/KUjyRx5iYdafI=; 
 b=T8/VsQgGE2YVyHVXE1DWtAFBaR7Ldei8MRPC+uUXqH14cPoF0Um6uVfqO2RKG6qzOmI6Bmcg/cA8qyz2vgYML0nr+3dEKcWMlg3PJr32f5/U7F94NA21/sQL1+LDnl/4g3ZCvJsy3iP+Vus0gjnAIUbtTvgDuhV3IFLNY+HzAX4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:637be048-694a-49b1-9391-82455f00906f, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
 e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18, CLOUDID:c6003c56-e800-47dc-8adf-0c936acf4f1b,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c6a0209cf4434120a7668b596b47d92f-20220901
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1206241032; Thu, 01 Sep 2022 12:41:53 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Sep 2022 12:41:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Sep 2022 12:41:52 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <deller@gmx.de>, <airlied@linux.ie>
Subject: [PATCH v17 05/10] drm/mediatek: dp: Add multiple smc commands support
Date: Thu, 1 Sep 2022 12:41:44 +0800
Message-ID: <20220901044149.16782-6-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The smc commands of eDP and DP are different. We add smc_cmd to the
device data to define them.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 2696c1ac1a47..971bd744cdb2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -112,6 +112,7 @@ struct mtk_dp {
 
 struct mtk_dp_data {
 	int bridge_type;
+	unsigned int smc_cmd;
 };
 static const struct mtk_dp_efuse_fmt mtk_dp_efuse_data[MTK_DP_CAL_MAX] = {
 	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
@@ -945,11 +946,11 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 			   VIDEO_MUTE_SW_DP_ENC0_P0);
 
 	arm_smccc_smc(MTK_DP_SIP_CONTROL_AARCH32,
-		      MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable,
+		      mtk_dp->data->smc_cmd, enable,
 		      0, 0, 0, 0, 0, &res);
 
 	dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
-		MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable, res.a0, res.a1);
+		mtk_dp->data->smc_cmd, enable, res.a0, res.a1);
 }
 
 static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
@@ -1981,6 +1982,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 
 static const struct mtk_dp_data mt8195_edp_data = {
 	.bridge_type = DRM_MODE_CONNECTOR_eDP,
+	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
 };
 
 static const struct of_device_id mtk_dp_of_match[] = {
-- 
2.18.0

