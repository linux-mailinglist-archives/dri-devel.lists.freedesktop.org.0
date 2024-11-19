Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D719E9D2146
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 09:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37ABC10E5DE;
	Tue, 19 Nov 2024 08:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="HmQI+mW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F1210E5DC
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 07:42:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8POy62pUby1sz3yKF1vdQZ7sBMkisIrRF4y/08UGTFBdq8CPNU6xG/6WiBwG6ndp6akHJ6Jwq6XT5Sup4E5o13LoMNJdejhHu6wRHzZ+pAFVhEeVGUlSXqIwWVxggTfA5Ecfhyj2uoweyErfKfz+Ouj1OKM6IocPB8ebcv6hjRP9wwTMQuyRsJ1hKJ0EOI6SmRVHHmr1bPEV4jNz+o4PKaTZwDolN2rJ8CMO4GFE027yy/IMKuUhVXJgr+MyIVmxuCNfqutZT39NGAzUp/aZIpj9owsKZwD7WV5ECki8DGhUaOxQBBYMbcLKfYquZUFkn8eNHwE4yTalJ5nc8bScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bg2pMooZYIJFh0qVk5P30bCSVapPaOWC/bwtE4dpeLU=;
 b=rkH1/3F+Ljhe2EE0Ls4oIDr8uun2YLpjTN1a3zS5GzdykzI4gIB774XttDkLYbsCJcFc8a8JZrb2e+LYaXojLNZb2xY3BO4m2s0b9k3DiinGFtgJ48G7OhOp05x6zwsJU9TFEPgomQ72WttWf3nxB3h2j/EFY+1pprwliZkeXf8IJ72QQycYgOdvWb3dx2+klzUoaK1Ld0H7COQxaaYQ6MY3wU+LUWEjoWgROw6L+Tvaq30Ocp1ecgdh/6fM0YSShqRXUnhArw5VW1G4l3jsQhjJzAH0ccK33EEnHHRvSZYXU6HCSOOlZ3gyqjpsszEbyWu6xXdEsN7jiKLxsXa34g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bg2pMooZYIJFh0qVk5P30bCSVapPaOWC/bwtE4dpeLU=;
 b=HmQI+mW2Xui/DEtyG1DeNlLwHvkx08YjOczH57WKiRO++yPcH1yqRa8brxEgC5DEAeH0auBHI0kdpPXcKKSfvTsMABseSwdUDX7xuB92MH5gzEhfL/4zP+COSKdFSxFjdBIMd2/xnO7gidMaKcxNtlr1QQLuzcJWMjPZgTqDAoA=
Received: from DU2PR04CA0304.eurprd04.prod.outlook.com (2603:10a6:10:2b5::9)
 by GVXPR02MB10666.eurprd02.prod.outlook.com (2603:10a6:150:151::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 07:42:41 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::ee) by DU2PR04CA0304.outlook.office365.com
 (2603:10a6:10:2b5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Tue, 19 Nov 2024 07:42:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 07:42:40 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 08:42:39 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 19 Nov 2024 08:42:39 +0100
Received: from pc39391-2017.se.axis.com (pc39391-2017.se.axis.com [10.92.82.2])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id BE4064F0;
 Tue, 19 Nov 2024 08:42:39 +0100 (CET)
Received: by pc39391-2017.se.axis.com (Postfix, from userid 10612)
 id BB2994462505; Tue, 19 Nov 2024 08:42:39 +0100 (CET)
From: Stefan Ekenberg <stefan.ekenberg@axis.com>
Date: Tue, 19 Nov 2024 08:42:36 +0100
Subject: [PATCH v2] drm/bridge: adv7533: Reset DSI receiver logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241119-adv7533-dsi-reset-v2-1-e12cce42e25a@axis.com>
X-B4-Tracking: v=1; b=H4sIAGtBPGcC/22NQQ6CMBBFr0Jm7RimBURX3sOwgHaQWQikQxoM4
 e5W4tLle8l/fwPlIKxwyzYIHEVlGhOYUwZuaMcno/jEYHJTEOU1tj5eSmvRq2Bg5QWLunZV33U
 lFwbSbg7cy3o0H03iQXSZwvu4iPS1vxrZP7VISFg5yqsr27L39t6uomc3vaDZ9/0DexQ6jbEAA
 AA=
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|GVXPR02MB10666:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c18e039-03c6-49a0-c031-08dd086dbf37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk5YTUY5ZXU2MzY1eWxZckkxakFMcUphaERCTHFmNS9OSDFvL3JyNlROZjBp?=
 =?utf-8?B?MUV3OFNZZTBCNlN0WXJsM3Izb05rL1dJV0Nla1NPcEk3QTBFYm44algxaWdW?=
 =?utf-8?B?Yi95NUREQ3I1b3U0SHhmOEJEdGpVQ0RLVUhMbnN4QkpVblNZM2NoTzMxZ2Er?=
 =?utf-8?B?bXN2c0tETTlyNzdKdDJsU1Q0L2VESVd4WWZrOU0wVmc3Z2ZOUmNpRDV0MVN5?=
 =?utf-8?B?S042bHJHY1RhSy83QitkVVVQb0pzcU9SMXZ2ZWlOMXRobDBTeFU2QkRyQXF2?=
 =?utf-8?B?dzN1Z0FUR0JVTHMyK3k3bTNTc1l4NTBIMmNybkZ3dnR3UUhBNi9qZVdJRERm?=
 =?utf-8?B?YUZzNEwybHJlWml4YTZ1L251Vms0ZURvMUVRczZ6VlZ5a0tLalpRT24vZWJQ?=
 =?utf-8?B?eHFBN2ttdmZoOUJ0dE9Lbklka1ZnUFBOYS8ySkpQOE4yVzlEU21RcGk3VDVZ?=
 =?utf-8?B?MC9XbUdUQytvVDRHVDlORlQ1ekRuK3gzWlB2UU56WVp0U0xmU3c3VGdtWDhj?=
 =?utf-8?B?algwZ1JHRWMzd3plN3VYSk5CQVRhMXJaU2w5dXZ5TTN3TWp1NkNrdDlCV3VI?=
 =?utf-8?B?eWFRbk9GK211UTV6MVRYejA2ajd2NGxkalErSkpkRCthMFF0U3JKZEx4SGRn?=
 =?utf-8?B?eElTc2g0SUxkZVVyenVlVXhSaDMxd0RyYml0YmtaYU50L0ovQVpzS2RHdHZG?=
 =?utf-8?B?NGVvQ1MrRkNpOGJXaDNXZ01JNUUxQUc4OCsxdDJQUmNhVVBVNHRMSDVRb2E0?=
 =?utf-8?B?VUgzM0k0TG9hcFJaVXYwSjZtMWxNYmFMc3BHT0RlbHo4ZzlIS21BT3BubVZE?=
 =?utf-8?B?QzRRRjVBZ1RyQmdhaGpZTktXTkk5QlErUlBHT0VKbGF0WnJPa3B0YldtemNj?=
 =?utf-8?B?SFVOVVBPSm1veTVFcWpjN3FwRXBkaS9sbStUK2k2a2RIV2VnWG51ZmZGSWhB?=
 =?utf-8?B?N0tHSVZTVUZTRzhhVHB0Tm1LczNsK3ZsV1JGS3lhUXJ3Y1ZlRUtHYTBCUS8v?=
 =?utf-8?B?aitabVdTUWc3djZlQzB2WFBSb0VERTgyd1NZY1prdGxIVlZVWEFpUEVZc29r?=
 =?utf-8?B?Uy9MSGl1Y3RIS0t3S1d2Wjg4WmxReDl2V0ljeDFkZGhjZUE4elVITmhZejBG?=
 =?utf-8?B?dkN6YkJQLytUVmlxTXNVWVpCeVlwVTU2dmNTdFB1Rk1wbm9TSkNNYjJnTENN?=
 =?utf-8?B?WlQrcVhwdk5aY1l3YWdVelRCYVN2Q1RSY3F0T0swNitvTUlZc2pURi9tV3B6?=
 =?utf-8?B?b3I5d011MUdPVGppaWxtRXd6eUZULzNPMVJVSCtra04yRlpEQjVjU1FPbzFN?=
 =?utf-8?B?Y2VYY2ZyMTk2a3hiL1JPdXl0Ry9mckZiR0FZYTZ2dndxV2Q4WEx2ZkpsejRq?=
 =?utf-8?B?cklGNEtvMlQ0ektmdXppZzdka3JCd2RWK3YxQ0Y5RFJVdzBmMmZQY3lnZHZx?=
 =?utf-8?B?SHRHK1hMNC82VlVIcGZzVmNjb2hJT0M2aG1DUUFRYVowZlV2ODFvQm1QOExX?=
 =?utf-8?B?NFlmTW10cE1nOWFHZXhEaDFubXo0WW1jODhrR3ZCbUNlZ25rbFRpemJ0ZHhN?=
 =?utf-8?B?eVRTV3dOMkNGUGtGYm80Q1BFKy8vV3h4VnN0cStzTHpldEdtdVVNTndURDBU?=
 =?utf-8?B?emRvd0ljbytIRDZzdFErY0hacHdYZGw4V1Y1TU9NQytiQ2JXV0puNDJSN3N0?=
 =?utf-8?B?eDRMOXZoYXltSHdGYzJuNElHaGdISTJ5Nm9SVjBEUmVYb2ZqTlBJQ1o3elRn?=
 =?utf-8?B?MXBXa0Z5RGV5MnJ4UUMzSWJ5cEorR2NrSUlQMmNkSmh5Z0g5eXd5ODdpVkdy?=
 =?utf-8?B?c21lekhJYTNhVVJNMG5Oc2dtQTBXbDlTMVVIbWRzNHRkQklkNmVSN2FxRDFN?=
 =?utf-8?B?QStGcndTc1hQam5VYmg1dWUybUN3dnRWdzhoZlBPcVp5ZnBPaU5VSlozc3Ux?=
 =?utf-8?Q?HOvkDjOi9Ls=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 07:42:40.8412 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c18e039-03c6-49a0-c031-08dd086dbf37
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10666
X-Mailman-Approved-At: Tue, 19 Nov 2024 08:09:25 +0000
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
Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>
---
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

