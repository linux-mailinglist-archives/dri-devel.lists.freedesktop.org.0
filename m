Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2813B8A316
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAF5891A3;
	Fri, 19 Sep 2025 15:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VGyg1sxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010000.outbound.protection.outlook.com [52.101.69.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD99910EA1D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 15:09:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNcjsCTrPDZ4hHKqJ9KqLfbAjpZMQO5EYoEbPG9eWm26r7tEYu/B/70HopGhuhYfbhvPR4Wz0fTR0Yz9/6liEmvebSGPkDn2VZL0DKkUWfrLkbinUO7J+ornoMpUkVQH7O7/11h0Exl0BLnCq7R9xLnYdJY6T8XpgT/BTCBemEY75uYtdwc1YQ8I/fokIKWab98JHZlfkxOW4JGwxbskoyoK4qaFJ9xZipS9JQnrOj8xEm38pWs+bvTYpGxVNMQYFu6xKrVQhQ0eAsqq4TUiLIf3E/gcVFzVOQ2weOu5DALK0muhYPDX3dBJzYuAeDRTkaUBhJMHukkwIFqM0vvH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mrvkob/3LbS94iM+txUZHGigcAQHcjG+R94YBmURPFY=;
 b=sAt92a6GgNHnzew4jabnSove7VZfgTIvcEDB/Q+rqtlROP/p9SU2WUPSMoJUDm9HMRP9zXxP+DD7iQ8/dGeUH5Y2hjYB/sWzcUyndLJMXjmuJSWqzzeYgjgFZwDxYMAaYyljcaMB1/Xx5tHA/9rRmMxhfnyzx8a+Xr7TISpyezozxzm2xcqZpttYKgZMRoGfxMH/hD+kq+1cSaKzwdU/m2EvHHE4LRQPtrDjN52WzgEizZh+dHjCfwK28i/BAdZacdWX4KaA3k/H1iTPQQC9Y/+2EmkmM0hQh4WiUIoG+JeTpCkwkt1VPKxQ0MdHDvNS061nKXX8d596EksC8/wpJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mrvkob/3LbS94iM+txUZHGigcAQHcjG+R94YBmURPFY=;
 b=VGyg1sxzwj/8CAaJpmdy2i7hOueHqoeDlhDQqgcqoeKgZzfh5UWksqYXYO6oa7lqKaWr0EIVH26R/Ldpc4r7srpdKEdjyOt7Q8EoJTOD66/j3HnuLVtLUhuEgFSYXQNCEu4QmPmVA+aUtRGVqXL8ufvlXIyOx2IVLBb6f8Y3nkB+DhsKteQGH/5TkOv7xDWoX/vZ51Nv1qq7Xstot+zHaYpFjrDbMUXzngpD58u8uJLnvokz+TqhP+5/xi+iIeypiUt82mG/ww/ep7Ar0pGNLs4PPHZ9Fsp7sKRCgLnwR4/DOIVrIr1jlvknkptaAEeeptYBNj/7rSlKZx5Mgi2tgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB10964.eurprd04.prod.outlook.com (2603:10a6:102:490::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 15:09:19 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 15:09:18 +0000
Date: Fri, 19 Sep 2025 11:09:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/14] drm/imx: dc: Add PRG support
Message-ID: <aM1yFIcZ635lD+4w@lizhi-Precision-Tower-5810>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-6-784c03fd645f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-imx8-dc-prefetch-v1-6-784c03fd645f@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::35) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB10964:EE_
X-MS-Office365-Filtering-Correlation-Id: afc29d6f-b6b0-469e-c5ad-08ddf78e8189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|366016|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZLOZc1oLqXkIyImMePYh7QgyBdbvJRPiiORhIce5QVWacHAonJFLOgDiMMOL?=
 =?us-ascii?Q?oFBnVO7/Xf0aON8f6z39P9hLnB8F+pw36OQKHvpgo1MYMY30i2TDXfd2nTVa?=
 =?us-ascii?Q?ty7EBZqIBNbuRgsEgAMkTJN7Dj3lAviXf0O+tkz7tiV47C+kYp7rVEKzS+Sl?=
 =?us-ascii?Q?o7GvP61Tutg4c5Eoo0YSbIMTNtk7CZ2PaYwHnDvYxuUjx0zZO2U8pKZGBTBC?=
 =?us-ascii?Q?xYawaClGR7oFA+ULMObWPTkSO869HAL1N7JXTcz+yGK6b+xDjRgwscgkSjb7?=
 =?us-ascii?Q?plPsTlpCIZqwwZEWWDXveFg4BgJ9eP6FU+CLaFXVJOpJdkS/Zb/4iJBdMXGC?=
 =?us-ascii?Q?/tl9rHuJzxNIfRWgAyTeoVEMJtvVGqntxHNTD7xbuo/xmhh3kWYHkCJmBkbV?=
 =?us-ascii?Q?p6awsbNabIX8h5Ues1/UU8okN/afSLko5CU3qxXd+iR1Pe9NGDpsyhu0BpBi?=
 =?us-ascii?Q?J53+ZJGuZhf2Ogs7Y2i+64gRBIlvF0RgrHzXTvGp0oTwfC/k2Vm2BIv1fA6J?=
 =?us-ascii?Q?S3VGqP0C1CN+saV8OSM7zfjLvtJ9u1bC2UV/2S1TE7eDATdnyQd+8ebse6Ci?=
 =?us-ascii?Q?/fbQwQeIWXZFEk4lhBHjXneYdCKrgoIsn0dVTTg7rXaiUx2Md+5+zz6ioIwR?=
 =?us-ascii?Q?AEy/oVOxCY5c93vLDq6m8eZMLxLCsCvlf9+eFjCuT0CIVhmI3XaMF//skYWA?=
 =?us-ascii?Q?vGlH9Dz33hRPf3BerdoiJl8xB1cLBxAyOAhBnkMtnJC1P1dwG3Vk/+YEYNbD?=
 =?us-ascii?Q?yRBbztxEZbG0LzE/IjB9E+RfI2J19AvRfWvD5bzH5NSGt7s++xZvWnNvz4Wj?=
 =?us-ascii?Q?RIlapa+VwO2ZZmetBupIO8JimY42EI+hfIWQho3wXKlI6BFeglsyyBRdLJp3?=
 =?us-ascii?Q?BZdaTnbdvNHe6CNXM9pGzxiw9zxT4QLTOP3gzOhIE+JW15/6RzHDSc3BC+RQ?=
 =?us-ascii?Q?v8wMIadvA13rt41perG8+IHmYcfn7IsCceY8phhXvMyk1N7dTwPARVxmnHiQ?=
 =?us-ascii?Q?ekMdO3//BYiy49mu+5rlETiPEn86gl7G5G1k5k+6IzUDHW2q8SOkZWrKIP0o?=
 =?us-ascii?Q?HpB+h3WMDLpEmQVskH3qLKzzowcNrWcwaANMiejfoNh9l7UBtwlg+ugWBmS0?=
 =?us-ascii?Q?4gDxQNzC/RGXTGXGJg4iMeRYaG+9sxuKIeLVXaGPgPoaa49Hoqqt3Gc5wX5c?=
 =?us-ascii?Q?x6lunJFzxhuqdJMKIig6sE7UQ8ZNQMuZgD3OjYOTdLKtgGKHejbXpbfcKgQR?=
 =?us-ascii?Q?53kEez7F7KAVgLHEdrbvFVrbZtlUhJOFpraqzo9WEd31keJxnJaN9868tygr?=
 =?us-ascii?Q?MdcuuIexBbSsE4s8eXQt+D1CXxpJDtZ5rMFVA9TbcfEULNMofR6uvrTEm8gZ?=
 =?us-ascii?Q?jKXB/mCYqRveAo7BOdLRr6D4+6h7dx4wvt1mZehdVrtqASWZ6znwRkHfZ4VZ?=
 =?us-ascii?Q?5t6wYAeWsvLZ1HWaV64jt8+MIzin0FT4U0SmHg85hoKN35GnWHcFnQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gKD5Mvjoe1YHM0FXu3dY2c9jwveJTPtbj99n6DnznD3SvjdZrOyY/pB/pdQ/?=
 =?us-ascii?Q?RCwIXY9657IjDyvl/ejijRM9auYY/A2TiV2xggt44qiE/IE0w80JpqzuqTOO?=
 =?us-ascii?Q?Ck8XmQO7LxR/j67LqZNdmTvKZuuUsA25Cf8KOdciAccOW4+qq3bE3G9j5fUW?=
 =?us-ascii?Q?dpMZOWNdJra0AiEYoscoV1N78Q8PCcfzwIFrgcENuOO86aDQlid33yAyGdMj?=
 =?us-ascii?Q?GU7H3HTD3cjfsOeRD1Pd1tdJLwL+UAhuANA9dkxrZzMIaUld3D8C5e614fMu?=
 =?us-ascii?Q?Ed6q9ZFDvqgxOKTimg5U/AaZM3o1zxOn09yhWCFO2L3LaQ7pmhOCLKQHpjZc?=
 =?us-ascii?Q?mfedXEsTQs/0Tf/t2flkJGxkMNY3ip41IKZGx4OOBj52nBpjWG6dxrJSIkBF?=
 =?us-ascii?Q?DXhWJPoOnwMdroQwMbhGraTP18F/Km5Fq4nnq1W4XrK0t5GOQmwH+gE0rCH3?=
 =?us-ascii?Q?/A9ARRK9N+HN2DRimvKtLHBsflheciFwxmH8x3z7MTlQTllp7U+q9B26Z4b/?=
 =?us-ascii?Q?SwJvo1CwaOg3Fb0xLxZthy2k4JZ+z/VlViMIKA7cOKr4taJ7zpQEJksUsHrk?=
 =?us-ascii?Q?KpdWjpntl0UXevYt0hg9+EdE1uj2ybVPnpenkynKngyTKenDh51gdi6FGzQa?=
 =?us-ascii?Q?qEExk41qagg4PJUvW3VcsNcJAjua5aSSOmeFGUXHd9V8zZIIlAFdEAg0Rn29?=
 =?us-ascii?Q?SByj975rHOoIMfMlDOL5MF0c4wu9XnjUYKf15dpdVTBRnuxEZRgm2mzG9KeB?=
 =?us-ascii?Q?5vbTlTEGatMAKjb96qMm/z8bBkVoEYaAwc5k5nlGsGFamQH+PKOQRK+33rzv?=
 =?us-ascii?Q?SbRt4J1ZK4lkw/lpDpXlewlLgYWsojygT7IIg1jLHQTNPPWt6D+OUjlBhqv4?=
 =?us-ascii?Q?+/MXP1/7B0rmx1txuzoUOwntHIhvwndSKfF4kAFfncNTZ0Z9MBtQifT8T49Q?=
 =?us-ascii?Q?OpLbdpRIMyOvQuyxY+c6WflaoYLb6tHDkc1pmXPs1IrTL1oIAhOORpJufubq?=
 =?us-ascii?Q?3fQcLEYJ/jjbUcrnl0vd2tFRxuK66Ol2acFXTEWvLDigwZBrlK0AyZP/g1es?=
 =?us-ascii?Q?tjmfckhZjme+caBrDebKYerKN1ykbhlHwm8VVE0u3y29obV7gJcyXNa29LOl?=
 =?us-ascii?Q?hsUWfpBvV8oReR65iM6S+nMqE19ul9uO2So/JeOgLqwAkzvMbHW68m0aevxj?=
 =?us-ascii?Q?1AI9u0U1snL5okHboK57Xb1kNAiF0OPHQgI8K4KYNakuYVErk9U1GK0VrUjU?=
 =?us-ascii?Q?ZdjjDjAG3Zz3ZfjBcXlNRlwSBXm82lDiBKR1KYrW8cLSpJPyPuz0OSapmbDN?=
 =?us-ascii?Q?E4KKDadgDYicLBRVGwTkfW4TZLWU720d9D4W7n/uqcx12lo6acTt24FGh5wU?=
 =?us-ascii?Q?bt0nuvIVZKppJ/VA1EgxPRgVhYtxDTNrZyjIhy88b2kSfxOFRFayEzwcXJ6X?=
 =?us-ascii?Q?0l8zG8ONYPSX4fXskX7EQNK6UMAUUi7BA8axQGxDg/G/8K1+rKK+qt0613YH?=
 =?us-ascii?Q?wUOtB+b6AS7TObFvQCnogarbsvNUon0akroZT3nt/VkX18oG8tnBWKdeVua0?=
 =?us-ascii?Q?Xbj1Tsy2nZ5zObj6gnkO8ACm32z7L+sjaRaO8Ibg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc29d6f-b6b0-469e-c5ad-08ddf78e8189
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 15:09:18.8687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQ6LtTZgs7mb/Kmmb3NO0qwIbEFx61ohKpDnsF6yj2wy60w7xJowljauWTI3NAzw/zD4HbJjHi0M1EHXyMLqpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10964
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

On Fri, Jul 04, 2025 at 05:03:53PM +0800, Liu Ying wrote:
> Display Prefetch Resolve Gasket(PRG) is a part of a FetchUnit's
> prefetch engine.  It sits between a Display Prefetch Resolve
> Channel(DPRC) and a FetchUnit.  Add a platform driver to support
> the PRG.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/imx/dc/Makefile |   2 +-
>  drivers/gpu/drm/imx/dc/dc-drv.c |   1 +
>  drivers/gpu/drm/imx/dc/dc-drv.h |   1 +
>  drivers/gpu/drm/imx/dc/dc-prg.c | 323 ++++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-prg.h |  35 +++++
>  5 files changed, 361 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
> index b9d33c074984a7ee5a6f0876d09bfeee5096264c..e3a06ee3ce1a5117d0a9a00fdf7655ee31be3caf 100644
> --- a/drivers/gpu/drm/imx/dc/Makefile
> +++ b/drivers/gpu/drm/imx/dc/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>
>  imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o \
> -		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o \
> +		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o dc-prg.o  \
>  		    dc-plane.o dc-tc.o
>
>  obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
> index f93766b6bfbfae8510db05278d104820ca0719c4..9bdcfc5aee976ef77bea6b3f6f3ac5f11249798f 100644
> --- a/drivers/gpu/drm/imx/dc/dc-drv.c
> +++ b/drivers/gpu/drm/imx/dc/dc-drv.c
> @@ -276,6 +276,7 @@ static struct platform_driver * const dc_drivers[] = {
>  	&dc_ic_driver,
>  	&dc_lb_driver,
>  	&dc_pe_driver,
> +	&dc_prg_driver,
>  	&dc_tc_driver,
>  	&dc_driver,
>  };
> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
> index 68e99ba7cedbca1b8bdc0d8ced7a610a1056bfc7..557e7d90e4ea8ca2af59027b3152163cf7f9a618 100644
> --- a/drivers/gpu/drm/imx/dc/dc-drv.h
> +++ b/drivers/gpu/drm/imx/dc/dc-drv.h
> @@ -81,6 +81,7 @@ extern struct platform_driver dc_fw_driver;
>  extern struct platform_driver dc_ic_driver;
>  extern struct platform_driver dc_lb_driver;
>  extern struct platform_driver dc_pe_driver;
> +extern struct platform_driver dc_prg_driver;
>  extern struct platform_driver dc_tc_driver;
>
>  static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.c b/drivers/gpu/drm/imx/dc/dc-prg.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..9a1a312c0aeebf47bcf50ffa77971aa3bb431a12
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dc/dc-prg.c
> @@ -0,0 +1,323 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include "dc-prg.h"
> +
> +#define SET			0x4
> +#define CLR			0x8
> +#define TOG			0xc
> +
> +#define PRG_CTRL		0x00
> +#define  BYPASS			BIT(0)
> +#define  SC_DATA_TYPE_8BIT	0
> +#define  HANDSHAKE_MODE_4LINES	0
> +#define  SHADOW_LOAD_MODE	BIT(5)
> +#define  DES_DATA_TYPE_MASK	GENMASK(17, 16)
> +#define  DES_DATA_TYPE_32BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 0)
> +#define  DES_DATA_TYPE_24BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 1)
> +#define  DES_DATA_TYPE_16BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 2)
> +#define  DES_DATA_TYPE_8BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 3)
> +#define  SOFTRST		BIT(30)
> +#define  SHADOW_EN		BIT(31)
> +
> +#define PRG_STATUS		0x10
> +
> +#define PRG_REG_UPDATE		0x20
> +#define  REG_UPDATE		BIT(0)
> +
> +#define PRG_STRIDE		0x30
> +#define  STRIDE(n)		FIELD_PREP(GENMASK(15, 0), (n) - 1)
> +
> +#define PRG_HEIGHT		0x40
> +#define  HEIGHT(n)		FIELD_PREP(GENMASK(15, 0), (n) - 1)
> +
> +#define PRG_BADDR		0x50
> +#define PRG_OFFSET		0x60
> +
> +#define PRG_WIDTH		0x70
> +#define  WIDTH(n)		FIELD_PREP(GENMASK(15, 0), (n) - 1)
> +
> +#define DPU_PRG_MAX_STRIDE	0x10000
> +
> +struct dc_prg {
> +	struct device *dev;
> +	struct regmap *reg;
> +	struct list_head list;
> +	struct clk *clk_apb;
> +	struct clk *clk_rtram;
> +};
> +
> +static DEFINE_MUTEX(dc_prg_list_mutex);
> +static LIST_HEAD(dc_prg_list);
> +
> +static const struct regmap_config dc_prg_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.fast_io = true,
> +	.max_register = PRG_WIDTH + TOG,
> +};
> +
> +static void dc_prg_reset(struct dc_prg *prg)
> +{
> +	regmap_write(prg->reg, PRG_CTRL + SET, SOFTRST);
> +	fsleep(10);
> +	regmap_write(prg->reg, PRG_CTRL + CLR, SOFTRST);
> +	fsleep(10);
> +}
> +
> +void dc_prg_enable(struct dc_prg *prg)
> +{
> +	regmap_write(prg->reg, PRG_CTRL + CLR, BYPASS);
> +}
> +
> +void dc_prg_disable(struct dc_prg *prg)
> +{
> +	regmap_write(prg->reg, PRG_CTRL, BYPASS);
> +
> +	pm_runtime_put(prg->dev);
> +}
> +
> +void dc_prg_disable_at_boot(struct dc_prg *prg)
> +{
> +	regmap_write(prg->reg, PRG_CTRL, BYPASS);
> +
> +	clk_disable_unprepare(prg->clk_rtram);
> +	clk_disable_unprepare(prg->clk_apb);
> +}
> +
> +static unsigned int dc_prg_burst_size_fixup(dma_addr_t baddr)
> +{
> +	unsigned int burst_size;
> +
> +	burst_size = 1 << __ffs(baddr);
> +	burst_size = round_up(burst_size, 8);
> +	burst_size = min(burst_size, 128U);
> +
> +	return burst_size;
> +}
> +
> +static unsigned int
> +dc_prg_stride_fixup(unsigned int stride, unsigned int burst_size)
> +{
> +	return round_up(stride, burst_size);
> +}
> +
> +void dc_prg_configure(struct dc_prg *prg,
> +		      unsigned int width, unsigned int height,
> +		      unsigned int stride, unsigned int bits_per_pixel,
> +		      dma_addr_t baddr, bool start)
> +{
> +	struct device *dev = prg->dev;
> +	unsigned int burst_size;
> +	u32 val;
> +	int ret;
> +
> +	if (start) {
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to get RPM: %d\n", ret);
> +			return;
> +		}
> +	}
> +
> +	burst_size = dc_prg_burst_size_fixup(baddr);
> +
> +	stride = dc_prg_stride_fixup(stride, burst_size);
> +
> +	regmap_write(prg->reg, PRG_STRIDE, STRIDE(stride));
> +	regmap_write(prg->reg, PRG_WIDTH, WIDTH(width));
> +	regmap_write(prg->reg, PRG_HEIGHT, HEIGHT(height));
> +	regmap_write(prg->reg, PRG_OFFSET, 0);
> +	regmap_write(prg->reg, PRG_BADDR, baddr);
> +
> +	val = SHADOW_LOAD_MODE | SC_DATA_TYPE_8BIT | BYPASS |
> +	      HANDSHAKE_MODE_4LINES;
> +
> +	switch (bits_per_pixel) {
> +	case 32:
> +		val |= DES_DATA_TYPE_32BPP;
> +		break;
> +	case 24:
> +		val |= DES_DATA_TYPE_24BPP;
> +		break;
> +	case 16:
> +		val |= DES_DATA_TYPE_16BPP;
> +		break;
> +	case 8:
> +		val |= DES_DATA_TYPE_8BPP;
> +		break;
> +	}
> +
> +	/* no shadow for the first frame */
> +	if (!start)
> +		val |= SHADOW_EN;
> +	regmap_write(prg->reg, PRG_CTRL, val);
> +}
> +
> +void dc_prg_reg_update(struct dc_prg *prg)
> +{
> +	regmap_write(prg->reg, PRG_REG_UPDATE, REG_UPDATE);
> +}
> +
> +void dc_prg_shadow_enable(struct dc_prg *prg)
> +{
> +	regmap_write(prg->reg, PRG_CTRL + SET, SHADOW_EN);
> +}
> +
> +bool dc_prg_stride_supported(struct dc_prg *prg,
> +			     unsigned int stride, dma_addr_t baddr)
> +{
> +	unsigned int burst_size;
> +
> +	burst_size = dc_prg_burst_size_fixup(baddr);
> +
> +	stride = dc_prg_stride_fixup(stride, burst_size);
> +
> +	if (stride > DPU_PRG_MAX_STRIDE)
> +		return false;
> +
> +	return true;
> +}
> +
> +struct dc_prg *
> +dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
> +{
> +	struct device_node *prg_node __free(device_node);
> +	struct dc_prg *prg;
> +
> +	prg_node = of_parse_phandle(dev->of_node, name, index);
> +	if (!prg_node)
> +		return NULL;
> +
> +	guard(mutex)(&dc_prg_list_mutex);
> +	list_for_each_entry(prg, &dc_prg_list, list) {
> +		if (prg_node == prg->dev->of_node)
> +			return prg;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int dc_prg_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	void __iomem *base;
> +	struct dc_prg *prg;
> +	int ret;
> +
> +	prg = devm_kzalloc(dev, sizeof(*prg), GFP_KERNEL);
> +	if (!prg)
> +		return -ENOMEM;
> +
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	prg->reg = devm_regmap_init_mmio(dev, base, &dc_prg_regmap_config);
> +	if (IS_ERR(prg->reg))
> +		return PTR_ERR(prg->reg);
> +
> +	prg->clk_apb = devm_clk_get(dev, "apb");
> +	if (IS_ERR(prg->clk_apb))
> +		return dev_err_probe(dev, PTR_ERR(prg->clk_apb),
> +				     "failed to get APB clock\n");
> +
> +	prg->clk_rtram = devm_clk_get(dev, "rtram");
> +	if (IS_ERR(prg->clk_rtram))
> +		return dev_err_probe(dev, PTR_ERR(prg->clk_rtram),
> +				     "failed to get RTRAM clock\n");

look like you just enable/disable all clocks. You can use clk bulk API to
simple code. It is not big issue.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> +
> +	dev_set_drvdata(dev, prg);
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
> +
> +	prg->dev = dev;
> +
> +	guard(mutex)(&dc_prg_list_mutex);
> +	list_add(&prg->list, &dc_prg_list);
> +
> +	return 0;
> +}
> +
> +static void dc_prg_remove(struct platform_device *pdev)
> +{
> +	struct dc_prg *prg = dev_get_drvdata(&pdev->dev);
> +
> +	guard(mutex)(&dc_prg_list_mutex);
> +	list_del(&prg->list);
> +}
> +
> +static int dc_prg_runtime_suspend(struct device *dev)
> +{
> +	struct dc_prg *prg = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(prg->clk_rtram);
> +	clk_disable_unprepare(prg->clk_apb);
> +
> +	return 0;
> +}
> +
> +static int dc_prg_runtime_resume(struct device *dev)
> +{
> +	struct dc_prg *prg = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(prg->clk_apb);
> +	if (ret) {
> +		dev_err(dev, "failed to enable APB clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(prg->clk_rtram);
> +	if (ret) {
> +		dev_err(dev, "failed to enable RTRAM clock: %d\n", ret);
> +		clk_disable_unprepare(prg->clk_apb);
> +		return ret;
> +	}
> +
> +	dc_prg_reset(prg);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops dc_prg_pm_ops = {
> +	RUNTIME_PM_OPS(dc_prg_runtime_suspend, dc_prg_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id dc_prg_dt_ids[] = {
> +	{ .compatible = "fsl,imx8qxp-prg", },
> +	{ /* sentinel */ }
> +};
> +
> +struct platform_driver dc_prg_driver = {
> +	.probe = dc_prg_probe,
> +	.remove = dc_prg_remove,
> +	.driver = {
> +		.name = "imx8-dc-prg",
> +		.suppress_bind_attrs = true,
> +		.of_match_table = dc_prg_dt_ids,
> +		.pm = pm_ptr(&dc_prg_pm_ops),
> +	},
> +};
> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..6fd9b050bfa12334720f83ff9ceaf337e3048a54
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dc/dc-prg.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef __DC_PRG_H__
> +#define __DC_PRG_H__
> +
> +#include <linux/device.h>
> +#include <linux/types.h>
> +
> +struct dc_prg;
> +
> +void dc_prg_enable(struct dc_prg *prg);
> +
> +void dc_prg_disable(struct dc_prg *prg);
> +
> +void dc_prg_disable_at_boot(struct dc_prg *prg);
> +
> +void dc_prg_configure(struct dc_prg *prg,
> +		      unsigned int width, unsigned int height,
> +		      unsigned int stride, unsigned int bits_per_pixel,
> +		      dma_addr_t baddr, bool start);
> +
> +void dc_prg_reg_update(struct dc_prg *prg);
> +
> +void dc_prg_shadow_enable(struct dc_prg *prg);
> +
> +bool dc_prg_stride_supported(struct dc_prg *prg,
> +			     unsigned int stride, dma_addr_t baddr);
> +
> +struct dc_prg *
> +dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
> +
> +#endif
>
> --
> 2.34.1
>
