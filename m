Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573649D2145
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 09:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E1910E13C;
	Tue, 19 Nov 2024 08:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="hJVkJePI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA64510E13C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 07:40:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YT9vES0bJnWBdcOfK+uvvNBFYVDFF6n06Os2jd7wtwvUSV2/HCv4FTCMPHHuibnOJB2uB8TFffmEnL7vyACGvPgtLkj9SYsZfBDjQWjMHqgm0AHpe1fMEoLMNUhCE5Z7EWTgrfOX4TY7cCtMds4PqDcTCJPd5bsE1YBURwpSO+rik/hr1EC2TYGZHwBsPxxm5G2OsYGkoHSHW2knnL9RxZulVNe9NSbzJVK9lqkmK4Yj1tFd2yFJavPDMKcAL9tnAd0+/JcJFvcPor0y5yvYA86iaLwpMzjETSbCjdx5Jg9CAcSOEQJ+Vdk+JV2HTBcCKJAxoeJZ8WiNtCAa/zD7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJmB8fg/OjYnIRr/FDUQr2RcQ0nrrTgSYbPBkPsf328=;
 b=Pl+d+O7fXNudYWsd5Q3dg3lubJkthXL+bn+oBnSrKVKEzzqw696QCJbXt0fZWishuW1S+pm/yip8N/o/5JvF7yoUakdeSN84iM4weszIkgRMslFtJGpsQQlYYzMAeeCsoOZ46lidah1wfbffhCtxQTVE8H7ybcVDQl92p4aVDWVMWukE6rCuMMfj2dHI5QLs3pVdZ2LXqKmkn5YA3pvD+TE0nYAts8yKtkeKVo2Im/NaNnTT+MwdPkIxUx3t3gZorS9mLRruZFpJ6lYATNfiLIBQUqR0Ld1Ns1rCz/HFr7n044fTzFSXIJ3KVbhZ51raL0wBWi0sC7DeaGaA279UtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJmB8fg/OjYnIRr/FDUQr2RcQ0nrrTgSYbPBkPsf328=;
 b=hJVkJePITEJNIyXEjh/XLOJSn/uYmShbMalsORYHc/sugQoXp5RS6aIFegm+8uOtmUzG8zYir1CXh9ByfdD1mYv9CimlVbzqrFzES9LJehHfBx34b6CBjM4g0BCW4jbnPUY618YVJgUvEJlZFKCzzWMreOUmOBHdRGfmA4YjMlE=
Received: from AS9PR06CA0207.eurprd06.prod.outlook.com (2603:10a6:20b:45d::34)
 by PAWPR02MB9054.eurprd02.prod.outlook.com (2603:10a6:102:337::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Tue, 19 Nov
 2024 07:40:31 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:45d:cafe::c2) by AS9PR06CA0207.outlook.office365.com
 (2603:10a6:20b:45d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Tue, 19 Nov 2024 07:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 07:40:30 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 08:40:30 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 19 Nov 2024 08:40:30 +0100
Received: from pc39391-2017.se.axis.com (pc39391-2017.se.axis.com [10.92.82.2])
 by se-intmail02x.se.axis.com (Postfix) with ESMTP id 063B5881;
 Tue, 19 Nov 2024 08:40:30 +0100 (CET)
Received: by pc39391-2017.se.axis.com (Postfix, from userid 10612)
 id 003AE4462505; Tue, 19 Nov 2024 08:40:29 +0100 (CET)
From: Stefan Ekenberg <stefan.ekenberg@axis.com>
Date: Tue, 19 Nov 2024 08:40:29 +0100
Subject: [PATCH v4] drm/bridge: adv7511_audio: Update Audio InfoFrame properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241119-adv7511-audio-info-frame-v4-1-4ae68e76c89c@axis.com>
X-B4-Tracking: v=1; b=H4sIAOxAPGcC/33PSw6CMBCA4auQrq1h+gDqynsYF4W2MgupabXBE
 O5uIS6IiSz/SeabzESiDWgjORUTCTZhRD/kEIeCdL0ebpaiyU1YyQRA2VBtUi0BqH4Z9BQH56k
 L+m6pFBUIY0TrZE3y+iNYh+NKX665e4xPH97rpQTL9IsC/48moECFannVtEpJLc96xHjs/J0sZ
 mJbR+44LDudFrXi1nGt4MfhW2fnycSzw8EaoxSHRlYbZ57nD8CIjXtPAQAA
X-Change-ID: 20241108-adv7511-audio-info-frame-54614dd4bf57
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|PAWPR02MB9054:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f5950d8-dc67-41ab-e8b0-08dd086d71ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a01IdkpvYTBsWW50R1dabzg3M0NmVTN1M2s3c29EbG9JOHpZRnFBU1pydnVH?=
 =?utf-8?B?QkFySU5xV2U5UEYwNEl1bU9YZTBrOXBFYmRaVmIzWmNPNlFBNjllNnFTRGli?=
 =?utf-8?B?NkExcTlJT2s0SGlRMnRwQkxUdzNGQTRiWjMxcm9DaU0zWE9YOHl3Mm9GWWJk?=
 =?utf-8?B?NW0rcWRCQXFwenYrWFJ0bWdHWXFoMzc3bnNFTmtwTXNqY1Z0RHl5NWJ4RW1V?=
 =?utf-8?B?Mm5JclEwYUF2S1JGSjBQb2JGS1BaeHdYRzhWUnFFOXZSTG9CdG4wNU1nak5a?=
 =?utf-8?B?OTZySUFyMTB5WWdteTFlbnB5N3lBaVF5d2FFUHVLOThHSzFCaWM5Y0RaODV4?=
 =?utf-8?B?Q3Urc0xKNlBqdFN6Q2owRFZKV09XYktsTEtLWFBMdFdMNXFWK2pxbVMwdStv?=
 =?utf-8?B?Q00rRVBGZzRqU29pWEx6SXc1M29CK2R5ZkorZ0RrT25sSEhKUmw5UWo1MTIr?=
 =?utf-8?B?QmVyckhnbGE4UlV0aTVGS1VmeTVkbFhjT3VmUFM4UWpTaEFhSWw1Ym5GQzA2?=
 =?utf-8?B?T2QybmYzQ0R6bjhCZnV1ME5wTzZqSWV0VG5EZlV6SGNhR2V2UDFUTm5kdmFu?=
 =?utf-8?B?cldVeHNWMVJFdnRTZHVPKzc4VGRWYldtRmZFMmtucGFERWNPNXpDekdQN0J4?=
 =?utf-8?B?VTFaMGZIczZKOEhvVk9hVGlpbVRZdzRHVlVMTGJ0T3VlK3RMOHBVZTB4cnR4?=
 =?utf-8?B?eVA1emhJMTBPMHZzZmZMV1R3VkFBQ1JxcmI3K3lrTzVHNldNVnJUYWw5YkU1?=
 =?utf-8?B?Sjd4VytSWDRIeXUvZFhXamJRVHRiQ2x0eTdWcXFmd0dXQjZFMzdydmRtbzI0?=
 =?utf-8?B?aFVNSjFSbFNRbkYvTEIvR0pTVFltOHhjd2ZNVTFsdlB0MG9JOFl4elY5c3lL?=
 =?utf-8?B?ZGRNM3RDY1hDUHdsT2ZDNXNjUkNWQkIvVHVBUmZEMlpQSHNIV2lmMXh2VEVR?=
 =?utf-8?B?V2ZnMHdFTUxsSHc0UHNvK29IdjdFTncxNnA0a0M3Z0REYStVTS9rRWp2OUt5?=
 =?utf-8?B?eVIxbmZKS3RuNEhjL1Y4cS9BQWJoTk91cFB0VFEzbjZRMDM4SHNZNGlvZEFt?=
 =?utf-8?B?cVNzL29YYXhHbnBOdUFmOEkrTDhSVTVRMXdIbUxkK0dpQURkaElBWVh4bWZ6?=
 =?utf-8?B?ZFlQZ1c2V1lKTngvcjg5TFUza2NudUxJUzkvc1ZxaWhveU9OTVAxNHYxaUxr?=
 =?utf-8?B?TkxQZTRGalBqTjJ4Vjl3MjVscHdjS1BsSkltTkNya1FkbXhFc2JFVTJXT3cv?=
 =?utf-8?B?eG5xSWRtRHJoTjFrNVZ2aU8wdUlSdkw3NjRrM1FqRFdYaU56S0VIQ2NVLzlJ?=
 =?utf-8?B?TXY2R2drTVIxdm1oMExJRDkwRmdKTXdCUGl0bjVrNXM1TnIyTXdXaWV3QTVl?=
 =?utf-8?B?MDBYWENkODcwNy9KQXorUndyMDA1b0Z3ejRPVUJTNEU2SVBVUG1rYmQzdHQ5?=
 =?utf-8?B?Skdkbi9LZiswb0hFR3VkVXZxZ2xNaitMNzdDRFZQOVZTT1NnR1piNlpWekpG?=
 =?utf-8?B?Z2w3MmxHSkxRUFdDNHVIa1VEdm9ONG1yWXFFSWhScVV6eFlsZGYydllmYlNs?=
 =?utf-8?B?TndOYS9CajFrbFFTWWRRbWUxY2xOenVFYlFxRnR6blc3eVFweDYraHdzcm1q?=
 =?utf-8?B?WnRyRkZ3TmZ6aEF2Sy9tSmRhSFJmdWVJNzU2WHBwQkVscWRaYlp2Ym54aGlS?=
 =?utf-8?B?bXZaNS9IbmZ4cDlXLzh5L1VPTFFZUU9iaEIycEc2R1JKWTF1bjhzbUd4MGpa?=
 =?utf-8?B?UlNINjdzU0JjTHlkQ1Vyb2hMaVZJNkdyTUl2QXBOcVV2MDhBZDhBMW5zRE16?=
 =?utf-8?B?RDI2Zi8ySHhRaFVjbDV2WmwrSllIdVNqMU05T3JNMzYxMlBENXBKRTRqcnpp?=
 =?utf-8?B?dkkvQU15aE5EL2JuNVQxamRlUG1OWnROdlp3QkV1SHJkMSs3d2FmSjVGdVVL?=
 =?utf-8?Q?rcFFJDRQYDU=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 07:40:30.7689 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5950d8-dc67-41ab-e8b0-08dd086d71ad
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9054
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

Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
Fixes: 53c515befe28 ("drm/bridge: adv7511: Add Audio support")
Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>
---
Changes in v4:
- Add Tested-by tag
- Link to v3: https://lore.kernel.org/r/20241118-adv7511-audio-info-frame-v3-1-31edd9931856@axis.com

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

