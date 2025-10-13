Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35CBBD5EF7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 21:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A60210E519;
	Mon, 13 Oct 2025 19:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="T/LwuPiJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011001.outbound.protection.outlook.com [52.101.65.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDB910E519
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 19:25:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lU06H0cPzL0KLRykFqyifCoJtnzIC76LvTzDQx9ouXw6TLJPfuahjAhbePsi0fQ2HHXyhRJQMv8QoiDR8YS4xLGS9Pe5GyP0XjllyvuH1Kg8fPHVvwqYMgVcjzkl/pML8un1t0Y6sQtjbBc7yzTnlUOCyMrANznQg5JGfZyLAwyfE+47OdES/31difH2EoGfrKBg0+SX+61Yq0jh/YFCrJc4XXsbtkUtgU0/aQknwvRsa+akK3hFu+oHPP/4JXvYZDb8oqpBJYJY8aCRG2uuxjra3QaGVCJbAXPiClrxaQpvEQpZnDv0T3Vmnd7/B3G9XoWNKwR1VSg9PMjIiQtoow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxY7rBbhflWZlRcC48uS//S0i37gX8y4b/iSMaA2hxg=;
 b=EFMda67eWLDn1NIIOFSV0pVgATnV4uenaesDX8PJo4nbTsCyaEFDqBMPyNLisAOkMqV1F0BTRE3A284NuOBLeuvx8txcoERA05OYL/Gs+KhLg/Xc5fCD9jsiMbcF4TT6Y96LEvmPtj5RA6ejBVMrOg5XZG64o5AG5SNLA5Qt/JukvE5VC7Fg07rtW0+/+GDc2p6Ks1I/L75CuXOnUFUFOg0AWKd0m9B2Gqict8XHRE2c9wM0ecZ6FKXY81CyC/ei4W1BzsM2z70x00rpMTT7Lh7L//QA+IsyLUgFMZDlwa4S82NwpguCZ9I82zvB3smNCI0pGysaGi4zExwm0oVF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxY7rBbhflWZlRcC48uS//S0i37gX8y4b/iSMaA2hxg=;
 b=T/LwuPiJIv5SEf+i0o630o+lAbXxdE4xNlE5gHPFIqkmdnMYM5xllXh0+Xe61IcyYtD/1+Ut93SlrGd7i6DIARk/dzwFoRo9nq+kb8TcTfzOS+PedL+MBHUmY4w4ElOafkjBFX9AoEwWeZ1O8AUI9q+cAyXUi8tAbZIShel2/0O46PJmLV3aS3xAknQA9kKfX2F5bHNlKg4IN5ujCWkgc7xqy7hltusl56nD3TvqaKIuZe8x7XLIErhSnz92JD3TjdxLfWnHXTVe8TfbvNwTjd0+vPKnsdc0cpHWCr5UtxkiqMeID8bML/WlZ71+PKUtrozs6UknyOjggRIj+zRRQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8708.eurprd04.prod.outlook.com (2603:10a6:20b:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:25:43 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 19:25:43 +0000
Date: Mon, 13 Oct 2025 15:25:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 37/39] dt-bindings: interrupt-controller: fsl,irqsteer:
 Add i.MX95 support
Message-ID: <aO1SLuzj/kSy5Kvn@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-38-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-38-marek.vasut@mailbox.org>
X-ClientProxiedBy: PH8P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::24) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: 883f05f3-14a0-4e3c-1b28-08de0a8e4d5a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lEpLVlXkWufWLU3pytvK/TBcMV8+EgukLCbEqQau3QAbELh1y3bl+fhlptKO?=
 =?us-ascii?Q?VAw3ZWcPHXhTc++UgmmX6ehSA2Qq75aHjZL84bDDBinhVyPG0abbRcDf8/Uu?=
 =?us-ascii?Q?k9ACcfd4HlrOr13r+7iUC6Bwnn7Cd2gr2SoZ1SJevm5HGgzlFggMz6BuXl+n?=
 =?us-ascii?Q?BACoEy45SHnewdUJRCL8OHLx9jz5Kn1302tepxJYM+Mpk0Nk3/9hZyOotKGy?=
 =?us-ascii?Q?54jwfCUClNw2KRbUi7KiUeU55gDwWXc6/Pth5IyEeSwBy731mgsGqfrkuelP?=
 =?us-ascii?Q?lQIzM+ig0s5wWxMDMRJSO4aDFKGTm4ELLBHZCMsw774VoEXN/guEsHveaeoV?=
 =?us-ascii?Q?NEe+2JERFz12dasAFwNGzZGyNr5aEnGURMAzABlpplkkXtOG9TR4yJpgJmT5?=
 =?us-ascii?Q?bPDXAG/uMQgjoQAfIrG3VCwGokMYDZDTm3UY3B2UCA0YsWonxNXHbOzHYImZ?=
 =?us-ascii?Q?BHRe6oaPWg98ILCS/+zx+d6cDrEmcA+bE6OwEs+LWpnpEzk4klaRVH4mlOyL?=
 =?us-ascii?Q?EHPuO1PznvPVvED79t1iSWn0H8uLJ6YOxKDqBjdOTLSUpamjxf+pYo+EVxrc?=
 =?us-ascii?Q?qBgW3WYuIdPOktwDDHmykcIOIXjbqQLVqTe/imHC3elmVmlZUYCzKN+FzIz0?=
 =?us-ascii?Q?smJDP8mr8ssBRvUOzAgFTkBTa+i+ulB3sLJXVGBHEt6FKWt529XGz8pzwnIL?=
 =?us-ascii?Q?8a0nKgJT5LofC4h1U4czCSWesZMbAGf82o/YuEBbmOQnOhynBLuKhkrA2nni?=
 =?us-ascii?Q?IiinOlfzRNYKHoKJ9voZHBG5QOpl1pKNt+SD7ZfARrFYYZT6eTgHvbI2Nq0R?=
 =?us-ascii?Q?xZ+mDKorBZdlyWyQLoYdijFVCRksZVB8PJgMIchbLDizb3dkoVUfgMw1xM/U?=
 =?us-ascii?Q?7nKKLEZiHFNjqOHt1HZdNrt6I3Wm3GRiEoVHfxFsLoj7DCDrT5NfT1+ipPlF?=
 =?us-ascii?Q?bP4dfAJZCEJ8ziR5+kKqStN6GqdjXZQHbFMaxDURjU4DjcX+i3tK8qc3uBgG?=
 =?us-ascii?Q?Zq8DUIgeWNBLAmfU23gM9f8H3FXYkrBX9nxo8hodq1JzCcVOP/Qu9C6buTz6?=
 =?us-ascii?Q?1xetbXian6ew3g2u3OOo8yN7uBl4l7ZvzxgYUYOfeAQTksHJp83sYWyQQW4U?=
 =?us-ascii?Q?kUdQhZJpOlWCuUiOY7Z3z842Xpo0TGuGvm6hXjP5E5vhPjPLiS4k0YoGuBSv?=
 =?us-ascii?Q?3uaJCU1fc3kDVuac53np5QHTJvdtI6r55CCkUB0rd6XYgtGFQeu2f5fJSUSK?=
 =?us-ascii?Q?Kv4e7G2SB+2TQXgdwZLiMqveXHBUBo0x8eAmctou9O5MdIw09G682B9IplBm?=
 =?us-ascii?Q?VRqjoknFrMHUnFF78Vu2bCogxy9GtOmnzih7rNHP9GwWOgZ6F04U9Qo3K8rf?=
 =?us-ascii?Q?uZOZOog9SCM6urvxy87XaheOqQEQLL77DNSFIpoIes7e1eu60gwam1j33gT9?=
 =?us-ascii?Q?+OwqbchmwtrqaPxVuekSZsql83WZKM6xnIceRop2YCTXJICOVwATJg8VaAOH?=
 =?us-ascii?Q?eomU3JhsQ+htrMjS9r+o12iTyvp6dFazX9EX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vKd+hGajm7C0EL+rr5MwHEE7TV/B5xT6cSVc2iVDdluUVWPo7U29sXcUyo3T?=
 =?us-ascii?Q?2BNZhsfh1rZEEREKTRP4iziK0tCKHuF9aJ/Sis041BmLwj/WEb3oDWK/rZpu?=
 =?us-ascii?Q?esD9zFSUipuKc3t2zZx6HNK/TzYio4lDKLYeobaGxOG+Syf7RWhbQ899GAjO?=
 =?us-ascii?Q?Nt9aQ4CkTmv6EQuoekuFjx1ThR+U+ILcIEyhjLCvPxkvjUzqSAo0R//NeooG?=
 =?us-ascii?Q?s1rQNutIHwLdcRxe3gvh5ywuC25cvBozzkmzlS+04SMEp5L5VL/pNtU+TcDT?=
 =?us-ascii?Q?qloMtO8G5+bt43IjuI6ZMd8pqhaT/BMt9L7H3+HFxoGZiXmQnJmwJozt98/x?=
 =?us-ascii?Q?xGYGs5GsFPtyjvKRD015SxWgtK9wllSwZBiI7Qn5+r8FVEzivYf2pbbLh09a?=
 =?us-ascii?Q?sVdh9bqZmMUXO66Ge8edH8Wwoy3NX4c3U4DPnCMegIJ6NNStzgBTrHplg6Ho?=
 =?us-ascii?Q?DvFjs6jaK13zzlpWlbeK3U/tKeSxoor0IjOWeKeoj6E6gIFq34PPMI/FPF3m?=
 =?us-ascii?Q?GYQe9ifM/Y8qWSwlXpT7ruvprkVxNwSUz1YnxLDK2k1x6mQBVO3Z5oFEg6Kb?=
 =?us-ascii?Q?cMuIZm6R6wG5bVQHXN5Pw3wIsDOr0OxgVgcAYLId04qXoFHVxE9TcULEpLe2?=
 =?us-ascii?Q?0sgKwgcm/7vkeStNWXBBIB2QOkr+4jKAwYuXJoSGhcri6+Y09hpHhz1ZDqxD?=
 =?us-ascii?Q?CK3lnlu8Q4DDzvKN+LeksZp+7F0SMLrqE8XExiZBvWh7k0uN4ADWil3tiaN1?=
 =?us-ascii?Q?PB1QDeM7v582jVBEcDrrfzXwi3azdQXxGM3WnWeUDcekHzW4qwE2npoPliSn?=
 =?us-ascii?Q?hgA1OWke4WREHDZXfF4iX75emkIp9TdDJBub1dgnQNIQ7Ks0DaDESNpHLuYr?=
 =?us-ascii?Q?M7VTexnBhKs1r57+b4qP2WNXFBaiPPcSN5SevSDsNKw1HbhGLTeNH+/qsiog?=
 =?us-ascii?Q?fzYErbUbYKh/nh9RB9HdPsl7W4oTZAQu6onGQOm+ep2SRg2qDCmznCO3wxio?=
 =?us-ascii?Q?XYmn/f/t0cASGABEvQ+7MwjJih0dTbGNYNMzJUaVqMdiqG0aV1g6Tgk+d8Su?=
 =?us-ascii?Q?dzTlTnZN2vtra0iYXKeH+Agha0f/PEHpsay0brPa1WUPWBtSZo96pM3H+sDE?=
 =?us-ascii?Q?NVrQG+R4VfM9UT66eSSvpvW17edYDdZEC5wKoEoHWjCxYJPwiu7bvMwnOL+H?=
 =?us-ascii?Q?IsFQ44JYlmoqDWitep/dTVpgVgK9Ko4IVYdi+XNXcT5/OSmswssKzZ7ea2zm?=
 =?us-ascii?Q?KEjRsKhjkd0mXfxPPmcu2vIJHBDXL+QSGKvFpxKB5/77w5vSdPoGoTOQhR7r?=
 =?us-ascii?Q?IcmJ3wvyM2u5AdHrM6nvi5BAWS22eTKEdGMCDBcC/Wg+xHrLyyWHdSUnkH82?=
 =?us-ascii?Q?UqXAIfQ0XxStXV6hzzJtsPlwPZwhq7kiINw85PbBc5w6R1jOGEAYXTNF3P1U?=
 =?us-ascii?Q?Y+Zqn7mNEUBVp08GwXgP2zwZ4KC//BvIigcRBs3MquZi7j7Hmu2P7+5KN6ly?=
 =?us-ascii?Q?a8HNNGpypq/f25J/9x4BUIM+9JmYrWSzxCs1h+sY6wmUj3JARTMpV68/Chjj?=
 =?us-ascii?Q?V3ZzBOOK/gHBDjfcXmY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883f05f3-14a0-4e3c-1b28-08de0a8e4d5a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:25:43.4267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cANCNnPtTndLB1KNYTuNR24G/1UlAElmxYp4Y8ueuBZjI8VyOgRMPJ5bnXyeRbhMAKH6dAJ7TMZueT4MPbHiWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8708
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

On Sat, Oct 11, 2025 at 06:51:52PM +0200, Marek Vasut wrote:
> Add compatible string "fsl,imx95-irqsteer" for the i.MX95 chip, which is
> backward compatible with "fsl,imx-irqsteer".
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  .../devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml  | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
> index c49688be10581..5c768c1e159c1 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
> @@ -20,6 +20,7 @@ properties:
>                - fsl,imx8qm-irqsteer
>                - fsl,imx8qxp-irqsteer
>                - fsl,imx94-irqsteer
> +              - fsl,imx95-irqsteer
>            - const: fsl,imx-irqsteer
>
>    reg:
> @@ -87,6 +88,7 @@ allOf:
>                - fsl,imx8mp-irqsteer
>                - fsl,imx8qm-irqsteer
>                - fsl,imx8qxp-irqsteer
> +              - fsl,imx95-irqsteer
>      then:
>        required:
>          - power-domains
> --
> 2.51.0
>
