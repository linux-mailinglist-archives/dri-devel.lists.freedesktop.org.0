Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9397B3CAD5
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 14:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BCE10E254;
	Sat, 30 Aug 2025 12:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="jCm2WXEu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012032.outbound.protection.outlook.com [40.107.75.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ED210E254
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 12:47:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMwOSnhPeUYG1caLCY6hg6yqHj8jMixBsw5vob6O/BOb68o0gc/wQar/UOM9uHsLP8QjrsQ7z8+PRRG625g1W30HHOxfDPlV7kG2eEEHpaXFo1vCiqtYkHI/mMwAUbSL7vEx56+xRpi39wYSyUSL5Tp4Y0Og1/Ve6Puj7aRcVhJJfn8Qr9pVbzSEnL8QGnac4m4UVJ9W3GLdXBJsLfRDKj/OaRSHdbam46xhmuehuwBVyzOqIkv3JZ3UXS/S7BO63AtsFcL/cubNbDnWXzZDGacIFdf3/ZahRTfU7mZhFjzEOLFGz5PJb+d8rKUNI1FeTeFOCjr0Hc8yzgKlAIij+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F07n9j/P7vHwoojB1r7IHCVCKOMhRLqygGLUHx61Arw=;
 b=tfriyiqAvG/vPZybpDk1U37+RoKYnDKElZ3NW+Tq/yizf8R3UokoRMlea9RB4XHnuPEbgoRaNMFo2ozb7IqGBhV8c56rVpb4d+yEJgFvOuoTIBYXkIbeQzf5VvN4sF4L1snhZwhksOmvaCvK6ZLh8USZGVyK8kj/m2dzzWHGbAATdxVQTjks8v51moGu7/W5Ep195rqHQmX7L9k1e/ND0AI3B8T6ohzjI92LFMhz/e2qDLnSkFiRRmgQEsPy7GOQ9lenW+zFztXdTv71V13LZdDsdbgGOoCZsvioVI2xBOobs0BBzK0/MRa49OwwonqT41169RK3JNDiy0sNFrBpYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F07n9j/P7vHwoojB1r7IHCVCKOMhRLqygGLUHx61Arw=;
 b=jCm2WXEu3nhcs/F6gthiPjzjhLMNIcmgPukrC5SShbQa9rOxZ9f5HSR8e/x9yPRpMCJvdsVujHFe1EjaLpt3mrAKy5Rw7uadJKIxPHnwseg4Nu0annYLCPSn3JxcJQ5UYYXU0VZxUWzU11MwedSgYcLPMuzmyLZVnFiJLSwtYWi7SMZn5rH6SpyiksCiBeKymcUGLJkiEetiJn95zKW3oiqWUbMJGmMcSyV/aP2RbuzpflonkN8bPlvkCY6WN03HG7uOziXKBw9QMGkfzp6iK67fOEJBdPhkw4jxI610yg02a2Cw28r07Xvtb7jBNqVFxgSE446Nv99vgHjGoiEShA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYSPR06MB6713.apcprd06.prod.outlook.com (2603:1096:400:479::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.21; Sat, 30 Aug 2025 12:47:15 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.021; Sat, 30 Aug 2025
 12:47:15 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Qianfeng Rong <rongqianfeng@vivo.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: mb862xxfb: Use int type to store negative error codes
Date: Sat, 30 Aug 2025 20:47:00 +0800
Message-Id: <20250830124703.73732-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYSPR06MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8d2c69-b236-4fef-e716-08dde7c358a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IIOf7jqpxUhql9HMVmP7XgMFJJcNzDfFUobUh0JU/hnffOw8u0tMTLLRiVur?=
 =?us-ascii?Q?Vfuv/D4z44LefYWJQGOb4J15vui63aQc4lMORwXnqubWAvBjmRiVU5OVgePd?=
 =?us-ascii?Q?duquzTySBQagPgfbeOBhg4YS7SCCnRfQJDT9kaBafUMkG5bCGwRkpFbOZcsP?=
 =?us-ascii?Q?dDEkrP6/BpTb1IE7DpGJjV3D9PuwLq7KFYaEoQTJS/Qf9D4PXbVq5LRBNYQj?=
 =?us-ascii?Q?XUUcuXHtfx1TNCiWHucE0qahr0JLnVKH6CXBRg0H6fNISWX8+Wm2W5OmJ0YW?=
 =?us-ascii?Q?Pl/l5eexaTFXs/u/J3avjj/p16a6vuYqHsa8/jWMKOV98iriKtRXxtV1Auj3?=
 =?us-ascii?Q?j1mi68xRh+wIPIVgfqJKqeo1Xh7jJ2viiPdNfLDpQd68P+HRdbiXW0sTHWEq?=
 =?us-ascii?Q?EHtTUub7i0fCRmlGIl79pmtiHyg7uDdIr0bjP7OWi9DlF0UIme4ClNMpcwTP?=
 =?us-ascii?Q?36u9iM5EkJ05G2nCC/lpVecAy004ZviVF6n5XFlpwb/Hc3P1GCyRlLpkj7iz?=
 =?us-ascii?Q?LU8JN1v5YWxWG6JTlfNHO1XTGR7VpmPHE8vY98i2ra251C1iu5a2lxdQp1d2?=
 =?us-ascii?Q?35Bl/bLDuHCz3G1O8fQVn6Fd4ElJEyHUgthTzlOcICIn5wnZ03ZY+MQWcNcU?=
 =?us-ascii?Q?7hWjGjFdajglg51vQZvMesZmYekYP5XVrUVopnIqyX6U2jGEnLJf/ZP7eMzs?=
 =?us-ascii?Q?XvnwL6O9VS8n6iCmywFHMoyKtMMLEyZfKwDUlwn7kCuztoQSRTYxzRZy5EVP?=
 =?us-ascii?Q?vDRwwHKw3Pq5+lAOD3GZwhUUx0l4BDBIJo74K5Gl6/Tlolrz77J2XZ9OorUi?=
 =?us-ascii?Q?+FI9dcOGRxkLrSMdfzlesYKDKcOpgzPdMyj7tK1wENjhddd3gTUAvrjCPosu?=
 =?us-ascii?Q?u8cpBaVnB2+oMKzcYciBiBb3MhdG/hpp7XqLVUXgtJs0sDnui+OpemoiCgYz?=
 =?us-ascii?Q?VCTJyCaK5pT7J3LcvbSsePsEN/ydWmmQSwNx+G8zghFA4OLeg3+bPuUn80ch?=
 =?us-ascii?Q?hR0/PC8nzb+NDk95kipDBGoT6k3bAYscgz4ZC+69Ey2FmG+J+g0OF23brKa8?=
 =?us-ascii?Q?7/P32MVT02WCfVTs86ENuicytlZKwbFArwFYewkUQeXJfPJae0gBkM2yclAu?=
 =?us-ascii?Q?Hc4m4yxMsk71dos3qrWOQ3/GtAHIKGciY59/HzgOVfMAI2SeAO34tDYlM9SG?=
 =?us-ascii?Q?yKzT/sis6Yy7DKdg40UrIu2b+mlorDvefZfbNxDXqVZ4l0BCRWayIhJSr3k5?=
 =?us-ascii?Q?TeENFYtYYuSNUO0iUgOC4Ts1RIGRkZWyHiXnI97CsVErYJSLZrooTO7fUJCg?=
 =?us-ascii?Q?4EZhMLD7yIU5aNrTj6jFi8/WaDJzqBL/Zuftd2q70E3OKNcuLG5dav4+bqlC?=
 =?us-ascii?Q?9hey9PCYZLIU3TWzXZLdSZX50j/QwEuFTmviuGxxkgbcYTfNfOTHpTlPoV1h?=
 =?us-ascii?Q?a/sMb2i5sGWbj6bnqLIHBg6JdY1gB1k+pKI/NUmisb57jjVZ0T1ErA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?90KA6FIpEx9nysPtEqD+gTn41tf8bz5ru2AtrEC9y55l7Md1XL2SsYDouw9n?=
 =?us-ascii?Q?Z5ifFE95AS3gQ8sFjyW4f0dA8XaipNqN93I6TVpxlOAxIjAntW/McBdMu0jj?=
 =?us-ascii?Q?B3CGJEG7TBH6lpum3U22vYUUcLXSnahpbLDkduepYXdnzS2IBRzfjpnd5dnE?=
 =?us-ascii?Q?pYL+SzZUA55Jbm232lXmv8Gi5UawY9sq8IGv4zVsunyFloKgjOKTm/6KTcnl?=
 =?us-ascii?Q?1k+uNClwHRzkiyTRacUqnI8FfSIswmCemPkqBx0biO7rubAZ7un6CSXtdfWl?=
 =?us-ascii?Q?1AXR3qXc257yYgq5yCVT17RRh5URVV+wUgxUMhVziD8f66kxRwN+gVcq5hg2?=
 =?us-ascii?Q?a2INQyIn2NILBgIMTr8r4sgIeD+cpYbnlJZX5+con10Og9wWZXEvecN0eqVT?=
 =?us-ascii?Q?jC7U/S7SC6g8gbGAU23RjPED4u6lr3kDjTpl95QWl21GtmM8xr4GqCZsBREM?=
 =?us-ascii?Q?e7p99RBmtp2vBmvRFXfWGVWeTfXaJoFQNjJU1jGhh5GYE6HjjD8KmjWjHzVd?=
 =?us-ascii?Q?5YbxVa0HUI4yRqpwrOXLCQEMFDD6xS0LTO/gu+Y3EvNsE/J68IZghjamFiLU?=
 =?us-ascii?Q?MqUf6VOirkK4op80aTaruOMpOsPX0g4oPmB/TXlSeHbjok++EMcCATQCs8YH?=
 =?us-ascii?Q?WxD4ySW052otOAdc9032agh6o76nahhz1n0zvm42UiXS3LshTlFNHbMeglsq?=
 =?us-ascii?Q?MmVtLeWcHXKXK6yaAzK24C2aT9GC8f6924H1TD0QyPQwdhz+SBjBaqXqB3n6?=
 =?us-ascii?Q?/yTWPEJtB+XGVNLRlygBg70bQczFzRHMOpKR6IJy9jL9u+72N/X+ixUaGJSr?=
 =?us-ascii?Q?7NDrSCj0vK6Gzr5DfoIw1Xixa0QtiLwkCa+zaB3y2r4j96C2aCoHTypOLYa4?=
 =?us-ascii?Q?g/jqmQPVRug+4GNq0nyd9kEEBNtPVFpRd8eTDdIGDBYy1AQ6yTD5rhPaQuL1?=
 =?us-ascii?Q?1TfcUWxiyojtesELX/UbrDT0mRrudkeJBA0YpZgvpNE43KjB4vUD6rbo0WyW?=
 =?us-ascii?Q?d08iRuN7WeKcoh4bfEZif9OsMOOxm7CUba5r5HIDiuL3bDjPseqqqCSU1LWA?=
 =?us-ascii?Q?uu37QM2gsBq7uf+uYR2ID97UBtYUy45Fhs/fC7b28D3fv9p6xli1gpyMHfOb?=
 =?us-ascii?Q?AjAVdO68dBxUlObUbsvO3GdjZmaccLXDQBnjYv6sS8/6fMefOrOt4vX5SP75?=
 =?us-ascii?Q?fUQ9lgzGERn/dV4qw3VE2KoqU8AJ19GjKzHTRD9uEiTf0H0AbF9jGXTzsYX+?=
 =?us-ascii?Q?dR8Is22DiCrCZTUDn89xMzB3WDs0WaVLLU2uM1gWEoFbWqIZ/n5PH21YxqDx?=
 =?us-ascii?Q?j78mTV2lwb5sr1FvO0T+dnl+/CMyTBFdOQ04f5MAPHjHlpLCY1oUfnOJdqs2?=
 =?us-ascii?Q?kQUs+dYMCQq47JyMtomxx2b1lzrlLT+fwlB3JLzYr4448QJ36nZB1chiVjUB?=
 =?us-ascii?Q?GpfwtpGbhAfX6MPXiUs/aKYbxA2anvpl/vmwbl1V2UaIUtfyVvLZCxxLlJcN?=
 =?us-ascii?Q?HCuAt6evkiky1ssrwb97EcRhefivhnC0BiVD6d5iL1bjH2Lh3jK0NvIdliZN?=
 =?us-ascii?Q?9mKr8GYAYET4rnUaLUpn2GS3AQ2sJppJtzfIhB+6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8d2c69-b236-4fef-e716-08dde7c358a6
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 12:47:15.0147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyDN6r6mbqjXtemvXW0G6rRxzBzUhVvYpEH34bUIr61e5d30yw2oHWIqWKbWYz76tUEMK3N1X2q7mXnJ2nJZTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6713
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

Change the 'ret' variable in of_platform_mb862xx_probe() from unsigned long
to int, as it needs to store either negative error codes or zero.

Storing the negative error codes in unsigned type, doesn't cause an issue
at runtime but can be confusing. Additionally, assigning negative error
codes to unsigned type may trigger a GCC warning when the -Wsign-conversion
flag is enabled.

No effect on runtime.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index ade88e7bc760..676c6d3ccc12 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -674,7 +674,7 @@ static int of_platform_mb862xx_probe(struct platform_device *ofdev)
 	struct fb_info *info;
 	struct resource res;
 	resource_size_t res_size;
-	unsigned long ret = -ENODEV;
+	int ret = -ENODEV;
 
 	if (of_address_to_resource(np, 0, &res)) {
 		dev_err(dev, "Invalid address\n");
-- 
2.34.1

