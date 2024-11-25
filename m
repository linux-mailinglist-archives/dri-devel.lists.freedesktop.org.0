Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5059D826F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24A710E5F1;
	Mon, 25 Nov 2024 09:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="bjS6nnxl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2070.outbound.protection.outlook.com [40.107.105.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A94010E5F1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jsqv1LCnxP1aXxnESxrFVbK7Zzjvq8AfefhdQNLDqSH8g/rxiCFg5V8Fyg+uXFvmvQj/M1P1RygnNMeG1B85a6qDxU3wwS50iOI7bLKY4vn1hrU/id+r8e72yN0yjWWoNF/9oWf9V6Bp0T2tljJwjEhxt6OgPDS4kA95P6am6nS5QEukslk4TEcoqdlfwPHGUBDudBVeZcOQ9VtJZd1q9WT3+2TVzg5cTITrOFyaEkK3IDxGEbxq587005oZm39IKRIrIEbtUht3xeN6Zo+tSkMG/2FsEcgf8kaVwcJS8RLntN/vn/H3kG5IP9vgCyaBXWEtM5tyUHOwLBxzCgLanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0/DlqsrHwJtdwJbUm1kInoXl14XLLppggF+PBhSObY=;
 b=FqMCx0BFNYelOE15TUG8de9vFcpKlP/Eqh38nr0DgBjZDHaJfY3mFf/fKT0P/2pR1zZLyxcYCGlQO09a7PtR3vnY+/Fy46znbBj/7iNUVdJQURSTBmdurW2awdlshZoGGBPQIEdcVGFYNc1oEie+SxUJH/iVmGQM3HVJhQa+joTuUk1b+pHgcTLA7602HA4hCqQPNcS5MSRx6EXIB1jDTrf03hjI1ZvvFSIK6VMH/LowMB8mEd8omcgvB8VmJkvEBDBA1rtPFpQM844o88q29S6c8IMKecIXZpdLg8b+1fqPiQr9iEdwhQ/N02IyCzD97//4MCF3u36F0Qewk5a0Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0/DlqsrHwJtdwJbUm1kInoXl14XLLppggF+PBhSObY=;
 b=bjS6nnxloKn75fyc//Hb9c939oJYvpyvaBN6eTtTUpCFMalYPpVjkRJxTTMJlRFPPmW1Q6/YIqjfzu2htqiYuKwSMMZ+9//kQinGiEySsei/Dy76bdAhXFUuzv6Z+QuLb6XEKYlpKb4/KGPEKmEzd/SbPT8NmUxgMCV3K1/Q20vo4xaSMoPzLTCKxTA6OdVkrQMpHc6Y73JBKmUONm8SI42xk7m3Hmw2Zt64m5QFeUE/XGbsQ1xF0GH059+9eT8OmcpgSMHOr2EUaOy5Tff6NlSSlVeLk1R9N9hI6hy1kigQQGgI5P1o2yjyKZM/sYCYsjnRaeEijvzV2kg1VOObWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI2PR04MB10930.eurprd04.prod.outlook.com (2603:10a6:800:273::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 09:35:19 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:35:19 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v4 18/19] arm64: dts: imx8qxp-mek: Enable display
 controller
Date: Mon, 25 Nov 2024 17:33:15 +0800
Message-Id: <20241125093316.2357162-19-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125093316.2357162-1-victor.liu@nxp.com>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI2PR04MB10930:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a1a99a8-6085-4038-869b-08dd0d3479fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bwdk34rD+im6dOJB7rRfPVlFVju9lsU/uq/OrA4AGNJOEAbFO7kW2qmChjeH?=
 =?us-ascii?Q?ha4/V3N6ZmY65KpBfme/XGqkJjMn5MT7HVF1m0TBm7Ys/a2pXRqAkHBAJq1t?=
 =?us-ascii?Q?fAbBrAonztP0CWhbC4kmnIj3iwtttPW6kjt+an78rQC0BWlbkoNWM7as07oa?=
 =?us-ascii?Q?YGo+xwgXJWecer8c7tFXr1JR5ZKw8Xiot3HWTFqll+PsKrAofRMw2pwqP5cj?=
 =?us-ascii?Q?dv2VVYn7fdHDHlXU3NM8L5EwnXvUKe8AgfswTmg15hronMe4orjVFrDXMymI?=
 =?us-ascii?Q?DLvpho8AgEF/j2mtVVVdhZWR9uf3guEHQeoyUc2yoRgjIT3aGafWZqoKGMXL?=
 =?us-ascii?Q?hkP0yRMrAFaldX3yqCnvrmhtibu0KPwyXejmvil0oOZOrMRxcMKzmcGXDFvX?=
 =?us-ascii?Q?gxXVRYfnQXb51jdguJ64OdDzyLTtVREsMj2FCWFYYsXsdpRy4zPWJRCilz9i?=
 =?us-ascii?Q?eP/5uELKX/d6P707kSnVW24IozLUKvP2enDoIfZoRtpsUjrN0XVAtR7R8pbt?=
 =?us-ascii?Q?8r3SugsRvBUjWo+JYqDLBQXovzAwMQM/jHxrhGMxYRhHf931UPbnupKbgaam?=
 =?us-ascii?Q?UkrZB0Vz9wHCJKQP8CUkHjAAGiTnTjlCsIra/6nzjSklY70a77PxPEnG1qaB?=
 =?us-ascii?Q?8D20rRUDwpRXVim4m+eo66TLMzf0uxQddAx0S6a4O2hc4UnrXUex+rXImVLZ?=
 =?us-ascii?Q?RPgezVAdFGOu9i4lSS2KyEmzNdCOI5Zx7sGO03NM53BmBPOXaCgT/a7sZ+2G?=
 =?us-ascii?Q?7leeAyTVsFHW1qX6W5Wz6Ssb+bzys9WtEskdN1Dukm+S/bdbbxJm+CjGX6Ew?=
 =?us-ascii?Q?mGa3NY9hywjKv1AlICgfUB4utAHJPnKMcHWrthx3TNAQggpBnE/8uOiiohph?=
 =?us-ascii?Q?/o6muZfxUlZU5xuDDibdl4sXwS7Xr2ssa1Og43BGDqdPkUW7aiYCUYP3Yr2o?=
 =?us-ascii?Q?Y2BN1k3spiwqf+KZXIdgFhzTV3tr/87ETO7Jkw2GfQgShcTt8oOADJN3CjGz?=
 =?us-ascii?Q?6NqRseg+SpnWNDCLxwCCBXD8YD4pg09Hdvtc/xbQ5bRJ8szTC6ohghsSKErl?=
 =?us-ascii?Q?M/QteAZlrCQ0eW2prDObLc0IKLgn+HOC+H0K8PrSYNvdJH69UcaDNxFyoHhQ?=
 =?us-ascii?Q?SgJPHhFqFpJchdpYFR4OFx75/Hx5Whaer9QCJWHd4MtYZ5RzJ+KEkEROq2jr?=
 =?us-ascii?Q?IfvsC3FlM9eTONEq14Ifq+zN7O1M0hDCf/A66QU9Po+UsmiVL4BO8seta+xV?=
 =?us-ascii?Q?4HP4n/xdG1G3QEfc4TaVS+WxLH7tImsDEPPQoe4DzCErabOWy6nQTLL7C8sf?=
 =?us-ascii?Q?LdSRTobhF/rQHwSEhgirVsB/vjAPzdivww/9XL36reDvl3joHum1oaWtKEr0?=
 =?us-ascii?Q?QqD8sBbVD2GqnsAusG+sZZHWAytwV3fBVjOkj6hi3pTuhbZnEg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bNRO03tOor//Wt29sNBdCEQtpJDxFjb3iBDizuOiBPsWygWtypS/jaqwvDMo?=
 =?us-ascii?Q?eSBXb5V2wNKViG0dicacYj5M8KZ28l8UlSkJ4fq6IzKcf4cjcG0fRuKbwK1L?=
 =?us-ascii?Q?7DLI6z+++knY+wlqQRN90laSuIWJYukypvXJSCEGdh2T4aULc9Cw8GZdXPAT?=
 =?us-ascii?Q?XQeOe1katAY/iaFF0gqw2EzWLdP3YeP0NisOSb9n6mMTeDk9rz0sCHdbL5fg?=
 =?us-ascii?Q?1gaSEL4yP3Yg+Y0tpwUpRcG5BtPEMgTtE0FVkN+Db1IhKpSdXomvWMsihZ+i?=
 =?us-ascii?Q?gT99c3whT/Ma0GqPVqWjQABA6j4WqaLoO+Cb8cYCIJJ4CS0ewlXqi91Z+yHd?=
 =?us-ascii?Q?J473VcZmEavhL9nneLjZndXu2zky06mROnOsO+O6+lVvveKNzyiq36deKg16?=
 =?us-ascii?Q?ogKc+f5iHMedCke9gVHwz9dDWxYNa5zV0QCsY5H+oqkhKYUBA+zzqnYykpPj?=
 =?us-ascii?Q?NTZ67jFq8pSOc7XzpaG1IyXqBw5tjjGWa6eBNmTEsk3rsg62evl7LWociHBx?=
 =?us-ascii?Q?fz5G6BOSvnvON/6hd/oExCIRzouvFdcQ+1DlDLu1fdjhfA37N2c8rno6+Y5o?=
 =?us-ascii?Q?YyLss9vo8RiHeNklZvwYrsbgVpPAeFjCuCdFcz7S9fxmtB6J1CCQ3Z8rul/D?=
 =?us-ascii?Q?94gxNL3o6mNHXpw3l6YGlcFLYdRQkq/GoTkWifOs8GLeFh0ZkVLMhvzIk01L?=
 =?us-ascii?Q?DIOtmrcw99iF2Ugb0VYZ9naMxQ0QqDNSvehfPdzaVlXL0TwltBQFBWLl7Qo2?=
 =?us-ascii?Q?hrzjn725YO7Fz+5K1kfmCA5LxGLTG8xsMpFbKTBZZbE47SWzMdWqhXiuIKfC?=
 =?us-ascii?Q?BngmKDG01UHfnT1sZ25rhGuc5ovF6lYkLkn2f1QG7GdpWF7Ygd4PxKu1/NrL?=
 =?us-ascii?Q?Zu/md5Na5QqjNgvbHvaHsB/bhlbFvaD0wDRmfHcpET8jsbxkqsF1sDOqGyBJ?=
 =?us-ascii?Q?w4tglJ3O0Qt9T7/2f+HVtO6gmT0sYVDeaOr8oXrE8NT24zNRHUTNfUoySY8z?=
 =?us-ascii?Q?a+DZtdiJtD9tGlkqj4mDzoP3rjFsPIsgohELbJNxXI6giBY9zM8DD9X2ECJd?=
 =?us-ascii?Q?ZqiCrcNzv0uAfHL4xNd8b4wkn3Hj3CNIbE3XZSMvDIE3s6qoDF1tp0xXY0mp?=
 =?us-ascii?Q?UYNFu0OEF+b2tmvAqCX2rLO9jAjiZJDoO0wcqTF18u4TQkOv+Ta/dXEWEP4L?=
 =?us-ascii?Q?mQR5O+CW0j0CZ5PNQcODdc76a465/i9VL138Ea7AD6UZdxyLFfUT1KCj1doT?=
 =?us-ascii?Q?Yl1mXdjmjWbDgEsldst8AeyqiDkQh21obK5E+CxrWDXAN6LPE+sAmHiRsr/x?=
 =?us-ascii?Q?aVptR8CLYUvtSvHkcJjzPdE2uqAkTriDf3uRYCecLI+azA90GQCCr7/kFsvw?=
 =?us-ascii?Q?+QmgKa0OKyZBV7iQLbKz/Hf2kZ4nGRJJDDQVbNyR7o18TuoavuSnEaiCLYH4?=
 =?us-ascii?Q?3jEDx2I+M+5tUp6I3kuWTtNIpDie0986csX0UD+im0pqtm6us0IzKSkog1s1?=
 =?us-ascii?Q?eew5bMxpTHfxlsTdfnA0DWqfzo9SovBdqb0Q1yNBDO5NZ+FnUgv+ja0H6dL2?=
 =?us-ascii?Q?ViEwocXyfMILw5lRMyHRrJHJZ+dv9+oRO7BDsLSe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1a99a8-6085-4038-869b-08dd0d3479fd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:35:19.6426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyBukiqppE8M+9as/NLs7RdeVmCdGtwPSa2/DT4Jhrl33EdlwqJGq64QQqJKzolKVBoPTYu/gSzPY4r+sAN7jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10930
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

Enable display controller for i.MX8qxp MEK.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4:
* No change.

v3:
* No change.

v2:
* New patch. (Francesco)

 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index be79c793213a..c7b4015c7bf7 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -234,6 +234,10 @@ &asrc0 {
 	status = "okay";
 };
 
+&dc0 {
+	status = "okay";
+};
+
 &dsp {
 	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
 			<&dsp_vdev0vring1>, <&dsp_reserved>;
-- 
2.34.1

