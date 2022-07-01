Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5705562C0C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 08:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8BB10E2DF;
	Fri,  1 Jul 2022 06:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140082.outbound.protection.outlook.com [40.107.14.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B37D10E2DF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 06:55:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5SnxWllch55cco3TkdBejm/zDnS/x1EHPdgV4+V7+SiTfOcpmiNkHnHvcHoYOBcXDIc+FJCwNpL7BzzYV5ZUJ3IONHM92VlulGFnTG27HgnXg61bnbhAeoOsISL3H83oSy7/xpQtGgT2uBIckotN9U2fp/k5qNxnuSlJBW3Zy4MdJIPaqfycc/4gdr16n3jueLN1mLVWhkd0dr6/POStn/k/fcmNw8uLxA82xqW8qNhnBtvm1zB3/WPBnSaxiyzkBMI9+jYCWY7xsfw6iND63TmvJ3Pg52cDGnbnJh2xXitwTCjIYQh2vZ6H/j4dqbcZOzC86cA5Vxp2LCjIbZFdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uf2rt0cy7GFOP8pf/wqQaLnlTUQgi7RaDY6tAOvbLq0=;
 b=SF5SnlRhriQY+ItnR1pGAh1z+WeqjsXgENfINwhLuPD34SwIpnVxiJSLzTtQzIHAyktiFdSN+P4dpJmMTWO/hZuDd4oK+v3JCBHDR/+76uHxz35VlY78PhxwS+S/MXQUiZ+drWJc3AGctqRnCpZJS05SridVC9GbI0+YjgA9U8YFLkgxxF8+hwqRZuPQahXa0Ip28ZAZWPK8rcCl1ay9OY6yiVmrUvqIZ4BJ+jhhjcXd5FHRm2vPqTOmM0j1ddK4I1qT9wFiKNmHCvGW0rm4MkbU7XDzsguoIi6OiETZH5EHvL1GpfNj5CbvKo2Ol/j9FjQBSOWGdzgum7EClHouxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uf2rt0cy7GFOP8pf/wqQaLnlTUQgi7RaDY6tAOvbLq0=;
 b=bl9lSkErK7Lj+7np97VWu2E4LboEn0dzbEkao5AGFzv0J5NdzQmjoDR0GMGy9fR9Bi5wsqYAqEw8DogWlVYZgQ0WlCDcM1kRhfJLghrqrRL43cpd6Geg4fDVjz+huSWor2xs4UjSt/HFUlwo9ZKcw423SFZuthX1npjPjqZNmP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB6PR04MB3270.eurprd04.prod.outlook.com (2603:10a6:6:11::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 06:55:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9%6]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 06:55:05 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/bridge: fsl-ldb: Drop DE signal polarity inversion
Date: Fri,  1 Jul 2022 14:56:34 +0800
Message-Id: <20220701065634.4027537-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701065634.4027537-1-victor.liu@nxp.com>
References: <20220701065634.4027537-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a94d84ea-b28d-414b-8044-08da5b2ea0c2
X-MS-TrafficTypeDiagnostic: DB6PR04MB3270:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VHZmvsTfPuT8w2GeSSMLs8dgkz/ITzsf0K0UKfILNKvvUmcuB112JMRMcuJQ60Xf9gIsjYOG1FKtuQMqvYkm6allvNrs+sqPe+XDUhvOju51tWMRR3BY2Rdxf0XYo9Ez5tjgvDdsTjGBa1E3NgiCgcw4GMaAENmoga6l+M6C8nFRd0947oWEvA1fQXnktwaYNKHLIhJZm81VFcL1rgAjlqRiou/EHAY9ik4XobdmBDv2SImrcoyFTIAKqMhAtyKIOl3adW1nJYjg+vPPZNVEY47C+WZiGLB7MjGQBe5KSjsQq0Kqg3D71crY8U95+EsVggRdf3DQpzcCRuMKxHIKhYX08EdzHZ66XQMpd+W/qGl8yVeD60vHvXbh/vnr0XZk1QVidBP8vSX1avgP/GNZoowgjTLbA2Z+fb9hRWc3R/jcJN0hZhMsbIoaJLB15+/3eDetDJmWK2I0q8wQe6Ddc/Zcorf56em6IjW6I4qUbVlkbwe6VSmtGOFpK2PjDbsmbNAtCud5cViJmDePpRJOPiQLxH51r0mo+usUrqgm8yYv3/4o7ow+aGCHsxrfhBvmPF0dN46yR8XU6Bv9PYZ0jwimw9ochRiFqOv5YaPG2yque5U+W8pYXV6nwHK+Dz8LzrK4r3QNRSbExc/deNme6pnFwOb25f5NkmSEvDJvVJkpmxpy/CepCHFvtRYBr/tdAR7n/31hF8VBDttnDMe7w8lnTB1kp30N6dFgvmothcXGZX3U6qRIgdDqFGn3BrKd5nPcycl92S8f7sRDSUOt7gdU6DmqoH1INKDaPk6kTBLVIZtMB5rZg7c47tnttoei
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(83380400001)(2616005)(36756003)(2906002)(6512007)(66946007)(41300700001)(6506007)(6666004)(1076003)(52116002)(26005)(186003)(7416002)(478600001)(4326008)(8936002)(38350700002)(38100700002)(316002)(8676002)(5660300002)(86362001)(6486002)(66556008)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s3NSSw/I48QQfDFgUjoNFyk4FwM4iBgo2JROC4xq5TyruvcqbaSZ6pv1JvXB?=
 =?us-ascii?Q?pXf8TkMtC0ax1BhHvYCRFD93M2iagKEEEGhoptsHm67dQXi1XyW82RSFcf7D?=
 =?us-ascii?Q?zQemLMJS6181dk5q7cp78ZorbMtLDJXMexDGMbd6ntT8CGJ+8JdDDXTcW2gW?=
 =?us-ascii?Q?bHW3SozCCiUqx617Zsr7sz/oaEuVDJ/3rE1U+YyNfn2RuZx24uRDHZaEBI9L?=
 =?us-ascii?Q?fRJs4sAuHnn8nBg/uOEAwyLec8FCgWJXH6aV7j6Jd4BI9NiYWJXiRfmFJUYA?=
 =?us-ascii?Q?yD49uBYK8s1j+xerpj6Es3oUtOeFSEacVby/t/fhu3wSeM+NZhEGo0vtX++e?=
 =?us-ascii?Q?WuE3sbNF0Sdr5f1j+VjP0zFX+YpG0RtcsRYgj5/ZiggLKbQbPZz9YMr2zGFX?=
 =?us-ascii?Q?H/6HhIXuajW2+Ul73lGASXFMo48I3XHUH93KVIkxVzXXE+ZE5tE4FDakaS2v?=
 =?us-ascii?Q?eE8N2oFSbVY8AOZC3Sx9ML2tAShxJ3etlsiGuwEjuLe7PlC2YKvNzIGqOKKE?=
 =?us-ascii?Q?0Ebhuk48wvDxCFxRndTFqmyVUBrb4V0LdJZmCwD9GpF6ZWa++xKs/Ljq8rSn?=
 =?us-ascii?Q?RP8U/DWdHP05QNjFD9QOkm/E6aJbxlM37JJQu5vaU1l6Yhpyy7ox12h29TlF?=
 =?us-ascii?Q?BdhOSnauUgcBxlz3cHqw5wDCyXltwKY1Ws9Edpl2ACbKCWYXEaV2f+3OK2st?=
 =?us-ascii?Q?OLukgQjAbJqUpkUWIUaQ8hPo7lHYM4+iawbF4JARhKFFUvYBDolNlwR0xicL?=
 =?us-ascii?Q?p51BppaqjdQy3SCC7DBAooLw8Q+uKiOt7K1rSUQk89RVCw/EslpNz2Bww7QA?=
 =?us-ascii?Q?t5dhMBNBAZMukmMObwTbb/bdGiWEXJaEggOC+6C7BdzzcF1YYgi/IIjtyzeW?=
 =?us-ascii?Q?hw5VpEWyOqkR/jhEhLhIr4rA0exW5FiXt7hXVedf1npesSdIDDiR9/CohufR?=
 =?us-ascii?Q?wdTkiDV3Rm4H7zwirIy+Y6K+gHvpek/txLoFw8AutzNF9GA1+PVgBq6xD1J7?=
 =?us-ascii?Q?FiTFKJBM0LJug8X3cjY61YIMvCMiUSSPhVoRaaLJyHUh3/65dDjwE4DE28hz?=
 =?us-ascii?Q?rP8ilZFTVMReSVtHaZCd/ULaF2MBqFSuFJXZKaofeMbIZPKvGbcl/QntjwDg?=
 =?us-ascii?Q?CNekK1hAFifbnLIkEVui4FVPZ9XGLazDjOuRABxLUsOl9vuFoF/3a9C4eaBh?=
 =?us-ascii?Q?tY+otw4gDauaMXLv2Mg2u45Kw82nVo8Yc+DC9wLimx1ONe1E2o9wFVQuXpZ0?=
 =?us-ascii?Q?9jh4tjOmoipMCVE+WDL08avj3T989QZ7u8D/8hf/48IBQeWMxuWC/b86VYlk?=
 =?us-ascii?Q?7YS5JPWrM/7UckQYMLVtLh6xYat2C1/21NA8CpZdhDUHA/U1JbUdEiXc55pn?=
 =?us-ascii?Q?95/ceH3BZX+fHSsaVYvRsBQl3guORg7fgIHMETVxrQfP9S1Dbp470Cqii5HM?=
 =?us-ascii?Q?MIFu3Npi56gkwvTfdmhkf5sQj5FCJkX551ZHvMEK4yl4bNIaaElYFbO/vARb?=
 =?us-ascii?Q?eM6DVWjUXxlUN4wIKLMf9shIdtkRkl65WJQELFd09B+DzLZ0R5SndXsd+dV5?=
 =?us-ascii?Q?hnzD23F3v2VArMJ9ywKDkjWjnME7OAThdCqWGyKE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a94d84ea-b28d-414b-8044-08da5b2ea0c2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 06:55:05.2726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtOWmZBiJiK5/HPl1BxFIS61ekfEEBNroEBAe5dV6/d9Aw7Lszyedkds4NIDm4zU+de/zqWuhiNMzTS1GEYYfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3270
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
Cc: marex@denx.de, jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 narmstrong@baylibre.com, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, sam@ravnborg.org,
 linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's unnecessary to invert input data enable signal polarity
according to the output one. Let's drop the inversion.
Since ->atomic_check() does nothing more than the inversion,
it can be dropped entirely as well.

Without this patch, 'koe,tx26d202vm0bwa' LVDS panel connected
with i.MX8MP EVK board does not show any data on screen.

Fixes: 463db5c2ed4a ("drm: bridge: ldb: Implement simple Freescale i.MX8MP LDB bridge")
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Marek Vasut <marex@denx.de>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index d4f005eef6f6..4b503c544256 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -74,22 +74,6 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 				 bridge, flags);
 }
 
-static int fsl_ldb_atomic_check(struct drm_bridge *bridge,
-				struct drm_bridge_state *bridge_state,
-				struct drm_crtc_state *crtc_state,
-				struct drm_connector_state *conn_state)
-{
-	/* Invert DE signal polarity. */
-	bridge_state->input_bus_cfg.flags &= ~(DRM_BUS_FLAG_DE_LOW |
-					       DRM_BUS_FLAG_DE_HIGH);
-	if (bridge_state->output_bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
-		bridge_state->input_bus_cfg.flags |= DRM_BUS_FLAG_DE_HIGH;
-	else if (bridge_state->output_bus_cfg.flags & DRM_BUS_FLAG_DE_HIGH)
-		bridge_state->input_bus_cfg.flags |= DRM_BUS_FLAG_DE_LOW;
-
-	return 0;
-}
-
 static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 				  struct drm_bridge_state *old_bridge_state)
 {
@@ -241,7 +225,6 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs funcs = {
 	.attach = fsl_ldb_attach,
-	.atomic_check = fsl_ldb_atomic_check,
 	.atomic_enable = fsl_ldb_atomic_enable,
 	.atomic_disable = fsl_ldb_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-- 
2.25.1

