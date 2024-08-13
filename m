Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E2195010F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 11:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0241110E2CE;
	Tue, 13 Aug 2024 09:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YSUWVSB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013069.outbound.protection.outlook.com [52.101.67.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F1A10E2CD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 09:16:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3njygmgyDYT8lubily+EUzXtymj5QmY/7Tdky7tXGPHxRsQHr4OvYW/eqrIeywP8ggW+CJPgELY3pi+unnyb6omt9x3T9FNCMHIioonCgzUUp5WKU5MNtVJnODxS4PEsAM0GMIFP1uMPNLNnj4FDLgDuSP6kHUReIoWpSOK0UFBm/6Lpjiy/wpVci1cpRAZZSVK0EcJQymVTI4R+L5NIOwZSTmamq6UtUXbtXJ8bH8m/OfYc3X9+uw5tZtm0VdwIJ7+rn4JqzgUwWdQsIb6ycjUHb1ayFlJtEk1fCNP05dgJcVPzqx0HW4uFYOccVKlKMGUua3YTKSitqb9er7aaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCAAZ49zH8N7/MUhfnyu3FnxMh9kHl+FoDrMM0fmIFM=;
 b=tsXdK/jd4eFkXBzqBCcjNkCPkc+z51aMSQce4qE5Kpy3gBJ3+EUPOAtKk6+orTkUl186I/Mybs1oFKxFMMyQbhuFLgqu2PlU29sx9QOjovyBYd480eknnT6RvTC8XoR1Y0qe3QBIkqhrk7aq8dY7uSUTAJ6Fz8Y4fobpmcNiCvYB/MYelUG8J8scRwxBFREH7GQzZ/vRuhBCw5VKyk0rqGl0fymWpGZ7jKHES699mL0q1pIiiW6TIVb9Yp14DU/L9gjEoiCxpNtDttoja0Fy6FufZjAnULEYb+fVOWQU0r3noK6kFqBj/AifFCa/ItiGUkulyvmOhY9pYs4WgH6lGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCAAZ49zH8N7/MUhfnyu3FnxMh9kHl+FoDrMM0fmIFM=;
 b=YSUWVSB6VKTgmiRwKzOZlI90TsthiCdW1cAL8CTH6PruTJ9Tt9wdYuGxKoA/NzVyZ+GI+5ZbxQei2cNrUGQ7x4XAn03UXZZ5j4hVi3iAK4VVAu9bhMErDsF26AEa1qeZWTBlQFPa9FqHDNdOWdVr88y9zi8cr7QqIdVA1U9epctkyLvz7h5HteIgiX4G7UP1wyiPTRfz2RJ3H7Yf0hl56u9BF7JPzD+xirbeYehyuuVfEzT/0Ialrh1gscgPhrlMPixJZk4cMn6PmhAIA+JNLgsLk23GiyTMHMeiGsCEQmpFxtHe2Cmo2gJBQerO5VgGhFZli1/PgwuJE8B7GmWHlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9781.eurprd04.prod.outlook.com (2603:10a6:10:4e1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 09:16:30 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 09:16:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: adrien.grassein@gmail.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/bridge: lontium-lt8912b: Validate mode in
 drm_bridge_funcs::mode_valid()
Date: Tue, 13 Aug 2024 17:16:37 +0800
Message-Id: <20240813091637.1054586-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9781:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e787599-227c-46e9-b463-08dcbb789e27
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qzOko/YGzIMY2OatDmP5lChhbhQFElyQ20FusGX64/pzr65ryV0hMyZoVfwn?=
 =?us-ascii?Q?wOUZIa4spEDonYcgaJ3vmhSSx6ozuvsG1wUfTnfTVKiiDuwpf4wcfhfZr2cr?=
 =?us-ascii?Q?sG2kuty48ZCMJGJfLAQYmw6gNbOO8XVWuJyEwVGretgZoNZhyYs57UNPZoW1?=
 =?us-ascii?Q?VunAiAGzUKwi5M1bcFsegRNXYb7TSS4dnLkvOsdBCXL4u3eOeKO7HcSvN9gg?=
 =?us-ascii?Q?pk5mYCIB89u4+QD+MmR1HOX7LGswe2c45yO7l+GMbq+WWVcwGs++oOY+uMnK?=
 =?us-ascii?Q?zLWgTMbRw7+JhbEhjBE9SMOrMxECvchz9nm8+8U8Cm5d+qnGuZa/AegtlFEh?=
 =?us-ascii?Q?H+Ymi+oXOmNDkiCCxSFc9vzANHwZ5P1ReKMzIk4WJs/7j1QuyChf5WDksrNR?=
 =?us-ascii?Q?ARxc7D2jwDM8GRzKvq1uzmyvEyxG72P7gXGfQBPPbyaZOaDoVqGfEvjQn9g1?=
 =?us-ascii?Q?QaeS68LNux6PPz9MuMe2O4/fyEaJ0d8fgpEB4Yewn1KLPpsX4V05nO8vLMaf?=
 =?us-ascii?Q?/oVoYpZIcWuM5ga78nZ4Mj1PmMvw3tW2xblJoIRl4UC4UT8KVYk25SBcv5XB?=
 =?us-ascii?Q?wfUw/xSYIx/PKSB5+xs3gGx/QlI3klxP2waLs62G+/942UBXs3iT2SrP3QqH?=
 =?us-ascii?Q?XOVXbKcZmgscBpcToExkVU+yFreXxYfFFxt182Kb5vjppu3BGIEa/lVHm4an?=
 =?us-ascii?Q?iIxKfRh+K7anL5txzkneMgtc/Zt3HvLlyVv28CAHwnEkqcHE3D6oq0HtPG9h?=
 =?us-ascii?Q?KS6VrKZ8Td5BwUtOqoM8wD58Q0viNFjd9jTXl/ZChLbREaq4mk3vq5YzGiW5?=
 =?us-ascii?Q?eBwI+hECyhilvRrdlm946AIiIgQ/IbHfprah+MDFprUQs4hl2a/Nd/j7oB+u?=
 =?us-ascii?Q?Buv3qpXL/tWqEBAknrgBdbQnDpOGumJv/M6KFr/C45AvsEJDotDaIqCV3ZQU?=
 =?us-ascii?Q?E2ga+nr6wkxNm0Gks8EAtLyGG/KDdSu7s1vxlna8/LN9gGGY/ufySQnNPUPa?=
 =?us-ascii?Q?5Wl6LTm2bYsOTmT33tfFCybF5y2kDShl+wqpfiWFcvTX3HAop0ds6SOnAP0z?=
 =?us-ascii?Q?PRlHhtQnU3wLSzNVWtgSAyQXKhgK9F5vpAf1lKBNXcdGB/MJ7DhA/s7QCZOX?=
 =?us-ascii?Q?JZ5tWxDbbMfMhZHZKpcy/9SomkxA/4A8O71cAp8A1BpnStSIMF3PdhSY/26D?=
 =?us-ascii?Q?Avd+2gXqP2lkqTh78FDmrG2mmkkISCjyvC+pB14tpMSysOzuitLtNCqRHHGP?=
 =?us-ascii?Q?og09cb/greyqXaqph/vmONAMLZeS8jWKXkrhRwoBANWyt3GOjrYXM97IWNwk?=
 =?us-ascii?Q?hiba0gjr8IbDmVyOnCAJCMjH41gtmtvX0pcLrPN6FWJiRL5X1Fyz7Sfdh4lb?=
 =?us-ascii?Q?8mjzt0uVuXmz6ticWwBhiDBWrfG4K+/WsWjsol2ZKBrzG/Bg6Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?91w1r2nUG2l8TWv98fGiQKbnnUMN0NFOBGanaKAr+Kj+L0ZrLqGPXgcT3S20?=
 =?us-ascii?Q?AykXv6PIBbxuHiYcTmpP7X4LyLLwzIELIg1cnIzUj84TulJru58/CQLrPw2x?=
 =?us-ascii?Q?0aZ60hHoM6vkSHvzTX5U8sjGYCQm+4HzKYh3Ewbo4PqZBxsFQV77ImbnmtB6?=
 =?us-ascii?Q?Cwf1B7D8EGmVlh2no4F5CH2ydM+WhfbmRYwJP8kaQ6yyHI/1u3d+dTrqFhjq?=
 =?us-ascii?Q?+5CVzsHWvWxXbDHjQdrSgDh+OBn6eGRoxFqQS4Fz+3bFCjfu8PL3LBagsF/m?=
 =?us-ascii?Q?q2lPN/ahOb2Wnjegr02vRJsrLV+xco/motHsNTK1ZGh9e0wv2klZruqiB9CB?=
 =?us-ascii?Q?onDJ0Q8fB/mWtjwDNTQWycqlwDJ6bQORe+PYqqxP2hZu7mNJ9n4iXk3zqZN2?=
 =?us-ascii?Q?yg3t04HaPFRO8yfmzsYKU6Uo9bFrQ6yanztwUShbsGDkDFOOwNAI0l+D0s8q?=
 =?us-ascii?Q?QMQbG8WvVUSxlk3nH/n9K1u7BzHLb2XhFUn+b07x9ZhXE6ag/1oyvXJKk/id?=
 =?us-ascii?Q?09577aau1PvBzGzwqsJQFralhbXgatrv/cA9zezDhp0HA9MFlSWqd4R46apK?=
 =?us-ascii?Q?NrBERTnhiipr5Ayguuyx5CkzQ+2uvXwcXfmZN6bk5bGX4zFxOXrt1X07dU/a?=
 =?us-ascii?Q?E9UmomIugKgBXdse+KNHKYUkme88XIC9urZYmHFF3zec8nu30X34/4IWgaPR?=
 =?us-ascii?Q?0Ur6DXNi9pCuTMBMEc1lZ7sxp3CbQszqTSXnohqkSrJ4tXJTiibrtTm+M7fW?=
 =?us-ascii?Q?8s7ybXHz8N8omU75NkxRF8I7iJEXjQJQAGQ949FKvTslOEj4XTvc2jkt+sei?=
 =?us-ascii?Q?knt+O5HMg41vgb/5ZNTHPbJ11mscHuBey8KwFzrpFY093poxcj5R3K59GCLE?=
 =?us-ascii?Q?EdzT/89Mlp4wRt3BmAN/h4sR8Mjs4Jekc8qpBUV3nmORimFgQd3Yuvx9h47W?=
 =?us-ascii?Q?l78qDKP6Vm5aB4m0uzFDNCoLA4XKr4pc/4hn/IuhKsrGkQa/2Gz8hVm+g3h6?=
 =?us-ascii?Q?eWSMm5jr91MTDcanMx9sEQG6EBc1JjP1hXK/ZWREBqcDkoc9TN+vtvYeN2wU?=
 =?us-ascii?Q?DGKkUOpbp3JVMq0imblCBbniwFWRAmoFuuKxtatRnnK/62Ho8yzPxme+QtCL?=
 =?us-ascii?Q?F6FRHyYB0i6h1fxDU6gJkEzz0ZkZGeFC+btmjvmSNACAKTcnkXyjLU1J96X0?=
 =?us-ascii?Q?rpnnE8cRfILdf7DDWOf/8AGNjSs59gE1vcmGeXaoYgzaDy88i/zQ4XuJF8tk?=
 =?us-ascii?Q?+7V+1TRvbt6I5mX1qu2sIQmmN3kNi/EYsOYPWT6Oh2bzOuS4ENmSTXFeIkte?=
 =?us-ascii?Q?6L5CE6BwMbtUm6rLW6Y7X1gsKwVqzNAbl/7pniGQP+fKOghjqM953jHrQwMt?=
 =?us-ascii?Q?EmsmrRhjPZuCZW9wXYGWz4grFZhdde/sA/i45LmRk8pMILi8ufGEWf3gxmzz?=
 =?us-ascii?Q?iQzn/lI43j1otyASuuVr8SElh4c/KGYVmnd6BQVB9a7AEwRjXw/HJIBIPQpa?=
 =?us-ascii?Q?W5xS53yakE5xEDj9lUfpp4ulORitvCVYCX39+1rKdlcbhyDypjoVwT10MF1P?=
 =?us-ascii?Q?FK4Ht2yLd558tbqP0Rq0V8ORStTC961TKkEbOCAj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e787599-227c-46e9-b463-08dcbb789e27
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 09:16:30.6447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VDnadvbcUJYps9ri1a1d4YD7C2bpY3V3KmAhytHDnRMQ2vhY1xMkWOSpKHng8NXErXnTF+Fml+eKETtGOfXhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9781
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the bridge is attached with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag set,
this driver won't initialize a connector and hence display mode won't be
validated in drm_connector_helper_funcs::mode_valid().  So, move the mode
validation from drm_connector_helper_funcs::mode_valid() to
drm_bridge_funcs::mode_valid(), because the mode validation is always done
for the bridge.

Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 35 ++++++++++++------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 1a9defa15663..e265ab3c8c92 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -422,22 +422,6 @@ static const struct drm_connector_funcs lt8912_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static enum drm_mode_status
-lt8912_connector_mode_valid(struct drm_connector *connector,
-			    struct drm_display_mode *mode)
-{
-	if (mode->clock > 150000)
-		return MODE_CLOCK_HIGH;
-
-	if (mode->hdisplay > 1920)
-		return MODE_BAD_HVALUE;
-
-	if (mode->vdisplay > 1080)
-		return MODE_BAD_VVALUE;
-
-	return MODE_OK;
-}
-
 static int lt8912_connector_get_modes(struct drm_connector *connector)
 {
 	const struct drm_edid *drm_edid;
@@ -463,7 +447,6 @@ static int lt8912_connector_get_modes(struct drm_connector *connector)
 
 static const struct drm_connector_helper_funcs lt8912_connector_helper_funcs = {
 	.get_modes = lt8912_connector_get_modes,
-	.mode_valid = lt8912_connector_mode_valid,
 };
 
 static void lt8912_bridge_mode_set(struct drm_bridge *bridge,
@@ -605,6 +588,23 @@ static void lt8912_bridge_detach(struct drm_bridge *bridge)
 		drm_bridge_hpd_disable(lt->hdmi_port);
 }
 
+static enum drm_mode_status
+lt8912_bridge_mode_valid(struct drm_bridge *bridge,
+			 const struct drm_display_info *info,
+			 const struct drm_display_mode *mode)
+{
+	if (mode->clock > 150000)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->hdisplay > 1920)
+		return MODE_BAD_HVALUE;
+
+	if (mode->vdisplay > 1080)
+		return MODE_BAD_VVALUE;
+
+	return MODE_OK;
+}
+
 static enum drm_connector_status
 lt8912_bridge_detect(struct drm_bridge *bridge)
 {
@@ -635,6 +635,7 @@ static const struct drm_edid *lt8912_bridge_edid_read(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs lt8912_bridge_funcs = {
 	.attach = lt8912_bridge_attach,
 	.detach = lt8912_bridge_detach,
+	.mode_valid = lt8912_bridge_mode_valid,
 	.mode_set = lt8912_bridge_mode_set,
 	.enable = lt8912_bridge_enable,
 	.detect = lt8912_bridge_detect,
-- 
2.34.1

