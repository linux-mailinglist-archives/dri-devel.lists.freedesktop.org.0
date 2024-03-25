Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92662889770
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 10:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E077310E6C5;
	Mon, 25 Mar 2024 09:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="Ud6g/Hiz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2139.outbound.protection.outlook.com [40.107.7.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB90D10E684
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 09:15:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IoZmCoul5BI7Yz71/azGOqs6gjrtDJ88afjB7N3/jqLnhQlkDR6R1ANOaVU0yGAYsZN9M4ap8nHJMiQzRxITDM6NnAgg2PN1uCUJZ+Ci+gkaaUEXXLoR58JfnG4uW205f8dBWG/VrUdSrimP9PifzdaY9BTaDXVfQVBTPnRa7kq1zIdHms5hL7uyXzN9iixK4zdb60rHt5Cw1+qItS3YPQV/fFiUdtwHDX9y7GZuM3eTzjxWWwh3IUVWMKPolYE+uGF02cVqCBT309jvJIpsCpuEbxsStIFrWH7vXymclahBgvkq48iQA5dFDuxV1C2K2UGexGzjzTvrbqT0vO9qFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0i+W8GryJ5fTxOdddYdgKCq4aMHZ5qqCN6E+23nstI=;
 b=DarYYOCVTuoUdIFHmwqn6+T9kMsKHDNlbfHdaiPcK4RYYeKToKihLPrjcnnUoxIZ0uvOUfrOUXZoanE44P2k7nnLUp5anDTA4TGGKzbr3EcCRzQ7kOXbxL2Q/SpTFxNcGVO86Zsfs5SjW3kEGltWNMqrJ7fwANBKHcmmA8rkSiIAy2xXt2HsWBsNh4PzDW6pPEadx3H1x6ETfDP7GO/2ckI3Ip9c68dXqlVfgRrasKrgTYP20LeAg/YniS10wcyLE6KXA0VyZGQXSAiHl7rQCacnM9EhcgwxLWoWdqvmDFCfLwOk58UcHR06lNFJTph1w0DBLcrHIj7SJVEkMDJRCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0i+W8GryJ5fTxOdddYdgKCq4aMHZ5qqCN6E+23nstI=;
 b=Ud6g/HizAsfXDm5mSLuJAv3Q5JzikLq9bm+Rvxi5GxG7cyA0d0TmiSXJoVBKNCU2i1ocLu+KdYQBTF06svKUV5a4nlEdtDrLX1ncur0b3FokgriekdJMQM1GHSTz1KvHuCvLaYQ80WmzlaQCx/out1ytiumL8DIwUrE3ZlYLlgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by AS2PR08MB8951.eurprd08.prod.outlook.com (2603:10a6:20b:5fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 09:15:19 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 09:15:19 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Mon, 25 Mar 2024 10:15:16 +0100
Subject: [PATCH v8 6/8] usb: misc: onboard_dev: add support for non-hub devices
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-onboard_xvf3500-v8-6-29e3f9222922@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711358115; l=4134;
 i=javier.carrasco@wolfvision.net; s=20240320; h=from:subject:message-id;
 bh=TZQhiTzzMHNkCwR9rUpRWSA2CA31wBBLiqLduAbUesY=;
 b=z0OodHFpcDutdzh6kgspB8J/l5t0Eft3WNWWdk7b3MsvI83K7+57eQJE7s7ouge+aix99+X3Y
 nF+YZvLHgyNBw3cj2KzGODqYd5VUJ0kPDAOjHl2yE2CtvjCbC+pABsK
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=Vxk2/0sGIxM8rsKnceszFuSuHVfQwa1Yo8+is7BX2nY=
X-ClientProxiedBy: VI1PR08CA0223.eurprd08.prod.outlook.com
 (2603:10a6:802:15::32) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|AS2PR08MB8951:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f5d71b-7dd0-41fa-bee2-08dc4cac1792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xi5qVsQUAxCK3LVnGYIXlqZ3ojDGOd8PxdkrV6+uZuRIx0BokqyISSimY1QqVdWHjFYOqqp4iZ1NMjxhdKYkZAT+GjxiSrj6U8n39U/eMtQOJdjIQb6UQICFx0Ye1ey0M8aQ0F5Qiqnh1VaDYL7UePULV9cc4WSK2nYRT8SJ+B2g3G6lWa8nXLBed0YOX5kNaOSmlu62WwpkKQpncZF/nXPuZuoH4Y09nZkW9xWkeJTGhIjfA1t7WvErQLY8EwoTuzeb+0Gv3XzirCtWD6LxB/CFFDbyVMLhfAlI++MVYMEmLKJgoaBCBqZlOOWL0DOgDsMIH2SGy5tv5kmbp769lbo8FoKPSpexNBTVZSJhMxrklLIO2UBBVXxK1SP7o3cLq7OetmP5b/EsIC3a3Zbvuvk3tNUzO8uYMkVNcBWWIIm3Ei6UAv5GpKeGbOOUdHK2UkpMsm2V6/y6KUgcydjr2nbjnQDGiVb9J697GBRmqWqEWABFbNs2oMdBM/V0yijwO4Cd88K/DryWDrWzUQpYiJaI5+W8YKyBxCtEOswjkWXa7jpJIIUH0XZea52o7816RSnpCEKQKOQEDdpNnP1dJ+WKsLVLXfDSJCUTuIHkFgGOWk5jObjt3Z4KOJug31ME7DI8yLOWlOHFlCkkTw95rLSd9TrLsBL1A1KsZqy3I0+T15WEUTe3PQ+3CDx1T1VnjWQOgYxeoSAsVX7fEDWxwcEDsWUIePbYTZgdANAtjq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjNGSVUzNXl2K2dBTUpGN2ZHaWx2SXRqaVhTTVdETWZTblVnM0ZBQXZ1WWVG?=
 =?utf-8?B?QlliNGpDYzEzNnRBK0ZaR1UzemlXOXlDdlE3aDlZM05EZGpVNkVJeW1LeEhG?=
 =?utf-8?B?RVF5QlUzallJMmxnQk4vSUIwcS9JWThuWTVaVEE0NjVvak4yVTd6cFFjOC9E?=
 =?utf-8?B?UGZMRXRLcWNTRzM1YlVXMWhueFgybzd3TTNyRHVNNXB1NGFaL2VpSmlsOTYr?=
 =?utf-8?B?NlJEOVNERVk1cHVCK3NGU1Y1UDRGdWJFQ2NjNWkzMEJYaDhBUUVTbCtIRTMw?=
 =?utf-8?B?aE9FdFQ1UkVVMkJFclFUZUpqMmtzRnJQbG9HS1pSaHphZFpWTXFQb0dQU0Rk?=
 =?utf-8?B?eTdrVWU1Q1lWazhmZS9VTUlUeEsyMnJHb0U5czZXSFhmQUlEVHJMOCtnRlli?=
 =?utf-8?B?M0tQRlcxVVVqQmx0QkJVbit3MVlwaS9PdHFXcTZWYzhvaVlXelVzUE5vamxR?=
 =?utf-8?B?SlV4Q2lpcGNkSk1jeHBjOXdlVzJ6c0thUzdPVmVINkxXK01XQXNqeGlZdlJB?=
 =?utf-8?B?UVROQWxrcXpYOVBFQW1ldWU5Z25qc09lbHJjVmNEaTBkaGplU0I3UlBkTGRP?=
 =?utf-8?B?RjZLVmhXb3U4SDJpODhBM3NmckZVUHdabXlrTWltalJ2YXJYL2tyY3FWeUl4?=
 =?utf-8?B?cnpPZzRqdkFIUEZmWTh5WFhDUG5TREYrL1VRS0U3OGpHa3BJZkhVejc2UU5Y?=
 =?utf-8?B?a0t5ZkV3c0dRTlcvZkZ4ZEIrRHZaeUo2eWhpcTBERTdwUXFmSWo3Rm4xQ0Fa?=
 =?utf-8?B?d21TRnpBeE9WWFB6Z1pBREVNYnNVQzZvK1FWR2pxRTR1R1FnbTFQTVN0TVpx?=
 =?utf-8?B?T1RML3FMaVp0QjVYNWNDRHdGQ04ra3FFQXgydjB3cWlvZ2RMeDBkSitNZ0dQ?=
 =?utf-8?B?bVlSdElsZUJ0ZFJqVnJNU3pseWcwUzRkRndPNUtES2s4WDB1UG1jNFIvcWRz?=
 =?utf-8?B?ZlB6ZjFRaGpia1lSU1hVcDIxY3lpMjVPQkNYNSt4U2xVN0UxRkI5Yzdsdys4?=
 =?utf-8?B?NzZUS0ttSXBITWgwTEJSMVFxL3lFWm9OUjI1NVJrRFp1Q0FpeWF0TFhjbDN0?=
 =?utf-8?B?MkdXSUdlWm5VRW1CcmZ2VXg4aVpDdFF4OUk3dUM0VWszWDJTTGI1d2RmMmQz?=
 =?utf-8?B?ME5TU2tkbWtiaGNpN0pJZE5XK2ZHZHNRRVBvdS8xTFR1ajdIbEpGT3Q1eXZs?=
 =?utf-8?B?V0VLcHpNRFFiZXQ4dVlGY0lSdGRzWlBrUWExUkY2N1I5cFdySkhtNkN6dUwx?=
 =?utf-8?B?cG5aVno4bHhZQmJ3QzBLd05mZjZ6U1FyaWQxUnREcFVOM3V2M2lUcERSc285?=
 =?utf-8?B?WmhHa2toQk93dWF2VzRxWXBZOUlEM0NwS2dCQ0tOUzF6bEJxZ1FCbFFpUEJh?=
 =?utf-8?B?VStVNkxqSlN4U1R1RkNyc0FwL0FmSzVjZWRvRkhZTStIeFdoK2lJRWdRbmtJ?=
 =?utf-8?B?dTVTWjhLSm9KLzdSOGZFbXRPSEkwTmlSa2xUeTRLQTQ5aVoxZ2lVZW1OaXp5?=
 =?utf-8?B?MWdDcjBEanhNNVpQUEhBWkpNODBVWVIxL3d2N2NnVHA0L2JYQ2VENHlTc0oz?=
 =?utf-8?B?OUhhd0VTZDY3eFZJMGFHZkVQOGlIOEJNMU5sa083UGkwZmZWOUZLQkhualBL?=
 =?utf-8?B?eVEwQnBrcGdXemVIYkxIRGpTL3NVSkh5UHVrWDFPcGEyTTlWSC94ZlY3S013?=
 =?utf-8?B?OWFjNXdXL1RPUGE1SHEvNVpoSlZybitnOG5PdzhVcjV6RDI0UXp4VnJxVGs4?=
 =?utf-8?B?cGtHV0k3ei81VVlTQTErQkF6Z1dZN2ZtcElPdS9EcGdNZ0tTRVV0UFQ5RjhQ?=
 =?utf-8?B?WEVqN2EydUZwZEZ6TmgxWDNCblozdzhyUVhTR2JiSll4WTVUWEhPckFLQm4r?=
 =?utf-8?B?azBHcFFUZHB2RGsyM0hCZjIyZkFYNmp3cmJZSGxCc2lEV2pUV1gyTzVHTWtG?=
 =?utf-8?B?UmdTVnpuZmxzcDljNWoxWWRDQXBJcmh6YXBnak1lZ2g4UHZFek9TaHFzUXl3?=
 =?utf-8?B?RHFSOS9yY0FudVV1RGdSdmVCQllUdnZQNEFRNTM1bjNYcTNuTVZ1VGNqV0hK?=
 =?utf-8?B?Q3dsZUZ5RkZnZ1BHdHZnWXJDbmxlVGFuWjZRMGs3ZllEMkJmakk4YnF1UnAw?=
 =?utf-8?B?LzduUDJnWnp6bk5BM2Zpc2lOc2N2cWdyL09hNDhwQnoxOUkrcWVMNjYwREpj?=
 =?utf-8?Q?37BvnpVw4bmYbV4dfzkulKg=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f5d71b-7dd0-41fa-bee2-08dc4cac1792
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 09:15:19.4638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2RzPfEvjW7jOk5qREGFHpPMTmM12PnHzctN2R1FaRc/Pg1QW+ODiFcJZ1OhHL+U6y0FgTw6oJSCf43rH9Tt3WkL5nREjxFMbmaQa1zuRpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8951
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
 drivers/usb/misc/onboard_usb_dev.h | 11 +++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 6aee43896216..f72f47edd87e 100644
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
index debab2895a53..b6fd73f960bc 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -12,66 +12,77 @@ struct onboard_dev_pdata {
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
 
 static const struct onboard_dev_pdata ti_tusb8020b_data = {
 	.reset_us = 3000,
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

