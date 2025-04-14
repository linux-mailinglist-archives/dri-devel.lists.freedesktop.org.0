Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF02A87CDC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 12:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F4010E548;
	Mon, 14 Apr 2025 10:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="SbJF7Gde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU002.outbound.protection.outlook.com
 (mail-westusazon11023079.outbound.protection.outlook.com [52.101.44.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B2310E53F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 10:05:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Swo2lC+J/2mH9TdDgysF7eO+fEB4bY03oao4uePI1shFax3hRoS4VyIstNmH6EEhGrEHFk0npL9FyKGnvdUM1IhrRIsDbkE5QLDPOj+b6xR+9FyQaI5AwaEQEsVvxfQwyx5gJ5NyBTboVvji8t4u+BoqSBOXx4rNlTIWomKF2NpXpqkjzShEedV72Hu0RdRc571lau+sFcRpJgG5N7oO3UmkHz+3JQVcoqx4lmK6esTfFJj/yBZd1ogt/bwGXUDXgsEzFbt5BaaUO9cp3Iehv27Ck4wYjiJHX8A7bX7pwFsfqNMZ30D6A9/ggZzrYpn89Q8FYogyb/nyjqreppUxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkRnhUrcll5XUXgHCXDWnuT11ZtZt1YzJ2r2p0sx9/E=;
 b=HvPKbZPG4bloQ1SMM/6lBfV9IhcKQ2YUZu88H9d2sU87xCc/AfsdE23so8wCrJrI6oGtEZ+/i7FoHWMZxMKVBpJoCZyvrSyc1L6AVUjcESX6UG+TUP0Mt2R8cE0gDPKNQBzV8GDvABnWikGCQ2SNmjKVOHdLY9Bva7/zqMAWRUnYiD6tGBi+x/gQC38XTAdvCZp2Y3rTl5zOy9xdLLIyfp2HOFBn449UKFmEkvk9TZzstPJsGoqGOmKbOD8oiVU/gGycy+BlP5kjhnos1d42sHFBjqlMvaIIEQTVyZImfRAoSXCoLKt7lTanESNvNs6le92bq2dWA3nSUufApZoD7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkRnhUrcll5XUXgHCXDWnuT11ZtZt1YzJ2r2p0sx9/E=;
 b=SbJF7GdeQfF4tBq7mUqCSbK/9bKHocd9T9+FuCCERPtSbmujcsGDX6+c0LrqT5L/2Cag9Yb4qQ0mVFFX1SW+DxMF28QKNmAMLyzwSxGuSHA2Btt6y79JA4EwEXS46a28YeSohldcr5JIvMDIH/ah74Gm7j6QgC9+H2z5hJRUl/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by LV8PR04MB9268.namprd04.prod.outlook.com (2603:10b6:408:256::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Mon, 14 Apr
 2025 10:05:21 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 10:05:20 +0000
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
Subject: [PATCH v3 1/3] drm/bridge:anx7625: Refactoring timing programming
Date: Mon, 14 Apr 2025 18:05:00 +0800
Message-Id: <20250414100502.1604717-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0047.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::13) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR04MB6739:EE_|LV8PR04MB9268:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a7c743a-049d-4472-ed61-08dd7b3bdd30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|7416014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1WEcDK2ridLgrhPuM/GdQAsnUha+DtBFUGQxqVbt4H/vdHlVeIvHLmcZ7Hcn?=
 =?us-ascii?Q?6RFKDltg8ktss3H2orgGWV+ooypMZieSF5cHpBb6oxmraMJy8Ga81HBssxuz?=
 =?us-ascii?Q?7am49oJRMjq1x2nlrfgNg9t0n9QYrNIVIaC+TlX41Tu0OMwXQo7dEyyQAq7A?=
 =?us-ascii?Q?2PfAojEkgtqTDso+lPDpyVrEPWSL5wOgMiyVQpKAfYFXFTKUytm27glsiMWM?=
 =?us-ascii?Q?8Nit4/WQngP6l8WI+jAgNZjYEssISjHzhM//sNQHHQq4YSa7goS4T1Z/8qn8?=
 =?us-ascii?Q?xUP0BjJd5+8ULbH+EKHN9goOZSNlaS74ECJw2qNWQtF1WIbkX0ZFLM5WTzjn?=
 =?us-ascii?Q?KxqqBNhEa0U//SOkHDVisuCY3jwPsnbpbJuTS1viYFWxzV9Ds1YIMbhdwxeW?=
 =?us-ascii?Q?Tc3IjWsacZ6XUP9OGp+eh+Y+2LzyNuBxVBiMyAC8LGcIK/IHVqi1Vey/Wig0?=
 =?us-ascii?Q?KHCkfPqPJEJ5v2pNRC8o65GZxdMVlRu79g8sAAhXRWeNQGXtKnOwuzswb71E?=
 =?us-ascii?Q?PCdRJW3Az5kEfHRLLWKM7GddPuD686sP/6AyYn1wsvuCfyvHKwxAlRG1VQ4F?=
 =?us-ascii?Q?4s9YqyWrNVQwe8ULv80C9zfAYG0hWcGiWdX1VeqX0lpyE+la+4RC35WKGTJf?=
 =?us-ascii?Q?m9eItyiP1yVlx+U23Xvxtlzj2BARFWhjvD3KJDYm3w/ZYq/4YTsemcDmIOV9?=
 =?us-ascii?Q?GVUFWjibS6MhqEfGvoBPSsupKCEriJHMn2m3jhFuwsiZbCKwPAhjRd9SoB16?=
 =?us-ascii?Q?k5U0telLe5LKl7IMeCtrKdVde4PDKFiVUYEn/FJGX9SlcI+0rR+A1v7x1rZ3?=
 =?us-ascii?Q?Qkf5MLF9OfZ5ViW0a45fAgM8VGOUAIryRI7ogvjXldadKnpG+u32WQ23jY4a?=
 =?us-ascii?Q?7bCcUmn2Qtr0jLFnHYJjxTzOcqlYvFbTYo6C8SRyBQCGP6q5UixfffbTlN+n?=
 =?us-ascii?Q?8lER83A9LlKbgYjagKbJcR2NJxWViOwORNkxNjzU8uhKnKwzwpD+bAo0SUEG?=
 =?us-ascii?Q?8g1aJSFUaTSIXCjVieg9h0fDjacBhTi/AtEUn7dcjxjQm8hnzY8psGs1XBML?=
 =?us-ascii?Q?RCdsYzmdO0vTrwLsJ2g21mB1q7BWxsX436yNUMKDXLHC9MAPeZh0GnHAkjXr?=
 =?us-ascii?Q?OjpaUMrz3d7hGsIqFzP4s2jg/uQayEu+E1Ulix1a33s34ln9x5dZ+Ur98wkQ?=
 =?us-ascii?Q?B6YuJ2ta/8oA4CjSF7V6aJfYn6V0RsPo3fK2IJw6H3ovU+romOPr1x1g5wZY?=
 =?us-ascii?Q?hoL/1poBoMubaFkhtNe5nVQkZa/4rAKGUDAiTuV3eQKc+IahreyrQ80zmTDE?=
 =?us-ascii?Q?fZHt/vPbLljK+P+ccU/OtzMjw54Cm+xi1BgXU6ucqKoYviuU+5Ywxu52TI9A?=
 =?us-ascii?Q?8s6+K59/ke15Ea5HzfQE8cvOKlZLI5V5XxHKvrnZSg1c1O/nlG+a2OwEph+A?=
 =?us-ascii?Q?UqmeCbdgVcIOARIkWAXiaX51FeMjoqW4Y+X4rpWfvc9QSk+4XaTkY+ApqMPw?=
 =?us-ascii?Q?jfPCM8h5YrLtCLs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(7416014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iRFnjuE+isoOuHoq0ZAG6hgBTj5Anp5aMa8ksc9es5SCoQurTr56hPjQncef?=
 =?us-ascii?Q?DaWtOYcugN7z51MMoWEt4JycQdS+pZMpk1T2gC5zKMx4UlPLITwpnBZ3btLK?=
 =?us-ascii?Q?ldCopClx14Ma5HF1Bz3WlAG1R7R77a2SLcYCrQ2StJd3bedZ87KfbK/A0cW3?=
 =?us-ascii?Q?TV60QPJyZif0H1us+BTs6589/uMxE5P1Jwiyg29cOmu81wU/OkzqfzEFeMc1?=
 =?us-ascii?Q?2uL7z159227ZRuVjB1jLARg2tems51uRWDsOTjWv3YujLyOin2E/c9OcRNSZ?=
 =?us-ascii?Q?ttqsiuAPQq7GWp56BoTtuhxii/Cbt0A+XCABjkStMEVf4a5Jw8J4a+yZ18aD?=
 =?us-ascii?Q?vQTSRosyYn6x3MyzJcFWuKCsQIjHcJza53I1ieedaNwue/Mwk8LNR7zr7bLI?=
 =?us-ascii?Q?NjZma2KuCn+bp7nILFDxk8bmPO3FA5695by+Nj8Trs70pZ5slszJFEZANS06?=
 =?us-ascii?Q?utb7PL9fSP0uYRX9RXj768sIUNLQ1UAKP5CBsmspAuVPfiXwzf2bZkybTo/m?=
 =?us-ascii?Q?XOT6Yy6kKwSO0RFLf1Mti6VP5m9l2UWv4MQjqJi7baYz0pv9OhjuKPze7SSM?=
 =?us-ascii?Q?m22xqxQokPRKVlsTfyqCWjX3AqyD7nQIzEJRjCtN4tmLdEi2baD3SUHGhCcc?=
 =?us-ascii?Q?vzC8XUQ5CC1jfKJCc7MOfqb7Nxz8yovLBw+yFiQNJbAfF7/HuI9iYqCf07Ta?=
 =?us-ascii?Q?segBpeqp9VprjfwfycE4MfO32dSe9VwScKLo9IbfMCVk+YrpAYXPPZTZkxbk?=
 =?us-ascii?Q?rJAcpnCpt04p2o+sgiRs5nNtboXMKSTRs9Zsw2BY060bLNLX9BGAHxwtmZzh?=
 =?us-ascii?Q?U6o/slSOoR9t5ulHaxtSfHlU8OctwlGEyLwThilRkWru7tkb8RXYwrPP9zRq?=
 =?us-ascii?Q?f1mFOQQ4FdgZijZ+8+bzReIEvJueYaJqoPDUfEsuiX82bWzs0AOyXQ679luQ?=
 =?us-ascii?Q?+dqUNwvnTqB0plHfEFWD+1WlTUKeZmWgPwIAp8e/NFg9JObqmF0takCBbjkS?=
 =?us-ascii?Q?M4mkonSrUS8arPAEUI04XCdhPx3lxVrDdy8YwO743Y3LJGUMMDYvJSkuYSME?=
 =?us-ascii?Q?vxLErboZ5xU+dyAjF7c+86lrx3JaG7p2N/dM/GYRbKNNA6n9h6Lhn2jaWGiL?=
 =?us-ascii?Q?nlFkUBc1tZL+3Bm0kRjOlkN4zI5HnoAoFFYbw/TL54oED910I3zwkD74bBrk?=
 =?us-ascii?Q?u4cCfFXEMB4I250V5C+whYr75Uu9VcdiOr5kT9OvFGk72Fm/O/ckcFlrnSwl?=
 =?us-ascii?Q?dQxMu69x0lj1abxJuvnR/ot0jh63wGhBlkl8BxxgbXlwbpzTkfe/UI5/Ufv2?=
 =?us-ascii?Q?Vxi6w+NTsfAHGD3t5G1Vd8zw0xPJDp/NS9pG8sC4siFqkQXBSNyLS59hLxLg?=
 =?us-ascii?Q?uSV0BfSliOhfnaBwOGGhDHuckuGRw9XBhYUr10o2i5MN3LpHw8E8lnhjhp71?=
 =?us-ascii?Q?2+PuHK0pLV1eWCxNB6mcGAzB4WuSZSWHGGP7N2/EtLcdj8rAcQx9oKnXNgoE?=
 =?us-ascii?Q?X+uyI1iW0/NV4D2SSD4nNMpd7WTcb/o0T8JW+fSpKcc9gmDZ6wKiXD2uPanl?=
 =?us-ascii?Q?GvfbyoOQeDsQUod/oinAowtwV/Y2KpeB8WR03n2CR7fQgyFFmzFwkVMJxgH3?=
 =?us-ascii?Q?mQ=3D=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7c743a-049d-4472-ed61-08dd7b3bdd30
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 10:05:20.2640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tf5P6VA6kewIQBh8S/+VdYFylYXnDf+LH+lJI/aI9/6hhTPX9rZ8HxtqDcd6yzAec/FxiafG/jO3gnpje0zoXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR04MB9268
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

Refactoring timing programming into two functions.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 124 ++++++++++++++--------
 drivers/gpu/drm/bridge/analogix/anx7625.h |   4 +
 2 files changed, 85 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 0b61e77c0398..8928971558d2 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -476,11 +476,85 @@ static int anx7625_set_k_value(struct anx7625_data *ctx)
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
+				  bool dsc_check)
+{
+	u16 htotal;
+	int ret;
+
+	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
+			 ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
+	/* Htotal */
+	ret = anx7625_h_timing_reg_write(ctx, client, HORIZONTAL_TOTAL_PIXELS_L,
+					 htotal, dsc_check);
+	/* Hactive */
+	ret |= anx7625_h_timing_reg_write(ctx, client, HORIZONTAL_ACTIVE_PIXELS_L,
+					  ctx->dt.hactive.min, dsc_check);
+	/* HFP */
+	ret |= anx7625_h_timing_reg_write(ctx, client, HORIZONTAL_FRONT_PORCH_L,
+					  ctx->dt.hfront_porch.min, dsc_check);
+	/* HWS */
+	ret |= anx7625_h_timing_reg_write(ctx, client, HORIZONTAL_SYNC_WIDTH_L,
+					  ctx->dt.hsync_len.min, dsc_check);
+	/* HBP */
+	ret |= anx7625_h_timing_reg_write(ctx, client, HORIZONTAL_BACK_PORCH_L,
+					  ctx->dt.hback_porch.min, dsc_check);
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
 static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 {
 	struct device *dev = ctx->dev;
 	unsigned long m, n;
-	u16 htotal;
 	int ret;
 	u8 post_divider = 0;
 
@@ -506,48 +580,12 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
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
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index eb5580f1ab2f..df9efecae55a 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -166,6 +166,10 @@
 #define  HORIZONTAL_BACK_PORCH_L      0x21
 #define  HORIZONTAL_BACK_PORCH_H      0x22  /* Bit[7:4] are reserved */
 
+#define  DSC_COMPRESS_RATIO           3
+#define  dsc_div(X)                   ((X) / DSC_COMPRESS_RATIO)
+#define  DSC_PIXEL_CLOCK              250000
+
 /******** END of I2C Address 0x72 *********/
 
 /***************************************************************/
-- 
2.25.1

