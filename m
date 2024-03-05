Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFFE871572
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 06:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651C711284C;
	Tue,  5 Mar 2024 05:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="Cbyb8WBK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2103.outbound.protection.outlook.com [40.107.247.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F2E11284C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 05:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PE5edMSZl5gqbpGCcacbpTNT/a+Tesl6JW0reBAI75R9ixMxACj5ED5DA0QnGQH0t+yovNSrCaTjzh/PoL6GXh7zsL9YliJEKn1xFlG120F3UUkvHTMEd+G7ogthTBK5JrUFHicpgZoP7DXeb1aL8ifWsXcdK17eoUDuLWQNEWqjgM3OuxwsYsXZBSITwFoD/etD6ThHWzObBTMTJ1MPXI6msQG1tWu6Ns/5eSCrJAR4EjJmQ9zhOrSU/ThxKUmUuGbS6YycAKqBBPuNyBZUjvrRjFxFZ8r4bJQa4CTJN7yuSO+R5wmptWM/R8WtKZs7nxPYcbdsEEPAMMfgI23qoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Sv/dmBSgR8EmzNvZoJoI/UpeZyuslotiSuh5epalWQ=;
 b=KPc4nBgsUP8iByYajwS59DspNG0icIWmD8ug/zpsyogN9qSQZqsFk+GR1abkC9FlmJ/L0BzKdS/9NlCwCOQvO3h/RZNZTYNFzFP2jSSJJD4A8qmIC9F5ecrYt3vpCUCoGEChP0lDZp1ZCsKbFrLMFtJqbseysxe8DsNmJdBHchRefS5gSbZN1dFE1qsEknq/DCXOG4wbu5qhaRaH9u9jC5cXDwR/IRD43YtkBujEGNHhztRMstV9TaiEoUMVaqvPKcnXXhB4ZQsAh4fns2FwxVJ5cDIvPzjVcIf+jygdMp1+RYL60RQLSU+kHlsmg8cnRq+oVrW6Nmw0nMkrw9Xilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Sv/dmBSgR8EmzNvZoJoI/UpeZyuslotiSuh5epalWQ=;
 b=Cbyb8WBK12GjwpHeJVcPwtW/9ZIvJamzPyektBJto5zWLIeDCveyi0S6KBxkA1Q1QQbP2SUksvyW3oMeMUPcZlVLd6FJ6nO5NaY0O4loP4ljRXFnisaSlw8VztPiu9ISNxpxFEfwrMgve1dYX6wGM+ur+N/e/oX89lcsXcWoUtg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DB9PR08MB8385.eurprd08.prod.outlook.com (2603:10a6:10:3da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 05:55:12 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 05:55:12 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 05 Mar 2024 06:55:02 +0100
Subject: [PATCH v7 2/9] usb: misc: onboard_hub: use device supply names
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-onboard_xvf3500-v7-2-ad3fb50e593b@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709618108; l=5246;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=hLEAZIEQz6ksQuaNqwCOXTPaYxX3asHHadVtJggQpuM=;
 b=T5f/KljSE7T1xv0p5NsLGsznYGcVQx5F4Vt4OzlPioOgPz99P/cFkqNP+89zQmmQcTjrYxuTq
 HSLteXBSCFkDBXIJ3zwlNV76pSc1oupnjfUpcwk635xLl/97Dsn+cCj
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR4P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::18) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DB9PR08MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 36f1a7b9-96b3-4851-af35-08dc3cd8d287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rboD1bFAcAQuZiRaj62lC5zPm91b1c5ovRDbPmJOFlLfrJ/1WlnuWyTQ9ep/oJ9DbXjE+ia5A23+8lOqgdP7bzdzoPRjv6e4Z4SSOgYH/4647Fj7cntgAs5arytFHYs7c+duKn6VTBD/r7Glbvry1IPOP9JylOvCdR9FdZcQ/I56UC0HhxuC1xdj3KWitk6T2bSioVVKekhJdsfkE5bxbcFRjmCQMY19IvqCp+w16H4Q0XX4ZSJu3v/TFxdfwr7KD7giNpD0ekYOn6Lx+LlvOlLn9ldRtxmZihhlPdTSyBDFFHs+Z51OY3k1WdNQ8FRw2oNM67oeh6NDR/lcWDPFpZroDdRalqtnpBoumR6x32IOgzVXG3YtJGg3uHCDMpBABC1ld10JvwlvUjxSujmCRcQ/NJlKDP+OOGiLDpcpsn4sVs1rv2ND95sS2da+Md1nWHP4q8OL8ENpmi+h9u/2H4MTMxivlCc8YUuudRk1e97p/9vXeINGDAQxce6q+MQNx9HBa5F1aXh+yl320V5Xh1/4q+uI54mI2V8HrGe1tm0gAj343e0J1wijh27cm1Jy+YRdE7UE/vInRhdJZZGatzTmaQvHvCb1XQxY6RlsH+TqlkRVjEeV4rG+FSZFl5/Xd/GPVOvo3Y1Yue931hvFuClLz2XthB/UWyeSOhF8eZPhoybBHYHH3QcQDNUyi3jHrzut69O4SZcD6kM9y4dt2MdBEU2Qp2g+0QXg9BLz/PM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38350700005)(921011); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE1aMEFwd2M0dXlsQ2JaSUVHSjRsU2tMaktaeUxqS0MyVmNtdFRSZVVZNENv?=
 =?utf-8?B?a1U3UnpBWEZzSVowbFJwR2ZaT0UyL25QellleG5vTUdPUmZRaDgxNFA4Qmhq?=
 =?utf-8?B?UXg2cTVnbE9qb3dFN0lSZVJOYTBLMXl5ckpLRlE4c2JUZWQrSGpvTTZ6UFJL?=
 =?utf-8?B?NUpMdFlkdnRlcVNWZFhUcjg5RnJadTJCYmxxU1F3dEd0S3NvbmMrcDF1cUhl?=
 =?utf-8?B?TXc3cmFWV3NEaCsrTTJ4NGd3ZWZ5WFV0ODU3aW82eldVcCtHZmZ4YWhzOGJ3?=
 =?utf-8?B?V2dpL2w3OW5ySENPN0lvL05iNmFqSW1JbFZwTEs1RXNRcVJXaUJuOTd6dG9Z?=
 =?utf-8?B?SnRyK3BtWk85T3o1VGtyL0g0L0w2YTdwN3pUODZMdW1UK2pFdGVGV3RzbnBC?=
 =?utf-8?B?c0hVNXhUSTkxejJHMnNYaDV5VnZYQ0dKRE1HSFI0eGtaT3BBVVhreFhOSEox?=
 =?utf-8?B?OTdUMXRHeCtveTI2RXhQbzROWDh4emQxT1I1YUduaGo0LzZCOVhvSFYxbC9i?=
 =?utf-8?B?VDFSSWJBVkJQVUpIL1g4QUtNMm96Y3hhL2dHcVVZYXB0S3RJZU5hVlI3bmMv?=
 =?utf-8?B?czI1ZCtoT0pSdlFDZEpwTGVLRk5OSENmbjZuMWtWRnNDOW5KdE9OOWZKdHIv?=
 =?utf-8?B?SlRtbHdhTlRLRHNoRWw0YmRVZUcvT2JzV09seW5lcW5zSGI0UFdDWTd3NGZp?=
 =?utf-8?B?czhWM01UNml2WFdrUmY5Z2NlcFVUZzZ1VmNNWGVFdVNXbHhhRkxmaVdXdzQy?=
 =?utf-8?B?Q0wrQWkyeUw4OEIyV3pNWEMvZUJmWVhOdmQ5NnUrN3JYWUVvSkxlRGhTK0dR?=
 =?utf-8?B?QUo0ZHQ2NUg5UzVZenN2VGVmZ1dMRjNNQm9ZaTBiNjVDTFB2MjFEL215bjUw?=
 =?utf-8?B?eUVUc3k5M2pyMU5mN0czZmE3K0RZbTdlQm9ZYVpLcFliWDVoZTlva0xaZVE4?=
 =?utf-8?B?di91THRWb2ExQUp3WTRKVmhtSWg2RHJENnFGN0REYXZBV3Mrb0h6MkNpak1z?=
 =?utf-8?B?L1NvcCtCNWpnTjFFdlhmQXE3V0xGVDV1Z3luMk1yZGhlQW1YK2JSMUFERVBW?=
 =?utf-8?B?Y1JaeDZpTDZUZys0SzFXT2JjV3FMN0daVjREemoza1JLbFU2M3dxVmp0a0l5?=
 =?utf-8?B?VGZXaDZuVWcwL2R0ZHorTHJHVXQvWGk3bnBaSU1QSWxXVHk5dTd0QW95c0V1?=
 =?utf-8?B?OUJuODA2d05WeVBmUkxPMkxRTjByZHZsa0NBZzRVVXdRaFBsZVV3VjQ3Vlht?=
 =?utf-8?B?NFAvTHZYTHVBN2ZOZXdubkY4S0IrMGE1MVhEcTE1N1BFcm40bDVZZmtUSmov?=
 =?utf-8?B?YnJtK1NGZ0pJY2FvOGRPU012MkxPSjh6L1B4Qk1MQjgvNTBLQ2VDNlYrcHBu?=
 =?utf-8?B?ZExJUEwyMXpvVXZaRDBMRUgwWCs4QUYzQnc2dmp2OC9GK01WNFV4RDBtaGpo?=
 =?utf-8?B?aElrSmxRWUhFd0JocWZJZEN6S0VyN25NVkRBczAzRWxrWXJPVUUxcnEyblF3?=
 =?utf-8?B?QU5aZUI2b1V1M3lGZ1dIWXByUkM2M3orUXFldGxZanp5RjBMeXd2SEhkbW1V?=
 =?utf-8?B?a0N3NlQxWnlUbG4zaEJiVDRaRHdieW9tVGNVVURIcjZPWE9nOExmbXRiODdV?=
 =?utf-8?B?N2xFb3dSRUlRRGErdktwU283OTZyT0lnNzRZT1RLeWZvSjdERE96OG5UVEZ1?=
 =?utf-8?B?bk1HVWhGRk9kUk5HVnZoQ2RBeEdsbWpMZGxDdENCZ1lNZ21KK1FjdjRIUWEw?=
 =?utf-8?B?ZlJrenFtUTFTMnkvYXEvaTB5Sk15bXZ1Q3N6dlcyN2cwUHBvU1ptdWhFRXRt?=
 =?utf-8?B?U0thVy9QUGpEYVg0VG9xdGpiNDNJbG5TZGs4VDRSMU9mK3g2ZWVjSWlNR2RT?=
 =?utf-8?B?WXZmczUyYnVDZXVHVVhwcDA3WGZkNXdIZ2Z1S2JQVUJlYWczazJ5eDBONEYr?=
 =?utf-8?B?enBhaW1Wc3N5S2NaRklaeVJLcGVzeGFuL25HZUNiWlF5ekZYOWNhLytQWjdp?=
 =?utf-8?B?dGFQWVpLd0czZTVIamRVOG5xZVpkVmVqVkhBdVpkbmdmUWJzQ015YUUyMW80?=
 =?utf-8?B?NXh1ZjhGNE5LanYvREFnRElmYU5vejJuU1hadXhVcUhOV3NtalYydEVXWFdu?=
 =?utf-8?B?WC9OU29nYXF5a1o5cUdlQ0t5YzEyS0FsVWhBZERvQ1hWcVlwRGFZK0Z0aEJ5?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f1a7b9-96b3-4851-af35-08dc3cd8d287
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 05:55:12.3468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LzEa8zdTRI1A5K9kqGVVGQ4iJN9sgFU7pd4CGgH45sP6YTl2E8GnA2aZw38rXcmfGhVHl0Nmg1nc5z1izM/VMdsFPdPJ30KQ0ujBJhBJI8=
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

The current implementation uses generic names for the power supplies,
which conflicts with proper name definitions in the device bindings.

Add a per-device property to include real supply names and keep generic
names for existing devices to keep backward compatibility.

Acked-by: Matthias Kaehlcke <mka@chromium.org>
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

