Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E4BD5E74
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 21:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E23110E4FE;
	Mon, 13 Oct 2025 19:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="fXP96Lu6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013026.outbound.protection.outlook.com [40.107.159.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FE410E4FB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 19:13:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWk04IU2j/n89E05vOA7NlDGRUjkPd8Gs0Fu950So5IlPZO1ruM5fMAtiIOkEYghZRE9kpnqKfPPeeohwhAMNG4KkQagCBMYe6eB94M4acXhr+6y7t/PuNW+QKY1lhTw0TbNaf1eOMm8BT5uPnfgEu0Gfgpcee0HZWV72WWiYs0GfDgyvAMCPJKfeXy9TtQPZiSYDdcYKO6lsjJrtT1UvIGmJU+obrrFtD0+6g4ifzAv4/6OAsiav/pn+pvTHPKSqHGhMUpSQOPNmoxijINcvFetRiM18041VzZRAgMSFW/w2PHVZo0fLGS7JeuKumrlniPXYM+k2OBvrG7vEfBjXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCreO+m1GdEZdPEca3rio4sx2Qok+Y0/kzMaM2zlpbY=;
 b=wI/4K+Pz0a/jex7QZlS6bi+VDcWYXWcs6AWBtlsO4vzs9lFOYnNkiBK/hMmvGns11DVtIJ5DoekgRY3WKqABJ+wLqRNp8gqyAjxCxGn9srgtobHy77zg78h14XgcJpKz6ujfYHj8DQFbRHp72A8UWFzi1YWJviVP3tZIaZuUzsDUVKSpkv5TkuoknxZs25aMFi6voRtQtO0cOy34bLuAV0IwkZH5Wboe0OKHjbX/l2whlKxCYH0uNfXycJQB64Q6Kqor3g114zjdgyhLpmFTmvOIb1+geqoeIUWacTD+u5uuZ/X8Ua6AjYPxTBl5DcqCQB08swWQMnVa0ijVDTwzAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCreO+m1GdEZdPEca3rio4sx2Qok+Y0/kzMaM2zlpbY=;
 b=fXP96Lu6j0DInYjLymStaQJDMbSLtPa1pb8N7m0iwfiILt/KSGNwmSL2RJvfi37Yd5L8s455kk+W7Cv7h+B9SwtYhqktS1AY+NHrKibFuTm4p0DW7NXoqQohNtGydW9sttMSJvWzhHjIwqJZ6GGjG4IuZHn4pZxjWtUJXZ4cN/TS4GcBZv8LxrhDU0IBOXuwTT6r/dQGBQwkJIX7JovYVVu3PHW5aplgEmTE5CVGckDdZKT8kGZ/7gVqPGErmO94Ecy0L6Gdd5dheYkyQf1g21RvhlSYj77OKqlBYP5Qdrc6v7ttHpzltz6gJN0RPXU2WWGaan8lXpl1Gkc2z3GV7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PA4PR04MB9486.eurprd04.prod.outlook.com (2603:10a6:102:2a3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:13:28 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 19:13:28 +0000
Date: Mon, 13 Oct 2025 15:13:21 -0400
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
Subject: Re: [PATCH 29/39] dt-bindings: display: bridge: Document Freescale
 i.MX95 MIPI DSI
Message-ID: <aO1PUWA8CxEN9mHp@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-30-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-30-marek.vasut@mailbox.org>
X-ClientProxiedBy: CH2PR19CA0017.namprd19.prod.outlook.com
 (2603:10b6:610:4d::27) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PA4PR04MB9486:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8de6b4-641d-428d-0469-08de0a8c9709
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+sXnTUFIfVAHNiXvmzRnoB4onBf78CTkRurGLMrqrnikShW9hVKdjDHpo1fG?=
 =?us-ascii?Q?iqDxGDROkqlmVQ0IMBmudPZlk44Omp5ZII0oniwFn++md6YqELu8AjUIDvMm?=
 =?us-ascii?Q?N68TprCiCNlkQv5DBtm2yu65203TDd0NFB0yUF5Oku9MR7LIHFP/uQizD1Af?=
 =?us-ascii?Q?Z58Lc31MKlrnlcBBrpDkwAFNA4N8DzO82KhQnvUU+rja5z7RCjRvtKPj0hq4?=
 =?us-ascii?Q?7R27a1WPI1Y3XacDRKM3X7UD4leHfmHDmiu2x3uHuLJRv+/oypWxbc22PzSS?=
 =?us-ascii?Q?YVzZM8Ma2DUKySxTTFaG1R5zYpOhLn4po5BRdYWMWOViK0I+97GVh7b11vu6?=
 =?us-ascii?Q?JoCRqYti+Fobpg/9EW2E2hi1GIxWNB62LbTiwpy7XQEuOu2oQHLiYdURYdAe?=
 =?us-ascii?Q?D80vZTdjP3rU0+3HM8fRVRrb7Kd0aBsdG2dUjJ992phi2yASVHyQXXALGyFt?=
 =?us-ascii?Q?60ovxMHXPNVbMrgCHT+4lz3VhwSwUAwpxSIViZTUvd3gnJW9ZrX2Sl6KfSKZ?=
 =?us-ascii?Q?IIGw8Qr8Fdkr+ZM+82thpfwq5lSTr1OQlgV/kkstOsyR9lmT8iH+b8CF/Fj4?=
 =?us-ascii?Q?4DuMu5X5bsd6kdqRcH3Tljm4TqZpF1m+mee2XmrhmFCbKbf6rGbtTTFiDop+?=
 =?us-ascii?Q?dD9GBA90IvzNi2ilDo5XM3iO0uXReXi9J1DOss56an1Ztn36fZX32xs29Oev?=
 =?us-ascii?Q?og8HQwl/PkbYOtOkjAjaucdFB9mHjV+Avy+6t1uU10JSajlYv3o2Me8eEezP?=
 =?us-ascii?Q?G1COYsiWXa3T9OVmvdYY6uZQZVQ92ID0fAx20FKwP/fX58mKuJO2oepnH1io?=
 =?us-ascii?Q?hHrGsJbxnxe6cwNtKHM3M60McwgoIhPd8Ibjf8S2NCJ7X5pqh/I/C4vV5uRG?=
 =?us-ascii?Q?FiGWCDkWr4ON9NavZ3cePeS17dybC2iQDRIeNEfkZnb25FBZH7ef8LaEqqF5?=
 =?us-ascii?Q?5CAwC9JLF/DhQUqrq8I5yuDnxqNChsml1Yl0kNmf9S54YzSqtMCa4ix/Fue3?=
 =?us-ascii?Q?gTeIukFO2GHnUYRqXa/CoeOrqXGpLS+ln1cNjSf4KCpa5nuhRoSpbYz4rIug?=
 =?us-ascii?Q?L7vE7/S5uwBxIizgQZlb5u4y8vYSr7asEFTz1te9ofapErUBMt8e3mN6OYmh?=
 =?us-ascii?Q?+7LDQvs6rFv0xuv/wqFmyxOGsMr+6tXW2UxRWf3WXJEiEq2lZ35rOKjycs00?=
 =?us-ascii?Q?Owvo+hCSpkV+gUjNl1kdPZkEF7RGTWLD5WbdA8T+S7Z8jOp//qyxMAKpRxlf?=
 =?us-ascii?Q?8llHgIB+OF61jrUUMIaBa8EAS15vY7VMIodI4rLPYX9wsrvGsXBNEwsTXx5h?=
 =?us-ascii?Q?/qikCM9RCU3ZHK6JLLItKGJBl2ccZaTUuAiNtfr4Yt9Ny56VN+weZ1zcuk+B?=
 =?us-ascii?Q?UELPalFOv//Ks7T3NytSVhYWweu5aFOIAOpUaimS1r+/dpWk8n8+gNLzHorO?=
 =?us-ascii?Q?Ruu5YaHdU9C/UG40FclqvI5f1RGs2RDWps7IiipDv9UxLqC0pDCpDQJ2i1Qo?=
 =?us-ascii?Q?iZOqPyh+gO7kb/r1oG+ssMvoBT9j0NY2n5rp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?btplG7rgk/ftO1c4yVLKaFIU3qgjXgILVFz88cYwEG5lWuxGdUXyM/6XdlTk?=
 =?us-ascii?Q?mqGf1v7CVl2gKJ6WTen3MFaV6DPH1jjDTMh1hbPrftGCaVyqFrJUgTU8V9Z9?=
 =?us-ascii?Q?eyEFYDbto/kp1+AqReUiPtdT8A7BzTIlKmzgsapQb65Lf7tswcTh4v8gAkpS?=
 =?us-ascii?Q?pdji4RdTh5/pkSTA8fUBVaoH8Hyml+3dXMMDPZLGG6BYVRIUzMhw+7VD1fH+?=
 =?us-ascii?Q?cs7UPV/ThxJXoh4+lMp+i0xA4fohcUwaLB2t0HWsZbyYU5tiTBbUjXmaW22d?=
 =?us-ascii?Q?m4+E9aYgxDHmUFQwzAuXP1wDe2LhljRnNLAfZDeaLwKnlLqMQonrrrVRWTmS?=
 =?us-ascii?Q?eghN0lThPuUmWXMu4AEbdQfK4MTTS/fSIF3G71dLYmFY/D8U75hWl2i6QDsO?=
 =?us-ascii?Q?RsVFgQiCew7LUAir31KjSw/Tn4R5CjqMonRBGgC1Ml+osnw9RQr4+I9KD9I1?=
 =?us-ascii?Q?alR+ZwFWVGBhLi14ZtU5j3mRAFTWyoR5dKyUKs4JgoBLmVH7PSbTYgJrwlfF?=
 =?us-ascii?Q?fxsIM0ydfjcl7L/zz1BxWJhS2hY6D1vytiwcR2l09PiRdVPvYq0NbXfqEikN?=
 =?us-ascii?Q?WWx4xQjwb7E+M3U1chwC/ajqpCYE1+qRoPfgePhQz8jJyWTIcn/RmE10CrWX?=
 =?us-ascii?Q?yw08mHtfMT7agPab6VG2wvzz6KzS7oxHpLUnclY58JRLdRhSrbgmn/3gbPfN?=
 =?us-ascii?Q?Ue0OC+UHiln6+7Et/jcfRYPMSDA0BGYJzM4uyqlP9EIcjxHw6Uv19Gdfh6Gz?=
 =?us-ascii?Q?UR/FG1/s4kS5vQvLlpwySE1vwsILolbea/dpPyy2j9pHwhEPCrgKXqRYZCm7?=
 =?us-ascii?Q?3vrYanGPjETBkGV1+3gbhZQy12ns15IBMidD/RJR3bRMwMlIGpWWYKnt2Tsq?=
 =?us-ascii?Q?amkqnk/NAHhEqacychZGHT700n4OdRfjstRNSS4EhlL7mdp/XRBnjUN40YzM?=
 =?us-ascii?Q?ULteO/E8BIndYIgH/RhVNbRl8lyxdihOU4KuNcInFxeWc0eTPE+PfmFUrurI?=
 =?us-ascii?Q?sZtHIxn7O9qRlzGDVgjwreD+wyb1zvEXzdhdeDsRbMgjmT4yY9c76sW09sSV?=
 =?us-ascii?Q?wCFoSOOi09gLrUsjNCThD5O/buXPfjknAicCqHHPhjgkOEiWDjg8bRPLZ9HW?=
 =?us-ascii?Q?QSA/B90o6N8XoCD8LFhqxOj0nOvT4HYhewsz7X2glPUAu3kaS2NbuBcUjk6W?=
 =?us-ascii?Q?QwLdhGoXiJqUq9aW5dgZ8RVY6+Fal/zW5KVgb3l0m/niwcI5uWES6agLLGea?=
 =?us-ascii?Q?Hm6QqZurv3Xa/cRSEAmJ+HxorY5f4gnIjNu/2eCyJ7bWrfiUxjNUYR580nMT?=
 =?us-ascii?Q?N3WbFDs6yEfA5xz0eCgMHB0jv5az5pjIx4ncaOo+fM1Fa9Zvdi6eCne2N5Ns?=
 =?us-ascii?Q?7yDc37mCXpMEPFYuwmxdXNykkMmIc3dEXzC8tymHJwouTOhmixJsDGK0iRwo?=
 =?us-ascii?Q?dzzIeq7Vz/8uMaz1AIWvW0JMfL5pXc8jVm54diFm/efgCq+/W/L+TARlQ8JJ?=
 =?us-ascii?Q?n+nTFQMEaZ32XYlSPIVWa8mfavisIECQNupGz+R+OI79DTySFxbXNP7UjSHt?=
 =?us-ascii?Q?2N7nee6UCVsEz/OiTKI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8de6b4-641d-428d-0469-08de0a8c9709
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:13:28.1895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KCuY4Ec+GfKBAWbHomewNJlrFxZ0lFVJYfoyTFSJBz2Eh4JsAy17fhONTrpDoXUvOFa19dgXsGgjobfaZB7/KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9486
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

On Sat, Oct 11, 2025 at 06:51:44PM +0200, Marek Vasut wrote:
> Freescale i.MX95 SoC embeds a Synopsys Designware MIPI DSI host
> controller and a Synopsys Designware MIPI DPHY. Unlike the i.MX93
> PHY, the i.MX95 PHY uses more syscon interfaces to configure the
> PHY.

Any common driver for Synopsys Designware MIPI DSI, suppose many vendor
use this IP?

>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
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
>  .../display/bridge/fsl,imx93-mipi-dsi.yaml    | 48 +++++++++++++++++--
>  1 file changed, 43 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
> index d6e51d0cf5464..388301c4f95c1 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
> @@ -14,12 +14,11 @@ description: |
>    Designware MIPI DPHY embedded in Freescale i.MX93 SoC.  Some configurations
>    and extensions to them are controlled by i.MX93 media blk-ctrl.
>
> -allOf:
> -  - $ref: snps,dw-mipi-dsi.yaml#
> -
>  properties:
>    compatible:
> -    const: fsl,imx93-mipi-dsi
> +    enum:
> +      - fsl,imx93-mipi-dsi
> +      - fsl,imx95-mipi-dsi
>
>    clocks:
>      items:
> @@ -46,13 +45,52 @@ properties:
>        controller and MIPI DPHY PLL related configurations through PLL SoC
>        interface.
>
> +  fsl,disp-master-csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      i.MX95 Display Master CSR is a syscon which includes registers to
> +      control DSI clock settings, clock gating, and pixel link select.

why not go through standard phy interface?

> +
> +  fsl,disp-stream-csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      i.MX95 Display Stream CSR is a syscon which includes configuration
> +      and status registers for the DSI host.

why not go through standard phy interface?

Frank
> +
> +  fsl,mipi-combo-phy-csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      i.MX95 Display Stream CSR is a syscon which configuration and status
> +      registers for the MIPI Tx DPHY module in the Camera domain.
> +
>    power-domains:
>      maxItems: 1
>
> +allOf:
> +  - $ref: snps,dw-mipi-dsi.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx93-mipi-dsi
> +    then:
> +      required:
> +        - fsl,media-blk-ctrl
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx95-mipi-dsi
> +    then:
> +      required:
> +        - fsl,disp-master-csr
> +        - fsl,disp-stream-csr
> +        - fsl,mipi-combo-phy-csr
> +
>  required:
>    - compatible
>    - interrupts
> -  - fsl,media-blk-ctrl
>    - power-domains
>
>  unevaluatedProperties: false
> --
> 2.51.0
>
