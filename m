Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 692D7755B43
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 08:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF4410E1D6;
	Mon, 17 Jul 2023 06:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6766810E1D5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 06:13:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLAcrJtdt6a7ufMtr2AUetUeB7iPMRaQ5FeJP4jIYfrsguxhZuRy5Mun7ONNlNaVcoD4gtwYP4KYF0XQUe7P0nRjBh7Od7qlk6t8a/iVdVuS5KFS4r/1R8atlEKhgno+JrFAutT+UB93Ehg38uE0Aqo4MLmM9ZhGaFW4aF1G6IdcsjMVTM6vIBwV2pB/n/Ian3FXaK0fVkDa+9IqkEaLzTQ9eZ+FSg+fPeYVPG5pO+d2u+VTPLLedjqSMsEGOVBSiImWfkM0TaXmJykRss7OK96MkOg+JQF01pFtNLs+q+jSxBkXdyHAGbiZxRdxWBxpU4CrpzKCGr54kXpOi3TxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEkbojmuf3jtpTFeRTYFu5MyXZClQXlpI+wIIMGnPmU=;
 b=lMjrTsvhac3P+q2wr46KOzFyxmN2yQnfR2KoEbGjOHcLAsPewKZjmdvF7MUEbJ5aGYMmzUXLFly+t6zqkgH6lDTP7wY4RrgRSFNL1xD0FXj0yV0FjWo2GqXSvhH9maLCVg5NhVqml6jSfy/InEmbfFm0Ow20EoUn8h2+Y5cZGiY+LRWLXY6vDdyZQat6eL0S3BbGBuPlX8h5ikOipaPSvFx1SC3lg+NkxuSLx+3oBCFRMcecQ0SLdk77Y/gR8+OtKo7ExHxXc1oCb6JJrB8KCXVZ3Bu3HrcvopKqe01c5GYZ5wE6S5H5ZWfYkJ/g5m+vV2KIolkUXKyQ+8BTN/wJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEkbojmuf3jtpTFeRTYFu5MyXZClQXlpI+wIIMGnPmU=;
 b=Ab/ldBVt2SdZjBySx1as0TQj/L/1SvvC+1BBvrNwwKbSpQhLNjtdlxgWHEpkv1wmJubApwjCiC/adaS1lzOzt/gz+sSt/65vNgzP87j6wlToZZvtEAacFLiuMaTRE+wQOlLNn4ZLlEUHM2iT0dnGrlxIajrV5y/DrSfcs8FwxDQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9189.eurprd04.prod.outlook.com (2603:10a6:20b:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 06:13:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e%2]) with mapi id 15.20.6588.027; Mon, 17 Jul 2023
 06:13:53 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/9] drm/bridge: synopsys: dw-mipi-dsi: Add
 dw_mipi_dsi_get_bridge() helper
Date: Mon, 17 Jul 2023 14:18:23 +0800
Message-Id: <20230717061831.1826878-2-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: dcf7dc30-0d2d-4257-2c74-08db868cff00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BPs6v+F4JouWDR+z27qlqqhittpOcxhqoo1IdODG0oEAy5qvjFofmS7TvT+cGQcvu6xkSRj21R3M5DNpIIvLHzSZKCeT+aRCWOh3Pv1XoFnEQAQ5mLztZKWGHbaJlLYp7K7vsveTak/bphmCt7beZc2/bEIu5OLGbxJ9VQ5OhZLYQmDfosOHjgfgRQtQNNkNSXevTgQ/lMfGDNihW3/hDucuJJeqD3QbT/zWG5mqucaeTnR7braE9P9dGa+8uV1N6Lr+6QMOkk+aWp98q13PRsppZerXUG+JoueSH47xJFcSPerrBF3Ch9K2Boc5R105v7yMNQsI7vnHxAPPoZAlS93j5BYh/TxKa+rTvqD7vJDKxas6JiS1rajptpdn79WiIp0j9uFqoT7Ok6clxSQN5UeqV0n2Zrq7WHOzjHOHQYZYdOYlQCkhwgVeA2WBmi+TviSoJBUe1Pcf7F9qENDkNk5wo/DMxRAvprYoojU+O07mF6+7sfLnp1baSxruUVJZN1ml4+ten9OAuXuK5FxuyPIglyUKcLQ1gD+sWeJqMGg+HeDudTj4PNiCELE4EjP37BYSGETQiYeRqYk1RL4KDpZG1M/YNWR+j3hz6ss7nueVnXCx1wX0nCvpks/JQDZw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(478600001)(52116002)(6486002)(6666004)(186003)(1076003)(6506007)(26005)(6512007)(2906002)(41300700001)(316002)(66556008)(66476007)(4326008)(5660300002)(7416002)(36756003)(8936002)(8676002)(66946007)(38350700002)(38100700002)(86362001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tLcgqhf5TnBC1WepEmhBaB5CRIKqyTABojpVmE7gbgi+jztA2hciAdlEefos?=
 =?us-ascii?Q?TluKr/cowvMb0BMr5SXG4k8FzkvWTq7fybqgTWOM3+Yo0W5cz2xBKBbKMFbR?=
 =?us-ascii?Q?FQqFxb3wA3QLizXP64kmE9yQyifS84o3Vja1L/oblNKSfNRrbl+RbKMDIx+X?=
 =?us-ascii?Q?2I11Ojw/v6pqHWDmj3vheemPbbx3P2tzyESTjIY4ud7PzgeqYYSt1BZZNNFq?=
 =?us-ascii?Q?MjK6G/Gal2+64vjrxr+UG9tgeC3ONk12vWyQAXBFcm2hPUZrLfLgl44alY9+?=
 =?us-ascii?Q?nPolbTPu3aSKrR9TBq2LznWHTmJGKY6NUQqk7825TVsXCd6sA1wdhk5EStga?=
 =?us-ascii?Q?0NLVByOS6c03huICvdxdEjrzAeTbob2E7woynacPsqlvbCmmue6nVe5qlaMp?=
 =?us-ascii?Q?mUC5Mblou2GmU9SwtNlxrUcEdxZlhRcj4ajOjnJ2Qpvj2fei7whAjpvWqItH?=
 =?us-ascii?Q?4isTT8QBy0PMY7/++/rncIyFfZVg5ABT6/fm89KxBX4Lql9rTJp+ZCtgRKDC?=
 =?us-ascii?Q?WaJbJPcHfPhultnzaxfXYr3elRZSsk+kTDlPxKcMaHimju8dzpGnLhdQf6AP?=
 =?us-ascii?Q?+EEiOlwbiGdzZDbdt+q+VWSkLPmUwkoMvYA5wfO1FKwXiyuiiJIb/4g6iemG?=
 =?us-ascii?Q?/ZBsPwCM8pKdWtNLGJ7b2wKXOxUP77qFewxMe2FUiIVftMdf9302d/bcrzMP?=
 =?us-ascii?Q?3r8AUET+INNpahWFTu0cPmeiV97OZamz0OLO76WZRP59l+qJCXYHzZaPZyn4?=
 =?us-ascii?Q?Eo323eSiARm6ZNmpXVkzF2DcLk5y1E2Jci9FoyckBqDYaog9aP8CsKaAkNCX?=
 =?us-ascii?Q?QAmv9FvCZ7/9MeMyGHOPEzbr3+AjoHCAj2USoIlXFBZznLJCijNVCftMDcDz?=
 =?us-ascii?Q?zxNN1L1ZQFPckvxmfuK5/h/Og90BGWyekQ4ybFzxIhz15j5lA6AxOtbpxT6T?=
 =?us-ascii?Q?7NYSNwOUK9NyQ4/z/350t4rUHeqKP4zAC02lj8YX5vIWHjkEyGikEONIAAH+?=
 =?us-ascii?Q?sPkGHBYPHgLSrU4be8QfKKyvP8Bz3LHAWDtYkiIZgDX4vLYqPSKTrc/I+msN?=
 =?us-ascii?Q?bkSuVWnTLaXQBP/PNR/CbQOXv4uRxZ6qHmka9E7lIJGPMDwBSWXLjWFQu94L?=
 =?us-ascii?Q?Sldfs1oXx08Y+BGdbYxPbcy9gP0aKCKrhUwIfV/cn4+ow+EHuG/JhsNlTlRX?=
 =?us-ascii?Q?MEyf1N6sxdzvcL2SdcQcd4G9SIJdrP9WeH4aE1y1cadzg6qzSS0969CtfrAc?=
 =?us-ascii?Q?27/V+FT/0DQZhRuLuLkXrAob0e84mykVvbKzMkHuZCrJFKmAEGRFW3MFqg99?=
 =?us-ascii?Q?HTDr52Mi/0dBXQVMWXYBiFtWIYYNDF2a8Q420Kw7LZmyHIotvt/bol54YBIN?=
 =?us-ascii?Q?OzDAmHBGIndJdb9CdyrDMsxV/XHVccv5J0mCGccFd9IV/msBdC7sGLKtAR7Q?=
 =?us-ascii?Q?+BIan8k6bFapPUIyfMWi78hxOzJZbtqVFQiTcnJR3SM/DD+YER4sg36f3yyA?=
 =?us-ascii?Q?cwD5tt55gImbeg+0ohlmZp+U0lniLjdhLdkqyyNBvHG8BBuLh955A4Ycjhxt?=
 =?us-ascii?Q?77FBB9JgvHWcf9AP25w6sWBxmjeNzFA6bWn90GHc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf7dc30-0d2d-4257-2c74-08db868cff00
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 06:13:53.7934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJNUJKiC63UIDS4zruZiXhgm1MSdDIwOHJhlwAygq4l3U76ox+B14hljx4fjh9UFob4rCUYPY1cqcAcIDTbgFw==
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

Add dw_mipi_dsi_get_bridge() helper so that it can be used by vendor
drivers which implement vendor specific extensions to Synopsys DW MIPI DSI.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 6 ++++++
 include/drm/bridge/dw_mipi_dsi.h              | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index b2efecf7d160..57eae0fdd970 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1207,6 +1207,12 @@ void dw_mipi_dsi_set_slave(struct dw_mipi_dsi *dsi, struct dw_mipi_dsi *slave)
 }
 EXPORT_SYMBOL_GPL(dw_mipi_dsi_set_slave);
 
+struct drm_bridge *dw_mipi_dsi_get_bridge(struct dw_mipi_dsi *dsi)
+{
+	return &dsi->bridge;
+}
+EXPORT_SYMBOL_GPL(dw_mipi_dsi_get_bridge);
+
 /*
  * Probe/remove API, used from platforms based on the DRM bridge API.
  */
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
index 5286a53a1875..f54621b17a69 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -11,6 +11,7 @@
 
 #include <linux/types.h>
 
+#include <drm/drm_bridge.h>
 #include <drm/drm_modes.h>
 
 struct drm_display_mode;
@@ -68,5 +69,6 @@ void dw_mipi_dsi_remove(struct dw_mipi_dsi *dsi);
 int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi, struct drm_encoder *encoder);
 void dw_mipi_dsi_unbind(struct dw_mipi_dsi *dsi);
 void dw_mipi_dsi_set_slave(struct dw_mipi_dsi *dsi, struct dw_mipi_dsi *slave);
+struct drm_bridge *dw_mipi_dsi_get_bridge(struct dw_mipi_dsi *dsi);
 
 #endif /* __DW_MIPI_DSI__ */
-- 
2.37.1

