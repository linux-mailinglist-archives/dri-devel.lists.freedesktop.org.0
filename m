Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBA5B8A182
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 16:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BEF10EA3A;
	Fri, 19 Sep 2025 14:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="lXJz+NFn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013017.outbound.protection.outlook.com
 [40.107.162.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CF810EA3A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:53:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duFXZ248T5GRRJIWLRWcj+GXumJxag05xdzitKhwEDh/AFt9B2g7plOCI/Bovf8VXZnaegkSYjxClXM2H9NQnV3T6/f1fnKj/D6zuLjuGn0NSpQzc//ih+mY1gaxdctziuAVrRthEKp8nnk+rsK9PTXUI7QqsPAW38wVOZsR9ec7M99amu/4CVWi5r3olsN97aUykgOJsrahMTNLyhNoq+nR20yKNTRxhd7UeElqZRsv/k4mBAllZwd2yKNfiy/wQ36qta/3rpllMRqwZj91MfrAi9OsoTZwFrQs5DTPx3sra4k7IQwXZSUmuQSCiBp9FOgg/SzwawAk9zkEL+1BDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6rlT79hGALIAr3KmmteTuTDnn0EWGj+0GeY+UDbb9U=;
 b=sumVkXTuH97z6YqzOM7tLzupw2QQTXPXbBgL0OSqbRN/5D/AlK7RjSxTgtthRCT0qhOVfmlIdgYUqCiGNbQ1b1bxNwCbm8vjARlXh/QD+VIquK5S133k4I350Ob7meLKNWOgR9dUW1kAz/hk7uUKAWNQJilGZZMljR/dM4DtvJxDZbk2enCechB0cZ70lvwBU0mZeW7Munhe9EUmwkUYFGdSRX1aEfm3I7S9B/6dm2rwhR83gCML5SemXBLZY8rO56JRqXfgm0W5i2YpJM1LCX7yXKYmV56I9eqERUucSK/sIpdvc4hscPkTXzR2APrgeOqz02IOVMH/PiJzq1vy/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6rlT79hGALIAr3KmmteTuTDnn0EWGj+0GeY+UDbb9U=;
 b=lXJz+NFnNXrZxjcvpbcNFNqTokq0XCALk6nqGw8RSDnJdmXUbTLugnYNjLIBsvLQ5/H+3Q6lOZFdUgYEs11ROzcYDuiTHhoJhNZNMAf10oTTKbwJaxxHamhkGFWvPmyFSoq+2bTMyroZm8pwRro5jlMlsullQ28/CwFxPLtEoB6NGnV45dFAwTuRmd5BObsIz6bQDi4finumr7Zn4L4W8GVjpcnqGIKmm6Gq4Xkhm3y3M5sK+l50Kcl+JoPSlPxtQ6SoM/3mHApwrAAY4gZCsi7gYK28jDcanZ1kQqSNWy4xyhIe95CWM1VpP/kbruIBKJZcQqnj7wQ8V8y1KUgNIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 14:53:17 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 14:53:17 +0000
Date: Fri, 19 Sep 2025 10:53:08 -0400
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
Subject: Re: [PATCH 03/14] MAINTAINERS: Add i.MX8qxp prefetch engine DT
 binding files
Message-ID: <aM1uVAG9hYpgn1r7@lizhi-Precision-Tower-5810>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-3-784c03fd645f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-imx8-dc-prefetch-v1-3-784c03fd645f@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB8897:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cfaf35e-93e5-4313-bdbf-08ddf78c4491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AWrDFGvEO2ZrHq7TVJE7fKu2GVr0fMSqVFSXiceZxNC/yMNm+Fx4jvsIXvX/?=
 =?us-ascii?Q?OrJZ0U4mhQhcTMROPKzAqMnkHlB2W8guV3luO5+QfEF/unk9XTQffbA5rbdq?=
 =?us-ascii?Q?nVREpXHs6dqx8615KdRaLKEDTDLl6QLbnxnR6QM+Nc5xxuU21BzcHnDCk1cD?=
 =?us-ascii?Q?MaF8H+02BmHZuPmQH2jDguO+DAtSbdGs9wBHUC7McnAXTjbWfjaGnjVe4r9U?=
 =?us-ascii?Q?v2TcxF8xo1nc0ZmEH/BvH2tdGtTSyfuIk0n+0Itl0+sxiXx6CecJcsBhtaG3?=
 =?us-ascii?Q?xDZzWZDMHXo5ridnsao/XyHUD8Uc9cpiVgtNikfep7S0BgojnetZnaNkl3W3?=
 =?us-ascii?Q?s/4k4QHonL81//TR01c9Is8tiJmRUXWdMXEF7s9Payxu6zzn1tOdtaCyvqLK?=
 =?us-ascii?Q?IMC633ohPxEABSF+XWuAZDbWqb/1QHWGQ7p03eQtBbQvP/79mzo4vqUyTw9m?=
 =?us-ascii?Q?1Q9BjAFKf5ctpuGhyXbLi+0/ImaBKusUwFLfq98HduGLZ0j+oGZ6sGJMwGO7?=
 =?us-ascii?Q?+EXFNbIw2RyPK5I2tDpKJ9Rr3w1dz1XFkqyH86B+N17Q4I6HmqKIiLOUQ3kW?=
 =?us-ascii?Q?BSWv8WLykrDqeMmcdZQRbIjwFpQtNW9nrEMVrbCu1WsRuxiUCrQOojopOchs?=
 =?us-ascii?Q?sn2F1JrHyBWXOuz4kaXhErl+3/JQ9hKt8G3tAEnNKvmNyJ48meTpLPaYKKNG?=
 =?us-ascii?Q?Ye9rg5CN2qdpACnOPnEwI7IEyGRbgenxExpSOpMR8ISnxbgmnp1uL37LZJIm?=
 =?us-ascii?Q?nNwt1MLFF/qFO8jUKiqoay06ES4drqas66QCFXwE9VRNc9UAiobza5w7cIb4?=
 =?us-ascii?Q?PEer2mdG8AkFNCu1yXzcXJ0imR58q+RRFqRRCHzcJJOO2grZj+SM6+zqg/py?=
 =?us-ascii?Q?C16m5dq3W11QQqkeMoqIctNmPPpIdRd616NkpurMY7RWImq8Lojbh2eFIF7J?=
 =?us-ascii?Q?fySwTygnWyswect9m4Q/Ry4ACw5HWOSflZAAn7VjlfDkFsxHbMKlXTqYemeN?=
 =?us-ascii?Q?kOo/j1vFcOxeXuRlyExMS1hQZ5e8bEnnYO4ADgyhxD9w5+pJzMspRgSCLdqf?=
 =?us-ascii?Q?g4rK3rnmn8osy/EvTmsWFYpF4qP7bjDUWpQ5RuktEU5205UpQi+Cyjc5fbU8?=
 =?us-ascii?Q?NLUcua9Z2N8G03YcBzY9lrGJmynjTipqkIt3BsrHXosd2nsS3Hz/PFcp7mcZ?=
 =?us-ascii?Q?3+JjysYlkwJ0nbWa+6hSHhfa5C4x9gUo4UqdFq0Nml9p1swUJUj1smok9D/d?=
 =?us-ascii?Q?casPQOzf1icSrVHk61DwSQBD8B3ckHS0xEpY1vGaNufrOmNZMlBbTpIr18VP?=
 =?us-ascii?Q?RnWvauKpO6tGUo0gzr1w2Kvp05xE8eq8KjzWXmZZOyGkj+RRJyeAKf7Et/tv?=
 =?us-ascii?Q?FLTz65Cw6WioypEyA4nd6hJacEThbYTMTLxBcIOmQ/1ECx5WjFhUtZLOIdQZ?=
 =?us-ascii?Q?faRErFMfqOY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kipj9hI2SKF7WRQtj1cKDK8z9juOUy2uDQIY9+41rIcKsPgcg/p/aPjgGUiG?=
 =?us-ascii?Q?2qHLglY7lmFCIuU62F5FtsgbqaJ9QiV74vtTj3RPHJxbx/Xp7g6t0dwXmKxr?=
 =?us-ascii?Q?Rgeu0lrIDL8zde282kS8uGpUXUmTpbE+cgabBgc3z1a0YqLxKkQz3Pzvi3Ig?=
 =?us-ascii?Q?piwncvKG/Hoe7xFe9SxOQ/2Uc+ryt916qIKT6oGyPEidFsXMnBmyiCvbagiU?=
 =?us-ascii?Q?LYFghmwUdD4OyGqyeu9WbuuFZ9mtenrnvGjowiKJYHVB1DyOAmSlja+Qg7SM?=
 =?us-ascii?Q?swZbGZutfdb2CNuuNmgyPRcC4fm86Md17sl3CPYZoJUvB4/wDBcQ/u3ZUvcf?=
 =?us-ascii?Q?GW1PQr0pnnpVzgaZ18pmn9lvwCXidD2eMQxRPSxURXf8RajhuXPcZRrgpXpT?=
 =?us-ascii?Q?c+7a7yBfvEYQFbeFklJLUnFEO1R1+LyZA9H6TejSxprbGIPaxs54pi/ejLkq?=
 =?us-ascii?Q?nxp+UEIGVmcQxYoOfoNGu6AHzGyVaCWm9CwaC3G1sDDyrGDVvR9sbp/kzMBV?=
 =?us-ascii?Q?j/UqBcmMIFwTrE2Z8olL7rYJwv+TP3YXKE6IsT6iiSJvKPmUkpM5YIm13Li3?=
 =?us-ascii?Q?brwp0FgIKuoMju75DAw1/VZ5+24EskqtAeELzoBikKUYs2IsYiWa94DDYEJW?=
 =?us-ascii?Q?n6G/xdaPNI0SEMR9i2z+YkE34uErHTnZQop1wIqPEaYTCv1g/d44juu7X29e?=
 =?us-ascii?Q?shfYiboARzjbOzMDL/DZOEiNkDX3shJucOX71rwZkSCjCYnmNjkQnrsophap?=
 =?us-ascii?Q?qjAZ+j0mULqHtOWoPiuz2VP3VW5Vq3OYA1rIeNql+dj8i2xgwIAUQIQeFQ8i?=
 =?us-ascii?Q?2zAt2vhONguPx+DMyAAaWLGKgz43dGI38Iamomy0wy6EKPbWT0/vFl+e7Igd?=
 =?us-ascii?Q?RNmANGj8Zc/4lYi44c5Q3GxK2lr052tgivq/Dy3aOzq+fOloGDWwsySi/UUp?=
 =?us-ascii?Q?75axX7mXCcWTQHo4WuSEl4N2rKTRAxLfsjgcFnyxq7AldgIfeXkLiZod7uNP?=
 =?us-ascii?Q?HXujOJTCSz43IP1o9OnyE3Y7r7pPDirQvcL2+/S4hm4zCSfp/ZAp6M6Zy7dC?=
 =?us-ascii?Q?zQ2D507abGCuf3NrfOkHkHENBuBXSkS5Tx8igJF72EDImmMDBu0TQI8/YesP?=
 =?us-ascii?Q?Em5Bb10HptT2VWrXXsmOPVX04qhQrlEhMu0p0ovYhvy+9db8/bEknLZVo/QA?=
 =?us-ascii?Q?rJG/osoc26u+AYvHVsi/jQ1ySJZWL1gmF5plEVE+9ERUOgfCRf5IONP68Ldn?=
 =?us-ascii?Q?m//lZEeuwfnn+at43uHb82UxtLB0wtksKLZCMBpytl5q1ZMpehfrELap6NAK?=
 =?us-ascii?Q?yvdZj/DOZACpAmTJGFHBKE5qc6Vx2mIK07rXkj6L/dnOcAmXS33IlbvuXyyf?=
 =?us-ascii?Q?R/GyMvkY2ReRYxByrKcAkErM1nAdL8JOUfQPVwirR9qNGQTcEvIbQSTC7kgU?=
 =?us-ascii?Q?XVjDAtamYThzVfnhucMWih4sh188rars/jdEcoliymdBkNT6OsjVIGwH49dx?=
 =?us-ascii?Q?duUHe4UGZdQfN4xqZVQFWuzwAQi5KhFZIrcxAEP/28pGiCdgqerqy9wVy5c+?=
 =?us-ascii?Q?ofhccSLzcBOcoo3gxD57+t0JESwuO2+msigEFmwY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfaf35e-93e5-4313-bdbf-08ddf78c4491
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 14:53:17.5743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKrXv+hXdK3isTM3z/yIIWIbQEkatTUeYSZZ4RPSDY0iT9fUQALLo9+qhh/XksfrDjZTTMQkt1xQ5sNH9L6wCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8897
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

On Fri, Jul 04, 2025 at 05:03:50PM +0800, Liu Ying wrote:
> Add i.MX8qxp prefetch engine DT binding files to
> 'DRM DRIVERS FOR FREESCALE IMX8 DISPLAY CONTROLLER' section.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5bdae246605d2c3ea6ffe6c556efaf0eac742de1..b9a08556c1d94567cf00459b3a267e22d88776c2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8084,6 +8084,8 @@ L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc*.yaml
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
>  F:	drivers/gpu/drm/imx/dc/
>
>  DRM DRIVERS FOR FREESCALE IMX BRIDGE
>
> --
> 2.34.1
>
