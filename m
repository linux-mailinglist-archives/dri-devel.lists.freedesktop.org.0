Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E5EA73145
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 12:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4286010E328;
	Thu, 27 Mar 2025 11:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="qVOBlJ7i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY4PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11020105.outbound.protection.outlook.com
 [40.93.198.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CB110E328
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 11:56:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWcWSgEHMMtFn0lspj7qCu2A8+p50OMilF/+ixQUv73v7TzacUfC3J9LVjXKUXNiQqgNe1uY2oa8HvR3tory1Q/YEq4gDTR+ze67mcoAxZH+x5NNViHYyMNHmO3S7XW1grCSwdW/DFb8PUxM00YUNy7Im/gK++WfI485K8tM2NZq4c6SZ531fwB87+7bbDNpZyn1jy2ccNnkUZoY+QTFQPukhrdfcHnWtRFtcw5NMwn8z1nLab3cYtstAxHu4zwZJqCYEczqysrljbe9wAWHBGsJt5CSFeZIl7LMsRDq2TXMfzsUKb+j6fdnsJ/XU05MuL7DLrUVk+UktnrBvLXjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4cW+9wHV+hYKTkAsW6dXghZCjsxO35c/53fLUS+pB8=;
 b=M3KxG1QYxd7FZLN7NPzhsPQdKgyb7w3tMD4+mts68yqgyH4m7W/areaBsk8/dBjJrOjcEInOrrryDIDe87WcYCJMqf/bqi7j4n8FsUoB8I6LqfOrnw6wVL2RvkRFg2+upcD+h+HoemUNyrNq0m12j8fPGuq++E6+Nq8xquefTy9xpG9EqYXktvLMB2lqsHxOCB69u/nU+T4FqGVZrVvKCe6MtgtaBJRSMRykyBG9kfzkhy/jEoPsH0D1jUqnfNVo1nRQeAXlj0G2MqiMK3DkNgGaLTtMHCZ+OvU57VhHkwPfTyhEuSvOnxeAaoJ7uAwTn9MeA9dv4dN0SuCib8D86A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4cW+9wHV+hYKTkAsW6dXghZCjsxO35c/53fLUS+pB8=;
 b=qVOBlJ7iC6TidI/gjbuYR6crptUxZvgYw3dxeKcMrr1Vix/vLgeCdCKmBRDP1rEvlpARo/VbvnM7pNeztKXx/fjoK6kFoZN4izhRyZN9INXx6vZwe8dfquefQVyOLB/DoWJ2UKyzJhMxkncoHeOXfg0ZdONVcj/jVW7Dhjg4hnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by CH0PR04MB8146.namprd04.prod.outlook.com (2603:10b6:610:f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Thu, 27 Mar
 2025 11:56:50 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 11:56:50 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: bliang@analogixsemi.com, qwen@analogixsemi.com, treapking@chromium.org,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/bridge:anx7625: Enable DSC feature
Date: Thu, 27 Mar 2025 19:56:15 +0800
Message-Id: <20250327115616.1271635-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:40::43) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR04MB6739:EE_|CH0PR04MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: 70838b07-590f-494e-f865-08dd6d267523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8ATgVNZemIEo8B+HxuoxKDe3Z5/Veqo+oCba3+Sk4GVMHC3LUdTouZXNYJ1q?=
 =?us-ascii?Q?ifB6w1dlyy269AcF6ifnGTuRNHAGazPdWyiTtBpsKxSCcAij03iCZXsXz+Um?=
 =?us-ascii?Q?IJCe/zXw1pWxRMrlVF/M4VzFK1VPvtBJFF6hiHRyNRBQoVTIqq1thSwMXhwm?=
 =?us-ascii?Q?a41fRt2KFiu1wnsoU8Xqny4GtoFyrzyKthwD4M8KZibMas/gT1QqmmeQwkRl?=
 =?us-ascii?Q?F95pdHPMZvIRy/vL9CzeMd4JnSQVH5lRm+ikfmBIDVu+x7dXJNozzRXnEqT0?=
 =?us-ascii?Q?xATRMwYm8Mk1cJV5rJCSS9E/osdarJQZjrU/VBUfUqeJ2ttuo/L2w2av+tV+?=
 =?us-ascii?Q?Vz7Ro+TuRs1LEhrZ+jNDu30koQ3yywf4ScEPoI35tIZ064Sw40zne67Lp4gD?=
 =?us-ascii?Q?MB5+JcTuBw3jlt9FCeZ2Pi/2l4l49X8rgPjWlw2DnsR5KV/NTJs2KZSmHRGu?=
 =?us-ascii?Q?D6AP1Huw4v5/GpIU+I8uVMDi8fJPi4SqoDe4W51MSWsz53ANCPEE8w7ZoOMo?=
 =?us-ascii?Q?nqiI6xXLcwq1vuimXp3OpQV24QpHi5BfeVgBeVL7UNtfWItnsNQ/NIyetR2d?=
 =?us-ascii?Q?TbRscz7dxPK1xQLkU0Lg/LfnxGsVRNiXvNZjavUn9y+p1Z4g3r9VT+W5c2RN?=
 =?us-ascii?Q?WBtbV43NXZHMqpFr8U8P0l4hG+g/U8gPQ/fFbWDl8cyQWYkLaK69cncdHway?=
 =?us-ascii?Q?s7vENbPXgqCY+JckjJeRd6kqaXxGUFSjNI+LLFg6xIuaSi95Q3LPYJl0qJ/G?=
 =?us-ascii?Q?Y4/dj/5R/lX7C70+QIeyAW0c9GDN6uiW5zChfMJcs0fcmLkYtFll/9hIeWuH?=
 =?us-ascii?Q?qcCfRpvZAtQkdvTF7hFejqvD3PRgSMHOlOhrN+hCdN8nWbX2hBm7LJBFKCgu?=
 =?us-ascii?Q?snBqEogFO+BmPBFnrMD++DjEkBy7i3u9w4DxBjvewOBNG1H+8MA5q/pW6Pk7?=
 =?us-ascii?Q?FfJ2/OY4IUhlX6wE8S3DUF/srMYawK/AsBkn8JWR3EDZuVi40Ysn/Mb+Kcwi?=
 =?us-ascii?Q?DK5ueExTDjPvvp5P9MrzmTu0zWbdpPwtcpL5M/TgmKlxrROwNXSO+cpGjwU7?=
 =?us-ascii?Q?5vS4xjtx9EclJMISrAynOLn+tpbRTHp14ZeqNgcOots2C7z8fZaHEqHuYto+?=
 =?us-ascii?Q?BZTyfnJ86XK2V4XByQx8E56blpz1BTMjmvMkwTtxEcVw4psbo+LNuz0L/x4W?=
 =?us-ascii?Q?5h8Z3GTSsXYrvrkFArRX3QJwCV85BMETeMpvDfVxJF3wpc5LRNsxqdI/PGw4?=
 =?us-ascii?Q?L3dAl97HISQmC0GT6iIdm1O/FC1hqnMLsSIST/Ue1W1eupuxyQhxHTB3eJpC?=
 =?us-ascii?Q?Z4HPvDc3TIjXT7W3EdKeH7QEqbCdUmugi9/IARTOzHSsjZxo4WHgW8sPvX8j?=
 =?us-ascii?Q?wAJLI/VdNUI7A/Fz00vRbFcaWqH5upVP8AoHc8qgN8nWEIrQyOlw1mvN7L+5?=
 =?us-ascii?Q?PoW3ofTdeDFxgoQGWPLSnLvI8P1QUii9T+HQeFGq6e2LByB3mQbr9J2Ky2/a?=
 =?us-ascii?Q?8XtrcgxdsFg/nN0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bhoc1/E81QSAtDZo5Y9tC4L+4RTBewzOYpN1gz3Epy4kxJUbqKn1tjgjov+C?=
 =?us-ascii?Q?2A22mV3P2b8FgO6gllmJHO320Dp0oPhTvkCpH8niPX+ncbLyQH3LimuNwAwY?=
 =?us-ascii?Q?755Js6/OYzGiQwitUu+T7ad69RtPrEF+RkKpN9O8CcZG3y3tHf1vVcIeu/Uv?=
 =?us-ascii?Q?yB7x0ij2KyROAQiuNtbsPeEQJQh0NK38jXOPvsnQbM6LX5eXtZzxyCFhozTD?=
 =?us-ascii?Q?JAfS19OFTrSRr2J9XZl7eQhgRVfuhCOqKcWLDxB5MaAYAdlD3sKJKWAf+BoU?=
 =?us-ascii?Q?22id+y5SoPP2lann2dXYUln+0+nkV/VsiI/Ds+ZM/6XHOarlHhVlkDat/wJr?=
 =?us-ascii?Q?hYn4yMltg31Kqgcf+o9BvhAUwWWB3AjLqGXqBTiLQVh0398J2gX+MXuS9duo?=
 =?us-ascii?Q?uHynzkEt7DtvwlCl5Ff+b8MXoor3HJ7qVme1AEqC+ix4Zxn+La3kmZI8tjP9?=
 =?us-ascii?Q?uvTNTsE90xlgXJWyfQdlD7sv+nZw2SzMUsDM9Lm3vVHjwdLdvAEnkOrvMHQh?=
 =?us-ascii?Q?T4bOYaJBS985N/isAWxbblwSLBpuSwM1szC2mM7sAee3GxpuzFetf3eM8GLI?=
 =?us-ascii?Q?itKmtR30RR/I6DRuZBdbB7QOLqqKMuy4kbS99TeZwTzCyRYbP9UN9Ihlo//4?=
 =?us-ascii?Q?1b7F5p4Vn51mCwL1e7a5RjrFL6angXkN1D36WlzaBRxnSlctN9L9U8zPjXIp?=
 =?us-ascii?Q?wT/Mxg20pr25HgLTlIQh8NtIcGgxr3/CF5EvOV98tyNFQ5yGNLYdPi3bnsue?=
 =?us-ascii?Q?OJTSYLeHlsHNBLGI5mA8Hi4A10QgRZqJF1UaCA6opER+8ZF723oUDWWTWaVO?=
 =?us-ascii?Q?bnef8MH6YYQMc1C6B7+etpgEHhp/uQh5r8Y7d7ZVshIRG4HzoGgw1vkLQu/C?=
 =?us-ascii?Q?sH2iPfy4eLfeb0EmvWle6C7q7atP6NrsB4vA8kOrDRlO7ejFQTVieAc1l3Xy?=
 =?us-ascii?Q?LxYsauGq7k6hecf1FYpYop3Kz0jLiYGdOOzJYuhf4VzSVxJUo0JCx3YF/lQd?=
 =?us-ascii?Q?1CZq3oM035bxVk+KYAZCvY7gB9s7jpO0dxk0paCkllTFdkBv14YLCy/bHxYJ?=
 =?us-ascii?Q?p9CSxqI/NyAzgPF79f6yU8XbDajovSJ49qBl9v3qCRzGqE+rGAsFTLUEyEW5?=
 =?us-ascii?Q?43m8TbDO1otnRyUneiw4MYnQCOH6uk0naVnJEYESI5nQ14krcwz5a7utblSY?=
 =?us-ascii?Q?SsxVFUuPVXDQoDAhd25MgaZonOqIZIuf2i4Ujv+XLsgJi8ZmmU//F1RyBqa8?=
 =?us-ascii?Q?WNtqZjVgiuirkhMCAVF4jPbgGofMgDjbNn/yDtZdAyUyjTsBI8RnIsOD6d6y?=
 =?us-ascii?Q?jZYssT9oiQNnNrmY/ZyRpyHHbfCG0uzv3dEWY/stJcJteOX+6H1caB8CZg/U?=
 =?us-ascii?Q?ddGuSfyGC5vUl8XCPTlJgOv7Rbxxh615wxLC9//Kffsye6mSlY0Yt2S89NLQ?=
 =?us-ascii?Q?j1vfh354qdkcNHu4dBd0KTODPUi7iLL3jipAQgg19fd+upHu7WHwL5JPYd9z?=
 =?us-ascii?Q?9U2ueWxQQOACkLyLpLi+VQViKNVhy7jMZP2g0ihL/cUDQkwwVJrrzIcGFdAU?=
 =?us-ascii?Q?xRpjj9kf7BMNLTm4pgZdGO6Ng9UUdnCrbwItFRBy?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70838b07-590f-494e-f865-08dd6d267523
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 11:56:50.1465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +I8k/FyGG0NZbZfsKulDPtesdmNJT9K0u4NL0ybA+M6hYB9PFs4PMmS34Akac5tjqfipAlNMyxG0KDGbbYteyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR04MB8146
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

4K30(3840x2160 30Hz) timing pixel clock around 297M, for 24bits RGB
pixel data format, total transport bandwidth need 297M*24(at least
7.2Gbps) more than anx7625 mipi rx lane bandwidth(maximum 6Gbps,
4lanes, each lane 1.5Gbps). Without DSC function, anx7625 cannot
receive 4K30 video timing.

When display pixel clock exceed 250M, driver will enable DSC feature,
and the compression ratio is 3:1, eg: 4K30's pixel clock around 297M,
bandwidth 7.2G will be compressed to 7.2G/3 = 2.4G. Then anx7625
can receive 4K30 video timing and do decompress, then package video
data and send to sink device through DP link.

Anx7625 is bridge IC, sink monitor only receive normal DP signal from
anx7625, sink device didn't know DSC information between SOC and anx7625

v2:
1. Add more commit message
2. Remove unused code
3. Add more comment
4. Remove dsc_en flag

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 299 ++++++++++++++++++----
 drivers/gpu/drm/bridge/analogix/anx7625.h |  31 +++
 2 files changed, 274 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 4be34d5c7a3b..bae76d9a665f 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
@@ -22,6 +23,7 @@
 
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_dsc_helper.h>
 #include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -476,11 +478,159 @@ static int anx7625_set_k_value(struct anx7625_data *ctx)
 				 MIPI_DIGITAL_ADJ_1, 0x3D);
 }
 
+static bool anx7625_dsc_check(struct anx7625_data *ctx)
+{
+	if (ctx->dt.pixelclock.min > DSC_PIXEL_CLOCK)
+		return true;
+
+	return false;
+}
+
+static inline int anx7625_h_timing_reg_write(struct anx7625_data *ctx,
+					     struct i2c_client *client,
+					     u8 reg_addr, u16 val,
+					     bool dsc_check)
+{
+	int ret;
+
+	if (dsc_check && anx7625_dsc_check(ctx))
+		val = dsc_div(val);
+
+	ret = anx7625_reg_write(ctx, client, reg_addr, val);
+	ret |= anx7625_reg_write(ctx, client, reg_addr + 1, val >> 8);
+
+	return ret;
+}
+
+static int anx7625_h_timing_write(struct anx7625_data *ctx,
+				  struct i2c_client *client,
+				  bool rx_h_timing)
+{
+	u16 htotal;
+	int ret;
+
+	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
+			 ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
+	/* Htotal */
+	ret = anx7625_h_timing_reg_write(ctx, client, HORIZONTAL_TOTAL_PIXELS_L,
+					 htotal, rx_h_timing);
+	/* Hactive */
+	ret |= anx7625_h_timing_reg_write(ctx, client, HORIZONTAL_ACTIVE_PIXELS_L,
+					  ctx->dt.hactive.min, rx_h_timing);
+	/* HFP */
+	ret |= anx7625_h_timing_reg_write(ctx, client, HORIZONTAL_FRONT_PORCH_L,
+					  ctx->dt.hfront_porch.min, rx_h_timing);
+	/* HWS */
+	ret |= anx7625_h_timing_reg_write(ctx, client, HORIZONTAL_SYNC_WIDTH_L,
+					  ctx->dt.hsync_len.min, rx_h_timing);
+	/* HBP */
+	ret |= anx7625_h_timing_reg_write(ctx, client, HORIZONTAL_BACK_PORCH_L,
+					  ctx->dt.hback_porch.min, rx_h_timing);
+
+	return ret;
+}
+
+static int anx7625_v_timing_write(struct anx7625_data *ctx,
+				  struct i2c_client *client)
+{
+	int ret;
+
+	/* Vactive */
+	ret = anx7625_reg_write(ctx, client, ACTIVE_LINES_L,
+				ctx->dt.vactive.min);
+	ret |= anx7625_reg_write(ctx, client, ACTIVE_LINES_H,
+				 ctx->dt.vactive.min >> 8);
+	/* VFP */
+	ret |= anx7625_reg_write(ctx, client, VERTICAL_FRONT_PORCH,
+				 ctx->dt.vfront_porch.min);
+	/* VWS */
+	ret |= anx7625_reg_write(ctx, client, VERTICAL_SYNC_WIDTH,
+				 ctx->dt.vsync_len.min);
+	/* VBP */
+	ret |= anx7625_reg_write(ctx, client, VERTICAL_BACK_PORCH,
+				 ctx->dt.vback_porch.min);
+
+	return ret;
+}
+
+static int anx7625_set_dsc_params(struct anx7625_data *ctx)
+{
+	int ret, i;
+	u16 htotal, vtotal;
+
+	if (!anx7625_dsc_check(ctx))
+		return 0;
+
+	/* Video Horizontal timing */
+	ret = anx7625_h_timing_write(ctx, ctx->i2c.tx_p2_client, false);
+
+	/* Video Vertical timing */
+	ret |= anx7625_v_timing_write(ctx, ctx->i2c.tx_p2_client);
+
+	/* Vtotal */
+	vtotal = ctx->dt.vactive.min + ctx->dt.vfront_porch.min +
+		 ctx->dt.vback_porch.min + ctx->dt.vsync_len.min;
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINES_L,
+				 vtotal);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINES_H,
+				 vtotal >> 8);
+	/* Htotal */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXEL_L_7E,
+				 htotal);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXEL_H_7E,
+				 htotal >> 8);
+	/* Hactive */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 ACTIVE_PIXEL_L_7E, ctx->dt.hactive.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 ACTIVE_PIXEL_H_7E, ctx->dt.hactive.min >> 8);
+	/* HFP */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_FRONT_PORCH_L_7E,
+				 ctx->dt.hfront_porch.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_FRONT_PORCH_H_7E,
+				 ctx->dt.hfront_porch.min >> 8);
+	/* HWS */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_SYNC_WIDTH_L_7E,
+				 ctx->dt.hsync_len.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_SYNC_WIDTH_H_7E,
+				 ctx->dt.hsync_len.min >> 8);
+	/* HBP */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_BACK_PORCH_L_7E,
+				 ctx->dt.hback_porch.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_BACK_PORCH_H_7E,
+				 ctx->dt.hback_porch.min >> 8);
+
+	/* Config DSC decoder internal blank timing for decoder to start */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+				 H_BLANK_L,
+				 dsc_div(htotal - ctx->dt.hactive.min));
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+				 H_BLANK_H,
+				 dsc_div(htotal - ctx->dt.hactive.min) >> 8);
+
+	/* Compress ratio  RATIO bit[7:6] */
+	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client, R_I2C_1, 0x3F);
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client, R_I2C_1,
+				(5 - DSC_COMPRESS_RATIO) << 6);
+	/*PPS table*/
+	for (i = 0; i < PPS_SIZE; i += PPS_BLOCK_SIZE)
+		ret |= anx7625_reg_block_write(ctx, ctx->i2c.rx_p2_client,
+					       R_PPS_REG_0 + i, PPS_BLOCK_SIZE,
+					       &ctx->pps_table[i]);
+
+	return ret;
+}
+
 static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 {
 	struct device *dev = ctx->dev;
 	unsigned long m, n;
-	u16 htotal;
 	int ret;
 	u8 post_divider = 0;
 
@@ -506,48 +656,12 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
 				MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes - 1);
 
-	/* Htotal */
-	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
-		ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_TOTAL_PIXELS_L, htotal & 0xFF);
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_TOTAL_PIXELS_H, htotal >> 8);
-	/* Hactive */
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_ACTIVE_PIXELS_L, ctx->dt.hactive.min & 0xFF);
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_ACTIVE_PIXELS_H, ctx->dt.hactive.min >> 8);
-	/* HFP */
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_FRONT_PORCH_L, ctx->dt.hfront_porch.min);
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_FRONT_PORCH_H,
-			ctx->dt.hfront_porch.min >> 8);
-	/* HWS */
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_SYNC_WIDTH_L, ctx->dt.hsync_len.min);
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_SYNC_WIDTH_H, ctx->dt.hsync_len.min >> 8);
-	/* HBP */
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_BACK_PORCH_L, ctx->dt.hback_porch.min);
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_BACK_PORCH_H, ctx->dt.hback_porch.min >> 8);
-	/* Vactive */
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE_LINES_L,
-			ctx->dt.vactive.min);
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE_LINES_H,
-			ctx->dt.vactive.min >> 8);
-	/* VFP */
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			VERTICAL_FRONT_PORCH, ctx->dt.vfront_porch.min);
-	/* VWS */
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			VERTICAL_SYNC_WIDTH, ctx->dt.vsync_len.min);
-	/* VBP */
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			VERTICAL_BACK_PORCH, ctx->dt.vback_porch.min);
+	/* Video Horizontal timing */
+	ret |= anx7625_h_timing_write(ctx, ctx->i2c.rx_p2_client, true);
+
+	/* Video Vertical timing */
+	ret |= anx7625_v_timing_write(ctx, ctx->i2c.rx_p2_client);
+
 	/* M value */
 	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
 			MIPI_PLL_M_NUM_23_16, (m >> 16) & 0xff);
@@ -663,9 +777,15 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "config dsi.\n");
 
-	/* DSC disable */
-	ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
-				R_DSC_CTRL_0, ~DSC_EN);
+	ret = anx7625_set_dsc_params(ctx);
+	if (anx7625_dsc_check(ctx))
+		/* DSC enable */
+		ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
+					R_DSC_CTRL_0, DSC_EN);
+	else
+		/* DSC disable */
+		ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
+					 R_DSC_CTRL_0, ~DSC_EN);
 
 	ret |= anx7625_api_dsi_config(ctx);
 
@@ -2083,6 +2203,7 @@ static int anx7625_setup_dsi_device(struct anx7625_data *ctx)
 		MIPI_DSI_MODE_VIDEO_HSE	|
 		MIPI_DSI_HS_PKT_END_ALIGNED;
 
+	dsi->dsc = &ctx->dsc;
 	ctx->dsi = dsi;
 
 	return 0;
@@ -2187,19 +2308,69 @@ anx7625_bridge_mode_valid(struct drm_bridge *bridge,
 	struct device *dev = ctx->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm mode checking\n");
+	if (mode->clock > SUPPORT_PIXEL_CLOCK)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->clock < SUPPORT_MIN_PIXEL_CLOCK)
+		return MODE_CLOCK_LOW;
 
-	/* Max 1200p at 5.4 Ghz, one lane, pixel clock 300M */
-	if (mode->clock > SUPPORT_PIXEL_CLOCK) {
-		DRM_DEV_DEBUG_DRIVER(dev,
-				     "drm mode invalid, pixelclock too high.\n");
+	/*
+	 * If hdisplay cannot be divided by DSC compress ratio, then display
+	 * will have overlap/shift issue
+	 */
+	if (mode->clock > DSC_PIXEL_CLOCK &&
+	    (mode->hdisplay % DSC_COMPRESS_RATIO != 0))
 		return MODE_CLOCK_HIGH;
-	}
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm mode valid.\n");
 
 	return MODE_OK;
 }
 
+static void anx7625_dsc_enable(struct anx7625_data *ctx, bool en)
+{
+	int ret;
+	struct device *dev = ctx->dev;
+
+	if (en) {
+		ctx->dsc.dsc_version_major = 1;
+		ctx->dsc.dsc_version_minor = 1;
+		ctx->dsc.slice_height = 8;
+		ctx->dsc.slice_width = ctx->dt.hactive.min / DSC_SLICE_NUM;
+		ctx->dsc.slice_count = DSC_SLICE_NUM;
+		ctx->dsc.bits_per_component = 8;
+		ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
+		ctx->dsc.block_pred_enable = true;
+		ctx->dsc.native_420 = false;
+		ctx->dsc.native_422 = false;
+		ctx->dsc.simple_422 = false;
+		ctx->dsc.vbr_enable = false;
+		ctx->dsc.convert_rgb = 1;
+		ctx->dsc.vbr_enable = 0;
+
+		drm_dsc_set_rc_buf_thresh(&ctx->dsc);
+		drm_dsc_set_const_params(&ctx->dsc);
+
+		ctx->dsc.initial_scale_value = drm_dsc_initial_scale_value(&ctx->dsc);
+		ctx->dsc.line_buf_depth = ctx->dsc.bits_per_component + 1;
+		ret = drm_dsc_setup_rc_params(&ctx->dsc, DRM_DSC_1_2_444);
+		if (ret < 0)
+			dev_warn(dev, "drm_dsc_setup_rc_params ret %d\n", ret);
+
+		ret = drm_dsc_compute_rc_parameters(&ctx->dsc);
+		if (ret)
+			dev_warn(dev, "drm dsc compute rc parameters failed ret %d\n", ret);
+
+		drm_dsc_pps_payload_pack((struct drm_dsc_picture_parameter_set *)&ctx->pps_table,
+					 &ctx->dsc);
+		dev_dbg(dev, "anx7625 enable dsc\n");
+	} else {
+		ctx->dsc.dsc_version_major = 0;
+		ctx->dsc.dsc_version_minor = 0;
+		dev_dbg(dev, "anx7625 disable dsc\n");
+	}
+}
+
 static void anx7625_bridge_mode_set(struct drm_bridge *bridge,
 				    const struct drm_display_mode *old_mode,
 				    const struct drm_display_mode *mode)
@@ -2244,6 +2415,8 @@ static void anx7625_bridge_mode_set(struct drm_bridge *bridge,
 	DRM_DEV_DEBUG_DRIVER(dev, "vsync_end(%d),vtotal(%d).\n",
 			     mode->vsync_end,
 			     mode->vtotal);
+
+	anx7625_dsc_enable(ctx, anx7625_dsc_check(ctx));
 }
 
 static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
@@ -2258,10 +2431,6 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
 
-	/* No need fixup for external monitor */
-	if (!ctx->pdata.panel_bridge)
-		return true;
-
 	hsync = mode->hsync_end - mode->hsync_start;
 	hfp = mode->hsync_start - mode->hdisplay;
 	hbp = mode->htotal - mode->hsync_end;
@@ -2272,12 +2441,24 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 			     hsync, hfp, hbp, adj->clock);
 	DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d), hsync_end(%d), htot(%d)\n",
 			     adj->hsync_start, adj->hsync_end, adj->htotal);
-
 	adj_hfp = hfp;
 	adj_hsync = hsync;
 	adj_hbp = hbp;
 	adj_hblanking = hblanking;
 
+	if (mode->clock > DSC_PIXEL_CLOCK) {
+		adj_hsync = DSC_HSYNC_LEN;
+		adj_hfp = DSC_HFP_LEN;
+		adj_hbp = DSC_HBP_LEN;
+		vref = (u32)div_u64((u64)adj->clock * 1000 * 1000,
+				    adj->htotal * adj->vtotal);
+		goto calculate_timing;
+	}
+
+	/* No need fixup for external monitor */
+	if (!ctx->pdata.panel_bridge)
+		return true;
+
 	/* HFP needs to be even */
 	if (hfp & 0x1) {
 		adj_hfp += 1;
@@ -2349,6 +2530,8 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 			adj_hfp -= delta_adj;
 	}
 
+calculate_timing:
+
 	DRM_DEV_DEBUG_DRIVER(dev, "after mode fixup\n");
 	DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d), hfp(%d), hbp(%d), clock(%d)\n",
 			     adj_hsync, adj_hfp, adj_hbp, adj->clock);
@@ -2357,6 +2540,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 	adj->hsync_start = adj->hdisplay + adj_hfp;
 	adj->hsync_end = adj->hsync_start + adj_hsync;
 	adj->htotal = adj->hsync_end + adj_hbp;
+	if (mode->clock > DSC_PIXEL_CLOCK)
+		adj->clock = (u32)div_u64((u64)vref * adj->htotal * adj->vtotal,
+					  1000 * 1000);
+
 	DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d), hsync_end(%d), htot(%d)\n",
 			     adj->hsync_start, adj->hsync_end, adj->htotal);
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index eb5580f1ab2f..50619d6f3545 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -149,6 +149,8 @@
 #define HFP_HBP_DEF		((HBLANKING_MIN - SYNC_LEN_DEF) / 2)
 #define VIDEO_CONTROL_0	0x08
 
+#define  TOTAL_LINES_L          0x12
+#define  TOTAL_LINES_H          0x13
 #define  ACTIVE_LINES_L         0x14
 #define  ACTIVE_LINES_H         0x15  /* Bit[7:6] are reserved */
 #define  VERTICAL_FRONT_PORCH   0x16
@@ -166,6 +168,32 @@
 #define  HORIZONTAL_BACK_PORCH_L      0x21
 #define  HORIZONTAL_BACK_PORCH_H      0x22  /* Bit[7:4] are reserved */
 
+#define  H_BLANK_L                    0x3E
+#define  H_BLANK_H                    0x3F
+#define  DSC_COMPRESS_RATIO           3
+#define  dsc_div(X)                   ((X) / DSC_COMPRESS_RATIO)
+#define  DSC_SLICE_NUM                2
+#define  DSC_PIXEL_CLOCK              250000
+#define  DSC_HSYNC_LEN                90
+#define  DSC_HFP_LEN                  177
+#define  DSC_HBP_LEN                  297
+
+#define  TOTAL_PIXEL_L_7E             0x50
+#define  TOTAL_PIXEL_H_7E             0x51  /* bit[7:6] are reserved */
+#define  ACTIVE_PIXEL_L_7E            0x52
+#define  ACTIVE_PIXEL_H_7E            0x53  /* bit[7:6] are reserved */
+#define  HORIZON_FRONT_PORCH_L_7E     0x54
+#define  HORIZON_FRONT_PORCH_H_7E     0x55
+#define  HORIZON_SYNC_WIDTH_L_7E      0x56
+#define  HORIZON_SYNC_WIDTH_H_7E      0x57
+#define  HORIZON_BACK_PORCH_L_7E      0x58
+#define  HORIZON_BACK_PORCH_H_7E      0x59
+
+#define  PPS_SIZE                     128
+#define  PPS_BLOCK_SIZE               32
+#define  R_PPS_REG_0                  0x80
+#define  R_I2C_1                      0x81
+
 /******** END of I2C Address 0x72 *********/
 
 /***************************************************************/
@@ -415,6 +443,7 @@ enum audio_wd_len {
 #define MAX_EDID_BLOCK	3
 #define EDID_TRY_CNT	3
 #define SUPPORT_PIXEL_CLOCK	300000
+#define SUPPORT_MIN_PIXEL_CLOCK	22000
 
 /***************** Display End *****************/
 
@@ -479,6 +508,8 @@ struct anx7625_data {
 	struct drm_connector *connector;
 	struct mipi_dsi_device *dsi;
 	struct drm_dp_aux aux;
+	struct drm_dsc_config dsc;
+	char pps_table[PPS_SIZE];
 };
 
 #endif  /* __ANX7625_H__ */
-- 
2.25.1

