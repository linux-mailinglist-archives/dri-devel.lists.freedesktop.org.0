Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762F79C52AD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 11:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9C410E5AE;
	Tue, 12 Nov 2024 10:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hRYRVW0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0124210E5A1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 10:06:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8k+ymnDbeffNSmHu/6me1G1rTLN1ca5zpGMKBo6Kv/8vYz53UpAUbiG1erjTF4tTnuTYnZE9IhrINaZ5R73E69PUX/wXyy6Ek63yFX5uoQv1zpLc0L0ZdqS3s/CVKtbdJ9sI9nLwvCRioLjdyzPR38owjF7JdCtWI6fE/lmnjK/POGVkmMWHOWipXX04FGVhtJgkRLSfVIHo48PpLFWyOHKwUrcfh2dOcnNMn6z/0fx8wf3At0hjqD3hAtz+du+zpPC/U/rQcRbeXrDgr2Ym1Xi+/aeJHcUNeKAEXl0tLKrTet6NzazCZA8Oxjl6rk5A4On4fIuD7DLjNhdo45ZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGfk6W2JCj4wpC6o+Qwd+LjQx3NGxQw6YEQqOKv1cTs=;
 b=KfYtEsaaGPCIBulLzTcqBbP6ispyPib+ywM7oM9Ye5pdCqRPKAND6pkjV9qykeVb1NyNizDK9p7iGOTLqlP56vYKFCN0KLgAHxP/okSG569D4odswdbejed2Q0sgrUhQnGccLEjByPEpNxhA9oJ6ARJ3kpXhAN5fnsCH+nfX09mqtDj1ZR/X4QaKLQwkN/QZlbKCd/G68vvWuGGE8i2P6Aw7Cly6gLrv9PStU1k643ltiixXwl/f4r2K9sTSzkbBVJbDgDaHLz3mfOOZNKfUmPC4hvVgQK0L3GYcCFELzIQhKmQnIWSGW2589bWKQW0vju3eXYeQ0UZKjAVxhCNxvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGfk6W2JCj4wpC6o+Qwd+LjQx3NGxQw6YEQqOKv1cTs=;
 b=hRYRVW0Cbnqxt2HqAxhYlu7tr+LK+tE2qeGM7LsRWt0fVPUOa7P8PvX7Or1JteqXBZwyxtIUTCP0soxv5vNORbjeieVq9VFa928y4axvE1K8Wa/Qko/jhAr/wvdm7vf0Jgx87/jJyoZyyiemlfvhnw6pmAcxSyIvsc/lC+bXVbzwfgw2vSTRtjbuDz2RyL9d4Nzn60nBbGrUZ3FutT9HQHxVpjhuXac62Jk1jzaWXBvSlomOBWR6rJHPVMKqGaceCGnDJ6LekD/UonXpYSPMUeOpTBWKGIjUnWkM9K0b9Yu5c/YjYY7q65Sk3WCE90qrff6upAzIMVM74jZkhwMwsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7879.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 10:06:22 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:06:22 +0000
From: Liu Ying <victor.liu@nxp.com>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 marex@denx.de
Subject: [PATCH v6 4/7] drm/bridge: fsl-ldb: Use clk_round_rate() to validate
 "ldb" clock rate
Date: Tue, 12 Nov 2024 18:05:44 +0800
Message-Id: <20241112100547.2908497-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112100547.2908497-1-victor.liu@nxp.com>
References: <20241112100547.2908497-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:3:18::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: a27ea734-9a13-4754-cc32-08dd0301a8bd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MkNLkFBMlWRWcJa6ix3+a7zUIaWdhQjPTPAz/3U2aCV1RAkNvbg62eo90h4H?=
 =?us-ascii?Q?PRnmIQjNTAxB6onVV7TMgMvR7/IIluzaTISBv+B7EoczHvTIl6Q6Blr1abh9?=
 =?us-ascii?Q?l6N79lFE83Mkm6y6KzY2vVpL/Ucpai/vDxw3PCdrc5zsfv2mSDUjwu6vleel?=
 =?us-ascii?Q?EN8nZodcg0QNj34Wy8wQK6wPGP5ZBtHkwC5Tm4X8ARNFtw6+s2giOC1S6UE2?=
 =?us-ascii?Q?EzS+XUczSgfmZjwXvsF5J/NMcttIsAIlWi1iRkTNXtOFnRjfxeBxGlbvtqYr?=
 =?us-ascii?Q?kWEumoSh7nAu/fopfot8HkW36csMypPFyZJCzo1KBUrAlZQu4cyJ+jymgoul?=
 =?us-ascii?Q?vTMP6dNR49+l6JVemnBy3sZDkijbDUUjcgAHc9jCnt75PFKJso4kegmXD8g/?=
 =?us-ascii?Q?WxJev3p9iGUOCBFD8ygAHmILOeXX/wY1jHAnfkQSiz1FTZtWcXi7M0R15Hzx?=
 =?us-ascii?Q?x795DD/lzPsQfFlkcRwhRyqNkXp4yXS0bdB2UU5yB5jZ8GKScQcUV0P4vF30?=
 =?us-ascii?Q?fF5FKO7VgcdrmFAT2Ud0PDFE5badsXHnh7MnQuud75jAP+uOi4KHtgqHNcpm?=
 =?us-ascii?Q?iW0yWyH2h3xwbe7CTqtH5MAthi5509OZE8WnmTKLztTtUw8HL9MFdI6WYVmQ?=
 =?us-ascii?Q?fmeYhbw2IS4P5hJbbBirlCuerSgjrmrBu2nv47xUYfGhgMlVAUB2mXOF3ooI?=
 =?us-ascii?Q?aU0XM2kMHZ54f3oTEj8BU4xeJG4kaGkTGAo0Y9ia/J31u95KXaqMmCHjG8mZ?=
 =?us-ascii?Q?FFyphrV4/BA/sOnDp/mtvBYKXALI2ry2Y4FHm2fuQcBrgZOZJfq0qfdf7xyT?=
 =?us-ascii?Q?GsF2hGESJ+0MsxYzlR8cNz8qG8MGdoyfmAUZmmLWkUodTyUiWm9dLNPz09ci?=
 =?us-ascii?Q?onvF/jO7vYH4qAykK5+crJ8qBgU0AdELCX6YIHoE3kRqrQ5TMXHlGCQA84jz?=
 =?us-ascii?Q?DCrWTFPADwKiHcAbIxOhECl604msdb3pt2sxSic27NsIQIU81LJ+e0o3kAAZ?=
 =?us-ascii?Q?WNgpyryyjcs8wM7ugyD/8xFt8WmP/C+pfcssB1urtVnfSr9nSy128rOHlFpm?=
 =?us-ascii?Q?fOjAoHBQFLFTMUltf4tZCQqgnB32u6C1BjTyrlbKofONjndxPBPVhH13Oaxo?=
 =?us-ascii?Q?PPeCkoiuOm29YsoFzX7053TXO6D78iZwLMG792LGdcGWq8WEI6SduJJwig9F?=
 =?us-ascii?Q?Wl/sWYYDDsj9wbJ2r05jjkiURe2kX+Z3HIYUS65c57S3X8gCTtySJWCqkUHr?=
 =?us-ascii?Q?dggwt2BvjCWwNKIndJU3c6iWdmQC1gNwSLeY0l8bzNdxdsnR6Mk5+Z4nMgKS?=
 =?us-ascii?Q?E1GLdXCgdNKpRiYCdLhY9Jb50WKmoSiccTLmD5oqRXLAi9cbVWCM+Pk9+0Md?=
 =?us-ascii?Q?V+tP3P22yOd1qOnPcHhGVjmG1mOG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e0S/fUUCrL8FOH2q4e4hfdNI4PfKj3ra+iRha9RhkeWMAUBPdB4xzOzSKaBX?=
 =?us-ascii?Q?MOOngQ1JJKewvQ6hZwGLxUkLhjgn8Qeg6OUARccm9knViboOWBSGLhl0pikZ?=
 =?us-ascii?Q?Uki281XvwY+2Hu+R4jnUzSBqibO3eAK4n9f2nscq4+9/NrKmzy7BSSOFpaam?=
 =?us-ascii?Q?MqtYjkVsbW0jStGj++wS7dt4pra03yBTj7GxjEUwAYwUxeCbEqiELl7rJyfu?=
 =?us-ascii?Q?dCYasMreJvMapzwEr8sp52hrmgkA7RPwmMBpsvSP1FKQeApvPaJYNdG6Nr0G?=
 =?us-ascii?Q?5q2GTdED4cKjwZMNAKFiv7NsGmDXNkuuQ1Rh30XsjzFzV9BUiWFzCA1jhfZr?=
 =?us-ascii?Q?n5FXcFdMIvM+OoioBdqCpPxqDdNpOoa+Kaq2mH6uUFzUlLLuuMpB0YRyGDcq?=
 =?us-ascii?Q?b/7B0Y6DD56aKnCFtLIclhlCVPT03BSLVYCHl3exkW3x67cgP1z3oUiam9z/?=
 =?us-ascii?Q?84WYQMYNs+OTpChIG0f4ryClcKBmmYhvgN1BAP3yM4qJ+FIDCvgeppotiVjt?=
 =?us-ascii?Q?hRTnZLPUzKtd3ZECn31u6mVgzFHbWpNaXWwyaaT6lCHGYXHdii+AN7dOxlZr?=
 =?us-ascii?Q?aknpOPhrc9PFjuIJsU55NswENXY9s0euZ5osXOv4L6fwlknuoqERzzd0uEN/?=
 =?us-ascii?Q?pT7ecQDSMGqOb8swENKatCQlu7gBIB8g0vSuG5Qyc75GKMDs7CA52biEbgm2?=
 =?us-ascii?Q?mBwmNK1Ilj0zs4DBJlMFLFgUdsQVAqcWoGYsMcRgWpRKRPh1yAvXljknU63g?=
 =?us-ascii?Q?05QzzVy1Pe5wyxCOZIXaFmIwR+j3cN82TBV9wZtzQVl9F/mrfiqgwi9ECP8S?=
 =?us-ascii?Q?Y134rco10cd1KMIwy2ysWDAGKgtFHE+SMj6uGEPBt7t7SgakdDWBAmngkisZ?=
 =?us-ascii?Q?ydfxjvpRMOFXfq0SIyC560kEMHbqHzbrggyVs7WEVFFtHVxLPKJt1YO3myS0?=
 =?us-ascii?Q?SpnBKiy5jmbSuaB1Z1AAgjs8vfoUo0siCe0PnWYk5ZQp56kKAMOba5dcXom+?=
 =?us-ascii?Q?w7JzzYSgDTt6Kya/l+AiPVV+Sd/pq/cetZApFlU6dwfbeg1R6bhfCc3oGqHF?=
 =?us-ascii?Q?5kbIWFiHgbAsvXrFUwQ44Mj0FsVD5+0JQpSQo69Xp//s3SjIlTeNZsHcBxrV?=
 =?us-ascii?Q?hDNxf7csk1eoQ7wGkEO8/+MHnBo9IJjY2jERhw6qLM7cCZZXDsNdrcEpqPib?=
 =?us-ascii?Q?JwhyIwgQ6sBPO3NakQKtoJm5Cttv9g9mS1mVgeXX6jd+8zGMelwHq9wh4GV9?=
 =?us-ascii?Q?RTVX6yz/f/CJsj5I/4cQzP6ZN3dUCqPM6rbRrLpp4wfF1QCNVGM3flbnM/cE?=
 =?us-ascii?Q?ZDJqRq4kTCb/3kK89Zhkj53y6UHahcEwzM71dyK/+5vbws1jXM2pOdeSzrzE?=
 =?us-ascii?Q?Ta8V0bE7/S4dsyhMRTu0KcxWPkwWK2r7UAZUw17Ah/q7T4QbwBm3CGIH93kY?=
 =?us-ascii?Q?9QmgtO8csfhxu1bn7ZQjsEZ3paeGZMUuti1ajR+GUijg+ALSlHFsYobrKqrg?=
 =?us-ascii?Q?/j0Lre/MbKcD3hWMCq3EvfqWbS1F6+S2f7Wb1a/RqYAQ+Mjsirg7BIJmJLK9?=
 =?us-ascii?Q?edqk2zch5l0+tvRvCzvuRbh8xpUTcrG1/7E+vEK4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a27ea734-9a13-4754-cc32-08dd0301a8bd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 10:06:21.9383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEjV3ou7ljY2gkzMRaTPBzu8MiLqXA6cybk0HlSHNHNETq0nq67nFTCvXmahoDehRtU7XvYh5IRapVpI2U7ghw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7879
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

Multiple display modes could be read from a display device's EDID.
Use clk_round_rate() to validate the "ldb" clock rate for each mode
in drm_bridge_funcs::mode_valid() to filter unsupported modes out.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Note that this patch depends on a patch in shawnguo/imx/fixes:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241017031146.157996-1-marex@denx.de/

v6:
* Drop pixel clock rate validation.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* Add more comments in fsl-ldb.c and commit message about pixel clock
  rate validation.  (Maxime)

 drivers/gpu/drm/bridge/fsl-ldb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index b559f3e0bef6..d9436ff9ccc3 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -270,10 +270,16 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 		   const struct drm_display_mode *mode)
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
+	unsigned long link_freq;
 
 	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
 		return MODE_CLOCK_HIGH;
 
+	/* Validate "ldb" clock rate. */
+	link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
+	if (link_freq != clk_round_rate(fsl_ldb->clk, link_freq))
+		return MODE_NOCLOCK;
+
 	return MODE_OK;
 }
 
-- 
2.34.1

