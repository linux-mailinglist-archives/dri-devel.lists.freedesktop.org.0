Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A58D871577
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 06:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E595211284F;
	Tue,  5 Mar 2024 05:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="W5csrf+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2103.outbound.protection.outlook.com [40.107.247.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9465511284F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 05:55:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4wBhiPtO+eUtXUzdiMEMC8X3rKCdQUWQfIp2278zk5Dud7nIpdB7SKIPmOB4d732REFYe3zX++xapckfbDtncuih5PNPweLXHdtAoB6GT/K4SvSObmAHmr298Axge+yTrqROKAhTqQkUjIg0uB7JXN5nvMa2rhammCqaAN1gu4ugblzuAgCYVim9CAXBa0BeenYWObmo6OUCqsbNQcWm8fITMOG7V4TkCqN9p/MU2t6aaRlas3h4sOe53l884Zx4czfyP3xjxekqT7cofNAdlbGrnDc0AH/ruk6AzY4NDJ1KvfRm4+vQtIfgcxjRVA0R3VdiJ0f9k5xpExt0M4euQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1CdGpA9y443e3RqRh+YFYO9AtKfAMW080qGmyfpPo4=;
 b=RrvURRx5QXpaSLMeppACCxiueKYs49prbebtMmm5E7rSD9GY4ClnhN8L6Dds2F/jRxS8C1UqtPcNhu0Nm2EpdvgGoAyGjUcAaH7KzgJ3ujwCVQVolqdKdQmWqMikp7b6mU0MH7QlVOnW4XC6tcSbMz9sJSij+UbMKOPTRoG2YXF3zappD48NyH44Xfi99J/K/drVLEP6+i5oBb3pbbJF4qfx3I14q5kCDbRxhkf62mdw/j/3TghquNGw5eyUIAmg6N/Z48zPDMm6RYt/usHiqDW4Jd0AR1G2xZhsTA4og191UBm+2bUxErB5tj/vCBE7JqHfAFZ9aLCAiZVvqCyaOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1CdGpA9y443e3RqRh+YFYO9AtKfAMW080qGmyfpPo4=;
 b=W5csrf+aCOrROERv+DLxg8I9wj30SOZtaYk7Z1VXzpSVyuKROgmsdRGa/5l++OL6inmNSrvO0O9kwEuo/ucf5x+2obLA1g1GOKVLcQdvG5+7usdLqruU3JAJkbXqpNDUCb9Hjbvb9gg2A3NwvzQ9ntfRhlgXo4dDK1XCVjEMDKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DB9PR08MB8385.eurprd08.prod.outlook.com (2603:10a6:10:3da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 05:55:18 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 05:55:18 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 05 Mar 2024 06:55:07 +0100
Subject: [PATCH v7 7/9] usb: misc: onboard_dev: add support for non-hub devices
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-onboard_xvf3500-v7-7-ad3fb50e593b@wolfvision.net>
References: <20240305-onboard_xvf3500-v7-0-ad3fb50e593b@wolfvision.net>
In-Reply-To: <20240305-onboard_xvf3500-v7-0-ad3fb50e593b@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709618108; l=3971;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=wHEtQy1snznHud7XugAlCGlHC2ytRi60iRhCiOKvhRQ=;
 b=wRJDUqanRxqeT9+JJ1vwwr6UBao07gzhCDfnXIVTwjfONNszgk29KaNHFtj53SlxXtOrQORJW
 HXwSXiHb0b7CaAaaY84qCC32z/BeGhx8qkDKoK1LrKaVbXT/RtmmCik
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR4P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::18) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DB9PR08MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 071e3fd1-3324-4eea-fd39-08dc3cd8d620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j+b7KErJzEd2IgNME0u7NMKcEykvZtY3vz+aiki9NWkl3BEr1SRCLa1fuvMyiFplzqYMGFZ0uXyWtXmKSMoJKVzSWfdH3nQF2eMbpl9nGWiKEQ6rBFJfthO0UF8RwDYV1K6Be3wBGhk2YYiKZ5dfvbKjpuD7Zln4iZ0KLkcFf7F6Jlmr4d2HyPuKjaQ7iqA9ZHGBCB65V6+qEaEfVS9OFiynt8PAL4a1G9igXtR944vwCY6UYxqXG7HDzChOTUEldE9QY4MBeN3Kc4ErOwFdTl//KtdkhoHAjKH9ddKZ2+ofP6z9UmsOxKC4k59wfsGiztZi4moIie+qnzKsMEYcJ4so644iU/X/XmiR8dI18RYKZbdvN4b6hSRKR2YIfbeNKNzRXmd3zNg0bpMpkdf0yZrbxoA2+1IUx6i+t62QnS1+tiSO5dWzHAazjd2XX5lg76DZkPHV1u4AyhBffk+iJ9PuBGlnvRfbwMOnRunR/2v6idh/E0aguxyT/dfy4FdB9jxCb0r9Kj10qyPAPkHWpAI1gqcmU6qLKeS3qJFJKMNUvi7rEjP7xOGQdyFIMeD6hUQBYfQdfEJ7Yi6D/cOyoCkg9ONaHuzBMCxpl5de5+ofGcdJpiulQpwOJrMQj3OFpq9qpa2zpvagR4IbkD7j3hkVNf5J7ryKtJhuN4zuBMYR23BXTMp8MAVbsZ10hrTpIu+2KdyeTUxM4gXiS6eZqibo3AhYW4Cram8XUT7a2lI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38350700005)(921011); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WCtHZk9pZGMybzRkVk9mWXVyR3RoOXN4Rzdpek1lQm8yQnp2U2xkeEVNMDFY?=
 =?utf-8?B?YlprSGIrZGpTRlRaWHZ0UmZPLy9aZHNmeTFWYWtHSlFWdVhnRTAzZTlBVm5Y?=
 =?utf-8?B?Ylo3djRZdVVOVDNMYWM5WWxqemtyR3ZOY1BCSGFwMEIzdGtKTjZtN24zTXkx?=
 =?utf-8?B?MlRHaW5vQ1p2R1VPN0pyVGhGZ2RFTi9jdHZZamZVcjIxNlkxVDNaYmQ2Nnkx?=
 =?utf-8?B?RTQyQVc4SFErSExrcWlTb29YbHNnMnVrQ3RoTGRZSWc5dG5oWVN5d2N6RlVM?=
 =?utf-8?B?WjlzNWJJbitGVXJHS0pjZGsrRWZRODJkNW9TU28xZ3ZBZ3BtNUpLYllwd3My?=
 =?utf-8?B?aG1SbHVyUWkrQmJ4SWtHNklGQjlWekxHcG5sV1JOUnM4VTBndlVCbXppelZJ?=
 =?utf-8?B?bFY3cHVyTGIwUDJrU0Mxa2JYMG1oSEtHR2dBendRdytWajh5Rzg2b0tFbHkx?=
 =?utf-8?B?aWxIWGNtNFdKNkNYWHRwaTRjODY3bU1Yckgwd1AyM3JobVVlZW94YkN3NUgv?=
 =?utf-8?B?ZTBpRnZYZk9tME1WU21BRkNEcEhidHVSQVpXTDVUU3FLUCttajF6NkZCYU9t?=
 =?utf-8?B?b2FRbzJPSzk2Wmg0V2dWb2VmVDdod1VzT1YraFJnMlpHZjBpYXhtYTBNY3pG?=
 =?utf-8?B?ZGoxL3MyTWFKVEljUTBkTkpoRmdyOUZGUEl0UnA5YTUxaVhFRFU3OStWVVhT?=
 =?utf-8?B?bTJQTGZXYjM5bmdLQW11MS9oWGp5dmxPUkFheDJwcWpLTzQraVFiZ042cjYv?=
 =?utf-8?B?U2NMeDhiWGpWQldTR2lLNG8rektWQ0wzZUhJenF6ZkJVdjkxRGkwb09RWjFt?=
 =?utf-8?B?N1N5Sm0zdkR0TnkvUUxtK3hhQWhvQWpFQjBCS0J2NTlWRHc2WjBFd0x0YjN0?=
 =?utf-8?B?QXdMcHJnV3huSVBlblpCMmJLQUQ1c2RGYWxqTDE3NTA1QUtkQ3JQNXNiTERI?=
 =?utf-8?B?S2owbXd1bFdNUVBheDhUZzMxUTJ3QnR6MlBhZnR6OUtJZjQ2Q3RrMVVFL1Zu?=
 =?utf-8?B?M3hCbzVmcUF4N3Jqa0NqaDlOdU52Q0xyL284cnhsT3VjSmJPNm5QcVE5Z3Qx?=
 =?utf-8?B?NUY0dnFGZk5vS0lxV24rcEJ5UEMxdjlNaVNWNTY4UFJ5V1Z3aFQ3QzRkZWRE?=
 =?utf-8?B?ci82MVRoY082aTRGZkNCNHIxZkxUeHNBZE90NXE0NUlIRFpDT2M0WGdWNjYz?=
 =?utf-8?B?MWV6NklWRmtadHJDSzlrQ09mYTlsdGkwQVR1bWNGRTdhNFdRci82dEZ3UHNj?=
 =?utf-8?B?VzRxUlVTRVNQeWR0Z0F5SW85Ynpoa3NFaXFiRkVTSnhNQVJOdVBnMEtqV2tR?=
 =?utf-8?B?K0JseSt1UmpQVWI0Y3NxMGhFVzExRlFkUENKQjJDWjNid2tLcUoxMG1iUHhW?=
 =?utf-8?B?NlVObVZOcmx1bUgwcXhjMFhQZFB4NEhBb3JNd0VnbTM2WHhoZ1I4NmlNdytC?=
 =?utf-8?B?THV4U2pTZVpkNlNRZ2I2dGxKMzZ1YXZabzBLVmZ6bkJ1WXpIRWRmaml5ZHFu?=
 =?utf-8?B?aTNHNy8vMHFCK3d4SnVWeitydFJ0K2RvRnFxeGwwYnhDbG02SUFqVGZHaTFR?=
 =?utf-8?B?cU54VUZhNVJYbWtUK2kwQlorVXY5RDNocE9sUElnWkJxZmFjeFg2K2NsYTd3?=
 =?utf-8?B?NGNUY1UvcnVIZDRib1h3QnJkQWEwSTg4eEd6NjJ0M2JKOE9tNFNQUjc2RmtP?=
 =?utf-8?B?c2xtcTFqQXpDZitPL1RldElsc2ZrNFROVWUrbTIrWDBidk1hSStSbUtEdzBV?=
 =?utf-8?B?Um52V2xOUDNMZGJvazZuYTdVY0tLekZTSGo2dEtuS1ZKdDhRMXpucUZ0Uldm?=
 =?utf-8?B?U3V6TGF4aDhTODJkejNYTWVXeFZHUWhac09lcUJBbzlXZncxenNUQmJUYzMz?=
 =?utf-8?B?elB0Y0NvZHdGS2d2RndzRkpZUStKOWk0R2VpdjllS0c1QkUwL3ZnbTE1MGVJ?=
 =?utf-8?B?eXBSQ2wvY09rSy9sNVNUd3ZZeW44bkhQLzg2R2V5NDRCV0ZObC94MWozdFg1?=
 =?utf-8?B?NEh2UE5DT1BaY0g3RVp5cVg0RG80SFFib291b2JzUDA2djh5MkVsM2FRdWM4?=
 =?utf-8?B?WCtwck1ucTRtdUN0SHFkRW9nS2trT0VOZWRWY1kvb0x5aHR0TEsrNkljZW1W?=
 =?utf-8?B?VHpYMlorclhLOEZYOHYrQUFKZ3FHZi9vTkN0emx3RkxIR2dxaUJSb1dJOHJU?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 071e3fd1-3324-4eea-fd39-08dc3cd8d620
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 05:55:18.3743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acPjnPC28pdT8m+3AXsKpkFMatMbBGpP/iC2+kkOKSK5w6ybtcnnFFVZGs0CJgTCpSo4T1kdusKj1jTajyCaBDFazXgq/GHCuMCvNLqSwco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8385
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

Most of the functionality this driver provides can be used by non-hub
devices as well.

To account for the hub-specific code, add a flag to the device data
structure and check its value for hub-specific code.

The 'always_powered_in_supend' attribute is only available for hub
devices, keeping the driver's default behavior for non-hub devices (keep
on in suspend).

Acked-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 drivers/usb/misc/onboard_usb_dev.c | 25 ++++++++++++++++++++++++-
 drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 4ae580445408..f1b174503c44 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -261,7 +261,27 @@ static struct attribute *onboard_dev_attrs[] = {
 	&dev_attr_always_powered_in_suspend.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(onboard_dev);
+
+static umode_t onboard_dev_attrs_are_visible(struct kobject *kobj,
+					     struct attribute *attr,
+					     int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct onboard_dev *onboard_dev = dev_get_drvdata(dev);
+
+	if (attr == &dev_attr_always_powered_in_suspend.attr &&
+	    !onboard_dev->pdata->is_hub)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group onboard_dev_group = {
+	.is_visible = onboard_dev_attrs_are_visible,
+	.attrs = onboard_dev_attrs,
+};
+__ATTRIBUTE_GROUPS(onboard_dev);
+
 
 static void onboard_dev_attach_usb_driver(struct work_struct *work)
 {
@@ -286,6 +306,9 @@ static int onboard_dev_probe(struct platform_device *pdev)
 	if (!onboard_dev->pdata)
 		return -EINVAL;
 
+	if (!onboard_dev->pdata->is_hub)
+		onboard_dev->always_powered_in_suspend = true;
+
 	onboard_dev->dev = dev;
 
 	err = onboard_dev_get_regulators(onboard_dev);
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 4da9f3b7f9e9..ecdce06ea0f9 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -12,60 +12,70 @@ struct onboard_dev_pdata {
 	unsigned long reset_us;		/* reset pulse width in us */
 	unsigned int num_supplies;	/* number of supplies */
 	const char * const supply_names[MAX_SUPPLIES];
+	bool is_hub;
 };
 
 static const struct onboard_dev_pdata microchip_usb424_data = {
 	.reset_us = 1,
 	.num_supplies = 1,
 	.supply_names = { "vdd" },
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata microchip_usb5744_data = {
 	.reset_us = 0,
 	.num_supplies = 2,
 	.supply_names = { "vdd", "vdd2" },
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata realtek_rts5411_data = {
 	.reset_us = 0,
 	.num_supplies = 1,
 	.supply_names = { "vdd" },
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata ti_tusb8041_data = {
 	.reset_us = 3000,
 	.num_supplies = 1,
 	.supply_names = { "vdd" },
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata cypress_hx3_data = {
 	.reset_us = 10000,
 	.num_supplies = 2,
 	.supply_names = { "vdd", "vdd2" },
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata cypress_hx2vl_data = {
 	.reset_us = 1,
 	.num_supplies = 1,
 	.supply_names = { "vdd" },
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata genesys_gl850g_data = {
 	.reset_us = 3,
 	.num_supplies = 1,
 	.supply_names = { "vdd" },
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata genesys_gl852g_data = {
 	.reset_us = 50,
 	.num_supplies = 1,
 	.supply_names = { "vdd" },
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata vialab_vl817_data = {
 	.reset_us = 10,
 	.num_supplies = 1,
 	.supply_names = { "vdd" },
+	.is_hub = true,
 };
 
 static const struct of_device_id onboard_dev_match[] = {

-- 
2.40.1

