Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E26B9EEF7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 13:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045CD10E2AF;
	Thu, 25 Sep 2025 11:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="V85qOgkf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11020094.outbound.protection.outlook.com [52.101.69.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BCF10E2AF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 11:36:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpJB+h6dJKYIMP3S4iGWb/Vjyz59ZhBGcqkdPrCpLtzlb7vjD0QuFYHHFSbRDlRB5Tuj+ElCNS+7atLTr4gi9QrFYzbYdsKy3VFlu7IRAHsbrLSbROUDHrA/f50mLfyhvdi4gdJEPUEi/mTAJwSe9MP1HZGjhTdguLrH4n5BAwzuguwbcq8AUawDG1rviLZn0Ahat90PIHslbiDhv3Z7+j4Ouxtx1Xwv9dk/2XOfwkybVKzB1xO2lviG+4+ioUnuCLoH3PYYpYTfYmqBEoqiEYT+spNhh7jyYBMEw8VXGsmWPYCydB3vLHVgNlk3zIWFnyloU09SCjSy+kjH+6HlRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+lNgiGAau1ujpgeTuYy6ZTw0V3sv+QqO6E+rHxz3Zs=;
 b=S6r1UmH/ITUBliXib8MuBpDclUXzuQjxvp4XAtNpLj754SJ+LfkpJkDEvB/Q2j1zcMpOi0q0jVTvOTy9+qHSEVHuJWIPSCDVvCeo2WDK7j7EF97bz8ZTRoiemmjpx5+bckt7NvFjJeTOkY/YQfQG8t5uRKeT0O/RdbhHnUHAw6p7YwbNQnwFQk/MOB8+ezxIwO9bNhSSLiBAKaPKAjtmL+er8u6bScHJivn20j08ySmDtRMeMkOpn7xGb10ENRWNLOx+OlX8TR3btkQlBXNos/tmTdyXz+SDEiPXW+zaEXM/g/E+SErKZLkhGGWkb4ro8LHFv86o678GYw51i/KOdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+lNgiGAau1ujpgeTuYy6ZTw0V3sv+QqO6E+rHxz3Zs=;
 b=V85qOgkf4uTNV5ZD23gD3Pm8r6NUZ7Sx3Skb5lLdeYByF/kYGCuKg/OYrTiQRbUWCKSYfer6TGuEcbdomIlEccYDE3muXI5NjuJA7im/0k+2H8mvKm6VSNvOk5qJRckfjZMzKf48IXXLrByIwgB+J6N1LacoNgxe9VksZXBsY1N8ffg8sasM8enVPmMQRiADxdbwaSVq7RnHwpu1JzWXDqtSfTPHtFYY6/sx6qzull+2B9VX/7IK34bf6taT/K1RToyGFqprRh6fqYVdCu3mgUYrcb4RrgCuo4jtdCwvJ+NbvaOA4IevxJCoqRkm0dBk063mB9NVjYNHddjgmBAgRQ==
Received: from AS4P191CA0048.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::17)
 by AM0P195MB0500.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:161::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 11:36:21 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:20b:657:cafe::e0) by AS4P191CA0048.outlook.office365.com
 (2603:10a6:20b:657::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 11:36:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 25 Sep 2025 11:36:21 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 25 Sep
 2025 13:36:20 +0200
From: Jan Remmet <j.remmet@phytec.de>
Date: Thu, 25 Sep 2025 13:35:55 +0200
Subject: [PATCH RFC 1/2] drm/bridge: ti-sn65dsi83: move clk setup to enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-1-94f9f775ee62@phytec.de>
References: <20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-94f9f775ee62@phytec.de>
In-Reply-To: <20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-94f9f775ee62@phytec.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Devarsh Thakkar
 <devarsht@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <upstream@lists.phytec.de>, Jan Remmet <j.remmet@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.39.81]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A3:EE_|AM0P195MB0500:EE_
X-MS-Office365-Filtering-Correlation-Id: 710e86dc-8501-44e5-812d-08ddfc27c078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THFzNUdHVnJDOEt6QXEraTdEUUJJQzJTVFFIeXBwTGxTMnVjM2lIMm5lOG1P?=
 =?utf-8?B?aHdDOEgrVllKbk5TekZWM0pzM05TcGRodE9Ic01Lbk1WUW1GeDlkYVYyTlE4?=
 =?utf-8?B?ZzNRaEExVUpWNnM3VW0zT0dvQlFRSzFHYTl2eHFBRXA5WU0wWHVEZ2NQSjhk?=
 =?utf-8?B?VlhEUkJudzhzbTNlMEpDOE5DWm1jZjNKQlBSY2U1RmV6MGxGRGlTa0RaMFFW?=
 =?utf-8?B?U0NtZHR0ZkpBb3VIM2Y4eUdMM3VEN2NOTVVBbzhKTGJDMjlPSm9QVzVxZCtZ?=
 =?utf-8?B?d1hJWWUxZXBTT3dRaHl2eGdxWEZjZjY3d3ZwRitETmg1cExMYkdhbEdKTWJF?=
 =?utf-8?B?TllKVFlhbE1qNk5KQUxpeThsZitZNDVhZFBFZzM4NU9IdFdpRVEwM0VtSHIz?=
 =?utf-8?B?YXBWMmN5Q2haSUdPdWR4d01uR1dHaXhtZmIvNlBDU0VLeWkwYnVtbDlHVkdL?=
 =?utf-8?B?dkZrNFFxYldFam1Udi85REVrM3BJOHY2VHh0WWY3cEFlTWhxMWZLdE9HZ0pw?=
 =?utf-8?B?YWpLc20yYXRQdlBCWUdqYmJGUU9NTm9vS2JaaTNGcWVmRWtycFBNcVdyMzRl?=
 =?utf-8?B?REswYkNKblAycm9abUQ3WkxCbGxZTW5KMjFuOUxBQ3cwU0dzOEtXVkswQVJ5?=
 =?utf-8?B?ZkIwM25PY01zUEQvWGdIbmhKa2QxcEdnQ1FITlp4RTJieFIyRjdDU2ZSdDZS?=
 =?utf-8?B?MEUvTzBhR1AreGxYbHpPREF3b01WK1ZtNURDRzhvbndMNDNTZDI3YS94OWVJ?=
 =?utf-8?B?Wk90MXJIMUd0RSsxbXpEcUczaG1BMm1wTHYzN09SdXFvT2g3UmlXVWIydWxG?=
 =?utf-8?B?WVlYcFlQaUJpTlpyZmxmUnRtNlRpRzNZODYyb3NoSk5RL1ozTEJqclJzeUpY?=
 =?utf-8?B?enFQajdpRlNCdkx6SFNPcktHS1dROTdIQkpNTGx0bjJTZWZEa0N4ekhIdllG?=
 =?utf-8?B?VENEaFJ5VnptcExUMlpKenpXOU9QcjVWc0dMNExHb1BDLytoRyt3U3F0MDdJ?=
 =?utf-8?B?bmx0TkNHWnB5cU5lZDhlQXFyTndSY2RoVkcxYTZNM0R0WS9QeG5kUFplL3dj?=
 =?utf-8?B?WjhqYVdnNE11UGY3SE1rcmtVa1ZvUGIrWFRoUFNhN0NvSlpScVBDVnpHaEMy?=
 =?utf-8?B?dkYyWTRDQWlpN0hQQzBtc0tWcWs3WUJVNkh2eEpHcThKYzNCZHV3R2NuS2tR?=
 =?utf-8?B?YjV0VnZLc3lXNnZQOWVjWldhWW5LWjNnK1BDK3ZxaTZaY0NvSlQ0MkFIV05j?=
 =?utf-8?B?OW9kUDNOVU1hVjRDZmpFS25OcHFhaFF1bzhUaFdMczlCNDhaRDJYTktIenhn?=
 =?utf-8?B?aGYzRjkvbTVpMTBwYW1LdHhHY1pFOHdUU04vNnQ2ZVk1VDEzbXk2dzhndU11?=
 =?utf-8?B?aDROYklOc2pHWm1lU01tc3pNeHFLazdlek5MQUF2cm4rS2hybC85N2NXSjRB?=
 =?utf-8?B?UWNxSUwvL3lYZS9SRmlZVkRDc3hHNTJrdlFuTTFkVjUvZnJ5YWNlb0JabFhj?=
 =?utf-8?B?dkZIT0xSa0c3Wm4vOVhhdE43WGlZWDhYSloxR3E4bUhBbHlpbDRLK1hxWVhy?=
 =?utf-8?B?VzUzNml3clhUcFpaYnlIcnFOMTF2VkZNM2dORDJNM2MrS2ZoS2wwL2pLS1VD?=
 =?utf-8?B?UlNmQmM1VXhtUGZ0MjRsQkpuQUlGTW5BeXlKdGltTDhZNmNkNm5QUHZneWVF?=
 =?utf-8?B?REtWSlp5QjhHUnpQYjQxUENKbHhtQm02ckFNNllHcFdYdzNveFFoalcvbDdk?=
 =?utf-8?B?YmlDOGdmeW1YZHZIV1cvYVd6a3IveEF3TFZNNHhLV3FGRjdNOEhuenFkTzJR?=
 =?utf-8?B?MnI3RW5mTzVidXA4OGFPODM1S3lqSXdxaFJzb0RvMVhUVUU5emN2YU5leUE4?=
 =?utf-8?B?ZEFMKzhoS2srMDJrWUJGdWVVRlBpZkZXN1hES2FPKzNSVGFqRGtpekdQVkkw?=
 =?utf-8?B?ZWNONTVyTEs4WE5UdDR3UXhLVFg4dzdDVi90RXFoSzNkWURJUERYcTI2WEVH?=
 =?utf-8?B?akRVSzc0eUtUd2ljajlaLzRZb0dFMzF0YmxVOUZ6TmVrWElOWHU3TzlJMHU3?=
 =?utf-8?B?b3A0UGhIb25laEl0R0piMlVOQWQzcHc1VjdsZz09?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 11:36:21.9140 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 710e86dc-8501-44e5-812d-08ddfc27c078
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P195MB0500
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

Move enable PLL from pre_enable to sn65dsi83_atomic_pre_enable.

The base clocks may not be ready when pre_enable is called.

commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
		and post-disable") points out that pre_enable hook definition says that
"The display pipe (i.e. clocks and timing signals) feeding this bridge
will not yet be running when this callback is called".

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 033c44326552ab167d4e8d9b74957c585e4c6fb7..4cbdbafc3e85821ef6fcd9f74bf07faf6b9f84ff 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -474,7 +474,6 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 	struct drm_crtc *crtc;
 	bool lvds_format_24bpp;
 	bool lvds_format_jeida;
-	unsigned int pval;
 	__le16 le16val;
 	u16 val;
 	int ret;
@@ -614,6 +613,14 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 	regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_FRONT_PORCH,
 		     mode->vsync_start - mode->vdisplay);
 	regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN, 0x00);
+}
+
+static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state)
+{
+	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+	unsigned int pval;
+	int ret;
 
 	/* Enable PLL */
 	regmap_write(ctx->regmap, REG_RC_PLL_EN, REG_RC_PLL_EN_PLL_EN);
@@ -633,13 +640,6 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 
 	/* Wait for 10ms after soft reset as specified in datasheet */
 	usleep_range(10000, 12000);
-}
-
-static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
-				    struct drm_atomic_state *state)
-{
-	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
-	unsigned int pval;
 
 	/* Clear all errors that got asserted during initialization. */
 	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);

-- 
2.43.0

