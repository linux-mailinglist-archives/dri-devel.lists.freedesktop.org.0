Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E986F86B0C8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 14:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED4710E5A3;
	Wed, 28 Feb 2024 13:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="dD0sFLYd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2115.outbound.protection.outlook.com [40.107.13.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025FD10E3BE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 13:51:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgwijRSU0+lyb5LVRyyWWsiBmanfdTp30Q6RavFctKy3SmTamTmm+dTRI/kJoAL//caHPa38v3vblu8sfGM+eqHGOhNPD+Pghm67Y4NEfjhqZcYPmzHqqdIgiFyXvyMgbEAV319gVvizf/t/w+vXYquiPBZ8dv1gFsBAv32V6uim6S6Vnw/QsaqmgTJbznhGj29z9/JteW9O7u9J48KWA0lGsL7aV4xK2dZ+4G4/ZuclLZc2beqtNkltBneui6ru2vnlmSTBPd1w+XbpGvrXZ5CKlEE1olRruIlOCCBU/L7gKJsK9YZ62/ksFchiZep6ZbhmRymu6rHoHfmxLmr0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWJQFbvE5Vzw7duE5+7kn6h6+qqEiBfC9uNNiiWRXsE=;
 b=BcsDuNnz2GRnWumWk5bY2oEAMsdXeLpd6zfrf4lo+EjLy+R1a0hregVluviEu56pDhlAQ/FJ3b/O2gV3U/aY2ZNxWkJQS9MPnIrTug7taM1NaKwRFOMUuenhgHsDxNwKZQI7V5J2V9R6zL4xbEGbBye/ecaSV9lrCt8KPFzvo+/JZSkcE49fOFH6KgWQfARroGGa5aKx+EKfVU3Sc4MVBCon0WAcKrY1S+OG1ubHaKaWG6yoDkyFpuxNO4EiRapkaepH7pk9ib5wUhINnUh4RjCZX1Y/jksVVWTkOed4APqu2ujxzzoHb1OBvFImq/+2XKXT1Xn6KAvgLLbu9dLtiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWJQFbvE5Vzw7duE5+7kn6h6+qqEiBfC9uNNiiWRXsE=;
 b=dD0sFLYdYjnkrBfd8tvD/rgd7rNyb/otEYmCP3aCaQ03lP75FgOARySiQrpkIjBVITz27K3+wMwQEsLFSyakbUvIfRzYFJEmyMtBdcrYQ70lGfkgAwRUI3rTMzcD0v9aDRrFsTAE8l1aY0EWywnwKHPkLefIHdRJA/9LhoMGkaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by GV1PR08MB10523.eurprd08.prod.outlook.com (2603:10a6:150:16a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.40; Wed, 28 Feb
 2024 13:51:45 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024
 13:51:45 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Wed, 28 Feb 2024 14:51:35 +0100
Subject: [PATCH v5 8/8] usb: misc: onboard_hub: add support for XMOS
 XVF3500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240228-onboard_xvf3500-v5-8-76b805fd3fe6@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709128293; l=2770;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=7uolw8TzhAMtSEj/CErKecOOv5yl0AvDwugbftw5sT8=;
 b=J7u5aFfV/29o6IHj8U3C5wqNGUtp/9+gol4V8q8R4714FtU2RZDDDxddvF/2hrNQxYBLUM9co
 CIERoogcgAEAZFeTCRDHTL3tlpEHfCl0dBP1v/5qH+KREPNqBvYdGS3
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::19) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|GV1PR08MB10523:EE_
X-MS-Office365-Filtering-Correlation-Id: d8dc843a-9585-495b-0d20-08dc386466fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KxBlBDD3hshvbYewtq4NWLS4yemLbwNK0AsIFyIaTWumT3Bfr/qMEBlPQeFQWFnVmA/49t1wDbxVbjH2rdu33ySuQdT0wPbjvCbvaKqvW6XwXHbLDapPZI4Ntd+SjNVo7ZIqmGi5XYNHKlmeusMEbaqU/XMhkVIj6vxH232FvlUXeP6i4tlip8sNG1A9YVoDRuarOoz2Nm7I6F4AaGsTExoLYqr3lbLD04Z9YCfzGc3Ed28WuWNaqzFfxLzU3jz2eXgAfOz5ygJ+e16fjpAWqKoySE2eNM57Kp0RaOqJ/t2C8sw42uhJ3Pr+VEsZY6X6ArDlHHijR0NzO/kxUspZHiUO0JPqYclmrNMvj0J3C0eVb86CHHS55ilQhmFpZpVRLkU5RJDeK0MlOECCG7ZzAn/dmz2krVecLGLUQfQor4GuVuu7CUgNXsd2iB28LCKvFXdwKRXy/+z//AdBQe2EU0aGmOJ4SX1NsQKfkRQaFEwYPnsHlMz7aElpzJvKwqF8Q9P/43SYO87ikxrbdVaoWY1SpxVAHDUBQm6QIlPEOdUl8hRH4DZb687lc0Ms/WnTgb508MYCjkiwJqMj5guWQ0D1V6ojJE2MOA5KJWAy4uFns7V2BZlT8+xatQiySTBC2SD1opjz+bvX1pFRorTLfFi6TkLQU9ks8c+5ErkeCI7idHUc9lUFOYTwQUD8U+CCrFX6o4j7nV4GlIO6vbjq6z38JaxgQ3ikBUs5jjl1a+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmRmNGZCS01YVzZxUFRpeGJwWnVEQzNXbUZKUjU2TTQ2clh6YTRHV3JnRGNE?=
 =?utf-8?B?bjAzSmpQdlBoVkljUXZjNndGUUhUT3VPTWNzQnZDZGs4Q2pROFA2djlhU3Nm?=
 =?utf-8?B?VTZNOUkyMEtHNFNZRkU1eCt0V1Z0dWp5SmUxSUxSZHk1cmFYU3lPN0dCYWQ3?=
 =?utf-8?B?ZkhTSFZ0UGpXNFF2SytzdXhPdFJta1NCd0IrVEdWSVF5WHVTTURyb3FkVFpD?=
 =?utf-8?B?MmtzTDdaUjdhYVFsdU1iQjNCbUs4T2pOc3RKNVdlWVBaZVN3U0loSDJnUUl1?=
 =?utf-8?B?bitPajJYSXczRUgwV0tobkQ0TTlIV0xGR0dTTThkMXpGbXVoRk90N3RpTjVR?=
 =?utf-8?B?aU85T3pBL05wdjR4K1FRUTI0WDhjS2VaWGZXY2FzMitNUWRBWXM1cFk3TmdB?=
 =?utf-8?B?Ykt0NXNHZzFoNHpzdTN3dzVRNXIwWE5zQlVzd09jRnNVM1kzMk1RTDAyQTRE?=
 =?utf-8?B?N2NRR0VEM3FZdU1TRk5RUFB5LzBRa0xxSUgrQmdqd05OVUcrT2xrM2lBZ2JJ?=
 =?utf-8?B?RDRFbURMVFBLbC9yN0hNTEJDd01CcXFGYXlWSTFLUCtLeUFBcXNhTjJiR1ly?=
 =?utf-8?B?cTY2K09zbnVhN2ZZV0Z5S21KVGUwbCsyUHF6bnZoYmgyRHlPeUR4ZUJwMkRa?=
 =?utf-8?B?OEswSmc3QklEUk9FYkM3Tkp4SnVCNndMTWZtTHlMZEpGdHlXTG1lVUsxMGZX?=
 =?utf-8?B?ekFDSnlOdS95S29BcmZQSzRvTjJEcDV6N2NFZlFKaTRpalMrVFpOSnpMeGFi?=
 =?utf-8?B?aktnVXlGSmVxV1VBL3MxVWxBc3UwWHFMSVRtTlpwU2V2dWZidTRnU3JhcnF1?=
 =?utf-8?B?QWcvRmU5VndMeklyQXFPNzNNaHhiTnVJT2dtdXJ6UUZGQXl2c0h0ejRxR3hR?=
 =?utf-8?B?Z3A0NUVkRm9oc2dKSmZkaFROZW1FOTUySVpLZ2twVGxiQTZXQ0lRdWtSWU1M?=
 =?utf-8?B?ZWdwanI2UHJrc216NDFSdVBBbFZpb0lCbHk4TWdHbW1EdGwrcG5sa2U5QlJ2?=
 =?utf-8?B?dFhjNEJmeEZXS0FPbExFM2JLNEdTWVZsSHJYUDdCSU5sM1VNaUZubnFtajBS?=
 =?utf-8?B?aENCYTRoUFRlVGFiWWthL3NveEFxd1VicTl0SHZzOFZSbDZ1WkR3aDVGY2Zy?=
 =?utf-8?B?KzZod0F6TXJONCt1cDlMYmFPZi9xbmxEZHc1K1N0RjBZL2RIM1NHeUkzSXdL?=
 =?utf-8?B?dTIxcXhsd1dIVDE2VnVUQjZkQ0VJV2kzeTRTa3FmZzU2Tzd1Nk9pQkJlK2tI?=
 =?utf-8?B?YVZiL1hORytBZDN3UlgraER6Zk9sOGlMcktWQXZrYmw1dmo5cjRFNmJ1Z0Ny?=
 =?utf-8?B?MDlIRzRXaURpRjlHbEp3ZmgxMGdvZ2RZU25yNlNHVWkyS25naGwvZ0YvaTdW?=
 =?utf-8?B?SnBiVHF5R1pseUhzUC8xZDdXdU9KRWFVTnp4QUVjUy9jVUFZNzZBR3hsOW9V?=
 =?utf-8?B?TnlMYlE5ZkxzV0FMWU1PU29FVE5LZ0xRZWxBL09meWFDMzhhOERyeFVScDdJ?=
 =?utf-8?B?YlljajBBdlU2bXFTYWVBZ09oOTlVcm94NXMyZnpPZnV1aFphYTBXYm9JQ2Vw?=
 =?utf-8?B?Qk1IUktiTk1Gd2JWR052aHp5cjdXRkw5WERHNTc5bEd4ZmQ2ajVlekV3cnhD?=
 =?utf-8?B?SHVQMDBFZm53NDBaVGtkeENrZWdGVDBBQStQdTg1V2xMYkNNaWlMUlVGRDBs?=
 =?utf-8?B?UTZlVmtTMWZQWkNHMjBqSk1JTVVJUGwrLzZBMmFRc1RVeXluUjhWck9HN0FJ?=
 =?utf-8?B?UFVndUdaMTU4aVJWRnZnaGM5ckJsSUFBZHI2MU85d3l4L3FPUi9YYUM0QTRM?=
 =?utf-8?B?ZHNIVGVMcG03WjZjOG81MXgrVVNCdFdsd0FuZGZPY3QwVHpXbi9WRHVEcm9i?=
 =?utf-8?B?ejdNSHJWV2l6aEk0elRidnV2QjV6eUNDcldVRmp5S04ySW1IY3dtVVI3UjN4?=
 =?utf-8?B?UDc1VU0yMWhYbzBMZDJlOGtzQnppb2FZSmk4MFhpTENJTWd3d3RWNnZrQ0xZ?=
 =?utf-8?B?dWN4UjZVT3NtdzdCOHZpR1lUOUJVeVYvUy9VcDRwYkV3dzdvelpsa3k2cnJB?=
 =?utf-8?B?SFZXYVBseFI1VUVDOENVSXFyNmFqejBVMmVOanlmWGVSWHNJbENzeFJzbDEx?=
 =?utf-8?B?RGQvVDdhaStaSU5rcE9sRTBzR3dqeVJTYnpNaDNVcUkrbzZKQjJwV1hGajk2?=
 =?utf-8?Q?whN0oM96s88YGlWlfscNUhk=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dc843a-9585-495b-0d20-08dc386466fc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 13:51:45.6784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlqCgjQUn8ut0e6Bv+MrbOUZvxVg+frWzdZDe8hXYGRMrmBNJ03hec2XpTkmWrAfGhUy3lX5irVBCWnm4wWcgdtVryg61Q3+V/xGBSK8Jp8=
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
index df0ed172c7ec..50f84c5278a2 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -405,6 +405,7 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_REALTEK	0x0bda
 #define VENDOR_ID_TI		0x0451
 #define VENDOR_ID_VIA		0x2109
+#define VENDOR_ID_XMOS		0x20B1
 
 /*
  * Returns the onboard_dev platform device that is associated with the USB
@@ -497,6 +498,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 */
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 */
+	{ USB_DEVICE(VENDOR_ID_XMOS, 0x0013) }, /* XVF3500 */
 	{}
 };
 MODULE_DEVICE_TABLE(usb, onboard_dev_id_table);
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 106480ce72b5..858f5814165a 100644
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

