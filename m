Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B935586C393
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6EA10E1F4;
	Thu, 29 Feb 2024 08:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="eYunF7HP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2122.outbound.protection.outlook.com [40.107.22.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9373A10E1F4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:35:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCJHlCxbdZ4fua7R7wySD9hFmt2rSLuAHCywF9MPkFjdcapvsdT8yZeP1HMZIySN+ETZeYz/X7LM/zio/ik0wjhVBqZ3N90ggB2i2+npwvqLImoiZ5xhV4G+AgNJceQ/fxxhMvNVS3S+c8hwfPht6FwXpJEzAhB481T4Nhb8N998FS7nIZGi4/a1GzgAO5idgbX87B0VvWGnk4szQcN8Mj9K1T9unoqThB2KBTb4p2LcARv1Q/YKNpqPvHWZZEeE83eIrwcTIQRCUBcvRig48yHzVC/qP90U7oBawtA3TTkC/h688UzoiLb6Mo+pJLAScxy6qVa6pu9nXPLaAHgDUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgoMgCPBKwzfWbeF8lgH5NAIRhQpmLQTYXnUHWavB58=;
 b=CeLCYThLJO0w5Z0keYJWKpD4UG0hre+YsTfe92HAgJcyaX3bW4gnWu8o2kksU7aZGW6NsVPAhOdt4L3CBFrmWPxDPU6oY7N3pousfGi0m/6s7YJ4giCTqzm1zqQghjsh3KvaRIc/tJruN9sQlL37R7QIsXMGnIAKrru+QylOeNYvSu/hrofrimQAyldI6dGldTplfJdfUSH+/vL7xR+2quLCK6ZmojQBZM6AP5JyjE7qpLB7thnf5Z/yAyW4rzbia/pzxqkJvHDukDdb7WczyXgNlOZN3E+Eps8Cg67qpVBB6flD6wxh8BU6rq7PAmbd3BtSrMgQG1EDGQM/Ps+Zxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgoMgCPBKwzfWbeF8lgH5NAIRhQpmLQTYXnUHWavB58=;
 b=eYunF7HPZN04HKRxnpNCkk/tW4zv1RbamVP8OaNbVpM1Aqe+V7E7YWFM5V/Rr0HhlxYxrbmsFlZS1EKs5+pcvEM7WHBKb1vA2MdAkG0HjLm1w7G7BvM6jKYYc7CRTvMaXeE/tck9EuDBbYO4irzZdJX/KeTNQX+cvBFAPTpb/0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DU0PR08MB9727.eurprd08.prod.outlook.com (2603:10a6:10:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 08:34:55 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Thu, 29 Feb 2024
 08:34:55 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Thu, 29 Feb 2024 09:34:45 +0100
Subject: [PATCH v6 2/9] usb: misc: onboard_hub: use device supply names
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240229-onboard_xvf3500-v6-2-a0aff2947040@wolfvision.net>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
In-Reply-To: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
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
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709195691; l=5198;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=1jRF6eUBRouA1Hvx0Z6eIEmXQvVE/AoBOk4doyc8rhY=;
 b=0EeVN4pBM1GJ9v8jgWBoPsqcxuLrDqh5pThK7jfBO1qPZgPT6o5U2gcNEtaO/KRuYYvlOI2pj
 t6kFYQ8+QDPADIDB21Zb/fIbl31J6cRxdVmogSOG35Y2J0//l1HPH1L
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DU0PR08MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: d4cf20a4-a127-4692-a1de-08dc39014e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2EOLCjIUHaLs8zMcT6XTh7ECtoFv0EY8cD5oOdEHK1qkUasVWy3KQliyLKlTu/Jqgs//8RRb7KUiaEkjQ04erG4cR5iiMQqMRf4BJh/yMDUht6W9v9BJofVSjAGo/ngNUsmPyIa2m2W/rLwBl0AKr4pZqX6Ry9QFtjNHlWBE4S7m/s8SUPRhDiTU1938B/tdBwIkgqYbQOIstruZUpnLxraWxYVted5RJM3yPHmGAiMSuadNUXkstWqMZPX/JVyFXYTe+8XiauvuxasyC6S8347k5Cr67Etsg7PmtDqzfhKp2J2qU5VskiIDrWr+clsiGiKvVPLsONk39rGmEtTY61RQivph8ojNcqg2S/mgkK/+5/KZGiP9fkL208GD4O8mA7zvfjKHCyv3BrcY2neQ+f51Lh0fv+2OiKw9M4HaaM9LawZKOpDurpcZNVTc7Aerm7as1t30MwkvuEcDxRwktb2VNtRP6J/QFlZhZoObb3JRSgq8TozhB9FymbAV2QXTM0NovwfznAVG5fS62rvTHs08dhzFGVHmW43zcRACAu21waRl4BAc5ilF34H/e6pRVwRU/Vh6+7xJR/pUjuFzDaR5lGdMbxw6sbtpgRJFfiHoycK4AyWCNOgR7AUt4fsz2CZShWspm8ju8apO0sX2oA2jFaPmlMwPPIlgRreR1Foo5vY6GFmi1jxnEfyvcP67j0WvnF/49Mja1k3Hy2FgqHIF+fWRE3v344HaFxTaPEI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVU4Qml5TFZ4VFZhYXhVRkVxZUV6MGcvV0VwTUpaZ1VaUWNTQUgxK3VHenF4?=
 =?utf-8?B?ZXk1VzhCTGgxT2wrYlJVejJBZzlVKzB4cEJhNkJ4TXBmNVowaUp5SXptTi9Q?=
 =?utf-8?B?YlB2VXNqUVBBTXlhUkc0WVFOL0xkYUt0YzhGMjV5TmdLY2VLVXRocEhva0VN?=
 =?utf-8?B?SlIxaDcwZXFscEhnaXg5UGw5ZkkrSS81M0RuWVk1WG5FUnZDSDJUaFlGZDJ2?=
 =?utf-8?B?OHRITW5OMHE5MDdhL1gyTjZsbEd4ckYzVExtMzU1QXJSajZ4dXNRbmEzQ3VD?=
 =?utf-8?B?bEJ5QlluVTlMNDNYQzdPQjdPTFRaUEJOdVBvS2ZJN3MydkFIditKS2d6S3ZQ?=
 =?utf-8?B?U2NLMGFjaGVTblJwWUZtVjFBMStiaVlNZTBNMVdRU3p3ZEZuLzhkUUx3aE4y?=
 =?utf-8?B?TWs0a285cTJxbGdhN3haQmhNd3BrOFo1SG52dHRrQ0I1NnNON0wzaXpaWGtq?=
 =?utf-8?B?U2h0M3RxRnJoNkVkOTFVZHpNSkRkK05uVHArcC9hdFdidTVUU2pmOHFzek0v?=
 =?utf-8?B?c0F4WU55ZVMrTFB2UWdobXVrVlFvU2lZUWVyRGlMcklVRy9jY0x0T2RLenNG?=
 =?utf-8?B?R3Z2L2t0UUt5cnNuRHVXR2lhaHhib09mNk10dVlYTkhWWEhRS2pzNzNaZTlD?=
 =?utf-8?B?TkhTdG82NVRxdVpQZ2Q3RE44Z2Y3K3BwSzhlKzdKODJvbmluUzROdFhsZTl5?=
 =?utf-8?B?OVdPK0RpTzFrd2k2M1RqSlV6Z0tjWUQyNVluUG4wdVQwVWRuYnpOd1RKU2Zn?=
 =?utf-8?B?YTFLbnVNT21aSlR0SlB2dmhUd1NhdjZiY1JGNldPdlFZVldkSGNkVERkSGdw?=
 =?utf-8?B?M0M5eFRld3lWdWhIOWdOK2J1U3RVcTVKUnBBeFRYMGYyS2VmYUJRNjVVT2NK?=
 =?utf-8?B?WTJ6WjQ0TkNaVXpWRUVoaVpCQmFFbEQzRHhKTCs4YUFIeTRqY2pOcVVtSTBS?=
 =?utf-8?B?dm9pTi9wd1FyY0ZoSWltOVE2M253YTRLajVsZjN3VU0zdGZPOEZ6SzQxcmFw?=
 =?utf-8?B?a1R5akdudGdqV0JUN2c5YVA5eVB1cFR0QXhIR3MwVXZLYzE5SEdMRWt2RFdU?=
 =?utf-8?B?TThGaU1DbFVNUVp5ZHRwU0FNbmtTYnJlb0xqNCtjRDNSbzdnclBydk1UeUdP?=
 =?utf-8?B?L1duWDc1bWk5YXRGdElDN0lqQWpXYzdjdkdCMTExUnZvK0toRDBSSmZXbkdV?=
 =?utf-8?B?RlBaRDRqRmxpRVBTRFB1QitlQ2JKVXlXYUoraC9kNk1qbi9zTlpFVkc4Q2Zz?=
 =?utf-8?B?NjNBemxXcGdxRU95TzRUY2FITHdvOHdDMFJqVzI1Sk52SVI0MlpUYzJwL0E1?=
 =?utf-8?B?NlBtL3ZxVnRYTUVjajNPaTFnZmkzUXJSMWxGZUhiTDNRRXJMbWo1cDRPcGJK?=
 =?utf-8?B?cDJkaHNyVXNadXFRYjRuUUdObWVzZ0N4bUdTeFluTE1LTUJXK2c1UmloZjZi?=
 =?utf-8?B?eTZISEd6UEFqVTRCSkdicFlLTXJXdEtaMFpYbGVSa2kyQ2RtSHp1V1VoWHVw?=
 =?utf-8?B?Z0ZXOUpFcWZiQ1NPbFQ1ZUE5MmtVeXZkbnJTcnZvNGJPcUx6LzdtT0NMelIw?=
 =?utf-8?B?N2J5V2NjWkd0dlE4aG1jVnhlSkFOMWNTOFZ6a1ZWWEoxdC9XVVpjeTJrNUky?=
 =?utf-8?B?SmNwYzBiSUlNazZqU3ZybDRkZHJWNVZnejBEdDdDZXEvb20yKzdFL2NJMWl3?=
 =?utf-8?B?SlAyek0vN3JSOXFacmt0SytKcGtHOHF2TWZNVGwvNHpxaTdXTWJleUVTczVq?=
 =?utf-8?B?aTZPSFlrSFBMVnJlNStEUzQydXJTR1Jmb0tKZ3dRUHhLVjF5alNTemd1V3lI?=
 =?utf-8?B?NWkxdmVwRFVibFVENVZrTXdDYkFUNTNRZ0x1aFZrcFdSb0pHZll3amlqbHRh?=
 =?utf-8?B?MTkvWjF3Ry9iNW42RzdsNDBzQ3pPL0VvSWIzUWJkNVFRaWdMcXZMT2hvS08w?=
 =?utf-8?B?aG9ac2ZqaUxGMGFQdnBxd2NRMkEydUswNmppa2ZGN0ZxN01Ia1o5bTdwM1ZY?=
 =?utf-8?B?MVBWbmRTTEx1c08raE9uYm5UZFp5LzJsZnNuSUVFOFVON1ZIV2tVQXlrcFNz?=
 =?utf-8?B?bTM0YUFHSXk0SUFpWFVDUXJvbU8zb2RRbGpxNnZ2bFBiRnl4SFFQWWp2YWZo?=
 =?utf-8?B?bHBlR2JtU3hqSUlEbi9CdGNtRXVBVWFNRkQrRE84SHpNbHVXVjhCZGtpY2F6?=
 =?utf-8?Q?o1XtquE24MqVjvn9siQYhws=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d4cf20a4-a127-4692-a1de-08dc39014e2e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 08:34:55.0314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrMMn+2Y/1LpU+InzY4tHzBv5fHPf8E9eNdy8KRdtdR3ARNQMsLnTHSB/th9XW5xuJKwoTLkB4w4N2fLh6aAPnaL4Ukj3F7qI4xuwExPSEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9727
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

The current implementation uses generic names for the power supplies,
which conflicts with proper name definitions in the device bindings.

Add a per-device property to include real supply names and keep generic
names for existing devices to keep backward compatibility.

Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 drivers/usb/misc/onboard_usb_hub.c | 49 ++++++++++++++++++++------------------
 drivers/usb/misc/onboard_usb_hub.h | 12 ++++++++++
 2 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 81c001fd38c1..1f3e0094957d 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -29,17 +29,6 @@
 
 #include "onboard_usb_hub.h"
 
-/*
- * Use generic names, as the actual names might differ between hubs. If a new
- * hub requires more than the currently supported supplies, add a new one here.
- */
-static const char * const supply_names[] = {
-	"vdd",
-	"vdd2",
-};
-
-#define MAX_SUPPLIES ARRAY_SIZE(supply_names)
-
 static void onboard_hub_attach_usb_driver(struct work_struct *work);
 
 static struct usb_device_driver onboard_hub_usbdev_driver;
@@ -65,6 +54,29 @@ struct onboard_hub {
 	struct clk *clk;
 };
 
+static int onboard_hub_get_regulators(struct onboard_hub *hub)
+{
+	const char * const *supply_names = hub->pdata->supply_names;
+	unsigned int num_supplies = hub->pdata->num_supplies;
+	struct device *dev = hub->dev;
+	unsigned int i;
+	int err;
+
+	if (num_supplies > MAX_SUPPLIES)
+		return dev_err_probe(dev, -EINVAL, "max %d supplies supported!\n",
+				     MAX_SUPPLIES);
+
+	for (i = 0; i < num_supplies; i++)
+		hub->supplies[i].supply = supply_names[i];
+
+	err = devm_regulator_bulk_get(dev, num_supplies, hub->supplies);
+	if (err)
+		dev_err(dev, "Failed to get regulator supplies: %pe\n",
+			ERR_PTR(err));
+
+	return err;
+}
+
 static int onboard_hub_power_on(struct onboard_hub *hub)
 {
 	int err;
@@ -253,7 +265,6 @@ static int onboard_hub_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct onboard_hub *hub;
-	unsigned int i;
 	int err;
 
 	hub = devm_kzalloc(dev, sizeof(*hub), GFP_KERNEL);
@@ -264,18 +275,11 @@ static int onboard_hub_probe(struct platform_device *pdev)
 	if (!hub->pdata)
 		return -EINVAL;
 
-	if (hub->pdata->num_supplies > MAX_SUPPLIES)
-		return dev_err_probe(dev, -EINVAL, "max %zu supplies supported!\n",
-				     MAX_SUPPLIES);
-
-	for (i = 0; i < hub->pdata->num_supplies; i++)
-		hub->supplies[i].supply = supply_names[i];
+	hub->dev = dev;
 
-	err = devm_regulator_bulk_get(dev, hub->pdata->num_supplies, hub->supplies);
-	if (err) {
-		dev_err(dev, "Failed to get regulator supplies: %pe\n", ERR_PTR(err));
+	err = onboard_hub_get_regulators(hub);
+	if (err)
 		return err;
-	}
 
 	hub->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(hub->clk))
@@ -286,7 +290,6 @@ static int onboard_hub_probe(struct platform_device *pdev)
 	if (IS_ERR(hub->reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(hub->reset_gpio), "failed to get reset GPIO\n");
 
-	hub->dev = dev;
 	mutex_init(&hub->lock);
 	INIT_LIST_HEAD(&hub->udev_list);
 
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index f360d5cf8d8a..0ee515e7feae 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -6,54 +6,66 @@
 #ifndef _USB_MISC_ONBOARD_USB_HUB_H
 #define _USB_MISC_ONBOARD_USB_HUB_H
 
+#define MAX_SUPPLIES 2
+
 struct onboard_hub_pdata {
 	unsigned long reset_us;		/* reset pulse width in us */
 	unsigned int num_supplies;	/* number of supplies */
+	const char * const supply_names[MAX_SUPPLIES];
 };
 
 static const struct onboard_hub_pdata microchip_usb424_data = {
 	.reset_us = 1,
 	.num_supplies = 1,
+	.supply_names = { "vdd" },
 };
 
 static const struct onboard_hub_pdata microchip_usb5744_data = {
 	.reset_us = 0,
 	.num_supplies = 2,
+	.supply_names = { "vdd", "vdd2" },
 };
 
 static const struct onboard_hub_pdata realtek_rts5411_data = {
 	.reset_us = 0,
 	.num_supplies = 1,
+	.supply_names = { "vdd" },
 };
 
 static const struct onboard_hub_pdata ti_tusb8041_data = {
 	.reset_us = 3000,
 	.num_supplies = 1,
+	.supply_names = { "vdd" },
 };
 
 static const struct onboard_hub_pdata cypress_hx3_data = {
 	.reset_us = 10000,
 	.num_supplies = 2,
+	.supply_names = { "vdd", "vdd2" },
 };
 
 static const struct onboard_hub_pdata cypress_hx2vl_data = {
 	.reset_us = 1,
 	.num_supplies = 1,
+	.supply_names = { "vdd" },
 };
 
 static const struct onboard_hub_pdata genesys_gl850g_data = {
 	.reset_us = 3,
 	.num_supplies = 1,
+	.supply_names = { "vdd" },
 };
 
 static const struct onboard_hub_pdata genesys_gl852g_data = {
 	.reset_us = 50,
 	.num_supplies = 1,
+	.supply_names = { "vdd" },
 };
 
 static const struct onboard_hub_pdata vialab_vl817_data = {
 	.reset_us = 10,
 	.num_supplies = 1,
+	.supply_names = { "vdd" },
 };
 
 static const struct of_device_id onboard_hub_match[] = {

-- 
2.40.1

