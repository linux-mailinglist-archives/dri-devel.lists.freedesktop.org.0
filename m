Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FC6BD5512
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 19:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8603610E1CF;
	Mon, 13 Oct 2025 17:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="KPdK8gif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010066.outbound.protection.outlook.com [52.101.69.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B1A10E1CF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 17:01:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zau/W11gNta4ESRy/knkDPhUYOIE5BmrFyZRs3k/borZOdMWGBXze9EDcWe6Flt7GOjaLRYV0C/GDfAKhHuuzxzOFCnbCTVtxSUY2aNG5CCiSAwkJQQaoauap3dW0QYzyI1qztV6Xsu36bpBK53SEXhjz/m7FIEunpca47FMYimcMP5vMmwriTsR2/D5D7xCRBeWO0GPlofY9nn5gyP64uRHyYlQYNDA00lF7+5tYku7Daseerw9KB9sAVDUPvl/nNYao6imwZB4RoWmzfk5DlM6WL8X6V9fDZH3yn0Ft5U3NTyyDVp5hraJBNFgNjLJih3Ukds048HsQfunANn/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ezb6S1UAPFbTHXbLPdE1AuzxtCNDMNu0aVOAiaxrghc=;
 b=kaqkB796Zvk/rYmtrdPQ2FOcuTAgAvHdN/K7gz872UXFZMgsIB5h/4rpc+IJmelgb58PGq80PZHqw7FWrEZnxS83vAwZKjG49iyp6g/chrnR5gYg3xPIHCd/khrVYaKaYC2Q1/h2ClBApphH62m+3TE8cu7EcW/Ic4rxSTMYJkJrLjYLzYFIQ0GC4E+oX5wPtzzKH4qkWjbr/rzhOnGQ2yFkZCz/Aa37MbQHCtFlSV8eQB2G4TaHNGLGCfF7yAN7918pPUTD/56W6wGE7Fmly/M+5WmTwpp4L9/6dFw7Zn8V9lqokqAh5Lqia+Ja+uYFHICvnMB2kwMBtj0B7bQjXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ezb6S1UAPFbTHXbLPdE1AuzxtCNDMNu0aVOAiaxrghc=;
 b=KPdK8gifk5wOQB+I3SduR2tO1bVbP40y5rVssIFKAomBi1PR1mO67KG4SwqSGBayU8VzuAdbyfFPs1fcpul6yb6xIOHFIQNKRaQQm/ao4SCkf1h7EwAOUYJCi6lWzqJDP5Om0TKmLFAo3Dn/55HtSBFXBDE0cmK+CDoLc/0eHszU40W/otaw0QRmOtZPQBxih51IARBjpE6PFPzPrE+Q3LZhLfXQtFDBsY/egmruxiDBKrFZ6dD3GQTNoh0nox/fasq+EVEi6HRn7SXXH2Uop7W8BmCGrqHYT8pEf3Olv90SbZIV0fYRbstojy1dzzotgRS+lImbOdwkyxzGFIWKGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DU4PR04MB10551.eurprd04.prod.outlook.com (2603:10a6:10:588::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 17:01:12 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 17:01:12 +0000
Date: Mon, 13 Oct 2025 13:01:02 -0400
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
Subject: Re: [PATCH 07/39] drm/imx: dc: cf: Pass struct dc_subdev_info via OF
 match data
Message-ID: <aO0wTlSJ34g/qb4I@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-8-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-8-marek.vasut@mailbox.org>
X-ClientProxiedBy: BY3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:254::17) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DU4PR04MB10551:EE_
X-MS-Office365-Filtering-Correlation-Id: 966277d2-7fd1-48c7-58f8-08de0a7a1cd7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b9v8VkWpQe1FwHq7Fyqcm7bSvYczkmUa2d4TvTGNyGPv5ImelQ6ZQS9jGQMj?=
 =?us-ascii?Q?6zBqV92TrsFISrQiQyJvpnzt+11Xayg9W6w3Fdbtq3bKgbu1/FAu0RJugE+x?=
 =?us-ascii?Q?g2tyF0aHbecSqy2T4+e1JCW4NdEZdXzpA4j0R8koSy5Y/JeFlp7X0j/a7bOY?=
 =?us-ascii?Q?8KJ7/eHgxq+75OYw9FxUgvh0AvHiu9IjLxw5mHqsbS7vPsFDGXld8OerT4bD?=
 =?us-ascii?Q?xWViN/EPndHYik96v46vRk/2IuNrzlPFcEtkdOSf+vSb8OxVMl1cTqEOuA4d?=
 =?us-ascii?Q?zqSTmja0PQWZ+FFywwQ1WjvpR6z2rp6BbNQxQrmu9uKU3FipVwlAXA79p8C+?=
 =?us-ascii?Q?esHHKgj7qDFsIKHk9Lb1bxXdU9VB6x84BJF9iGrouzZj02Zt4HbH3tlkvCSn?=
 =?us-ascii?Q?4XGqgi6Z/yWXm5NGE+U93PyNzaJD3kYq0OoYE8FYBZQK4MwGH8l8Ni+0HfRe?=
 =?us-ascii?Q?t53/U2WhkbRwZBFvL0U/JUCRl+3g14iX7py20gOcJf3UFqcHOpAOtoM8lMF6?=
 =?us-ascii?Q?bLnIwQnL2cNLz8BsV2Je82j8kjAljJtoyc9lRJC9T0LjJX1RwHl0pz35s+Og?=
 =?us-ascii?Q?CCKSd05scMVOn7mKXZsX2/mlg5GQ2LdJ70Ha79C/GO11sELm1htgFSQ0VNsM?=
 =?us-ascii?Q?/6u2FPHigKJ+JQfFMYZLEjeMUHpk7ySVam5KADXV6Iw6bLJ51EOhUqLBs4rx?=
 =?us-ascii?Q?jeUxD8QAL2c/qiyueXllWsOdPQ8N95nSwDSGPATam+vvlgAri5LS4+JSY4v3?=
 =?us-ascii?Q?yZ9Qidgu00h9Kucei/H5KIIfJs0KgBlBfhPMyoF2vRU86oW3mpLpk9jQLjAD?=
 =?us-ascii?Q?U9nSrGvQrONDGcqhxbMf1BxVOHc/hw06j8NPDCH+3VLqZIAYejtzd5xWhY7D?=
 =?us-ascii?Q?pKLkOD6w7Fxom/WLr3yyli+c7muQPMZ4XSV0x4zENBm+YmH/HdAtmTnmnsHX?=
 =?us-ascii?Q?Bo8uKfd07n3xKvEen8iFQI0Q+N14TvcKVybsJCJCMrctnl/p/vVq60GzL0Dv?=
 =?us-ascii?Q?yhc3p4aLoWfZx3TdBNIRmlmybb4EvZ0AWgsx8UTcO2cmC4vze/plEFg8yPy+?=
 =?us-ascii?Q?+MWH28kOQ7QsefJ5RMECZJEBo2mxSHZSbreCKa/XfRZ8Mq5m6B+30V17m2KR?=
 =?us-ascii?Q?Gg9Paqi2TvntMsyrJ68jZL/B3TwuLqe/ZSbxLBcXknjZbPMgdFp3fEfKZodz?=
 =?us-ascii?Q?2ZPm6099dqMwv6M+NqBIQRx7CBGEeo2klw5BF15NHKySGCYow2ir0n2/hZfa?=
 =?us-ascii?Q?zfGjpDc1xd+DcVsHwX0eUnqV/6SPyoMayHWKc6SJHaU9hZWJsvdZhJoLWDKK?=
 =?us-ascii?Q?ht8XpVnSc6ZTDXEPLpUpdowYzs+kuBQMDjcv38OEB7O1w8AQStv6Udf7bBQW?=
 =?us-ascii?Q?rdGBAWHiWs+ktScVSoLjIVDEWoDZEuSeyYG+KgLANjooVWQ6CCI/z4j6wWKP?=
 =?us-ascii?Q?fpefmWTSb77aceeMnCuvtpCIRK4kAgl0ieaItdmiAF2X3G3LCJI3ZuDTDpUx?=
 =?us-ascii?Q?R5mPJP6rg7l/ETEeP/Hn9qOcxXUBZMZCZy2F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SR6wqOYHwweXisNO/4/xr6Ih/TCykEhsASdORhf/cBdLzgOAx4Wp6X7y2F2W?=
 =?us-ascii?Q?rubbmHC8ENR9lqgoT3mA02Dd3QwrN3WtW0ricDYvmnLmj0Qt8FSby6DvdPQ2?=
 =?us-ascii?Q?EB4lJf0/DOGTu7ijIKdHtMjJZMejyT+AYAYjGDoOQnXUJ7FInbFuhZG9ayNn?=
 =?us-ascii?Q?PIFdRwXUsUnnDRPULNa5fu2hPTl7ZoMtn3MuMCGcMWtppK92HEUaRJUha6BP?=
 =?us-ascii?Q?WODxnvT6w6P5GF5Wl2vr8CwAGOCwVDdOKcAhP5qjM9hjvO7k9eCzT/btz6I9?=
 =?us-ascii?Q?JZNhYsu77PSqBgc5Y4wew1Xky+BZvYmazjdZQVYyyMvBKsuYoC6chuKBZj9k?=
 =?us-ascii?Q?hxncEk6OY995HL/NmULHxljujdfhJ0N8cP7gU+/6n0lVFGnpSv/FjJ5fctja?=
 =?us-ascii?Q?Z2bZFAUDTOmmOu+8qJuT8InLILeZJpHK34YqB547xCHB/ekOzrsQwcxNdTNi?=
 =?us-ascii?Q?jvOwNk0idYqJ8uu7a+pXMwKxLkMdBayfG35KEhBK3ZSAdjcewML5ceFGvUlp?=
 =?us-ascii?Q?wyC7bp8JYB92WSFyV+Rc2vjk6szgGe3S4Y/EJ9guL7KD+YyVCOKWgpI5Z1RL?=
 =?us-ascii?Q?cGRkfQCj7tOEvFB7L3lhQHohskOncUnqMAaTDQpSOJOsX7tSFvS2O5j8FrK2?=
 =?us-ascii?Q?mqiMi+vWjgRN9rIv0BXthoEK6TZl5h8caqn+9TMD0TBv6RiY7cGpccqQ8bn+?=
 =?us-ascii?Q?qa5LKIv6VDCLbCSOXqqOatvhLTmvCQpaiSCMVWpuMHOdBoa+MRTVsi5tdBo/?=
 =?us-ascii?Q?0ZoH5uvgUPjL8gFelCqKGp9a4z/jNsMLlwxz2ZWWK03JutRMm4upxvHshS8y?=
 =?us-ascii?Q?rQDPHoEY6n1AcWwvtCQRslnznR+evzDZJBNyTiJg6V+GnmD3vM9vTrt58tZd?=
 =?us-ascii?Q?PdmD20VAeodbRr6fx8+/AmmOSIy5QiVCt0PCavHG6OBLHeseS65uKyU6NcMM?=
 =?us-ascii?Q?jlEawsuWwiOR+tPxpV3b/l7Jrl1E+g/67/KuJPzZsq1HqM0ADkuMioCd5b26?=
 =?us-ascii?Q?oTx18mSNfgvI8zxBGCO7iAz3Fp7UrorsJCVuWdohkGy96+4yhbQjZ/usSzY2?=
 =?us-ascii?Q?9jyDCBjcvCXxukvjXchiKQZaJyv9UQaxT9VXwXrVxKfFtPPlZ3Lp8GGKBJuX?=
 =?us-ascii?Q?2NCNaha0Of6hCaFZsTMyd/YlpZcNbannSPy0c+WbBEXl9w3hH8gGA3PAYL/R?=
 =?us-ascii?Q?5/Mtgf/CUylMjKMmRjYJsIXvpyNDmjwSe/8E3gTPDaoGX27kXyahCfR8PxVl?=
 =?us-ascii?Q?1uKzFgzzLfkTMve2TiPYiLYVifL1V5pU831C63qIvaiM3d6aqj8B9IiQhyIn?=
 =?us-ascii?Q?QEe70e20F4p00ruXeH3QzQgqRPyfdGvZfqbq+onc49oYUQ0SKLEAtB3UMlP1?=
 =?us-ascii?Q?ZEl+oscZTFrIAezlWNDr2ZurFgY46KSH73mPDw1A5kjbBh2wAeO1Q5qhyDyc?=
 =?us-ascii?Q?i4iSeX+ucXiswgO8CS2oihJqkal1T6U0bWCVYSNiYu4kKaJZste4PAi1rz5d?=
 =?us-ascii?Q?E+8KE7SrXMlEn2G10mDKQZBBCScic8KGnBo2pI4vV6pO1JXx0fEwzmDQlCQA?=
 =?us-ascii?Q?NM+w+11gN7V6f9Im/3C+Cm3AbbzK+i5AGZDK91wv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 966277d2-7fd1-48c7-58f8-08de0a7a1cd7
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 17:01:12.1630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRaCkD+gI/UmLb68cvjdBgUXXGn+aVh5fOEXvVkeHx9Hk6O3L5MORszGL/HsmRU7NMM5wBNgo43+vimnnPvxjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10551
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

On Sat, Oct 11, 2025 at 06:51:22PM +0200, Marek Vasut wrote:
> Pass the struct dc_subdev_info as OF match data into the driver,
> so the driver can use the match data to correct map addresses to
> IDs. This is a preparatory patch for i.MX95 addition. No functional
> change.
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
>  drivers/gpu/drm/imx/dc/dc-cf.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-cf.c b/drivers/gpu/drm/imx/dc/dc-cf.c
> index 6cb83182a3668..1d3602c5d4230 100644
> --- a/drivers/gpu/drm/imx/dc/dc-cf.c
> +++ b/drivers/gpu/drm/imx/dc/dc-cf.c
> @@ -10,6 +10,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>
>  #include "dc-drv.h"
> @@ -24,7 +25,13 @@
>  #define CONSTANTCOLOR		0x10
>  #define  BLUE(x)		FIELD_PREP(GENMASK(15, 8), (x))
>
> -static const struct dc_subdev_info dc_cf_info[] = {
> +struct dc_cf_subdev_match_data {
> +	enum dc_link_id			link_cf4;
> +	enum dc_link_id			link_cf5;
> +	const struct dc_subdev_info	*info;
> +};
> +
> +static const struct dc_subdev_info dc_cf_info_imx8qxp[] = {
>  	{ .reg_start = 0x56180960, .id = 0, },
>  	{ .reg_start = 0x561809e0, .id = 1, },
>  	{ .reg_start = 0x561809a0, .id = 4, },
> @@ -32,6 +39,12 @@ static const struct dc_subdev_info dc_cf_info[] = {
>  	{ /* sentinel */ },
>  };
>
> +static const struct dc_cf_subdev_match_data dc_cf_match_data_imx8qxp = {
> +	.link_cf4 = LINK_ID_CONSTFRAME4_MX8QXP,
> +	.link_cf5 = LINK_ID_CONSTFRAME5_MX8QXP,
> +	.info = dc_cf_info_imx8qxp,
> +};
> +
>  static const struct regmap_range dc_cf_regmap_ranges[] = {
>  	regmap_reg_range(STATICCONTROL, CONSTANTCOLOR),
>  };
> @@ -85,6 +98,8 @@ void dc_cf_init(struct dc_cf *cf)
>
>  static int dc_cf_bind(struct device *dev, struct device *master, void *data)
>  {
> +	const struct dc_cf_subdev_match_data *dc_cf_match_data = device_get_match_data(dev);
> +	const struct dc_subdev_info *dc_cf_info = dc_cf_match_data->info;
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct dc_drm_device *dc_drm = data;
>  	struct resource *res_pec;
> @@ -123,11 +138,11 @@ static int dc_cf_bind(struct device *dev, struct device *master, void *data)
>  		dc_drm->cf_cont[1] = cf;
>  		break;
>  	case 4:
> -		cf->link = LINK_ID_CONSTFRAME4_MX8QXP;
> +		cf->link = dc_cf_match_data->link_cf4;
>  		dc_drm->cf_safe[0] = cf;
>  		break;
>  	case 5:
> -		cf->link = LINK_ID_CONSTFRAME5_MX8QXP;
> +		cf->link = dc_cf_match_data->link_cf5;
>  		dc_drm->cf_safe[1] = cf;
>  		break;
>  	}
> @@ -157,7 +172,7 @@ static void dc_cf_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id dc_cf_dt_ids[] = {
> -	{ .compatible = "fsl,imx8qxp-dc-constframe" },
> +	{ .compatible = "fsl,imx8qxp-dc-constframe", .data = &dc_cf_match_data_imx8qxp },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dc_cf_dt_ids);
> --
> 2.51.0
>
