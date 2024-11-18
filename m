Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5240E9D0AFD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 09:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05D110E071;
	Mon, 18 Nov 2024 08:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="HokLDZWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B917C10E336
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 08:03:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQRjRvxdLubab8OEq1xc1cfuVnbuzrnyR4IFtmYgJLcYzA9NT5P7OblDNRo/axnnNGulyT0nwM0LbA4Y3fxstl6dDs62aUAZyrLLkm6mKNzeo7t1i0E4PjsCHJA8yscCqXHlZJcQ6Ai5kOQf5gnPkoY3WEKPzWgHiPQtJ0z6RCTOBuVnokGeVuaMYmWgYh07J7hJy9y0zQFzsJ/oSTJjsrNEaA/2/KSIWeoxi9DRsd0jLuiq0hgLduTlx3DhZf3J/IQ8ZHmpwMqhAfDtjeiqNDglGoO7R62o6jfG5PXe1d7qYy4sIAHvVUzfDiA7zo1W/UfzDBG/OdD84dT6X3AHnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHGlPhmvwumxdK3g0Id1Bh/8TtzZecngJz49euIFcdY=;
 b=r+j1fgcZvXERQFm9rv/1WFALmVk8kPFmEugBMEGtW3kEUh7VyTpTrtfmV08xOYhNRXpE7P0jT3ts2ny3yciOetPTdufyaOGHG9OfHuGr7oqj/3DilVwwGaYGRkNaR4wpfrXJ/qwDk2ahqaiAgpCTMKdnA92FoX31D2FdcpATi46D8gAKtQdxtx25sfBZFu3kvy001XITuH0Oc6hIT86JlkCmC+vBeLOXQDrr0PPdf3qSyOZxokGRLDj9FKGreCVtPR2yd9gKz3h8LakuD36GPPS1hyqh26F3r5CuiT5Lv7duAFfjAbA0ibmGgBTg/fezYVj03rS/ga0Z2qKudzdQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHGlPhmvwumxdK3g0Id1Bh/8TtzZecngJz49euIFcdY=;
 b=HokLDZWH48VKcFuuthwY6eSWbscvYcdBH0xClmdR0LOXSLUMdVL08Ov0aDA60gsA5c4GvnP55ROXY8yH+LukMsDBaTGIGXgixWja/FgoSSeHLW4Zz46WOZCaez1XsRjePTGshHGBqdFBkIFxJlF3xdV/na2o7LODbVZqwjnPtmo=
Received: from DU2PR04CA0291.eurprd04.prod.outlook.com (2603:10a6:10:28c::26)
 by VI0PR02MB10681.eurprd02.prod.outlook.com (2603:10a6:800:20c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 08:03:50 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::53) by DU2PR04CA0291.outlook.office365.com
 (2603:10a6:10:28c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22 via Frontend
 Transport; Mon, 18 Nov 2024 08:03:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 18 Nov 2024 08:03:50 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 09:03:48 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 18 Nov 2024 09:03:48 +0100
Received: from pc39391-2017.se.axis.com (pc39391-2017.se.axis.com [10.92.82.2])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id 0421F2C5;
 Mon, 18 Nov 2024 09:03:48 +0100 (CET)
Received: by pc39391-2017.se.axis.com (Postfix, from userid 10612)
 id F2D4F4462505; Mon, 18 Nov 2024 09:03:47 +0100 (CET)
From: Stefan Ekenberg <stefan.ekenberg@axis.com>
Date: Mon, 18 Nov 2024 09:03:33 +0100
Subject: [PATCH v3] drm/bridge: adv7511_audio: Update Audio InfoFrame properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-adv7511-audio-info-frame-v3-1-31edd9931856@axis.com>
X-B4-Tracking: v=1; b=H4sIANT0OmcC/33NsQ6CMBDG8VchnT3D0Rask+9hHApt5QaoabXBE
 N7dQhxYdPx/yf1uZtEGspGdi5kFmyiSH3PwQ8G6Xo93C2Rys6qsBGJ5Am1SIxFBvwx5oNF5cEE
 PFqSoURgjWicbls8fwTqaNvp6y91TfPrw3j4lXNcvivw3mhAQhGp5fWqVklpe9ETx2PmBrWaq9
 o7841TZ6bRoFLeOa4U7Z1mWDzuiiwYHAQAA
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E7:EE_|VI0PR02MB10681:EE_
X-MS-Office365-Filtering-Correlation-Id: 12bff9ac-958a-443c-beef-08dd07a7896d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|82310400026|376014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEUyemJVQW82N3dMWXRQQWhaR1RNNVZydnhjUnFXT3VUdHNTS29jcUoxa2NG?=
 =?utf-8?B?UDBoL21iOCt1NzNGMURmOHltT3NpMm1tT1ZxcVMreVJCVlA3eTJ1bUViTFhU?=
 =?utf-8?B?N09XemRlNXBtMTNqRmNoMGJpRlNkK3R4cXFSdkxJUTRBL1VHcER3My9rRmtH?=
 =?utf-8?B?UGJyV2VnV0JlV2JsVEQzY2duaXkvU2o5S0c0dmRPNGVESVBicURuUDd1aVZV?=
 =?utf-8?B?Vk1FWFlJWDN0UTNDeXlDTlV2NUc1TE5nL0NtYjk0Vk1EMzQ1TkFCT1dFUGxR?=
 =?utf-8?B?QmlxUSsrUjFaZFhPZ1lkMmxKOGFyajhIcGkwbG5mVXVxMk4ydldHZEdSalpo?=
 =?utf-8?B?amRmZ0tRU0dIUEorbnZsVis0aEVrOGtRSG5Cd25rS1hqNE5VcWM3ZC85MGFh?=
 =?utf-8?B?eEpubTBxSGJXeXcwNlpUUFl5WWg1dS9XYWZJMTdycmw2Z2pRRS9lUG11RUcy?=
 =?utf-8?B?MDVFVkx6eEl3c3VUNGNNSzBnV2ZrMjAyUExqa3RpR3hJRC8yMVVIc2h2RUht?=
 =?utf-8?B?RFp3UUVrQzVHN3VYdHVBRGJ4MHhZM0k3cWg3WlV0Yk9jOTVwS1pqZ2twTm5j?=
 =?utf-8?B?U2xETDNVeS90a3pMRlYxOTd0NXE0VW5SNUZCd295bFVwUnFXQjJzSUE3cWVv?=
 =?utf-8?B?ckhXb3loQVRMU1hMaUlIdi9rTDRyMjAyNjZCaElnMDJNY0xHaElvVDMzTzY3?=
 =?utf-8?B?T1FWT090dXJHVTVNR2lXOGVOUENESytTazhWZldIODk4VW5hTnA1eGZrZ1Rq?=
 =?utf-8?B?dUNxa2VxUzYwMjFhYWh1QkxvN2pPT3Q0eDBlUVEyZ1pNS3JLWlE3clM5WUYr?=
 =?utf-8?B?TUliVjdmYndUb0ZlYWhpWnlPeWRvUTIrcmVic1dMNk9mYWZkRFZjTlZvaDAx?=
 =?utf-8?B?YkJqRUxXMkpHNVR1Ym5Vbk52ZnI0OW40T01MNVZ5cFFjV3FId2NkY3NkcTRq?=
 =?utf-8?B?ai9oOTZLRmtGTjBCYURlcHVaNkRhUVN2QytkOXZ2aFhqS1drUjRGdGgrbG1D?=
 =?utf-8?B?V0ZzejQ0T04yN3hzemx3OTFKbWJGZTUwMHEvWUZkb2FrWDhlRFlrZ0F2Q2xW?=
 =?utf-8?B?QndJdlBGZW5KLzAxdURJUmE0VnVVRXlPWldQQ3lmMWZkVGtnZnR1UzRObm4z?=
 =?utf-8?B?WnZUU1FaaDEwTDNycXFRSDlJMWVWUWc5VzJYdE9ENmpuSVF1OEwyUkUzdkZW?=
 =?utf-8?B?L29FU1p6N1dob013TmJFbUQ3dHcwWHQ0SUEwMXR1andnajB6N3FnNkREVlUv?=
 =?utf-8?B?R0Y3MkhvTlVBM05jV2ZNWXdWeEFIdTlNU0RlVU9zTXN6clJlcmxta0ZvUkZ4?=
 =?utf-8?B?bUduSmhYeDV4eXkzaU0wNTlLWVpSNnRmdGY2N0J2UERYYnRRRis5eWw0blhh?=
 =?utf-8?B?bEt6RjlzQkx3U0poTEVLTkQxYXVZc3pPcjJabU9BZWY5MXVkN0dqSjRmRXdh?=
 =?utf-8?B?MHpVK3hwa0RnZmswTERGTHN3VXI1ZExVbEFQMzNobDh6elBoZjd2aEFpNzZP?=
 =?utf-8?B?S21vSFJhYjFDanlhcklYaHZwVkFRRGI3ejVaMGJuVnFSZis4S3lJeU52ZHhq?=
 =?utf-8?B?MEc1YUk5eENQQkVhVDZ0c2J6OFAwZlNrblU3bkRrdlpSSUxURDRORmtBWDNh?=
 =?utf-8?B?WUpzTzlyRjRPUGIyL1VubXpJcjk1bXJYUThVS1RTdXFOV1BnS3JCSGN4ZGho?=
 =?utf-8?B?Yi9jVGtDbTlDTVgrS3dNZG5QTGJOSXJHVXFwWU96cVl5cFhybU5VSGlqUnpZ?=
 =?utf-8?B?U0Yrdnd1Rlh4Wm1BT0JDVTJ0SHlDM21LdGppUWhicnVxMENkZFY5WERsMFVk?=
 =?utf-8?B?b1dtTmpobTR0VWJsY1lncy8vZTZTbXJsUURTV3pUOXQ3RzU4M1AyYWZGc3VC?=
 =?utf-8?B?NTBFMEVWWkRzVVg4eURiNU45dDNLNklBSk1DUWhQWU1jWFJ0L2xybGNBYVJQ?=
 =?utf-8?Q?sbKpBu/MZUs=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(82310400026)(376014)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 08:03:50.2457 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bff9ac-958a-443c-beef-08dd07a7896d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10681
X-Mailman-Approved-At: Mon, 18 Nov 2024 08:35:34 +0000
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

Note that this patchs replaces writing REG_GC(1) with
REG_INFOFRAME_UPDATE. Bit 5 of REG_GC(1) is positioned within field
GC_PP[3:0] and that field doesn't control audio infoframe and is read-
only. My conclusion therefore was that the author if this code meant to
clear bit 5 of REG_INFOFRAME_UPDATE from the very beginning.

Fixes: 53c515befe28 ("drm/bridge: adv7511: Add Audio support")
Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>
---
Changes in v3:
- Extend commit message and explain replacement of REG_GC(1)
- Link to v2: https://lore.kernel.org/r/20241115-adv7511-audio-info-frame-v2-1-ca4793ef3a91@axis.com

Changes in v2:
- Add Fixes tag
- Link to v1: https://lore.kernel.org/r/20241113-adv7511-audio-info-frame-v1-1-49b368b995a5@axis.com
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

