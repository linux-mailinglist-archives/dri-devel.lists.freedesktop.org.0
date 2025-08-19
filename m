Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B83B2B825
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 05:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B2910E0DD;
	Tue, 19 Aug 2025 03:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="eNf7p+j9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012068.outbound.protection.outlook.com [52.101.126.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986B310E0DD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:58:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDwK5DzQ8gdS3MB90DZejVZyJZcDfJFi67e0GsBXwQW+LFHD950GHrbsDbXNhsVs6x6KaTD8K+VrPDwo6arhgYXXajwZfNsnHB2lWKjdOVnQTiIMoq/7kZ4wDNMvSs1ck3PgfTaOxTxmb7KopPrE120lKnYAilXEsjaKWoFir5be1W3z2Rwz+6FTHLh72tQtOa/NMGfryvTSfes7eXKK0nVr1HggBptKhBuLE+Gxbq4z/Wi0rt0G9DHV0UB9iohXjOs/sNxXkx/equQrMQQwCpjvHa2J3AG3gQjm4ankRiKHDMLDCtRLpLPHpDKF8++ji63Q+2PIMlZAffxnGyNjzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3B1Pqz6OJpzk9kHY+qUdvdQHUI+6kyzZeUOFQd0Xiw=;
 b=pbjPI2Fy7vcVwjBVsqBvF8nFFFXojJqs2KmLa7UZDTi9S7gWr2YXCYA821umRbyLWmvzBIxa7R+eguKaChJb6b946tNL9bANoJgHTb9pt45+FPI3seihCRMNYTx13i3luCT9MRxhMrLdM28dLrCqlEFQQha7U3dH6hKqJo78IS1BN5hXAAb22rYLSHo8xuPac797GXaty8SazjSQ7qW1/Ue92f83aWK2E+Cke6WxVmyGuRJ0JRoFbEQ1HGMV6E2BdPa8PurJam/WBa8HDYw8HMmV/ILweN0L/hVjGas1bB8N9izt3wSc3rzwjbwLGQye5fAXMAGUq4934VrlOEcVZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3B1Pqz6OJpzk9kHY+qUdvdQHUI+6kyzZeUOFQd0Xiw=;
 b=eNf7p+j9XFJeQxunNus0joT0BiPxA691Cu5IkdopUL21lEVtbSt50ksiAI2Pr+MxH85hx8kQK4g36mvgjdCYXHCZA7N4p7kPA/t2azbGq4rIZf4yyrCBVDqstfapSrmF4xdpJ2Uvo8q5OQ4sWjgg0cjaWuIL9y8boWyvO5Rb7boK0+sXYe3kITvbeWugGJlIKvjJC8IsiZbg/ZhqZJzcbwjYYSOj1KSC5NVWW4puBpGRGuKEMY+V5ykNZww5ImOZW0mXwBAm0NA8nxwBPVr/NGDJIGpeVmmyd5PlQPbqZWmFNyjtD7MPfkV/+B3hOBFxmGno1+HBrzOvogBnv6Shew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB5972.apcprd06.prod.outlook.com (2603:1096:820:d6::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.24; Tue, 19 Aug 2025 03:58:15 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 03:58:15 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH] backlight: led_bl: Use devm_kcalloc() for array space
 allocation
Date: Tue, 19 Aug 2025 11:58:03 +0800
Message-Id: <20250819035804.433615-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0251.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::20) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 684668c2-c8b5-418b-cec2-08ddded49fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8jJaPIUps1IwpmLVahFmCs/jcQtEL8/ZykJ9XvyxNTP+a7QVQUGblv04B6ZC?=
 =?us-ascii?Q?9UP/Nx75AoDpR/W/g9z6LF+HbcDPD9ooHDLGsiwt+s7FbN6flx1z1K3fa7z9?=
 =?us-ascii?Q?RYnX5VvIw3QxT0nF8BiOVu5fB4R3+SDRD9sn6C6YTBp/B4Vw2zFyY5GnLy/c?=
 =?us-ascii?Q?KTLdt+Y0o46kCbXHXuIXy2UT6vHhlqD7MaoUVS68VHvBTO5dGXKjZiXdjWKj?=
 =?us-ascii?Q?iA21/LM9wV1jglR0aZrhccJHzFOVC+e1CNJfGxd9f6y/5ZtpiUFAoLvPff64?=
 =?us-ascii?Q?KjIGdUgDYpxUZpKOSEps1d9yvTRFygf/7qJnjYUzTFr0F4hpLzvEgoDxXZY5?=
 =?us-ascii?Q?jSUVeW80S+kN2UeAycczXBEHJFvXbEcFFvXEYtobo7LZuPHHrzOkFkRpnHgd?=
 =?us-ascii?Q?oimukDgR32NMkuO8P7RrK0E4BxJHSupq+AKERswNuhOhz5wtScdnC3XZrrKo?=
 =?us-ascii?Q?MWK2SYY6feeyv6CgjlTHD6FzOc/zfYYfnkIB0myUe8nb0aLgRxdSz1y5lFiE?=
 =?us-ascii?Q?ZY6vYs+VzkapN6OlROjiQ25y5TZgGHD2ejWZwo8ANzYIol2NmyDIbc90tkmN?=
 =?us-ascii?Q?IK+zzyfe2QP1M7UUIvvrlhI//xaICnBw+N4xvNaV3hcWFOCenRJcPC8lLb3k?=
 =?us-ascii?Q?XjrEyJlgohqyavIJl5OuiysjGzFyXuBVcccau+TWmniYGCszEMirE7KWahVW?=
 =?us-ascii?Q?ow28grRK5dAsf9h4S98TBXwkaxwsZPXxRPpB7amVAF7oJ0xU/a43+c87nU6V?=
 =?us-ascii?Q?KdNvuXzyFMfovcmHKiRJ7s7jZByAUjq/Nh6rwcM7NV4KDKQSsjuvvqq/GGxj?=
 =?us-ascii?Q?b3ipVqtjN1w4Z43CuBvKZ/NGxB8JOpTAop4Yay1OuZmnh3/0UqDc+Jdldkvz?=
 =?us-ascii?Q?s/n9cXEn6alviEEniM95fIu6r5rLHlLb5jW6bCKb08YUUrJOz6EummVwX/oV?=
 =?us-ascii?Q?4n/jO9QJZnmO/KHFLrjg2JRx/pf34K2cHR+IExNyf90VI5CC8afCLaI6pv65?=
 =?us-ascii?Q?7ADuQsw49x/wHoNXgjYRRk1c+s/3guASCl0EtS7ChnV8dwxcUjmfv34BHidH?=
 =?us-ascii?Q?6BeMpOOB7P8yHeKyPrC0hpuieJdhTYedrlqcYkLwCNm8dqzq7o9soMvI+N1a?=
 =?us-ascii?Q?GMNLFgzodZ31PgHPHy0gMl98+w5Vj+2W6UeIvUG+A9SrFfDCpjP+RJ7KHSeH?=
 =?us-ascii?Q?sV06wn5Q14OBVhW7d/zrZoYbHwh1QUX4PgfADmIwFEPnq3z9uAHK2rd4JMkp?=
 =?us-ascii?Q?/JRuJEargGSOhin3DsowNAOxp29DIQVbE980DF5tykEblHe+WzKwkAeBL0mn?=
 =?us-ascii?Q?ACiNk7hs0ydPj6gYqY/qxA95xVHtkqwhQM9JQA5p7hQkZpzXg+flA5QMikek?=
 =?us-ascii?Q?OscjqtdxCaN3evLJzkQnyTquUopqtpHhGRCs7chCuaVeXj51/qh+MtwTRaJs?=
 =?us-ascii?Q?CzmfVZwuo5oam270HaenkoUWR+AbEVojA4a0FdYJUdhWpglQ7ELvHw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lj+nBZ97oXTm0BBcnOSRkbk95023HyLTP40xeBOLuo97scUrN94xSPc8mx23?=
 =?us-ascii?Q?H5fFZlwOTgiZA+PXzE6NM9QZfN5WeN6GHPqR4I/k7jF1lbff7Eviut6kauMb?=
 =?us-ascii?Q?htlhWWbYM/l3Y8mGbxVLMvC8MOyH9VB9crXJ3IbAenRc3szqVagAzKLnB5sO?=
 =?us-ascii?Q?Z+w/3f+q/U1z1UTNMHFvcgia35qaCbWiQQ+O4F6egDvTdWd8CtQsF+O/Va0J?=
 =?us-ascii?Q?SNBmu++wTTM4+vHLQBY5LNei1PXUg/ZiQnmf8a3dYFgo+LaRF7Y+SJnbw6/e?=
 =?us-ascii?Q?Fv6isPMQtE0BRTn+E5ALGvqNaZG6cQ+OlEyadY92w+kgHc6DXME6BYeZZtWK?=
 =?us-ascii?Q?cTiC9d95O4giDJem9KkgcTyl8DAOpTP/a3BLcIfIpzy902+GpJmaGTZN8K+1?=
 =?us-ascii?Q?tU0i46N3cfDwN8dPQzOYuMvCJioQt43Igkj05zsaYpyfuczEfl374CL2Lqxe?=
 =?us-ascii?Q?TQelXtfMTWOR7U7QALGvQ+1puLQPSK0XgYvKBiCteRVPyckjvjtFI6ZHTJ7h?=
 =?us-ascii?Q?kyc6oKYgAWCfTAFTrP8A6VxndDfNgCWtXNJ5Vj2YewcAR7b668om/4sZ0BKZ?=
 =?us-ascii?Q?LQIZy9UYsEnA0Z8S36Xv06Ek+PxU7xUS1nClNsQE6fi4SqoxLYyafAPDs+fo?=
 =?us-ascii?Q?2Bq8jo1wz8eYCaRXBilpNmixLW8FgbTwQGS3v/OUdi9KTBXeqr/URt6p3+0H?=
 =?us-ascii?Q?T0s77MRI1xm0K2ZnssQ0XaNWomkaXC5s0WoWM+nZMdkDhJj8AvyYbOgJIxjr?=
 =?us-ascii?Q?7yLFyiYsOXc/tiL8h/WklM0PQLH9xDDpozY+VsVs9+XdjUghO75QeNUMZF7s?=
 =?us-ascii?Q?/26ldXGOBjwGoQG0cliulxL/3CofzFtwLwP1Nh2jv/s+c0NXR9A2o3/vBlie?=
 =?us-ascii?Q?76qwoMd1W2joxnCr3JpmQTFPD1M67cFsGvtxoJb+XlKmbAPyK+HBQDTopP7x?=
 =?us-ascii?Q?MGcZN/6e5/llby8jhl8uGbOZg3TeNE2kgmEMcnktTB/vbZUusIr47z+eKDsW?=
 =?us-ascii?Q?1UrQCG5SJnZeaMBA08s9QZxkVUSGGRQP98msM3FzXzIaCUIOwmBN6tcvT9ye?=
 =?us-ascii?Q?6kzAz4raGU4yPPd4+YYTGjYyjTdMKn5OKumIAshrb4GYCk8fDN1+YcX+087I?=
 =?us-ascii?Q?eIretjfe4c+1OBheiZwWsK7Mrom2Y9mJ538og5HBpzCuLmAGCcV2Ln/nMMzW?=
 =?us-ascii?Q?MeqWqZlhMlcNKiDO3AtGwAj7Np7jBtMGsbsxg6n5S7BKtMuJpIppG8AHaitk?=
 =?us-ascii?Q?V4pj2IAp4/DxWANv+nOsRB2FaB0iRx11luYZfFZ7ezjdES3ODYJwMTg1Nzzh?=
 =?us-ascii?Q?iWbjXAxJGmsyISAG6rDQT5YY/yFuhJr63DGgwXgIPUDhp+tGgEjLkTs18cdp?=
 =?us-ascii?Q?GxoAEaj+xJiK5Dxh1o0REZshXKEMGFJGRI1ml6Ctx9K6eALuWyPHthzwiih4?=
 =?us-ascii?Q?rcOJYzn2fSM0cewpq+X2XZ6Y24eZZ43ISOaq241DswkaruYHA8sitEdVtNgp?=
 =?us-ascii?Q?eFFcl50V+e2wuLJvdf//fwo318uNXUeIMDWpO0oGZr28SD7VZCoWA/fBaysl?=
 =?us-ascii?Q?O4f0SkT/3fmLcQFCdqvNHZ/yKwxxgClXqTcCxk7e?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 684668c2-c8b5-418b-cec2-08ddded49fc6
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 03:58:15.3843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6uHVuQ5EH6rC/1qbCqKRohlDk1TApAt4Rk/fnzbcm/6idFtNLASR5LcigajWbnkKcWWVzMySgmDgI52adorIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5972
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

Replace calls of devm_kzalloc() with devm_kcalloc() in led_bl_get_leds()
and led_bl_parse_levels() for safer memory allocation with built-in
overflow protection.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/video/backlight/led_bl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index d2db157b2c29..dd03d91a6e50 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -89,7 +89,7 @@ static int led_bl_get_leds(struct device *dev,
 		return -EINVAL;
 	}
 
-	leds = devm_kzalloc(dev, sizeof(struct led_classdev *) * nb_leds,
+	leds = devm_kcalloc(dev, nb_leds, sizeof(struct led_classdev *),
 			    GFP_KERNEL);
 	if (!leds)
 		return -ENOMEM;
@@ -137,7 +137,7 @@ static int led_bl_parse_levels(struct device *dev,
 		unsigned int db;
 		u32 *levels = NULL;
 
-		levels = devm_kzalloc(dev, sizeof(u32) * num_levels,
+		levels = devm_kcalloc(dev, num_levels, sizeof(u32),
 				      GFP_KERNEL);
 		if (!levels)
 			return -ENOMEM;
-- 
2.34.1

