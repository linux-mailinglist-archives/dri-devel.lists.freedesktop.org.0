Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF48755B46
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 08:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F4610E1D9;
	Mon, 17 Jul 2023 06:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5D610E1D7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 06:14:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDeQrnP6LLuSa459DsBlrL+ftblN1ApqJu4d5dtMrDioXumi41C0uwiGQO5oKfeH2yhH3wdmLzMzBk7rIfFowMFf97wrzvtcBnZI25yefIsv0OZkgHSVl8jPMdVV8v/1ICzKRnpofDBhzTdiIoxB2y2Q2vlhV6/AaJyJDShBokKVevE7ZqDIEIkj8lAAcxjtZdXZV2JUi9AoqvsyRtmdTTqqM5fkLTZ7eB3rA5jKvOgw7b7umWJ44qrrwb5Rq+L8Ci9lw84rYcjJLvx1bnmo0tt2FK1/WKogetidRKNwU5HKHQjIDQaqzR7Yog+YwIGgdLNsMzfL0crDfzwCOKjstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuDPuIYtKN3v7MckNkncxlIEg7y6pD5uT0OBYPupYZ4=;
 b=lpKRoUVdNonh3TRtvhPyTzPfpZhOTzaPi9rKMiWiDpvWQOnfR+A4UU2I4ZeVPcdO6NJkoPQUm8Q+PamgJlxTwt3qiddqHcKwFCGRyK1jMwJjG9QBBwSstauH8XaQWRUfQTs74vy/Iqmnp4cR69Cae+dgt0oRjxbClypJsbVq1+3J2gyBps3VhsYpJQXx3NRaQxCkBlbrSkxRO2ci2yK9EOUFkFNUhZjjAzUIMF9/lHWG/GUw0vx8WtfVaal3jNjFN5r0jNtRlBV6W/gbbCOR5FJTydRfMKMP7kytxPpmSjW0N8PBe1Ql26+EY8WD1VkIA0/B0egzhJdxhF/3s5zOpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuDPuIYtKN3v7MckNkncxlIEg7y6pD5uT0OBYPupYZ4=;
 b=KEq9DRInNDwxXlECg4wFZH1GChhKdvW7YanA9G+YyISPT8j1OXt56ywAgWRAtjzjTY8DQfkPEd8uvhJKBpE23H4kY7lXWNsHK5Eh5prb5Ozl2RQKVtZYeQ5LPU3PLtwDRxupyODVIKouQ96DDHxFnDQAR4ZXZH7cSjZ/+BLyknQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9189.eurprd04.prod.outlook.com (2603:10a6:20b:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 06:14:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e%2]) with mapi id 15.20.6588.027; Mon, 17 Jul 2023
 06:14:04 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/9] drm/bridge: synopsys: dw-mipi-dsi: Force input bus flags
Date: Mon, 17 Jul 2023 14:18:25 +0800
Message-Id: <20230717061831.1826878-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230717061831.1826878-1-victor.liu@nxp.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a40b74a-4e2e-44e9-329b-08db868d0568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Qy9lgAGJh9ytE67+MBRIAtosBhBT9mXU85D/M6vsEZ94JavUXvd+IGAYteyYNK0vbCr8Q+8hx7luznuXx5f0zSma9Yy45dpafO8okdSzrmZE7oVn+iA5uQs+vu61CsSjQCLeA13X1rKgnNJIDCAVcMnrP+xl+AUtOWuWH5XBGFh61hhAmHyNEKgYE2VUrAQXUkuuRYj3bUZ0PA/GY/eANsGmRXb/T13caT6Auq74USvyPlFaTFnmFQtmqctTaUUUSmgFtYFjJ7v1BuDaSYhipmR1ciO0KoqawCJU/7cWhGMKthPt3DALM5kNEiSjm2Z5jrIdmAejauxKJ3q9o3j07pIQrCEMjyto2IWZxiNUxuhVCc3lcaTrxqcRI9yJIajrU+iCZU2I574pruM5Ecl4DiZXaZ4tYOWoxXOLUrEtD1fiX3fxluLfF00RW1IuT5HAuoxyjkYXVGwB7QLmhE4kFzhN8HD9+LbJi4e11DgKP8NqOES8yXiZo8z48Gg2oS24Jvp+hsmrpNNqAr0jVL7UZvA0wrPQSfFPHagmiLb4usKmROYsQp1Cay5Q+qichRR0S/fBmKuWuWFtKkoql+fXY9YqqJo+qKAxAuDupLWH0nGA/fRRTkg2dkxyDnk8U2y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(478600001)(52116002)(6486002)(6666004)(186003)(1076003)(6506007)(26005)(6512007)(2906002)(41300700001)(316002)(66556008)(66476007)(4326008)(5660300002)(7416002)(36756003)(8936002)(8676002)(66946007)(38350700002)(38100700002)(86362001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BMf19MV8eOhmAoWTNAcL9NMk8BVO1tHvsDJEBqb2IJMb7fENn3z6GgdPpIsA?=
 =?us-ascii?Q?E8pwVWaPPPwx7FEiCXR4tnPALL3Xf2u+ocBVgtUWZLx2Amx8wemrMGAarqc+?=
 =?us-ascii?Q?gI8fdOPigLwkzSNldXkF6gST0xQa9h/lujSfVi8Q/CiRmR06en930jPKj0QC?=
 =?us-ascii?Q?cZkNOMv6yh/SRGdlwSk55OxAJxZvO3EZhjaNkMcehOT+CUOdKrbJGad3kWGf?=
 =?us-ascii?Q?KGrtfOVV8Wv7LgZfChasH/jYRP7pUQUPvxT43OlTS/XcUqXXiDXJaJ4xHQdL?=
 =?us-ascii?Q?zYfZwttSEKsqzyuInXH/kDOCKkMgLA86OS9Eva4ef3kXrLI87ROUGnytRfsf?=
 =?us-ascii?Q?sB7iPEGUdV667EPHRZqVlNeKmPEQlSysXRMkMTZy7edrPFEE6TrjNIGHpKIK?=
 =?us-ascii?Q?vxe95lmBM6Q9wjw9ZyimfbD6nThLIgX0im2qqmWTMh58iRND/GN5RUc/BCLC?=
 =?us-ascii?Q?Z3LOzD6KPYMk+ynIObV/pCQDiTEUIfd10eEORlcJ4tL8zLFy0ej8KA6Tew6k?=
 =?us-ascii?Q?5XfnMoXuXncjzz+F7ajLvi4J3UBuO0e4OKsKVpG29Viesdw5PTOp0EKQj7Sb?=
 =?us-ascii?Q?EgPVHxGZ1hyRZ/y1BUYOgJ+IHszQU7YDanKygbMoRLMRekFTi7Q3ulVRZ1Q2?=
 =?us-ascii?Q?Tek55lEuq3ua8XTmd7tYOr8HiTwHBEUaRPn1NPs8URxLL+LdPUu8Mnxvjy6E?=
 =?us-ascii?Q?oW1XOLZbfhCsSpMjvUAPQ/qgWnwHWPuTaGnwuPFiZasDf2LpDOBNfLT9QCCp?=
 =?us-ascii?Q?Ik6N3k2Ob/8AzLkfLiQGwWfy1biMt2bSUZyAEP52QLoKZJdi4Mb3WLoXvw5Q?=
 =?us-ascii?Q?Q5y3miu8zWITK0xTI3v8dRsaS7QustdlAh4BUX42RYYjkeYwMmw9WCLbEGlY?=
 =?us-ascii?Q?LK/1/rtZtPuz5niMmwm+xTnaqGD6ZVv5Cpz6dDKWoFHIBTF6/Qs2EOFShlLb?=
 =?us-ascii?Q?kgU0mxJ0aDZOX0s/MqyZhi+NUynEez+5owS+vxM0ja58h6lq3X/55sB/nhNL?=
 =?us-ascii?Q?91a6tTaCxpW4Z6LO3JMAzApjSQUtjFW/hjcE4H5k6qs4jRORZ5U+HzXen9gk?=
 =?us-ascii?Q?1tufbYtMW9eCNVHRj3UUXVfj6u/J/jYeGWQznmbhS6XngS2Bl8jpUUA9/plH?=
 =?us-ascii?Q?YyiqOC5VGHZEzJRt17PVb2J7IrndsPozzdQ922PnEXHG/+ZFk2ZFJ6xjs4qa?=
 =?us-ascii?Q?iZ3G9ukPDeq4Is66j2chF8x31GsYMJiypscS21Uf+RLi7wKNle4M2L9SkCoj?=
 =?us-ascii?Q?+2mdPo4HpxcTJou5VoTzqRFiZYLgSqtYORWR7/d5eJpwBlLN8ffgguk2kpA8?=
 =?us-ascii?Q?B5kWIj4M34Rje8z/yL9xJzYPKh1oiolmMBqsZZZ0gSv4rQcck9K7X3D5+JAD?=
 =?us-ascii?Q?NW6A94EV3BzBDBNVyLObXqCIu/tm4J9fOjYbtFVJ+HQdw4v5f5dFZw+P+WUW?=
 =?us-ascii?Q?/CkT9ZU+ndLJTfWJs9o6xpaupiLE48wIWJPDs9dIWxrCghyJzKr/UvecCqyx?=
 =?us-ascii?Q?8KppTZTiJXxg17bZnBU6dWlV+HHCLoSijPKKC3xvoVSANgfQ79VxEsMACEe8?=
 =?us-ascii?Q?0WF+x1JULEPB1z8XxtXg7JgGgva53tyjipqH1Bdr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a40b74a-4e2e-44e9-329b-08db868d0568
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 06:14:04.4700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9dvf+2M2jmHyhm7c3Kmo8sGWNX3KHq764bpLYAQZXNBkwAG5tcghr8PW+T2CGeX8lKbqFzWVPwu4bnUCK11fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9189
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, shawnguo@kernel.org,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DATAEN_ACTIVE_LOW bit in DSI_DPI_CFG_POL register is set to zero,
so set the DRM_BUS_FLAG_DE_HIGH flag in input_bus_cfg.flags.  It appears
that the DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE flag also makes sense, so
set it in input_bus_cfg.flags too.  With this patch, the flags set by
drm_atomic_bridge_propagate_bus_flags() are overridden (see comment in
that function) in case any downstream bridges propagates invalid flags
to this bridge.  A real problematic case is to connect a RM67191 MIPI
DSI panel whose driver sets DRM_BUS_FLAG_DE_LOW and
DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE bus flags.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 8580b8a97fb1..8cd89a63b5f2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -23,6 +23,7 @@
 #include <drm/bridge/dw_mipi_dsi.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
@@ -565,6 +566,17 @@ dw_mipi_dsi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static int dw_mipi_dsi_bridge_atomic_check(struct drm_bridge *bridge,
+					   struct drm_bridge_state *bridge_state,
+					   struct drm_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state)
+{
+	bridge_state->input_bus_cfg.flags =
+		DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
+
+	return 0;
+}
+
 static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
 {
 	u32 val;
@@ -1033,6 +1045,7 @@ static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
 	.atomic_get_input_bus_fmts = dw_mipi_dsi_bridge_atomic_get_input_bus_fmts,
+	.atomic_check		= dw_mipi_dsi_bridge_atomic_check,
 	.atomic_reset		= drm_atomic_helper_bridge_reset,
 	.atomic_enable		= dw_mipi_dsi_bridge_atomic_enable,
 	.atomic_post_disable	= dw_mipi_dsi_bridge_post_atomic_disable,
-- 
2.37.1

