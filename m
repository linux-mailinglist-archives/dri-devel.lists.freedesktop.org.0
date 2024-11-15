Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486459CFD9E
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 10:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B59C10E11C;
	Sat, 16 Nov 2024 09:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="h03++5ei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807EE10E09D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 12:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlKgO4GTKVHDhYdZbyPHq7DzCy5LNShyb0LELJeh7WiMrIXE6AAwNMx0FwkV5gzA0qrsb1yrJUMGNn1sMYw2CJI2FVP/GxTNduI8Q/ERNDfyqxfqeivE14mF1Db5eHD+swhSX6ZN8dcE63y9bPJb5JsIE7D3Tf0iVcOXBsZtcW/XhmJZQH/7YWf2E/PzdUrfQfsuCn80WRt6Oqb1YtG2e3i+HfAcCFthspkTM+ERZQkzK6GxSjTnEar6yZlZP5FD4rv+mXYaMCEWPKvQ5v3KmCccZN/PqbpFgbm6AAvyRICWMYbSmwR960vwuQCPR1PnTTGTaIXIwRfuj2eZPZ6l+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbJ6lZfTY+DuhfQkjUWQIcPpNdxDk9l8ALGzqO5tGAk=;
 b=qcPcNou9Cm5KUDQXyDlL9mGnCDRVHI9VNJziV6IirTBXTbkAPamzOzJxcdDisVtp4n6gA5qsPp0/4q9ozC2vhD7VLjhMv9eEUVp+1+M3vkynCmnJ5BvL4pWnBZCPuqz8Hor9mvGzTgGJHvJBKvY98ICNEkFwyIm+w0i/8TFt+FAJvpbv8CbpvMnX295VZskM79qkOa2bEUtpiqVex+awBtE6v/4nLBohSODybusNrlWUKauZ4/U7e2msjwQWsjfA17m/bF4ZGevyxAZckPstvoVoIguKf0+lcaBTFViRUpqlbTpexElvP8yaZETAFqo6p9NIlL4OjHPHuiLKjJswKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbJ6lZfTY+DuhfQkjUWQIcPpNdxDk9l8ALGzqO5tGAk=;
 b=h03++5ei2PSbJtP0Klt0sUQ7jN/57dHwEwPCxqAMm7cRtONGBcqJ82St+PvVgUa4leeImLtxWXtlTDwoVUYFIlfV5AKItgMGmGsy1ruD+ThhcFhAaKRoOt7JRy2tzkhHkw2ch+rJhoubR7KIT6yVnJRXO/De+Y143HhnxZvlOY4=
Received: from DU2PR04CA0287.eurprd04.prod.outlook.com (2603:10a6:10:28c::22)
 by GV2PR02MB10046.eurprd02.prod.outlook.com (2603:10a6:150:e0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 12:57:43 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::b6) by DU2PR04CA0287.outlook.office365.com
 (2603:10a6:10:28c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend
 Transport; Fri, 15 Nov 2024 12:57:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Fri, 15 Nov 2024 12:57:43 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 13:57:40 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Nov 2024 13:57:40 +0100
Received: from pc39391-2017.se.axis.com (pc39391-2017.se.axis.com [10.92.82.2])
 by se-intmail02x.se.axis.com (Postfix) with ESMTP id 5CCA45E1;
 Fri, 15 Nov 2024 13:57:40 +0100 (CET)
Received: by pc39391-2017.se.axis.com (Postfix, from userid 10612)
 id 57D0C4462505; Fri, 15 Nov 2024 13:57:40 +0100 (CET)
From: Stefan Ekenberg <stefan.ekenberg@axis.com>
Date: Fri, 15 Nov 2024 13:57:28 +0100
Subject: [PATCH v2] drm/bridge: adv7511_audio: Update Audio InfoFrame properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241115-adv7511-audio-info-frame-v2-1-ca4793ef3a91@axis.com>
X-B4-Tracking: v=1; b=H4sIADdFN2cC/3WNyw6CMBBFf4XM2jFMaXm48j8Mi0JbmQXUtNpgC
 P9uJW5dnpPcczeINrCNcCk2CDZxZL9kEKcCxkkvd4tsMoMohSQqW9QmNYoI9cuwR16cRxf0bFH
 JmqQxcnCqgTx/BOt4PdK3PvPE8enD+3hK9LW/KFX/o4mQUHZDVbdD1ymtrnrleB79DP2+7x9dA
 rPmvwAAAA==
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D07:EE_|GV2PR02MB10046:EE_
X-MS-Office365-Filtering-Correlation-Id: cf047db0-6810-410c-09a2-08dd05751830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|36860700013|376014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K09CcjZrdUVLblFzNWlyK0duY0k2MklEUkxYSzEwY2Q3WE1WejhiVkx3eSt6?=
 =?utf-8?B?blpEQ0E3QThoaFh4dDN6NzVxNjk5OWdmWUlKU05Bd3I2ZEF2ZzJpbUQwU2JE?=
 =?utf-8?B?cnlCdXFsa1hEd0xTMWxDMzRLTFp4TEhxZ2xUZE03UW55TnZVaVpESGt1NmFh?=
 =?utf-8?B?UWVZUUR4L3dqV0RDZDRZUjRRQzI2cEdRdktkN1JYSVllWlRDZTl3a2RyNmFw?=
 =?utf-8?B?dTV3dWFrNVBBWkNKODZxeXh1OWZ5WXJrN0F5TzlXd0tUS3Z2ZHBLT1E0d2lI?=
 =?utf-8?B?aTlJQlRZNU1UcHI4dmhwWmxPR255eHJjYm4yQzU1YkNGdTZkMFFLUHB3d0ha?=
 =?utf-8?B?NjNwNUE2Y25zRFhkcEs3SGwvRmFDVnJiM2x2cUZoMWZqY1paVXdQeFNBenEr?=
 =?utf-8?B?SXdGT3h3aERHdEZhRFBkNzhjOWtMZEtjRzVlZ05QcE1hOEZnelM0VHJlSy9i?=
 =?utf-8?B?QnhJdEdOcnpCcWdaekswRC93VjRKTkhEWDgvajU5cFBRbmNrT3FOZ3FSVGR4?=
 =?utf-8?B?b0tJTW1XYVRwWTNlMHdwRDdmbGROR1Z4TzhYMnl1eHhqNmlBa2UwWmJqZUJ4?=
 =?utf-8?B?RjlXUEhBNEdQMGVlb24wY0dGR0tGUTVwOVJUcGZORHM2V3NXRkhoQVYxREh1?=
 =?utf-8?B?bldMY3ltaGIzTGgzazUwS3pGRnE5bWhHYUVmc3dza2hJREZuNnBvZlhCVXpE?=
 =?utf-8?B?N2Q5LzJ4YXlqMkdqc3hId2N5N0JCWDVxZE0xemx4Nm1yUWl5QXBsWmxJMmxh?=
 =?utf-8?B?dFJ4WmdEanJzZ2lGRnV3TXJmYTJiUWlKQUFZU3dCU3BOYjRCSlIrSVZheVZS?=
 =?utf-8?B?QVdJNkkwbE5DSHRVM2FlbDkrU3ltMHFwTUdRQ1REbWtjYzJZTlI5RW8zV01k?=
 =?utf-8?B?ckJJSytNVDZVVFpNZjhHV0xxOEZVc24yRFRocDZpYUJkTHVMampHaW52NHpX?=
 =?utf-8?B?RFQ1VnFZWHRaOFlFUEg3SGZnWm9DR2tiNXZhWXFKb1lpbzgyWnZBM1o4aC9x?=
 =?utf-8?B?dnBQQ0pTL01nd2xpeUFBVDAyb0xUODMxamdCTEd5clNSczc2N1FCdEU4WlF5?=
 =?utf-8?B?dlhGVTZtSVRObXNaY3JFMU5GTlVGZ0JWSWI0YjVNV0Y5QlFZZlhPbWtXaXB1?=
 =?utf-8?B?OE13c2ZGQ2htZy9nb3VMWXQwRDZoYlVuQ2xoaEtoMXdEMlY0dlhjSVUxYU85?=
 =?utf-8?B?dUdLakZFZys0SXdYaENyUE1KZGV4c2dxaHlkUldKS2orRXNQSGs2S2ZTMjM2?=
 =?utf-8?B?cjhkTW9Pb3A0Z0FmSEdQS3BJOXB2Vkc2ZnBYVndicDQ0MnVyamtLNUNXTHZh?=
 =?utf-8?B?UktiVlIrQjF1YWdvYmU0MEJ1c3FPeGtPeFRUZTI5RFd2OGpGZ2gvaUVuc0xM?=
 =?utf-8?B?YldtNzhZaysySHd3UEtSb01saTVXWUVDVkM3V0lEckx4dUdyNVgyZGRvYkJq?=
 =?utf-8?B?MnpYTW9LZURPTDMvOSthUzhGcm5IbnFLKzVXbHVEbnJzcnMweVBIV3BIY0dz?=
 =?utf-8?B?R2xjTzFKUkh5cGRTclBjNWYwZkxNL3pycEdFdTNmR01mc2ZFbFZxdVVIU3Yr?=
 =?utf-8?B?WFBkY2VLMWJoUHpBOFJNbmVWT1I5RDdycE9ZYXF1aFlWZEtHbVVrTzNJVmFp?=
 =?utf-8?B?d0ZTSHg5OXNRWW45OVEvMXU5ODJRblFybnRyRTlzTkFlNThRTGw2UU5tREZv?=
 =?utf-8?B?VTE4UzNkbUNCR2hIWXNvcUZBTGNzNGV2Q3FvNXc3ekFJU3hpbVZNTHpBNDU0?=
 =?utf-8?B?ZVc0ZjU1d1FBK1F0cmtLeE9yeFc1SmhGRUQ1dmpnNFRRQlpjdU9pVnkwcmZX?=
 =?utf-8?B?bFpqUlBrMlZCSTVLR2NUYmxtdWcvNUZyZ00yMDgrUlhnV042b3hiK0xNQ2ln?=
 =?utf-8?B?Y04rektHQ2lsd0F4eURxaUhlTlFFek1pOFFOYXc1MWNQb3dJWktMcGxhM25L?=
 =?utf-8?Q?zZicQ9H8z84=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(36860700013)(376014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 12:57:43.0967 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf047db0-6810-410c-09a2-08dd05751830
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB10046
X-Mailman-Approved-At: Sat, 16 Nov 2024 09:51:27 +0000
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

Fixes: 53c515befe28 ("drm/bridge: adv7511: Add Audio support")
Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>
---
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

