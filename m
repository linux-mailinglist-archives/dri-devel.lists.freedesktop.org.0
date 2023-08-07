Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20936771968
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 07:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC8910E1C9;
	Mon,  7 Aug 2023 05:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060.outbound.protection.outlook.com [40.107.105.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75CC10E1C9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 05:22:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2jGLgGAJAowkU2NiqYlD8k0GyIem8/AWmnOvFB8alolfsZmcppj76IqQUeO/YoAQorlZ2YPWIn9gPmqIb6Jz+BBqfFd/5qnilFfCgN+Xr3YR9Vxy6ITlfCftORn+c00/K8I8gmG4YvD/l1iQM9G6ahXrosVtoWGpdKuj92FRy6m6A4KwcCmM7T3ecpj10Ln0AiditpSy1/UBON1u4+QfiTQ2sxMQXXRO+DmW3dD2GAzwYrhUJcGwlWPnJcQcSAaiURNRQOmpEVCUGtjC2sGnkaKboDq374nhRQ42cZ4Z59HWfbCTp1buILNbC0nWBzHJwTccSjeE1l7nXGInODcLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xe5geADEsl789VjDFDG0Q9VvJIFDaDW6dcVWrYwiJjw=;
 b=nHSN/ykBaXH3IoCxPLIWDKuCbQtduea3CCEh5k/EOp3vtqcGpgtZRmgoxwf6eQqzrkEMmLS78bvcGybFvTi0ip9xDHUJnRBscD+dQD39Xfsvz/VZ9MHuGeFTi719r8zmK1FJ5Mmwds3NsQExEUfcmIu2ccuf5tWfoU/XswgqHtMtW2LOqCvayN55VcvxUyEQUTzLu/rpzfbZX1fb53bJ/VmDEo+bUWKW0Auifgueamcmgqroz+tZNmH99c8dN7CnnHCvkXtFjvAO+6JnLqEsCk9+l/MBnut3i7ZjtXsDjOJVOcH1YvO8oBYh5PUywEb3LoyXwcQjCSDaGAtegAU5Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xe5geADEsl789VjDFDG0Q9VvJIFDaDW6dcVWrYwiJjw=;
 b=AMLM4VVc/P2SwFfrCenQhcSMPLqnhuDtA+OXTNBC9MieuCu818rst64Rb7J/9z3i/CafVNVwIp0nigiUrXkX7uj9eJgHRZf6U10H4vaiIirelJJKK7Ex9aUmRt5jfXcG4b6S8fwQJZuAyDuRQS8PE+2yFwKfcXSLz2fpP7YCy+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9390.eurprd04.prod.outlook.com (2603:10a6:102:2a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 05:22:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 05:22:38 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 7/9] drm/bridge: synopsys: dw-mipi-dsi: Disable HSTX and
 LPRX timeout check
Date: Mon,  7 Aug 2023 13:26:06 +0800
Message-Id: <20230807052608.3038698-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230807052608.3038698-1-victor.liu@nxp.com>
References: <20230807052608.3038698-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: f77eef7d-b439-4c9b-1553-08db970650b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: USX3AEuhrOo5AAqxOc8sLh78KQ2bPusLhkWBKW7ssLFe578rgManQDFDG3b+KR/KnJ0mh82ftWpWZoZKnSpdQo3d0J9kZEQCkk8r6isoijvGPr9LluQT+s0lytAo7KzM4xyraLO0XXjUJHyVofwoNjcNdt6z5/u5Budmru2ASBZb1IB4V262s3QET4l3T9uAX9Yd7oLQf3kPJdl9UgiuK0Qg2KC6/QJsRtVQgq51xsS3p5Dl2tkemo8dEKO1nb1DCOVNtKT83q9XoGgCP+tvMsGn9spyiV5YogouxZXrSRhlbxW0xGWZwwQ+jBhBgVp1XxYzKc7WsSGN/BuWPRFDRX5WE9UcxA8cr6R974nMpTwodRtw77YYZpgYY6Q8EQabR2z2Ux1PZvFzJ2I+44+Y1Ka7UWfHBSkUt7NuSkWRVE6ziRte+f7asxqzt8X/BsrrN7Y6BD4l3LVJ1CSW6Z4d6AOYs+fL9GxvJKvS3gvDmfPH1RDgkgxB1LNn0rs0jCx3HqioAP9uQT7jR196tqn7tOl+CRILPOw4EC/Ocj1K2hLH1Ca6W++1FBSiyLB5u6mNgCexCTbidLFOi9d2xxC2pBTuuvWA7fSruVWztxNhMXCs3B60EMPfbBqGM4Q/QR8e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199021)(1800799003)(186006)(2616005)(6486002)(52116002)(6666004)(6512007)(478600001)(86362001)(26005)(36756003)(1076003)(6506007)(41300700001)(316002)(8936002)(5660300002)(8676002)(7416002)(38350700002)(4326008)(2906002)(66946007)(66556008)(66476007)(38100700002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xYVz2tQGXL6P4J616qAFa/SveDHt7v+CX48cGwaXedV012aZlyGLYahM3wed?=
 =?us-ascii?Q?2a5aQosXFIpG1ki8RE2f4g8QsOZ1V3OS7qS/zwsqYoYMl2hrN8A0v2fp3gR0?=
 =?us-ascii?Q?WU+aGm61vaV1Iqc3gd3ALkCEuH4vykXb9lKkaJNh+fN5cQDt9ioJCvyK+CbW?=
 =?us-ascii?Q?aLgw5oVTELC8vV7byds8mj+ni3fVHYwTf5hei2WjLLwKIU7dvAMhK7QddCNc?=
 =?us-ascii?Q?yp31w4VmLiN0gVYRBEsIDO9PcurT6V9i7CBmS8cbRkHFgsNSIO/boTWKoa7I?=
 =?us-ascii?Q?ICiyZpYc7zEIMw6QHdXeErfzY1HXlHzFRmwErDlHNezF6elcm/3yXvDHgtyA?=
 =?us-ascii?Q?keL8MhMR+vkqYxbK/lKHSJhyM2lbovpnNH8It3rgUQ08HSsVf5LaaoCSTDab?=
 =?us-ascii?Q?or7CKLT2f3A6IbtAr82G6NRcFQxmHM+mRztX0j3W3XsJS6SH0pPuBdrVR3kD?=
 =?us-ascii?Q?kFZRkeXO4qFO4YGE6Hgf1ScCjoi/y3kjIClySc6/aLfNIH8Jpi5gE2o7uGsq?=
 =?us-ascii?Q?p+TDbh52PcitDQjGD7B3WLXB2bGqT/iuo3wnRXdw6Jl8+pnFBYIOBYuNQmeq?=
 =?us-ascii?Q?x/DAyjTNRhaqm/hl/kEM7ZD5vaI0mlZCd+/VXSZ1cnrK7m4ZF1sjcUE94jeh?=
 =?us-ascii?Q?6Sf3oyqh+wzn7oat7jYUNkpssfhyiZHS6cxOd/xfJD3K3xzp1EnN5zWbMCIB?=
 =?us-ascii?Q?qPt/Xm5i6Joy9ZFtaMf2URZSUuXlnWc3a0iWRlLv+vkHgwL+I1NCRtfVVIH/?=
 =?us-ascii?Q?/GvKt4fmgOYAOtGEaaw6rU5ohZD/Rq0Pyk9t1J1ZjAWod65EoP63WCcXFqHK?=
 =?us-ascii?Q?9gmFEZwD11rpc/+jwjkGrIh47zRVMQg9e1t48ihYY88zYBBFj7cRvhH7zGJx?=
 =?us-ascii?Q?/pb7O1Egv5IkKeqkSFZhTWwY2XvYHycaykblGw0BzS7fw5RfhsI7y4udpIaw?=
 =?us-ascii?Q?qOmp7w90T1eMNR/LUswGE38E/Wf7ZqMqZqdiqoj3sv1c8LjcDyhYJBQjKn9d?=
 =?us-ascii?Q?v75nOKIv9uxeE18pJKbwYV2/VRCoJoaxJBOouyirNRe4HKPG8n3czVXy+SZ1?=
 =?us-ascii?Q?XKJH5Nu6iPnGMWACNxpUbXqlvgL1ElZgb6usW/4yws4fZdsZvVrtJsXROeWr?=
 =?us-ascii?Q?tU8/Mkpm4W1/50E5aENY7nwxFh2iFRcemGCT7Kywwkaw58ry/ZpevtR69SXk?=
 =?us-ascii?Q?DUSZ81euZNX9n4AfbCwzuWx3Du11Ci/+X9zazJlSXn+C1Pz2IK64Z8sv0aT8?=
 =?us-ascii?Q?N7jaLaXmvF0niEoUn0kSifTbK7KJD3u/DGXwd6CdvDQ19PSz0gMO6NvQ/6q3?=
 =?us-ascii?Q?7iwjBss9U5L8DxlXvn/gfSIWwa5AA3WAw7yKvbdslvQy5KZNaKbWIjETOkmj?=
 =?us-ascii?Q?gOPlGd8RorNBCCJgfJ3CBwumRwX6CndmSoRZddap/0xjXgUfw8rpa9PkcqUQ?=
 =?us-ascii?Q?MZ2b1GFzsk1yTS9NxirE2oremJKSq8y5PqovBqNAUinqR/G4GuxXox2WBHZ9?=
 =?us-ascii?Q?PzbolXGdhDoKcVb34aCDVgXYGd4SnYv8h91Bt2UTHpOaxz1LXe4qHnJCBu65?=
 =?us-ascii?Q?Xdb2en0Q4IQslVRvzNJHmXVSXmAszWauxdnYaUwW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f77eef7d-b439-4c9b-1553-08db970650b0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 05:22:38.5143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZC8lxTIjBIE4J8BrKV1Bzz3FRYqhEQZcxwTicl0g/bkLETGIAcJ1gJl81F04LAkUKXHbnQZQwRRwMYDlRVhuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9390
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

According to Synopsys DW MIPI DSI host databook, HSTX and LPRX timeout
contention detections are measured in TO_CLK_DIVISION cycles.  However,
the current driver programs magic values to TO_CLK_DIVISION, HSTX_TO_CNT
and LPRX_TO_CNT register fields, which makes timeout error event wrongly
happen for some video modes, at least for the typical 1920x1080p@60 video
mode read from a HDMI monitor driven by ADV7535 DSI to HDMI bridge.
While at it, the current driver doesn't enable interrupt to handle or
complain about the error status, so true error just happens silently
except for display distortions by visual check.

Disable the timeout check by setting those timeout register fields to
zero for now until someone comes along with better computations for the
timeout values.  Although the databook doesn't mention what happens when
they are set to zero, it turns out the false error doesn't happen for
the 1920x1080p@60 video mode at least.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
v2->v3:
* Add Neil's R-b tag from v1.

v1->v2:
* No change.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 536306ccea5a..0fcadf99e783 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -684,7 +684,7 @@ static void dw_mipi_dsi_init(struct dw_mipi_dsi *dsi)
 	 * timeout clock division should be computed with the
 	 * high speed transmission counter timeout and byte lane...
 	 */
-	dsi_write(dsi, DSI_CLKMGR_CFG, TO_CLK_DIVISION(10) |
+	dsi_write(dsi, DSI_CLKMGR_CFG, TO_CLK_DIVISION(0) |
 		  TX_ESC_CLK_DIVISION(esc_clk_division));
 }
 
@@ -747,7 +747,7 @@ static void dw_mipi_dsi_command_mode_config(struct dw_mipi_dsi *dsi)
 	 * compute high speed transmission counter timeout according
 	 * to the timeout clock division (TO_CLK_DIVISION) and byte lane...
 	 */
-	dsi_write(dsi, DSI_TO_CNT_CFG, HSTX_TO_CNT(1000) | LPRX_TO_CNT(1000));
+	dsi_write(dsi, DSI_TO_CNT_CFG, HSTX_TO_CNT(0) | LPRX_TO_CNT(0));
 	/*
 	 * TODO dw drv improvements
 	 * the Bus-Turn-Around Timeout Counter should be computed
-- 
2.37.1

