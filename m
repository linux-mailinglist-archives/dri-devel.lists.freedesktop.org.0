Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4AF86B0BF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 14:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A21510E39C;
	Wed, 28 Feb 2024 13:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="V9BZ3j9I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2109.outbound.protection.outlook.com [40.107.13.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BFD10E295
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 13:51:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6UWpQOQdNCy47XfmccfTZMYluDLoieQfOqSfQwikWfjuaFu9QdXu287ov6TjBMiZ+cSntmmroF9o0EWCCDYgg2hg+cYVepoSbky+HV9UP9CuZ0K48hqDSrguVOpzGFXnkvnHxI77HJKQ1kAIk1X+YgErKFQ6loKG6UeG8xmF4xI+41lj0aTsNk8Hc+yBUajNJ1KrcvnjtF9cydwHmKBZmtH/pcDUpFTBmMX6+LW2h5yqjdf50JEnCHHhi5wZ+MzUqpBVm/tqyigKK9/zNszoM1dCg1IGYWVIZV5TtGIMcVBZWilFdifycJgyAHgfrRUGtw4Q2qDzIe1XKAqeg42hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAs6bOrmyQn739mDtnVcwn7FPSu0LOrXuAzpN0t0DBM=;
 b=KBGdoYO4bnI9uByiT4CnVSNEkzmWZ6hJ/8dBUSTx74ypsRgohNgnmJUx1wUHhnZiF9t+vduyG9VyYjBHgHfqd3vbtXpasGkqjfFxodyGJXPkLWowC0vOJv0Z9iQ2ORHTUJf8N6HTDUQ4kCgG6AOyKWyTwwR/f7NsRI98RUyzhOGcaVtPhRDy74SSxYciVBgCCz2zk+LlHAjw/gXdPZiJKu5IF176goRk+GQrN0QIqhBs5sMUfjiPwU93dzdVEElmJqwIaN/zaP6N7xQadSWbc69AB7idATBjPk65tiyax1Rszvd1buHohWPe+8+PqsunwtUIDXw59k5FsS4P1Lk9hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAs6bOrmyQn739mDtnVcwn7FPSu0LOrXuAzpN0t0DBM=;
 b=V9BZ3j9IskDtUh+sHNdyRl6TVNf/NfxCJ3onwQ6igi719R1E4qu7ZPqfEQempdHU3p111PLqoaPuumFQTXgCYZOxx5epW8XFPpEe9UUUnjCGxcIblq+fpbWrqAskuuUd2+zachNBORZHCsF0t9sEik/Zyqet6iCwGjsHGVQdVzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by GV1PR08MB10523.eurprd08.prod.outlook.com (2603:10a6:150:16a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.40; Wed, 28 Feb
 2024 13:51:36 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024
 13:51:36 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Wed, 28 Feb 2024 14:51:28 +0100
Subject: [PATCH v5 1/8] usb: misc: onboard_hub: use device supply names
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240228-onboard_xvf3500-v5-1-76b805fd3fe6@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709128293; l=4982;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=BEdcCVmujfc9kG0AJPFzTPxgH1GxZd8gsqn1iUJC8zM=;
 b=CwPy+gqV4LQCZHq3nhBn1Jzd5f9g1Bzgow+X8c08GLar8MpPUZFF8XzceOBi1l4bc3jooNWUp
 AMRdwlHWBwWCi8gqOaxrbleM5NeuPaygd48pql0miXJyDZ/qnimLVIK
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::19) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|GV1PR08MB10523:EE_
X-MS-Office365-Filtering-Correlation-Id: cff8a544-b57a-4bc2-8311-08dc38646178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b2CNTygykATNkMcrizvDdcFjy2PDTLa0/IGt5BkMv0DLvEy7mHu9bkG4JVBy9VCgJ28wqGoCyCZO4eIc5+1VMfceebXK3OSHFMJTLJTdLYpjiRFKDTrvBzv2ao6t7ri5Gtt9oyGi3hXTThcvHkOKp79rP2HV472eA1n10ps6Ss0dziZ9g3kVEeSWDQbqcik/5dA2bHq9FPB4AEF26YmjEpLjBDAdifOOwkYpwOmwa3FZ0uyeJrTqAhmltcUgfGHUla+IjhIhoOR8F1WnBlA2x7jQQ1kr9KRW17f4UZyMIOScUk/6MYVLQRmn4c6uRyDCtjMB+aUiSNX1o9I7BWSK+czI+vSMDRDGW3wFxWGU231NgSOI6k0qOPl6zCO9mxX1Kb54VqUwc9JBeaVi+8xLQUXfV93l+Ojs3CY1VeKynQk20Wq+N5KelrrMPXmTmdc9e4idLFzbP2Kd/NE747bgNVZbyPxv5u0Bt8pcC7CaxTxOuP1RgYMj10MG/yUbFDqR4QLsJ2rg2xAjsWacDG+HSDYXRrghjTmBwKW+ffYKg//f4hERRp8bpfLSQZy0aHn0m8KfKfQDVIrdcMTwtrNGBZYiBbNvY3bQ+ag1stYq3HwDpLWY8VTaT3oqS91MxQwXKDocEQDoNIG6Z2DDlwgChFAMsV/x9RtfWjbZ5P5Ci6jeoKHZFhXxBchIx63GP9HP6db3ScWNKo/WBhpHoYoYEBvHqdHVigZlQ23Zwft8CUs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVJ5OU0rRE9LTUVHU0x2NGMyTVc2NVh4SFZsSU9xWXdwNDloMlNiLzMySXJ5?=
 =?utf-8?B?TTR4UGZ6aWc5Qno5NmxsOHVRWFRJSTVRNU93TUtQVlV6TXhYYVBnak5EZ0t6?=
 =?utf-8?B?T0NXeWVZOHFzdlhCbytGTUZaQnBOMHhVNTZlVFBHZ0Jjdm1rVzV1SmZjVGtU?=
 =?utf-8?B?K28wSkp1Yk10anJzSmJ2c3RWank0U0VCOW02TGRzekZJaktmRXQwWmJUVHhk?=
 =?utf-8?B?VUsxZGhxZUR0TUlWTzRjWmJjS2VhWmxIWG1pWWNWd0ZScnlpb1NlaW5POGhj?=
 =?utf-8?B?S1Q0ZC9kVEVxKzZXWDJpeVBwOWU2TVdQNlhoODM0UWpnY2ExcS9kQnpsMXNy?=
 =?utf-8?B?ZXZXbm1nbVJxRmJCdnpWZnlxVFIyL2J6M3A5RFNBc3BiN2kycjNQT3lXZUlP?=
 =?utf-8?B?K2JROVpiWWtmNDd3UjlkeUYrVjNOZmZoaEgvOXVieUhlWkF3NWsxeHU5endl?=
 =?utf-8?B?eitQbSs3YURHTVo2cW5VOWh6YnNIMmN1V2dlQ3c3T3pPS3dlRzFPNmlBOXBi?=
 =?utf-8?B?dVFrb0J3eG9ha0g3RkZGQVIzYWlvZlBGNDFaNTJINjVVKzJMemE4MzdIMEcx?=
 =?utf-8?B?WFRNWExmaHF5eHNtNlV0NUwyaThBaVpIUzkwWkNOVmdDdFB6NUR2alRpaTlx?=
 =?utf-8?B?dFh0clAvYnVDWTJrTFJDQkQrOGp5YlF3TGlPRUhnNWhtUGl3RVJ3dGtoZFB0?=
 =?utf-8?B?Vy81U2wyUmUxUlBNTjZHaTEzcnBYUlBCZFNyTnRNcFZ4cE1waU0zRXkyakxo?=
 =?utf-8?B?M0l4Y1UrYzEyWmlEYkdnN2dEZWRSTGsxRjdXLzJKdzZyVDYzZlF4cFBSL0Uz?=
 =?utf-8?B?Vk91MUFicmtDUU56MDNrTWVOcUdyOXJJV0hRY1pncTBDT2g0RG5neXRlMmk1?=
 =?utf-8?B?T2Uwd0FGRHAvdlhSNG1hdmNEQXIwWkE4cnFDTG8vamlnNW9XczU5T1E4ZHJr?=
 =?utf-8?B?MHZ0dEk1dnhud0JGcHJnMi96UVQ5RjR0aUFRckQzQ3VOYUdubGdKYlFEVWdD?=
 =?utf-8?B?RXdhUWJzbWhSWitUSFVWWG9ESG9zV0c2eFhZTGVJTXNyamdRRjUyQ2Y4VUpu?=
 =?utf-8?B?SmJRNi9NRTgvbDdYRlMvTjZYWUZxcGtzVWF4VHlmNzhRa2hvWXpPTGZUYk4x?=
 =?utf-8?B?b0lqOHVLazFzN1FhYTBOQTBteE9TMVRoZGdtOXg3VjAxcW5vdCtoVUxyTEpO?=
 =?utf-8?B?T0JDUEJjSzZsbjR6RWRqckQxTk1iVW5aT1U0RVozdEw0UjBPblpMKzFPa0JX?=
 =?utf-8?B?ZlJzZkFEb3EwUFhIdkxRNER6V0gvVUpZQWFMdzVxc0U1Mm1hYjZ0R1RHYlVo?=
 =?utf-8?B?NlR0VUU2SzZ4MzIyRnhTV0IrU3c0QkpoOFBjVVQ3S24zYnBOYk9CWDFRd3U5?=
 =?utf-8?B?ZzlrSzQ5YUpEc3dwcnZUZTZvMHV2K1BjRVRNMVdNNzRGcUdNbTBnQlpxaVNl?=
 =?utf-8?B?R2dlOHBpUThMYndpMWVYZ2toY1hrdGZxTUpMZk5tcG9iQlRCSU9Wa3JtbGtm?=
 =?utf-8?B?NWV6TFhYT3JpN1RlZUw5a3hYWGp5VVBPdDAzelVvQXZrdzhVTnNiRDY1QmZm?=
 =?utf-8?B?cDhWU08wYitQRnM1S1dnbEVnUWhZZE1qbklUQ1NLd3V3azVMaEZvQ3RuUENa?=
 =?utf-8?B?b1V2ai81ek5iN0twdlR4Q2lkVm1JMmRTRUJZbjQ0ZVozTDE5M1hOakJjYnN3?=
 =?utf-8?B?WVE1VHdONWE1T1hpM2RXNlF0cllGcUFBREdVNEhQVmdZbzdmc2lnM2NEdDdZ?=
 =?utf-8?B?S0Y1dVJOVE9HSmE1ZG5jbnlBWHMwc2ZscFdKSk5wZlE5eDI2Zk03OXlMdjU4?=
 =?utf-8?B?d3FvUk5vcURwbUJrZExpZ3ZqbGJaWnBIN1BGS3M1OGpKNC9LbmxTTVJMUFhv?=
 =?utf-8?B?UUlaVWw2T2IwMVBqZmFwZExpM3Q1dml1TURET3BrVEtMd3YzMHZpMjYyMG92?=
 =?utf-8?B?U3BhaStYSjhENXc3eVdhT1pqdWJxNmJaVVpTRkdyVDgwc0JCRWN1QVA2MnJx?=
 =?utf-8?B?cWoyWkkzeVdhdDNITlRVQi8xcUJXZTFWWCsxbjUvU1VkK1hZVW5oRVp2Wkht?=
 =?utf-8?B?OWdqZXUyOER1cmtYQnBDZ3Q1cVpDK1FpMjBUczNadkhQcG16WXJpK2JMRnV5?=
 =?utf-8?B?OSs3T0Q5Q1drZm5MdmNvOTl3QkdFSDMrTzBxSnNFY01uMWFsQm5mdEI3by81?=
 =?utf-8?Q?X/xDpvPDhFdYQJKRIhjQ0v8=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cff8a544-b57a-4bc2-8311-08dc38646178
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 13:51:36.4080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Khf6bmPkqf/JzXk6F6l83siuLcRnNooGl+MCtAkTxDEvL1GS3jzd7KsW4ftSA8UB7NtFAhBxIPEZKkcGyAs7eZi6gn75ymc968lA+zoObjY=
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

The current implementation uses generic names for the power supplies,
which conflicts with proper name definitions in the device bindings.

Add a per-device property to include real supply names and keep generic
names for existing devices to keep backward compatibility.

Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 drivers/usb/misc/onboard_usb_hub.c | 49 ++++++++++++++++++++------------------
 drivers/usb/misc/onboard_usb_hub.h | 12 ++++++++++
 2 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 0dd2b032c90b..3755f6cc1eda 100644
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
@@ -65,6 +54,30 @@ struct onboard_hub {
 	struct clk *clk;
 };
 
+static int onboard_hub_get_regulator_bulk(struct device *dev,
+					  struct onboard_hub *onboard_hub)
+{
+	unsigned int i;
+	int err;
+
+	const char * const *supply_names = onboard_hub->pdata->supply_names;
+
+	if (onboard_hub->pdata->num_supplies > MAX_SUPPLIES)
+		return dev_err_probe(dev, -EINVAL, "max %d supplies supported!\n",
+				     MAX_SUPPLIES);
+
+	for (i = 0; i < onboard_hub->pdata->num_supplies; i++)
+		onboard_hub->supplies[i].supply = supply_names[i];
+
+	err = devm_regulator_bulk_get(dev, onboard_hub->pdata->num_supplies,
+				      onboard_hub->supplies);
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
@@ -253,7 +266,6 @@ static int onboard_hub_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct onboard_hub *hub;
-	unsigned int i;
 	int err;
 
 	hub = devm_kzalloc(dev, sizeof(*hub), GFP_KERNEL);
@@ -264,18 +276,9 @@ static int onboard_hub_probe(struct platform_device *pdev)
 	if (!hub->pdata)
 		return -EINVAL;
 
-	if (hub->pdata->num_supplies > MAX_SUPPLIES)
-		return dev_err_probe(dev, -EINVAL, "max %zu supplies supported!\n",
-				     MAX_SUPPLIES);
-
-	for (i = 0; i < hub->pdata->num_supplies; i++)
-		hub->supplies[i].supply = supply_names[i];
-
-	err = devm_regulator_bulk_get(dev, hub->pdata->num_supplies, hub->supplies);
-	if (err) {
-		dev_err(dev, "Failed to get regulator supplies: %pe\n", ERR_PTR(err));
+	err = onboard_hub_get_regulator_bulk(dev, onboard_hub);
+	if (err)
 		return err;
-	}
 
 	hub->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(hub->clk))
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index f360d5cf8d8a..ea24bd6790f0 100644
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
+	const char * const supply_names[MAX_SUPPLIES]; /* use the real names */
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

