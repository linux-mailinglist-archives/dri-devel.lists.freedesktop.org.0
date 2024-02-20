Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A5A85D224
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B318710E646;
	Wed, 21 Feb 2024 08:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="Hph8pfcZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2094.outbound.protection.outlook.com [40.107.22.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454AC10E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:06:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bE1lzbVYCQbMiox8ibA+GLVeSNr3mQbU9KdzxMI2UxYn1QbSw5ZM6Fhyzpj9eOwlp9g6Fppjzl2hyEnnSEVe/hu0ER6G7dEc9yFYSax5J8gDk13IpCTeJKDgZyIVqV/3zL/xStcWJgBcZwNpSeGw9lBP9YLR9xqQr1Zb17JIEmiaXDt9woKL/zFEtTx3kMh2tNJzQKD87U5UOtLUv0LHr7D56YrrWJmjJc7S14HJY+izr9TMWvLdsVgqRgCAVS+TBK/R6aZEAdw2lpCo+jlUgDWrfLrMIIiHoNMOSsE/JOIKEy3P9SNlr1rrIXP4VRAcFHz6L3e0ZZyNypSxVoIt1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9DRWNNHJf1m1oNiTxM/aRUkX1vWZM4TNEwdcvl4H4Q=;
 b=Ehz6FKLNYP01/raXpMox81dpzS+gTiVfPbPtDILtfLzbPcAtDmMofndJeR8CkTrVPE0KavoNxfrhFjtXDzi2Fn2i+UBtTsCcIAmCOPZK6zcN396CLOkS4pJ+HSW8jplc5G4Bx5V9sa6WbvdzK7hbA9QpsWv5AZX5FCVdMGG5VwcJBt+RZliLcoK3ndI5arh2gMQiwsb9N94a4MCup/sWMXXJLyPHU8E91mwGEhac5fx/QWB1RZmxhlAJTialJv2DxoWB1cm/dp3VfjtTdGb5tgTLR56VTqsgWqPfyjvu8yuGsDnREu/YGT7Wt8ExJAm4+UfpppDpCyTQQqr/e4h6uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9DRWNNHJf1m1oNiTxM/aRUkX1vWZM4TNEwdcvl4H4Q=;
 b=Hph8pfcZZ4mBmVvphmfZ/3tEaue/biDBXCvpIxdHeC5WIJEsaJFDkM+umNsX6rSwzvJXF8n/GVx/Q2m5ZvXNt9lVU1Mg+7E17eqvf+EnE7w5BOf49ZpC/GQiIKaqg5En2HetDf5p/2+X/edMmXT1kxCLCUs7S9/3lqmYELF+9Pk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by PR3PR08MB5577.eurprd08.prod.outlook.com (2603:10a6:102:81::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 14:06:00 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99%6]) with mapi id 15.20.7292.033; Tue, 20 Feb 2024
 14:06:00 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 20 Feb 2024 15:05:52 +0100
Subject: [PATCH v4 8/8] usb: misc: onboard_hub: add support for XMOS
 XVF3500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-onboard_xvf3500-v4-8-dc1617cc5dd4@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708437949; l=2771;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=oznwCdmDCgxhvp9GWMzxXJB+MbURB7Yo9lb4CwA1iFg=;
 b=0xncclfPpbx4/JCkF1FaiUPnqqb71vJ2hPUTP8GDtumrBFDc0jV+bbfvYLuqc9mOfZiepGLQF
 PPmkc3csT1UCjb/9Ivni4k0HWjAE4FvVSgzE7jKVk707rjnwUOUs/4L
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: VI1PR0102CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::23) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|PR3PR08MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: b19e035a-ed2c-4a63-b18b-08dc321d1128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NHwIXZtPSGiSgnJI+gqJ6MO1XGMfRH99bPfS2eq6+iWzqK4r4hBLqjb/ItBECH99za8pYWvUeAzv5QIyqwNh9pBTIvNWB7mkAI3E8ebBcnLUE65V/BllPqb2wXGCTlb65IH5Q7D0HSoSdUmeVHjXa52nFiFIM750a5yHSuequ/lxsUGDgD8iKSL4A7Bw7QXK/CgseVvOhwGf+MTuYw+ARQBIlJIIK4oZg+rL0hnZyZ1rOVy0m1swi1RY1XFNhVbGvAB6NZ7OE6Oq2eTbBYATMeTR+gVpIIM/Sa3mlvgkvGL0qrQ02eVvGSceuuwypln5ludlTbu8Rgnrq28S4nB9dTa7Bx9kdKd6MsIo2kUURuWCZW7lu7+k3+FKsho680eSGZgepAQBi4UPmjkOav310ZqDueZsXM2u/qL7BhxX7tezXgf8EbpEO2NBc3U6aD+gJEgupImRAcGY5Lh7Z/S0lETN71uoBx3EcWqXmc5zE7f8BGIufTRGznVT6Cpa7DcTDFkOtddqPfxZzHzQtj6jYiNFt41begZ4+VFruhW7xdiTr1LspQu2zaNrbmB5Ox4TJ/QhEs1fVl7+ar10EJ+DL9830WEhpBZVJdTVVFPXD3mSKbkzmvyYVwk/ick7d4JH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE9YZ2RKbTh2Snhhd2N4TTVJaXhXanZmL2VZRjBRK2xEdFI1cldLdFdtbWJm?=
 =?utf-8?B?aGIzeVhYOUwxK2ZiL1VCWTFNN2thRjR3ZFBzUzZyb09PRlA0dFA0SjZ6K2VM?=
 =?utf-8?B?TFdjYXdtb0dSdEVUTlI5SDFRdDdPR0FHbUd0QS92YUxia0Rva0tWQ1EzQkh1?=
 =?utf-8?B?cEg4OXp1OW9uRDRrRnp0cnB3N3BCbDBGZjZNMWl5cUk1QXM2UDg0NDdQWVB0?=
 =?utf-8?B?REpmZy9ERVRkSHIzVGNiZ01oY2Vadk5yeGozWDFFK1R2TkhWWW1hNHNvY1I5?=
 =?utf-8?B?VFZFRXJGOThiUTdFMUx2YUQ5MWFnVzZTT2ZkZmEvV04veGZLMEZqSFhMVkE0?=
 =?utf-8?B?MURZNTB5MVJEL0tYblJzWlZ5T1JYMkxIWFFNN1FCR1FIc2hEOXNHUXYxMUNF?=
 =?utf-8?B?WGVpamhNN0Q4dDV5SHlvRVVWM2NmeXVXd01vaXpMZzBhUzh3cDNWMHg0MlQy?=
 =?utf-8?B?Q2t3eW9rQkdMMlhZSm5GcENaTFU0N3gvUDc4dy8rc2VWL2lFK1dmR2w2VjRB?=
 =?utf-8?B?SnZkN3lDUDFzU05HMEVlOVZpanpsMDZWUW8xOHY1bjNmVHNTQjhRYWhSRUJv?=
 =?utf-8?B?THNpSURnalFRT0dqWS9rUmEzNW5QUExPZ3dsNlpUTTBsanVXWnJJM1RJOFcw?=
 =?utf-8?B?TThPMHhNOXJOUFdSVWtkeCt3Q1dqREpRNkFrMVRTazhzcWtTUnVrZjN6aytu?=
 =?utf-8?B?MXNmbU40clhneDBJR0ZYTlVmbGpPZzl0WVd4dnJLZWpmaGJMMDM1dmhLR2NB?=
 =?utf-8?B?NXVwQzV1OVJDNVdLRDMvbGw4cURZVmx1RkxuUU9mRnVhbnRjNUJaUjJxTGNp?=
 =?utf-8?B?QVI4US9SNG1jdGNVMW43Y1ZHaS9oeVZrSlZXYmtXWXNVZG5hcFJRNndkZkgx?=
 =?utf-8?B?Tng2OG16aTRkbjBmMGZ6MXVKQTgwNUtGTHJQNllTTGFkdy9FeWx2UUlESDNT?=
 =?utf-8?B?aURWS1puRDFpR2xWMVBkdkpYTWVaamtKTmhXUjhMMW0rUEYvTzdhclhWVjJH?=
 =?utf-8?B?SDdQQmZUc3o1SmJ4VUYyaU9HZVRESmNickI3andvL1YvT0VLNFRmVk40RGha?=
 =?utf-8?B?QVJYQUZLU1NEUjY2bDBKWWQvSEhjakR5YUJFOVBKTXRBTVV2aEd0MXdhTlEv?=
 =?utf-8?B?WkNPUG42NmRkSHVIV2dEV1d5eXl6OG1VNzJjdzFwd3NhK0RrL1RUVkJGbEJR?=
 =?utf-8?B?cHBkM0x6RnhCNlRobmNTczRwdUZCQ0JvSkZiS3FIZmpiMEpGWjRBL0RzTWFi?=
 =?utf-8?B?RTZaSGdBbG1BTWhqYXpzT0pmcG1jRFkwa1FEZHVKRzEweTVwQWlKZVBsSjUw?=
 =?utf-8?B?UTU2amxab253bno2REdTejFGTGxYY3VvOTRZR090NTBKVHZtdFhieEZFM0NH?=
 =?utf-8?B?SWpmTktkNnRRb3d3cktCcFUwaC80WnkxT0J1dnVuOFRGVW43aFljUEVYSk5S?=
 =?utf-8?B?T2lpaFlZU09XUWw3TzUrdzhDVlluS2JDVEpOTkZxRVVWL0VPZnhWYlRmb2Jq?=
 =?utf-8?B?aHFvY2J0Q2w2eHhUK0FjM0JLT0ZRNDI3T3BkZE5nSDRIQ29aQUlGcktXYVJh?=
 =?utf-8?B?NkV2MFBXVmQ1K1dqV25TeDRkaDh4VkYxcEplRWVhekpmN2ZJc1VmWWNSb1Va?=
 =?utf-8?B?Y1pjeFoxdHdLb1BFeWFyTHBwbW1hWnFNSWVDOEQ2Z3kyOHlEVTRFbUlRZ0hl?=
 =?utf-8?B?bmNZUm1TaUpEN0ZQT1ZnSDM4c1pNOW10WkJ0bGIyOFRseWM1bVllazNxR0cr?=
 =?utf-8?B?cWQ2NEtSYkxPbzNzVGtmR3lDQUVlTi9IYWwybHhjOEpqdU9xaW5zY2d1NWJa?=
 =?utf-8?B?eTBCTlRUV0lJZUlPL05aUnZ4YmU3V1RGbjNZUXZ0TW9DWjBmRmVBUVR6Tm9R?=
 =?utf-8?B?QWFyZGQ4WWY2QTFUMnM2a0VOSEJaUW03ZVpsTy8wVFdZY3YxeXJLSnVEeXpQ?=
 =?utf-8?B?ODQ1Q09ESDhEUjZDYk85Rk1rMThpTTVyQUcrYkUwZG1jazhtc0ZyclJ5aXd4?=
 =?utf-8?B?aEZicjh2aVlOUW5Da29mTmdkcUpaREtDWnBoMmVJZGFWZVJrVmNEVmVubnBm?=
 =?utf-8?B?OUhzamwvUTBzL2lML3FGWXNieXMvYm04Qjlwei9mL1haRXNaeW5NUzR1dzlu?=
 =?utf-8?B?MlBnanFGd24zb1FwVnRLbHNaTTRmTWtxdDNHNUhXM205dXZjV2oySnh0QUcy?=
 =?utf-8?Q?JfHNgRjXlFrTQrE3qnTDGPU=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b19e035a-ed2c-4a63-b18b-08dc321d1128
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 14:06:00.3976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDdtUgadmeTZVk6PDBEmbGi/+23v3G5qvjEQUy2imIPuvfuyzKjkBmD3+IOUrEYgEqN6zy0153pTmvJ0FibicXlzCoiPB8Tr9pwlI7BcMys=
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

The XMOS XVF3500 VocalFusion Voice Processor[1] is a low-latency, 32-bit
multicore controller for voice processing.

This device requires a specific power sequence, which consists of
enabling the regulators that control the 3V3 and 1V0 device supplies,
and a reset de-assertion after a delay of at least 100ns. Such power
sequence is already supported by the onboard_hub driver, and it can be
reused for non-hub USB devices as well.

Once in normal operation, the XVF3500 registers itself as a USB device,
and it does not require any device-specific operations in the driver.

[1] https://www.xmos.com/xvf3500/

Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 drivers/usb/misc/onboard_usb_dev.c | 2 ++
 drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index e66fcac93006..e717d1ca8d79 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -388,6 +388,7 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_REALTEK	0x0bda
 #define VENDOR_ID_TI		0x0451
 #define VENDOR_ID_VIA		0x2109
+#define VENDOR_ID_XMOS		0x20B1
 
 /*
  * Returns the onboard_dev platform device that is associated with the USB
@@ -480,6 +481,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 */
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 */
+	{ USB_DEVICE(VENDOR_ID_XMOS, 0x0013) }, /* XVF3500 */
 	{}
 };
 MODULE_DEVICE_TABLE(usb, onboard_dev_id_table);
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 59dced6bd339..921a5276fc7f 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -89,6 +89,13 @@ static const struct onboard_dev_pdata vialab_vl817_data = {
 	.is_hub = true,
 };
 
+static const struct onboard_dev_pdata xmos_xvf3500_data = {
+	.reset_us = 1,
+	.num_supplies = 2,
+	.supply_names = { "vdd", "vddio" },
+	.is_hub = false,
+};
+
 static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb424,2412", .data = &microchip_usb424_data, },
 	{ .compatible = "usb424,2514", .data = &microchip_usb424_data, },
@@ -110,6 +117,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
 	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
+	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
 	{}
 };
 

-- 
2.40.1

