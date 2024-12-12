Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D3F9F0630
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 09:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C2410E452;
	Fri, 13 Dec 2024 08:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="Md77kE50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2075.outbound.protection.outlook.com [40.107.241.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F4A10EE16
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 14:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQ7vMp9bdmr+GqmR3Y/mBmMw2wtKyIVak+vJj4H7EeCZooUZ+aXicG3KSqCXIbrvwN8WvkrffamDMdxTYaAw0z0H0+SB0iR1FWb6bJJsY06c0igXOeXKT+cCiKwruRhBhhnT0o7Qd9CnLS4R1/Zxn3HVCvjSH5oYsxYUh+z4vImhwLdCGXIs/HRW+zAbhD0xund9hmV98ncN/gHTNVSk1ZBI9epvX8vJVRG+XmmA0S8bWQp5z8eULUnDuziWQtWcScJo6rnnbYX55tOGF2dMZo57g7ltAmU9V/Tz6I6VDuf+BmZbBtu2F9kpsm3R+eh/spX3dgfRiaXYN86L4WSSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u30tsaFF0rybH8MkBjkpC0TaIPLlaSaxtdJHc2toSV8=;
 b=KTy7zk4rtNB4lNVsxaVHQuL2k9MGC6xYvnLW3jAlkMR8nVCDSFGJnpYf2M86EgBen9aUAsfS96p4bZZiddBSx38X2XIkGBKy/kiWGGJpBlzyeq2eDXF8F6TAO+8Rh1ugJ4GZc2wWh/Q+gwp18QQpp8dFEABeuuBoOTQ7GuIrwHrSSkbmwhweYtakr/pQ1VQDBwM1y7YfIMe/dVJ65g/yOSzjERyw/0Oo+Vy4f8qIRG8PDyPzPsk+gcX0vTUfQIwIEEQtgLMkapy+TvwBydmp+3mp51fr+7gnRmqruJnQctMgK9C/xsSjGdFzRoj8jFCH2t9GcYqUJKud8KkAuSsrkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u30tsaFF0rybH8MkBjkpC0TaIPLlaSaxtdJHc2toSV8=;
 b=Md77kE50G2kg/2hbACb2IaEaB9Gj0HBkNsmCbVNxk916AvPOexH3Fl4YD3wMb6gptTC2Ab9qo4kVb/XihQfmP/tIIIR/AgTnAa58SVXmeCC3HKP2yDRdItRg46UvwqnhrcQThEVXjVudzr4KBk0QiTraHzU8YdTS+Oe5ZWP5M3I=
Received: from DU2PR04CA0182.eurprd04.prod.outlook.com (2603:10a6:10:28d::7)
 by AS2PR02MB8950.eurprd02.prod.outlook.com (2603:10a6:20b:5f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 14:38:52 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::7c) by DU2PR04CA0182.outlook.office365.com
 (2603:10a6:10:28d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via Frontend Transport; Thu,
 12 Dec 2024 14:38:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 12 Dec 2024 14:38:51 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Dec
 2024 15:38:50 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Dec
 2024 15:38:50 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 12 Dec 2024 15:38:50 +0100
Received: from pc39391-2017.se.axis.com (pc39391-2017.se.axis.com [10.92.82.2])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id 884841AE;
 Thu, 12 Dec 2024 15:38:50 +0100 (CET)
Received: by pc39391-2017.se.axis.com (Postfix, from userid 10612)
 id 837174373974; Thu, 12 Dec 2024 15:38:50 +0100 (CET)
From: Stefan Ekenberg <stefan.ekenberg@axis.com>
Date: Thu, 12 Dec 2024 15:38:40 +0100
Subject: [PATCH v3] drm/bridge: adv7533: Reset DSI receiver logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-adv7533-dsi-reset-v3-1-c6b9a5c524cf@axis.com>
X-B4-Tracking: v=1; b=H4sIAG/1WmcC/23OMQ6DMAxA0augzHWFE0KhU+9RdQiJKR4KKEERF
 eLuDagDA+O35GcvIpBnCuKeLcJT5MBDn0JdMmE7078J2KUWMpcFYl6BcfGmlQIXGDwFmqCoKlu
 2TaOpkCLtjZ5annfz+UrdcZgG/91PRNymfw3ViRYREEqLeVmT0q1TDzNzuNrhIzYsyiNQnwEyA
 YTS2vQPSW0OwLquP/b6YzfyAAAA
X-Change-ID: 20241108-adv7533-dsi-reset-488c6fbb5e42
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel@axis.com>, Biju Das <biju.das.jz@bp.renesas.com>, Stefan Ekenberg
 <stefan.ekenberg@axis.com>
X-Mailer: b4 0.14.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885E:EE_|AS2PR02MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: cd1dd496-de1f-4ab3-be9e-08dd1abab26c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmRidnBxbU1SOG5WZlFGSWZJWEdqQmNVMjhJUmZiaDh4MHpiV3ZhWjIrMkNO?=
 =?utf-8?B?Y3NabnhPbVdUY0xVRHJoQ3h5bFJiN2dBd1dTM00yNG1aYXdCNFpFWXU4VkV2?=
 =?utf-8?B?VFVIWHl6dFlBYkt0dEV2VkhGYWZsTnpyRlZtOUJrSWdvZWlMTWNJTnR6ci9C?=
 =?utf-8?B?a0phZUFVZDBSbmxzd1pqSTBGQ3pWWjdJVFJsazA1TVBzSHVOcVFMVDUrMFdl?=
 =?utf-8?B?dExEVWYzOGlFU09VMUJkNVEwTzdEeUdTTkRvNkVFMW1PT1VVQjBIYUptcnZ1?=
 =?utf-8?B?Y0h3L2g1b3JleVNVcGZFVFdjR2svSjNNNURkanFRMDBJdUVWNi96VXprN2E1?=
 =?utf-8?B?S0lzdzVnd0xNcG1OdzdCc1B0QnY0WXZ5bUpxT2YyUy82cTE5cHExbkluQTFK?=
 =?utf-8?B?R1pHejhCK2h6TDhGTHVLKzJXK09wVjh6eGlzY01za0hXOU5ucXJUazFzOFBl?=
 =?utf-8?B?cGJKUnRLMlZlQ1ZPaGZ3RWhDT1RudnZaeFVGRWljRUJGbVRSTDZ1SVpXZ0Va?=
 =?utf-8?B?WDdLbkozZkg5S1VLdDZhdEYvUVRXSkl2ZSt2T1JrVUFtc1IrQ20zREI4WkIv?=
 =?utf-8?B?MFFqSEV0RHNrZWFiV3JGOG1XbDIyMGVZdDdmalZ5NWpNdzF1YmlqWjFzUU9V?=
 =?utf-8?B?L2p4OTlZRVFYd0lnQ3hpeG9VRC9FL2RFNW81MjVRakc3YjE5VnU5NEdOYUlK?=
 =?utf-8?B?WS9USi96WTl5RFJDUUpodk5IOEZIbmJRNHpneTVmYkdEVHRnU2NsQ2RTK3JG?=
 =?utf-8?B?d1JBeGJnMnJWcC9FdDRyZTNrUHRsc2J2V25FSnI4VHIxVW55WmorYUI0b2FR?=
 =?utf-8?B?VFdiWklSSFBqV0NoOC85QmZZNStOVEZJeTdkTW03OTFJdmdIa3dJbVVRMm9u?=
 =?utf-8?B?M2pBWmlHK1lISFcyT0N6ZlFzbTRvQkpKYTdSQ0pjWjhGaE9QZTBGZmFGdzU4?=
 =?utf-8?B?MXAwQzl3WDJMWGdROExBSkFSRVRnMHJtRkxCS2s4NGVqK1dFSjFUaXVEdnFt?=
 =?utf-8?B?RFVra0tROXdUbDhuWHBkMVBkeXdaQURxeEQ3bFZ4NjhiVVhIQWZzbnM4Tk10?=
 =?utf-8?B?SkYzb0JoVloxLzZTbElMYlZrQ0lPSVQvLzdnYk5aSFY4cVVlVlQ5S2NiU1or?=
 =?utf-8?B?Uk1aZ2I2eVc2a0JJYWpBVmV5UkJ4WGJOSTNOdUI0ODdsQmw2dnZDRVVFTCtl?=
 =?utf-8?B?K3RkTnlwbWV1NlhOZ2lqeC9UcUdsZEJ5MjJGaDc2VElab3YvQ0kzOGdyRFhH?=
 =?utf-8?B?VjloS1NvS3JrbHlkMXEzZDZxUW5OT0kwdUR6VHQzcUpJQytiNHNIODlLc1ZB?=
 =?utf-8?B?QVhTY3JianZRMWNwWWxFZXE2dWlha0JTaktzdHhjVlVXMUZjVzM5Z2pLRml4?=
 =?utf-8?B?Vmc1U0F3Nmp4dit6WWJNei96bEJJQ1F6Zlh5TFdyMXRRVFBUMEo5OVgyMUVi?=
 =?utf-8?B?RDBlL0YrbmpZSnJMNEpLNVhJZ2JXUTkyWklMOGFSTnRQQUh3TDdMOUFwMG5j?=
 =?utf-8?B?K0hCSnVob0dTMHpwZkdaOHFtZW9OeUZ1czV3R0hSZk1aakphREdpK09vU3cv?=
 =?utf-8?B?T1lOUEdkb2FuOWpTbmEwWldtaTd0UHRPNnlZLzVOS3EvTnBpYW50WUhjTzZs?=
 =?utf-8?B?ZTV0aW1tbXU0STJ3eWdMaG1WZHdsRUR6Yy9DRmtwYkxtUFN5SEg5Y1hJaS9m?=
 =?utf-8?B?WWY1MExTUSttcVBMM1hZUVJoVDlLUktmWFE5OVEzSmNiME1lbnJqakFjcThU?=
 =?utf-8?B?Mno5aXJUU0NlRVFaQ05Ja1Y5L1k1aTh5aTRRdHc4VVhOQXpYbmpPVElZbzFu?=
 =?utf-8?B?ZGVRbVVpRkg0bWtES1BVM1FmSkYyY1NYcVJJNFJtNHk2ckZLZVBjY2d1dk85?=
 =?utf-8?B?ckpPczhibFk5WENxcEhONEVkQW45d0xSV2ZRNzdYemFVaElrczN5QnIxOHY2?=
 =?utf-8?B?Z2VRTmU5L2I5S1JJMmwzcDlsU3R1VmhYTm1PdjZodWhUYU5qL2dsTHI4T285?=
 =?utf-8?B?Z2JZNGVVTmpBPT0=?=
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 14:38:51.5563 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1dd496-de1f-4ab3-be9e-08dd1abab26c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB8950
X-Mailman-Approved-At: Fri, 13 Dec 2024 08:18:23 +0000
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

Reset DSI receiver logic during power on. The need for this change was
discovered when investigating issue with ADV7535. The symptom of the
problem was that ADV7535 continuously outputs a black image. This
happened for about 10% of the times that ADV7535 was powered on. The
rest of the times the image was as expected.

The solution in this patch (placement of reset and sleep time of 200ms)
is implemented as outlined by the Analog Devices support team.

Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
Fixes: 8501fe4b14a35 ("drm: bridge: adv7511: Add support for ADV7535")
Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>
---
Changes in v3:
- Add Fixes tag
- Link to v2: https://lore.kernel.org/r/20241119-adv7533-dsi-reset-v2-1-e12cce42e25a@axis.com

Changes in v2:
- Add Tested-by tag
- Link to v1: https://lore.kernel.org/r/20241113-adv7533-dsi-reset-v1-1-6c1069e35fd3@axis.com
---
 drivers/gpu/drm/bridge/adv7511/adv7533.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 4481489aaf5ebf164313c86cbf3447d2d7914ab9..93085c2b872ed98f4ee394236dc66c568c0e5ccf 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -67,6 +67,15 @@ void adv7533_dsi_power_on(struct adv7511 *adv)
 {
 	struct mipi_dsi_device *dsi = adv->dsi;
 
+	/*
+	 * Reset DSI receiver block logic to avoid ADV7535 startup problem.
+	 * Without this reset it sometimes continuously fails to receive
+	 * incoming DSI packets and outputs black image.
+	 */
+	regmap_write(adv->regmap_cec, 0x26, 0x18);
+	msleep(200);
+	regmap_write(adv->regmap_cec, 0x26, 0x38);
+
 	if (adv->use_timing_gen)
 		adv7511_dsi_config_timing_gen(adv);
 

---
base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
change-id: 20241108-adv7533-dsi-reset-488c6fbb5e42

Best regards,
-- 
Stefan Ekenberg <stefan.ekenberg@axis.com>

