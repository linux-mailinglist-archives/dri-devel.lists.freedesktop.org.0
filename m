Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F27B1C5F5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 14:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B442810E763;
	Wed,  6 Aug 2025 12:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="NwJVm/Y/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012055.outbound.protection.outlook.com [40.107.75.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A3E10E763
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 12:36:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcSro66xdtI9JfFxvxnl6byzeWMutg3ZJYiv+GF3u1wazW7Z5hl0l2Ru42ynrWyYTWyZHvarxdqh70Ame+aqN3dyzEvv+VA4/XfHQ/4f8gYcEh7V3LzzCkgMmbXmgjCzI2pb4VxHkfSXMZfIw2UnZgm2BSBidQdNE8zW1lfkTwGQoBPhxlaqpWCub0Dvr/qGtetJO4Yb7g6C5UePtlMdPIdcm/19MZvM1aJbW+AVJIxw4d2lCKiDJSqCaxhOwyyWw3putsNoFG5m4/jGqWbt15K7JkwHI+oX+XTd6IKrkjGN23daesbuf9S6KnmVjA5dIYi4iwb4QRfbXQ8pepH0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY2g0NWyRwh8gvrdGsZx0wKjON52+NSunGD29pGxraE=;
 b=Myalu9ZTQdQ1/8aXG40GfiAh7nuJAIIvbm1zBwvXeGlQfwzQFDmFunlHwTFrnSr/nWqRRlsuZrnCTASdGSxw4lHgZQRtqm9olPfm9xfnL+bpMe6f3OmuD46ga88MIzL1ZNEDtIE7hxF3G9fbG+61szZdokg+pa2H/TD1Qxm3DvolgRyAtdetwPbibOHtldt+d+Sp/CqJTlRqdaH8NDdJUGbFDN+ejQlyBHHmnNe/HTV79kxb5JqsRN/kifTo7VnQIH8i/Id8ZYzI2xwo04yJ80GlsBO9xUuwNDKTvxlO3zS2xkNFYJA4CpgOk4+g0aqfNgW+xdZRkfDHmseCU15WUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY2g0NWyRwh8gvrdGsZx0wKjON52+NSunGD29pGxraE=;
 b=NwJVm/Y/G6vNwhi5LKuKGBKE8h4JNhfSyrqU+WGMAyKef7Q8F2bz9UDL9M8XQOKNhu0LoK3nws32WO0RkLpOlv0YpcjUk4MH9EiXpBSBMHiRUQqaKwqu7sYUfxYNvUf3Nh+qb+wgbB5DWB5isXrfROvnqqnX5GhZdgVvBRctvx/cSSKzFn7yeCqCc7t3gjpbHW5BHvVv0GGvco73yyPOEMlK3iUmaXvysvn4W8jjeUxa0Xi7lPeNV9l2dfsMAe9BMQCvhScsPnxoBoRetH1l4fzo6g5Vt2ZcbIFGak5Ii1tWYTzg1BmZ/msNE7qxB38iSZ4+G8ZKnEuKzDVvyEoqDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com (2603:1096:400:32f::14)
 by KL1PR06MB6111.apcprd06.prod.outlook.com (2603:1096:820:d9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 12:36:09 +0000
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263]) by TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 12:36:08 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org (open list:NXP i.MX 8MQ DCSS DRIVER),
 imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Cc: liaoyuanhong@vivo.com
Subject: [PATCH v2] drm/imx: Remove goto label that are only used once
Date: Wed,  6 Aug 2025 20:35:45 +0800
Message-Id: <20250806123545.380325-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0121.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::25) To TY0PR06MB5579.apcprd06.prod.outlook.com
 (2603:1096:400:32f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5579:EE_|KL1PR06MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: f99977f1-8321-4a33-cffe-08ddd4e5d1a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TTfIsQkcz8wfF3oVp1pZ1272/E3mvTSEvO2nRWhIrh/EGcTfkGol66xABzGH?=
 =?us-ascii?Q?mi3WoeZ9kxjXmsoHtSI7Fjxi69dMTrp036BkAM3lb/vpAz1quNZV7ECiwC5f?=
 =?us-ascii?Q?Mw8zxKLgKxuRR/1PsqDkkoBJNUZ0WOKWTPElTMLvzYb7Efpu+eQh+HQyGjNx?=
 =?us-ascii?Q?g+aW8co7nzp0oYLTwuU9oN81eXQLxm/1Hy4WMMrXT31frOgXX/Yj2dJunBAh?=
 =?us-ascii?Q?7Je2EkUdPkdlSNAlVXAl80HD9KxNpp3T9HcHTXgfVCVH8P5HF/z0K34QN02e?=
 =?us-ascii?Q?4A8irCFmcT+z/dhAbBKC8JL/smWwkaA2Xj2PnFW/Px7dViDEFKu8aeGP+IOB?=
 =?us-ascii?Q?tKn87O2+gKFOmfaKT5ibqeT4IAkcJWkzt22BdHBJf/lqB4dQ79L2YsS0D/Yn?=
 =?us-ascii?Q?b+36Dl58jiUsbGRf59HRH0uaiofPWWcjbqfFg4aq1cD1jrWYac1GF+JJ/zJQ?=
 =?us-ascii?Q?HnxNDXxuFK9c6Jp9FCey9O3Ee9qXY1IsmvAgprxqEjmVYFR8s53lU9O3nZxd?=
 =?us-ascii?Q?O/sgKr8X/wVTPMn76ZR/bAUYX6Ke+qk5L9S3LN7QbZEWIgO782DpsXtqK8Kq?=
 =?us-ascii?Q?pcn3Wv3FLsjWaDG9530KGzD1NfnQgw5kEYUViYgA9OuBTTVbBvhjE361oBJQ?=
 =?us-ascii?Q?rkbBdoqt8jRkFLwsrONEPRSIt7PPEmIgyIHDidhWJZv0H/21kRQksxxXhros?=
 =?us-ascii?Q?jCkUONfi5RLjMU65xtjI0P1pCOl+uyDpdZYxJ8I5jGxniYnZBq2eaYWIVmwF?=
 =?us-ascii?Q?rT6/jp0caMzrrUIaVeyOHEtmVhiOEzlxTVytYWaa6jjDoakRnfJDPP+/kXd1?=
 =?us-ascii?Q?+3ErB2zVD/JklZ6+n5WY0GNQjC2GwON3h/89WxWko3esJKSp7xPHSlndBW04?=
 =?us-ascii?Q?lIViTkP8YdfeYWhQs7hqcYNCAd3cxJ4paqzSq9PBpMfgQ/kj2+pxpwd61DkH?=
 =?us-ascii?Q?SUpS8cyjJ40yl+lxa2qiLe7wN5WDOTUza0z/TP3F+AiVIKx5O7slk/ynQNN3?=
 =?us-ascii?Q?H6gadfBn6iXzVJonyEfHTlhQwme8k59arU+3Hxv7fzIc3BzbxFtpWIPqXbXi?=
 =?us-ascii?Q?zqbLBhiG/+P28pIZlguZnOHQfiLKoAVeH8qExfvD7VHw90+i5OBhSqI2qV90?=
 =?us-ascii?Q?/CVrWfy7iS6LUgTVGzv2eVB8F/9U4f7O8TaWzP/eBRCcYoDD+U2jH1v1o4t+?=
 =?us-ascii?Q?T31VnHxc1mr2+z6U6V/TvThfJ48ezI0LN1urVfciAYZP013kV5StJRmVvjlK?=
 =?us-ascii?Q?wGZDSmwe4MzcL7AY5cwUkkZo8WEGbY9b/KPHjdE7vynhHsnhfL+mUIPRr+/F?=
 =?us-ascii?Q?ZKJZzka3oPt7FA7dXM4oBM407w0NgafvRxK7qx9eMwipxbGdecWKvwrgT4Y3?=
 =?us-ascii?Q?nwaxZDl5rRLgQmSIx76R8CyOUNfKcYHnA6comS6Y/yJEh0yBOyziu9ySuV/g?=
 =?us-ascii?Q?b6se+nkkYh9/qsWxF8yvaFQE/zlN6sDeLrZXciRCdzjd4Y6mnhzAL0/d8/lL?=
 =?us-ascii?Q?gXWjKw79JFplLpc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR06MB5579.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fQpEFsuaogZSaf4k8qxdlNJzzBwQ1ft/geiB3W2bKm6cQfZHkYAgsF0zY7QN?=
 =?us-ascii?Q?hzTtRvlkCrkASvmMcMFGTmpWEQRCeggWuYoD0oKwqo7Yf8WFPhm5slwSeyxf?=
 =?us-ascii?Q?bgigkZYqkhcjRFxwOlYkmlAxd1eukHrQfmiyxBiM8Mm7R+hTKVIobjZffTsE?=
 =?us-ascii?Q?VEKosT1HKxx9GzNRVcBTEcWD/1f3r9nWJqQq2878JKnjfYJ9XEQdtQ3lEo+I?=
 =?us-ascii?Q?/p3amq4eHUcXKIkUQyDQOTMO4vyBVvijuWpELvhLKC+z7EnCMyvwIwBRJLM2?=
 =?us-ascii?Q?i3KZVCdnTnu3IlFT4bx6K9PWklOTr1Qd5b19qbaIM3BT8/aoz2RJxBKHZZ1D?=
 =?us-ascii?Q?jYvCEPQzoMmJ8j4rlYwOd6bou1tvhZrG4T9KNmA0cmtmbcLLYzkpjaqzVu5j?=
 =?us-ascii?Q?q+TFGGBzIaVD0vtPo42atkvPNNVYWmSQApn4a9FQd6vtUWik4VCJWH7/JWsj?=
 =?us-ascii?Q?0+iel6Ih2YBfzczaibYt2J1MKOqmuvkAN0sF4iAoyl1cclEJpY+mETf5V8Jk?=
 =?us-ascii?Q?bxlMAFr/VH7MdT0r82SYcbfALQCjmykXAhe5iJQQa2C7eWkXIpjZ1Ry2sIW/?=
 =?us-ascii?Q?PkbpX3zhT6LFtziAc70uCi17HzhDqDiO5aiffVlSOCCKmFOFeqXdcOorcL2y?=
 =?us-ascii?Q?S/w6V/qFKjbJ6Fy+s2AhF4YvinYBMKKM+gdz1ZkSKv7OZzaYFJW+niFVwn9Z?=
 =?us-ascii?Q?5opwaF3lbt9RQ3zUSQ1Cd8jaVA/JJorT0oP1fZ+/MDDDm1oWAXTsnHh4eJvo?=
 =?us-ascii?Q?+igP/uNlGKAo6pYJ4I/sMXaxhAdyK2NfXzSWwubFhLGaYiMRILzkn2J9mJuP?=
 =?us-ascii?Q?69XhvmKQwmSmp3NBRAzDSHz+PM66kjpml1D3+qjOtQYVy/WQ2IDJ0xDXq7Ln?=
 =?us-ascii?Q?GiwubSaD0DAae8vZxR61M5vHgGsrYYOaKqkHrW/Mp8nFuJKWNY31fu0iTlSA?=
 =?us-ascii?Q?vviNEp3/h3psi+u32Uf4vCXUToqLp8Bjj/wlENFH5Eg9RCZQcaZ/ofKSxZoB?=
 =?us-ascii?Q?Yt4jdwCMGRnZw6OiwmxhB2BvDZ6aEhuHYDhjLZlZMusmDVxorq8QYEYy/D1s?=
 =?us-ascii?Q?Pov5U4pxNloouZBsFmeWPKfUf8F5ZC+3Y1hNCS8BA4WYhGsnGB1i+7aGqUMU?=
 =?us-ascii?Q?QEnRsiExBppCxJntOC7EuSbsacPAGAjLrEfu6L/MEUphGFmn4QjqVO1KUsUT?=
 =?us-ascii?Q?l9MtInbsbfz+Ut6SjUmEUD/fvxQfk6aQEAO1Ly2Rw2Rpea0qJ1Hv4agXj+5J?=
 =?us-ascii?Q?uRIuagsk+eFQK9kFsKltd7XYFxJvFN9AKIl0dK97ZdI5sInpHRUanZPxLAC/?=
 =?us-ascii?Q?hypgT8MA8MxXaa5leQXnNu9CnHV7q5PMi89Z2MLdTPaws/g/XSlwT99Qrzt7?=
 =?us-ascii?Q?Hmpfl6jmpq7co082nEkW+j/x/LlKIdUquAkZE3fyQYlKLalDvboItLm05Pk3?=
 =?us-ascii?Q?9lm8sMJo4zjdD3U5OWKTREMFGDf2UOVkyA3Yc5uO1LiJBZi5i3wOK4/gJXrf?=
 =?us-ascii?Q?HO6PI/CnFmLyvRQdwq7CKrc2CuOdRNX01cXDj8/ATim5s8v72ITtMTcJvESv?=
 =?us-ascii?Q?M/VOMuIHa5sqYh4lbPGwjDgB0n3Do8FefhcBOo+U?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f99977f1-8321-4a33-cffe-08ddd4e5d1a4
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5579.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 12:36:08.8764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GTVBB/boIQ8b8sxUUrK/+UvD81P8WLQb2P9SV8xF/si4K/naG0IihEpkgCBwYFtxZ7XnJ0YVJapvTPareE6WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6111
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

Remove unnecessary goto labels to improve code readability. 

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
Changes in v2:
	Further simplify the return value by using dev_err_probe()
---
 drivers/gpu/drm/imx/dcss/dcss-drv.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index 19b027cc1dc4..51665a9b9533 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -37,7 +37,6 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *remote;
 	struct dcss_drv *mdrv;
-	int err = 0;
 	bool hdmi_output = true;
 
 	if (!dev->of_node)
@@ -63,17 +62,11 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
 
 	mdrv->kms = dcss_kms_attach(mdrv->dcss);
 	if (IS_ERR(mdrv->kms)) {
-		err = PTR_ERR(mdrv->kms);
-		dev_err_probe(dev, err, "Failed to initialize KMS\n");
-		goto dcss_shutoff;
+		dcss_dev_destroy(mdrv->dcss);
+		return dev_err_probe(dev, PTR_ERR(mdrv->kms), "Failed to initialize KMS\n");
 	}
 
 	return 0;
-
-dcss_shutoff:
-	dcss_dev_destroy(mdrv->dcss);
-
-	return err;
 }
 
 static void dcss_drv_platform_remove(struct platform_device *pdev)
-- 
2.34.1

