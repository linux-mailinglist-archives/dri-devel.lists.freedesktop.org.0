Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8C686C398
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5CA10E231;
	Thu, 29 Feb 2024 08:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="JqrMUnod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2103.outbound.protection.outlook.com [40.107.7.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0EA10E116
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:35:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHtHkv3zge3n+WAu5J+1wbf0cp8VcZ6tr43MxtdfpDSFKslbFN1EqtCmTO2AnoECpzveIPA+1iN7HMIJR50pQgu5iXo8K8OjD22Bu8RZ+LMXnnS6NvvtWgbLFtobcOZCfCIc4w2UiQugsWPsZrUjH1yWLTyFBpCOEUlkT5/vmsq5YnRaU6XCInMJCtrye2hMOk8QW9i9DUhoWHdA60lRhFGgUkvbPbSP+CoNu1G1JWunzdsprBEGkCZezfOjwJ38BtsnyWQbTl2mOorMdlIEuQcNRE92m8cy5NAyusG1m97s3+SsoeibiW5UUbg8Oe+9UKC4Cd42ZIAinxvFEweX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHn5ocpWmJAmqRGVhz3ePJLhWewLoohLm8CGzYNyosw=;
 b=nCFCSty6uX1op7OiAQW3Lk9fyoATS3Gl7XllKDp1Jtx85VdecWIws7puhWEF4iOwDKQYckStcQGc6El84JBKtJZB0E2WQSpwGIEL3ycOjy7AzIc3gw9u6V8UUMBQNcrzrUBeAk5hU7vBdeO4+K1yga1WelITZR9xkfZV7kwuuDJfLbyAxSnvby+TU6PNYKkjYLKOPLCqCed5aLVXiDyYrzRlYSMf/mF4KjvgCUqRsXRgiVuSK2BtKnlvFVlY0Rfd9CzUFtFCvrK+5zgzdshm1Dme0YzYNh6mebdWLbnrxVenss7x/MNjxKrfx9NclupXa+j1Zhj+6D81FxXAigBmHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHn5ocpWmJAmqRGVhz3ePJLhWewLoohLm8CGzYNyosw=;
 b=JqrMUnod7Nqy5UajJXAYcUGLUTp8lAM43kjnOED+Sreeuhk/wyU1AYEUr5Bu1a7DH5joew9m3kS60M6jWFcngVITIwAo7kjDaVnOyVyRZ1NZyox9W6tUEDhXJptTzFRVwIgm8sHQHAHvmDl3auRnNVLcicwejeWMjPW4ZYOCdoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DU0PR08MB9727.eurprd08.prod.outlook.com (2603:10a6:10:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 08:35:04 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Thu, 29 Feb 2024
 08:35:04 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Thu, 29 Feb 2024 09:34:52 +0100
Subject: [PATCH v6 9/9] usb: misc: onboard_dev: add support for XMOS
 XVF3500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240229-onboard_xvf3500-v6-9-a0aff2947040@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709195691; l=2679;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=Nmd184ZyDSaO4lZ41ELhib4ZiCJSqj9B5C6zTsVjcec=;
 b=/46YvMbOu17KK58hEp0M5qU5E807lSDvlBZieALqhP59gRXWu75e5+UGvvV1fKzaK9LkgxVOX
 pa+2zZPd+CwBAOIpkCjSw/Ni/s0QPK+onrH7Uz08c3gJOmJJ3VVvKHn
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DU0PR08MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: 7167234a-d4b1-489e-4ad0-08dc3901534d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V35S9XbKKBvyU5/DipQ3dac8xX5+0rQwHWy00Yu6plJPF2fJ14SqhJ8awt61tADklUFo7qyTzUSDX2FT/ztNyg6BT0CW2+XSIfPjhH4hA1RsRBblSiKzd4AU+hr8N/cMlsTJMvu4Jywgdj/N9gIAgGCIGD5N02qdDjkLw+VHJZY9m0wvAZQu2wVVvDfns813Jli7bQ42BvzDyczUuMUBIssBh3PtAvLVpxTafMEER4tvvutYoLUHOohOZ/FNAiusP9WLZAZQpx5M0+WwLPPyhwJvhgwbtRnH/2gaBK6sIcujVJoHd7XqnMvVti7i0DURnDbN6P+O6C7XfAgX3+x11MN8TOh0YQ+n++gttp6nRYQdGf7cqn7Sh7u/riKTEQ5DV6sWU6Wd2pwNGXtisTYJuSz2CNZT5cBXWrabajcwb84yC6o9qHkKcrqRW4SJTKSsJ1pBifHZjGfP8PWbKRcSak+ush7+xV68YmX7Tzil1V9mVZwFQGYCjHAx3vmBBSXuHUtQUtROiCABgLjGOym1i4slD4yKB2yXnkrjNUex+Z7kGYBCweGHH3vDxvhDH87dIkAbvVkQkauG1MkWyiZ2iHCUfeg1whONL9FWSqYzxrEJoEjT/Wh0HYlSLYTW13zzjQAOTnR7/EYg7oRm6NyipmLvJF0IvqOIMvaBiBMeZr6orKmNW56hsqQGvLOUZfJXOT+KbsklKbku/HCJUYsHm2AsRsSkZw1Uetg8/0VdVR8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE44bmRBcWQveHl6amRzRzd6NDBFWDZ6MGk3WkU5ZjBXVHg1Z0d2K2R5K1Ur?=
 =?utf-8?B?L2UvRmcvdFBzVnFwaHJVSzUyS0FtZ2lwTjV4QTFwUUtDZUZ0cUVySTF1bTQw?=
 =?utf-8?B?VysrL0dGMGtOR01LV2R3K2FPbWlmR3F1TmlPeWZxVC9NSE5zSTkwWDhWdk1P?=
 =?utf-8?B?QkhCYTFNUE5HcHI2MTl4NmVmZWU1ekpOVzkrWi9vQlFEM21FbU54cmpmNTJX?=
 =?utf-8?B?Y1VBc2hPMEZpbHFqcFBlWCtEOXhjbURpVjZCN0R6OEdYZXlMdDl0NmJ1RVo3?=
 =?utf-8?B?T09qMll5Uzl2RmExbDRqQXk2cExqZFlmMGFwK2FmSlVMSHF1ZTVyN2RxTngy?=
 =?utf-8?B?cXNpM0w1WHlEMDV3VmRnV2JvMjB5c3RSVW00NkZEbHhYYzN2Q3JYSjBvd0FR?=
 =?utf-8?B?R0VDNjRHOUpBaUNCc1dJZlBUQVp2SnFRRk5SdDZFOHNsTTB5R2xGT2FHYzV2?=
 =?utf-8?B?RWpVRC9XeUhzNGJ0aUkxVjd4ekt6ckZibks5S3F4YW1WckpsaEhuZlRTQ05F?=
 =?utf-8?B?WkpROGo0WGJjbkRlcWZjQkRaR285WFVuRTI2ZmJHSUlqZnE5Q2Y4TmRmb2ZE?=
 =?utf-8?B?SGJzME1nTStrM2dJaHN2VlZBM2FrUVlqNzlEZTRib0VzNFdQOEpreHZxK0lD?=
 =?utf-8?B?QzNwWlJrVUZTNzJjRjYyYWVrWVV5eFFoK1pGKzk3WURIV044WTFaUU11L2w3?=
 =?utf-8?B?STIvOE02N0lWeTF5bTJjZ211S2g3LzBYV0ZDZ1o1cThHYmE3NEsvMElJY3JF?=
 =?utf-8?B?UmJtMGowcUxnNXhUNEQrQVY0MitCdWdLdzg0K1hNSlNEdXZ6UTJodlZ6cmZm?=
 =?utf-8?B?OFNJd3NuS1IzbnY3N3pLclRNeUxPVjhSZ2MwTExjRDJHTWh5UTZWK1M1U0dJ?=
 =?utf-8?B?ZHA1SEsrZElBc3d6eUdSSE1RU1pKZnFBSmM1NXJvRHE1bnJqMU11bjV1NWxC?=
 =?utf-8?B?UW90dWQ1ZHV5Vkw4Q29COTRlbG14VWRNbGxaR29DVWJNQnNqOFBFS2dBNFRs?=
 =?utf-8?B?UWJ3Z3FTWWw2Q29KNnJqbEZjckoyMXlaUHBlQ21lQlFlZ0NjbXBwTzNHdFFv?=
 =?utf-8?B?T2RrUEdkNWJhdkpaNnJCeWVpUGM3dEg5NjZsejZXVmRVbEhIYkxZTU92dm5s?=
 =?utf-8?B?azltdTNlelVYUDB2aFVySjFkYi9zOW9OMGpwWXl0dzYzU1hhRHRndjg3S1JL?=
 =?utf-8?B?ODZJZGlBNWVTTVROSVRvdmsvcGoxSjFFazJLelVpVitML2lnOGlCbnkyQmFq?=
 =?utf-8?B?RFJISXNSN0tWU05Yb1dqZExqU3pUQ2lqSWdKaW4zSDhRUmdtbDFUTVZBWXR5?=
 =?utf-8?B?Wm5Eem9aSllFdmlNNlVmd3A2T2g2VC82Z0Vnd0JiS050SjFRZlFsMVBqOXR1?=
 =?utf-8?B?VllaUndmRmFUSXJnV0N0ZkZLbHdTMkw0L2NmeEJGaW9MQU5kNlVqRHBmQnhi?=
 =?utf-8?B?Qzk0OWFXRDUyKzhubVBSLzR5Sld6QVNkOVJlUi9COGxWSWhaTmhNZEgrbVdK?=
 =?utf-8?B?c25pM0ZkOGNYTDh6blZ6Nlg0N09ETW5IZEs5bExUSWJiZU9tZG9SK3NSc1VI?=
 =?utf-8?B?blk0TGJSZXBKeXNsOFRxblM2TDRpU3JneVZzc2t3TFhiNFh2MVlWdUQvaDNT?=
 =?utf-8?B?U0ZQTDFoVlk0cFhGclNmR2hjeC8wM1JuYlB0QWRoNEh6NzJsMDhPZWRWSHNw?=
 =?utf-8?B?SG9pSEp2Q1Z5b3cyN2o0R05FOFV4RXh4ejQvaTlMM2hGOXBzK1BaYWEvcWNi?=
 =?utf-8?B?MXJ4YWRMSEVZUTdzMTdadGwyN05DNWdHMnhkSDZpZDA4ejB3MnZhSGdXN0ZM?=
 =?utf-8?B?N295ZC8yQnlxWTFHWXNiRk1LMHF0TWY2WWY4QlFpSVN1bGNtejkxOUlhUEdw?=
 =?utf-8?B?YkZtSjFKTUI0NTZnQVk4Q1FpVGtxY3hqNmd0L2JQS0pZaEdZeE1JL1VWK21L?=
 =?utf-8?B?ZVRtYURaVmlrRGZLM0VtQy92QTl6b1JMcHJUZkVqTUU1WlBjUEwxUnU3SC9V?=
 =?utf-8?B?MUM0Tk9aL0tzb3NDb3VSSHdRUWVjT0lpd2Y3K0t2YTdSNDJ4ajIxek1KaHdP?=
 =?utf-8?B?RDhUbmZkeEFaL0x3UFplbXBhSjlCcXlsS2ZndmxYTGUvTVpwV01LT2RqZnVJ?=
 =?utf-8?B?WDhJdkxmb3IzcDAvd0QybkJUc2VFbWk2VStxZ0JqMWFqbHRhWnFrZTEzM1RN?=
 =?utf-8?Q?V+72Wgg9055m3/FWJfzLXbQ=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7167234a-d4b1-489e-4ad0-08dc3901534d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 08:35:03.6579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jUxuT71Qo4yv81LVcC+8W9czYZKbiKmK9sCA4sePsdRX0JWLI3Y7HVKFU30vovdARSQ4BAnR0v9s/+hlovz5tstB1tU32ykN+RK1I8QLL0=
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

The XMOS XVF3500 VocalFusion Voice Processor[1] is a low-latency, 32-bit
multicore controller for voice processing.

This device requires a specific power sequence, which consists of
enabling the regulators that control the 3V3 and 1V0 device supplies,
and a reset de-assertion after a delay of at least 100ns.

Once in normal operation, the XVF3500 registers itself as a USB device,
and it does not require any device-specific operations in the driver.

[1] https://www.xmos.com/xvf3500/

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
index 58cf8c81b2cf..51c4c074d158 100644
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

