Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A645A8CC7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 06:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5653C10E57B;
	Thu,  1 Sep 2022 04:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BC410E575
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 04:41:59 +0000 (UTC)
X-UUID: db16d5b2da2e42adaab6f54c490625b0-20220901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6hrAFATXkat2loNAgClkHHZ5w/POym9PfQu+eEy39cQ=; 
 b=D7dCpelAvb+ZC4sqxeAlatsu38UC2vxBX4AVNwY8oyRIqs0TVv4PwnjLCoLjocpKEYHHMp5tlucZLkwCKsmqkh5R0TC1iN9bv1QgQGTTcWtR0KnqiPa0Y2suEYmxt7mwYPzPl5Ul7z43Ijal5sfgwWy2Cxsr7XQmatBmfrNjWtA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:a9037643-66ef-4332-a349-000b35e27091, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
 e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18, CLOUDID:c5003c56-e800-47dc-8adf-0c936acf4f1b,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: db16d5b2da2e42adaab6f54c490625b0-20220901
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1579377247; Thu, 01 Sep 2022 12:41:53 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 1 Sep 2022 12:41:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Sep 2022 12:41:52 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <deller@gmx.de>, <airlied@linux.ie>
Subject: [PATCH v17 06/10] drm/mediatek: dp: Add multiple calibration data
 formats support
Date: Thu, 1 Sep 2022 12:41:45 +0800
Message-ID: <20220901044149.16782-7-rex-bc.chen@mediatek.com>
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

The calibration data formats of eDP and DP are different. We add
"const struct mtk_dp_efuse_fmt *efuse_fmt" to the device data to
define them.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 971bd744cdb2..136e13150281 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -113,8 +113,10 @@ struct mtk_dp {
 struct mtk_dp_data {
 	int bridge_type;
 	unsigned int smc_cmd;
+	const struct mtk_dp_efuse_fmt *efuse_fmt;
 };
-static const struct mtk_dp_efuse_fmt mtk_dp_efuse_data[MTK_DP_CAL_MAX] = {
+
+static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
 	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
 		.idx = 3,
 		.shift = 27,
@@ -811,7 +813,7 @@ static void mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
 	}
 
 	for (i = 0; i < MTK_DP_CAL_MAX; i++) {
-		fmt = &mtk_dp_efuse_data[i];
+		fmt = &mtk_dp->data->efuse_fmt[i];
 		cal_data[i] = (buf[fmt->idx] >> fmt->shift) & fmt->mask;
 
 		if (cal_data[i] < fmt->min_val || cal_data[i] > fmt->max_val) {
@@ -827,7 +829,7 @@ static void mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
 use_default_val:
 	dev_warn(mtk_dp->dev, "Use default calibration data\n");
 	for (i = 0; i < MTK_DP_CAL_MAX; i++)
-		cal_data[i] = mtk_dp_efuse_data[i].default_val;
+		cal_data[i] = mtk_dp->data->efuse_fmt[i].default_val;
 }
 
 static void mtk_dp_set_calibration_data(struct mtk_dp *mtk_dp)
@@ -1983,6 +1985,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 static const struct mtk_dp_data mt8195_edp_data = {
 	.bridge_type = DRM_MODE_CONNECTOR_eDP,
 	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
+	.efuse_fmt = mt8195_edp_efuse_fmt,
 };
 
 static const struct of_device_id mtk_dp_of_match[] = {
-- 
2.18.0

