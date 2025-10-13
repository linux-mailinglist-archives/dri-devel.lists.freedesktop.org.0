Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25735BD5362
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 18:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BFF10E1EE;
	Mon, 13 Oct 2025 16:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="neFJ31bP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013006.outbound.protection.outlook.com
 [52.101.83.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CE410E1EE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 16:49:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+ygpIG5Z1Us6PlCrFy6DQeMkpPXq3UkOySKKJTlEHlCvzVR/EI9Lkssohi5rb2tC6mu2s94lOlHemu3rrqJdZt55f8UoQplb3WICLYA8VA6v8gT+CI+dJbkDK6vGPPo363a+jOFNdWtUlZpFRS8pbuc6eVc8U1+Xxe0zBZrVEFy48K4VRt0nqiVh9Onmza3fdhY4f5S3JUB0wa+V230VPSMZyX+kzGp8rZsFy8IJx5niKKxEs1onpbZPT9u+LjRZDiN/3d6CBSdj0vjjTx9JXvxLZaFHE/AKqgIUkpvsFvVb/9AwhXsw3JCLrixeaGMN0jTt318+jh3kiNDKqeb6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiq5O/wv/Vh9vl9iFRuI6H8xyEesFiCQ9wPcLjy/jGE=;
 b=rDBsHoiH8xeuPKyo76P4Uy9e7rC9/58MR56omDa5qKEGGvRekpePDpnZsRt+TaXgggPJhJqtmLq1riWA34Yc4TEjj7ptLnGoLqpV4r8qmB+LXBKqzimJpQOZ+hfb09cwuP5mJQ7/HTXZtSdLGFpry40VX5ECrKU3YcGX60L2zRw7tt7cWMLCdrB/VJak73ZwzHvaBXPyV3PsLGHXfPOw3tMDPDC4cD9X2KUE/9yct+nXWqDRryDsGoKwXONGG3nMpqSou4mM5ea0B0pTUkebrR1xaMz5YDRuDUy0XA21XRSUQ6ZvASaAOKI+GtLPocTWg4X5Z0xcv0IorLfN9rjtUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiq5O/wv/Vh9vl9iFRuI6H8xyEesFiCQ9wPcLjy/jGE=;
 b=neFJ31bPNkP8sjAVMAq/3jOUOAEnHbVJ3ceDuYQneTrpISNTaDBuOcdJEZjwwayxlXUwnHvfdCgjH9FDUbcGderFwuYu2tcQXm4jTWu0Vd03FxV91i+1YoTshr0fHX/GB+QYq3U8T4uyi8M5fnZIToIcKNfogwPWnPKoy3ssUaAqOACgktCONy4ZO9vuRs02RMdSZgQXqaYoWNNotQfLfia7BhpaOOhuufsx22yDdAQtP/YOYUmABuviUDgT6D087TqVBGqUpYcNPCSBcvQwOoQ07f4S8N12NJ2nKgSCOkYn8dMs+4yR14ifEer4PdLLC4W721JPkaD8rpEwg/RnGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PAXPR04MB9304.eurprd04.prod.outlook.com (2603:10a6:102:2b6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 16:49:38 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 16:49:38 +0000
Date: Mon, 13 Oct 2025 12:49:29 -0400
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
Subject: Re: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
Message-ID: <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-4-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-4-marek.vasut@mailbox.org>
X-ClientProxiedBy: PH2PEPF0000385B.namprd17.prod.outlook.com
 (2603:10b6:518:1::69) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PAXPR04MB9304:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cca731d-e6d0-4eaf-e80b-08de0a787f3f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GqeO4zRp13pGsHeDa7r9nxj3RLnxrJEktl8hejtvE9kbG9MRGrclzpxUIVQj?=
 =?us-ascii?Q?sG0k2UVy/9mfbxIJBpjaKWTv6qV/K0rUSRZeFQayODumwgH2WO69uTCTCmtc?=
 =?us-ascii?Q?f8nMUVDGr8ydpiGCuT88YeIXAJlPU5AqpdmvPZWkJ7Ipp/HjG+kMYvvjV4WX?=
 =?us-ascii?Q?YWbjWi6xTS0L/Pc1UP5btXEu5l6qrT01AJWqZLEz70OJ/fwc3Mp7AKXzzjSL?=
 =?us-ascii?Q?Tl4xOGSOntLaqgphvdQ/YIzo73JMtkejAyInLDeVLmyuEFHzp3j2mgB1gBrJ?=
 =?us-ascii?Q?KEPpj/AV6GoyIqYC0u4DeXG2055B/0I1obZeG+sHnfpv5wN9sXHYJHQ/gwfT?=
 =?us-ascii?Q?eOCCJPaAqOSQ61cP/IYuJI16r8CvHKOV+ZoyugphDdVAVWGCT6kDUbRpGoXN?=
 =?us-ascii?Q?N5mYWTBYSdpQvqqz5aGwChKJpo0KlWXjd4jn1wopHEYgOqxAjjSnprTabTqo?=
 =?us-ascii?Q?6VSK4ZyYEBRjKwX/HIs+GagaEaJBlAhy/fZDm62u+yiuimnNTlNW+/DjcNfo?=
 =?us-ascii?Q?HnyTPtmYUUFxiXhNqZXL08CXhZMPYWJABBpCKuIDr97wPfW7BTC+pkY+0l7A?=
 =?us-ascii?Q?2G8Eh05GmHBd6j6a3FIa79YFUSkCn9JraF1L99Uv1mvNy8JJqmmYQpBoiPSD?=
 =?us-ascii?Q?KnuBKKKMhvj3QurLwIHI23wV+hA0hWxR3cC+WMxrpakj81Gj4mEA48pwt71H?=
 =?us-ascii?Q?1PssFzo8o1DJulCGdMe2WIgXTTQ+aJCBJrJaoemcMdR0OSQfZvxFleveBu7H?=
 =?us-ascii?Q?pBXrRKkdg5DghffJKtw6gxnutoUasRNqqcnSPi3tL3JKKN0UiRrOvJ9eeKNT?=
 =?us-ascii?Q?FLN5vVWPEzSyR+233kwWlsU34u7AYw4PjFZSpCBbPAd7BLbVa0LxXVR91m18?=
 =?us-ascii?Q?l+rVrh4dpqVlYSR86S4UN74SVBSXTOzNHusfyBBVmo29/jAKnMUDziPfr0df?=
 =?us-ascii?Q?1y1B9OtgiPqKpTRQEwmATpKXxHiQZvha+xOCPxpvMu6Dlw+PRQD2S9EmN1v9?=
 =?us-ascii?Q?vb5y2WD9BXcQhflIKHRFXiZsukMBccLO4ZqlEx59JUKy5MUIHkGkk04Mp8L2?=
 =?us-ascii?Q?6P3rsUjB4zcAHxBn4ra4SwGngdfwOrV2AzkrL1PQ6MrJ7cEVLiT4dIMyasn1?=
 =?us-ascii?Q?V1Tz92dIdvbiOLrJNc4RZDr7qHDgXa2j8dQWq74w1C5ku2eFsXCxezwD61Xp?=
 =?us-ascii?Q?CZDwDZ1YYCph8d7lfiwtTz1QsNQsenogvYF+lRSpi8euhxuCbZyv8dHytDdK?=
 =?us-ascii?Q?ej680bWhjvFPQaJjXHr4ixygEkyc5JkBXMRbzgLcyYaC7bO0DBuEV4YmRfxB?=
 =?us-ascii?Q?XFdgG73U8ohSIpwNxcjRf983+iCJrBt6msvlbkmWZ1MtW9eBZbocbMLueCje?=
 =?us-ascii?Q?S2w4YKKG+O+VJWSQmlmewJjH1JsRpxz+cV8q90POb6qnlTFjBt64OgMYupHa?=
 =?us-ascii?Q?0uWJd/Bwv+yj0NTxmAKnuFb+JhplMsdhWZJX8rSbO90s3rshfrx/HCYSd8Of?=
 =?us-ascii?Q?1lPjJI5FGVDqydifAmj6suai7ogaDRJxtLHi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZdKD1GxlxG4Ml8W82tbYqK8mvOt+bQFY+1UZZ1srxcf8T/kzpdS4rsuF+YgE?=
 =?us-ascii?Q?yOv5ooWWTuhtxYg/2uy076Im+HdAMTpG0hh4YXCUOgppmarTkZoxXDF4luHL?=
 =?us-ascii?Q?PbZk2iF9ePLfFkVSutqn5vKTXkTgimcuycd4JXVghitni4mORTFyBhP7Q+GS?=
 =?us-ascii?Q?HyhqnvH+Whhor02GbD5mpT7NhUv8L7O5MyZRnRue+UAke5gMxQL9QImDa6b3?=
 =?us-ascii?Q?hCZAPFfH3SdIdrnnK7vMGaexLyVXPB84AEr3viXDEeY1Tx0pCPlnAm44hDd1?=
 =?us-ascii?Q?791ct5OXY4sK7bsn8D9IIa1ncH4J+hddqqTUJp06DZnU1q4IsPB6CVWfgSEL?=
 =?us-ascii?Q?uRw0+nKlg1tnCIbAOiImgfPflIJk267oIwI70MZpRLcaBTdXKwQva8d17sMV?=
 =?us-ascii?Q?6jh8/clu1XWUL6C093RBcoyDlaXC1dvGbYMRvtjzql7APzKlJ/VF7bUTT5n3?=
 =?us-ascii?Q?mlxvMSxXq3mIngwzS1N43VepZg9wuVGgXC6zTpf4L/saaMEshEpZR8reRj/p?=
 =?us-ascii?Q?10TgntWU++uAk1N/+CuQUR19o4aYPYyC5Ip9Ou3nVsNfaxt3nwoSDk3MB/Za?=
 =?us-ascii?Q?XoMkEzZgQpVex4zH+JSkapw4pEX8eQ3KcVSl9ie76RS9hsaOJ983RwrSXXwz?=
 =?us-ascii?Q?/T6EvaVQe2ufAP6NNbp9Za1eHLw+rLCLWqzHfmspN/eS9Yf/Nf91gKu4fPAh?=
 =?us-ascii?Q?+53xFpo7asOYktZIj/KjSG6rZLYMCo0F4FITgUa+452UdDKIkxZG1UvQyqfh?=
 =?us-ascii?Q?GgWVuF9gSj7ScpiNfOue5Fnn2nJ9IzKCMH6C3869xnVUHZ4lNBOySBcntkn+?=
 =?us-ascii?Q?+EJgdxN91KKD/ByaRUAoor79WOztIkqU4cpIfjdpkB4ZnBli7ZU4Hxf5hvJO?=
 =?us-ascii?Q?+AwdmIjFBRwmQxkm0WiULUnxBpJFcSyR3hOB9WkMs4FGG/94eMnuBtkDtF+c?=
 =?us-ascii?Q?FF5O7QtVowOOMdp3ZowNfwf+Rk/0yLF1SOloIthuzKKLdYKX2hbybfhaszvY?=
 =?us-ascii?Q?6CaTRxEW/nVbKUT9qX6mFlSQl1THSBhuWHaxPQyIs5J/yoyVxEGXQTV4uitM?=
 =?us-ascii?Q?gJQpKjx8c5+TEcJO4QEIf6ZuKqnA5II+qhmAoIKLCIpZWDmeYB8Ib6udVtUn?=
 =?us-ascii?Q?pwBYTjFU19JKH9OuBHjBxcnRMv4gk+52+0ZFvlJm93LrUr5gHVKPiuPXMtvq?=
 =?us-ascii?Q?n1uEOUny6zIqXYCw2fh420GQO3WSEm+sbJgnwcW0QBiI7x3BydjqYrHIM0LM?=
 =?us-ascii?Q?ZZ1+jNKudgefMMO2sFzpGSOrniDZdJqLLsYryjG7FmmbZ/epceIG9cK5b5iJ?=
 =?us-ascii?Q?A1uXC2+6Fh5dK4DPElvhw6sskxykPd8ctYBG/0XGv+eCa7feQt86x/o2viS3?=
 =?us-ascii?Q?V2Hx4hvz4+3P0U64MdEGKRstEQm5LCRoewVaIIgl4p9lE0xe9nOOpFgQNzQD?=
 =?us-ascii?Q?gwbcE9OSOz7aEvF0M65aPaGXEmw/l4NxTSwqzR3PrNCT4m59Y4CalRwBFSZf?=
 =?us-ascii?Q?QYG1OetqmlCMG4LXPCKIHQPW5k7jt0sY2f3UDOmPX6UpOuDUJzm9+H2EtMgr?=
 =?us-ascii?Q?XfKWIb4YlcDKcpju3BEiq7jr3OO5uzUwSrPsgNBr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cca731d-e6d0-4eaf-e80b-08de0a787f3f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 16:49:38.7699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbJAZYchIlAF2MJQyaGigiFVm/u//1FNoFFjV19RgtGCbmU1tumH8kf2zEKnay4iMY1HL/OPNcCv2Pd1UH85LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9304
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

On Sat, Oct 11, 2025 at 06:51:18PM +0200, Marek Vasut wrote:
> Freescale i.MX95 Display Controller is implemented as construction set of
> building blocks with unified concept and standardized interfaces. Document
> all new processing units present in i.MX95.
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
>  .../imx/fsl,imx8qxp-dc-constframe.yaml        |  4 +-
>  .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 45 +++++++++++++---
>  .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  4 +-
>  .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml |  1 +
>  .../display/imx/fsl,imx8qxp-dc-framegen.yaml  | 13 ++++-
>  .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  4 +-
>  .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 52 +++++++++++++++---
>  .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  5 +-
>  .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 53 ++++++++++++++++---
>  9 files changed, 153 insertions(+), 28 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
> index 94f6785636085..3a585b3b9a789 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
> @@ -18,7 +18,9 @@ maintainers:
>
...
>
>      properties:
>        compatible:
> -        const: fsl,imx8qxp-dc-framegen
> +        enum:
> +          - fsl,imx8qxp-dc-framegen
> +          - fsl,imx95-dc-framegen
>
>    "^gammacor@[0-9a-f]+$":
>      type: object
> @@ -90,13 +102,15 @@ patternProperties:
>        compatible:
>          const: fsl,imx8qxp-dc-signature
>
> -  "^tcon@[0-9a-f]+$":
> +  "^tcon(@[0-9a-f]+)?$":

why here allow no address unit tcon?

Frank

>      type: object
>      additionalProperties: true
>
>      properties:
>        compatible:
> -        const: fsl,imx8qxp-dc-tcon
> +        enum:
> +          - fsl,imx8qxp-dc-tcon
> +          - fsl,imx95-dc-tcon
>
...
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
> index 9d1dc3a9de90e..dd83ac669478b 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
> @@ -16,18 +16,27 @@ maintainers:
>
>  properties:
>    compatible:
> -    const: fsl,imx8qxp-dc-framegen
> +    enum:
> +      - fsl,imx8qxp-dc-framegen
> +      - fsl,imx95-dc-framegen
>
>    reg:
>      maxItems: 1
>
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 6
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 6
>
>    interrupts:
> +    minItems: 6
>      maxItems: 8
>
>    interrupt-names:
> +    minItems: 6

Need if branch to keep the same restriction for exited compatible string

>      items:
>        - const: int0
>        - const: int1
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
> index 2a6ab8a0ed7fc..6565b7acf47e4 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
> @@ -13,7 +13,9 @@ maintainers:
>
>  properties:
>    compatible:
> -    const: fsl,imx8qxp-dc-layerblend
> +    enum:
> +      - fsl,imx8qxp-dc-layerblend
> +      - fsl,imx95-dc-layerblend
>
>    reg:
>      maxItems: 2
...
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
> index 633443a6cc380..2d0ee83e30b25 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
> @@ -17,19 +17,28 @@ maintainers:
>
>  properties:
>    compatible:
> -    const: fsl,imx8qxp-dc-pixel-engine
> +    oneOf:
> +      - const: fsl,imx8qxp-dc-pixel-engine
> +      - items:
> +          - const: fsl,imx95-dc-pixel-engine
> +          - const: fsl,imx8qxp-dc-pixel-engine
>
>    reg:
>      maxItems: 1
>
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
>
>    "#address-cells":
> -    const: 1
> +    enum: [1, 2]
>
>    "#size-cells":
> -    const: 1
> +    enum: [1, 2]
>
>    ranges: true
>
...
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx95-dc-pixel-engine
> +    then:
> +      properties:
> +        "#address-cells":
> +          const: 2
> +        "#size-cells":
> +          const: 2
> +    else:
> +      properties:
> +        "#address-cells":
> +          const: 1
> +        "#size-cells":
> +          const: 1


Need keep the same restriction for clocks and clock-names.

> +
>  additionalProperties: false
>
>  examples:
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
> index 7a3b77ea92c73..1f935b342f461 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
> @@ -15,7 +15,9 @@ maintainers:
>
>  properties:
>    compatible:
> -    const: fsl,imx8qxp-dc-tcon
> +    enum:
> +      - fsl,imx8qxp-dc-tcon
> +      - fsl,imx95-dc-tcon
>
>    reg:
>      maxItems: 1
> @@ -26,7 +28,6 @@ properties:
>
>  required:
>    - compatible
> -  - reg
>    - port
>
>  additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
> index 0a72f9f0b5fda..1e8f559acb4de 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
> @@ -48,13 +48,20 @@ maintainers:
>
>  properties:
>    compatible:
> -    const: fsl,imx8qxp-dc
> +    enum:
> +      - fsl,imx8qxp-dc
> +      - fsl,imx95-dc
>
>    reg:
>      maxItems: 1
>
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 6
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 6
>
>    resets:
>      maxItems: 2
> @@ -68,10 +75,15 @@ properties:
>      maxItems: 1
>
>    "#address-cells":
> -    const: 1
> +    enum: [1, 2]
>
>    "#size-cells":
> -    const: 1
> +    enum: [1, 2]
> +
> +  fsl,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      A phandle which points to Control and Status Registers (CSR) module.

Why need this one? is it possible to abstract it to standard interface,
like phy, clock, reset ...

Frank
>
>    ranges: true
>
> @@ -90,7 +102,9 @@ patternProperties:
>
>      properties:
>        compatible:
> -        const: fsl,imx8qxp-dc-display-engine
> +        enum:
> +          - fsl,imx8qxp-dc-display-engine
> +          - fsl,imx95-dc-display-engine
>
>    "^interrupt-controller@[0-9a-f]+$":
>      type: object
> @@ -98,7 +112,9 @@ patternProperties:
>
>      properties:
>        compatible:
> -        const: fsl,imx8qxp-dc-intc
> +        enum:
> +          - fsl,imx8qxp-dc-intc
> +          - fsl,imx95-dc-intc
>
>    "^pixel-engine@[0-9a-f]+$":
>      type: object
> @@ -106,7 +122,11 @@ patternProperties:
>
>      properties:
>        compatible:
> -        const: fsl,imx8qxp-dc-pixel-engine
> +        oneOf:
> +          - const: fsl,imx8qxp-dc-pixel-engine
> +          - items:
> +              - const: fsl,imx95-dc-pixel-engine
> +              - const: fsl,imx8qxp-dc-pixel-engine
>
>    "^pmu@[0-9a-f]+$":
>      type: object
> @@ -125,6 +145,25 @@ required:
>    - "#size-cells"
>    - ranges
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx95-dc
> +    then:
> +      properties:
> +        "#address-cells":
> +          const: 2
> +        "#size-cells":
> +          const: 2
> +    else:
> +      properties:
> +        "#address-cells":
> +          const: 1
> +        "#size-cells":
> +          const: 1
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.51.0
>
