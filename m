Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8129B22EE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3644010E31E;
	Mon, 28 Oct 2024 02:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="H6HCMOkg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B804E10E31F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:39:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmAlLmlmucKQI7UuuHruINtMmnl2OWwHtSMNudMfCiCZdyQAVH1KbK3qRsHAFEoE+sJJ9epeLkpCchKJIsyCDXs3JiNsg0GseBf5qFmiz96EsUuiml3MJH9lZ2dkNDE2uMIvTMRhF06IgEaePIg1nCJYF7PLhOB/WuGOwigTEtNVtYwwqn3UsGGuOAPFSFerQv+QLq5VRaHgiMLhI7A03uGoPYervr7UL7B53wRQovPLcbORsXlzVEqyULSaorSBTFHhM1gPnMCTSr6svuHy4U1PAmnYNsoLUW7KnO35vTbEku4PIVsnU3bhu9biVvcQXmVb1CbnhkNoP3P0Xgmx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mn2hy3RZD6OTVqGtLmgaaLgbAxI4KZZpISE2ZfRKKWo=;
 b=ImvhD+EmeWRP3PX43dc5FfWyvJnA9ZzLGia2uQSz5lIRK7eaiuIWoK6HF9VtN4SV8ZDonGAdtkKu7sOoEEboULZO3eVE4B+7lvGEYRBr+FcLtblebhC9rjK5IzDU6RaHBPjUajj9bGcDKYc8QjCMX3lT9ffCm6CE8SMoGQ4l3sBG3Zes+tOR6H8W4VNumssyZBkD/T/NEQHnlyMoVXVcG8OnPQ+m7Gbuv492foBL8uAEW+ln605oIT/Vyc5kr+KAeupO3hI78zAEzNWpS1hF3MP0s/2BMCegHxQsrPkPGykHQloDBAuNk5GZKcUJ2XVMHeZ3qRpXakMe964tMzXDJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mn2hy3RZD6OTVqGtLmgaaLgbAxI4KZZpISE2ZfRKKWo=;
 b=H6HCMOkgVg38CcfhLshUsmOW9JIYiVw/26FCVUs0BceCwHcpuI3pxNOAKzizLg5o3ZOGJPtGHBuVUTsifej3MmrI9gNio7fc1b/yav1/VwZUdAqaRyn13cheyj4pB2QW45cs15EkZ9KKhWyZ0ZlgKVLDvhhav/Iu08R0AGUU1f4FNIZD45Ki8LXw7LY8iO1gkM0/pvvYCh+JPL5/AcPy7SiwdrygTiXFtamTAOBAexITRk5E3EIXAEB/gIr5a3wB1o/FxGn+KyG+4OqX2CSw00A5pLWqgAGkTv3bo9PVC/celbLGZdv7PaLbC3Z2QcifBrJ7E08Lvi9KNFEs7IWzeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8902.eurprd04.prod.outlook.com (2603:10a6:10:2e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 02:39:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 02:39:45 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v4 11/13] arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter
 cards
Date: Mon, 28 Oct 2024 10:37:38 +0800
Message-Id: <20241028023740.19732-12-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028023740.19732-1-victor.liu@nxp.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: 407550ec-97c0-42ba-0eac-08dcf6f9c8d6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y+GPZhwjGqf926p6PDrTW1V3dBNRtjLN/k2D5E5V4h/fp7PGB1KYBJY9F8YT?=
 =?us-ascii?Q?4gVLCBtMRwSwZTF2uoXgEMYAriSAZ9gX4ahwiVN+ay1lfEc90SjGashNr6/d?=
 =?us-ascii?Q?I3y8pdD5XfE2rt3/1jkMDcMqgbdissW9+Vd0wuABjoFisnKrVZWV/21hAiL8?=
 =?us-ascii?Q?aQyN1ZHQH7oDNvTBkmHBJjQzR3w4NfyeAM828EZo5PgQI5kosoADYec+h8VG?=
 =?us-ascii?Q?AAneHHem2O0Vk5oXeZOwGLebgzdKee4nZfdY9O3uObKcpec1T/SYpfELvsY1?=
 =?us-ascii?Q?Fe0vDKkxuGMaBkzduMNC68VJfV7SxQh4ZUGvC1vLpKBGxlKu+MI/u5J2B2/P?=
 =?us-ascii?Q?0Wx/SPLZKgqfRfKdEAbv+5IwhZGY2HRbxwM3w43267ljOaM7U1xjHPLHsKON?=
 =?us-ascii?Q?Najb56H0R7eUWGgYwLQRm/UrvkZ0yfa7MQJclJr4QNvdUDgNdVm/c8G2UETH?=
 =?us-ascii?Q?P2Z6ymeySHN6H+1d+d0Q6G5SpKChPEC5NSM7dS8fjGHbac6Nb9oGaKmYZQsi?=
 =?us-ascii?Q?UY0cUS83C1GAvW0BK86xvEgJ1iwmUxgao9Vh7TNx/J94myewIJJcsCeBs2UI?=
 =?us-ascii?Q?1X4D0Iq8gWYj5NN8xdapA8Z4f3UobUZFJnENrq8DQgCIgvWruf7Cix6Cl9i4?=
 =?us-ascii?Q?pKWkoRobpdQjhViV6De4x5lmrU6/qm69C3JOFM5dnemMLO0cnbmaHx/DR47r?=
 =?us-ascii?Q?L6/bNoXJII0NbcfrXQwHz0LjPi5h3NQofXRcUbhM82Fq8sGx0efUsTKaCK33?=
 =?us-ascii?Q?Fn/mddW2PJffTtVrd5F+e0Ro/UYXD4EummcgBWM6hAZMN86RtXmUDnX+MGoX?=
 =?us-ascii?Q?AsLn4K2xYKWt9BXrjOlXGg0B3sEEk4h2B4EwpZlYt04iLX6FKaF2Cy0WNnkt?=
 =?us-ascii?Q?Iy6SZ0utZQ98kU7wojCM+6KkYuNXb45XxKYAGOMRb4sUFi7gLU3MqZ/wnGo3?=
 =?us-ascii?Q?o313cbcQhnSmoAR4tgGRBnkD2VxionRsHbf7eBv2U240JwmR5zNBr9HyAduj?=
 =?us-ascii?Q?1FBhxRBNyz16fz5kgui8MH3qvuEitr5d5zshhBlEtklIxD1ITabGoy16uEZT?=
 =?us-ascii?Q?ZC1cVX2ZpX6hhSzWNf014K0SuzF/IwpPWcIEd8ypOL6wJph4jlOfmsx333Wl?=
 =?us-ascii?Q?ECiRQRCDopOwoMAL32cJKEGPLu7KSrJYvc8aFjW2R9Skpe0FVSsEARdKi/hg?=
 =?us-ascii?Q?Z9AmsuTvJPnLKvW8TdFPKFDli/5u+yDhdZ051H4oWVqGNxKj4I+ZJ193b3tf?=
 =?us-ascii?Q?xEWoRpenLIZ/YujrSNC6scXDfVG0XWbbZAm1xfkni7lcbxizzFMgtkonUkqX?=
 =?us-ascii?Q?/7jcKF8rDNV4Jyy3IjVI60eR2XLoi8uSj5mB72omNDJjq4NWZWOqAL2jZDaJ?=
 =?us-ascii?Q?8xbHQVXRdvPpQS+4JllTxAyuQgql?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lhc61x4F7QD48NeqTwloTGuLgW1IfJchISB+jWjNvOh9JxAB8V14HI6zY990?=
 =?us-ascii?Q?Rm/+kjUqc/K7nbVgyeJpRVH9IIf3SjR+beIyKOjZAAGAjZBxeKquASXfkIer?=
 =?us-ascii?Q?4SSypJKEB/Qs4jmXd6rnqRNmUOEo5PHqNNJG6gvQhlrFd+5+lm82cEUYrMb/?=
 =?us-ascii?Q?NB+AOHhENc/t3ICr7ltWYI/aqP4/Ucc0pBoo7J2ZTeek8rgBIQgChMLcdGj1?=
 =?us-ascii?Q?EN00JrdoR+mBEAhXOkfe8xzcvhW4sBEpp0zefJHdRkgNw8BeQMuwX120xZMY?=
 =?us-ascii?Q?PAoLKWZySvynJPOHrdbZj+vCObFXiqmnLC3XCIxVT9QleznfZAjtlFX9NY12?=
 =?us-ascii?Q?MOuQj5TCGptYiXIDfx3CVGA7KXitv5jIJVQC1iky8QUToRQVrXn0BIqEOVE0?=
 =?us-ascii?Q?vO7UnQ0fsxrbk6SXk7nnt3P33eZpNGr37WCy/shdAGr/za/YJf9JbOSUFWeR?=
 =?us-ascii?Q?QW/hB6D8Yk/3AZypUfAVGx1fYzJGAXNgyw9vfe7rtgXI8wOxc2rKKsjlG8qk?=
 =?us-ascii?Q?PH7l01T9oIupmUw4EJb/B+buvRhOYiTdhhQVh/SyoOdXlwI1WumDNFsQ0S0I?=
 =?us-ascii?Q?5F5C26O5u7/MIGrUgTFNaqfXC6QUJKO1BkYwrsAZcbdyVYizgTBr/pyKkWPX?=
 =?us-ascii?Q?/LT+9gd/5VBNN71MO7QIICHk1z0/T0GJ81zfhrY2jHQo7UIYvrBAzYEYDyxD?=
 =?us-ascii?Q?vNLn0j0/Izl13D2LLmiGuPwEHGJTIEB9GfuHmWdZ15syiFzyiJ99s7YQEWIu?=
 =?us-ascii?Q?zq99oWFri5UPOcgyRulNWmpcK94fahyMe8qzO+KPW8zPMvnaR/TGJU/TISAR?=
 =?us-ascii?Q?17hxKT2yfSVfa1oGp62sCEtsVWz7deJo/+uuL5RCPqx94LNethfHyjpI430X?=
 =?us-ascii?Q?DLhczNeggjNs3NDddjIQEdxHsWcS6hjdl7s2OcRWK5xE2/ABzaLMH0z12Yml?=
 =?us-ascii?Q?Ao32B/23jQqzm20DTnPXaHIR3qxI7mGX3vORMYTCtxlIGu/yQfNItjanfQhJ?=
 =?us-ascii?Q?Ykk+FVwfCRAWWB9tthAwRbNjYOlVbF7ZvQuOJ/ZnTvxvsXeggzwxTIW5M91g?=
 =?us-ascii?Q?CY3icaK55qGD4+xeBlWmp85cWYdhhv+JvRiTyeTh3Co9KEHu7ZSQ3OADbBAz?=
 =?us-ascii?Q?2XKsNeEHU88TwksBU7kuJoSK5qWivGKThtU0+PfgaeRpSVfobkIbHqlWPkC7?=
 =?us-ascii?Q?XMxiVhNHHvhCR5+gJQtHEt6By0mQq+N5aM5rZ6eIFaVsw412OMTOGpYoWLeS?=
 =?us-ascii?Q?YbRzMC+aDU+DR6g/UB2P9KoQykUfzLK8+AUymL2tbEX68O5ColNN5SmJRDSk?=
 =?us-ascii?Q?XKuZQMRvYNos8sJ2R5/kCg3kqItmpIBDt4v798VNTy6aSRJBn2BmknUtk8kp?=
 =?us-ascii?Q?0xKLfMzcSiZUFpy1dsa2IfMiZVZi1yJKTQH5JMxmd5sWw6T95kBIDNgyCEHi?=
 =?us-ascii?Q?DiyywtDLwmuNXP4j3xvQYY3r2fJkfWanLiW5jxK5fQ0V/pD4fDMeo2uJElxY?=
 =?us-ascii?Q?f4O1CLDcSVEe54yvinWd93fEuhlICvUUynsKmDqJm90a9f+dY7DFZ0aaW1t7?=
 =?us-ascii?Q?+xzJ3+EtrhYDgq6JfaNlXOMOrJYkYM9FEM+lINi4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 407550ec-97c0-42ba-0eac-08dcf6f9c8d6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 02:39:45.9010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnU09tT+q9qBeqHhPR9lr5EtTGCtTPDIOYspTalqu0krR/L4BkY9fxnQF8qT27v8giHhwpfWE19A4t38EWHc/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8902
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

One ITE IT6263 LVDS to HDMI converter is populated on NXP IMX-LVDS-HDMI
and IMX-DLVDS-HDMI adapter cards.

Card IMX-LVDS-HDMI supports single LVDS link(IT6263 link1).
Card IMX-DLVDS-HDMI supports dual LVDS links(IT6263 link1 and link2).

Only one card can be enabled with one i.MX8MP EVK.

Add dedicated overlays to support the below four connections:
1) imx8mp-evk-lvds0-imx-lvds-hdmi.dtso:
   i.MX8MP EVK LVDS0 connector <=> LVDS adapter card J6(IT6263 link1)

2) imx8mp-evk-lvds1-imx-lvds-hdmi.dtso:
   i.MX8MP EVK LVDS1 connector <=> LVDS adapter card J6(IT6263 link1)

3) imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso:
   i.MX8MP EVK LVDS0 connector <=> DLVDS adapter card channel0(IT6263 link1)
   i.MX8MP EVK LVDS1 connector <=> DLVDS adapter card channel1(IT6263 link2)

4) imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso:
   i.MX8MP EVK LVDS1 connector <=> DLVDS adapter card channel0(IT6263 link1)
   i.MX8MP EVK LVDS0 connector <=> DLVDS adapter card channel1(IT6263 link2)

Part links:
https://www.nxp.com/part/IMX-LVDS-HDMI
https://www.nxp.com/part/IMX-DLVDS-HDMI

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4:
* Rebase this patch upon next-20241025 to resolve conflicts when apply.

v3:
* Use data-mapping DT property instead of ite,lvds-link-num-data-lanes.
  (Dmitry, Biju)

v2:
* Add ite,lvds-link-num-data-lanes properties.

 arch/arm64/boot/dts/freescale/Makefile        |  8 ++++
 .../imx8mp-evk-imx-lvds-hdmi-common.dtsi      | 29 ++++++++++++
 ...8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso | 44 +++++++++++++++++++
 ...imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi | 43 ++++++++++++++++++
 .../imx8mp-evk-lvds0-imx-lvds-hdmi.dtso       | 28 ++++++++++++
 ...8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso | 44 +++++++++++++++++++
 ...imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi | 43 ++++++++++++++++++
 .../imx8mp-evk-lvds1-imx-lvds-hdmi.dtso       | 28 ++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  6 +++
 9 files changed, 273 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 5c157529fb88..ec04d693c313 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -207,8 +207,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 
+imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
+imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
+imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
+imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
 imx8mp-evk-mx8-dlvds-lcd1-dtbs += imx8mp-evk.dtb imx8mp-evk-mx8-dlvds-lcd1.dtbo
 imx8mp-evk-pcie-ep-dtbs += imx8mp-evk.dtb imx8mp-evk-pcie-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-mx8-dlvds-lcd1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
new file mode 100644
index 000000000000..44b30e9b3fde
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	lvds-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "J2";
+		type = "a";
+
+		port {
+			lvds2hdmi_connector_in: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
new file mode 100644
index 000000000000..4008d2fd36d6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include "imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi"
+
+&it6263 {
+	ports {
+		port@0 {
+			reg = <0>;
+			dual-lvds-odd-pixels;
+
+			it6263_lvds_link1: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-even-pixels;
+
+			it6263_lvds_link2: endpoint {
+				remote-endpoint = <&ldb_lvds_ch1>;
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&it6263_lvds_link1>;
+			};
+		};
+
+		port@2 {
+			ldb_lvds_ch1: endpoint {
+				remote-endpoint = <&it6263_lvds_link2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
new file mode 100644
index 000000000000..6eae7477abf8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx8mp-evk-imx-lvds-hdmi-common.dtsi"
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	it6263: hdmi@4c {
+		compatible = "ite,it6263";
+		reg = <0x4c>;
+		data-mapping = "jeida-24";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds_en>;
+		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+		ivdd-supply = <&reg_buck5>;
+		ovdd-supply = <&reg_vext_3v3>;
+		txavcc18-supply = <&reg_buck5>;
+		txavcc33-supply = <&reg_vext_3v3>;
+		pvcc1-supply = <&reg_buck5>;
+		pvcc2-supply = <&reg_buck5>;
+		avcc-supply = <&reg_vext_3v3>;
+		anvdd-supply = <&reg_buck5>;
+		apvdd-supply = <&reg_buck5>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@2 {
+				reg = <2>;
+
+				it6263_out: endpoint {
+					remote-endpoint = <&lvds2hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
new file mode 100644
index 000000000000..9e11f261ad13
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include "imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi"
+
+&it6263 {
+	ports {
+		port@0 {
+			reg = <0>;
+
+			it6263_lvds_link1: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&it6263_lvds_link1>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
new file mode 100644
index 000000000000..af2e73e36a1b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include "imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi"
+
+&it6263 {
+	ports {
+		port@0 {
+			reg = <0>;
+			dual-lvds-even-pixels;
+
+			it6263_lvds_link1: endpoint {
+				remote-endpoint = <&ldb_lvds_ch1>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-odd-pixels;
+
+			it6263_lvds_link2: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&it6263_lvds_link2>;
+			};
+		};
+
+		port@2 {
+			ldb_lvds_ch1: endpoint {
+				remote-endpoint = <&it6263_lvds_link1>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
new file mode 100644
index 000000000000..8cc9d361c2a4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx8mp-evk-imx-lvds-hdmi-common.dtsi"
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	it6263: hdmi@4c {
+		compatible = "ite,it6263";
+		reg = <0x4c>;
+		data-mapping = "jeida-24";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds_en>;
+		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+		ivdd-supply = <&reg_buck5>;
+		ovdd-supply = <&reg_vext_3v3>;
+		txavcc18-supply = <&reg_buck5>;
+		txavcc33-supply = <&reg_vext_3v3>;
+		pvcc1-supply = <&reg_buck5>;
+		pvcc2-supply = <&reg_buck5>;
+		avcc-supply = <&reg_vext_3v3>;
+		anvdd-supply = <&reg_buck5>;
+		apvdd-supply = <&reg_buck5>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@2 {
+				reg = <2>;
+
+				it6263_out: endpoint {
+					remote-endpoint = <&lvds2hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso
new file mode 100644
index 000000000000..527a893a71b2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include "imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi"
+
+&it6263 {
+	ports {
+		port@0 {
+			reg = <0>;
+
+			it6263_lvds_link1: endpoint {
+				remote-endpoint = <&ldb_lvds_ch1>;
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	ports {
+		port@2 {
+			ldb_lvds_ch1: endpoint {
+				remote-endpoint = <&it6263_lvds_link1>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index d26930f1a9e9..68e12a752edd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -938,6 +938,12 @@ MX8MP_IOMUXC_SPDIF_TX__I2C5_SCL         0x400001c2
 		>;
 	};
 
+	pinctrl_lvds_en: lvdsengrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10	0x1c0
+		>;
+	};
+
 	pinctrl_pcie0: pcie0grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C4_SCL__PCIE_CLKREQ_B	0x60 /* open drain, pull up */
-- 
2.34.1

