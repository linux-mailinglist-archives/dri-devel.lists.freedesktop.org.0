Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30257BD5EE5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 21:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBB410E50F;
	Mon, 13 Oct 2025 19:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="WsZ3Oh06";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C6210E505
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 19:23:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHKMLUNeX6PfChDNJGTLQoN2VyHxB/kNRv4Ijr3uvYGE8ztc+Narp27rFNsyF4TMqkhTxtJb5u6qtlfFPh/F26s5RpvCqXpAsiDri4u6HlY/vicHu28vgzGE+G6v60xdbKm1xosaXoi9q1ucDHU00SDp8vhyFIwoBPXpQCy0pM2HrpNMnnBvoQBWLv+Ifmyvd5fKR4iDZTxMj3rq8xyyjjaDNQPSPMSozM60TfMDFrFNv/6B03I7SUuNex5PiKtglInayNvej1i5cxWs0XhEB/gpb3PzDyEMKEaF4Z3QZYPKVAyNFzZNHs9NYlPMWzlPRY8adi5K9zyGMbO1gY4Vow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZDLpuhH1uArlHvI8nhJgxx7BG5CbVha31vwuHNlWcc=;
 b=ntC0bvOsr4X45jmav4JYFQguB0am3fYrepq2tXl0WLyxG5W3aVzN9h84AZcDS4fEVHbYyRS0dwyucN+GHT/S+qDdF+De3CHijDSzJZQioADsCvM2oLTDVBP6xktH+CymfRK8T3CA+tyP7JvMIfr58nAbNc4m8EBKjWH71bbU2oBB3wNo5aAB8D9VZHnuqGEZLBctHAMDlZDIBsIWJ3Ecpajo/gFWto30oi8rScKdFfGsW9t2ZCdHlKERCvj/SnYfg280eyAV7TWR0Kv14mH/Gw781f/IQ8uOoUqbuPVRB4np9tDxM2LJtPDL2QbZ5G8Ei9ZGCbzFJB9soRIhpt/Q/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZDLpuhH1uArlHvI8nhJgxx7BG5CbVha31vwuHNlWcc=;
 b=WsZ3Oh06PUs7i/9aY2ekQaezQkzycKc96fhM8jRNb5GZPh4m+qfFR2/YQKuduGFe9jiEsZGzmVRpM9lQKDm0aR3G8U7bEpfK3U4EaTjj6FJfFTHMexrn3Fka0LBOQj75hxYd7UoKVy1nh5icD2uq6MwdlCP1wtAKMGXvDreS/hy8O4DETD8T5Sq2XKPrCVcLVU/9VsgmEoEl/29sq0fJ7tvGfCRqvk1Oa3vR0SQdVrETeeZmahzC7X9s/OcukStiQ6Oy7g1S0to3ww2vsaMcKtKpBGGBx2VibF3L1cwxibCbcYm4dTmITpCHSWTmOiXN82SrHTTgIPf9r+pWricfbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8708.eurprd04.prod.outlook.com (2603:10a6:20b:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:23:19 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 19:23:18 +0000
Date: Mon, 13 Oct 2025 15:23:09 -0400
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
Subject: Re: [PATCH 35/39] drm/bridge: fsl-ldb: Parse register offsets from DT
Message-ID: <aO1RnY4CcKZWqh3s@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-36-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-36-marek.vasut@mailbox.org>
X-ClientProxiedBy: BYAPR11CA0087.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::28) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: ee008747-b306-46be-4d41-08de0a8df73e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?etO9XH9p21KtSApRLbjepBONeIqBDApoEcphG0CzSOwWv5sD5fKy/M6Mq3k2?=
 =?us-ascii?Q?z3VET9nYiI5Kc6PhlHu4IghxKRDsYJt7AwgaGJDyvD+kXkrKdko3B/dppHnO?=
 =?us-ascii?Q?2HS5QLKL6iKvSxRrksymRLkAeU7YqtP/bDcKWe1MHDi9iYVwuu4QytzccA4T?=
 =?us-ascii?Q?LPpTLvAqFmRGNc1T4kZhl+bCle/qwBa6oWkTkmluHtgr7SXidCyUi733su2G?=
 =?us-ascii?Q?STQYIEzcxTl+amLebs1PKGTeZksaAQVrJ+OAXIMh5tACklH978kxtbfOQ5Oe?=
 =?us-ascii?Q?Po4UMd92PAmUl95aYGIff5QpY5DH8bXc8PV3UvCeNcPFop7UQkgCslIoKBLX?=
 =?us-ascii?Q?rQvsLhLZgtvm3vX/23SLE6pAJoHfnKmYsGwmBcageorUnUyOzk7/z7uDbl/7?=
 =?us-ascii?Q?sRZpxszJSALMbGGjy4ZLhodlqAm1ZECfrvvTbfHW8m5n8u/ndJknX/jPo0F3?=
 =?us-ascii?Q?RaXwaVLyCuoM1fLwFFSv/zffTzieXxksTo/+CfHSpWxGLAmKGnsg6M/Jofvh?=
 =?us-ascii?Q?d6FmrkEUFzSnJeJuMyZuFkAdJYJkO+3EVX3Q2O0VcY8f0dIzc9IxVC7CdLjd?=
 =?us-ascii?Q?fPZw0082Ap/NZHSeGDRqEMGlACML2rq8YAdwSbHm2N+3X+sglEXoo929DqAQ?=
 =?us-ascii?Q?fqf9CVSFtU4hI8QCwhRSG1g52zKU1d2S/pUDtKLWr4EQl59OVTjNBY/z9mxt?=
 =?us-ascii?Q?9SPvvRYvhKzqzViCM2eLWoypTipUbPVX+CDH/XMKtZ/DXKpgx19uZDJ8DIAT?=
 =?us-ascii?Q?FbLsGE7c/ouaMmRouimFoRV2GZTqatkNEM7VF3aHsXGHL9uasLPxGjuR8C2Y?=
 =?us-ascii?Q?XhyT8jAh4j1xetpaelGpSLsGi+DmTyjrMxPHGkBaKRzeldmsvcOeaViOIfG1?=
 =?us-ascii?Q?XjkwZP3RF2nOf1dWcWYwTuOMH0JyPZTSIITrIqjGFb5Yfwg9zJa//FIGXYLB?=
 =?us-ascii?Q?3mWsRgUQ2TG4iWcrBjnxCt6AaQF46ak4A4n6YcapkcekhKG1Kx4uql/Hnhp/?=
 =?us-ascii?Q?qVs3ceD/0dXfh5qFTvrHroSinbFs9uSIWKDUcEomBo2co0zWfKIYOxKDvPZ5?=
 =?us-ascii?Q?u/rbOn6hWeCYoqkUW1dqPxg9Fw83vTZmEdviOl5Kk2yr4J1iS9EMlmoBB9se?=
 =?us-ascii?Q?GZEsh9bCgc/EkqGAZFu6dA8EwPx4U+w1ZpyD6SAOKuFhU2Ckg3q6I80AibSZ?=
 =?us-ascii?Q?ia0Bwdgzc9JES1MYAEfybpIj9hagehGhzPqvqDoZ24aBdmmHUp190kZ9hRIb?=
 =?us-ascii?Q?ScfM8zociIdRLj1JMdZ69oHwtV38s1Z+eTzeKeM4Lwobauq5P84wu6TRLLwa?=
 =?us-ascii?Q?9S91A/Bc+HsTbb7+olc+uR+ZRFowIEFUcUqcg5eGTwMovQGFMZ9zCRqp7mHW?=
 =?us-ascii?Q?CAkbJf/Ggj3A5y5WHb6FGLzVWa28rmvPHbBi9bO2rBLaDRSq+mEO8wnUk4I8?=
 =?us-ascii?Q?q4Z1uhINEDAqos6bCsEj7Bm0xPyZ2/yUAQDkGeDoTgheeumWquNnUUtCx4vq?=
 =?us-ascii?Q?rkR/If6IWeAtYXH+Xbwa84QI5V6hlKl1q2az?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y1uSp54eyN/Mor8Y9yzgE0eu+dzWbvD0WqvorNgb7TXzRcm0I+cAlM7gsujw?=
 =?us-ascii?Q?tn0f9TBzRCZSOkXFE9B1DKKeEktR87cWDFqTwwWJvnJpuL8xb7XwkhTHpg97?=
 =?us-ascii?Q?hAdV4i1HqM97Lc4QlOsAVANSpqiX/QokCO2lpuihAJUq89Qe58yf5OVNqGBy?=
 =?us-ascii?Q?N+vE7fzUbzTxPTy6iQR+I/DDOmj60Rza7L/YkiA/yUOHVELGB8ViSruR6jYM?=
 =?us-ascii?Q?M+Yu/A4EirZYFSF+SNGuy/NiCvAVLd/HaKACL4KU3P8mT89/wdDkMAkjcNUn?=
 =?us-ascii?Q?aVeqLjUKRBuokC+RcqFeNfAa6aj/C6rpV7zYmNLFrhHtaVk+U3nmQK2tX5gp?=
 =?us-ascii?Q?Rjb1Ao1YefOrUc9Qx3P7cX17dRdKsavcdlay979ZeZAY2R3hT6fnKS1YYkSD?=
 =?us-ascii?Q?y5eGyvOr05irtJQ9IoHR/5oKwa71GtiFZxCfFAvgRfHRQvFEo6p1SbPFq9e2?=
 =?us-ascii?Q?7VpuyIkGffKNBZ81XFKkqBqxsayCAloadkCBhp1WZ576RJQ1d/zl6jByTJm8?=
 =?us-ascii?Q?pEA4jg8/GVXc+11LdXhPDIznFc/k6jeQu3xRSMKtRmPz9mXZbjR08Jh/6Nj/?=
 =?us-ascii?Q?DAqk9GrrQojZJWhTglGPCezEYbZBAsx7uRabWAt5OSRZPC5aHlRsdi4Ae0N4?=
 =?us-ascii?Q?kVPWo9epXDJV2cENO3qxMuOE7yrMQpVisrdIfovG7SYk3v2ghhEXN3zz0iV8?=
 =?us-ascii?Q?Ia5Vw1en29M+RSNWbocKXT5SyrBAFpEC221BotFUJZy88FqqSLxDwOF1EGfv?=
 =?us-ascii?Q?rHavFN7/Sn3e3it6sBF8OsmmOID5vOJ3CYpkDxHxtAcrPSax3Omv/r3Z5aJ6?=
 =?us-ascii?Q?R9GbwIetYVcMdcbwOpw1BdPo+HYLoof6PFOzbD+McgNSXf0fyLjy8eRTM8GY?=
 =?us-ascii?Q?LMz/7/GTFce4EEsw98aRqL7ZBzHBopza685tsg2UcNmpPrxKWAiSSLxf9QnR?=
 =?us-ascii?Q?WnEGaGITHBXJxR7RP/6AhUYpWquJjz1WJYTBD45ZQxSLjVMmTnb/6PNlq0Xg?=
 =?us-ascii?Q?Rb4FoxJwIeyRB/QLgxk1MhoMaJ8+d8BFPV/g39DRiufjMpDV0jyhSk5AynUB?=
 =?us-ascii?Q?cMm8URAgVYcRoG6iMNMJo2VXGW+HBP4FcsVRPxJQfBeTDBUIcn93CmGFJIC9?=
 =?us-ascii?Q?dudFv32mm8dzDNMWHnIcc4WZkjK+0Paq4Jqcoj4YoyQrmssqBkENvxLmGq66?=
 =?us-ascii?Q?+bmMxPERd14a4prX1fb69KbjY3Ny22Kjx6dUj67OBlvFChaEEzsVIad29nzj?=
 =?us-ascii?Q?B06SJfIyq4beS9oaZDiPr+gLUNSzJXORfSJpzfxbI5TxwJPl9qlZH6Whgdxc?=
 =?us-ascii?Q?IyKSljgTGVPIIQtorZ+lhn28OpknC6EBTOuxoSBpdb0UGIiMSLaMFzPjVtoN?=
 =?us-ascii?Q?BkNq7V2vLW/6Sgj1MaWqYQi4vAsU8MkT7zhkSPlmT+lUkkowE8MzIGQ58uXp?=
 =?us-ascii?Q?WnTEFVNm9dmqgvie71PM87mPPQkcBcvnD9QH8dkVfoIp7l95NNgeJcKb27Hx?=
 =?us-ascii?Q?e38105s9hTxj6QwUVVfjNPKRrfBA3VOy4/FLZv5CWWEsPCo4dPzVoqRki4uA?=
 =?us-ascii?Q?tunbid2wrhyZJvisVDIZXa73n26NGXo2HZf/WXYa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee008747-b306-46be-4d41-08de0a8df73e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:23:18.9438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sawecIOlSpiGoI08fAbFct+oo5UIvRJeHzde9r2oW/mzRim1GDqXS08fftEcqVHlypfPgk6G2gZB7ZVKBCFwKw==
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

On Sat, Oct 11, 2025 at 06:51:50PM +0200, Marek Vasut wrote:
> The DT binding for this bridge describe register offsets for the LDB,
> parse the register offsets from DT instead of hard-coding them in the
> driver. No functional change.
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
>  drivers/gpu/drm/bridge/fsl-ldb.c | 42 ++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 5c3cf37200bce..c54caea0b63fc 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -61,24 +61,16 @@ enum fsl_ldb_devtype {
>  };
>
>  struct fsl_ldb_devdata {
> -	u32 ldb_ctrl;
> -	u32 lvds_ctrl;
>  	bool lvds_en_bit;
>  	bool single_ctrl_reg;
>  };
>
>  static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>  	[IMX6SX_LDB] = {
> -		.ldb_ctrl = 0x18,
>  		.single_ctrl_reg = true,
>  	},
> -	[IMX8MP_LDB] = {
> -		.ldb_ctrl = 0x5c,
> -		.lvds_ctrl = 0x128,
> -	},
> +	[IMX8MP_LDB] = { },
>  	[IMX93_LDB] = {
> -		.ldb_ctrl = 0x20,
> -		.lvds_ctrl = 0x24,
>  		.lvds_en_bit = true,
>  	},
>  };
> @@ -90,6 +82,8 @@ struct fsl_ldb {
>  	struct clk *clk;
>  	struct regmap *regmap;
>  	const struct fsl_ldb_devdata *devdata;
> +	u32 ldb_ctrl;
> +	u32 lvds_ctrl;
>  	bool ch0_enabled;
>  	bool ch1_enabled;
>  };
> @@ -204,7 +198,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  		reg |=	(fsl_ldb->ch0_enabled ? LDB_CTRL_DI0_VSYNC_POLARITY : 0) |
>  			(fsl_ldb->ch1_enabled ? LDB_CTRL_DI1_VSYNC_POLARITY : 0);
>
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, reg);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, reg);
>
>  	if (fsl_ldb->devdata->single_ctrl_reg)
>  		return;
> @@ -212,7 +206,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  	/* Program LVDS_CTRL */
>  	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
>  	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
>
>  	/* Wait for VBG to stabilize. */
>  	usleep_range(15, 20);
> @@ -220,7 +214,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  	reg |=	(fsl_ldb->ch0_enabled ? LVDS_CTRL_CH0_EN : 0) |
>  		(fsl_ldb->ch1_enabled ? LVDS_CTRL_CH1_EN : 0);
>
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
>  }
>
>  static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
> @@ -231,12 +225,12 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
>  	/* Stop channel(s). */
>  	if (fsl_ldb->devdata->lvds_en_bit)
>  		/* Set LVDS_CTRL_LVDS_EN bit to disable. */
> -		regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl,
> +		regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl,
>  			     LVDS_CTRL_LVDS_EN);
>  	else
>  		if (!fsl_ldb->devdata->single_ctrl_reg)
> -			regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, 0);
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, 0);
> +			regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, 0);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, 0);
>
>  	clk_disable_unprepare(fsl_ldb->clk);
>  }
> @@ -296,7 +290,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	struct device_node *remote1, *remote2;
>  	struct drm_panel *panel;
>  	struct fsl_ldb *fsl_ldb;
> -	int dual_link;
> +	int dual_link, idx, ret;
>
>  	fsl_ldb = devm_drm_bridge_alloc(dev, struct fsl_ldb, bridge, &funcs);
>  	if (IS_ERR(fsl_ldb))
> @@ -309,6 +303,22 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	fsl_ldb->dev = &pdev->dev;
>  	fsl_ldb->bridge.of_node = dev->of_node;
>
> +	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
> +	if (idx < 0)
> +		return idx;

Does this broken compatiblity? If yes, need mention at commit message

Frank

> +
> +	ret = of_property_read_u32_index(dev->of_node, "reg", 2 * idx, &fsl_ldb->ldb_ctrl);
> +	if (ret)
> +		return ret;
> +
> +	idx = of_property_match_string(dev->of_node, "reg-names", "lvds");
> +	if (idx < 0)
> +		return idx;
> +
> +	ret = of_property_read_u32_index(dev->of_node, "reg", 2 * idx, &fsl_ldb->lvds_ctrl);
> +	if (ret)
> +		return ret;
> +
>  	fsl_ldb->clk = devm_clk_get(dev, "ldb");
>  	if (IS_ERR(fsl_ldb->clk))
>  		return PTR_ERR(fsl_ldb->clk);
> --
> 2.51.0
>
