Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0997AC3C21
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 10:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBB410E129;
	Mon, 26 May 2025 08:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Qn5K8F9T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011038.outbound.protection.outlook.com [52.101.125.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC23810E129
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 08:55:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkNaGIxq0Cv1RciZpfyP5HVvoe01/qj5tk2XtZWnF1VvKxX4qjtqeoLyKDX2yxVtu86HPEfUa8qMRTGpGbY8W8q6QK6vecLhhidpGg8yWqvxdSufCm5ZCKaxlDhqBAozL0esbv0iCX/CIWtyXRml+HlQ63wkNbYw97NyMZuxmXnTnADTqtKA4qvA4w4nKanvb3zU1KW5TBKUnZpiGjzAecNZsdx9n2Q6t0A4JlnXTDwnX+vVJMGAvxYYZfiAi2udktY6MuXQgYhkYKE11D1dzdvXw0zRCT2CoyjpuvWHyxPD9bT3/7bzgoayHj5s8G7LKEaQZrZxFk7I1JKy8D26ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95xLb+Qzl9cLW9FTiqQwZ22qztPcb8bK0fHXaY5OTFs=;
 b=zVbS2VmAPHXYgLbkxeXq2jOCIyRQebWudn5jSBu+fkFOwdU58+UO8II3VR+X8vn0TCUIMAG0M+kqvjew0PPf1xIFCZ9ScLnFYGniAO1QZKfk16vKDtS4OFu0Jf9xisBO3L8yKvcXA2aZxZjsUFg08wpybjSn26t4Yli0X/J+FcQQrCJ96a/y7gw8NyALtF/QPo0egzz8+AJeanVd/hZtfiAe4hjEWZHbqTKoFtWhlKT7dFFLMx8+LRuxfBWLsPeJ6RUrh+P1EgfDH+KWGUUoCuulg44JbPmE1SnVQdJikBHNpVDQ2hn0iLN9zcdq/pqYOWzkUCVs0md80upN4Y6ulw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95xLb+Qzl9cLW9FTiqQwZ22qztPcb8bK0fHXaY5OTFs=;
 b=Qn5K8F9TkIk+ZovC0okGYbIpLSgnFxBWns29U1H+1cotS3SPZmUM7yF9Gp3oPENUgurfyjwB3s3l5hAq7+43WG6vySwAHPYU3vCR3rEF2D3HYSFIQeZNhMFJkj71+5tDmD/+b11Re4s8EB+u6Msiqz4m16jVMoMz4emZZx6fWVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYYPR01MB6973.jpnprd01.prod.outlook.com (2603:1096:400:d4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 08:55:30 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 08:55:30 +0000
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
 Douglas Anderson <dianders@chromium.org>, Adam Ford <aford173@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set() with
 atomic_enable()
Date: Mon, 26 May 2025 10:54:52 +0200
Message-ID: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::12) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYYPR01MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3f38bf-c0f5-485a-edad-08dd9c331107
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WGdT66S6Z44AKi9MlL2LK+4FzaYem4IEF5mR849ZzF43S0EKLTGcn832bRuo?=
 =?us-ascii?Q?5ibrWBiWXAeuLdLUElYOwLTLZrerOrSEVsZ9+5JL10TSkA4SGOfwwM6MrE24?=
 =?us-ascii?Q?iHG/BBPG6buw37z8SYXIxs4uGo0i3y5M3Ykd12M/y5nY7PwZxnrGRE07VnbT?=
 =?us-ascii?Q?DpPkhPPPxXmhXy5IDxNU7P2FCdmTkWGfxagE8wUeMcOiX51hxYKs6D9QpnJ5?=
 =?us-ascii?Q?mfcfLyZY9cXgCjs1DkU2cvcZ9EHFl55znQ4bYZit5LF1oC2GdLdZdB50YWlS?=
 =?us-ascii?Q?N38/dS4MTmmIc+r/K4xF4AfWgxgfQ6XTyLkZsHQAO/p45eEFfsf32EtrHeSE?=
 =?us-ascii?Q?b7tQl1APK9kfXaWfiDCU7neDLnWBbFtayAj3jFv740YxegCSTfwkBTwaB6i5?=
 =?us-ascii?Q?/9XLdioGcOQxk3xK2vl7ZOe4lvcEuHj+AFWvL70j/xxfM9OC6Fhxui5bpXmk?=
 =?us-ascii?Q?4XFXvxdqrTNBSY8eZeUKpsb/i1jCscjbPOrCWxpWw8qqUubisWUlcmD1SMxn?=
 =?us-ascii?Q?Z0YRHNLxEsmrwgwMpotcSSEM2rgleJ5ZLe2G9BQnlR3uuqAip/TSScU3e70E?=
 =?us-ascii?Q?NdHTaBJJwixluP1ne5aLXR3agTKbcnY/K9jEQ2joLnchnZCGoLn0aCaWkyNP?=
 =?us-ascii?Q?tIDXot4Ww8aCx42WyRC+wtTUGIT+Y1btxbnk1zPgy3DRFCGCLcxvHHP+cdnf?=
 =?us-ascii?Q?vE1sz5CDDMf1h+CNnqBCWk49osxAA76VXUeRNhi+8iuJJflmnS7mH3lgMCUy?=
 =?us-ascii?Q?qJJBIApGPc7zm8DMc6PJ3X6lGSxxdABCq9CUPJqogHJJvlpB1PHU1ThAkof+?=
 =?us-ascii?Q?7+DyHOp5oYFtfEq3VvTk2nXtNZwxYZWx72JpHenS/MlsgifqwygEvxkZqDg4?=
 =?us-ascii?Q?2FpUQ0jCK6OdJGqLWR9h5/Fct9MJ81EvTXEMpRj/Kt4IVp7rR3L7kn4Wv9C7?=
 =?us-ascii?Q?lqHXk2Ttxnl18FYT9o0yQvTxUUsL3BRFPCH77WsdMufNg/lLx64HwfBX+VsU?=
 =?us-ascii?Q?8gtJkesB26TbKPuuQBpJpOhGo612NN8ncibuFj4GGV2qV1Oiw/zsOF7trVpn?=
 =?us-ascii?Q?JGhIJbzpHB2mTVABHBTePVx9IfmswpeRfJ4V6dH9Uap/fbgDbNNMF/5iQLv/?=
 =?us-ascii?Q?lS2s2MifAQIsbIW29RMNvk3uSJoxh+0kvGX+ZyQAF+plRjjIgJC3rVaxH2yH?=
 =?us-ascii?Q?Zvuf43EIlwQiskwIPyq3lDTIvnOdJ0zlYV7871gIGgMrJ5Utj+oD072q/GiG?=
 =?us-ascii?Q?uDdhgWkxYYaF0iSFXT0PUhD8mMSvK+hlLK7L6ApbwZeIblPTs6lXtO/FCmYL?=
 =?us-ascii?Q?GJD57+Q4D6XjT2JWnplFFOTQZRwiu6/rI2kOKBhemb1V0t7/vE1JXPUePZIb?=
 =?us-ascii?Q?gPsauexmdbD+0Y3vPFFZveal+6V2+7rtDcYrvofBvgjvReCP603YmymvtyIF?=
 =?us-ascii?Q?mIGnLbS5TkBKFFmln1v/u7x8iCBKrkG7m4Wh98bIwnzNlnHYqvj8vT/7eki1?=
 =?us-ascii?Q?SqxvIx2RGCXrXhc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?um/9NkiTKOYnZjmkjuD+ExASGNaa0Rf4p0CYMnWEaIM0nywR+DODVarIEDzi?=
 =?us-ascii?Q?6QC3eBIIntBJatqJGKZQd23yf8Wg7FitRaa8FFd9NWL3qnw+Z5v1yRlImwtH?=
 =?us-ascii?Q?bDNggpsBCcKawYwtreZw+Nb+o2osIkqPd1iL5AjR6+rZDJKdrMwWmLYHMGp1?=
 =?us-ascii?Q?AkDLjKZZX3VHx7DNlm294A9baUhIICVjlFoqnf70U1FtcM7c3P5merHtNdCk?=
 =?us-ascii?Q?jzq++VizX0uLhlruBcMScwKaxXp058qRU9zYe01J1RIb7ahUeUMPz5/N3qxA?=
 =?us-ascii?Q?rBn6wD0TT/O9TIprtMbcx96DCjYpQmAxYscP3rCzFV0UvtI7fcPKCsZgUajg?=
 =?us-ascii?Q?1zRBqNwunL5s2vtTRCI2WPy23laLgKSQdZ1/HX6GDmTiCqId7UtVv/9os0Xi?=
 =?us-ascii?Q?yJoJ6WI+tVSGQYJnJ5U2ao1Szmw9TfaKV/sa51gr+NBdOPrpGzK/ygzFWXKw?=
 =?us-ascii?Q?uxf/pbzooiRz3DA/FQGnh0zgF1Ky3uFcl7usT1erTE329wOmYsdilfrJ+8Am?=
 =?us-ascii?Q?DSCixYuFnaaBfMeE9OJCWGQym1KvuFJqXeuVZYjTlYaNzKKobfK9+5osLMrQ?=
 =?us-ascii?Q?csOmzRT5EoQ2UATJioj6F+k3EoE1QpwX8qrwb5M2Ns1DOades+LSmEwx/NCg?=
 =?us-ascii?Q?VNbaWeikRFgM499cBWRkZ92QeivxtZcO0cq/Dd1g9wHDCZ8emXt7I1PliaYo?=
 =?us-ascii?Q?DOa0MIhGbWujPXjD7adH7hYoOKqu2CEYxTsafJ3cs8vnSkFQv4tlM+aw4cZh?=
 =?us-ascii?Q?ijQ4XmaHWWHljC99jVYRd1koip5Q5agDEtIB8BroFT3lHW7969bswZWwxZuG?=
 =?us-ascii?Q?J3hX/MEo1OdTmq6YZLmI+P8ntO3LCUZ33IzMuwXki6txLTGx3gvZDVfWtzgn?=
 =?us-ascii?Q?gJupNFkf8w5u0WtNAipbhOHWE9yDqSuQaf8YYu+B+8236gKt0FNF3Nk/XxM9?=
 =?us-ascii?Q?MpNIIKYZkF8LjDjnSd24xGTDGuFuwcqttc/JN+AYK8jvLDNMd0nk/8Rn6flA?=
 =?us-ascii?Q?5Nso69lRlNyoL7GMefqQKJvZJWPh2+QB7L6zs8Mc7vae5swG050SDAajrJFt?=
 =?us-ascii?Q?fPi4U03gc9k5CpskjBZViOywM7vb3/8gFcNCfi+dEBkOTTIRlpKMGwmJx7di?=
 =?us-ascii?Q?q2jJbo/DPeKiPaq0VYdpTstupw/m+bSXNrBuEQMas+P/wyWitTwIdKq1xRF+?=
 =?us-ascii?Q?0ZnTLuoliMt9jqloBQEbg7GAG1GpXJgYxH+LJ52hCHotSbFyj6g50xy0ApId?=
 =?us-ascii?Q?+UupMYxlKDbjPQFiBwiVANjqzEXyvXyTdcAtCnrRWhUGv9/Qtd1Wlhv0Qfuh?=
 =?us-ascii?Q?p5BbYDs+TshtfmMQ38jya9Yp/fuHEFinOYpy7sLcbz5P9flfPD4/UCeL2R5e?=
 =?us-ascii?Q?eCf4mtOzfa8bsBsvZ51hYhtpfGEhV77v+tKI5VK2eeJ23E2JwabNOF54FRUU?=
 =?us-ascii?Q?6SxdlLAnmSFQQHnwy/5vkEKIRjlyVTFPO6TaqXhP3LGSokSPb8mCbit1JKX2?=
 =?us-ascii?Q?0rGOmwu6aneXhzsZ1sDzKlrkvbimVPXUYpwqI+yRRLSDBMgQJ20pakdTb0pU?=
 =?us-ascii?Q?HsgByji9yP7sDy+4w9p3s1yH2C7XtsHS/DQqMcwXFJMeNy7bxepwi4syGvUz?=
 =?us-ascii?Q?XHBJ/GZ6UsGRcYbZtJaPyj8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3f38bf-c0f5-485a-edad-08dd9c331107
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 08:55:30.1037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZK54+rLsaufizc+nbk4yOSiPwdw0Lwb9DjQ7c8fYKRaDJSUASnnF8bSS+hH41VTVxLqKHdaaWLx6gEtG/UcnZaFiDgMpQO5q5tjBOWTXPuBRi839WE3y95NjRSGSEU7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6973
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

After adv7511_mode_set() was merged into .atomic_enable(), only the
native resolution is working when using modetest.

This is caused by incorrect timings: adv7511_mode_set() must not be
merged into .atomic_enable().

Move adv7511_mode_set() back to the .mode_set() callback in
drm_bridge_funcs to restore correct behavior.

Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI connector helpers")
Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 22 ++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 8b7548448615..7a874bf645af 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -647,6 +647,7 @@ adv7511_detect(struct adv7511 *adv7511)
 }
 
 static void adv7511_mode_set(struct adv7511 *adv7511,
+			     const struct drm_display_mode *mode,
 			     const struct drm_display_mode *adj_mode)
 {
 	unsigned int low_refresh_rate;
@@ -717,11 +718,11 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 			vsync_polarity = 1;
 	}
 
-	if (drm_mode_vrefresh(adj_mode) <= 24)
+	if (drm_mode_vrefresh(mode) <= 24)
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_24HZ;
-	else if (drm_mode_vrefresh(adj_mode) <= 25)
+	else if (drm_mode_vrefresh(mode) <= 25)
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_25HZ;
-	else if (drm_mode_vrefresh(adj_mode) <= 30)
+	else if (drm_mode_vrefresh(mode) <= 30)
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_30HZ;
 	else
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_NONE;
@@ -743,7 +744,7 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 	 * supposed to give better results.
 	 */
 
-	adv7511->f_tmds = adj_mode->clock;
+	adv7511->f_tmds = mode->clock;
 }
 
 static int adv7511_connector_init(struct adv7511 *adv)
@@ -795,8 +796,6 @@ static void adv7511_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	adv7511_set_config_csc(adv, connector, adv->rgb);
 
-	adv7511_mode_set(adv, &crtc_state->adjusted_mode);
-
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 }
 
@@ -821,6 +820,16 @@ adv7511_bridge_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
+static void adv7511_bridge_mode_set(struct drm_bridge *bridge,
+				    const struct drm_display_mode *mode,
+				    const struct drm_display_mode *adj_mode)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+
+	/* should not be merged into atomic_enable() */
+	adv7511_mode_set(adv, mode, adj_mode);
+}
+
 static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
 						      const struct drm_display_info *info,
 		const struct drm_display_mode *mode)
@@ -917,6 +926,7 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs adv7511_bridge_funcs = {
+	.mode_set = adv7511_bridge_mode_set,
 	.mode_valid = adv7511_bridge_mode_valid,
 	.attach = adv7511_bridge_attach,
 	.detect = adv7511_bridge_detect,
-- 
2.43.0

