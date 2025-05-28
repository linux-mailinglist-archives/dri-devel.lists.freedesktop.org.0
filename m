Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD5CAC6293
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 09:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028B710E2AE;
	Wed, 28 May 2025 07:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XejANy6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1507A10E2AE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 07:05:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0Zpa1uenj0A6+yvm7vlLDJBBAxIOtYdXbGhaQ5yBeRhSZ8+Z5vZLhDD6k72MLLLSjCZqGQO3ftAJkVuJ+KmuoACQCjQI6lbQQMr4kXx8gDG0HIsuY71qGFdS42LSWFwMPkgeWS+7ZxE8pcmEpYR2GUMHVP6OnATBfwkCDwWhQLFMW9A/ga4jNDB3C4G55wuTEwTSMDTSO92iy9MhkzZ7rx3JRvjYHH/wn76hwz2fqsa8rrp2IlRq6XtDBC0cB0ErKGz0qgFquFuTGMapOrbBHz/uB0yDHgjTq405cUJqlI1P7eLQDNAtDK/pb0C6pXfRqC8eqgGkRn7f0A4g8v8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnND0Q7iVlvdTCz69VSKI4uL2snEJFU900ztBXAA2xI=;
 b=GYBOIAQUbTeTnuiL5Jy2E9GSShhx17cEe+aSw/4eGbNrCr2jN6Vf8bDQPGtymZ3C0xbHSxnGcBA8l/kl5sRdry6DPWReJIohrJeHWzm5qMKA6agoXLHYdw5JY96VAhpNvGN+OelMF7qIp06BpxdzB4vM/gpn7eieBZq8eO3em2YsQum5D267eW91skS2jJu9gX/y7SV+r1eHvRajCt7T/lWP9GmtOQnBoz+gA7SHOZIPKtK5DubVmqaK6a8VFTPmu94P2zH+/yPt8v1eMLfYz/Su9S41qWniaiKyl0241eWbj7mWRjPh78Aps84qUqqr3od0Br/kDBUjhFIC3KAcMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnND0Q7iVlvdTCz69VSKI4uL2snEJFU900ztBXAA2xI=;
 b=XejANy6xqOf0YjVW5nKAhhYPrFlFpBwMGZSJHEhjktDCtgMNiik/xmxIjZrA73prsYzU+O/h+4xizjaqESWJrzT3mqtlN7J5JRZpLXpKTi2v97EzI6im8eoEYUaOsQV8wllXQAYnHkzWdDiN/Y0NGgDtRTcSi+sR12IJWE8Ax3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYYPR01MB14051.jpnprd01.prod.outlook.com (2603:1096:405:210::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 07:05:37 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 07:05:36 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Adam Ford <aford173@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/bridge: adv7511: Move
 adv711_dsi_config_timing_gen() into adv7511_mode_set()
Date: Wed, 28 May 2025 09:04:37 +0200
Message-ID: <20250528070452.901183-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::8) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYYPR01MB14051:EE_
X-MS-Office365-Filtering-Correlation-Id: 31fc70a7-e50c-493e-4be5-08dd9db60b5e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KSy3bVEA0Mwj7P3yZvlvgtFmhpR6d7iNUfADBtFxuJo6RhePLge/a9CfQjtD?=
 =?us-ascii?Q?GCxBMu/UJ1xvk4MGRuCEehrOY24ETb4Lj8oFVvxA86wcL8HwnMJkrGV+vRBy?=
 =?us-ascii?Q?fEEOVDfmyAH+RrZl4kJAnh+mM/NNdK0TNUSvLiMy4QupXlkSZkMjohu2orQy?=
 =?us-ascii?Q?BDDbizo0XUMyNnk3gSHT9M3YG05bLgvXJP10zv9Wbi7BQshcjtlObyVHZkdS?=
 =?us-ascii?Q?8O8JIpmPQHz3OMV+83NfGPDqdcaEQjYwUlBwFg8LvYlmg7nLTo7spH+6UKBR?=
 =?us-ascii?Q?O+ccLAcp4ESCKzuUL+284oyIRvPhrfioZYyPxvd2/R7RKLsAoL3ICEsFQhlk?=
 =?us-ascii?Q?sABS+BZooX/uQG7vNWrf9xX4oswenQwYMu3hpe+KJ910g3AxTQxODmW6++BS?=
 =?us-ascii?Q?1y8/5vTXBajXZlE7n7XE0zky54ZpmZKUGlbvr4p05RseM3LBk4row3T5RTUi?=
 =?us-ascii?Q?3P9bgCj16eXpbYFKbjGTv7/NbVAZKQOuoiMg0Ujm9yruEWAaQC2miTaQ1NjT?=
 =?us-ascii?Q?XwE7nr6vVaGpt7zQwr3bibYGhM//FRfN9bKAJNH34TywtDwTKbnlzu5b+zGN?=
 =?us-ascii?Q?m012PkzjLUiBxR8iDcfUnIHmnNgL41G+N6OQaeXqJoMFqgZExirNwEu5sIM9?=
 =?us-ascii?Q?Ie3YMoxXbxXBc15oJ26yO6e8uyfh5UE6lSPSPo5q+XLACKJQSoBXSOBn8vmT?=
 =?us-ascii?Q?FgiMMgtbUmNrrkwGYEW+kNKHacXZktaLaHnfbvCvlGNFcuXPzXv5mSxkCFHM?=
 =?us-ascii?Q?8pauL66YD/n27xBCwImZpGdv6XzRap33BTqqRHFoeJfA7IWy6u6wL7+MtGq+?=
 =?us-ascii?Q?35hEFfPBPVtgWieZ9Xtng2i4LxUKVS7n7Fhf50sd6e4YHNzjxwrWuysH5ohw?=
 =?us-ascii?Q?SZEJobgkq2j3RaRyDyQbzXOJIlxiOYqBUCRatO6QPJGmwLpge8bWMDM9snA/?=
 =?us-ascii?Q?dzHpcXeF3KmBN0c7DufMgMNjSlRDbkIaQufSCuMgxVMB3z2tdrvo4/1PEmzK?=
 =?us-ascii?Q?N+WKJQpn1zIF1wRx7MTvg5Plbii94wk/28b+mB6lRRJVFsHK6e/EgMnmMVtA?=
 =?us-ascii?Q?0iZloMyx9lIPGflOE0dvBIfJB8j8SXPKcTJDwCRqSFrnyHeKxvQJn7mtxdx9?=
 =?us-ascii?Q?M2MQjckEbSz20bC0eyqRRcCHImwcFDzVtqBPR0SOT+P99jpYfbUXARvZwIdr?=
 =?us-ascii?Q?8ZdyAgsU+lciZTGJDEdnmpU3zcIw0t4BgdBTxvuB53kZkeNFKN0pZvUEiZ1r?=
 =?us-ascii?Q?gAGHspAY2b3EmA+6Vw8NphflICPrVMF+KO6qEQkUSldUbbchIlYO7FZY43eK?=
 =?us-ascii?Q?5WJzK2jybFNUWLyRhHCYrORIhae6oDTzIV9/tasQgTR+LrHCIQ/hm7MkWtO+?=
 =?us-ascii?Q?COtc4mP0boAq0x7VA8JaTnasQ3symdN6M+Um9LRzlyqlXCndh78DU2Z8ZJM1?=
 =?us-ascii?Q?ZoYWh37ufthRlHnK+isAmVM3hjLTNUvOogqMolZcsC+FniCsUAIPmOd6G9da?=
 =?us-ascii?Q?d663pzOlEl/nnTE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/o/InukoXv6jyy4xle/gfSKlGZwHKG/AdCweChoetiS2Yb8E28bcES6UoDj3?=
 =?us-ascii?Q?hoeD6Wa/yCo2ArzT2tY0+c9V4qL/ZXfoEB8hJVqPYuIhnZVYeXxRHmiBWSJh?=
 =?us-ascii?Q?Qwj1X6lv+tAvItr0Rxn0n+WfrULKqNtHgp42CPm3dwvo65PFSe8v1jdcW21J?=
 =?us-ascii?Q?WKAfUXHcKZV6gkkbSpUUGFG0fhgu1lv1F7Q4zgLbjKTySduKFkCaZWTYpdQT?=
 =?us-ascii?Q?VtjUt2xtz4qa/E9RwTw+LCIgCOr2dV5h0jy349wL2sBzkI/Og7uFxPOPbZVl?=
 =?us-ascii?Q?4K557y7BX+7+20XbjGGyq2bTDnG4IcM7l08wIPDLZKEdlkEozyuIFBViMqi9?=
 =?us-ascii?Q?xdHKEAAeS3qPa34/hvWbbQStVY1MRcuX7HIE2FDB+uEU6c9Z+rUTvOs7xHxl?=
 =?us-ascii?Q?5C4qmc87lAkVmMqjbtBmXbp+Nc7lYjMHoISR7kn8Zs286yi3G0DAYzWL4Ptt?=
 =?us-ascii?Q?8IWYsid7NwxQaHi3fgtsov61GJqsi2Qvy4fEJoj4g5diyBBZtt8ZPwrFv5Lf?=
 =?us-ascii?Q?rg5BpsewwfcsnAcng0OKFRp39cBiYVJITZ13GoN/vS3Zw49ALBS+pDFpA0y3?=
 =?us-ascii?Q?9RERXu02jjRJjydBXBCmC766ioM62MYt23lAsmQxN3r3vN9JBiw8SCoMAO31?=
 =?us-ascii?Q?InRuj11ZQbUUZWP/y/9MwWpG/h05mw9q6sHBqMkAB1swuSlfcNNlrYeAItbv?=
 =?us-ascii?Q?UC5YeuM5zFgA1SM3JUp3WBxV8Ie5QBR2+rdu8JaTsES6TUwGFpWDQV1KGH9k?=
 =?us-ascii?Q?BR6CDUygG9FxOUjlVBdvOoIdEo5QQl5/2tQ0/rwMg2eAqb2hbr92vJiJ4v7W?=
 =?us-ascii?Q?mzlSoU+jdLa/u/CFMCtdqBW5UJjRFoDQ5+VRZgGOMcgkVzfAaQ3+r18P2Je6?=
 =?us-ascii?Q?gXiVJxGvTWiOW9D1CXturTnTEdYciYhdqUtJcuU2g+vZYi5rbRfCjwuDLZ3i?=
 =?us-ascii?Q?q17HJy9bT7NyP2BgwFEzYSbjcM9KkXuS11rwFJ2PisDZ5Hxv1lLl4zGrM3B4?=
 =?us-ascii?Q?PQ3PoKoHwwDU9K7j2zX6ZmgV8syiM93baXOmEhBz8zXmvrTP5vezKBrp5WjT?=
 =?us-ascii?Q?hVI6QbQHvSDYAOmLqtt5v9LKDW84OxmlplUWmiEHy9dOOVY8mqtw1sUcqZrm?=
 =?us-ascii?Q?2N9rarCVLMOCAQcOll1QhcjrvJ4fx3yn/qGOStF8GmHcH7oes+LBqjE9iP5/?=
 =?us-ascii?Q?G7mXVll7gwTQc/XFVZWzAprwDXmuOH5RP/B2a5reghCBWJ1gSKO8fTYHrVqI?=
 =?us-ascii?Q?rwawMUCaF9yDGurlxWgcTJITcb7U7ZIZcDSVYfLUVsqMbBJP99HWJvnx9s8b?=
 =?us-ascii?Q?kc0pXfr20CehlXQyayZXqkjJuas11wqjIT8C2mnuekbAKtNoNNlT64YObY3/?=
 =?us-ascii?Q?l5R2Lz/0dM8VM5NEDLDXw8jVxnGe/iMRQ6++RRCd++VMfu22NXM9jOU0W3dA?=
 =?us-ascii?Q?/oBGwNdaApOrQcBwRtZ5mpBYmUguD9mG1b6k2ROrAOuhfBoREYfFVzQ6IBUd?=
 =?us-ascii?Q?qhitqqKq9CO365P+oMCy2ovEo6YqDmEjnz+/Pp6n0XLjEZ9TkZSOA99hSKHZ?=
 =?us-ascii?Q?sjq74GsKCZDpHQb2HZzF3T8qYJqq7n+2XGuYpg9prZGKBgh/b5CeyoRY8nIu?=
 =?us-ascii?Q?TwN9GbzMS7Iol4gPel5cZ6c=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31fc70a7-e50c-493e-4be5-08dd9db60b5e
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 07:05:36.0472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEK9h5y72/u7aWhLmdp7WylfPkJ8Krc9oR3YHA9+4XL/N2kt5Hq2muTx1anhqFjqZHx1qOiGFVm/LutBFtb6GIa0BHwBJWIJVv0yWeZkHgJD8sI91JBCK7kld/FOsch3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14051
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

adv7511_mode_set() currently updates only the sync registers of the ADV
bridge. At the end, drm_mode_copy() updates the current mode, but the
horizontal and vertical porch registers of the ADV bridge still retain
values from the old mode.

Move adv7511_dsi_config_timing_gen() into adv7511_mode_set() to ensure
the horizontal and vertical porch registers are correctly updated.

Fixes: ae01d3183d2763ed ("drm/bridge: adv7511: switch to the HDMI connector helpers")
Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Fixed Fixes tag.
 - Moved adv711_dsi_config_timing_gen() into adv7511_mode_set()
 - Updated commit body + commit msg + content

 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 2 ++
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 4 ++++
 drivers/gpu/drm/bridge/adv7511/adv7533.c     | 5 +----
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 90c9a3da2406..6150d57ff9af 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -422,6 +422,8 @@ int adv7533_patch_cec_registers(struct adv7511 *adv);
 int adv7533_attach_dsi(struct adv7511 *adv);
 int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv);
 
+void adv7511_dsi_config_timing_gen(struct adv7511 *adv);
+
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 int adv7511_hdmi_audio_startup(struct drm_connector *connector,
 			       struct drm_bridge *bridge);
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 8b7548448615..b58e9e2c6489 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -738,6 +738,10 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 
 	drm_mode_copy(&adv7511->curr_mode, adj_mode);
 
+	/* Update horizontal/vertical porch params */
+	if (adv7511->info->has_dsi && adv7511->use_timing_gen)
+		adv7511_dsi_config_timing_gen(adv7511);
+
 	/*
 	 * TODO Test first order 4:2:2 to 4:4:4 up conversion method, which is
 	 * supposed to give better results.
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index b12d422343fc..df8180e6d733 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -24,7 +24,7 @@ static const struct reg_sequence adv7533_cec_fixed_registers[] = {
 	{ 0x05, 0xc8 },
 };
 
-static void adv7511_dsi_config_timing_gen(struct adv7511 *adv)
+void adv7511_dsi_config_timing_gen(struct adv7511 *adv)
 {
 	struct mipi_dsi_device *dsi = adv->dsi;
 	struct drm_display_mode *mode = &adv->curr_mode;
@@ -67,9 +67,6 @@ void adv7533_dsi_power_on(struct adv7511 *adv)
 {
 	struct mipi_dsi_device *dsi = adv->dsi;
 
-	if (adv->use_timing_gen)
-		adv7511_dsi_config_timing_gen(adv);
-
 	/* set number of dsi lanes */
 	regmap_write(adv->regmap_cec, 0x1c, dsi->lanes << 4);
 
-- 
2.43.0

