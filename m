Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158869C6AB4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 09:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7340510E1A0;
	Wed, 13 Nov 2024 08:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="gl6pfd2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2048.outbound.protection.outlook.com [40.107.103.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DAD10E26E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 07:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htDztN/WXs6bQQdPQeawZo8Unjog+pF3gsDOmdqO65ZTiBvrOmYdPKH+GIb2xe4P/hZt0L9PDjp/8GwHKSkApuh2rKmDRe0PdaxXZUC6pmFuJ/c9PDKQNCEeLxUSjV8M4SmkLX6rE6RFwNUFdcrzY4TSGn99ORsTfIeaF+2jkEIbWjjPNIqBVp5YwPKgvqFUWEMa/ma6GqBRcXsTtH4duYT+KkELm3bvTvs/2DM8gHupPGLVVhueG2Mw9wBJicd2gmjhfgDJRk47S27ZGoD+W+JPflAnfkExqxhBCiRt7866mwNEgrm/1RwDVGFYmaBu/0xbbGTkHRLarZMPbaxBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIPP5VvJz8RxsOkGuQRvoyiC/7cc9OSBu+FlRLRFaVE=;
 b=rYQUqbzBxVh12Kq8bed3AsST/9qtgPZZHVMQIn5C6CYMqKF1d9xs4cAlVJQsqscvJYbypGGyye80HtxC1FJpW9vuwIoAwzOlTyZb2k/ROkQm1PtbHiSR0dLbKpbXvoBbLKkJuYaeP2Hq7DZTMONgDLNknIYSAsaHryvTlzLmEeEBgex0BaxYUjGCxola7pVPDAC+0oGHcl9Z/UQ553GoCDpA6X0mcFQiM81Qxe6F/zWyGNczgU4TEl4QbbsgQIHSkuIIgD5jMjcIbWeT6QSbpJS2ulAqNuVybJ/pz9XNZaCUlo4vK/D3yexpYC87TXMafAhdpgzh7jAKjtoGX0U2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIPP5VvJz8RxsOkGuQRvoyiC/7cc9OSBu+FlRLRFaVE=;
 b=gl6pfd2c2+xtnaYqAEZcpMjT5DBwNEEo1Z1ASNondL8YARVBCei7lGSK5Ce/005Za/cMZuSbF4utrNPtwxds7iT5nEoMYANi7H+fAT7ny84rpHHUVFdGz+hW8J8bEYymJJ06fl59PYnIisEWQS/FEv2XGR/f8NnloIJGClLCiw0=
Received: from DU7P189CA0015.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::14)
 by AS4PR02MB8526.eurprd02.prod.outlook.com (2603:10a6:20b:585::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 07:40:41 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::e0) by DU7P189CA0015.outlook.office365.com
 (2603:10a6:10:552::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Wed, 13 Nov 2024 07:40:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 07:40:41 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 08:40:38 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 08:40:38 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 08:40:38 +0100
Received: from pc39391-2017.se.axis.com (pc39391-2017.se.axis.com [10.92.82.2])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id A08F01CA;
 Wed, 13 Nov 2024 08:40:38 +0100 (CET)
Received: by pc39391-2017.se.axis.com (Postfix, from userid 10612)
 id 9BB1E4462505; Wed, 13 Nov 2024 08:40:38 +0100 (CET)
From: Stefan Ekenberg <stefan.ekenberg@axis.com>
Date: Wed, 13 Nov 2024 08:40:15 +0100
Subject: [PATCH] drm/bridge: adv7533: Reset DSI receiver logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241113-adv7533-dsi-reset-v1-1-6c1069e35fd3@axis.com>
X-B4-Tracking: v=1; b=H4sIAN5XNGcC/x3MPQqAMAxA4atIZgP9U4tXEYdqU82i0ogI4t0tj
 t/w3gNCmUmgrx7IdLHwvhXouoJ5DdtCyLEYjDJOa+UxxKtrrMUojJmETnTez22apoacgdIdmRL
 f/3MY3/cDkOUzx2MAAAA=
X-Change-ID: 20241108-adv7533-dsi-reset-488c6fbb5e42
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel@axis.com>, Stefan Ekenberg <stefan.ekenberg@axis.com>
X-Mailer: b4 0.14.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|AS4PR02MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: 74791916-f2f9-431c-ce48-08dd03b67958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkxiaTNSN0V2aFBDK1l6ZkV0NlhwNzVDSzl2TGlyZCtoUnIvOU00cERtd2hQ?=
 =?utf-8?B?RlRza3daSGF5bVBXQzhxejExT0hqS1liUXRJZnRodjJaRlFYYUU3b1BVQjNj?=
 =?utf-8?B?U2g4enBxS3d6OHhKN3VHOW12SHdIdkVtNzRQUHhvS3pJWXYrVm1VL1o2bUhB?=
 =?utf-8?B?WGJvYi9KT0w1T2dNVGFoeEMwRnpnMlJkNkRiQW4zUkRoSFBWcTR5N0ducFpw?=
 =?utf-8?B?UUc5MUdYdlI0S3dpRjZJcU1jb3M2d3BPcmdOQWwwbmFvSHJNdWt0cXRNWGsr?=
 =?utf-8?B?NkIxRVV6ZnZlbFlvbHB1Yyt4NVp4akRKaWxzSnQ1K1ZkRTFwbC91VlJEa2VC?=
 =?utf-8?B?WWYxLzBQcTl5ZVhKOTdPelpONnREZlNscnpUZFF1YU11TTJwdGsxN2xiMUNQ?=
 =?utf-8?B?K1NFZE9zekFNSGZpbnA3cm01RW40ZmQzR2hndGo0clI4OWdnTERrMDRQMzhC?=
 =?utf-8?B?Q2RibjVCL2JoOVlIRGVmOS96SlFUVnNtcmlOaUpEczJ6N1RTQWIwOEJnbCth?=
 =?utf-8?B?TWNhcExEQ2FoWjNXME12aUJkV3d3N1R0L2hNNzgxZGFlNEZMMmd4M1VDRUFo?=
 =?utf-8?B?TkVPenNzYUtyWDVDL3NSdjd6V3VvWk9NaWFQaEozd3pKZGdXNjl0ZitNVTZY?=
 =?utf-8?B?ZzVhd29GVm1SRDg0SkhsZDg2TW1TdFlZUHdIOHlyZG9ibUlrcEl2ZGdVbUV0?=
 =?utf-8?B?TWwrSnQ0ZnhnSkRGRHFCMXZmQUtVaDlJQmZlZFlzQk1QMzMwL3duTE40Tkp4?=
 =?utf-8?B?MTQzTWJCMjdPTHlkL2tIeEpZeUhjaEMzT2lKY1RLajh2YWtleG05bG9sczVn?=
 =?utf-8?B?dDVqSll2dDF1VFF5V2JYM2tiRExpM0luQjA0c0xicXJIK04rSVNzaVJPZGw4?=
 =?utf-8?B?MzFweUVlMVkwcjFMNkZGdHJFS2luYzRHcGhsTG9nZUNUVzhGTDdtMThWaXVG?=
 =?utf-8?B?R3dlVmtlblE2TXdqeHFFOWZCN3JacGdIMlVzYzlCc3VPZ0lPdU41Y0JyeGwz?=
 =?utf-8?B?UGVDd050UjljUzlReEVwQjBQdGZZd0dWcVhHd0QxRnRZeXFqUXlCc3BEbDZB?=
 =?utf-8?B?MUNpcGJpblppSXU3L2tiayszTjRwOUtYTlNsSU5XZ2xhNFUxRmNnRnhud3o5?=
 =?utf-8?B?cTdMVXNVTUxIVDZ5bm9rTjc4UmZOL2FVbERpTnpkMHlhQnJPbEdhZ3VOcFYy?=
 =?utf-8?B?ZDRzaWtMT1lxb0MyMVdmQXBIMGJRWmlVVi9tQXFudm5yQ2Zib3dBYUsyZ0V0?=
 =?utf-8?B?OTNQbzZmYitiN3hQcEZ5QlNtbXZSMUppZnRhaUh4TE1YRi9QNEx3TVdkU3Js?=
 =?utf-8?B?RUNCSUpNaFkwZ1g1WUhqY3pZSXNGdjB5Wmpxa2N6U0ZZQVVFSmFTNUJGZURG?=
 =?utf-8?B?cGltdXNQTlZNKytmTExUaEEyOWxTZGl4L2wzU2VKSEExdmgvbU9PUG1zOTQv?=
 =?utf-8?B?N2lwTWpYVU1zQkI3TzA5Q3lPa1VQQVk5bG9UMTQ4NEQ5U0k3M09MQU9OM0dk?=
 =?utf-8?B?dWYvcE4xanJEWlY0RitiY0xuaVZPeWhBSm9kRWhpQTdNQW9HY3ppMXhhYTVz?=
 =?utf-8?B?dmNoRVlWeXhQZWgxMGdDeVV6YjdJVmwyUjBGY21JT3pTQVJVejBEVlJ1R0JV?=
 =?utf-8?B?bmphb1VPZTV4MVFacVE4bDQ5ZDY0RXg0UEhFNmRLejVoZlJiZnc4Zy9WSUFl?=
 =?utf-8?B?TkpBZDZOcXVMejMvY2tqTFZRRERaRkYzVmErR0VOSDV4Q0ZaME5oMHNXS3NH?=
 =?utf-8?B?N05ZUTBSMXBZdkl2WmxrOWVMbllqRjkxUnV3a0hxQ2FzZVowd2hlS3NtamxF?=
 =?utf-8?B?NTlGV244NERPSFlzcUVlQTFCT3pwQ1E2dzl4STFwNmx1bUhrUys5ZVljRkhU?=
 =?utf-8?B?OWdXUzdxWERCV3dhNHVKN2R6Zno3TUN4QmxRcUNaeUgzbXloQVArZWFyLzhs?=
 =?utf-8?Q?VMji6OVh+I4=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 07:40:41.0647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74791916-f2f9-431c-ce48-08dd03b67958
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8526
X-Mailman-Approved-At: Wed, 13 Nov 2024 08:40:38 +0000
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

Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>
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

