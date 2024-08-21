Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B9B95A61E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 22:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612D210E677;
	Wed, 21 Aug 2024 20:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="q8YE2e1P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11010014.outbound.protection.outlook.com [52.101.128.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EAB10E075
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 09:22:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uyu/MWnHWRDjDMFc8J6n6RG07WHNG0HJTgK69TB3+hJIyIjvM3vkFzUuISbf7woKB2oX9j6TNIll88cpoT76vFQzdE6O1vgHESVgzAkCicXm6nizUFr95cdQSeu3n7cIAxzW1l3lAEhKoXVCnNmlUedrAVoHvQHlgOmKDhmrVfPEU42i2uDo7ZVZAa5phcyMxFPJT/dIP4ca12BSCOswLvWko1v4GN6HEst27bTQADZWiDhGcm5Qh4ZgeHMSPtRd5BJvfVIiSNaQM/Ml++609xpd4jg1kbhEBsFk9PZocfThvVRWBZ01MBi7hDBjUb/Watt6qT1lsrpNFeQ+bkoTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0g4669BmyGqyqgQa9ScTbOpLKeqiXpRs3AqWa3oVtIk=;
 b=iyJtvvaFMAQB0j6xSeF8rcm094BZRQq7WWogWKauYAoj5GWp5ADOC+muW2Ynxx4Fp1PH7Rt/f0r6ue42dZAOlzaj+M2CIZbPX74WAo7nceJ0hjgnKNZ+rO5b5yJLCiacTdSO7lduM5SHdaXHCjOk1rfPxNTvmSvkeT86T7Cxpg5I/rEcwIAnzaS3omb4HKOw44Ye457HRBsyoC3YaQarhWwKyfc0rIJsOS4h8h3O/70B3vQjWyJVWsTRqtXWpplqd+/s6maHhppzo7VPKPqPIQqGQAQHAnaljEa01R9zC/f9kKp+/+AnnYulEZU9/jEjH5SnrAmlvJEkOOOn62yDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0g4669BmyGqyqgQa9ScTbOpLKeqiXpRs3AqWa3oVtIk=;
 b=q8YE2e1PtSlM1BrJDHCe0sRWNjNx3KPjwL2ccVxzyVAd5tQBgV75CDjkRVNwvTHRVrl+hOrTaGAr0jqGt9TMUgCUshwopPVuHcD9xK3ZrLumKyWFvTQ9h8eeLYpnP1lpvi5hX/j36NHOAWjKZ/HN4HuyQhbgGwoPRlZ0h1nNx64i0eLBzwY1/R2eIjZEuNGsnDaycwX41kM7+zZQxdZxo376FAlkv7bbjI49v3VAfGKvbTiM8KfNvlRzhkTWbVQec0rCs50hQzwwTJ3m1ZHDvWMQyms8lKRy2Jp4IZA6nPXnAh3jgFdbkxkdLY32/RDZ6+YSuz0hSRbT+6ymJTAXtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB5487.apcprd06.prod.outlook.com
 (2603:1096:820:bf::14) by JH0PR06MB6414.apcprd06.prod.outlook.com
 (2603:1096:990:10::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22; Wed, 21 Aug
 2024 09:22:01 +0000
Received: from KL1PR0601MB5487.apcprd06.prod.outlook.com
 ([fe80::2129:59e5:6c67:311f]) by KL1PR0601MB5487.apcprd06.prod.outlook.com
 ([fe80::2129:59e5:6c67:311f%7]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 09:22:01 +0000
From: Chen Yufan <chenyufan@vivo.com>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Chen Yufan <chenyufan@vivo.com>
Subject: [PATCH v1] ImgTec powerVR DRM driver: Convert to use time_before macro
Date: Wed, 21 Aug 2024 17:21:21 +0800
Message-Id: <20240821092121.16447-1-chenyufan@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0132.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::11) To KL1PR0601MB5487.apcprd06.prod.outlook.com
 (2603:1096:820:bf::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB5487:EE_|JH0PR06MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: 0adb52e8-c066-4322-4f9f-08dcc1c2b6a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YKcdsYyRjiRYVjemlvUxyHpCugiKJmXa3hLBBdq2hxeJx2BFGfTlxXY1FyUF?=
 =?us-ascii?Q?Rro+xXXqOzW5CDJZ8u1B7tWep/OtThm5vv+8KFafi9bozBn+DszZClcyYug+?=
 =?us-ascii?Q?qO9uuVxtq63Usy0B6JoiLXIwxKD1CpwoZxTE/kOWvm5+TS9kTK6fI2fpzqj/?=
 =?us-ascii?Q?IaIxMeBZ3W+EDwaytEIAgBXk7KOXI5pMhsSGR6m5diC2UiJ3EBKn+7WGrzyK?=
 =?us-ascii?Q?E5jxMA9csjXgnmz1GTKR+nP0gl7AzF7U9VYKiom+yv5CXG1QlM3vdbfj3EZ8?=
 =?us-ascii?Q?h1uT6KMCrBKRqyBiqKYaOCfa0F6Fo8IpiBF5xh0R/iizItwYuO4UhZrjdfjN?=
 =?us-ascii?Q?TfSf4ehBOfzy/j2/7krwnX7uaFmHFn2gbMsUD/YlRTTHZNf/vnk/YWZE/0p2?=
 =?us-ascii?Q?gY0qR5Qur08rmmDokzolmkg1J5UaBxB/EUY8d6ooiw7RWk6eOccC/fVsGM4z?=
 =?us-ascii?Q?DRprSiFyYWH79fHYp8RSuI5N2s10LI4pSnYG8maWeiEhOW92exRwCOYqR0B/?=
 =?us-ascii?Q?/FqeyBxrJ5piDG0otedqEA+rYRRbPuKXfinFdMPoo68W+kGjPNZ1OpP1nR03?=
 =?us-ascii?Q?f7WkgQOs/tOCvTZJSfruuJkcYzop4dEoTXrr0R7U7tmJQXEzXGMC7Bz+54j4?=
 =?us-ascii?Q?F+mH08Y4jZbPcya9ue+9kqVPOyW+eFI5Cclowg3oUw3UVbQk3FZDtDWoBKxj?=
 =?us-ascii?Q?C/ZmLe8rb9rBaN1nyg1hB8Jy4o8AB69IGQ5eaAVLcSnIGFb8NzZXotqo1fs2?=
 =?us-ascii?Q?c9I0uw9Asjtci3WGSBO2oMaHw9w7HvLTjjUkEca/PI9q5UyYXOvfVMP6Tu44?=
 =?us-ascii?Q?IQP5tOtf3XFIs/Ti34OceDZD4QspuSk5bEtcRaY+ipOlWikWfYBNtRZc0QH3?=
 =?us-ascii?Q?TnrMwTzsx69NTwvhaiaM3GxZxpYE3Y87BvotLlOzitSfs+kUx2ubH44vafkT?=
 =?us-ascii?Q?5SL58sgaph58+Svyz9IiAuuAwcEmbz4FkXStQFC1iS0/AOmXK/lrw08jjVsR?=
 =?us-ascii?Q?UeiMgNlvIz9IH676l8k5tg2vwueKz+zaUqZPNDd2FRHeIoX6X5P3mcNVRgr3?=
 =?us-ascii?Q?3P+7zmV5renPEMk7ctoyMGpC2dKZYP50VG6gqUh8uPULMLOaJhMGGol9kSMd?=
 =?us-ascii?Q?OchJSfsByhTmcmMn4nkXBSNjes9Eeh1FJbHx/Ay9O4XzmszIQc3HtEhI+vi6?=
 =?us-ascii?Q?5vCY0Ty1xX2GFe+lXsFNPjefmD+JDt0OPNHpnRWByIrEjejhWrq3KP8bxiix?=
 =?us-ascii?Q?ZXiVvLYL00ReuzW5iow6NNd8iJbN3cN9StN1FFMJG8oRo+/9/PCHZvJGY/9Q?=
 =?us-ascii?Q?wtMg3WVqO1HnATw/n7bgoiKSaOo//cItXZQOEqpqGuXs83oY9glQNxrkLLoJ?=
 =?us-ascii?Q?mCaYxHWD4oerxO3ukR6YHrbHqoD7HxaSc0ge69Zdssc3cq9QsA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB5487.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Zumcvm6hzvci91NN0Hp8jTF37RhwCjOyKTSi8l4wRNp/Z9PnLAxaeNSulD+?=
 =?us-ascii?Q?vIMC1cFljctHgKFc2esjTqqHBgPouoDHAwAcley1MW+W3H2mDe8GVck5Ww8o?=
 =?us-ascii?Q?FwNFPVl875LIC2ksgy01rzaVSVjopANW59vy5cxGPn4c0q/26Eot7c7q85gj?=
 =?us-ascii?Q?mHEH0ue5V0ex4a3QyqrlGn8nsYm6EzYHUoxlU4uYEvvvCSiqu9Fz9ZFOI4Kc?=
 =?us-ascii?Q?q0qOELF8YTUEjISAPgt86qnymnS9fjCti5AIkQ8ZN3D1oBMlKwgIf5Qx340x?=
 =?us-ascii?Q?z/JcgXAA4owLiB9lY2IwAYdVq32XPAHS3l+t4PM7g0bLP5Ft8IVO0Mv1Pr9l?=
 =?us-ascii?Q?i8l3O3VrH2fZC5TTzrbdR3vwVOmQlKkISu2AQ9M4Ot6Qt3zjkkvKASOmB0Nz?=
 =?us-ascii?Q?bwdszC8eQgfd9GMdu2dWOppE0GGIRNXMnnPgUFzDDlp/Cfild2+2ecJFeQT/?=
 =?us-ascii?Q?+N9d6I8ID48hDIlerVW6jCtKZ/TnNxIdsYwcV8NekJ3/eRYKfK0cpfEvaUOd?=
 =?us-ascii?Q?PZbcQOcjpEEraTFFkzon9ESYK9WmE/ynPhdI/yKvQ0nEg3icggIK65MemLnc?=
 =?us-ascii?Q?z5Lxv9ChYrao1aQRc6XVbb3Xqbd7XLDFL9eWYpRpMl3QVywfDwVvI8EHsxsz?=
 =?us-ascii?Q?CrD3cRjJvdYNeZPaN/daBBlUUv33P+qa3RL6RMLpRr1iFE/wSRZY1UAj8/rQ?=
 =?us-ascii?Q?J3YBOrUESFNE3dftW0LE19TMDUXWf3T3KjcSF8fC2Q6KkFboy4QKUg7G5Foh?=
 =?us-ascii?Q?DSl5Nr9tGLH0nTLrmQq3kJpjy5u1mDWE6SlNxfwTybud2gvnrEzVcG/7G2Gp?=
 =?us-ascii?Q?9T/QI681vinYl9OHUyfPqYLGf/aArvT017et8XfbIDzLOlFGXsAKvzPMCFcU?=
 =?us-ascii?Q?4Wn1yWPDYuOpNoVr7my4AU3yxQnTiVBcbLj/MYO+yUi+Rj0StFBo6qUHNs56?=
 =?us-ascii?Q?9QQqt9UVFLvvmZ3WbLsyGBh2S1hHcDKMx96FWixlpFRC4wMRRM0BuMCfZt8G?=
 =?us-ascii?Q?P6UWxID1hPhE18QVSLaJideHyroRrAWZrX/2w+TZpMaHTRulNDrxcyJNw4Pz?=
 =?us-ascii?Q?jIXmkpprz09+ZIsNyREAWeyAxqojovm1pz2RBAL07mylDpDnFy1rDpIWOPC/?=
 =?us-ascii?Q?kBhUnWghlXLhrBZm39hAbZ6EFoGgHZvI7P7n0Wl7hY51dGYdlNGeibcJeXWw?=
 =?us-ascii?Q?xZpZH2FNlI4RBG48/Qi23CXWjTo37+WE8y7lySgwaZoODlXBQfvNyQ847KH7?=
 =?us-ascii?Q?uaCn5aX429DI5igBAnb/Ozp5NHnBcIjFQcPNmtbneEekEAQt+gV7SijaYgk1?=
 =?us-ascii?Q?X0ycXhne+V7C0NS0UoWVwX5AIup6Po3gDIitQbpVORexpvGmfDzrK6KT5B2c?=
 =?us-ascii?Q?2TASm9E6nGWV9ERDUV9WMtpFPSPsaAFmcKakz7V4j6x3bvrXttRw/zy8eYQk?=
 =?us-ascii?Q?ofKZ6m0m9o749XVeAQqaChBFYSIPYV7ou+ZMfw4AjhY2a4FBGbEZM9nJXV/p?=
 =?us-ascii?Q?cpW6OOagexH6jxQ0A9k9w3o11vGkG4zkWvUbEvkoBpqgNhs0KxMeOC0blFP7?=
 =?us-ascii?Q?ZEX4Jqt3XwkqYIeTSiLgFzM4zdzfkjZjsiu5wofk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0adb52e8-c066-4322-4f9f-08dcc1c2b6a1
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5487.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:22:01.4251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCXaSgRjadqy6t0kGEJzvEabD7+0XS4pL0w15hRkGwdvt3DXmzqPrI4TomMzWKJkEIFA7ys7Y+Yy+UhsNDFtMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6414
X-Mailman-Approved-At: Wed, 21 Aug 2024 20:51:19 +0000
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

Use time_before instead of direct subtraction for readability.

Signed-off-by: Chen Yufan <chenyufan@vivo.com>
---
 drivers/gpu/drm/imagination/pvr_ccb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imagination/pvr_ccb.c
index 4deeac7ed..b7d5f9ca3 100644
--- a/drivers/gpu/drm/imagination/pvr_ccb.c
+++ b/drivers/gpu/drm/imagination/pvr_ccb.c
@@ -321,7 +321,7 @@ static int pvr_kccb_reserve_slot_sync(struct pvr_device *pvr_dev)
 	bool reserved = false;
 	u32 retries = 0;
 
-	while ((jiffies - start_timestamp) < (u32)RESERVE_SLOT_TIMEOUT ||
+	while (time_before(jiffies, start_timestamp + (u32)RESERVE_SLOT_TIMEOUT) ||
 	       retries < RESERVE_SLOT_MIN_RETRIES) {
 		reserved = pvr_kccb_try_reserve_slot(pvr_dev);
 		if (reserved)
-- 
2.39.0

