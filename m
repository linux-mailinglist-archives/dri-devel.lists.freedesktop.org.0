Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BFA9C6AB6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 09:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D178110E69A;
	Wed, 13 Nov 2024 08:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="WBovD0uO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2089.outbound.protection.outlook.com [40.107.247.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7353410E26E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 07:38:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMSHCGImYgYi8Em71i31mJzTkxAZ9v/bG6+Mdkn69pziSHTpa3euFZhBhq6yYTcryvxwDa1lTmk4KyCauf0oMzkziGmGu15rFJjGA2buH3GAXUdqDAiThQSJ4YVeFe9OBQn1jiEIMBmo5uMgsm9spK3Qlizegv+UroGWPeWZEP8/SII8MtX3MpBVqasOA+kqF3Pd+tPP3DUSr4HhgE+RE6RrhAe2ytAfZUxhagXT0RhCq4ih0rNCwXokGHJsgK2HFaReOOWZ6lx3dfE6bQW7c09eUbL8QTIEAEHZ5NzrGwiKgWTvGFHsoao9+ExyhzWPz5Yh16jtCV5oh/TBNX5Xww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqnLus/qCcBXphp+nkVPNT53ikrfEt3bjZjghqE2x7c=;
 b=D0KfwFsOKwtfSUC7mKn+Ru9tNP7XItEgypMfGVYubXY1NfAngfXyVmE0yuVb6+Ny7ifbok1zfxM6COscwF2xYy3FJlUDcbgbTCaFBIIx2Ea5qC1FGPUFKkMc0ph4zrK480iDtbejgM/Fqhtot7o9ddjMyoghrXwhkKGouuJotRQozjjMTW8XzwA1+iKuMIuo0wXpD2J2FPLRVq91wQoEl3kPCZkPvNPoxETbzCCLkKl3DSiL56QRrYMC/EuabA9/yG+hy8RmkwwLjLEg4dwNlOQQF3PjY3FkvgPGdIm7ggaX+MWMkNdXTGQvafRRLyQKSt34BqgSltpNaEqmdqBxfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqnLus/qCcBXphp+nkVPNT53ikrfEt3bjZjghqE2x7c=;
 b=WBovD0uO4OquBnx/duEX+br4EiSYfvipGu4KuexqpnIofjOVFOGKpL8vstFA8KwYO4TkAod/09dJHouh+Byfz9GunC3YxL5frb8PWeqjtVLffrGNb3717BkjjBuadI2i6pLOmq5+wYJAKVKewWa3B/oeSlGyN1eFWfWdBcyntCk=
Received: from DUZPR01CA0188.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::27) by DB9PR02MB7132.eurprd02.prod.outlook.com
 (2603:10a6:10:228::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Wed, 13 Nov
 2024 07:38:34 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::49) by DUZPR01CA0188.outlook.office365.com
 (2603:10a6:10:4b6::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Wed, 13 Nov 2024 07:38:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 07:38:34 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 08:38:32 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 08:38:32 +0100
Received: from pc39391-2017.se.axis.com (pc39391-2017.se.axis.com [10.92.82.2])
 by se-intmail02x.se.axis.com (Postfix) with ESMTP id AC8535D3;
 Wed, 13 Nov 2024 08:38:32 +0100 (CET)
Received: by pc39391-2017.se.axis.com (Postfix, from userid 10612)
 id A77B74462505; Wed, 13 Nov 2024 08:38:32 +0100 (CET)
From: Stefan Ekenberg <stefan.ekenberg@axis.com>
Date: Wed, 13 Nov 2024 08:38:11 +0100
Subject: [PATCH] drm/bridge: adv7511_audio: Update Audio InfoFrame properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241113-adv7511-audio-info-frame-v1-1-49b368b995a5@axis.com>
X-B4-Tracking: v=1; b=H4sIAGJXNGcC/x3MQQqEMAxA0atI1hMw0qrMVWQW1aSahe3QYhHEu
 1tcvsX/F2RJKhm+zQVJimaNoYI+DSybC6ugcjV0bWeI2hEdl8ESoTtYI2rwEX1yu6A1PRlmM3s
 7QM3/Sbye73r63fcDxU7vzWoAAAA=
X-Change-ID: 20241108-adv7511-audio-info-frame-54614dd4bf57
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61B:EE_|DB9PR02MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d6ac4ce-1261-47e9-6f85-08dd03b62e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlRRUHgzcWZHWGZrVWYxMS9nT2QzWjlJd2FpV3dXeUxsdVpLWDdheVZRNVBy?=
 =?utf-8?B?a2FpcFVWbGpyZmNaaEtJbkFRUmd5VFRaNWVEZWs2dlRRUUZIUGJUREFFZ1My?=
 =?utf-8?B?eG5kdnAyL0I3YVVob29QVE1nNCs1NVJKaytDZmUxb3h1eWptSjlwNEUwaWFX?=
 =?utf-8?B?WDdRR3JoQnlNR1p0ejN2VkxJWHlHVmkyOGdEbmg5WHN0Mjh6WVhvL3gvVGdE?=
 =?utf-8?B?Y2ZkTWk0RWdVaUhhOGdNNjFhbmFzWjlxbjc2UjQwYlFqTVYwTzgyS2p4ZXY0?=
 =?utf-8?B?ajhnMUZ2S2Y0MzJScE9GbGpRL0FXa2lZb1VjYll5UTZmMHE1bWpzeWlya3ox?=
 =?utf-8?B?bUI1NHYzSjIwT3hRbXNSMjNIc0lERXdVckd2Y25BQXhMeTRHVHV5VDl5TXhG?=
 =?utf-8?B?OGhhUUduYTNVU000VksrSTZVcGtQWnBRNG9zWlVEWjVYQjZrR2lhbkhlRncy?=
 =?utf-8?B?MzZTRkNTR3pTRFlINVVLZEFBQW1mUjJnV0FzTVhjWFUwU3RqNmtsUEFQbEtG?=
 =?utf-8?B?Y1E4ZlkwMHNxQmdhUzJsV3B2c3NMdWlaRWhQU2ZuZkREVkY3Z0piaktHa1A2?=
 =?utf-8?B?K1FCTHpIMFRSdnhaL3NaTDFlZk5QZVFheWpybW9IUVBOZk9UOFAzaVdYMFpi?=
 =?utf-8?B?ZjBFNm5JU1RKSFdOMUphczg3aVBqMW5QUjVrT01xcEJyM2dQcUlaYm9YY2ZZ?=
 =?utf-8?B?Z3JEUTU3WjR3R3FQRXY5cUFBVklRSUN1b3Q5SUl4MzFnc1Q4bXRWS2hGMlNB?=
 =?utf-8?B?eTVBb3ZqbEdPbnNrMGRYM24zVWxROWZWdnFXazcxWFMvM2tYU1BTc1pHbmxz?=
 =?utf-8?B?Y3ZENnM5czdWanFsNHF1NlVQRnE1SUR3V1hYWG1oYXRGbXgxWFF5R1JpTUgz?=
 =?utf-8?B?M2lKR0FJWjhtNUlpdGxYazVEQ2R1SFl6T2F3L3V4d2tyZXZ3enpXVFIzVHp4?=
 =?utf-8?B?MW1qNk9Yc0tlaXB0YzEzeGxEenQrcXU0blpvT0FYTlUyUlhTalJWaXFJaG9B?=
 =?utf-8?B?SFYvMEwvaTBkeUV3TU9tTXpCS3lpYmZBNVdNSmN5Q0I2OWdZM0h0bEF5V0ha?=
 =?utf-8?B?REN2RkRBZGtJYVZrU1BmSUtUUU1UeFRnWURxM2FEbFMxMzdmNG9qSDA0bTdX?=
 =?utf-8?B?eFRUdWpBcnBuUE1LcWdRcno5ZUc4bW45ODEyMnJRV1JKZmROd1k2djRjUHFq?=
 =?utf-8?B?aUdDZ3Y4b1Z2SW5GZGZwU1FMWFlSQlJYbFUxMnMybzZYQWFsQ0toMFNOTmpQ?=
 =?utf-8?B?MHRLTmRJUnY0cDhqUVFTbGFnRGJiRVNyS1NVRm85OWFtcnB5TE5zYlFUUi9L?=
 =?utf-8?B?T09MQklTMjV4NktOZEFYcmh6dHhzSEtqMDFXWlQ3RlJuVng2MFNRaWN1eE1z?=
 =?utf-8?B?V09MMllKb1I4c1FKQmlRTzRrZitVM1JtaGlvbFJBZElEU3kwUnRsZkhOcFN6?=
 =?utf-8?B?SzZkd3JsNmVPZWpYdEkvY1BhYjdreHpaejYrTE9jUlA2Vm9iVUJ0Qi85Zk9I?=
 =?utf-8?B?Z2ZPNWF5bXRKK0xySGFiMk9JL3drUi9oaWM0cGlTYWxKdGhhZDNVK0hYVHJU?=
 =?utf-8?B?KzBJREJGSXgyWUdDTEt1bEhnQzFkblVPWXJqbzZnNTlRNGlKNW9SQUpzbDND?=
 =?utf-8?B?Y1AzMGo4bUtDenpKcmtaM3Z0d0xIVVJVQmJnbUVJQ09sZ2lreWRuTmlOTGJ5?=
 =?utf-8?B?eHYvUUk4SkM5eFJoZU5GVnNFOUNCUzh5Y1RlazR3M1B0UnQwbkNReXM2VmdE?=
 =?utf-8?B?cm5jYlFQUXpMa0hxN0ZnWjg1NExrWnhsNUYwWEE2NFZUaGM1QTAvQzNnekJN?=
 =?utf-8?B?YS9pQS80aHVmeFBqbFd1bXFaSERHUHNsVy8vQzM4T2xJTU4xRC82NDYvWXpl?=
 =?utf-8?B?VHo5YjJtVVdXWUdrWE5jazhBVW5jU2x4elZJRDNCSldqRTVzZ3JQTkIyVTJP?=
 =?utf-8?Q?Bj6rYu/eV3Y=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 07:38:34.7810 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6ac4ce-1261-47e9-6f85-08dd03b62e13
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7132
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

AUDIO_UPDATE bit (Bit 5 of MAIN register 0x4A) needs to be set to 1
while updating Audio InfoFrame information and then set to 0 when done.
Otherwise partially updated Audio InfoFrames could be sent out. Two
cases where this rule were not followed are fixed:
 - In adv7511_hdmi_hw_params() make sure AUDIO_UPDATE bit is updated
   before/after setting ADV7511_REG_AUDIO_INFOFRAME.
 - In audio_startup() use the correct register for clearing
   AUDIO_UPDATE bit.

The problem with corrupted audio infoframes were discovered by letting
a HDMI logic analyser check the output of ADV7535.

Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 61f4a38e7d2bf6905683cbc9e762b28ecc999d05..8f786592143b6c81e5a434768b51508d5e5f3c73 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -153,7 +153,16 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
 			   ADV7511_AUDIO_CFG3_LEN_MASK, len);
 	regmap_update_bits(adv7511->regmap, ADV7511_REG_I2C_FREQ_ID_CFG,
 			   ADV7511_I2C_FREQ_ID_CFG_RATE_MASK, rate << 4);
-	regmap_write(adv7511->regmap, 0x73, 0x1);
+
+	/* send current Audio infoframe values while updating */
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
+			   BIT(5), BIT(5));
+
+	regmap_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME(0), 0x1);
+
+	/* use Audio infoframe updated info */
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
+			   BIT(5), 0);
 
 	return 0;
 }
@@ -184,8 +193,9 @@ static int audio_startup(struct device *dev, void *data)
 	regmap_update_bits(adv7511->regmap, ADV7511_REG_GC(0),
 				BIT(7) | BIT(6), BIT(7));
 	/* use Audio infoframe updated info */
-	regmap_update_bits(adv7511->regmap, ADV7511_REG_GC(1),
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
 				BIT(5), 0);
+
 	/* enable SPDIF receiver */
 	if (adv7511->audio_source == ADV7511_AUDIO_SOURCE_SPDIF)
 		regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CONFIG,

---
base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
change-id: 20241108-adv7511-audio-info-frame-54614dd4bf57

Best regards,
-- 
Stefan Ekenberg <stefan.ekenberg@axis.com>

