Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67853A486B5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 18:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F4110E0CE;
	Thu, 27 Feb 2025 17:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="m64EtrUp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013065.outbound.protection.outlook.com [52.101.67.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402F689F1B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 17:34:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xg6BIw/vbgK2blc0oYkUmezb55O36dWzXm/BIKsjU46DUFI35AdUuq71+JywnSWNAR/JNfBqmMybC0Ez23LhA+jNDwvD4Wx66s4pynTyh5TnTJPNeyQycvuO3i3CQaLqc558klmiVMI1GMQ+DWh27UhG96VSjY+LEVcmKk0iqf+lx+08f1auA1XiPqV+M01h4mwVfjV3PhdbSeKUToLoYJgOSyh7keEuDFdOu02Nfd4vkZXW1J4vTpU1urwlp817hDbqn5vK5AG4Yc+nvNhlCusgKtfNfTKA4isBdFqnLnY1ihVIofcwo7cn96A0o/+78R6pg/lklSYd66C16ENn/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGGHMLT+kMrB3eaXraL7WRsaPPkhg8lpIloo226Mh1E=;
 b=QsY9q4jEdrZ//NepJSW7lCOr8ps19/j6fpBTaySojAGYlHYWiG5B8HM/aJbJrWQdf91JbTbrLhMgO2vUDf1JvGsb8VjpWEWWr+gwvo9KIrWzOqEUgWKP01w85FYcX9ediqjZpzvh9lGri7G80IxHJqGvV+GkVvuY/pp8QColNaXyWIgU3knIbuMnhWHjbO8TuE6Dq1+WBFpPLIGXx7JOcOiJH+wK/fYVVZKcY/31M6qQh7VhGjcltQq+fTFEjAc97yHANF14Ts4UITakCGSTtcMnaZ4Vi0DKa3HAESjnUD6KqnVV6bUcfWfaFt3Q2+owhLCCkM4Zls1UzcAqE8If6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGGHMLT+kMrB3eaXraL7WRsaPPkhg8lpIloo226Mh1E=;
 b=m64EtrUp/s5BrpnUudNB3iNTP2fhLI+uYBXSkmIpRH1E/sEfMltG5qAJuT37oy/NfTBkuKDb9TkvIOgV7yotFVyjj8mZYeC5SoOA/RxVOiB6o/wBOA43kVeV5eLwXL1AzWzcfiLbCzk/iGh2J8ANGdXsxA9bVkSnKjbZvFC0ZqK/sOAm5YgXPX8eDk22s3tqY53Z3PYCcZbg6Nnd7D7GePnGwJcSffgrJb2GfS+tAjolUNuLy8LJfnEV0pT3U/n/tiSxep4sWp2dPpKyOklDROAePZHCxpjp3qEiRvTnVoAVenhFf84HbEcJFssH/BDBMdUbJmywQimRFom2+4Deaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB8026.eurprd04.prod.outlook.com (2603:10a6:10:1ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.20; Thu, 27 Feb
 2025 17:34:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 17:34:29 +0000
Date: Thu, 27 Feb 2025 12:34:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH 7/9] dt-bindings: gpu: mali-valhall-csf: Document i.MX95
 support
Message-ID: <Z8CiG14qNed9cHyP@lizhi-Precision-Tower-5810>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-8-marex@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227170012.124768-8-marex@denx.de>
X-ClientProxiedBy: BYAPR06CA0069.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::46) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a7a7ac-6a44-40e5-d947-08dd5754fce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|1800799024|376014|7416014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wIUoGAS5gw/2Z2eJjhCjmTksPk53UIrk7CmEyS6k3RHyasDgx8ACVfUI8Rlc?=
 =?us-ascii?Q?juZQoclG/NVl0KtO7m1T9589Icp1SqBQfD026Yvxig2fJd5TiVaE6ksjEPGQ?=
 =?us-ascii?Q?PQam2JKVP2VVvnbgZpwnmisxFiiOLJr5KJjfS7moxDRp90ZTEfzUr9bNUgu9?=
 =?us-ascii?Q?69ORZ1zGqg+l/NmyXGKVwu8nCVkEYgFff+xQgKEh3Nnruf0fSjWr7d/1M3hj?=
 =?us-ascii?Q?ldKspvbxGiDanXNys3xfZMw8SSRNCsUdY8uYeKSB91hAlW4syaraUsJqqYhR?=
 =?us-ascii?Q?/HqZI/ae40iNJ4xXHakFVTDBs4+02YeQCuRrpQDOAFaj4AhcEUwLu2W39sCU?=
 =?us-ascii?Q?GOASvTrXwW9skcVvrK+RVdqbOUjYdFxhr2dEXNqH34vb4abjT3kiLmbtGuZY?=
 =?us-ascii?Q?E2uNkv9oGOzvw9Hll9xcThxTD9rgDl5bZ9aGzmoP/iWdSIMx5CG4IcBpRIex?=
 =?us-ascii?Q?LIPb/3w4QfPc2uDPn89YLn5jLLzq060U9VDP+c+fq6GHWyRqze57CA8PFlde?=
 =?us-ascii?Q?GcQJz7oRO1Xe9Ywm3vRp7j4Q4Cz1l6Nk36s5M8bbLStkhefAIUprHHIntScl?=
 =?us-ascii?Q?7yA76/NsmaMwgVPJ/YhkqzEVBp049dcDECPZClnN9wUvB5e/NAEVm1C/3ybq?=
 =?us-ascii?Q?84i7EB97Qu8uiJ2Eg5OEasj9nfhqZYzxP7q2d8wtzChkmgmQnSB84wCsberD?=
 =?us-ascii?Q?oTVDk/KwaAqMvE0tsf01J5uRQK3Cpx9LQ3y2iogajgsc9SRNMRI2hmWfPK1u?=
 =?us-ascii?Q?Gp0p6b5FaK01iQZqItJ9FiRdmjyE+yzGtkC3SnM9aA2TFhAeMj/gFjeaAEnH?=
 =?us-ascii?Q?rH8L0zB8/r5rtVXTZu6pPhzqn944oQ1nWRvLfmWp2qyDLYUnwnBhiAbsPKS/?=
 =?us-ascii?Q?V1FfWEDEHMhRbxbmqddrtZX7WycMBMqHlyJAmm0xRP1mtoUZ5zyahsI5KDs3?=
 =?us-ascii?Q?eGEmmmR6z6bN3l+H2i3F7NQe2iFN0byYO2EQwJQThC9PCJEHPXWWOG4AIKo6?=
 =?us-ascii?Q?5gqJqq2OOVs4IhXtktnYcMq5DK+pLeQ46CtIc5idfEUhi6gvNOGW1/1yTRbw?=
 =?us-ascii?Q?yCdHlSr0l6wI852bYrqsxhG4RAdJWz6ASyS34RlKZ+XHctR6P8g/HtJKU1ZK?=
 =?us-ascii?Q?2kHLEDi/uCHVUQN6sXXZQogWpChaVIjon2D8enDhr3pHcLoA2jASgrHUx7ja?=
 =?us-ascii?Q?NDbIYmCmeypjZoWkXF2rYx/brJzCtW1ulKMsjT2IKwWcUc+TEQqtr7xw3qsf?=
 =?us-ascii?Q?NwgRnT+710LnYvx3G26Ih9wvh1FPFNYhDW3pvIBooNFETY+Lw/fLmtP+4xSK?=
 =?us-ascii?Q?qu+Th/QxbiJMQoxX+2vx2kg6OEB3pgo6zz1DLoPA7UPKy4hgr8aTBU3nKMG6?=
 =?us-ascii?Q?j+m3kAqQTrT7V7EYq7aRcxktuDaBaOFsON9yna7SkRpUXyMpAsTlDd2Evgrw?=
 =?us-ascii?Q?SdHT/gS+Phf4rWm6tcnca0GLGmFCTHcd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ynOxhDyh2Rv8g6T4CZUwxrVij2ScJL6TobADA+9ipxlGKwVfFt+U6kNe9/a1?=
 =?us-ascii?Q?OW0tRUWuPX0AtTSOyNj29CuE6SkQPIGaNi5Vipju9j2wOAFbUb+LtTdCN0rJ?=
 =?us-ascii?Q?gIfyb0E+fbKveoaeK5ZVmptsWVxF1Q2BA3uOjZ3iTkhV/Xw7jBuR/OH9u5/v?=
 =?us-ascii?Q?UwXVtHvnaG56cHyZ4TPUifuRIK5VFL41R0Ssqsw7bTMlP7OpuLbfhzUgy21z?=
 =?us-ascii?Q?iLIVNjL4e8w4S+NUZHYPNSupuBMI4f3h52wR94Kyrp1d6/x0GXlZkSFkWOKo?=
 =?us-ascii?Q?1Z2sfelPu18+ChbHwNYTbRr+82X6IQIN3OVggV0SBzmkD74S5gY4k4L+oMYk?=
 =?us-ascii?Q?0Hx5jXLsE6m9AIsugTTKXiTKdPUkaPaBtKnsE8/Slx2sqPj45fBIgOuFNWBZ?=
 =?us-ascii?Q?FIcPXu+quv9W0l9MfYixVt6gpqrWEUixxoSNv4A2kA0aBVyh9vVZk9/WGkou?=
 =?us-ascii?Q?dM/gdLcefDHt54LSOHNsQqOBtLn4vK008LnxPqbS9f1DqXx4DF0gnuZh/uz9?=
 =?us-ascii?Q?BilxFiLXraCklAtZUI9aQmFG4ZPhn2bp8gYV9DeuvPM90gyf/XEBFY/6FGf3?=
 =?us-ascii?Q?a3EPf47d5BZ5204RhKJ17RsHJKvP0qNfGWnVRFP+U0d4MT7w9O7FA89u6Gz0?=
 =?us-ascii?Q?IKUkvlZ51NKHgTIUJzjxzZiEBcrTGjj1VJkpJhxw5eLhPf8u2FKezhN7GsYc?=
 =?us-ascii?Q?Icq+hs4D/pnEpbH82XAdWjVqSLwXHBmmVGtgW8t/hP/ibufwJsLjy7dCebox?=
 =?us-ascii?Q?xsiY2YIQ1hlI0UBynpN/GxVCO6ynnZ6VyM34zsnAzstIyCIJv3Wuaa1fLgjE?=
 =?us-ascii?Q?2FKaS2GplPUFJGwEAWTVhp2YacQuYcR/opVjH8XmALogKs5poSyLOMqwqHhX?=
 =?us-ascii?Q?0FM4wVZZl45GZMa3bFGGYsxrgc6yxOt0QobHWgo8kQt6cM+5bM01pb3j/KSR?=
 =?us-ascii?Q?XS4vcaMkB49v5irOXonErNn17888ACCZN9yLTHPMHOwQYe9Y5ulA5YVRrfsU?=
 =?us-ascii?Q?r77vnY75nI221KlEWdATpvpqNjTO6+EHrbl7kXB2xE/fD3+vUZ1FcO1Zmnt2?=
 =?us-ascii?Q?r6qX3sDnkhCS4XPnRaVyEU2TBzv6A7YKYmWA470ARfPMPMV3cdOV7vkvjyf9?=
 =?us-ascii?Q?otzJFcBijnvl75iW7lNXLaJn5PmCDunKebF06QJHRwR4isfcBM78VCdTo0K9?=
 =?us-ascii?Q?9cuYj0GY3HR5UGjoI5Qv2asg0tNxcd5tDTLgYq+EnKO1mINHelE58sLxx+Wz?=
 =?us-ascii?Q?M9WKNnCZKmGlGQGD8kjNgW7ilNDCkGNaJ6InvBIdJPNKXZ2XTwDxShylPqW5?=
 =?us-ascii?Q?jACZ9GEK0KAJJIfh/3mcYFYuH4KoWbnm4R4IYPP9EVknXsY45ntQcmOaNFEL?=
 =?us-ascii?Q?W8tZ/3/u8rm4II97RDO5n4z1G22oqjOE6Fo5ERdcY2ST9j5Ufgplcf7302uL?=
 =?us-ascii?Q?rpsW3c3mJ3XGwnzlcOuv7v8a9XKyOtbjhIpRufVq8cgCBxNsBhr9OfAYW3MI?=
 =?us-ascii?Q?ORcAc6V44fJLbQj4d4WZmpnutZlZnrhSR0Nauk6QL4vQ7d1s0y1rRk5o5beK?=
 =?us-ascii?Q?2mmJeqz3nPY1CMP/e4w01s89HiIZarQ/voQ2M6ZD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a7a7ac-6a44-40e5-d947-08dd5754fce4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 17:34:29.0646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0Uva+Fc45pRcYZh/XTMhyd3/x2wGAmb7q8oRVeg8vnXMVvHoZOuSZ/9DfD+AICPb/n+7BtcIR4HDHajtM3GAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8026
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

On Thu, Feb 27, 2025 at 05:58:07PM +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 is the
> Mali G310, document support for this variant.
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index 0efa06822a543..3ab62bd424e41 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -18,6 +18,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - fsl,imx95-mali            # G310
>                - rockchip,rk3588-mali
>            - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
>
> --
> 2.47.2
>
