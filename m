Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA49B2DD74
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 15:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB9810E744;
	Wed, 20 Aug 2025 13:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="LUVVTkNq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013031.outbound.protection.outlook.com
 [40.107.44.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E8110E74C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 13:14:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTSmFV2TglVHpL9O0k3BLce2eY6JuoUn/LThmhEDu+Jvh26zfitFKm3C5w2uRbnMxl8c8SQYHwE3SYRMyiQDiWSENU+Cl+++ymf/UwrDve2tmYfMd6cy+dr5ekG+tS2/lRSFjCZ1Xja4pLkIhyNmYkP3LMWarjR77lGFncrFWWDMzRoqVAJtvqQZxtF0Zr4EbxU8TL07YDufOdtVWghaxQkzbxqUkLswfXVXxJ0ZMAsVkzR2rP53KOfMuv4TlGp0WmV5YvpPqScKpvFxu5/CUQEkggDV2XjSjTrd6+o4BVSD3T9L7tONqupmaGXFiuMNslt9V4ZL6ktODrujf9EoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RVHUY+yZzGngLiWbzCKP7p6OGNzpC08RKZiuBW6JUE=;
 b=p1QM6obRZ5WX/z6R3cCXNKrvrXa6O2e+Z/Mza0O6IFOXHLgaQe22BpJWS4uviFiAvk2nHTQgkpWEyS+rpkys1rVDZpKSrQxnWnelNguxWNyYxE306BX10T7Eg1Va8KVSCjCWDDXciBxFl1EDyIBDo4I6CRjpE177l+O0AzOAqieej3gdVMKdVBZ7dcde9TrCaRKDbFU67/CFM08CNTtsiCyyEeuV5riSowvwBT6X+eDE0BnnjNBTeuowGx+fMIpFHeqLufp+oAabELfYzl8VEu69AyTp0NkussvzQk5kSrPFbibXGrqrYgpH9eShRlGgEtVD1U4Pr0DRpm6H/L+1zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RVHUY+yZzGngLiWbzCKP7p6OGNzpC08RKZiuBW6JUE=;
 b=LUVVTkNqZPirWiIFzF/rqvQuLTIUBtBpOnXLMXcVQ453xVxvX3bpwBRndaiBi+Akvb+SEmQyMr4bLUehSs0rJy3f8gP/svZP231bZGJUJPRN3wQtZMDb2QSfMC/6JYvcgsl8MQMFTIHa/4+aC+PxTPIveAxfSjXuRM/J7oVYtxDIVO59LTB0XV5Medvsw/zde+W24ynzYGRuuBj/3bTYNSY5iwm38KpbwFEOPPlz32EIyu6wIUNW4Chku22KEZNJWqw4YN1BA4t5Zyiiei/L+t6HEmmUO5DEDj6N2f84QoUjPqTe6Z4l9pZGukTwX7+Fkd4Af/qoxdbwSGBF/m8bJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB5994.apcprd06.prod.outlook.com (2603:1096:820:d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 13:14:27 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 13:14:27 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] drm/ssd130x: Remove the use of dev_err_probe()
Date: Wed, 20 Aug 2025 21:14:15 +0800
Message-Id: <20250820131416.500048-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0250.apcprd06.prod.outlook.com
 (2603:1096:4:ac::34) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d49239a-e4ba-4d66-0c79-08dddfeb7d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xpkUiZyaDOAzxRbNoKmL9U013+XZtZTa0VdgizVcod75b0CXXhvM9wPpOOBN?=
 =?us-ascii?Q?Gw7s1LwHj4aRvY2Rz9gczloU6H5tNmzWX+GXSUZ0fTbhnXHYcpH9pZLU88dp?=
 =?us-ascii?Q?j+9oUD6IyC7T9QuFLJ9iPX6E0jNK1UzBGFTjEEA+plwKnb5Ee37J7Ia2kd2n?=
 =?us-ascii?Q?k+38l4bZbt4dvM9h6g6R/4sFXXCv3CkYifFyMcjtkneE++C3WNHQ9ajAcPKJ?=
 =?us-ascii?Q?lEesNmxpI6DZA3fi5H/vqwqukRVsfRrLEKZBkN6eZoTz7YeqsygSZichdUUp?=
 =?us-ascii?Q?/mng3TPrbXoKq5uqgxQsPHCPQVvTxdba2zRAkCauo95GjZzwkSbMqC043lQh?=
 =?us-ascii?Q?iu9KHqfgUJPMSoC/IXRzSN7KjsXK0kUBKaBVxXMg0UWYqWKk7BfyNHzcsG2i?=
 =?us-ascii?Q?ootTER+aJ9On1jDoH0JBMYZ5yjqOstKjQQiAQ+ZV9EBYueYmdPeJ6ujghxzb?=
 =?us-ascii?Q?1+a5uH4OQYVo+yjlY2wQKD+Bq8niLkslPKR64bAkCrpW90REcroOCwvdT/V9?=
 =?us-ascii?Q?ZTglAyrpKk4U70ZZVXrFkg6KfEA0fGtj3It8HI9MmVGWCB4MrrE8OqWxmHHH?=
 =?us-ascii?Q?9dueUMEsi19BHFDUDGDjAvRVvw6Hdw49wGPEaUXe3rlURK1kS7gEzb/QRxlQ?=
 =?us-ascii?Q?XCgi8xJunHdCea+NgXo17jsQcdTbllNWNeVvHoJ2OAzu6a/FxgcB1YP8bIlM?=
 =?us-ascii?Q?mXOVCVvsik0Suf3GZllH1B9hZjOs40rXRyBjSVfPviXg9GLWOxoujbwlnxPd?=
 =?us-ascii?Q?7XZFNXVgw2dwyEf1CETSMKUwlGAUiBy5+EFBVOLOvruR4K33q7P59x9yhUNH?=
 =?us-ascii?Q?nXD6gVHiIcAFKSJPPlgjc9uY2rCI7zqtZb5qKX+ShJ0Wi/V3W69LGyQZZBd+?=
 =?us-ascii?Q?jFH38IEaM9uo9bNdGWt12GHRpaBn+Bj+k6vCf6nC4g3zNM6TkxUWh0HDaOya?=
 =?us-ascii?Q?yZTtSJdF83wZx7CNNlD19RuvhlnJJyRqdCK3tt8zli1RdipNBNs18PComuKz?=
 =?us-ascii?Q?WWt2d2Q++/X2MWwfj+7UyZYCuoTZu6q0B3dFaYJm0MMNsFiHtZhNnxcBAH9j?=
 =?us-ascii?Q?lz4rWSSWi+o649xum1fByZR9crQTi9IQjbQe+DwJ57fvaoP0TRC+srMX14CZ?=
 =?us-ascii?Q?PxfQKOxYXZN6UF2LsisFi6q6jGKgdCWhjYASYb98Qv7SXoyAh2yshFcy+xgA?=
 =?us-ascii?Q?hIuCQ4HPTABC/AbKIWp/xQNc9oz9L6LS2nMWSolhBk4ThTF+BZwTBkPTorcQ?=
 =?us-ascii?Q?alaGWKkxzyxSC8h2NBvA8N9fj4N/yFr641eKNznsSpLshxjaKc4m1cW3ma4S?=
 =?us-ascii?Q?QdChNPEISEvf+KCLV3A83hGtAZOgQVrnhVC5+Fdhg+1+CwDU2m5+3t2qlwrI?=
 =?us-ascii?Q?x9aXUPDASKabaUDhZmNm+4l1sCDfoR+7JN7r6M2z+vO3GJ8XtV2zPHyv5lZj?=
 =?us-ascii?Q?tqOhgTsXtPXH92oZPp388iBEWJ0tljBGI3GqlQ8mF7oHdjpJjZR+2LJ3ZEJb?=
 =?us-ascii?Q?26M9gkST8yN+RGA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8EYfP+aZTh5M5gMSsS00QK7hQBXF/9B1tZezogy7vkUk8jwf6o3p5IvUG1cb?=
 =?us-ascii?Q?ZSKRsUBAiEepcGZrrcK8OQ4tj0zNjaYNwOSf5lHK9QDbs2g8BZtbVw9/vPIQ?=
 =?us-ascii?Q?74UYok05g9W1jJ7QjTZv3mI+C7uL4k4vfPTooAzgzE3pweYeacW1pfwXgQCK?=
 =?us-ascii?Q?ce0KI3DCWnrpfjaIp/2zwTEDzdYGSAsxu7OHS5yvtXDk7ljxj6x9lreGnKma?=
 =?us-ascii?Q?x94ZrhFnzF7YowkGmDueSuy0/IsHWgWVX8uwFc7FLeKZ90YJr/J0no3oIsvD?=
 =?us-ascii?Q?/SQUgdccG5bhswhJX98t/YyKgKkhS0WuZusWfI64jsusgTnqFmsDbXcHoFCy?=
 =?us-ascii?Q?Tb/cpGPIX9TayUTtPxkHHRlAMKFkov/qEP4dgYdMIkm3AMNn+6uXAmIVqfep?=
 =?us-ascii?Q?vG4BEP/zDmdI/r27Rt7IbJB+BTzjzIYzNxNxAVdbmK7DJPf00Nb4qJPiNibG?=
 =?us-ascii?Q?yLVGJZxYQGxxFwiRVpWCarms/xbI+ynXpDdvZcf2Il3zDAMJVp0+7q/yhT/H?=
 =?us-ascii?Q?qv7KzIiFTE0rZLBn0IdxyWYrifNNf9ay93zzGiBr5Dcw43qf8AzajTqyvb+k?=
 =?us-ascii?Q?gj0iwu6yasjYonTWuFIVY1Djh/qqVGnvJ8MS02Nl3hpTaeiKI8v5sZcUNsao?=
 =?us-ascii?Q?DB6eWM+BQUgggYo6nVkPoPctXnsulrjq9gvxd+8Z8+ky4yJFIN2xk/p5YTZ9?=
 =?us-ascii?Q?vMm88sc8SLvPCRyUOjnCLhILCuosfad3cwjA8LK8bU4TAAZ/w0Ly8E8bYqJp?=
 =?us-ascii?Q?QNM8NK7lfCIPKHDbUKsTdvAQAVApq8AVQTBiyiKVpHaEjfobqRDuhaekk7oa?=
 =?us-ascii?Q?P6oYuJbr2SoVITyrIrBOcL0S6zyIImJNlFyOlNyyymbNkTN4YrHYRYYLBBLU?=
 =?us-ascii?Q?lEnMEPYjUhWZZcr4wEzVWy0WvgM7KpHo76tV9g0ruPbXZpg8k5Dmnlhi/ZJj?=
 =?us-ascii?Q?JuNj+JGLuMckMipZUMlieh0ukLWanDGi3QE06mwKXEuexsSolR7bURWQ3YCe?=
 =?us-ascii?Q?kP2r+fCNbcboZWal7q2H2HhH4YIvBkD3XYB5D8Mf1bZdqVh/yoCrhbAtnAWq?=
 =?us-ascii?Q?a+l6oGq8x0hvkD0B/cuw9HVCIL5GEUtoQvas59c+iC3+rqWbUroi7BA0Gnoz?=
 =?us-ascii?Q?Us8wlvVooU4eq8PHrkGDUXDlifFW9fPNjsB9jptLqdxdGHI1JJbahJv43571?=
 =?us-ascii?Q?qHUkAIEI7CtFQURgky+DV2ehKFumx4DdZdzn+ZYBDU/6LvtlHsqb6z9DFtaF?=
 =?us-ascii?Q?Mmxk+oIKQDWoQU60HGKjWo+vF4Nhb8mHKGE+/n/y0w6CxBLp/fTFUmsYQnmT?=
 =?us-ascii?Q?hI+oLr1YUTG1hDurEi90MaS1UdKTRnjMFNvX4ZeFmst18RznR6ImIgLpiOx8?=
 =?us-ascii?Q?N1ZcvoF7/jla2xCHMNNbaWaAHXDQV492c630ity4AutS8rP1sj4t5Se5aZYy?=
 =?us-ascii?Q?0KEEyxvMTRcFQeYqI4JxtQE6dfhGsBMXpdvt5EniCnYjSK/9Ay9Nj74ynd3N?=
 =?us-ascii?Q?4oeH22yIRFZgw7CD8V7XhD2WslPVDvIegTEkoD5uxcCsxcUgHP/9wKmtMw73?=
 =?us-ascii?Q?zG0fueIDREATsP2Lw0aaKVPjIb27kOFTYAplGeoV?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d49239a-e4ba-4d66-0c79-08dddfeb7d64
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 13:14:27.3137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ac1YqgLOAy7c8quFykjMEjvA8h10rGPzaedAEuR2nGowFdJQlmWy5f9SCM/oMbAuB1m1Zey4JQY3Yq8+p8U7Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5994
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

Logging messages that show some type of "out of memory" error are generally
unnecessary as there is a generic message and a stack dump done by the
memory subsystem. These messages generally increase kernel size without
much added value[1].

The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
remove the useless call to dev_err_probe(), and just return the value
instead.

[1]: https://lore.kernel.org/lkml/1402419340.30479.18.camel@joe-AO725/

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/solomon/ssd130x-spi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
index 7c935870f7d2..b52f5fd592a1 100644
--- a/drivers/gpu/drm/solomon/ssd130x-spi.c
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -74,8 +74,7 @@ static int ssd130x_spi_probe(struct spi_device *spi)
 
 	t = devm_kzalloc(dev, sizeof(*t), GFP_KERNEL);
 	if (!t)
-		return dev_err_probe(dev, -ENOMEM,
-				     "Failed to allocate SPI transport data\n");
+		return -ENOMEM;
 
 	t->spi = spi;
 	t->dc = dc;
-- 
2.34.1

