Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CC1928DAB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 21:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1634D10E0C5;
	Fri,  5 Jul 2024 19:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FtITjWyR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5394610E0C5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 19:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTOAEJkG6rKCg85q6fuON+AwtsQohLYMARS6T5SdBPTGAJU6EfCZqfwAV0luvD+FByL09XdW3wlExbLXuRg62CFu1YpDGcEycxH5QBG6j2OEn3p4/nhamW+EsjYcztOqChLDZCgaHVqEMhEQqJ5gHBc21+Fl5RosxX5gP90jwriePXwyKqk4fOXgWYqtCl5cPXmHIf4nT6jxHPHiRiSyCgUv4kmCF/id3EnC1mHVVQBtj+r+jDOg5ih8nWu54+KznqEab3s7Ug4tsotmpJVB5Uer2KCCpnDPqcdfDyGkJM+dK2QRG4uVYnEmsnjXTyYnVdCKcRjOdRVev9KPJwT8iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28+Bc6e9m+m4Z6Uc7qq4x3fGM+WZvj4LfQghw7fys8E=;
 b=aPJnhSj8ke2KfZ6R846NRXVJbTpPXnjn3ZCUlMzDh+WcJ2S/TdfVCySB3G2JcYtRDxaO8F4IhQ9BrgKX2QVIz5Sk2D+fHCtKjZjsnKoyXPtIrMLDzGCfD2MlH6l3gBZPOijGKubyJ0h50Mxc9imaCstSxsAEZ8Y0ww3FSjcK717WrZfPSHAKv7/jP4BWPiK1bASa7dqF+mLOttsRFXrgxLf0tYY7e7zg+fsLvKgABWf2xQqOpkHaee6rEn7HObkPRHVRzvSn9xWggh6pKlayccJV+79d9rf5+TzQeZiMVl7yszGP1oU8zEUOg6ewrePF6G1Cpr8QOFZpehBS4RHgvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28+Bc6e9m+m4Z6Uc7qq4x3fGM+WZvj4LfQghw7fys8E=;
 b=FtITjWyRHDXlN9uRlkIC7zfXKGe2RpSt6pPVxZ0b1RlIUgCP7p2/6TYLnrEAQ3NMdrgM2gv8+P/Bma28ri87hTW9Dmiz6ulnz6BEjLHkPkXMolalhA6KtlvCTSVQvDscFM7onrsN9M5C7N/YDaN5ZGRPKGjR6QB7JjV5hBuo6i8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10023.eurprd04.prod.outlook.com (2603:10a6:150:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Fri, 5 Jul
 2024 19:02:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 19:02:42 +0000
Date: Fri, 5 Jul 2024 15:02:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de
Subject: Re: [PATCH 10/10] MAINTAINERS: Add maintainer for i.MX8qxp Display
 Controller
Message-ID: <ZohDSDPZ+mS63TQv@lizhi-Precision-Tower-5810>
References: <20240705090932.1880496-1-victor.liu@nxp.com>
 <20240705090932.1880496-11-victor.liu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705090932.1880496-11-victor.liu@nxp.com>
X-ClientProxiedBy: BY3PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:a03:255::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10023:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c6f81d-86ad-4dc8-05d5-08dc9d250c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s6Nosk5uGcA8DOAufv3qG/fBg+hrszAt+gqITMruoLcWinYz1aeve6Cm8umT?=
 =?us-ascii?Q?RUR8AXSIUGB1/KoGE6WgQDkJ6kQ4Bq6YJy009EOKi+TwQZVcLurAcEq2S3Wf?=
 =?us-ascii?Q?Ay3FXvBWZyljp+ratP5AoFf+GpVooASyrNU57mPpkjWaku2L0TNegknAXvoZ?=
 =?us-ascii?Q?wrGBKDjibgR+IPhvSO3y2cCcssUc9UbYHM/cNUgcrk+bKkwm//2OS3Qi/6O6?=
 =?us-ascii?Q?IbAvDOxi5bb+oiM1VleZh4MY0zGCgJfcqfl4LBScL5nYUxU7dFava6Yukuvj?=
 =?us-ascii?Q?K+HE3Jcp4zTR6iwNMdL0nZ31XUoVOOlxA8hpvw3QrOZYatjkchQxw6Ez94L+?=
 =?us-ascii?Q?kLkZc4xGWuaYsXNyHUp8VwVRyBxiZD/U3VOZ6Zt+uYGSiaRQuf+j5k7QxUeg?=
 =?us-ascii?Q?l2nnjXHjrjHwGXLlqtQVbR95Zc5v+R2gKWVEItzhNx9yjP7CIotfN2O6BlxL?=
 =?us-ascii?Q?y+jJP2FJzbhi30mvsPkTGTRvoYHk0WpmGx+BQBy2WAPLL4tfIyXMOPnFOei9?=
 =?us-ascii?Q?PTLtP7+4qjWCh0Edv4ZOgJhLCV3VFFaxBQuw8DcBf1ZgkGXhvMEciQhFdTAO?=
 =?us-ascii?Q?CdSPeXD8W5mmL3prVOMOBrktEjQwqApOCXnpj5Q7YRrKl6MB57W+mzprWdpP?=
 =?us-ascii?Q?PZu8vEZA/I7ZCVRjntVgZyNGv9yEDr1GL15kcq4cGS2ydKW2tEYXcVyGaujE?=
 =?us-ascii?Q?hWOmQxqM4AY5eGda8Pl8xxA0eV5Vj8LgseS0UtzmkihNlVwR2oOPRP7x5xwC?=
 =?us-ascii?Q?3T4EuhkrN5jhX4Iu72F1k3joh1naVQ6p69sLMy+XAHKer/t4Ib6PrhAZs53c?=
 =?us-ascii?Q?ewMfUeG3j6e2AIWl+tGOPvD0rv5xp5T40EReK3An5eLM4HYvNFoVNt6pPbNP?=
 =?us-ascii?Q?bLbsJjfXmvid9GD6MSYhEOlH09UBzA19qxykRClwHGq5WZrX+MMmXMbRHqMg?=
 =?us-ascii?Q?cBIB+NUNGFCifsAMTxHeR55gc1tG/OfyuhTKWK0fh0g3MUtBZtNM3aC6CJHT?=
 =?us-ascii?Q?2CwJJ6M/BgBcbaKRbSS+DvkewnO43oMcb4rc8OIj/dia2EOL6XYDc2dSl+qG?=
 =?us-ascii?Q?KNB+PeA791gtg/m6yRyRemqA8t0JbPurtckkCr2bhB9xWbNu9iXSnWjtx5ys?=
 =?us-ascii?Q?kJ2efxsFf01EgcMbvDQl+lnbuqAPbTDLyr+zO0q72IxiHwskz7Car7oijNth?=
 =?us-ascii?Q?EBj8PsaFrKQ+v4KLOSLuoN98bAywRdRJfXjQZymZT9YwYdyOoNw/abxaUoUx?=
 =?us-ascii?Q?90bmgE4v+SUY7Bkake2eEgF4TirDNBmck6PvOA5iO9yX9SShLDSPEMXa1mAP?=
 =?us-ascii?Q?LNpnA2/PdMbnyxh5lSjlCzgIi5tVAPfWCzGrQg+mVerNY/VZ+rpuwqUItz0k?=
 =?us-ascii?Q?UpVqVXw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d5TT/1C+j/Kuz06gLlSxIHqHG8MZT8SVQidGhqNBy/K85x1ZRJmjHtSbr9p1?=
 =?us-ascii?Q?e4lArKWYBtKUwzzx7eB9X8naLT/NIIdWMIspakASX9asU3NIfpjFvWCZGC/S?=
 =?us-ascii?Q?0hUO5hSKcJE5y5rtV0hpjAgI+LfZ5SFLj6ydjglDghdCTMUTx3SLP0nhfaRz?=
 =?us-ascii?Q?+wPJxLhe1/CYOcJ8mLoTfuHIiOwXUYWQmcdx5s2mVCHLPcXVi9usyWnTcTFC?=
 =?us-ascii?Q?qY1sQp6G5dzAr3OqV92VcvIHyLrLvlHueTsumFeMAuqxNyUEmcidWiEw0CKL?=
 =?us-ascii?Q?lFNcybu1mahZ1sFIBKbO8mMQQFTxCNjrGiZhxFQ4gZkeWmye9OvsjmpfxoqY?=
 =?us-ascii?Q?Y/MRZrC208YV0U+dP52DFzwN93qnMznuFBXykdByoOnb6yMgHE3sm/ovhGLf?=
 =?us-ascii?Q?kjK6Z+HeITmknKcutgeBBq76ZSREbAM+iKRpsoRUnhHYt9M2NpYHIusXCdI3?=
 =?us-ascii?Q?bFhf8tnCfhi5MNt56pTCcOI/ipqvVw9Z8Z/6ck/zNiCcfuUaZaSzHvcdwOQn?=
 =?us-ascii?Q?pJPZzGX0lTKV2prndvOqDUbxpH36ZQMAlOR8y+NbfwtNGcUz0PniLDw5g7/+?=
 =?us-ascii?Q?e9dVthJ3XC9fU/Uz8+9HwJWlruoqkYr83RxdYk5RsnRaWeahGJtUUeAYZp/t?=
 =?us-ascii?Q?j4BtqQusVoxjTnQRbvxzw/HOreWh3bWWjqegjoQJgcXrnkQl+zTlw2Q4aquZ?=
 =?us-ascii?Q?bwH6OImJT32zkL91Jx3F5bDjIw4kotu4foguY45R+o4EkSfc3+l7ZdhbCfam?=
 =?us-ascii?Q?wPun1CJFKIMQarxyw5KznniGhkd+GjLgN8SDBrAa8cHFoutH0iRhCz7NkJIn?=
 =?us-ascii?Q?KWu1R/2CNVnfvmtfxS0BBSCInH5abu7prf4Uwk+rVbmxJf9SxK1yHLIgdtel?=
 =?us-ascii?Q?lNGdZ2d8l+wjPvmy3HNB7WinbvvQP8RhaPaVNMVqIbpA+xuILRGToF+1BqzY?=
 =?us-ascii?Q?mNyEFxTCWgd/Kw1xKG1hQh1OPjEEMamZdzc7wHjnqSkO5SBx/u1ahS3qnXAM?=
 =?us-ascii?Q?bpm8J8X0j+yKgXYXOIAY/PBtG6jLaEpH5lWBMRtTFtRRq2IAy4I+ujGEv5xZ?=
 =?us-ascii?Q?e3oMabKEk8wuC3ohYhP/fK6wkRrGDb4t3lbgz7gU5CSBjWG2gOrVpKqyy+cS?=
 =?us-ascii?Q?yChtp1oGeCpcRohnV7Lm8RuorVzKc9BmfQCSfpIlXKtU7HpTTQYkR3RQg4Aw?=
 =?us-ascii?Q?G86+BVRm1TddK5MijLxvFx9NChsxljW/i3x8aeyrOrLrq6t25yNMxaFYm9/t?=
 =?us-ascii?Q?RW04zVdE9SL20kvPQ+UzZ5tzJTuu2biSH/a96Wvjw1GdjBVZ1DuhTy2d+LOO?=
 =?us-ascii?Q?RNH8TIClw1GnBbX65N+BU6LP2q4MfOqoG08XAtkqG5yqjGADEVHWKuZnMyCx?=
 =?us-ascii?Q?xNmKXGjplQQyc84sD12aiA19OL5XqLixM1sRbda0WXMLdCYC5IDLuV4xw1VR?=
 =?us-ascii?Q?1fcwLaWu1961GZYlGCWg1ySLh6KSXRLteSQVPgXatDmzKRpjUn/l3qyWpPMc?=
 =?us-ascii?Q?iAHnO8jnCowXoi9osDNbtnZh4ZOZhX+khC7JOIrYMyd7fW7+CZiaaMYurC+Q?=
 =?us-ascii?Q?3ODaYjD0FBoxCPwNJhNPr7u5GGtD1UmMcLVyGeu/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c6f81d-86ad-4dc8-05d5-08dc9d250c5f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 19:02:42.7940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81s4LZSb5Ki8NaELUQsaxuHdqfbzvaLoynVZZg3amqkVM+HhYKyehbh/+SvlyV8S4IfWDGgIzUqkFIcOASI2+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10023
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

On Fri, Jul 05, 2024 at 05:09:32PM +0800, Liu Ying wrote:
> Add myself as the maintainer of i.MX8qxp Display Controller.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  MAINTAINERS | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 35db18d26c11..29c9d52e74d1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7379,6 +7379,25 @@ F:	Documentation/devicetree/bindings/display/imx/
>  F:	drivers/gpu/drm/imx/ipuv3/
>  F:	drivers/gpu/ipu-v3/
>  
> +DRM DRIVERS FOR FREESCALE IMX8 DISPLAY CONTROLLER
> +M:	Liu Ying <victor.liu@nxp.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit-common.yaml
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchwarp.yaml
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-intc.yaml
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml

How about 
	 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc*.yaml

Frank

> +F:	drivers/gpu/drm/imx/dc/
> +
>  DRM DRIVERS FOR FREESCALE IMX BRIDGE
>  M:	Liu Ying <victor.liu@nxp.com>
>  L:	dri-devel@lists.freedesktop.org
> -- 
> 2.34.1
> 
