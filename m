Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B7C86B0CB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 14:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44ABE10E5ED;
	Wed, 28 Feb 2024 13:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="nksWASWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2109.outbound.protection.outlook.com [40.107.13.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5336D10E295
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 13:51:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeF8qy+uiXA3HI55U4qIV18yxDbiapz0WM9BRdotXj1eCelM8xUHNt2mDfgqKzkDSiOtlIWCAxHd3LFFV8G5dw0zLob3GQX7cJzq2nMuAA0AZWEYvKfCz6meZ4Qmy1SOue0DN99LEuk8CHTDGdo5fO2ogUffpzDHMNFdDuGR89b5LHtIVKMlj1xH7UBGhackZ63M9pD6fSSryhrWOt8jVR3k/8iPOMG+scMZXT7jpeHL51PVF8m11AkOc7t3XyOedsQgyAEWFH/4qr33ZQKtgn+xJeKYurQrveZiXDxDV72sL9sgNoHGZiWyJ6Qj/hCbtfdpOyBYRvASmDq/1T7Pig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5SXUlle2NVEXwDFcWjTn+XnAibneyXcGO3oVO7aYIU=;
 b=aNf+S8+AJ1vPzeYD3D3/jOQ/O5MRsNoPJOAbVSbQ/OjWRw019/ObxBVCJTj9QJZn5VskBzBC3VLasBhsSzZAG2tZW24r/vAXLAkJcrHmzRnciWxV9p+f2IAGeaIS2KYXgdvmvL8086k7D41tH6+yP0+VzW2JNK7wIW3jNJXNFpsjA8nCL0cJbdiiCqux9QI80STRijB8NuRalCy209Wzlyq9VK8D1HMI/tG+LOPUAKSwrN5OGyiB5E2/oEUje0tgrTWVoDux+t90LyMrPhG0VWic/m2oFyB0W8/Fg6VTNep10SBVWwrlx0zel+bPkXVod0XMlSbwT7JjnkO2hWpj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5SXUlle2NVEXwDFcWjTn+XnAibneyXcGO3oVO7aYIU=;
 b=nksWASWUJtTZfr4ZUl9jF1YGQ0L5j+W9xizP5TWqGdErX3biKgwUJoiMbdVJb1mvRIE+iM1dyCONuE3Fcpvkp+bZygV9qjf1Wy8sPxYVsk9SxMM8cF40NREVBecVJHKoqZHWougYUNL18qpPs63I6UrX6250Kjw1+mDuCId0c1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by GV1PR08MB10523.eurprd08.prod.outlook.com (2603:10a6:150:16a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.40; Wed, 28 Feb
 2024 13:51:43 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024
 13:51:43 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Wed, 28 Feb 2024 14:51:33 +0100
Subject: [PATCH v5 6/8] usb: misc: onboard_dev: add support for non-hub devices
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240228-onboard_xvf3500-v5-6-76b805fd3fe6@wolfvision.net>
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
In-Reply-To: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709128293; l=4013;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=moj7dNPzywLu5KBQuWEF56AL6ondXwteo2SwhW8gJKY=;
 b=QRj/qc1Eh7opso6M3JwpKRV4SYDiDZ+bYYZa0ss103gWaRUSBk97Zg/2pfEyJ0JJP5DvFa+c0
 n4qoet/jCZnB82ocwcpygGVBJn7ddafJJWuTAAlzBMKhXULBtiJYw/O
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::19) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|GV1PR08MB10523:EE_
X-MS-Office365-Filtering-Correlation-Id: 07085d1b-f809-472b-bcb0-08dc3864656f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l+xdbm7iEuH4vU3B6xmAgcnVSZ+BzLEQ4BYVFlwDGJAGFIIMm1iJy1L/6xMVj1npe0U97GNlG4XeuAueUxypNcX95OolgWapvgGyJPMtMaCuDy+olOCyB3TDLLNeDwnN8zOsOCBSq7kvS7IsbwkXG5DRJCcQzKMvvuVIFMKvMsHcBa0jf3wZLdGT1GAGUDTbDRpbqMLx3koYr+jXvFkLry2VL5XykmsqbY5UE7Eg56vLv/lP8hSs2q/5PBOJXWzMYF3fIkMSBF3i+5jv0KXSWM3RhGeeX5P04xd7Tv0/cIO5qtm4fi5B7dPorH/8v3mXQvW5Wh3A3kHyYrYEFoepCKWwy2+rSUUTT9A6Z+A/jCqeqjFA4MLjWfxeFwzttZF8k2brCmlmWhuaACsc5N+9LOalAJMwqyZMRzq4FnMgbPriWLYB9Trj8uHAHLQ6VKqCEkWjTYoIPFi7PEQ6xF65mxfk61UBdZyI4fpvwpypnPg3nT2LFwzAD7K24eEciUGIIrDuqHFQ4XXEmPbwKDdWCq+sNVcnNMdlhzGN/6XBSBpKAELS2YOOCaXHfbt/gludCKyTatp0hwQeYSBJs0dbLpqRL1uFDnobsFfHvgh/K5oWEouJKMasm2PXwNB3TwVYyPs049slGWN6Iadojh04Kagf0E44oBmZskgvHcG0IDkflKJ4qj5ma6tt4L01raRXSrjKKeY5wlfzevtCjf/D9SE5qRII7D3t0pTWBv9cl0E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3FXTnF1ck1rZlJmRmhHaXpsSDBxZ3M3UDc0Qms5Y1FDNzlyR01JT2cwSEow?=
 =?utf-8?B?Ui82YTd0cURLdGNaQ0RRMU4zV1FKZHlGcGFWaDdvM1RjaVBTR1hSWVdyMThu?=
 =?utf-8?B?bUxnc2trZGkyd0pTbFlMdlZ5TzZTcmZWaDNPRlZxTndmQTVuUi9jM0xKaGlT?=
 =?utf-8?B?U1M3UkQ1TUFGMjhQd08yemlkZEx4T2ZjRnJsN3J6YWNjc1dJQTBWazNTcWVn?=
 =?utf-8?B?OHRrMVFoYVNIMjlUaEwyRjRsVmQyekdIaUtuZ2ZwTlNGVEtkYVZHWW02VEdG?=
 =?utf-8?B?eTFJY2JDdnpxUUJ5KzBUc3pJb0JwSmdja3NWUTI5ajNzWUdBL3BMTDRuQmRV?=
 =?utf-8?B?VTlYdUovYm01cUk3ZnMyTUdsU3psUlFjVXk2VzBGNVUvU0pEczhwUFBwOFNr?=
 =?utf-8?B?akI0NnBMajMvSDVPc2wxMzJPdjJHdW0xWm5YZm9SaWhQOHlzYmczeHphU01u?=
 =?utf-8?B?NGJBdDhla3NLck9tNDFMVHdQLzkzVVRRTXU1SXBYdFN6RU1BS3hTNnpiaVRQ?=
 =?utf-8?B?a1U5WEtrNCtoaWtoS0FubmRMTVVVcWp4K2RBZ2ZjRXp3ejIydFJvVThXWlFG?=
 =?utf-8?B?V0VFd0VtUUZOdEp6cFJkZTRHVEJpUllZdW9ndnVRL3RISEVCbFJES3M1YVlz?=
 =?utf-8?B?YXM3S095TkE3clc5SExuZGRrZUs5OUhaTWwzaGNZaCtQcDZsbnRZRFM3TE1F?=
 =?utf-8?B?UmdUTTVhNFlDVkRxMEJJeGFDZkdET3p1YlhwWHRSTk5iMStERGlaYlNRZUw0?=
 =?utf-8?B?Z2plN0JZY1MwdURnNVYySnUza3BrVnB4MkpQQmNQTE5XTkV3ZytpN3ZBT2tt?=
 =?utf-8?B?NWFFai9lbFZ2TnkyS1lYQldocE5kSWJRVVlwSWJjT3dUZUo3VWt5ZW5FNllX?=
 =?utf-8?B?cFA3VG0rWWVkUWwyQ2RzSXlrUGJyaVRENGNteXlTNkxDK3JJNi9iOFpucjE5?=
 =?utf-8?B?Y2RHSkZrOGdqcFVlVmtBM0EvVVJnYmVaM1pZaExQSzVXa3JOT0IyQ3RnTDRQ?=
 =?utf-8?B?NzNzZUV2YjZYamM2eWFHRVlBR0h3UU1ROC9zU2FkUFpJcVhnc1B4Z1BwbDFz?=
 =?utf-8?B?b2wramx0ckUxQ1FpdHlyOUtOSUU1MHZ6UjBpaWthVjRJQ1RMYzk2bW5ndG9S?=
 =?utf-8?B?N2lUT1pXWVJNQXcyL3pDUUNSeGtrcEJLUnhBMnNwVklRdTlQb0F2dGM1endJ?=
 =?utf-8?B?UW5jS2E4T1ZTQkZzMDJGaFhvODhmZ0ZLOVBYTjQ2Ym80YXRPWEVhTlhBcVQ3?=
 =?utf-8?B?L2YwZ2RtVUwrQ2FNOVRvSENkdDJTOGZacHMxSm1mRHdSdUs2TnJDd0ltRzk0?=
 =?utf-8?B?QUhCVmdWODduRGFqbnhKR0x6a2VvQlBJVkN4ZGRoTmMxN3V6NzM2M25abkdC?=
 =?utf-8?B?UmY0WEV0eXNKWUJQdEp4V3o1UVlMM2xVamlNWnY0dEQ5aFdXQW1VTEFsYms2?=
 =?utf-8?B?VFlMWkJ6eWlybldtaElJbDNZUnpqSHNtVDMwZmU4b0xMWk1aRzVPNVBIN0pT?=
 =?utf-8?B?cThKRVpkT1AvamMwQzB4SSs0TkdhU0pteDllUTRVd08rVkMyMG8yUkhmTW9X?=
 =?utf-8?B?R3RRQnQwb1dacnFSaXBKNkEzazBTSDBYci9oK2lOR09RQlltbGxEUVlobzhH?=
 =?utf-8?B?L1ZmdVc3aEUxQmpuK3k2VkdWQjJ6OE9DSWEvVC80WU1XV01SaUJBcmVQRzNr?=
 =?utf-8?B?Y0hFSFlsVnpkMWd5eVNjcVVjaTNJVnNnM09YUUd3NkMyRG9OMVprU3FjMlpa?=
 =?utf-8?B?bXVzcUZvY3hIaUVZa0ovbW1PNHFaQkdUa01kK0liMi8rQVkyY2U4cTlnSWZR?=
 =?utf-8?B?YkNKMGptUVN1djRzVGRVU0NBRkhVYjJiZWlaVDRNT3hnZnhLd1Zsak93Vkl5?=
 =?utf-8?B?MmFvYjMzU3JpYWtQRzhlSU1rNGZMUjlKblM4emNaTmRSUEtvUUpEdGswdHhq?=
 =?utf-8?B?MzNPdjVWM3VGUWorWnV2ZGhHR0NnQ21mM0drMXhFNm5ZQUhZNTUxUU02eFdw?=
 =?utf-8?B?NXFDM0I4alZrUHZEWGFXeXVjTkltYVhMdU1qeWU0MUNBZUdMdDBXM0tpNjBy?=
 =?utf-8?B?THVWazhWRERIaTk0RXV1b1FBbklkZDROMyt3VFFiZHZuNmtNcjliRzJvNzdK?=
 =?utf-8?B?bkJja1ZuRTVJVElsSGM5aTRucUJWQm0vRmVZd0JVTlVFeGlrUzhYRWQrVVJZ?=
 =?utf-8?Q?09o2AR/1T8RL3SplJ/aKkOo=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 07085d1b-f809-472b-bcb0-08dc3864656f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 13:51:43.1062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOxr4soj1bARsuWJ1vmKOO8S3DxJoXtun0O1lD77L6D5cTE32NIcZF57V6NBM1NVemtI1jJTqnaI9Bia8ftJntYiG5Bd7x/18hFLGj2IWiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10523
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

Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 drivers/usb/misc/onboard_usb_dev.c | 25 +++++++++++++++++++++++--
 drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index e1779bd2d126..df0ed172c7ec 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -132,7 +132,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
 	struct usbdev_node *node;
 	bool power_off = true;
 
-	if (onboard_dev->always_powered_in_suspend)
+	if (onboard_dev->always_powered_in_suspend &&
+	    !onboard_dev->pdata->is_hub)
 		return 0;
 
 	mutex_lock(&onboard_dev->lock);
@@ -262,7 +263,27 @@ static struct attribute *onboard_dev_attrs[] = {
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
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 470736483cdf..106480ce72b5 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -12,60 +12,70 @@ struct onboard_dev_pdata {
 	unsigned long reset_us;		/* reset pulse width in us */
 	unsigned int num_supplies;	/* number of supplies */
 	const char * const supply_names[MAX_SUPPLIES]; /* use the real names */
+	bool is_hub;			/* true if the device is a HUB */
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

