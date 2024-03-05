Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFD787157D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 06:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F581112859;
	Tue,  5 Mar 2024 05:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="MV946Vya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2124.outbound.protection.outlook.com [40.107.247.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BEC112855
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 05:55:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDSrm8Z5sviIcak/ZiKBY1MQZryDOC6yfdojEmVycM2LzW+srN4G7tV7MGqcr3MxcPtA6GUbjZxjH7fgp7Eu6Qefs6xPHkEwuIvM5FjzRKKvDljvtOwknTeMCH/YtPraPqb/1rS8oIOD4cnj2Q3ksfYokSWjyu/xxySMGOiQnOgUszxvRH4Av9BlqS9iG5qgLJmdQ5i4qzS1VlnPaiItnrT0RCjZae6PKePXD90v/UxnLDHnNkU7bSa3A7+ceX1oQisZuLe4hPJTGe0TbRfxczreQ1fTtcTiWuKzmM/XrKdQhyIHH9Vs1da/I4w1/6595JPo+Rx0V0Da96A2HzBqiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5NCX79gFOkPGzpTWXJJqnYCS5QkzZucZsmla9B+/Lo=;
 b=R6IRa83QVN33d4rsihgd5vqehf0F+AVKNqRExaJhwhQ11830YehNDP1i0wjdxyacxXuj3eWkll6LPWWJwNhRXFksT1ztY4I1WG0Y7APAMWjDwvVcRQWqfL+FRuQsRfzTZV7O4rhMbEBzNA6pf7pxVabsSnt6Ou44hbhiLHluIUSRIiENv+qKQZ+6xzUgxRK9/JAvit6EsoJQwMHTOI+D6HGlSsm56iKcDvgcsHyhedm7Jgdw5O/lZgPWxVdImgCT1pmJmXrKB9tHoPCoLmRKATUYUw/F467X1SYrtGxmrg+bJZPngLXgxML7x1TxY8UOqq0FBjqALakonhgImbmwvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5NCX79gFOkPGzpTWXJJqnYCS5QkzZucZsmla9B+/Lo=;
 b=MV946VyasT4uxeh2+fewCr0uPNZhDeog5A/LLgtae1XVqLLuK3OqC/48v/caKG+vsirjx7uzbeMkYAxzKKAYw/0TmSO67aAzIywMi6RigLEQyVxcJ1jvawyZo6rGghm85BwwYonz9pIjd1mkQ1Aon4l+zVsDhdXg0zB4vpPGSu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DB9PR08MB8385.eurprd08.prod.outlook.com (2603:10a6:10:3da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 05:55:21 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 05:55:20 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 05 Mar 2024 06:55:09 +0100
Subject: [PATCH v7 9/9] usb: misc: onboard_dev: add support for XMOS
 XVF3500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-onboard_xvf3500-v7-9-ad3fb50e593b@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709618108; l=2727;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=oP3Z3uy29CXbEHFvt4p4kCUd0enQb9o+q0vxd3NPfPE=;
 b=b2njzOhU5pKjrfz0OdJfAqYlUwWtBZWxv4ooK1gvY97eCki1QQDXOQVvIkGPTwm02A1m3wTP5
 GwPVjSzOqqQAdIbkZyMJeMNLC/1jtRX7uCS+w/fYIqPIx4ds60CfiX9
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR4P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::18) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DB9PR08MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f46579-a273-46d6-86f6-08dc3cd8d797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vP44r4ccJr+e5Dw6PR6d7HrhdQwqKb+iZy7/QFA55AWrT477J+pwdh2eoBJk6q10oodoiD+cE8Dqu3pDyDDsBuT12fzr/R8F/gXyvFyt+RyJI70QUbHjI5dkdEIBHOhVxUoklw+6nixwsJiwojnrmpYGwYn+uQTknY8lJVx+F0Y5M8hPTHQDDYOaFv/w+NHD9E0ovovoL5icd624ZY/S3A4+CSzJyzqHz9327UCYUWPP7bR1igFX/+2aBlXF7+eTIYdse8sqmLwzguIqPagb/XTi0xP5V3OtYvCu6kSiFaSPfYxpT5K3UZTrzciqJh2jKcXx38it9yrGS5krgTzE8Jbi1On1smmKRpqFa++hLwogXCzmOlPW26BXdOcNGxEqRk1cUbwbCnFr688+53+2KZ4fVfu5DO6ZAQOzdmg96JJkWgcWDxrvi22P9WKFNRnQNQs5t7HbR2W0m4lmQ7JvSd8lDCgrxiaS4KMekRRjJyVu1kTQl6+8p5gEASkgZyoZJEiRHX0lxzIilKlpCFsYm6gfk2Suwt78Hc3p+E8uIqOOyDwzxB8rNKoIOmPa43E/4noMYnWu/YyYkgBSWU7JuXl/3A5PuvuEx7AXPyRgx3DazozsaNTvSa78UyTEIwwbbrBXcA3JUmgbgnnQ0Z4nGeUJEgCIKOSKf9AnCKVYZ9VllF1HZJJDtUZwdZEGNOjL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38350700005)(921011); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHVTZ0loandQR3pmaVE4NmRZQ1FoTGJnSDY5Zm91dytybTlqUklib0s5N2Nz?=
 =?utf-8?B?NXpKZ1Q5eTB6MmlMa3ZVZVNxY2ZkYjVYWmNlbWlMWFVsTUcxZWtORVNUbThO?=
 =?utf-8?B?ZTZVVSs0aFQ1emszRUd4U0g4QlkrQmpWQ0hwY0dLeWQwZUl0RURNS3JwVGhG?=
 =?utf-8?B?QUFvUGpQMW40cHg5YkpqT3ppcXVGZE5ISzUrY1pacHJLUU5jZHR2U1d3Nm5O?=
 =?utf-8?B?RVR0S3NYOG9wM0YzQ0I1VFR2UFd3dE1ZYk1zVmFuWUp4MWdOM2E5a2xrU05n?=
 =?utf-8?B?WlJvK05kM3l2WE95Q0VTT2VpRk0rWnFUM1F5aE0zbm9lVTZyMnhLWmhBWERu?=
 =?utf-8?B?TFVrcmIvRDVadGJTWlBmdlJ2UVltckY4Tkl4QjVUQnRPV2RveXBqRmxMTmR0?=
 =?utf-8?B?OXRFUWoxYkplaTFPNy9wWDBqUWRWUkI4OWpzNkM0R09mYm81cUZMVzJFWlJO?=
 =?utf-8?B?d3RBbWtJT3NZWVpQazVVQm1jMmdRdXlQaFlGWTZnMGc5ZTUzb0ErcUdoQith?=
 =?utf-8?B?SmJIeUhLOUo3VWFDNUR0dnExajhmNE1seUIveXcyN1JKU0FZS014VHJRTTQ4?=
 =?utf-8?B?dUsvVldXOGdjZjVwd3Z4cUhKdnBNMUw4KzBtclY0UFVTMm5icXRMeE5pWnc0?=
 =?utf-8?B?bEt1dGdYdFVET1BOdWVIRmxneUZrS2R5RmRUV2V6cW5jZGVQREtMQW96QUFS?=
 =?utf-8?B?T09hRytpdG5LLzA1ZGpVNU9FRU5BMEprdE03d0pOVi9CUzlwMmZjbnZvSG1F?=
 =?utf-8?B?a2hncHVVb1FXbFNCTXlwVkh3NGh6V0djNDFucGVrVndiUmNkZGcwUVlFRUJy?=
 =?utf-8?B?bDkxeFZxaENtTnMxd1I2ZUQ1bFJ1b1FzWTUrWndXcVZUVWtwNjBKTmgwMUFW?=
 =?utf-8?B?Y3NYQ1ErMXhPNkxXanNlSlJXa09FRnRudGdsdTdWdlhWTmsvcW5qakdMWERS?=
 =?utf-8?B?RktZNVNrTnFaOG13MTA4cWplS09hbXZPRG5FamFTeWh5aG01eGRnN01CUXFU?=
 =?utf-8?B?NmRZL1VJNjRGbm1yRkMwb1lBRDRZSHU1RDBQRlBaa1BFWlBrR3hVU0k1T0VQ?=
 =?utf-8?B?a04rdkNaOXlTVnVYeDJEckh1Q0dsSDgwNTFMcndFeGpxZ016WXNsWEtyQXZK?=
 =?utf-8?B?SmYvUUZzZnZLL0RJNEN1NnNpaGdKK0tPTnRVUW42d3RUTEZDN1B2eWR2ZGtP?=
 =?utf-8?B?Q3kzM0FzdjgwUUdOdDZ3U2YxWnhwcjBFNnB4dVdxZ09pVEo2RUd6NmxNVlVz?=
 =?utf-8?B?YVhWQ2tXTGUyRk5JekRGcXlLazAzV1dBbGhOUDA5MkxBbHYraWFZOGQrcWJi?=
 =?utf-8?B?OVpzVUg4NVZsS1lmQXF2NEFCSzkwMWJ0Ky9tck8yYWpNRy9NVjBJTDN4RWhF?=
 =?utf-8?B?QzR1YlgraGo2NkpVT2V2TW8xLzJHa0JRT056RVJrMnVrd1ZkdzV4RDF3elIy?=
 =?utf-8?B?dTdZNEt5UjVHcDQ4N1RaYjZ1Wk92UGN6TWRqSWtZUlBYd0lPdEcyaW5TcmlU?=
 =?utf-8?B?TUJoZHJ6R2hnQkt6VytxdTlvaEg5cFMxVUpQcC9YcmZ2VmcwWnZVcmttNWJN?=
 =?utf-8?B?Y0NuclNBV2VVS2diOEZJOStkMVNpRk9MNFBodWtxL3VYanRyYXJOelJ3ak5a?=
 =?utf-8?B?bHk4V2RVUDNDa0NmTVdZMmZOTERCc3VQODdRSEw1MzJKdnY5b25kOXBwSzZG?=
 =?utf-8?B?WUQ5d0hWSnZtOTVsQzBzMGJhL1dvU0xMc3BVM2U1RlR5L3JVQzJlQkFpQks3?=
 =?utf-8?B?Uy8rb3Vud3NnRCtkR25xWG5CSzZ0TThZRC9KYU45VDVVUVBVWEhSdFhSdW4r?=
 =?utf-8?B?Q2N0dEV1bExRZmV1aGRSL011RUJDOWo1TWFsWmFJSlA0TXRTNndFSlUzKzkx?=
 =?utf-8?B?OUh3NlVHeTQyNUI5clpNKy9xcWhDYUpkS3RscUMvMzc1V2RCU0dueXZkY3cz?=
 =?utf-8?B?VzBnTWxLN0UweWJUUzQ3MDJHbjBUY21yT2wveHFpVjlqTFM1Y1VKb3pIOXU3?=
 =?utf-8?B?dEhVNHN0QXJpSkpWSENTL2wvMTlxZVpucVRMc0VEVmhPTkVHUDVXWUVwOHBz?=
 =?utf-8?B?em5JdExxVmhQazJQZ3JDOUQ5MGVEZ1M0TmtXNmtxRE9NR1B1VklSOHZjNjBr?=
 =?utf-8?B?c1FMTlMxRkZpV0pSYVRpR3NHK2dvdDN4REw3aU5kTmxSU2ZBUUdValloM3M0?=
 =?utf-8?Q?cJaUCQBgRUEcUSKfhicb7EE=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f46579-a273-46d6-86f6-08dc3cd8d797
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 05:55:20.8437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PxXMQ8/wvVxxwfoyfYqWQyrQsGH1RSdNe1OUl4sH++rBx8a1pzYRaS0bdhboe/zIp4bAQ1601Anvs5mF/sVv1OTjVOkvx5yyUUZL9tiJmI=
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

The XMOS XVF3500 VocalFusion Voice Processor[1] is a low-latency, 32-bit
multicore controller for voice processing.

This device requires a specific power sequence, which consists of
enabling the regulators that control the 3V3 and 1V0 device supplies,
and a reset de-assertion after a delay of at least 100ns.

Once in normal operation, the XVF3500 registers itself as a USB device,
and it does not require any device-specific operations in the driver.

[1] https://www.xmos.com/xvf3500/

Acked-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 drivers/usb/misc/onboard_usb_dev.c | 2 ++
 drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index f1b174503c44..ee702448e446 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -407,6 +407,7 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_REALTEK	0x0bda
 #define VENDOR_ID_TI		0x0451
 #define VENDOR_ID_VIA		0x2109
+#define VENDOR_ID_XMOS		0x20B1
 
 /*
  * Returns the onboard_dev platform device that is associated with the USB
@@ -499,6 +500,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_XMOS, 0x0013) }, /* XMOS XVF3500 Voice Processor */
 	{}
 };
 MODULE_DEVICE_TABLE(usb, onboard_dev_id_table);
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index ecdce06ea0f9..a43fd80c24ab 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -78,6 +78,13 @@ static const struct onboard_dev_pdata vialab_vl817_data = {
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
@@ -99,6 +106,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
 	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
+	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
 	{}
 };
 

-- 
2.40.1

