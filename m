Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9424685D223
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DCD10E639;
	Wed, 21 Feb 2024 08:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="lQi5YSTV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2107.outbound.protection.outlook.com [40.107.22.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D01D10E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:05:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOmXZPMRVBhUXisYMTKCFklsXpqNdkf4c9duEkt+On4AAkI/ohsffXfbGEkIEFBgOr4dHu2GMpDsvVzaKlOIaLBfH8ATquCx2E/SxC+sIKwnyeYEdal/9BEhro0J3e2EtxmuQnQyz7aPH/+vthtOFL/+++8yYmpCj53/FXo6ueU90NLphlpotUTPmQLYkSXZzNxaju9fkMVc/25+ZxBfXoPt18lTv1+XTalDTCZEYixEuT+3UZw1tH/E793hLzrm117V8x9aj2QKsU4Sa/IBO32tw2+iehqv0oxMLHF/1P9Z0F+nkHXGLjnitjetXO/g4ejcZ6hWFHK0aUUbHIqW4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hx4YfCu/A6IjPi6V+uhUigfsBHtiz8SORKkkQs9tvJw=;
 b=TO3mTAeiIhKvwCHzSlet+asWI3BK+wjghfpTlk4pSklMmyy6B0AGmGuLPf1Jm6+jidDIxeNp3ZuEiNO0ZFhjZJ4KDmC8KSFl1EXpf9UJYJpQy5XBdKXj7gW3Rc802cCR0iGpsE1md0VjiqCt6JEhsnot+4hUFPAtWqKHe/uF9i501O8aKjRH/o+bEZEVkGbk3FYadsQ1WAxWnDxADAc5Tj67bqo3aTbT/qLxcN1aDKKkWcYwaQnHOQ/rQxNwf6Ctxp8ZDKOfuUqqsOpPurfsE+cpaRzHnWjxJvzaIzw3cXUVYukexeNuUnAQVzhF+LnE7f5R0ApNxcG2GPxUP/+zoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hx4YfCu/A6IjPi6V+uhUigfsBHtiz8SORKkkQs9tvJw=;
 b=lQi5YSTVYUOP6X1ntvs8OBJFBNi0BWUtkmMjS1qarH0AtQYeEHC/XIN7PbebNnYPvtuggd7gvU1rXVis2WyrlD1bweDVZcJlhen4Nna3i2bLiRHsKuXOrkQD5z8OQao7iPSh8AeD2Yqf8icAMnosANpY9wcv8jWfjS18AL9nBV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by PR3PR08MB5577.eurprd08.prod.outlook.com (2603:10a6:102:81::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 14:05:53 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99%6]) with mapi id 15.20.7292.033; Tue, 20 Feb 2024
 14:05:53 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 20 Feb 2024 15:05:46 +0100
Subject: [PATCH v4 2/8] usb: misc: onboard_dev: add support for non-hub devices
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-onboard_xvf3500-v4-2-dc1617cc5dd4@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708437949; l=2655;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=gMWA9iiw4gWjTtXoY5mpyTAT8kscTCPedXSh5GS03x0=;
 b=AudUlCiKCPMauOKYrf8iJScAE9iGk2afLGNmodFqXJ3ThlDTcPoG4vTzl80gZlQq9MZdI3Ifx
 e7N4KiOhc9vBqZj6UxuuOPcjYhrSni6Ayz2/7KD7yFVQHVCsBgqwmQl
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: VI1PR0102CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::23) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|PR3PR08MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: d7934c8c-e1be-44cf-0bb6-08dc321d0cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r6aRTq4/TY9JVHo8XoLCFNQxlRDEodMz5tN+rNm2mJ4WN/5hWren5vYzi8eEXmNoH40j0UVDH29KUvuoy/2RbEItqEPKGVswLV7QVkJlINuC447ZbDZnvpJSmFopj58kibj4w+udC2dyk4SgLs6W9Nv68unsoCmJE+SpFUBzQtVttKN6U6Zm5fTIEJF3Dy7nWzwYu0Tz3OA6WrwhCzPj1gChGOSIsLuta+drwwNY5GgJkekhe7peRbi8pModHN9G53p4VK2ZViQnJBEU73fVcDzzdhuzJGjve80haTDS7xDiZAUdjX11rWwpy1BcfBvUdhlgtTUBdWHmExCykYBL+pBVh6SiEKDRZzlgHmrnDBDbtzyxVcLEcwt+Aa6uQXp/BqRHWsY3xGeTIecM09007Xy+uxR28cC5R13NyzG/M/JNreJimoi1OPEzIaPufMlXwQIFX02a7KFL2bqie5L9kzbVSDQDDjSQW0EdX4G0CsViPlpQtIan+snhtfpB99IkLuqbsc5OzODLWkNeZ1P4bU0DasheI3lcX641ypeQisjrCNChsvBjg2eCgwma3mliP307onM5UOrh/F8KkroFr+cSGYbVUbf/STQgIHKZ2edDswk8q3R4VIaspCnm1uiX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b25RMGhhdERMU1hKQ3RORWQ5T2pQZTFiVjFvcUxFRDNvN3JlMDE0c0dYUkZo?=
 =?utf-8?B?STM3RDdjckNnNkNLR1NMY2FHYkx6VnhlYVhmM1U1T2Y4S0ZCUld0Sm1nU21E?=
 =?utf-8?B?RnduOGdKL2ZhRWJHY0ZFc3RNM2JRcEE2c2JJNFNqZkw1eG9XVlVkL3lMRzQ5?=
 =?utf-8?B?aGE2Z2Jqc2RLRFpDWkp0SlZNUVJXV25HZHVZNkZsYU8wMjhQN2d5MTBJSWhq?=
 =?utf-8?B?dkE2YlM0ZGNpUVhQZzN4MTZ4eW9jNnk0YjQzVkRlaW8zYSt2M09NbGdvOVJr?=
 =?utf-8?B?WUpWRkd4THN3VkhnZ3B5VTgzNGdIaEthQmt2eXdpZzRrc0dxV3VLRGw4N1Uz?=
 =?utf-8?B?QWFnZm5uRXlKTWNtWmg1dGRlblcvTmQ1RnE2TnNBRWVLNGc1QnVXTFRmc1pn?=
 =?utf-8?B?ZE1iWWpJS1RLaW1tVzhlTGlMbHY4eUhZQzM2aitLOWNJUnlZek82MTduUC8x?=
 =?utf-8?B?c2p4ZzA0NUhpNVN0S0VMZWVFZ0NWNVg0cmg5UUQ3VU9SVEVINklmSVJtemVJ?=
 =?utf-8?B?bHRuQnp4ZzhKYTU1V25xb2VsZHZOdUNCWTlyVFZkcGpKZUlJSFBEblN3RCs3?=
 =?utf-8?B?aFQ0UFFqbDhQUCtGTi9CdVMxcVc1Z1ZCdDlWdGdmNU0rQWpDRk5uUGhaV0RP?=
 =?utf-8?B?TG84NzdiRFJ6TEJMSzkyWkp2M2lCRWxTcmYzR2pLbFNMM0tpcWdoYlcwVTZI?=
 =?utf-8?B?ek1xcFAzd0tjaXZ2ZzdxL1NsS2NzTUNTTWhzazViY0tPNk9vVzVSb1ZQK3B3?=
 =?utf-8?B?SWkvZkZSd3pMT0NsR1VmVDFkTG5XaWhMSnJydEVxRmpuQmd2aEFuREtCSG12?=
 =?utf-8?B?TklxYzg5QVpod29HS2pOVitHWWZLY1E0VGR0aGhFcTF1UFlHZmxva2pTdHUv?=
 =?utf-8?B?VzB4aVJ2UG92QzAwd0IyeHNMU0xBTUtKb3hvZzlocUFWRlBLbEg1RTN1VXRK?=
 =?utf-8?B?ZFFRWHdBeVlmbVJveUMwcG9xRnN1a29hWWxLNitQUExEZTg3cExUVzQ0L1N0?=
 =?utf-8?B?RGtneXNkRUhsT3hHNDJQV0EwdXphY2JiSVRqZTBoeUpVNmowS2FKakVHekhL?=
 =?utf-8?B?QVliVEJnMlhnSnNHK1VJY3ZkQ3BwOVF0N0h6M2ZxV21MblBsOThEbnNyVW5v?=
 =?utf-8?B?SkFjMjVZaVRpS3FaaUllT01kUGdtcDBvV1pvRkVjYVVUMC9wSVprMklMaXRu?=
 =?utf-8?B?aTQ4YnlxTW9jSnFia2Fwa1l2cDRkZFR4SkUycWdzRjk4dktJQnovVFFIc1RF?=
 =?utf-8?B?NUZaVG11S2RFRzJra1dCYmNKNno2QnNPeUxCeGswYXE5bmJ0WTg4bmdEdnJo?=
 =?utf-8?B?cFJKN3pHRkJnSlZFNlY0Z2hCNGhPZXVDdk9qTkdwcFJacFBjVGEvcHhVWWNE?=
 =?utf-8?B?R1pLbk9zbm83cXdGMHFLYkljdWV1WFBiMUFBb1ZXZFJhVktlR3Y2WDlmVmJV?=
 =?utf-8?B?ZVVpOWNJZUkwSVVYM01mUE9jalllS0lTSHJqUHdKVExGVGZ3d3FSbDRscklN?=
 =?utf-8?B?UHp4WnVFK201cUtZdXJkUE9DRStuV2p2TkJ6aU1wUndSL00wLzRMcWgzWG15?=
 =?utf-8?B?WW5YVndIREgzK3laa1cxeGVLakFFQUR1UGhWYzREM1gvRmFGRmUrWjFBRjRZ?=
 =?utf-8?B?Q2EwZExRczFiMnlEL2NNaUcxREcwSWxhNXV2am5keWtPMEtwVXEydis3ejVT?=
 =?utf-8?B?ODhkS3BNOWsrRFZQMnlJelpxQUlSRlQxaUUxNkt6aUhod3RMaFZ5ZU11VUVM?=
 =?utf-8?B?ZnJXZlZZZHl2eGRUM1ZwQ1hIUkFsT2RtN1NwWlZZdVdCb3pSUE1Rbythc3N2?=
 =?utf-8?B?NHJWTWtuWW5jZlYvQTV3VmNueFoyNzJTcmQ2SHl3NXhybE9nbFd0SG53R1M3?=
 =?utf-8?B?NHplcm0zQ1krR1hNckF0Y3FqWHdlbENJVDB0SmtDYStxV3V1NUxHQkR1dDNy?=
 =?utf-8?B?VFdEcXVrL3A5RnNja3l1cE45OENucU16QzloanpBY0RQckFUdGpJUVNwSjBQ?=
 =?utf-8?B?dWlPWkE1VS9KYlFFUFB1U2QwMXpTTmNkOVBmNWtiUk5nUmp3YWpIRDJuV2tD?=
 =?utf-8?B?bS82YkNPNTQ0ejhsdEFCUkh6dmJKZkhTaUZEcXVUN1ZVYXVVNENSRHNVNlMv?=
 =?utf-8?B?WE1VTGJWbGN4dnNOcnhXTEc4dTNtSTQvd2lTb2l2VkJ4RVU5WS9aQlE2VmVG?=
 =?utf-8?Q?q8Q9tWBlssvuR4tLhUM0dQo=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d7934c8c-e1be-44cf-0bb6-08dc321d0cfc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 14:05:53.4092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNEjTGxetI51RtL/aJ8DejDSGPv8LacTvfODENzgmlRYMidrwxyE4BRgYVEf0vZt/VF11pLlMmc2nZEkzpBDvSsa2t5j5VusN4b1N/JlhW4=
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

Most of the functionality this driver provides can be used by non-hub
devices as well.

To account for the hub-specific code, add a flag to the device data
structure and check its value for hub-specific code.

Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 drivers/usb/misc/onboard_usb_dev.c |  3 ++-
 drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 2103af2cb2a6..f43130a6786f 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -129,7 +129,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
 		if (!device_may_wakeup(node->udev->bus->controller))
 			continue;
 
-		if (usb_wakeup_enabled_descendants(node->udev)) {
+		if (usb_wakeup_enabled_descendants(node->udev) ||
+		    !onboard_dev->pdata->is_hub) {
 			power_off = false;
 			break;
 		}
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index f13d11a84371..ebe83e19d818 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -9,51 +9,61 @@
 struct onboard_dev_pdata {
 	unsigned long reset_us;		/* reset pulse width in us */
 	unsigned int num_supplies;	/* number of supplies */
+	bool is_hub;
 };
 
 static const struct onboard_dev_pdata microchip_usb424_data = {
 	.reset_us = 1,
 	.num_supplies = 1,
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata microchip_usb5744_data = {
 	.reset_us = 0,
 	.num_supplies = 2,
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata realtek_rts5411_data = {
 	.reset_us = 0,
 	.num_supplies = 1,
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata ti_tusb8041_data = {
 	.reset_us = 3000,
 	.num_supplies = 1,
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata cypress_hx3_data = {
 	.reset_us = 10000,
 	.num_supplies = 2,
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata cypress_hx2vl_data = {
 	.reset_us = 1,
 	.num_supplies = 1,
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata genesys_gl850g_data = {
 	.reset_us = 3,
 	.num_supplies = 1,
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata genesys_gl852g_data = {
 	.reset_us = 50,
 	.num_supplies = 1,
+	.is_hub = true,
 };
 
 static const struct onboard_dev_pdata vialab_vl817_data = {
 	.reset_us = 10,
 	.num_supplies = 1,
+	.is_hub = true,
 };
 
 static const struct of_device_id onboard_dev_match[] = {

-- 
2.40.1

