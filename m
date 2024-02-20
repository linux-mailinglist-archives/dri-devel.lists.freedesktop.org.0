Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3489085D220
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2EF10E407;
	Wed, 21 Feb 2024 08:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="W6Lj2AA9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2104.outbound.protection.outlook.com [40.107.22.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEC810E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVK6aJE7kKo3hI60sLrybf1C1YZ3JcusTr5AonWD4vUVa3pM9WZVKoG7zMwEtkcFemlutEdLartI48rv2omKNbzpS+lgefMkUbbYaE1pO/oWfJtb7ZBgE7kYXtyAT7jU7nMhXozQAQ6e10vTXKy54+FJ79m9PXXRUEBry/+IjkwYI3lArA8uksnn7ed1IRU0ABMLEjw+Ahe91td3kb5lnUqH6Mb1nmvYjLoHEYDglQgX0nShGk7sQeUD3xs5t13j9tbXyfwGQSvoym+q8yWwLw5wLC3AUwSAtjleYeHZ34a2O1SRje5VMlj0PWxkIH6BQdxcfKiJ2uVGczHCd3rl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wu9zGPKHKH/j0L4z2++XlAq79sCFrmoumx8z7gnJzZw=;
 b=kTz0GHrSe0SrKxOMDaGlLgDPS782n0vJld9Tpl1f6uCbMQLi7VGkf+pyWvHFR9cEqywwrrsoENVEMDlgzTs26spwfbBS6k75ISatpv07M9N62noXGVS5mTAMPuKD8fHaq6BRNUpbYY/Rbf+hUc57ZUXHvdKGe2Wy4JR+dU5NPyfD/aU3rbaQ4TvVWtacuHt1Y8zmY8147miOKlHh9yIGFZul7Mx1/n7dRApAXhVuvGnwuYDaQ6c9CNg0zZP+kcFgboFxNnXx8fThZEyW1Rqa0M3oJgbkhUllWfg4gvzsujpB17y1UCt26YdzzCDFjXzch3JHpJjF3h2lYLRYc4tFTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wu9zGPKHKH/j0L4z2++XlAq79sCFrmoumx8z7gnJzZw=;
 b=W6Lj2AA93+7z8LVUklES/JRsU2IjXEa7sT7roGrBpzBw5lREe0QnPxDhQ5nKL7N/tZMlNfBLbrxBo+gYgKsFGvW5mexuZbKsgr7luSiHhDNZtv6dDveQeTTilOBCiUpoK43K73M5Cz0dsexxiTjtU7HbjCKbGhjoKLLBrWCVVhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by PR3PR08MB5577.eurprd08.prod.outlook.com (2603:10a6:102:81::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 14:05:58 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99%6]) with mapi id 15.20.7292.033; Tue, 20 Feb 2024
 14:05:58 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 20 Feb 2024 15:05:50 +0100
Subject: [PATCH v4 6/8] usb: misc: onboard_dev: use device supply names
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
In-Reply-To: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco@wolfvision.net>
X-Mailer: b4 0.14-dev-8b532
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708437949; l=5600;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=wUGrYbPnydwzo+RtLKmi7eQ2m/EJeSbfPolFtQ6kIRQ=;
 b=NfsAaQep/oh9gZ7YytYUoAWOR9xVUzlZ+mL1lYrfCleQj8N/AfsRRjGKWmSfsfwTPYc/J8TST
 vaCWzcRyNeXASuhwRNuiHcPD+T5ig7T12/N8poLEk0XpX9M1ongpQz8
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: VI1PR0102CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::23) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|PR3PR08MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: f982dc5e-9aa4-4235-5be2-08dc321d0fcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jhw4rUTMtfAI24+OMIL7yLgt8Hx86ztx6+C89sjABEu8KpNsVOmHjvKdmpK6NiD96oEUrwdxYaBzKJrn7eQBIBdilH4Zl3IpeHfUl93f2AVtZB9dcaoPZqjQCEhFuo/iqfZEqGvKJlJcuaQ+SdDO7ncvHcqV2WR2mjUdtHbL5R5T/o3DXnKsoMwGozg1jyuNN6qyRZjdXdYzTEkDi5wzrZiSSlci2bUNT2pCFV/yDtflz4bzWIv0Sj5s6lSYdzXd3T8GrEsaZqCGtTlLTZPelrJl+HOxeqcP82tASNfAQos8eIL7Cn2C5K1NHPwEI/2HTXIjddY27kHISJ6Ehd1z41bBC7FnkYMai5hvXzLj9DgI5eAvJKayICJ1Bh7Gv0uCDzCbI1uVgrEzF2DGG9ieYKmf3OptuGem58jcASEVCB/L3gUMuKCzTcR5w3KaQfbVyASnHMdaLxZ4cM30Hw7YkIDfHpWsqwTXTn/4DBFsdNn7+FuYi7GTS7COuqY8oS1cQoRJvOadOFIsRkJC6UBcd+SLc1p/hFLsDVGh50G3OJ8UZXrCdU1G/n/KBJAw7PEhVHmne2biam1iKDSB7YP8Iaeu3tzi6bQP6KVyiqP1UDAbr8UJ6It+iZLcsl8v7Kn8LZCMBbgCgAmhBKbaCH3yCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YSszZGs4YU1uUVp3UGFLLy9mNmNRY2xPQmhFbnhXNVNKSm5iQzF4Y25GV0ZD?=
 =?utf-8?B?NFJ5aTRMdlN1UHhKdUdVYVhnNFk0c1JlTU1WQWdFYUgxNm9rMGtmdnNyanJQ?=
 =?utf-8?B?ckFhbitWOW5tMWx6b1gvZDlIL09vbHQzUEJDdjNRQ2l4aGhmd3RPUjRIL1E3?=
 =?utf-8?B?bFc1Q2pSU2F2WnJsUnBTdG4xYkhJMkFxaFJTcHpiMlZteVk4OVNldnNpWndm?=
 =?utf-8?B?dGZoTkVTTThxUG9IT01KSGQ1dEVDaDBGQ0RQQ0V4bzYxY3V5cG0xa3ovME1L?=
 =?utf-8?B?Nmk4V1dTVEFFVnJJQ0NqakFWREhjdHgwT1A3dEU4dzY3dzR4NEN6Umw4MTFM?=
 =?utf-8?B?NzVNV3k2T1YyQ0U0Z2o5a0lVSlF6Mzg1QWpML00rcnZRWU1JeElXemRKbTVS?=
 =?utf-8?B?Q3lYek5aSTFISldzSXRQNTJmdjA2cm1ydHFjUkU2MzRaSUVnL0pMUWVwWlk4?=
 =?utf-8?B?WUJlZ0U1STBWUG94NDJWb3duMFJVYVIwL0ZOaUQzb1BGZlJQdlNFc3JTdFNy?=
 =?utf-8?B?VHpQVzRuR1VGdkhvMWpUUDRIWmpNSVdtdzhodnlObEZSaFBwS29tbUpnUk1E?=
 =?utf-8?B?SlppbTZHM1BkaU5ML2h5UUpTZm9wek8wTVk2NDdYTExCNlBodW9NcXJiWDRi?=
 =?utf-8?B?VWNLZ3U4YnY0MFZ3eTVqelFnV2hsYUJnNUk1aVVJbkJxTHkvUTJ0a0dPY21R?=
 =?utf-8?B?WlJSeVVYbEtjS0ZEVnpUazl1K2g5L3Jib1JRa0ttaTlqVDFXZjYzVnI3c3FR?=
 =?utf-8?B?cWQxNlVTcVJSTS9CQ1RMVjQ4SHFYRnpsejRYcmFIdk0rRk9RNDA0Z01Xbm1K?=
 =?utf-8?B?eXZCVGNqYWlXcG10ZGtLY213Y1pWdzlNTEpVZjVwcGhZRFo2V0NMN3ozcTFC?=
 =?utf-8?B?ZEVNNG9mZThhbkZqM0taQUU1djZXeXBhdE9mdFBkK3V1eGkreGE2UGhmcnJ5?=
 =?utf-8?B?UkQyOXM0d0RxdkhkV2Y1ZTlldU4yR0x3a3lvWitkNTAvS09jMk9yZXV3MEJX?=
 =?utf-8?B?VlBoVTA4TzRLZTlqNkd3ajdkSFd5a2M4NkIxWlJ0U1hiSUtkejU4UU9pcXYw?=
 =?utf-8?B?NklzZUY4bHJUVXhIdU5oY2RtWDErajF2R3ZsVWpBdU5zZXNsS1JEWGRPbDFO?=
 =?utf-8?B?L0tUcjJ2Q3FuZGhWSVdkaUpSUkFyQW9uL3hxR2FGbzgwcldySmVZK0hDTjhu?=
 =?utf-8?B?Y3NzT0lRTmpGbnNpdE5ON3plS0ZzY2ErSEhHdU0rQnQ4cjdzUGxMWGhIYzF6?=
 =?utf-8?B?SSt6bVNaRkVTdEdNcWxOUm85dVIxZXR4b0t2aUVWQ0xMSVU2ck1RN1VlL3py?=
 =?utf-8?B?UFN1dzJBV2dCUlhNc0VqUHRUUDBmTUN3cW5RQ1A2Qm94d0YwSHB4RktodnhC?=
 =?utf-8?B?YjNZRTFjbFcwS0tIUEx3a29YZ2dxWkc4ME5Rd1QzV3VLV3NWbXhVcGI2ZTVz?=
 =?utf-8?B?MGdMOE5wR25GU0ZoYmNjcGtFaU5WKzJMUGtUU0h5UkJ6cjdVQVpqSTJ0ci9S?=
 =?utf-8?B?ek5ieFJKVjlIeFFxd0hzWTJRdjBWcWpPWVovTGlCMUUyZ0tLL3FPMG5vVmNU?=
 =?utf-8?B?RGpCUmV2UVB0M2I0NHVNNEk5T3NMVG5BUGZBbGhmYUsvNi94L1NVQURlaytX?=
 =?utf-8?B?L09lV1h0TTRiekg5d09kS3JXNUQyeU5sRkpnbmpGN1JQTk1SNEdXRmFXRG94?=
 =?utf-8?B?bWpoTWNaeW5QMzNiRm5peGdZb0FFUnNPemdBa2VZUVcvby9RUFR3eG1zK2J3?=
 =?utf-8?B?aDZVcWU5TWh5WTJFNEg2OTRiMXRGTnROalFhaVlpckxPSlk2ZDlxYXJPNXJv?=
 =?utf-8?B?UzE1anRpYW1NdXhrY0RGV21GNnYvWk9QeUovNk1oc29EQStzS1BGUUcrUW56?=
 =?utf-8?B?dTh2TGkxR3Rub3M4YWI4U2NYcWdPNDFveTAvbHhkQjZZQWE4RE1vZURYcFl1?=
 =?utf-8?B?TFhMaFV0Y0hBeU82d1NpS25iVlhnaWN2QW9XcDJZS2Y4djVyVzQ2ZURyZUZS?=
 =?utf-8?B?a1RKald5WEU5ZEt0K25IVlJZWUdVdzlobVVhaDBPdzFlNEY3MGo5YWlwck04?=
 =?utf-8?B?eHNBWU9KNlh2WldEd2xCa1d5bXR5Q1JPVE45aGlRV0F3bEhCSSszVUJLVjQ3?=
 =?utf-8?B?NTVDWTFPeVVaZ25aSDBtdzJzclVneldTM3paRHdKeUJldCs3bFE1Tks4N3Av?=
 =?utf-8?Q?1uEYD/P/Ac79nUqkPsTQ7qI=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f982dc5e-9aa4-4235-5be2-08dc321d0fcc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 14:05:58.1078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idsM3Y2m+uzunysAbGu2pwHWpxtGuKgHHD7smbdN9nGRPjV8WbL6U9g6szk5DgcoNyZHN4IsOKIrjReGHbgHrIxeBRN8KkhyyOCqxhol2zE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5577
X-Mailman-Approved-At: Wed, 21 Feb 2024 08:08:40 +0000
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

The current mechanism uses generic names for the power supplies, which
conflicts with proper name definitions in the device bindings.

Add a per-device property to include real supply names and keep generic
names as a fallback mechanism for backward compatibility.

Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 drivers/usb/misc/onboard_usb_dev.c | 54 ++++++++++++++++++++------------------
 drivers/usb/misc/onboard_usb_dev.h | 23 ++++++++++++++++
 2 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index f43130a6786f..e66fcac93006 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -29,18 +29,6 @@
 
 #include "onboard_usb_dev.h"
 
-/*
- * Use generic names, as the actual names might differ between devices. If a new
- * device requires more than the currently supported supplies, add a new one
- * here.
- */
-static const char * const supply_names[] = {
-	"vdd",
-	"vdd2",
-};
-
-#define MAX_SUPPLIES ARRAY_SIZE(supply_names)
-
 static void onboard_dev_attach_usb_driver(struct work_struct *work);
 
 static struct usb_device_driver onboard_dev_usbdev_driver;
@@ -66,6 +54,33 @@ struct onboard_dev {
 	struct clk *clk;
 };
 
+static int onboard_dev_get_regulator_bulk(struct device *dev,
+					  struct onboard_dev *onboard_dev)
+{
+	unsigned int i;
+	int err;
+
+	const char * const *supply_names = onboard_dev->pdata->supply_names;
+
+	if (onboard_dev->pdata->num_supplies > MAX_SUPPLIES)
+		return dev_err_probe(dev, -EINVAL, "max %zu supplies supported!\n",
+				     MAX_SUPPLIES);
+
+	if (!supply_names[0])
+		supply_names = generic_supply_names;
+
+	for (i = 0; i < onboard_dev->pdata->num_supplies; i++)
+		onboard_dev->supplies[i].supply = supply_names[i];
+
+	err = devm_regulator_bulk_get(dev, onboard_dev->pdata->num_supplies,
+				      onboard_dev->supplies);
+	if (err)
+		dev_err(dev, "Failed to get regulator supplies: %pe\n",
+			ERR_PTR(err));
+
+	return err;
+}
+
 static int onboard_dev_power_on(struct onboard_dev *onboard_dev)
 {
 	int err;
@@ -266,7 +281,6 @@ static int onboard_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct onboard_dev *onboard_dev;
-	unsigned int i;
 	int err;
 
 	onboard_dev = devm_kzalloc(dev, sizeof(*onboard_dev), GFP_KERNEL);
@@ -277,19 +291,9 @@ static int onboard_dev_probe(struct platform_device *pdev)
 	if (!onboard_dev->pdata)
 		return -EINVAL;
 
-	if (onboard_dev->pdata->num_supplies > MAX_SUPPLIES)
-		return dev_err_probe(dev, -EINVAL, "max %zu supplies supported!\n",
-				     MAX_SUPPLIES);
-
-	for (i = 0; i < onboard_dev->pdata->num_supplies; i++)
-		onboard_dev->supplies[i].supply = supply_names[i];
-
-	err = devm_regulator_bulk_get(dev, onboard_dev->pdata->num_supplies,
-				      onboard_dev->supplies);
-	if (err) {
-		dev_err(dev, "Failed to get regulator supplies: %pe\n", ERR_PTR(err));
+	err = onboard_dev_get_regulator_bulk(dev, onboard_dev);
+	if (err)
 		return err;
-	}
 
 	onboard_dev->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(onboard_dev->clk))
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index ebe83e19d818..59dced6bd339 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -6,63 +6,86 @@
 #ifndef _USB_MISC_ONBOARD_USB_DEV_H
 #define _USB_MISC_ONBOARD_USB_DEV_H
 
+/*
+ * Fallback supply names for backwards compatibility. If the device requires
+ * more than the currently supported supplies, add a new one here, and if
+ * possible, the real name supplies to the device-specific data.
+ */
+static const char * const generic_supply_names[] = {
+	"vdd",
+	"vdd2",
+};
+
+#define MAX_SUPPLIES ARRAY_SIZE(generic_supply_names)
+
 struct onboard_dev_pdata {
 	unsigned long reset_us;		/* reset pulse width in us */
 	unsigned int num_supplies;	/* number of supplies */
 	bool is_hub;
+	const char * const supply_names[MAX_SUPPLIES];
+
 };
 
 static const struct onboard_dev_pdata microchip_usb424_data = {
 	.reset_us = 1,
 	.num_supplies = 1,
+	.supply_names = { NULL },
 	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata microchip_usb5744_data = {
 	.reset_us = 0,
 	.num_supplies = 2,
+	.supply_names = { NULL },
 	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata realtek_rts5411_data = {
 	.reset_us = 0,
 	.num_supplies = 1,
+	.supply_names = { NULL },
 	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata ti_tusb8041_data = {
 	.reset_us = 3000,
 	.num_supplies = 1,
+	.supply_names = { NULL },
 	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata cypress_hx3_data = {
 	.reset_us = 10000,
 	.num_supplies = 2,
+	.supply_names = { NULL },
 	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata cypress_hx2vl_data = {
 	.reset_us = 1,
 	.num_supplies = 1,
+	.supply_names = { NULL },
 	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata genesys_gl850g_data = {
 	.reset_us = 3,
 	.num_supplies = 1,
+	.supply_names = { NULL },
 	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata genesys_gl852g_data = {
 	.reset_us = 50,
 	.num_supplies = 1,
+	.supply_names = { NULL },
 	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata vialab_vl817_data = {
 	.reset_us = 10,
 	.num_supplies = 1,
+	.supply_names = { NULL },
 	.is_hub = true,
 };
 

-- 
2.40.1

