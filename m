Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1F567904C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 06:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A31B10E602;
	Tue, 24 Jan 2023 05:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CB310E5F6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 05:47:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQoaSju1QcTrkc7QcXb7WWHrfHEC4+lzCmBWJTTeT3vLnmVSH2AQi3jlwUSgI6BlQWjt95M6BIOKvWstcInTPSfqsSp0GjFXjvFyZGEYOK9G+aLFZP1t/ov5g0P8l4yMCcQ8G89Lo4OOlTHYx+BUgYDwXNAM9U5Yx0UDJU2G6Agdlcei3Fih4U0u2fxajGaQ3zlIfCpZ1u0AwO0y3uCPOWdJSbM1brLw5Lt+E5+FR396Sf4xfDquZsR44CeselmTaPnE8wQSWH+OrsjzK/cZZertaYeIQOVlm4ihCpWgD7acUabbnrWZm75tHp+DmQNUbuN1SIPV2MdvMjj4ZNd3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qELp75GMG8gq/xzAPHpiSQQnHjdgzgjWvx4lnj2MduM=;
 b=Sr0VfGd6Tq1RumflbE0FB4pR6QcHxT+TmgNjOURSHv+KIbR5uESWNViM1nkxUxzJM06V0mneSAQhRT+JeJ7txkCXcOVL9A6YVFrxvDVE1NCkOMpeujSH06rnUwcxuic8+iZm0QKkXP31/u4MIz66YfuTPgExchy/nbLGtMUNThBOYOLrqE494kkBfkzhUIzU7LZK553r4rAbtzFc9jtmGb0Cck/snTsEanz2kR6CsL1p+K94iY/9G8w1xmyUa+T0ceI3FCBD5GIK6dPfp6aE231P/QVUALmEpUQmttZGJ0g7FlB31z05TCklMzMWVcGp3Ag0I8q9m2kM/wzG9215LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qELp75GMG8gq/xzAPHpiSQQnHjdgzgjWvx4lnj2MduM=;
 b=pC5MRLu0B2wS2oeZshMa6kNsAkiepkkSQhCR01QlvhUWav9/7+9PwBTdcAro7w/CRyA8QH/dhgcE9icQdgosSY1S3bFcHhO/g2UNe3PSt8ul/JP1JgoHNyLdXm+/2L1qAMWAkaePRO8OCWW2waiZ0ErwWJ3xUkspRkNmRVK15ZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by VI1PR08MB10032.eurprd08.prod.outlook.com (2603:10a6:800:1cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Tue, 24 Jan
 2023 05:47:22 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 05:47:22 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/6] drm/rockchip: vop2: use symmetric function pair
 vop2_{create, destroy}_crtcs
Date: Tue, 24 Jan 2023 06:47:04 +0100
Message-Id: <20230124054706.3921383-5-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230124054706.3921383-1-michael.riesch@wolfvision.net>
References: <20230124054706.3921383-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0189.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::6) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|VI1PR08MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: cc682a86-e116-48f3-0578-08dafdce76ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BT9bDVj50yyxL7Rxfhrr7BaUG0Gd3iDYVMADojvROlkV7i7kK48s6jiYocxidTURV7gLEHUUcag3lmzSoh7y0DGOzr72oS2rphwL9PGCzCSGkz7iYB/mHDf/FwLty9rqVFBf2Tqgxcr2t05aL0HoKMm29eFOnBvPyHKm3OXmrdBu1AkF4UKg2SOx8dcAugYfPmCzKfy4Aqcb2o46+LDZp+BhhsuPPrXTqWIo6daw4sjmlVefdir9syTmKvu9N79AqMo5e/PhgZZuGYGvo5gCAfl7qu4PA28y1KH4mCcxErf9xx8oLWSM0dSTLwecUheftrbSnuEuBh2Is56CUmOLTKF1ODtMTBx21uQ/85b7L5ey0UXKV3aRMw/yRFbtEPvTHKb9X0V+5FoY/cYg8P9k32z2Lph5yuNWPeC/KCNYE1abHFzMLao71ViJbhOY4sJWAW7VyTR60xOS4a9XKv/raYuN5VK51fFeb1Sruy+bnl9kd6QrYlvaaYzHVRXurgESIPPEjoedgsKcWytzc6XC07hMDaROxuZIOwsaocsh3q0x61a+jPheceK79nq84kcrU2scOzUW0p48Y/MWKje11xs4VC99XI0uuKTvu7DPB+3tSZLaNkPdTD6S9Z8OkrFQnus6j2OZ68N7diROFyCj0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(396003)(346002)(366004)(136003)(376002)(451199015)(36756003)(66946007)(2616005)(66476007)(66556008)(316002)(54906003)(8676002)(4326008)(6666004)(5660300002)(7416002)(2906002)(44832011)(83380400001)(107886003)(52116002)(6486002)(186003)(1076003)(478600001)(41300700001)(6506007)(86362001)(38100700002)(6512007)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7g+zCGMPTRdCTgHBw7j0NghH5hOHCerkrVUBGf1RDFWL0BsMH3kpY87Md5ph?=
 =?us-ascii?Q?v4uL+mPidej08S9jf1HYM2I7cJfsQ3DmMNorX5Kjk45WFirDBay4apmC1gEU?=
 =?us-ascii?Q?cnDLDDoyMmK2Xrq5GSompJDlmpSowMCEeYekz5+w7YhqlWSoLdiJC3MK2hH5?=
 =?us-ascii?Q?ebwdgQlSb2GUFkkuiERZntXB5asxVhNoRSLLP7FMCfi5sCUMKYBVIBkdZvzU?=
 =?us-ascii?Q?Zw80GwTS1BbUWVLCU05uTsjahX158xt/9nsDcjwhslymYzN/CXtMsyFOfH45?=
 =?us-ascii?Q?qLW2/Bai3JWByZ5LxkAlcj6gXLuYgMcBXmc2Pw3u4LmVtMPRRGs7k+JOBfe6?=
 =?us-ascii?Q?+HMOuHzcCR0GEbJCzaq3cw/Z9o5hdVrySRPLO1C2fHeQCqQbXV966zouvvLE?=
 =?us-ascii?Q?lZ0fkep1V+e74TJq1cE7NMUEDssE2uuHeqaH2SfTQAn8mrY+CNcjpPk0f21W?=
 =?us-ascii?Q?ARVM7Ya2+GEaMIwHGlyRsbuaHOp41ONDMYksj1x0ABASPV9mqOoZTb/wigQU?=
 =?us-ascii?Q?zEiZhA9B4Af3ADyG1HfoyHz/6lpr2Kqo0P24Y6v+ZItOzzbWFSe+7yNjwF41?=
 =?us-ascii?Q?Bnf3gbaBE1oj793oUpyFYkCqGQ5MjYb+2H5EyAMKdcjujLf8+pMqj3scmK/t?=
 =?us-ascii?Q?BF4/UdrXzHuAu8eLNelJanVmnFzreD8yW5hAt5QrP3kOYyCCNnoBYrjk3aGs?=
 =?us-ascii?Q?YJ1WtQeuCIJZcPf+e8SSy8lXODT66upH1EBr3T5RhhYyV4Hanifbq6cThhLM?=
 =?us-ascii?Q?4I/R6UlHYUFakZvfb84m7nhhqeRM/FRRT4LdvymUt47FV+065h+XdMdXPrxL?=
 =?us-ascii?Q?lnA2xQzeM2jL68K4WyPynY6eiJR8rR0iHsLZ/0cbrzkPnwAt9gINm8MaUPyS?=
 =?us-ascii?Q?xwmtM4lSfl+VNk103FmgnbIfQIalTByMhnzBrF3lQB1uf4dasBGt69uOiREV?=
 =?us-ascii?Q?CjBZ5r3TXHO2S2WzJB/6d+ay/onPk+DWlPGcHc4Xx7S1ETeO1utdI6QpGykp?=
 =?us-ascii?Q?IOuKaAmUDzrTRxlg4A+As9CTYLSTuf68M9pGs+/sSZgHVyNSCKFK/YaZliMQ?=
 =?us-ascii?Q?mFjvMMyk9hVDv+Ko1uN+Q+prdsTzt02aGSiefi1L3oZNotyIGSH140xZjAZb?=
 =?us-ascii?Q?7SVMrtUIFdeDDKHxUyUWu+3X50sxIok9bM919YZo8Gy/6vqI8vVRp+9BGSfu?=
 =?us-ascii?Q?3YTkDg7z+j0wAGC2ts8yl/cNLIMG5Zc9kvIO6xDqWfC+zPfohxkxpxptq7yb?=
 =?us-ascii?Q?pqA71Ms01EgBfCq9q/t+wVIeFtqHLnuVTKkXs7HS+ZiMS5+gU6QkwKrmLmzO?=
 =?us-ascii?Q?whP4aBnSHCUqBsrKbD65qyrMsJbMj9cnfHMkL945GPvuyIyhq8TC0RsWplPN?=
 =?us-ascii?Q?7YKKeGWSC9jkehTiH9Bu4Gz6gMBSj/MSrAqITrk43Qyd5TSsVPx03VfOXuIh?=
 =?us-ascii?Q?sgzBd0rw12lD/f5OzO0PLIl88eEDEuGq9GNfS97I47r4BOCiEhtwFfmLFNNu?=
 =?us-ascii?Q?56Wowsfmj8P+aEZK+U9AQE09RlXbPIIyFCqhS9Mnn+1LPWgg/Mt2t8HinJQt?=
 =?us-ascii?Q?45/50BgVVt8jwfaBNMmANJBIzdtjMA1Hx0gXheU9aW4cTaxItx0c/4L5LMal?=
 =?us-ascii?Q?xVJ0hsfAAiKkvBlcnkebUXsEjeWgM77LISN7ZA7M8A10szhpzyDUosbqFc9s?=
 =?us-ascii?Q?eJr3wPB1JGukv9X7+pQW+rCoD1U=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cc682a86-e116-48f3-0578-08dafdce76ae
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:47:22.3490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdF9094NByDjhGA6G98/WU/esB93gDzP7lF/UUuE27XsY60sbhH1+xISbQDomGkg6BNKxDZwHV2DiTOMbWbzSzqdqbAZSdMVMZ9zt6xw78I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10032
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <sha@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let the function name vop2_create_crtcs reflect that the function creates
multiple CRTCS. Also, use a symmetric function pair to create and destroy
the CRTCs and the corresponding planes.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
v3:
 - no changes
v2:
 - no changes

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 31 ++++++++++----------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 374ef821b453..06fcdfa7b885 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2246,7 +2246,7 @@ static struct vop2_video_port *find_vp_without_primary(struct vop2 *vop2)
 
 #define NR_LAYERS 6
 
-static int vop2_create_crtc(struct vop2 *vop2)
+static int vop2_create_crtcs(struct vop2 *vop2)
 {
 	const struct vop2_data *vop2_data = vop2->data;
 	struct drm_device *drm = vop2->drm;
@@ -2372,15 +2372,25 @@ static int vop2_create_crtc(struct vop2 *vop2)
 	return 0;
 }
 
-static void vop2_destroy_crtc(struct drm_crtc *crtc)
+static void vop2_destroy_crtcs(struct vop2 *vop2)
 {
-	of_node_put(crtc->port);
+	struct drm_device *drm = vop2->drm;
+	struct list_head *crtc_list = &drm->mode_config.crtc_list;
+	struct list_head *plane_list = &drm->mode_config.plane_list;
+	struct drm_crtc *crtc, *tmpc;
+	struct drm_plane *plane, *tmpp;
+
+	list_for_each_entry_safe(plane, tmpp, plane_list, head)
+		drm_plane_cleanup(plane);
 
 	/*
 	 * Destroy CRTC after vop2_plane_destroy() since vop2_disable_plane()
 	 * references the CRTC.
 	 */
-	drm_crtc_cleanup(crtc);
+	list_for_each_entry_safe(crtc, tmpc, crtc_list, head) {
+		of_node_put(crtc->port);
+		drm_crtc_cleanup(crtc);
+	}
 }
 
 static struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
@@ -2684,7 +2694,7 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	ret = vop2_create_crtc(vop2);
+	ret = vop2_create_crtcs(vop2);
 	if (ret)
 		return ret;
 
@@ -2698,19 +2708,10 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 static void vop2_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct vop2 *vop2 = dev_get_drvdata(dev);
-	struct drm_device *drm = vop2->drm;
-	struct list_head *plane_list = &drm->mode_config.plane_list;
-	struct list_head *crtc_list = &drm->mode_config.crtc_list;
-	struct drm_crtc *crtc, *tmpc;
-	struct drm_plane *plane, *tmpp;
 
 	pm_runtime_disable(dev);
 
-	list_for_each_entry_safe(plane, tmpp, plane_list, head)
-		drm_plane_cleanup(plane);
-
-	list_for_each_entry_safe(crtc, tmpc, crtc_list, head)
-		vop2_destroy_crtc(crtc);
+	vop2_destroy_crtcs(vop2);
 }
 
 const struct component_ops vop2_component_ops = {
-- 
2.30.2

