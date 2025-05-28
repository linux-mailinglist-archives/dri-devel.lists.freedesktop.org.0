Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35E2AC6294
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 09:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1069D10E2AF;
	Wed, 28 May 2025 07:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Nyzlk55C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010058.outbound.protection.outlook.com [52.101.228.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2241110E582
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 07:05:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIn87MVsTWR3503AWJg6WS3W3Wp0mp2YoRnyYXArt16sRKhv66pxgkG64CLj/X5JL1wyIRVsreTummoKgoi17pyainMyF/U3GR7xM5g/IpQcRoBuuvxiI9VDselrOsll2ExDhgi0D0skoEG6XwewSw2Pk0pLcp/e5XG1OUTHOVISASFzdCa7Mb6UfkcMvmG4QhONybihCtQmcd5Dthrzs4JTmKWsErbU7NyraGvFwx3F+30adCa9FjkKQmAZ8LnBuNvnz0zdI/Qra5JCcgTqKrUi6+RWjeqThQd+hq72HWgpsOFMZllxPfibYDQjJSYcTwbhVBLs2QFv520fOttphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nchC91hQ0FCuFceiJUOOdWY0vXrn0/B8rT3CarVYT9c=;
 b=YUP1SwLdeEvmyox4encVtvqtV1ejqlxlUPLvBsREN4GQVX6sYeaE62ATM9yCdkO5SF+H8pBUBFAEo1LnZhiR8FjUF7LC/oH2m+1mACPGxV9yilbRsicOab5kslkdgYXPeIaOUgvwY5b+SRXQPnpwOu+JPi73gV1/wrgCAgW60VlefZK6dyH2WvhLhFRp82/+dVnPhinXGfhERp58N+EAMO+ybrT5azqGnwpkfuH4vvAsxzLeSAR1cTSnRy5OHyaB2/hhJh8v7wpDw6yT4GqLjxwe+kivM0rmyqGGYrDQg/pUyIL47RpFii4wUGCez/epAFffCn1HxsWFivZQ4Nfx/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nchC91hQ0FCuFceiJUOOdWY0vXrn0/B8rT3CarVYT9c=;
 b=Nyzlk55C6SFGSVRyIetysIPQ/mZLl7SfF7nUppW+xrAdKDPcxfyXZsQZZNE6im3EUbbqQUUEavvbo1Mj7LEwUwdEg24MG3iSaC07R0Qk9KS+KO9jojcWkl2CC4rKFgVGUAZ96DtvUJ0V4SmKJwtyhIg6rxIzBF4ifk8TvVHaePY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYYPR01MB14051.jpnprd01.prod.outlook.com (2603:1096:405:210::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 07:05:46 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 07:05:46 +0000
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
 Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/bridge: adv7511: Rename
 adv7511_dsi_config_timing_gen() into adv7533_dsi_config_timing_gen()
Date: Wed, 28 May 2025 09:04:38 +0200
Message-ID: <20250528070452.901183-3-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6408b158-cbb9-48d4-baf5-08dd9db611a2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2jIhnCsRmV5X3QzwAcAF3V+HM9jEk6j3uSY3UEcF94eQSE5RrlhUSqxF3hEE?=
 =?us-ascii?Q?Uk8IW2REQCusSD55LYYfz24ErhwE3KOuJyGxgD65hdAphsUvCVda6HZykSrz?=
 =?us-ascii?Q?XmjDk5PGGz+X5AV5Wapig8Y1kIqbCi9XnbKux7N6k+jILs3ZBxwq5GKV7JL7?=
 =?us-ascii?Q?NsTRFC4u2AWcWy8OAchY8b3d/rZyFAiaeXA1H2NPYnzOB2bS8YXYXOWSWfNG?=
 =?us-ascii?Q?NIDXWc9zwOmtcGauoRsmkn6ijwSfH/JRid5ehwgSl9m7aZaQajaADJBpsSqP?=
 =?us-ascii?Q?riic+IAHH8+jBast0r6T8k/QVjeAimpIBq7zQqT27xlwH09PgNuAfpiEsgvb?=
 =?us-ascii?Q?4LTto8DAqNiNh1y5F38n1zIIA13hKTDConqMyis/krGGDXJpmPCbeyQ8X6AN?=
 =?us-ascii?Q?rCe9d8htlNvy8UpYVZmKQy9+EGBtpvjv9+em76NRciCOViTSFFzY6CyqBByA?=
 =?us-ascii?Q?h/bE7uWHyTyZiWfpQBs80pk5jSTzLgOdMqIs6Sa/Neic4VG1nZ5Nkaeut4T+?=
 =?us-ascii?Q?UYIhW8qe0UM36JOsOtoPBPsXwZBV8ZkOJNVq/eGG+y5O6QxyyWWGZeyg5feU?=
 =?us-ascii?Q?2gz0yFZ9Q5j9RufW+ZzY86PX4k2/PmkMhCBFhYzBZlnTRzrSuKZUeG5f2gmN?=
 =?us-ascii?Q?3bgiluiNLTOGfXCbaAgLcsia5fuJ63q46rTJx7vmP8MvSgKmzaq0bEsg4Yxs?=
 =?us-ascii?Q?XEwsxOA4sa+XYU5mt6gVZzYSMg607VW/3ynE9LPTL8Rf3m76dS/x/flGuZoB?=
 =?us-ascii?Q?lTUTUnhiFuEyZo3EsACuk6SXqAoakhHNcV05z5NbBoMxUy3TBIskfa9SVocU?=
 =?us-ascii?Q?1HvKI4sX0g78g3qSlHMaL0WWIfMHVnziE2+r3tNfuOf7XpRmNtc3XfOWvQ4i?=
 =?us-ascii?Q?/7arGE4iW683QIq1+WaP3gCZ/rcZujDXBz2gbpTds25MU9Y7euNt4LVZ0+9o?=
 =?us-ascii?Q?tXUFuFgy0Y6tNBmasfFvxZd67WcSDLzE2zXB/+hP0iRCbnHsFgK5reAmkTre?=
 =?us-ascii?Q?ImBRmvXHxvQ4CAX2FPUDJy5ZEHqKE9E4gUwNzqmt1zcSL7Q+fX0L0e6EoIzq?=
 =?us-ascii?Q?KEHiq0DwkuQv7yXxwd8wlgxfu9GToNWEF9qFwv0Qs0rPhrwm3QYFnAyjedkj?=
 =?us-ascii?Q?QqM8tHgBGV9d6RhA0/n2b2HzUUwIkPAQkycSX+ZPfPrVDQq40EykaU4M53ZX?=
 =?us-ascii?Q?VeK+br58/YplQo8/52jr0GCYGD04IrWD1+oXqBEvOUNlei5UtB89kmUlv5b0?=
 =?us-ascii?Q?+mIM/0E9cplYy4nlp19BIGy8raVE2n790gtUjKZTwcQbtJMAfPMIuP41ipDq?=
 =?us-ascii?Q?aE31KMTPQelQ+cKwVC0Y4emoGA4nPmOUjWhnD//1lyYn+MdOfhcXHxnHlqKl?=
 =?us-ascii?Q?HVk+75BaIQJt6nmnIZ/vjnZiAe+WKYcO/nN24RubglKKsSuenU7prOVix68T?=
 =?us-ascii?Q?obkpTbdDeovRk37ksRCKBcbybEmZajO3Uc1Gk5UWvyfIF0xP9tqpWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WL0hI+A7jmeNPFlRzFa0+JcsGyloCwDwvnbiJ0IN0bdwu46Pj0csFFWz6fJJ?=
 =?us-ascii?Q?q/yAIwKU/aDW9hrFeJxdUccUvOA3lREv3AJ0p5SOvB50fuP4dqX0nNpWlGtT?=
 =?us-ascii?Q?0oLuuhoVeiuoTvBRaYI79Q1maQdUbL1O/x57GhMFmzmYqMv1rnd7pnnFzuM6?=
 =?us-ascii?Q?Z8SLZngsDSO5Q9MOC36427uE8inAZQku+S5SZnsi9PmVkq81jE9r3l7GTQnw?=
 =?us-ascii?Q?XBCXL80amhTQWsI7JnxvMgSsIiQ35w4BWHHADAUzX98HU/CioaQ7i8nKyKts?=
 =?us-ascii?Q?zT3G0EA+L8YLYeT1ceaXV34gCE3QA8uBgvftmiA73X8PVBZH96RPLr/kbzuo?=
 =?us-ascii?Q?PEtJxlnnsUMeJubxNHU0dusa5k4WTSxjMbb72Dsf2EP59+Tv2E9CMPYgiQER?=
 =?us-ascii?Q?z1vhZtiIkuB82L7MfpGmLdIfMMTEmifXZWXay8eW+/b25VfplaEnbnGADfdp?=
 =?us-ascii?Q?tzRkuEgnug1NvNkJHem/cVR039evkIxDv6Z2CphJzsuoPx2L9v7Hb4lEHifi?=
 =?us-ascii?Q?wZn6P/x3uTKWN17lAc1Ih3W4mJ1Rtj2k60OdIVwGIWLV15IsXlzCmHGu7cv4?=
 =?us-ascii?Q?zNFt3juvxLACXkdELOdFAVxLC3rWZtdsngGtEsSpRFyTD9CdZHvM4nKvJvwA?=
 =?us-ascii?Q?4otb6C/nRTwATUV0LGwmTdlAv4ZFKhs4WNQB5f10xg3SeInn1Gk+6A1+XUxy?=
 =?us-ascii?Q?fn68EGTfcH9Dvpn9rkIk+rbfUlGI7RphCAmpwxv59gRWk6KrSQPUK5XONnr3?=
 =?us-ascii?Q?kyutP7YluQnienGuwksM+t6XM2AfHdjd2xFds97k6lOBxDxU55oF7VtCvd7J?=
 =?us-ascii?Q?aGRL8dB05hV95IO2x1FFVAL61pOFBSclDb8DKkJXK8kcr9E4yYTaObiIpmpx?=
 =?us-ascii?Q?pxfNw5ESVF6TaBQf5oTbNtUXKTFKw5xEuMH9QGdc2o4tnKFx/0ZEkbFen4ao?=
 =?us-ascii?Q?R8xXLEvcRf6XzZqXOHqY6jGf2vBHy/FLed2HXKEqlVQ0BIhFbE7fbTrvAYdA?=
 =?us-ascii?Q?5gew6EbjFEiOLSwDOgbh5uJQU5E/x9BJm4w2k1Dn9oSTp8dMHd5L4uewhk97?=
 =?us-ascii?Q?K8mezLxOx6yi5CrlbKEgdXDUwi63ArcjkK3XKSAgssM7GdPe7MFhycuFwJey?=
 =?us-ascii?Q?WKGKbv1GPcblKmC6LUtO+h2gCM7efSTmMMaPlrFEn8PSp+qDLY5uayMwxwOO?=
 =?us-ascii?Q?nhyrRU6v0Me0oTw7LJfmi3RpUlHDZlYSg9ORIrEJebuBt9R/B929BNXAvjab?=
 =?us-ascii?Q?SJ+hNG9cLJS/AdZPY266vwIs/67vrDplbRwyOvjZHWbH2X7IMDfPni/mdfp8?=
 =?us-ascii?Q?ggRs05KBICukEWe14aFKzTKgBhIS3zgH7eVFAO+kkOMuxlT3cSxsYohXaUVF?=
 =?us-ascii?Q?f3Sc/Z9FnJ5oa21RAn6/dlYLiGqx2r4B7QZTGZMU5FN92MlyWL+BHl8VS2xA?=
 =?us-ascii?Q?yHDp03Bub4KIQZ5+FqJPP4YtNam4E5q6yf7+GQcxgtYKt3Ah1zkr/kgYS5PQ?=
 =?us-ascii?Q?enAsXGaLveTEXD6tByT1GfuXrwijZYF4IbdU1TiH6oiD+iWMubnQCvaeP8Ub?=
 =?us-ascii?Q?bhm7W0JJOPs3pmkEqlxbTgyo70E9elhI3cMbkEwBW1bzM+b4Pn7dQZSZIZoc?=
 =?us-ascii?Q?TfOeQphq5QX86zn+ZiY2qIk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6408b158-cbb9-48d4-baf5-08dd9db611a2
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 07:05:46.5761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVHrLSCZSobm+2DG2FD45BxLvbPxKjmeVIDkv8xzQNs6rAbo8VUoRPq1vxGIAyQ/F1N+gZVnPx44iDeGCxw0ITYWGS/ajG3FLNgvQlnlEvgJNRnLTLlMbUzZMuEwqOVF
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

To preserve the drivers naming convention rename
adv7511_dsi_config_timing_gen() into adv7533_dsi_config_timing_gen()

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch

 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 3 +--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 +-
 drivers/gpu/drm/bridge/adv7511/adv7533.c     | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 6150d57ff9af..690ca3a5fcfd 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -415,6 +415,7 @@ int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
 
 void adv7533_dsi_power_on(struct adv7511 *adv);
 void adv7533_dsi_power_off(struct adv7511 *adv);
+void adv7533_dsi_config_timing_gen(struct adv7511 *adv);
 enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
 					const struct drm_display_mode *mode);
 int adv7533_patch_registers(struct adv7511 *adv);
@@ -422,8 +423,6 @@ int adv7533_patch_cec_registers(struct adv7511 *adv);
 int adv7533_attach_dsi(struct adv7511 *adv);
 int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv);
 
-void adv7511_dsi_config_timing_gen(struct adv7511 *adv);
-
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 int adv7511_hdmi_audio_startup(struct drm_connector *connector,
 			       struct drm_bridge *bridge);
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b58e9e2c6489..a687b3c3fd95 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -740,7 +740,7 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 
 	/* Update horizontal/vertical porch params */
 	if (adv7511->info->has_dsi && adv7511->use_timing_gen)
-		adv7511_dsi_config_timing_gen(adv7511);
+		adv7533_dsi_config_timing_gen(adv7511);
 
 	/*
 	 * TODO Test first order 4:2:2 to 4:4:4 up conversion method, which is
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index df8180e6d733..188c1093a66e 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -24,7 +24,7 @@ static const struct reg_sequence adv7533_cec_fixed_registers[] = {
 	{ 0x05, 0xc8 },
 };
 
-void adv7511_dsi_config_timing_gen(struct adv7511 *adv)
+void adv7533_dsi_config_timing_gen(struct adv7511 *adv)
 {
 	struct mipi_dsi_device *dsi = adv->dsi;
 	struct drm_display_mode *mode = &adv->curr_mode;
-- 
2.43.0

