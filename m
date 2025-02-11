Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686C1A311FF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 17:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A6E10E113;
	Tue, 11 Feb 2025 16:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="oT21qNWR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013054.outbound.protection.outlook.com [40.107.159.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0837010E113
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 16:48:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMZUG4srwXARnuPJdGMsuv2gv+Je4bjAn1vh9KTZM0M9aRAkaUKAXPCVLcMnoJHYr9WN+As5o+522GUGDG3xv86PjpTCcTQnkUfnmaNIYVAaEFDJxrMI/L6UGwuQK3CY2NPXNb3BHjif4Hp86zvsTKzJJTCZD1vjdPUeDMsnLD3bhfqbL4OtEwmzY3gam7bhFgWWmmG0iLvYKr4yVSRpe3aA7ZROdjizlmg8Nd0gH3ZSZZNdGZqkbe5cZjYvznuPIbJP49PdH4Vx6yG2ilxGksE/F+kjlTJNEQVvkAGNKd7Wi9J3hMCw2K44vFEm7FvgH0sX9m6qE6NF9q6cT01a4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCc9iMiLKLXQvmx3Q4hGvAAd+ILP/KIxBUwv95w2aV0=;
 b=C2NwEz7uZuN2PnslBGF33ttLlFjhR4cp8lN6PyypBTRbOHgVzWf9w0d76d0xtDRw824TJK+hzG8vpzfLcjiG2vVmMi1F8XYOW+SyYs4hExh2rHV1wkJziBw5ig7xFNL3JWFtzrX/FCGfN6vhxhEr4rB0u/0zyGgiskdWRpDn3yUtDY0QMgScst5v/SqQ1lcLrC1oMsPv/wMNc08UU9ls4IpkhL3cqxq9is00o/f0PIZxDHisHYjVCFfKnnyjunLT84OTLDXz1YYFAhkwieG8Cf4TbevAIFLOLgUm06z6Dkm/yqKpHznsTDa9x9Xky8baF6Ojv609hXEvVSFQlWog7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCc9iMiLKLXQvmx3Q4hGvAAd+ILP/KIxBUwv95w2aV0=;
 b=oT21qNWRGskvCgHFq+CObiswsLE/kwL9A1taqdbbq1mz7sYoGNVJc4zGJXBzdYIa6WGgbMJxNfRGRM23M2tLAg9ySigvyb8C0yIbTxfzYd5Wb3Knugik36B42Ny6q3IB2p2LGYGaPhLp6qATphWXOmZTOEBW7eUbWewF4MNhxn8B83e0m6llm03K8zvrjkqGIiY3G+1qUXmg3SRWvMUlcXI7PRQ706/wC7+MVfwsAkWtk1GHqvfEzTxYkSozzD01zpI6tMT5tPm3bX33jEDHJvDqIVMG6gi4R92NtZXyb5KZIXkkmxAhE+sIiFZWo06Okk/cWpKcCQwpCxE+rIrnPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8615.eurprd04.prod.outlook.com (2603:10a6:10:2da::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Tue, 11 Feb
 2025 16:47:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 16:47:59 +0000
Date: Tue, 11 Feb 2025 11:47:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm: bridge: imx9-parallel-disp-fmt: add i.MX91/93
 parallel display bridge
Message-ID: <Z6t/ODQpUIPFTPvG@lizhi-Precision-Tower-5810>
References: <20250211084119.849324-1-alexander.stein@ew.tq-group.com>
 <20250211084119.849324-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211084119.849324-3-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SA1P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: ce402df3-6f08-4773-c7d4-08dd4abbd7ab
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FgNVZMI1ttIjdQ/byTT2eicOxC/K4NavBnj/VzsQOGHExF+ZYLWsTPYSwkIh?=
 =?us-ascii?Q?ECs9YshKqZoRjnZYKR30xdDRKRo73DIDZ3iWR3jpxUCTBUfub9R6mMlSWQ1Z?=
 =?us-ascii?Q?PB6tgbZpgeZt+tvWMzGFJbGEICOLIet8PzsHQLu5ZwkwSjYjj7xRGFLcLV4o?=
 =?us-ascii?Q?vlwzLb/rFaiePb6gayvklQs2M7wpKHUqpwyYDaKbUboBBAfJoLdEbPSI31X9?=
 =?us-ascii?Q?IUkk5tfOaDQbodvy2d3w7M5vPod24aVIcs746hGg/T77+CIe3g+0W7SI1yfd?=
 =?us-ascii?Q?rSIMguDV6aMGDhFPGEwtbDTI0gdjPNXkPHpnYwIbtw3DoTsCul5LwaxRuGTo?=
 =?us-ascii?Q?e+YnKhKp9ro3J4Wne5ifUDEDppo5Q06X/FB0rkZSl+YqoZqDfOs8nHLtytsO?=
 =?us-ascii?Q?udF2V4pU7dwx2DMgfdUgZwKh39YmrSggjuR7irSLHdKchi7S/WV+XPKqhilP?=
 =?us-ascii?Q?ckvu6gEubK3omamlYNnRuYe1x8CSzMzo25HGS6oBROf2+J9bCzzPF3qBSQ4s?=
 =?us-ascii?Q?jhnwWmeeQM1nGQF4yn+y+HuX+ZGq/B1ocpMjrA2nK6O6PO1YA4Fo6GX0eQB7?=
 =?us-ascii?Q?UOsA1nkuPbu7Zc7fRspFuxZZEZeI2GbgIzUJ0gHWBbUHywSa/WQOLKRo7U2b?=
 =?us-ascii?Q?2W8iX4f9ZNxRpdBdCdZrj1LGDJ6qAsSKo/9WMabTFPIzSee13R+3NcAO+jCX?=
 =?us-ascii?Q?x2LdcLOPN8hhZmOkk6uX0+CvEMs5Z65gFumJWlRxs+NSLcyzLuGPKtZCb/b8?=
 =?us-ascii?Q?lV26s2KfEqQ7Ht7KOu5g3kFASFDqIRGy1IAhcJ+rHH7crO5kw36Jl9Vzh5d3?=
 =?us-ascii?Q?zHsg4fW4PFUvTupIx72MymKEUaUdAqYBVHXUes4vP8bXbVLS8WufyjDWo715?=
 =?us-ascii?Q?AR0ceh4o8E1I1dzLRp7QkDXvzlyxbPSYhNPyc1Bi+X8y94r6xa1jSVqd7ZNp?=
 =?us-ascii?Q?O4AeRKhwGPv9C+LSfCVyWZOj/hMp1DdfeOZXEAo+Pdu9LS5CzqmfkGdpYpTy?=
 =?us-ascii?Q?jF4S8tK/w8HHmjK6lQfTLNnVXmTQdIpD4gSZ/GjopkTnuKljy2nkSPvoF6Lc?=
 =?us-ascii?Q?vym8KxuqAmu6YDk9wy37EnL+ZmKEz1XjaOKlPYYDZ5Y/2ccD+TG0U+FiTy9C?=
 =?us-ascii?Q?dyR8Gn86K/mLfYqbzO2SGDwY+famI1wzsGj3BDdK9xnL9uRs4M2d4ZDDPByH?=
 =?us-ascii?Q?bloOgsDLruNi36anoMkqyprd9J8kiwb3j94+3W6SCgEnY4WPl52/xNFiv8a7?=
 =?us-ascii?Q?YsAf/yM8v5P3wDCag2UZKq/qYiCdJ0N2Fb9723s6dQZmGvp/5rqnsUVOxVhb?=
 =?us-ascii?Q?wzdkdmpMzeZqO3GInRwRlOZsBku3+fXQko3jlkUMuzFESeBSpmqqz4SRyQOe?=
 =?us-ascii?Q?JpcdN6XluWfhQSj0BLkaHtJyaPklHHZPExCLCDvx61StIMQOnlTLLDDP/QPX?=
 =?us-ascii?Q?N1YXbnqKpX3bJNx10WmVLYjUjDX9p8k6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6qsTp+cXP1ER4HiQ484e7w+EYoWHiY8vq/CVQpE9dOYyFgPANpQZAl9RvzDV?=
 =?us-ascii?Q?IxQRC7Zyj6M2k3+fQBm9vWNLuPuQq79q1rg/qw40swTCetn0FMxtzpUtFVT3?=
 =?us-ascii?Q?+ke0tagMY0IKFbE49TuaW21yh/mhBBCvvGPKjPpAkpTUuUNWj1QzgsNPhM8N?=
 =?us-ascii?Q?phBB9FZlw00vG55JWn4S82Gz7/LHL9D9tb3fzx31CLX3IIPYzIKRhkODP5pu?=
 =?us-ascii?Q?vSrQxg8ntkwWI2iM6kg0XtmZiaIyoNT08obRC9s1YkdFNFYIhx3t8g/pxJPc?=
 =?us-ascii?Q?vbZroT3d1zlwCluBWUcsDSxQ/6lVdz4JXohQDyzU72b8ocdGm+DzkzkitqsK?=
 =?us-ascii?Q?os8ATAlevSkG1xpbjBcAB5V9OLiphuQVlY8QEvc0Yr2MKhT0MZNOs9gdIMMq?=
 =?us-ascii?Q?+l7hM9tOl98Ry4cjO4uP5O5XHA593xCCGZnK3veWJe0opifsCgz/DFSz4q1u?=
 =?us-ascii?Q?gwp2fF37liV3TO+5ktHveYV5F0w5w5AvQqFoGefoc1CnwSoJFIB6Kk489Obr?=
 =?us-ascii?Q?p71+bJtqJKdhIbA091BZwfiCTyRWkTfSjjck0VnGRgmc72VvC+OprjVy7Kp8?=
 =?us-ascii?Q?5XkXPw7iaqM96ugW1oEza6qcR8LweiNnqG55DTXSee/nInnS+3pfWJMyhPYx?=
 =?us-ascii?Q?m+8wk79CmjPfmOHXBwUAXy5ZKFtfRU/GfZxzBfXRekynW+e3pg9+HosRXeb3?=
 =?us-ascii?Q?W27jqsHe7QLdjwMQuAsELHfF01zrFsCNXpgGgNh789sgAnRW/Ta9RqOgvN+g?=
 =?us-ascii?Q?mfYwreLRGGethLowG6vdhdhm3Blupx9rpThyx3TmYHUDqsfofXaKOHftL2xm?=
 =?us-ascii?Q?io6kBR2qLf5vSB20X/+tiW//aSmnWsEzixAcaX6O07kwNnEiEz+D7s+DRvqn?=
 =?us-ascii?Q?X3k9bYOxB/zmxOYeKAFoZrfrdelzJe0Vw1PqVP8VkDNBBV+pNIj4Iv/0Dx2S?=
 =?us-ascii?Q?O9Imb/d1tywgMXEfXqSbK8mugwfZZ6md9bkZJkYOoS2XY6Qr19LhcXZC1CBG?=
 =?us-ascii?Q?PwbUE/4DgXrP6b2uT6t4xXPiyRf9FdoQkwYCGjPDG1oIvXerGItEDO6r75dv?=
 =?us-ascii?Q?RZvBDB9XIj3u6+e+GJoF8J5aqyqIaCN9x/O66RTW/k/6RaWr1VNfsENfv2xF?=
 =?us-ascii?Q?bKl+Udyon4lEMCib+4jDvmQ+KeUdpsN1JICH2PRzo+QpiXr7HmtcDQ/11zai?=
 =?us-ascii?Q?y0YHCx+gcmsx28tMEPyWQge8xRXkEfQ/d2iQIPX2PV7BTHg9E8JertVkWrTG?=
 =?us-ascii?Q?JbpOpqzz25LystuYNoOj8iTFvI8J8YsnYrRvkEOzrOSaqU7w59zu4bSmL70B?=
 =?us-ascii?Q?1owfTTi3/ElbaHwVTpVNZNnVscLnnbqNR/BKzcLV60toMEMGh5bBnpHbh5RS?=
 =?us-ascii?Q?+5fTB3BpLb0oJJvD6R4zzFqOTGwV9Tb620GTJrZ2hWsHsvPQP+RDG+YTCo4F?=
 =?us-ascii?Q?gS3QOpR1nBShstAfCsm3u33keHdlLrEmEcdOpjUjLESdYGY1l7QDp4eI9Xx7?=
 =?us-ascii?Q?dg7ai9LEmfN4KZ1GDQRO2OmDUlP9c969mFhZX7ghh/tXXct9h6Wba5G/7RZW?=
 =?us-ascii?Q?V7FHea9It8HQ1dPj/yz4dyxbEAu351QWkPCqQ/Cq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce402df3-6f08-4773-c7d4-08dd4abbd7ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 16:47:59.7224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYQ62rvddMJ2OhusyoZkbFqFcE9wafppxWUGyq60de3CDw0JkwnkCTcbWB0B+lcZUIhdBXw+vvCc4aRwMb/FaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8615
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

On Tue, Feb 11, 2025 at 09:41:19AM +0100, Alexander Stein wrote:
> i.MX91/93 have a single register specifying parallel display output
> format. Add a bridge driver for setting the corresponding format.
> Currently only RGB565, RGB666 and RGB888 output is supported.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig                |  10 +
>  drivers/gpu/drm/bridge/Makefile               |   1 +
>  .../gpu/drm/bridge/imx9-parallel-disp-fmt.c   | 213 ++++++++++++++++++
>  3 files changed, 224 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx9-parallel-disp-fmt.c
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 6b4664d91faa8..8b69977787883 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -90,6 +90,16 @@ config DRM_FSL_LDB
>  	help
>  	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
>
> +config DRM_IMX9_PARALLEL_DISPLAY_FORMAT
> +	tristate "Support for i.MX93 parallel display format"
> +	depends on OF && MFD_SYSCON
> +	depends on ARCH_MXC || COMPILE_TEST
> +	select DRM_KMS_HELPER
> +	select DRM_PANEL_BRIDGE
> +	help
> +	  Support for internal parallel display format configuration
> +	  found on i.MX91 and i.MX93 processors.
> +
>  config DRM_ITE_IT6263
>  	tristate "ITE IT6263 LVDS/HDMI bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 97304b429a530..ee3406fed880f 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>  obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
>  obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
>  obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
> +obj-$(CONFIG_DRM_IMX9_PARALLEL_DISPLAY_FORMAT) += imx9-parallel-disp-fmt.o
>  obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
>  obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
>  obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
> diff --git a/drivers/gpu/drm/bridge/imx9-parallel-disp-fmt.c b/drivers/gpu/drm/bridge/imx9-parallel-disp-fmt.c
> new file mode 100644
> index 0000000000000..c37bdda53377c
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx9-parallel-disp-fmt.c
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2022 NXP
> + * Copyright (c) 2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + */
> +
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +
> +#define DISPLAY_MUX_CTRL		0x60

look like you have not use reg in dts and hardcode 0x60 here.

Frank

> +#define  PARALLEL_DISP_FORMAT		GENMASK(10, 8)
> +#define  FORMAT_RGB888_TO_RGB888	FIELD_PREP(PARALLEL_DISP_FORMAT, 0)
> +#define  FORMAT_RGB888_TO_RGB666	FIELD_PREP(PARALLEL_DISP_FORMAT, 1)
> +#define  FORMAT_RGB565_TO_RGB565	FIELD_PREP(PARALLEL_DISP_FORMAT, 2)
> +#define  FORMAT_RGB555_TO_RGB555	FIELD_PREP(PARALLEL_DISP_FORMAT, 3)
> +#define  FORMAT_YUV_TO_YCBCR24		FIELD_PREP(PARALLEL_DISP_FORMAT, 4)
> +#define  FORMAT_YUV_TO_YUV444		FIELD_PREP(PARALLEL_DISP_FORMAT, 5)
> +
> +struct imx9_pdf {
> +	struct device *dev;
> +	struct drm_bridge bridge;
> +	struct drm_bridge *panel_bridge;
> +	struct regmap *regmap;
> +};
> +
> +static inline struct imx9_pdf *to_imx9_pdf(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct imx9_pdf, bridge);
> +}
> +
> +static int imx9_pdf_attach(struct drm_bridge *bridge,
> +	enum drm_bridge_attach_flags flags)
> +{
> +	struct imx9_pdf *pdf = to_imx9_pdf(bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, pdf->panel_bridge,
> +	       			 bridge, flags);
> +}
> +
> +static void imx9_pdf_atomic_enable(struct drm_bridge *bridge,
> +				   struct drm_bridge_state *old_bridge_state)
> +{
> +	struct imx9_pdf *pdf = to_imx9_pdf(bridge);
> +	struct drm_atomic_state *state = old_bridge_state->base.state;
> +	const struct drm_bridge_state *bridge_state;
> +	u32 format;
> +
> +	/* Get the bus format from the bridge state. */
> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +
> +	switch (bridge_state->output_bus_cfg.format) {
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		format = FORMAT_RGB565_TO_RGB565;
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +		format = FORMAT_RGB888_TO_RGB666;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +		format = FORMAT_RGB888_TO_RGB888;
> +		break;
> +	default:
> +		/*
> +		 * Some bridges still don't set the correct bus format.
> +		 * Just print a warning.
> +		 */
> +		dev_warn(pdf->dev,
> +			 "Unsupported bus format 0x%04x, please check output bridge driver\n",
> +			 bridge_state->output_bus_cfg.format);
> +		return;
> +	}
> +
> +	regmap_update_bits(pdf->regmap, DISPLAY_MUX_CTRL, PARALLEL_DISP_FORMAT,
> +			   format);
> +}
> +
> +#define MAX_INPUT_SEL_FORMATS 2
> +static u32 *
> +imx9_pdf_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				   struct drm_bridge_state *bridge_state,
> +				   struct drm_crtc_state *crtc_state,
> +				   struct drm_connector_state *conn_state,
> +				   u32 output_fmt,
> +				   unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> +			     GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +	input_fmts[1] = MEDIA_BUS_FMT_RGB565_1X16;
> +	*num_input_fmts = MAX_INPUT_SEL_FORMATS;
> +
> +	return input_fmts;
> +}
> +
> +#define MAX_OUTPUT_SEL_FORMATS 3
> +static u32 *
> +imx9_pdf_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> +				    struct drm_bridge_state *bridge_state,
> +				    struct drm_crtc_state *crtc_state,
> +				    struct drm_connector_state *conn_state,
> +				    unsigned int *num_output_fmts)
> +{
> +	u32 *output_fmts;
> +
> +	*num_output_fmts = 0;
> +
> +	output_fmts = kcalloc(MAX_OUTPUT_SEL_FORMATS, sizeof(*output_fmts),
> +			     GFP_KERNEL);
> +	if (!output_fmts)
> +		return NULL;
> +
> +	output_fmts[0] = MEDIA_BUS_FMT_RGB565_1X16;
> +	output_fmts[1] = MEDIA_BUS_FMT_RGB666_1X18;
> +	output_fmts[2] = MEDIA_BUS_FMT_RGB888_1X24;
> +	*num_output_fmts = MAX_OUTPUT_SEL_FORMATS;
> +
> +	return output_fmts;
> +}
> +
> +static enum drm_mode_status
> +imx9_pdf_mode_valid(struct drm_bridge *bridge,
> +		   const struct drm_display_info *info,
> +		   const struct drm_display_mode *mode)
> +{
> +	if (mode->clock > 80000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static const struct drm_bridge_funcs funcs = {
> +	.attach = imx9_pdf_attach,
> +	.atomic_enable = imx9_pdf_atomic_enable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_get_input_bus_fmts = imx9_pdf_atomic_get_input_bus_fmts,
> +	.atomic_get_output_bus_fmts = imx9_pdf_atomic_get_output_bus_fmts,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.mode_valid = imx9_pdf_mode_valid,
> +};
> +
> +static int imx9_pdf_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *remote;
> +	struct drm_panel *panel;
> +	struct imx9_pdf *pdf;
> +
> +	pdf = devm_kzalloc(dev, sizeof(*pdf), GFP_KERNEL);
> +	if (!pdf)
> +		return -ENOMEM;
> +
> +	pdf->dev = &pdev->dev;
> +	pdf->bridge.funcs = &funcs;
> +	pdf->bridge.of_node = dev->of_node;
> +	pdf->bridge.type = DRM_MODE_CONNECTOR_DPI;
> +
> +	pdf->regmap = syscon_node_to_regmap(dev->of_node->parent);
> +	if (IS_ERR(pdf->regmap))
> +		return dev_err_probe(dev, PTR_ERR(pdf->regmap),
> +				     "failed to get regmap\n");
> +
> +	remote = of_graph_get_remote_node(dev->of_node, 1, 0);
> +	panel = of_drm_find_panel(remote);
> +	of_node_put(remote);
> +	if (IS_ERR(panel))
> +		return PTR_ERR(panel);
> +
> +	pdf->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> +	if (IS_ERR(pdf->panel_bridge))
> +		return PTR_ERR(pdf->panel_bridge);
> +
> +	platform_set_drvdata(pdev, pdf);
> +
> +	devm_drm_bridge_add(dev, &pdf->bridge);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id imx9_pdf_dt_ids[] = {
> +	{ .compatible = "fsl,imx9-parallel-display-format", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx9_pdf_dt_ids);
> +
> +static struct platform_driver imx9_pdf_driver = {
> +	.probe		= imx9_pdf_probe,
> +	.driver		= {
> +		.name		= "imx9-parallel-display-format",
> +		.of_match_table	= imx9_pdf_dt_ids,
> +	},
> +};
> +module_platform_driver(imx9_pdf_driver);
> +
> +MODULE_AUTHOR("Alexander Stein <alexander.stein@ew.tq-group.com>");
> +MODULE_DESCRIPTION("i.MX91/i.MX93 parallel display format driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.34.1
>
