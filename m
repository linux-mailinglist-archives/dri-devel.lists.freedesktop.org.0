Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2C286C39C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DE010E2F8;
	Thu, 29 Feb 2024 08:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="1Ba6YloI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2110.outbound.protection.outlook.com [40.107.22.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B28710E116
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:35:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdRz0sSq2JKST5OPBMhTb42Wf6b6irP3+pkTWopvQCVPJRGC9LhkgZyMn3Vgzug5JO59uu7f+ie2amb8ADpdPm/omIkOT0zk0kuRJw9+OHBealfmU2m7Jk3e2dYxqMYU6oJpoD4Ea34XdtAAs7brdzMTjWPbFDJPO1RaHSf3C5WcqBuAyW75YFgQHd9GkBdR/NZchYVANFgwo+AfItVXWiNkEU49VIUFKFzDVu2TyjbMmfPZTDpSQUG33bbZNaIYR/suHmDe7zQ6CekpITzMQmaLKDBwSG14Vq/06eVi/ot6rPKLHWsdZPoHT1ck3iqoXXO8C7usva/tXghAyaUNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds6itwYkR9TL4kKD6AgurAEc7kv/3VVG8//qRHS0lNI=;
 b=mMAPVqcpjbmfeigAO3MJlqW95gIEzZjtO9DM24UTKOaa5ihi4HksoZ1Mi9yvwh1A56jykgfHSntw3bElr5SSK8ETI6guQge7YOBpTcVRMjymcOqXaw8PHG71xTF53XnnIBWgfa/CxMR8kxPJ06A82kgBiGIcuuinydkvTCNwo+pExyUtlkR7tFUiD1QI8FzBSLyjb2vFeFgmZNXJ18jghHEbCX0SniHV6+Pib4nxckIKK+wxdcCg9JCqKq1u5W35nkSblKaO8OVp21dEn70YegL0ZNAeIZ7eErRpS/bMiFRsc1wsFwq9IN/mcapuqTi1P5tpcrjxAmW7enzSZRg3zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ds6itwYkR9TL4kKD6AgurAEc7kv/3VVG8//qRHS0lNI=;
 b=1Ba6YloI6C/qkw+p/9zwIwoiztMQ629o/jBg+9XB+2xgF6rij+TgU89exEVB6D0CztCCnWzgwtuPO28o7kIClzMkqGFkOarQ6sYq90UZimI1ZWchHtuPgpUWLVYfEgbLqHD0XtbyWy3axDCJv9GZxZKGHcUFTeVnYvoMgWva3xY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DU0PR08MB9727.eurprd08.prod.outlook.com (2603:10a6:10:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 08:35:01 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Thu, 29 Feb 2024
 08:35:01 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Thu, 29 Feb 2024 09:34:50 +0100
Subject: [PATCH v6 7/9] usb: misc: onboard_dev: add support for non-hub devices
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240229-onboard_xvf3500-v6-7-a0aff2947040@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709195691; l=3959;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=vfQGF7yQinSaT9UNhA3JHy0/iTESK+//H4eVSAxy678=;
 b=GK3bolSX/KFdmigmvWTPqHOLsYen6j6QYuOuV/sku7/6iJPSUwEh7scxNJEaBJapt/BpD0Cbc
 lYPOX368xBvDYOPnHiEASNSmsjn/2ifwDDOnVTxutOo0RNFrCiU7sKy
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DU0PR08MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e524da-2d7c-42cc-ce79-08dc390151e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1M6CKcGB/2soMq6pkVS+haxkMOxp8lrYlDhfARj0zG56YGyUAERZvE+eW4Rizt8vlAfQ8/e5ikQHLjh+ss/GK+ngmATSJQoP+Ims0++CFFkbNl4eLMqegbN1IhO7vvAMyr7THPNq2Ne51bwcCNB1CRjZrb6K3azWoc0hk0VvpGaawN1CVoPvsFcHdIO1SMv9pyhZnK9NGdBDFrz/VKooDAuSS1ahkZwGvHNVeQOzle6QZqUF0wmSvdFNPrSyrUd/DacF+l3Xy1DK8U0bDcSFGvV/ttmMSr2Ayn4I0r13D0RKE/9R08su4PFaUlqs1GFkaD4WPdFXlzN+0JsIgEK2G8upNILvUOnz5Qm9jSi2vGAPvmNIIfKnnsXuMHTQaHeBAMrUwSJd4LOB7VA/O2pl0kI+BuNiAFt058nE4Q5gVwlRQngaAizMxzfj5KYcT245zpRdazwhK3QlIzjGy+UEFdOKWisv2rfOBAV1Q7UK5/EK05XRYIuq3euGlrbTPiRKArvVrm4QbBYcjKmbMc9d2JS0csNnxBpbyutsPgS2IXzGJ6QDSiVXXKsWjZnk+KFxKoIx0r/W3y6ifBCvLKjwOx1g7d/CK5dsZcF1YObJpl0N+vj7/Aax9QRQXAc5vf9qBXor62Mf/RzX4wYAQzMKw5BK4RYsX5vrH5vrukPZysWeUx3d02PjdKhHP+pkwl4yiryl39C0MEU73DwS0Nn/K2z+FE0lPW2e3f48kLhwuj4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejBiVVh0OEpqNW02R3ZQeWFXajM2VmoyaWdyRzFKSXRWVzRPQU4vZ25CY0lF?=
 =?utf-8?B?NVlDYlVrd2tuaUZZMmpJY29pMDgxSFVPVEZhd2VpN2wwR0F5aHl3Uk5KdzBT?=
 =?utf-8?B?UW1KWTRNU3dkZlpzZE9rZ2VseE9kZTg4bmJTRC84ekdiYi8yaWIzODZDeWpo?=
 =?utf-8?B?MllVYS9wVjh0Tmg0SHVaZWhpUzVEWDQ1c1JQejhKNFluZDU0RHVWOHBjRThU?=
 =?utf-8?B?VWtlOUxpaXJ3VHhMUzZ0QWYyQTJwSkQ2WGtVVytMZUhiSDBSY2xMenRIZW0r?=
 =?utf-8?B?TCtkbFN5dU00RWgrUllQcjBJRWt6MVZJMWFIcldIcHZCL1RYd2Jnc2RuanJQ?=
 =?utf-8?B?cWxOUStlQ2U5ZmUvWWJTZWhqeGpRU0t3aC8xek81dGxnYURQViszRUhjV2p2?=
 =?utf-8?B?U0xLeUxodFhzL2JKZkFIQ2FacWh1ZmV1cklpcTI3R00yYkpRVStLSC9CckxX?=
 =?utf-8?B?UzlOVWVDSDhIUjNZWW05RE14WTNzbU1MOFRydlJES0Z5UUorQ2VJVnVvQXpo?=
 =?utf-8?B?QUtLeGpPSktJK1d3TDlUVXRwQWQ5MHRNMjRSS1BGam1ZM1MwS3JDL21HektX?=
 =?utf-8?B?N3J2b01sUEVrVTNtOGcxWEtLeFN5US9MUStBYnNpTDBJUXlRcUFGZ05ScTUy?=
 =?utf-8?B?WmZucHpSSXhRdjZUQVhaR2Q0a3hvZ1FXUUQ2OUtUb1BhZTVZOFFSR1Evay82?=
 =?utf-8?B?MEpvZXBGM1VxcVl5cUZwRWdsbDY0c1JROGd4WE1LVmcyY0Y0Z3ZGVlpxZUZ3?=
 =?utf-8?B?aEhFdGZHTXVRL3NjQkFlTHpqRlp3VEhOakRkUlFJcW1LbWM0cEhVa1hhRHZa?=
 =?utf-8?B?dUhTVm56VWl3Z2E2bUxFV0lOakY2NWxBd25jNUtURU42S3VKWDBqWGZ5N2h1?=
 =?utf-8?B?R29zNHNLdmZIWklCejFCM2dNaVV6aDFyVmZxTE1HWURueWhlc0tESEFUUzRv?=
 =?utf-8?B?Rjl3dEVtc3NKUkYxUGF3KzFOMHBUbEVZMldaWDgwaS9vVXQ5dVZSV2ZDU0o5?=
 =?utf-8?B?M1NyUW80YzJwMURJL2d3b2dNRW9xSFRBeHhpWnFONElYTndtRDEzOE9GZnNa?=
 =?utf-8?B?YTNvUThodXlWbmcrSU9ZTjZtdkdFOG4yR0p3UGkrRDdnaVpDcGV3cHN2ZWs0?=
 =?utf-8?B?b3N2TXZNNzVBMVdOczkwVXJ3MkVwSndNdXpFRUZUbzJSVndOV014aHdSRjkz?=
 =?utf-8?B?OVFKcVRjcVd1eWIrdGxMMlN0U0JDbmp2S1I2U1BGSHBqV2tUQUpmVEI5VVpZ?=
 =?utf-8?B?bFNLWmRqYU0zZUdmRFhObUp1WWJ0MWI2anU2Ukg2Nmk1bDZkckd3WGEweE4y?=
 =?utf-8?B?bVZkL1FFRUxwUThaUGJEZWJFNVpvdlgrQlorVzEvL2cvQ3l0Vm9EWEpDcklx?=
 =?utf-8?B?YnRHdjJwQ3JqN1lOWmRNQlFhcUhVVmFnL3lTVUgzN2FTRnpVbVV1ZUFxaXhu?=
 =?utf-8?B?SVpEQUlSNHVmNExpbi9GNHYySStYT2thaVFQbTlyNkZPaHNLL0FYZ0puT2Zj?=
 =?utf-8?B?bkM5U3RsUlhndnl3dGt3VWJvWFZMNk5sbDFYUWRzUVFQZ1k1TUJ2ekg2MVZS?=
 =?utf-8?B?Sk5pUUFUd20rcENEclNxZ1NYN3FwQnVxUFVvYkVFMEFjNzQvdlBmTUlONEgy?=
 =?utf-8?B?a3BKbXEyVXJ1aS9BKzFhWHp3WWwvZGVHR0dRZDk2MmNVckwwRTBidFovaEc4?=
 =?utf-8?B?dGRiOExFQUdZZWk1NkRzOERVOFo5OUlONDFPSmtNK2c1Ykw1MkdwN0NYZS8r?=
 =?utf-8?B?MVdwYW1YTldVVXJodlFCNVM0Q2JZdWt5V1hrVmtrcjFvNDUyUlRhUXNoQ1l6?=
 =?utf-8?B?Z29HNG5ycW5DWWtvTURjM1RhNTlIK2x4L0xhS0dDQk56V21GTmFjN2lZNlFw?=
 =?utf-8?B?c0UweWZPd2hPOEhkeXJjSFcxaC83Nkp1Rk9yY3BoVEYweW5BWVBpb2o4bXl1?=
 =?utf-8?B?QmpadU5vOUFzRkJyK2lOWWxrcWZKdUw4dFVINW9JN1YrM3cwUDFBU3p4a1ZT?=
 =?utf-8?B?alZ3Y0E5ZVRGcVVVcnBhU2xWekNWV0NEa1Uyemg0aVBEcHdmY08xYUw4L29U?=
 =?utf-8?B?cmRubEtESjVDL0xSaDJFQW5NUTZhclA5V3dmWGpPSDhlZVRQbTJwS1FxQUcy?=
 =?utf-8?B?d015SXRNbTFPZVF4QUJXREZxeXI0Y3h3L3lMSUJjR2VGcUZhY1E1MU1WL0tJ?=
 =?utf-8?Q?HCFEOWE4Cvqhdj1Ie/3jSRA=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e524da-2d7c-42cc-ce79-08dc390151e7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 08:35:01.2528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9R7edYZdzUiVWj61qlLlKdUD0z8QsY4ESr2Y9E9JT2po0VPiOzpaRtjFZOjtrcL0ovOwArnk5mLqJwH2Ib0Y1/iD2JVKW6sDkAaJnJpVyqM=
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

Most of the functionality this driver provides can be used by non-hub
devices as well.

To account for the hub-specific code, add a flag to the device data
structure and check its value for hub-specific code.

The 'always_powered_in_supend' attribute is only available for hub
devices, keeping the driver's default behavior for non-hub devices (keep
on in suspend).

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
index 4da9f3b7f9e9..58cf8c81b2cf 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -12,60 +12,70 @@ struct onboard_dev_pdata {
 	unsigned long reset_us;		/* reset pulse width in us */
 	unsigned int num_supplies;	/* number of supplies */
 	const char * const supply_names[MAX_SUPPLIES];
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

