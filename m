Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A0CC1B8B1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 16:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C9110E7E8;
	Wed, 29 Oct 2025 15:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="b46yMH+T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazhn15010017.outbound.protection.outlook.com [52.102.139.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADCB10E7F9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:06:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3vNGbAMGNNjHcE/oe7SYWrfp9bbdeJteLDyUVhhiQFGXmeINdoXRHU6loLB5UBymniUgjwTkVcAd1gR/YMMkA2IUAjYv+V9PeqVxA4kyx2Mn+T2srX26/AdvItOEY9lf8j1XPy82H/kIH6E7WFLfUaxNxUWiJTIuS+H9RqxAsOK0LuevKuQRjj7ljGKpbP+Y6sZ4hWJMLI4TYG/s/idTScnu8eedI+zQCdw6myIMYTrNq/FWwD585F8r/mwSHXwRBrIqt7IiKNPK8D02cd9DCwQlxWW89Q6x2CNmA6ZiSCjgDIl2pmg1jlXihDy2j2bcO/pzGxsW9stmmWJXxhj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAgp+g815gov23JpuH7Lv2BqdZy53cHfMYKO1vaWuiE=;
 b=yrLCEjj8YjQhrBTl46xkzKtB0TnMvyLmgDqgOYBZfPW39wHut8ZbaQNeDZtRnxzRhpJIKqv22QMXqoIpq151UCKm1MkzN8t4OpNBuwjRGPDfceiHmo/EvMvNOmMPrdNg9ebS1RtEoTvknduBiwX/sF/UB8frThMF81VQ9paxYCnHaPDcFdBWLzh8An2YkwERziMMk/rAnxhvMwTdqE0yBqjICqpxhzMYbWnmnpcPMWAdVNxXFdWPRidncEuDb4B4q4ezHviyaG92IDXTBRmVQ5aMyYnpo7MRRS9Zegz1wXyLMJZWzbvCZ+XpeZUDKLDcTOLbL+3uXToLpD0QOcUjlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAgp+g815gov23JpuH7Lv2BqdZy53cHfMYKO1vaWuiE=;
 b=b46yMH+TCzWout+ypPPErmkM8DqNsy8Rlq4rVvqcIbBfK1GauHZVEJsqASlp/6KkmoA7KxS1S8UeLHxux0go5Exq/KPMYmG9lUUgyX5tKnVbt9BCpd8UDgWAqVxa+2AUTKmVq8bzMCW+zK1Zqn4RwwWt1k2RhVo1dPIIRayXmbY=
Received: from MW4PR03CA0077.namprd03.prod.outlook.com (2603:10b6:303:b6::22)
 by LV3PR10MB8060.namprd10.prod.outlook.com (2603:10b6:408:288::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 15:06:49 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::97) by MW4PR03CA0077.outlook.office365.com
 (2603:10b6:303:b6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Wed,
 29 Oct 2025 15:06:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 15:06:48 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 10:06:44 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 10:06:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 10:06:44 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59TF6ig7022433;
 Wed, 29 Oct 2025 10:06:44 -0500
From: Nishanth Menon <nm@ti.com>
To: Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Robert Foss <rfoss@kernel.org>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Phong LE <ple@baylibre.com>, Dmitry <dmitry.baryshkov@oss.qualcomm.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>, Andrew Davis <afd@ti.com>, Tomi V
 <tomi.valkeinen@ideasonboard.com>, Devarsh <devarsht@ti.com>, Nishanth Menon
 <nm@ti.com>
Subject: [PATCH V6 2/5] drm/bridge: it66121: Drop ftrace like dev_dbg() prints
Date: Wed, 29 Oct 2025 10:06:33 -0500
Message-ID: <20251029150636.3118628-3-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251029150636.3118628-1-nm@ti.com>
References: <20251029150636.3118628-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|LV3PR10MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: 110ae4da-e3aa-46c1-d7d8-08de16fcc8e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|34020700016|1800799024|376014|7416014|82310400026|921020|7053199007|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+/rO1TNdR7Z4UmFOcLAWkvwsB9rWp/exyjM8SEJgvk/aZGLnBzEtbf3+Y5bk?=
 =?us-ascii?Q?xYoSJBJKIsPurG7aGc7HuRrpW8fokO1UITnxfHNJ0DA2c+mw/RsLAxWBJ0UP?=
 =?us-ascii?Q?KQjRVhCv1WCvyH4pRIwyQFu8x9+JxXg7vyTm47aJpeexX4z8/ExBZDk4M9p3?=
 =?us-ascii?Q?1mqv23C/ay4B2PYF1z2Xs77Ntk/fLRqYfEkHQkJzkDjRtFh5IXjhxODctQpY?=
 =?us-ascii?Q?fMdqFCux33DrQjFWpBm5MnI90tl8QeUIi9QYzDONXuugsFsVZn9SBR7G3ILB?=
 =?us-ascii?Q?oZJiooDzJcNGW73KdTY99bueiSm7wDUUcKuQQ4aSCxUXvyQHQ9+EcEus9Wy/?=
 =?us-ascii?Q?RTGywIGOoCj8++UBhIe4NZ2zqoj4phqqN67nM9JJatsfstEwTkTfTxejbErS?=
 =?us-ascii?Q?v8hYse5zbV5rANCtgUWCxwTPCYpPCPA7NI6rciqFAATB1OK4uWys3dgAddzi?=
 =?us-ascii?Q?Yi7An7TFgLNHlK4kHl9PrISuhFBMv2ObKDlmAzWNwqHMvLhMGcuBM37WjidL?=
 =?us-ascii?Q?bd4kbt6tNghpJUIKieuL/GiP+SqbjZqqNKW7mucNLTJDbU+XtSZKJEFqn+k9?=
 =?us-ascii?Q?vt3G8trvDHB1fgLkHtNlqESst4c+zhxIxm0b7aO/xjX1B6xf1vo3c7zdvgLf?=
 =?us-ascii?Q?VSCxtyon7ObPKdN2vVTmyv5Yy4vi+RlaM3/2IeoxCx5NgXSOF4e4AAcs0Swr?=
 =?us-ascii?Q?fReXjlgwCQiq3hS7A0HKfxcAfn/yB3jNKa/ItDjSZtJu6udV+spY4hP+CH9K?=
 =?us-ascii?Q?PbBWU4osj3/j1DnEUq7Rd3DY1lJsDJLiMVx3tQPIBW4QusDVvRTsddk4vDBs?=
 =?us-ascii?Q?LhS8hqL/k4wMXnxvVeBlLfs7AShuSst2xPXfS2Tqz+LMdJ/KTqi0FItoqUzs?=
 =?us-ascii?Q?5SbuckE5a0OJ+7nPB5Xgg05ckmrYL76YLQNTwjS3sFySRcQ18R7+m0ECMhXq?=
 =?us-ascii?Q?6NS2l1DgeSu91nLiEGRg8wJvmz/T5SqrTurbLiLh3yqFZqc779LqGEhriZZs?=
 =?us-ascii?Q?rjKc1vHFvOhAC5riKZZ02yO5jn5Pz7ymGHSWbyT63QP5SLGfCNFlSN9Nspta?=
 =?us-ascii?Q?NWQMG//lfXCAWndHBMcGVR9RsfH0sX8Y+FCZRt3zsLkxvI+JuE7QVi5Gia83?=
 =?us-ascii?Q?RHDntimsalQuuPvDGheqjZ/+kJKGNjnVHAwGac77ZHGjVfvV4Ygvm+3vCkXW?=
 =?us-ascii?Q?WlEtpV+apd2YBzPRnUWN/5tLBzdkAkUQIV7suaVAr9FzmfHxNQyx44zjLhqm?=
 =?us-ascii?Q?7xn7a1Tz8gE9M+9Vu/LSEvFn97c0JPBqSQXz3q5dELB+LrvOQOXj/SBprEww?=
 =?us-ascii?Q?U70IUQhTN83r0O57zfS4M/p9ijP1n/iQNmXcNVlvHkzBqF3+p3XpLh4hvhgv?=
 =?us-ascii?Q?Csot+P65JaWZ/aSA5O8lp5nw39URywRQpzyMgvRB3nohdzgTL3kue+jTwEQJ?=
 =?us-ascii?Q?mYKDv7x3VYt6VuKePZmd6sErAvpUpE9bOux7by7bPpMMnnS7auU2jVKnMwVb?=
 =?us-ascii?Q?1hDZfQj5CAPXDIRM7E5Q/nD/zGe1tL4CHIXQ+eNCI0XZf2MIdx3fm6RMCx5U?=
 =?us-ascii?Q?nhmhG39T3s/nPNkdV1dw7mBaR4gpnGVMyyIUdqLY?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(34020700016)(1800799024)(376014)(7416014)(82310400026)(921020)(7053199007)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 15:06:48.9986 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 110ae4da-e3aa-46c1-d7d8-08de16fcc8e2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8060
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

Drop the ftrace like dev_dbg() that checkpatch --strict complains about:

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+	dev_dbg(dev, "%s\n", __func__);

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+	dev_dbg(dev, "%s\n", __func__);

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+	dev_dbg(dev, "%s\n", __func__);

Signed-off-by: Nishanth Menon <nm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes since V5:
* Picked Tomi's Ack

V5: https://lore.kernel.org/all/20250827202354.2017972-3-nm@ti.com/
V4: https://lore.kernel.org/all/20250819130807.3322536-3-nm@ti.com/
V3: https://lore.kernel.org/all/20250815034105.1276548-3-nm@ti.com/

 drivers/gpu/drm/bridge/ite-it66121.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index aa7b1dcc5d70..9b8ed2fae2f4 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1384,8 +1384,6 @@ static int it66121_audio_startup(struct device *dev, void *data)
 	int ret;
 	struct it66121_ctx *ctx = dev_get_drvdata(dev);
 
-	dev_dbg(dev, "%s\n", __func__);
-
 	mutex_lock(&ctx->lock);
 	ret = it661221_audio_output_enable(ctx, true);
 	if (ret)
@@ -1401,8 +1399,6 @@ static void it66121_audio_shutdown(struct device *dev, void *data)
 	int ret;
 	struct it66121_ctx *ctx = dev_get_drvdata(dev);
 
-	dev_dbg(dev, "%s\n", __func__);
-
 	mutex_lock(&ctx->lock);
 	ret = it661221_audio_output_enable(ctx, false);
 	if (ret)
@@ -1479,8 +1475,6 @@ static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
 		.no_capture_mute = 1,
 	};
 
-	dev_dbg(dev, "%s\n", __func__);
-
 	if (!of_property_present(dev->of_node, "#sound-dai-cells")) {
 		dev_info(dev, "No \"#sound-dai-cells\", no audio\n");
 		return 0;
-- 
2.47.0

