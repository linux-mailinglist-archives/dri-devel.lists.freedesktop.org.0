Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E42237821F3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 05:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096B610E17F;
	Mon, 21 Aug 2023 03:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2065.outbound.protection.outlook.com [40.107.104.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F21A10E17F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 03:37:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bm66Bj8reuknkHjYg1Judz4YAkSdC2sq4bl+G2IKdhtlji/Uu1pCuz6qiIT6kjGBrsqt8Vr7Sf8XAsN8EjvLvhzAYXgln7ZqVPJ1XiX5nXz9xsytkw8LZNM3UTZ0B/IH1u+MNnbMutjMgGsR8Jg4kilmdq6w2oeWOELittb+GOiFxrsJd8E+5SgUcKFazTGEaR4p6RHg+yugB95P8rt74i/77Oy3/Wn6Lnkein4ErOFZNx30BrgtN3yq737YWl2vTIMxeMnULmpfLcaIiPa2syJ/ORTvHQBp4V0pryBOwMmVLggFBza+bldhDzKM0HNS1tNqIvPEoIJXsDC+Cr8y2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WM7ENwdEZtTaAmUcvrIdGqtVTxouZ1RTlDFvwoB1mU8=;
 b=SOW15eTv/RZIZVmlWCPiUqiOeliMlSL03+Nj3fh3hJ2yl6fWhG33pqZWKBkf3ftVdZAig0yppB3LlEf3uqJFINioxjYoh3iZpaDRD4A9I2OqQfkzqP09NNNQDdPtsoIv/Le16PyVJMMtTuktGrMcvhF6xPAqxVsLK8zTVlNsBtLfk7/fsZlarDma2+CNVmZ45kCiCayKS8bHHzdeAfkfbnPu/b4Q4i14PhtEi9EwRc5S/wwIGaTneDKgnPEFutipikZzk+oFL5jR7zvjxH/SRJhl9xs9lF3vu3mYFJPLdh9ZFjMCM7f4qMymh1OJsyO9O3PH8zNcgetoXByEzWUx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WM7ENwdEZtTaAmUcvrIdGqtVTxouZ1RTlDFvwoB1mU8=;
 b=H3AAMNh0n+h8MEkN7FN/UvVlvYqrQfkIBb+ErtRg0eU1Z1rJUocnIze7poNhz1bg/ljBwmWc/JsrWSVKCwN1pWsGIEuDP0cE3sJFzHqw+UBcLXKEPq64mVpuiWdgrWX6xRAzFJVJ6UZCi9KjtxFSjEhu33SoJN9eH5Se6we6ZSo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7758.eurprd04.prod.outlook.com (2603:10a6:102:c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 03:37:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 03:37:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 RESEND 4/9] drm/bridge: synopsys: dw-mipi-dsi: Add mode
 fixup support
Date: Mon, 21 Aug 2023 11:40:03 +0800
Message-Id: <20230821034008.3876938-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230821034008.3876938-1-victor.liu@nxp.com>
References: <20230821034008.3876938-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: b12a76da-b188-479d-3d23-08dba1f7e7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JY7kP2XbWqx7zhKARuqd9vPh6nEtHsa5Bn0JNp9mUa06N2CDMVZt5+ca9fVBJI/PaehghEMmha+Q702Bq56lS44mGlNLUw6rNBnKgb/rZPozACEg9WhI7zrRuvnAPq80gcor4pmI/9Q/9O08rOW0NnVvLwMms0hixlV6O4PvfQU03FPPs7tXZo80G5mZwZ0XI+9g9zryNrUMsJcAAsYPSQYcRnIc5ofd0vUq4ra0R5mvzuyaAniJx6TLiqz9LyzVuthWTLmQTwzHalCWcdzGj2CatnrNLyBoskyPTSMO4esMGgx+0Ji0gSZr/PDCcudfCwj16POr4OhMgFHVl6BUrj11/jp2BlAFlhSYBCWBeCqo8VsRM/CMwG9DEIpxbQaqAoiDLs94i0m96p/xzduqCg9mzqceob/9MqLV2Cnj+YJfWy3GMY5miA4o8m+EkAdUxbZAgXUALrkRUwawxiWH+MjcMcI+hah2mQ35+ELcWXAGm8jaepnMjjcm3Ct1JDpfuvoYycVN0v2tU7TJuZ+hUe87M5tv9l1G8zqTNHRykB36eNNU55CMWNkHgL8eaACEB0jRvt66bt1Nbpymj/zY5sauI6NAZbOys955eQz32DpUJVXCPwCZgNHTOjYgqmIs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(186009)(1800799009)(451199024)(1076003)(2616005)(26005)(6512007)(38350700002)(38100700002)(36756003)(86362001)(83380400001)(316002)(8936002)(8676002)(41300700001)(66476007)(66556008)(66946007)(2906002)(4326008)(478600001)(7416002)(6506007)(6486002)(6666004)(52116002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3qpoe0ekEIzfyDRcTUYvGUOwCoY6xmPwBak4BaYSKwBOKSEwgm9DS5vLcZK5?=
 =?us-ascii?Q?zuhUm7+EaKxwJnwLoMezS2cRhvhUIS2wF29zV9sizAbwHQVRA44NrVq9y4p+?=
 =?us-ascii?Q?PmPy11BsVDm4Z6CCBij3fbI9xwyLvpJyJkS0vJPPENseOXa/qpoMAwiZ2MTI?=
 =?us-ascii?Q?EeChLzDnqw55tWHhvSvXE7aRPlSG9/was8GM6k8RHKYJvo6DdrJTam2qOP4N?=
 =?us-ascii?Q?uw9tPUvOJYBbV/ag5HMk740PvzCVKrm7kSfZkt0H5EU+MIN5S22Q5Y6S9lSh?=
 =?us-ascii?Q?mRou1B4jgk6Y18HKGMrkaqQo5ZM1YuvJugEgGXPOE+T1m6ausG9uGdBnkm9O?=
 =?us-ascii?Q?75pdq5lvCXTcrhWVHPzGwSQjgKJH8/4YqcP4tQQ5GYqeSBtraLyiUM2iwcUd?=
 =?us-ascii?Q?zefo0JxwLwqzP54pakv1d0Z+RQYQDAj9Kik3jkD1qqsck81T1ROBTOVy5/oR?=
 =?us-ascii?Q?fyv43TPc2HUOvMTflonecXdUR1JiW/BMuVYF3BBFiPsB6/vEMBlLdlBTZhwb?=
 =?us-ascii?Q?/Idwkxjjg81GNuurUAcRaiKvRz9NOMjGa5W96tGZlhTmqUiMfFsYAqTN8xXH?=
 =?us-ascii?Q?xBO7eTHglFgQ4wUjSL5JI4r0FINbnrajVecvZZoyJVU1AFtTKgkfi067IJyQ?=
 =?us-ascii?Q?lxb6yYsIVmgivA/qWR6MsMBLrqjbiQeBUjh5dTK85GYS3JxqQkjJI3zLEpGp?=
 =?us-ascii?Q?kC2A0vH9uqYlvdI41f6OGeI/L1Ekdo5b3/6Vr4Ml8286RU0BK7XUGaOl8EKW?=
 =?us-ascii?Q?MNgW5qozrEBDW5LgrlC8hzdFf0VH6RlQIl5li0E8rDVO7SvxnEYxypwpZxai?=
 =?us-ascii?Q?kPJbaWvt6ziIJ6JGFshqEJmgy7agjgCSJ/Jp5ToXG61q9qRayEw88T151rD6?=
 =?us-ascii?Q?0ADg5MTHQoBEjlD0WWPCbxKMpYsJImWvRUdlVZSCS8253y08hB2h04dVQmEw?=
 =?us-ascii?Q?01xphNcuVYlN3VzSUKq0uRMU+A2cXo4sKvYFpW4T0T/NSC8ozwO2KThh0VSM?=
 =?us-ascii?Q?CI4YaaNWwFsm+OnCpuWjtscK2Cy2bMJPk5VJkmkMVWy/gCHi/ICFZBwUrNly?=
 =?us-ascii?Q?ugoWEUCFKX+L1YXhtmGn8dB2bdiejta9ner3q5g29qpRM6l8dyZ0/KyuWWRP?=
 =?us-ascii?Q?/4vhMFoABm/Ydn85AI839GhX+l1q/cZouh6NWCUb2wK6esmUA3uR1SORPb55?=
 =?us-ascii?Q?ALWgzebEzbQ6H4VLHg3dS60XwR19+uQgRgHXwgihUKgvfUIi8AReFPeVfmB6?=
 =?us-ascii?Q?jwADQaWXmnY2eUkkZ1QS4/lNl5jgAWAOTIv3Nbi7KnIkzE7mm0GU9D2/NFVc?=
 =?us-ascii?Q?Dqr5YAAHfbTj6uKJ2J6R9LRG1v47EAPaYg8KRICElTPAIGD9/0Zk09pmH2vO?=
 =?us-ascii?Q?R4JxAmK2TvvIDytbXnPD40THLPRefCCFY7m8h/KqRBdY62gqoNkBsbckQzl7?=
 =?us-ascii?Q?ydr+A6suVCKN25irBfLz3vQLO3LncqPDorEWUC4k4xMejlK4Nf+TrpotAUvH?=
 =?us-ascii?Q?s77IXlhjv1CRGBnCm0viY0MoUkGVVzIYokouPWQIGPd+is3TSXVSNw46oxS/?=
 =?us-ascii?Q?Kc1W+337/Btja76YBn7mIiD1zcZO5aJUM4wTUzg2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b12a76da-b188-479d-3d23-08dba1f7e7b4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 03:37:12.1784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3FmkEvupHMYvp5BOithh9O4/jEHGKmR72s7QU0oGsRBhvgnzWKlvTOf4zTF28Odvbnt8MHCgVMsagaleoiwRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7758
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
Cc: andrzej.hajda@intel.com, alexander.stein@ew.tq-group.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 zyw@rock-chips.com, rfoss@kernel.org, sam@ravnborg.org,
 raphael.gallais-pou@foss.st.com, jernej.skrabec@gmail.com,
 jagan@amarulasolutions.com, linux-imx@nxp.com, conor+dt@kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, neil.armstrong@linaro.org, yannick.fertre@foss.st.com,
 hjc@rock-chips.com, philippe.cornu@foss.st.com, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vendor drivers may need to fixup mode due to pixel clock tree limitation,
so introduce the ->mode_fixup() callcack to struct dw_mipi_dsi_plat_data
and call it at atomic check stage if available.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v3:
* No change.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 14 ++++++++++++++
 include/drm/bridge/dw_mipi_dsi.h              |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index ed9288a9c444..b2da803c9de7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -573,9 +573,23 @@ static int dw_mipi_dsi_bridge_atomic_check(struct drm_bridge *bridge,
 					   struct drm_crtc_state *crtc_state,
 					   struct drm_connector_state *conn_state)
 {
+	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
+	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
+	bool ret;
+
 	bridge_state->input_bus_cfg.flags =
 		DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
 
+	if (pdata->mode_fixup) {
+		ret = pdata->mode_fixup(pdata->priv_data, &crtc_state->mode,
+					&crtc_state->adjusted_mode);
+		if (!ret) {
+			DRM_DEBUG_DRIVER("failed to fixup mode " DRM_MODE_FMT "\n",
+					 DRM_MODE_ARG(&crtc_state->mode));
+			return -EINVAL;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
index 246650f2814f..65d5e68065e3 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -59,6 +59,9 @@ struct dw_mipi_dsi_plat_data {
 					   unsigned long mode_flags,
 					   u32 lanes, u32 format);
 
+	bool (*mode_fixup)(void *priv_data, const struct drm_display_mode *mode,
+			   struct drm_display_mode *adjusted_mode);
+
 	u32 *(*get_input_bus_fmts)(void *priv_data,
 				   struct drm_bridge *bridge,
 				   struct drm_bridge_state *bridge_state,
-- 
2.37.1

