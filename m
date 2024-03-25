Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC388976A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 10:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71EF10E699;
	Mon, 25 Mar 2024 09:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="1ZbiLPZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2091.outbound.protection.outlook.com [40.107.8.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB67A10E684
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 09:15:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kca5FMVFGiGgZybq9GUp/c1HQBJPGBKbda3HoHljNy4mAmRQgDMnIH/l5oQkZrF43Z6GIFfzNu3odb/3y4puYoPCFbKmOtABdEBlK6j4csTDd0EheCcL6YG+3+1+cYRGDYoABdaUiklW7rXUKhOYxCW86yYl/9Nj4Ba0xPBtu7U5BIfo90Uc3YVn75ymjih2nMiGkgifArXifCkxGTgWqh569sud8xfGy5BmKUtc2UPjqXt3qFMoMbVWl0QpoLQvG9qa9B1kCYd4M+g1+RyMkkpd9tFK+4PkyHB0CRmWP19Bw4IrN0sjyDDuiG9F+HqMiXnlDm8nHAeOa3KvAlqSeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0unptSKVOO0S4Kk7tMMNkESSZKY0eEWlGryJtx3tiwA=;
 b=Es1jypnz/nC/XQExUUdASJKfkL5KM9FXgjJhwSPp+Uv0rG/FOHFi4HbyTYLi5+hvNzXZ+voVf0Y6l23jsPPHBbIqi2vBZYEbk3tYDJMjsPD7Dlo8oZFfbdmEf6qiagzMZjhBE1lp4zCfHdrDuj9qN4hODWa2vIL+wdeog+IMSWc65VRX+DbnyRRM15e9NC5qmlIqKfhYCvCzuYlJSsBwxe0+6OMj/avIaB7S0zqVW9S9AS0KT/tZ2wPEpCWouJW3Lf9ETKuhD4iS24Yadp8B7n/ap2dmIQpDBcOzwK5qdv8F4A13t+kmhMhCX7z25Vwp1kcmQBHESbulXByKCCz3xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0unptSKVOO0S4Kk7tMMNkESSZKY0eEWlGryJtx3tiwA=;
 b=1ZbiLPZtU9rUJExJCc/7iz+fMu6EBsVHACqj1oSySqO/FrHju2LBQT9PzXLJ2JairVuSXMRLiK4gQZ9JWYdpJJNnhEDt/l1mtYvrjqXa1a8JzXv6z+trJA+AO76Z51gR+U4DmfVEvtCMWsCz0LocPdxawS4xieiCHXRmr0Vt5a8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by GV1PR08MB9916.eurprd08.prod.outlook.com (2603:10a6:150:a6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Mon, 25 Mar
 2024 09:15:17 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 09:15:16 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Mon, 25 Mar 2024 10:15:11 +0100
Subject: [PATCH v8 1/8] usb: misc: onboard_hub: use device supply names
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-onboard_xvf3500-v8-1-29e3f9222922@wolfvision.net>
References: <20240325-onboard_xvf3500-v8-0-29e3f9222922@wolfvision.net>
In-Reply-To: <20240325-onboard_xvf3500-v8-0-29e3f9222922@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711358115; l=5389;
 i=javier.carrasco@wolfvision.net; s=20240320; h=from:subject:message-id;
 bh=5T1dMaMd0xvmCl7kbx41CmuaabqecJXOCCXIkTtVHnw=;
 b=RztiE2W9TaJhdvr9b38KGlqCRigEJsZuQil+WxdfK/krctVX7/dkxX4/ZRXPg267hC2PYJpgc
 6/EqR1nRGSLDiWJHpjohyTtkmLjrdw8qK8yADxTnLg8wEMPmDQ5+byH
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=Vxk2/0sGIxM8rsKnceszFuSuHVfQwa1Yo8+is7BX2nY=
X-ClientProxiedBy: VI1PR08CA0223.eurprd08.prod.outlook.com
 (2603:10a6:802:15::32) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|GV1PR08MB9916:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f82731-cc28-4319-5271-08dc4cac1607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qX3cckL0zv0ji2df3DGq7zZGtMKp6M6PFbP4ioqGM5dE0PVf8n8wEjjjNjAJJOtDRujwnPICejcH1mPQQNXqhB2tH96jr1ZR0QQxjYS+apeNjXRO71W48nQOnJe7b5WagLPM/GcG0aG6M/wD/A6hdaJxDrYkcXPTXQpGMot6CxRGx/hGbzq2Cvw35m6KO4+iULE0zuKCEtwLEY2029T7It8qfsAFpTPrTV5KQbPKAqaQY6ypJNMEG3vZPuNpXXUlDmfO9KrenwBuP3H8/kYhox8xSJL6Kx23A/qM/eS2iXoFza0xuL44uWw82Se1dGBFkSyIOxswlKyIIKKDHoc35vZppH9dQ3kO31NzNV88x9dtzwU4zsU54rsk5Xtykwhv+9LGeXNMS3cFSBwPlnB8ozwg1udeBOqCfxKLpjJNbB0AE+K+oPzZSrwKq2DKyQqzVn1Ajztg2hdwy71eTPPtPN+0UEX8cko+GGGfWnSEOCRPkNSfAtYMghGplISxpeAJ1BkZM49nr3uHGArtoRIv9kSrftAmLEBpoBNEy5AdnxLuPN2dYDN+681XVSt+njNizBa/pIp0HkMSE7igcLigY6M1/LJQ0bdZqXPNFved7rn/zPX12dO0l8JYgWILZsThT4KamzVbSuXPpeyR4rGlAZrxVMN+zn1OCoCcVboaf2v5qm0q9wbXfXmj0MUYEQrHR8F/OjEUlQS1LErpVyc8FlRNzIUF1ylcOXcKKvAUU9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(52116005)(7416005)(376005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmRMTTM0UVNUeFJxL1lEWjJ2YVh2ZnhLdklrdm1Ib0Q5d1M2U0FIZTRtenoy?=
 =?utf-8?B?N1plR2NJU2U2VlZmdTcrVlI3MXVNT1p5akV1YlVwL1p3ZGV2N0dUK0gzZmMy?=
 =?utf-8?B?ZXZ3YXFxQVEzUlV1c2VrTW1pcGJMSHdGblNSelhJTHdjMXZKajJoSDhuQU9t?=
 =?utf-8?B?c3phaEl0YkFaZTlBY0I1ekVLRVhKWDVGcUdUSE1EZjVkWmZUK1g2NlUzWUEx?=
 =?utf-8?B?b2tQVjEzOHZPelNaZVRvU0ozZHdZSlBCMUJ0bUlNT2c0L012ZFU2b2VsOExR?=
 =?utf-8?B?cFpOVW1zcWd3Q2tTc2V5dGQ4czFxcVpvTWhpWDBFbjRDTHdZT3pWLzlJcE53?=
 =?utf-8?B?NXVNZUJyODRVanU5OHBXM2dQSzh6QWFrUmRCQmRNWWlwQnlIcjRRS2JjM2N1?=
 =?utf-8?B?SnBYZFZXdStpTWFSajcrSU4relZrSlZDQnE2Ni9CdWxTUU1RdHFTNVdkUExI?=
 =?utf-8?B?MUt6dTZWRU1CdkNZNDdtYlMvd3pBTkpZU3BlZm9lNy9nTVMvWFB6cW1qeWJG?=
 =?utf-8?B?TlF1M2VRc2paNnZOaG1OTEpmcTQrZTFVZlh0V2NOUkkwV280Mjdkais5QzFE?=
 =?utf-8?B?ZzNUMS96aUdVZ2xiako2ckljalB4a0syR0U5aGZrbXdDTnZCb3p1Y1BNRFJl?=
 =?utf-8?B?NkRjeitib0lvc1ZIY2hYT3IwS09yekw3bVZGTGVlOU1sTXF6K2drM1M1MXBi?=
 =?utf-8?B?MFhvcVBHT2Y3bXFmZnF3cGhGUDd1OG9Wc1NYY2EramJ4a2ZYOGZhSVhpbWp1?=
 =?utf-8?B?U2dsY09IK1EyaVU0RkN5ZHVlc2xTbTlrcUh1d0VQZFBkUllrbmlIaXJMQi9Y?=
 =?utf-8?B?L1BKdkxyV3FzWS9IbzhaTCtwZEx5bFkyeFRESGUrcndzK056TmR2SzRBVGhP?=
 =?utf-8?B?ZDVSbWFXQ1BZeGE2T3FaUzVxSnZxVUUycGZZVmY0ZGgzKzVSdzVTMDVVbzZz?=
 =?utf-8?B?Wk9sVGZEMEFXV3ZXZFRDSjlMTGZZZkpySGdKTllmT1pwNHpNSU85cTZObE9t?=
 =?utf-8?B?eHNUOG9HMURiT1V4SzhKSGpvQm95ZVlmS2VHMDd1MkQ5RmJYT2hjR1cvZnhH?=
 =?utf-8?B?QWFKa0VtemhVZDhPUWd6aWNOOU5tZmlWQTNxVi9jdmdMbEtiOWFKTVdTcFpy?=
 =?utf-8?B?ZFRKekpLZ0dweHdwc3VJZ0dKWFRtVFN2Sm9XNVBkSHlJUGNLSzduZTdmV0JX?=
 =?utf-8?B?L2RlMUpGVENacDBRTmU2SUN4N2JsbTZiUWgwYVpDVkdwYmNxUngzc2I1MU15?=
 =?utf-8?B?clZIam9CMFdLcTZEazBQRG93eGNMYnhnTEdJWTZoUnFtc1VpVXJQbmQwWXhY?=
 =?utf-8?B?QzZqR1EzbWNZSmJaQnBKQTA1VUo5SlI1RkJPUnBQSFJKWjRRaXBtS1RwU0NQ?=
 =?utf-8?B?NDF6WlJzMXdMejU3TXdaNW9CVnArVXIxa1huaFBmRGFmUldhdnFCM1BxMlox?=
 =?utf-8?B?Z0hiMnUwYXNhaWhobFFiSUZYc0FJTXRaSGFGQ25OTkw2Wi9BQ3hnWVhTK1FR?=
 =?utf-8?B?TTBoMm9xZzJGdUZwcHNpUXdvcjR2am1GTDk0aHFCN0FNaDJXeUd5YnVOVmI1?=
 =?utf-8?B?UHFlUW1sRHRoYlZiVlFoSkhpT3ZFcVVIVG90NjZ4TG50VXhWTE9UQm01elMy?=
 =?utf-8?B?TlZVODdXYkxsVkpyQWFRSXE5eGtzOUR0ckxWeXk3YURzWEY3Y2ptZElQcUdO?=
 =?utf-8?B?YjkyaEpZeDVhZGlSZXlJcXdtZVlkbjBBeGJnb2g1Y0ErZFFTcUxDMFdoZmNv?=
 =?utf-8?B?dXhHaFB6WVRSUDFLYlFMcGw3SlZkSUdKOXFEeEExSWNTUGVaV2dwc0E0c0xh?=
 =?utf-8?B?NWZPMlhUQnU5ekY2cEhxSFBpZVRleGllNkFJQ29MN1FRelROWmhIQkFXanh6?=
 =?utf-8?B?clFqNUxCWGZTQVAyNkhQWjdHa3QxeUw3bnJlUE9tQ2JWV1dGcWpZU0FGNHRC?=
 =?utf-8?B?Q0tWVVFkaE5COTg0VElNb1JDQjQzbU1jNERHcVM3aVVqVU5VYkkrdE90TDFY?=
 =?utf-8?B?MG5FdDRrL2JGaXk4b2tudEtyVFFGUGx2dXUvT0RKMjNvb3NOR3FhajNIREVN?=
 =?utf-8?B?RzMvTE5MSVRUeFdGUDhTMU5kbUVwZEhsM2VYa1lGYU9PZkhXc3hndVBTd1Nu?=
 =?utf-8?B?T05mQTBBY3d2b3JGcTIzQ0VZTnFybXUrYTZuVHlzN3ZXMi9iR0tCMWRrREUx?=
 =?utf-8?Q?XSmNl69ciVaHgOnpTyq69lA=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f82731-cc28-4319-5271-08dc4cac1607
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 09:15:16.9120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuCwcZe4mYFUa/BBIgU9fufm5z+9Tz1cD838gvHGdl+/YxfuKIA10OlENUAFjKvPdkEDv9TPQXbWzqSbF+MvS3N6rpC1E4IOxHRs1uAHvdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9916
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
 drivers/usb/misc/onboard_usb_hub.h | 13 ++++++++++
 2 files changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index c6101ed2d9d4..5308c54aaabe 100644
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
index b4b15d45f84d..edbca8aa6ea0 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -6,59 +6,72 @@
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
 
 static const struct onboard_hub_pdata ti_tusb8020b_data = {
 	.reset_us = 3000,
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

