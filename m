Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4B0B94696
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 07:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC2010E560;
	Tue, 23 Sep 2025 05:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="WqvWTmEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011023.outbound.protection.outlook.com
 [40.107.130.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBCF10E560
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 05:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkGw3kZgIj0mhb08olrV3ZRzEsaqP3FlhVra2tMlqsg2tPnWg8LmLGii8gRPSWmgM8n3ToO5i2iF9CAeCT8sQEwXTGpdSthqkvC/Qo5DbYq2AmsUJWiFFqh8IPfqbzbkwhfpossqJUdmOVBS1QIi7FpCq/d7hw8AK93rEb25lOC6LShlgmyFXb2TQV7KLi7dT6tYu97Z0QaU6ZDoHouTAIkreLsI/4/R+sDBX9mIMRjif+oYFQwSG488frDYY7tyx5O7bYrOcowsTumeIoTo3BqZ3xPD6+uKLyrixUTrpUBjdNkHtlHXHcbgxvhuqi604Q7slStq7g+waEONcx43yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbu/RbbutQ2H/KkljSyYtLkMOqkXv/YRN1gEZ/bkrJQ=;
 b=lQVs32RwILoPnF+OIMIwaHMFzw4MlK37JDFbWd70ismZPV3J9RtyAe/fvzSMuaZpmnRu/y18pdjCr0F1+FO6EXqTLSRgf4bkes6Zs7l0UjExSsaN6gmtNsU58D4rLg12PlVPOwyxt4dOjUljEqeRwFCeCp5Briev7mZOP1L5ofiFpk5E5tKJNwrgJxA98pembmKPX24+ZJok9p3uTvn5InFIJaMBBZRAOSyCHn/mOQqtxprqpcZTqwo6eOjJQWrGnlPYe4w2WMNwQf7ii3wWPHWQrKzScm2bieBo4rt+q/YpV5f5+AMnZyfY+Yfsv/9Yv31S5JKujUyv4w7XWc9xIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbu/RbbutQ2H/KkljSyYtLkMOqkXv/YRN1gEZ/bkrJQ=;
 b=WqvWTmEHLznQ93WUhy0A0wzLf39hAYpyabr2bXWfHf31J5UHrEAvXL99bEyQbUGnkycfNmXDwEFqvaEgoosZ6rrkQw7Fc9x+PXDrgzi0+tE+zhXUfK2eO5u4NL8zx6ffHnEGwyDde15MevW5rqRfnXFPmlITdZFKpnMRlp7eHV2M0sRlkfVBb1uGUuQx/6cohx9hxtRZTn3qNbqUm+p4SlXkZsPziwIcN8ZTKZ93rv8Nvk/sFUwMk6IVAsa2hZGavSaUiGaFzw3vn0BMA4Hg+UcS0xSOKVhN2XkdX0ODvvF0kdKFNLY1cpRQgrmWQhSQ2Q3MOknlg+gOLA/LaMTYYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB10419.eurprd04.prod.outlook.com (2603:10a6:800:235::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 05:31:24 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 05:31:24 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v7 6/7] arm64: dts: imx8mp: Add hdmi parallel audio interface
 node
Date: Tue, 23 Sep 2025 13:30:00 +0800
Message-Id: <20250923053001.2678596-7-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB10419:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5d67db-9147-4773-373c-08ddfa626fa9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CBtWIAq6jKdwOY/FUgVPG2DSd/9wkUjEMg9UzRGGl248bndgFlBttyFgJ4p8?=
 =?us-ascii?Q?yLfx9VcgKoeu/kKchgoxBoBiuCSyuSK39Z5JE0ATIbYkmPqfB7A74uGZGjRs?=
 =?us-ascii?Q?lOykGOQUhNR9NW3/4ufgTIw+jbKdz8zQVXjr3MkvajAlTlpffDhb4oZ2DEDj?=
 =?us-ascii?Q?8xMPbc+pGnZqFExyryi0qHHI6/SnUJvFkKBMd/Gqkt1PtzB09thPrnaOufBs?=
 =?us-ascii?Q?oCthsA4SYnhJmznvtrukd0rJscc7sP0MiQ564nwUyBe/kb0AnS+PCqPRSqU5?=
 =?us-ascii?Q?24tsdVG2MQGXT0qmOk5wKDyrztAUpUgpKkeImaP1BFf8sGlM0WosxMaeG0ND?=
 =?us-ascii?Q?5KiUAIlvNepOSpstwsYjFf2ahWfHuCgtKHZcasQ4Xt1Mv3kC5wBm2A5vB/Ts?=
 =?us-ascii?Q?nQAkGs3xZnri7i4FVczb6+X/F0CmRvXdgl9aUoN8I7ErEdcyg7fA9WF825IN?=
 =?us-ascii?Q?g377667gaoFu+OA6OmL+PvWb4NqIr9HkcgzP6RfFHHHvAKzymzCHrsinkS3W?=
 =?us-ascii?Q?iAu7SD2SAm2M6Yetmf+UNPdnSfl3pQoIgh+gjzT5ypNzxWjv32s53zRzoNRR?=
 =?us-ascii?Q?FqVakK7JhTxtvzt2dRatb8eEt4VB49bdq+eomS6xtMQHMAVdyQjxGQTvF3PG?=
 =?us-ascii?Q?t9VxPb9AS1zucB4PCCH+pcU6undWiVE6zg7LvPRuNvoKvsOggxau13pZ/gT1?=
 =?us-ascii?Q?PH//YiltVv7wNt92dxKyAOgfmpOoQpJwmSA0LK1RhMkAxycqn4wYnVCOO2Va?=
 =?us-ascii?Q?CkXBbO3KHV71sC3FvKdt7dx5ulY8pcHmivFv4kdLaZCX9Isu3VYvBhzkgkis?=
 =?us-ascii?Q?XynooIa+K2/9EY7PdMgcKLIGrvFTqjx+zno/VvzVWAn4IGWWvNepheRxRugF?=
 =?us-ascii?Q?qlD5g6/yIHQ4fIXTIrpU3sXp+8f16bUmpe9KpAlVdwH8E0i5Zw6/XOtqJ8qM?=
 =?us-ascii?Q?YUCUurBmAZuFLJvyE00L999aNgauDCqRzVsze95/cVm6+ENt0mUte7lz8fXT?=
 =?us-ascii?Q?4w1PppN83WP7nSSD5QHXTxHsh6ZcLDVIDsNdNmsKoz30y686pQGm4g16agSL?=
 =?us-ascii?Q?8kY25kZ6lSXXiFZqyPuxZVvP8LvQnQ/oIYrpE5LkIVWVrBdJ0/J51l4blnN1?=
 =?us-ascii?Q?Ew+xQaEd2aQEyT1vPR698waZVAg44fP/ezU/c6u9zExv79L+AtGsiH9Qqzs5?=
 =?us-ascii?Q?BrNaWljavetOAQqMxUVIWzTQIts+II6eUjkZXsrIAG8Zy0twnxhFYmtJb8ji?=
 =?us-ascii?Q?3i74tNOcG7hcbMyP+HgSfsj4xua3eykEtTGfg98/OdF1H4RL0oOvskMl4NHT?=
 =?us-ascii?Q?o2axTfiedWPsLL6l7njHwFNMoWu2wYE2bTjhHjhFC/lCKIK9BWe2jywEs6YP?=
 =?us-ascii?Q?InYv24LdNzrMk8JoCSFNSRVr2ngj0tf88jM43hUiiCloW3I1bTO8bNZ/tvua?=
 =?us-ascii?Q?ljngQo63eOY/Dsk64gpCTTYxS5hzCj5Ve97RCmHmrR0hGT3cm8IeZMSZy5GB?=
 =?us-ascii?Q?K20opnGxXNDHUAI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oZRkt9/xHRRqYhsvCpwbZeJRAjRhDVRWPuhWAUKHWANezMDIka+A5ScUXH4P?=
 =?us-ascii?Q?YGgIYFZ/PaQJDZVGVXWTfUgyBNaAsaiH7LHeL7gG8K+H3OMvS25fqziwTz79?=
 =?us-ascii?Q?vqhHWNK8x87WmBt8oApNxn6SyGxFivyTJYjcuMIVBIzm5+zuKWjltmuujBNJ?=
 =?us-ascii?Q?ojb7riGkzQeAoHQhnR+mgG6Ru4i8DWxr+Sh+AQ+BLYtDzzhdHJBF1e8XhHdz?=
 =?us-ascii?Q?8DwimNbGc3s6ugybzShYKQisSByzzsZ864O9DOw3G71QfIcUQKYwXxTpzIw1?=
 =?us-ascii?Q?G2dZ5Uvx7oB62hRTtOUB4WZPDHXiqZMVidpQ+1CcgUe+pXmb6/jJKfL1UbDQ?=
 =?us-ascii?Q?35afYoPANCSyEWCG57vWFDKJ0j9nCwpGraH9vhl5hZGVFYF7HxIppt3906oT?=
 =?us-ascii?Q?iV3UrNES8GMHPm5HOY1nm8o+0LK7tZxV2a5i9rxwwrzeueaEd3ZnFbwSbFWa?=
 =?us-ascii?Q?RVau24P0xmZkwsUTpP7APURZdgD8RzY6W0tzVDJ/i/r/EadtRB2bT9JxLdg7?=
 =?us-ascii?Q?yCRTCOeIsRXu9Zv6rs/1B4FN6IwOcvcqvLDxx2EAWOiR/dHeEpl7cTTec8kE?=
 =?us-ascii?Q?4bCuoOJtQoSzzwitPMsehdTcLHZi0Yh9WonpSRPUh0/UhzmYYxF+g5oFcWlo?=
 =?us-ascii?Q?LLV5vHppBRVmBDGrYGf5KzU5A3XEsYf/DkWi0n2qQO6oELdSlR9y4TaZMb9w?=
 =?us-ascii?Q?rJgScQMI5mV0zKiea/IlONu8XQfiiwcm+qnS6VDBL6LP9X2eCGZhkjxjCLgk?=
 =?us-ascii?Q?+3gWuOQ17g82an+h1m9lVjPHL7koEvexw7GKLbq3vHR0oJ1PxWK9EFcwcbgL?=
 =?us-ascii?Q?j0M2/UAD49YemMeMcm9/Le3nrm9i72PtD2DJCBT6dM6zSYWObKGkEPurDC4P?=
 =?us-ascii?Q?eTplhDYgml2H96Sth3K8IJo+6wzMe0RSNDVbhWp/X1tJM7V0oaOOHXkEyScS?=
 =?us-ascii?Q?VUXRBdbsnUUMgR1gtpp8QznAdOrUNa+A2836VJJtlUYlyE/0CnAI6mAO5hf6?=
 =?us-ascii?Q?XokDypcmV4wFSlXDw7C3jIDPa0+CjYxVihAegpvtq0MzTErp+WLhgNJa+4Z7?=
 =?us-ascii?Q?wfmOz3P2Nx6Z1NkEF+NzkiOPG5am7/JEK0LbqvWXCGfNGUluxV94fgGNgE3b?=
 =?us-ascii?Q?Wo5B5SFSyO+HpLWTxnzsVo1KhayfgOSp/YOrDwnOYdUNaE975hSzY8KNkd4T?=
 =?us-ascii?Q?EgqC1XfChjhFa+Uias3ZwaJVygkUtW2+LwifVe1C0voWYNWZcD6A0tAZFHlW?=
 =?us-ascii?Q?hIx6fmRRfHJsmoZAAYqjXbXTkNjJV4s3gELoDubgvIuLVevbbYcoy1ShRkGL?=
 =?us-ascii?Q?FD9bUvPdNJz4AdKqqP57GHVe16g1ri7rbz1Qo4/CzTQWuWcjq7pJBkF0kySJ?=
 =?us-ascii?Q?r5QL7od0iu93Tiqd9vfH9m7n+dDUgbJKLC/XUz+Y1jXZgt7hf0dgY8t6QSF7?=
 =?us-ascii?Q?dTz02ED7ZI5Z6RGRxecfD2et6zUn2g6yVwUOFfVcNxJdVQWSjLTRRnmecZIT?=
 =?us-ascii?Q?EIe+NIZTq+EmySBLqKwmmYNTVK85JhbDzdpkMn0KvfUbKLTNPtLh7VKfJPhi?=
 =?us-ascii?Q?HcxwQ4B807+eLmnMYCXA2V6IyMsmSTHKcNm9QVHI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5d67db-9147-4773-373c-08ddfa626fa9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:31:24.6478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Xz7Kc3CdZjVFjfHtwMr6RwbGBg0nbcbFhPJvW1ZMpfgEo2M93uJON/qQbFh1i5T7Nvcum2tgVpeCva4+TM8QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10419
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

The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
Audio Subsystem to the HDMI TX Controller.

Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 27 ++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 5d10de3950c3..710b90bf0c7f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2069,7 +2069,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
 
 			hdmi_pvi: display-bridge@32fc4000 {
 				compatible = "fsl,imx8mp-hdmi-pvi";
-				reg = <0x32fc4000 0x1000>;
+				reg = <0x32fc4000 0x800>;
 				interrupt-parent = <&irqsteer_hdmi>;
 				interrupts = <12>;
 				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
@@ -2095,6 +2095,23 @@ pvi_to_hdmi_tx: endpoint {
 				};
 			};
 
+			hdmi_pai: audio-bridge@32fc4800 {
+				compatible = "fsl,imx8mp-hdmi-pai";
+				reg = <0x32fc4800 0x800>;
+				interrupt-parent = <&irqsteer_hdmi>;
+				interrupts = <14>;
+				clocks = <&clk IMX8MP_CLK_HDMI_APB>;
+				clock-names = "apb";
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
+				status = "disabled";
+
+				port {
+					pai_to_hdmi_tx: endpoint {
+						remote-endpoint = <&hdmi_tx_from_pai>;
+					};
+				};
+			};
+
 			lcdif3: display-controller@32fc6000 {
 				compatible = "fsl,imx8mp-lcdif";
 				reg = <0x32fc6000 0x1000>;
@@ -2146,6 +2163,14 @@ port@1 {
 						reg = <1>;
 						/* Point endpoint to the HDMI connector */
 					};
+
+					port@2 {
+						reg = <2>;
+
+						hdmi_tx_from_pai: endpoint {
+							remote-endpoint = <&pai_to_hdmi_tx>;
+						};
+					};
 				};
 			};
 
-- 
2.34.1

