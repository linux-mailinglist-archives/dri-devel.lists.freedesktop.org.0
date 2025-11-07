Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F4DC40ACE
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 16:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022B110E0E4;
	Fri,  7 Nov 2025 15:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="dXXeKQxa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012001.outbound.protection.outlook.com [52.101.66.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E4C10E0E4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 15:51:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKXlbPiduwxrkyvdJHLL6tplJeStKoiPlFY+gmyq2rqQvtwEnV6tc3OuI63LHEO5LCzPxQ0AWjrJJkjFAVkc6C5i+kwm2tvmidKhskTy01875nXLcEDcMlosO95XMBPQmbsOB5Vfv4FQqV0UhXlS6p+J8W85DR0sy9t8SHRQtbtMew9V3Hae4IpHMqqQE+L4JN5S+V2XxsH9xxLTD0px0RHgNT+sTOD10Guv2PD1DkQlOuWO2jBy4553GqWR7gVq3QaStZ8lAnbuXWTvnJkwCw5oxBSPFIl+dCCPSJ5hJMatHymYX5MLYwLZFPV455iweao6702dRwG/tbowjE54/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOuumwx74E/Crx5Q7u7GEctGQ1qytr7IkJwq2FULGX0=;
 b=jujUv9awWaFonAOPuK1N46Wy88WMOg4j/LkUnklcUZ/SMebIaTDL3StlqhabuLIiUU2Yyns0OnsrgcLa8iRHAA++ablhKnfRXyF0SFi/wy8UdtTbWLSzfdETRTeY/zJMIvp9xUxjaf98AoHZzq8Vvqw0nLsZ11JSiRscpWZ8v0anQX13jasSA52cn+2DLWoUtmOdOdNiPENAxhLdnNGQiqha0JMGJya1tDPbTPHsN5/DQm8C6QVMqgObZHHPLBCmdgvJ+FRfrFSd6mD7heoNAMrtdNdWETk6FYmACRzXkBapMk07Egc3dVsPAYfR2DUqBjZXYcvT+F/kBjWz9RqcXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOuumwx74E/Crx5Q7u7GEctGQ1qytr7IkJwq2FULGX0=;
 b=dXXeKQxaHtvOLMhR6gDPcD2cXn7GB0Ce8HNgep21QJpM6TFqh6/ZohUN5jb+FEI1IoisCa1nRhxWcb39a6dZL2itk2y4iX30Svc25DCMnyJXVmaPFTMeSR3AGvvTA800mL9cDUiOqucdSKY+BzpzSZxj1TcX2DTF9iCMrvC0OkLvgKYiG9w888HMZl5BNpbMRLxbcTMR7kX+mGEyzCAOJTOQ3IzbtkvBf3F5hE8zekMWxga+FgC3WHV3JnQJYmrCHBgLMlQfoxgux9KZQZhxKwDQHYWtoVVsInqXCJ+60sLt6yXag7fYrSON3600U+TxQZRnHqcJF3b5XAV78OnchA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PAXPR04MB8077.eurprd04.prod.outlook.com (2603:10a6:102:1c3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 15:51:22 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 15:51:22 +0000
Date: Fri, 7 Nov 2025 10:51:11 -0500
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlighty
Message-ID: <aQ4Vb4eUmSX0Nj6+@lizhi-Precision-Tower-5810>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
X-ClientProxiedBy: SJ0PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::13) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PAXPR04MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: ee77eb30-ecb7-47ba-bcdd-08de1e157fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G8KnTDEnw9E1YcpLbiiw9H6QWwUDJGIvjtlGHapJ/Xh3Nh54eH3M2wfoVW/T?=
 =?us-ascii?Q?9WUAhqauEie7xim9Wn68mrzgXomSNEzxeNc4ylbVQ8LCe+7iyw8cB5NMIWRM?=
 =?us-ascii?Q?is6N5p+jkYZ3+8D7d9E1Snho/UaTtIJ7SwTUx2NX46W1LGjYO47jlAJJXAHC?=
 =?us-ascii?Q?v9PgL+/Y4GOBReZ/G+20ru5XaRn0hhPzpFIEEfXnZ8inlA7ih8LtFmka0qt8?=
 =?us-ascii?Q?YnIeZXtuvIQbXYHGVDs7CU/K/wx8okCUtcy9kMl95eIuEcYgYwM+daJzHtXl?=
 =?us-ascii?Q?PXYgOXtI7t8VbNlMypx28Wv8Jp0nMEPIoq5kDcuuFd/MIYEDJhEmfaRVy5O5?=
 =?us-ascii?Q?+NqVb/4MAxlIQrnWEOUw/CvPtE/krDmFhx+XnHYf9BNH6EmmrFXE91sbbN1I?=
 =?us-ascii?Q?I24lQElZN4kkL/C4laR4zsRGb5ltk38aUUkvmfU0N3pd9vbTYgkFdRkTxzwj?=
 =?us-ascii?Q?gi/a6nV3Sm2RRTQJYH6c9aGlQFo/4TEDL0jLvygJ02Geq92+Tnh5IqKE9mbh?=
 =?us-ascii?Q?MDomNF7HeyfohAU71XUt9nY5pGon7SeXhj7aujtBzKWWntBOs+yi+431/33a?=
 =?us-ascii?Q?DsFpsRocHouSMq66XEuPaxv/7UUj3/wUz/8VwMCrn77E0BE73CH9Ha7g/ajl?=
 =?us-ascii?Q?O7/nFVmXpXJOCBuVN7/Fsa11JqAW05MlDksmXfQrHsbbGSncsYGgU3xqj6Ai?=
 =?us-ascii?Q?9WBwLsyHFOQPtKmPWaypANjvNu3G831MCUjjRZzlNHUzKVZ2BgUcW9m3Ckwf?=
 =?us-ascii?Q?LLBPzOi1C3ObXV1opqWl1SbgPlm2TmJ7CHD3WfHXLfR1yruGU1Ie1rHc604s?=
 =?us-ascii?Q?w5AkLfiWqEc+7hXnY0vk50Gjd+GoX1zmfoPY4lOPPsMjEiUTdvmQqJUEUtPx?=
 =?us-ascii?Q?WJ/J7Wc6IBUCWwcamWSZ94EqDBRz0rz1BdWtjE0mxDEMJmJ+cY7PV4Bt9Brk?=
 =?us-ascii?Q?H6NdlPh2uK6kgh9geKCAi69LrJY/wehVu0WRjARhPwCwTwRrc5aSbNrsCTS3?=
 =?us-ascii?Q?p4KQJD/v7xIpU2dMxL6q6QnOSvH90xYMvlx/BcP7kAtmc4n03MU10hN5xQZR?=
 =?us-ascii?Q?+TVuaBiV1lKH/GwxrCgP+pa8691205aAF15MfDSog23guef3cxYMoM73rgcv?=
 =?us-ascii?Q?e2Tbj+8hOs1K/nGkHhnyrO9nzsPL7Hm1PzxqmxirebQ6XhZ2l4acSYIs6vfH?=
 =?us-ascii?Q?CK3p9ALGSHGG0KeGFVxBl4U88ZOuWh4dKrB/t5uBHiYVHo8hNzVfxGWilCpE?=
 =?us-ascii?Q?ES7UvsFIsf8gBR5bwEvbLcebzt4sM6yWZzjIMDvgkCHw/PVzY+Vv1V7FSe0k?=
 =?us-ascii?Q?kEYxx6qjCs0xAd1MFGO59Zqdm5TTyPS+46954Bft68FCcKkDzAk7Bm8K+a3Z?=
 =?us-ascii?Q?earwXGGKjhYROddCxKAF75k4bQ2vQaD01mtMLRb/rvhn77sRf940vhgpKjBb?=
 =?us-ascii?Q?pXChFR+FSkysRndklWM0O+XE2iW5OSz0/e8CqcwKb1YX4lRexep1AWCcXuvU?=
 =?us-ascii?Q?1nrrmNp/TiLVjT2SzkhxnQXHODZIk2vrcIXJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DWBH3RLIl6EQKAoIIz7CB4YFb6bfgQy4FugDj3gf6XB6rwHuq19qePMbACVx?=
 =?us-ascii?Q?S2UXlbMAzpW3ahQVKy1w/PbsmYmQG80uxCDYzLS+jIaIf/wpLdVuBK0Qd6TJ?=
 =?us-ascii?Q?C1vuRIODsdjA9NshrgtIl141hcoJq1RxXX7XmOJndVswy9InHl0xm5Gcubg+?=
 =?us-ascii?Q?Ncr52FiTxk4mwNnEw8YpRTeVbFDG9oQH0TKeq83DsWXq2OIHcM8LgXWyQC28?=
 =?us-ascii?Q?8KXhgMqx7krnRfUbl4g6VOuahOx5QOB2G0Gl2eADWgGDLfNI2Z1OqhpzQkye?=
 =?us-ascii?Q?quRhekUDamDPt6VvAlY6rRi6Wlv4c2LPiRAAD029hEO53lppxJZv2uQuzB/b?=
 =?us-ascii?Q?k+QzU58Jk/QTmUZczSGjOuTDcIm6BqCRX50aG3duMVUR6PaqYatmI9p4ayMb?=
 =?us-ascii?Q?RWPvuwQjyTXY6cqvRvMCJ1iKAB6xsHqvE0TMon33PGlGh1vBX54pTBRz2Td7?=
 =?us-ascii?Q?aaoqctV7dPSW362LtwxaSk8y3oB+HuPtuzXiAufX/P3wQniWClA64x/yZMAA?=
 =?us-ascii?Q?qaDripsDWrDcqGZ7ZbzuUk+vDcL/LMFOTWh6sD4jhv6m351vMOtew3mJNVjv?=
 =?us-ascii?Q?K4PVk/r9iMlKAQB3aRiQvkPVGesJT7EN+Ms6xG6YIOWaa418gjQN0JdtBBX9?=
 =?us-ascii?Q?emrk4KdHnnSTITTwjfvqFvGUF7F8Q1RaELlNEhru8xLUHv3+pnhxtD9HxJJf?=
 =?us-ascii?Q?LjNJwUkHHrxe5jEe9PH3u3cIClra7vU7ewDKmntqllRu8LhzcIYBtivXito7?=
 =?us-ascii?Q?FtV6pCcgQsQuPmdAJaTFBlbUSWulLV88E9W/MhPiZ05ZUlk0VpnJtCme87f9?=
 =?us-ascii?Q?++/u4ELlEyAzfrYmysh+4gNyGW9YW8jbjwRgekajHXAsKXqgetv29zvssTU5?=
 =?us-ascii?Q?RZJ8b8Xd3uC99dBSwre8Er+zrd9lAFMGAXg+lbhkFaHAGMsGBOhu9yyY/Wsf?=
 =?us-ascii?Q?y3CFslvsQtfk7FATCG6p+ssRO7AEIDdPB4oKpuyFvSOJ5VJyrIhntBDU7sQw?=
 =?us-ascii?Q?PcZydWgAsmdH3tm++QJi2vDmHo6vM0kdyBm2VKofliz25fuAgFIdcFPHaIls?=
 =?us-ascii?Q?0/1zNSgEYXD4F5ybk+ra4vRWaBLCavHT6VxTMpQ5sGYvjTUjK6zQ1LAZSxjE?=
 =?us-ascii?Q?xjat4rzb830U7Pa4tQZgW4B9o+pnWDbQr18QkZcIPjBH1xArzFRQ8RDSqljN?=
 =?us-ascii?Q?Io+5rCxnTS5xmWf/sH6Rwx8oIhyTdS050HU62k39fqPWTu7kzzmvLfbJ1EO1?=
 =?us-ascii?Q?Hmhr7xpsAFWhdGHqEu2VC2IXuCWw1Ehxcd775spxci+yTiN+BcYP1q1Fs25x?=
 =?us-ascii?Q?NK78jwdbuNhGzMnR2CRZmJ9Xwz+X2Qgz6If4wZbu6Lo/kIt9PmmFkaiSW46a?=
 =?us-ascii?Q?JNbLZu3V57sBSm9VejjJ7vuL8wpVd+P42jk3yJEdUw8qYXn2fq3kYsVYxupi?=
 =?us-ascii?Q?a88N4DNkjH3q2QQPeg7R/Oorlkm+c5rOiNutfokfxvvN552t2uIn+R1wKh+g?=
 =?us-ascii?Q?9JNTauquAEs78pa0Qxd7yOv7O2pQpQ0u3VsF3LLKC05gZXbnEP+KNyrEYJbf?=
 =?us-ascii?Q?Fyw3nba1d82ZxNbQWyE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee77eb30-ecb7-47ba-bcdd-08de1e157fae
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 15:51:21.9862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlOyp4AG9Qwn+rmdyM8GJf6i58i/5a+QYe+odocw60GTpmzXXQYolcqHvBLYuzIeLXfJyJaBFnkcEACwcbZ/iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8077
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

On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  MAINTAINERS                        |   1 +
>  drivers/video/backlight/Kconfig    |   7 +
>  drivers/video/backlight/Makefile   |   1 +
>  drivers/video/backlight/max25014.c | 409 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 418 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 606ce086f758..d082d3f8cfae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15265,6 +15265,7 @@ MAX25014 BACKLIGHT DRIVER
>  M:	Maud Spierings <maudspierings@gocontroll.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> +F:	drivers/video/backlight/max25014.c
>
>  MAX31335 RTC DRIVER
>  M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index d9374d208cee..d3bb6ccd4185 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -262,6 +262,13 @@ config BACKLIGHT_DA9052
>  	help
>  	  Enable the Backlight Driver for DA9052-BC and DA9053-AA/Bx PMICs.
>
> +config BACKLIGHT_MAX25014
> +	tristate "Backlight driver for the Maxim MAX25014 chip"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  If you are using a MAX25014 chip as a backlight driver say Y to enable it.
> +
>  config BACKLIGHT_MAX8925
>  	tristate "Backlight driver for MAX8925"
>  	depends on MFD_MAX8925
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index dfbb169bf6ea..1170d9ec40b8 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_BACKLIGHT_LOCOMO)		+= locomolcd.o
>  obj-$(CONFIG_BACKLIGHT_LP855X)		+= lp855x_bl.o
>  obj-$(CONFIG_BACKLIGHT_LP8788)		+= lp8788_bl.o
>  obj-$(CONFIG_BACKLIGHT_LV5207LP)	+= lv5207lp.o
> +obj-$(CONFIG_BACKLIGHT_MAX25014)	+= max25014.o
>  obj-$(CONFIG_BACKLIGHT_MAX8925)		+= max8925_bl.o
>  obj-$(CONFIG_BACKLIGHT_MP3309C)		+= mp3309c.o
>  obj-$(CONFIG_BACKLIGHT_MT6370)		+= mt6370-backlight.o
> diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
> new file mode 100644
> index 000000000000..36bae508697e
> --- /dev/null
...
> +
> +struct max25014 {
> +	struct i2c_client *client;
> +	struct backlight_device *bl;
> +	struct regmap *regmap;
> +	struct gpio_desc *enable;
> +	struct regulator *vin; /* regulator for boost converter Vin rail */
> +	uint32_t iset;
> +	uint8_t strings_mask;
> +};
> +
> +static const struct regmap_config max25014_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = MAX25014_DIAG,
> +};
> +
> +/**
> + * @brief control the brightness with i2c registers
> + *
> + * @param regmap trivial
> + * @param brt brightness
> + * @return int
> + */
> +static int max25014_register_control(struct regmap *regmap, uint32_t brt)
> +{
> +	uint32_t reg = TON_STEP * brt;
> +	int ret;
> +	/*
> +	 * 18 bit number lowest, 2 bits in first register,
> +	 * next lowest 8 in the L register, next 8 in the H register
> +	 * Seemingly setting the strength of only one string controls all of
> +	 * them, individual settings don't affect the outcome.
> +	 */
> +
> +	ret = regmap_write(regmap, MAX25014_TON_1_4_LSB, reg & 0b00000011);
> +	if (ret != 0)

if (ret), check others regmap_*()

> +		return ret;
> +	ret = regmap_write(regmap, MAX25014_TON1L, (reg >> 2) & 0b11111111);
> +	if (ret != 0)
> +		return ret;
> +	return regmap_write(regmap, MAX25014_TON1H, (reg >> 10) & 0b11111111);
> +}
> +
> +static int max25014_check_errors(struct max25014 *maxim)
> +{
> +	uint8_t i;
> +	int ret;
> +	uint32_t val;
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_OPEN, &val);
> +	if (ret != 0)
> +		return ret;
> +	if (val > 0) {

uint32 always >= 0

So
	if (val)

> +		dev_err(&maxim->client->dev, "Open led strings detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
> +	if (ret != 0)
> +		return ret;
> +	if (val > 0) {
> +		dev_err(&maxim->client->dev, "Short to ground detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
> +	if (ret != 0)
> +		return ret;
> +	if (val > 0) {
> +		dev_err(&maxim->client->dev, "Shorted led detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_DIAG, &val);
> +	if (ret != 0)
> +		return ret;
> +	/*
> +	 * The HW_RST bit always starts at 1 after power up.
> +	 * It is reset on first read, does not indicate an error.
> +	 */
> +	if (val > 0 && val != MAX25014_DIAG_HW_RST) {
> +		if (val & 0b1)

BIT(0)

> +			dev_err(&maxim->client->dev,
> +				"Overtemperature shutdown\n");
> +		if (val & 0b10)
> +			dev_err(&maxim->client->dev,
> +				 "Chip is getting too hot (>125C)\n");
> +		if (val & 0b1000)
> +			dev_err(&maxim->client->dev,
> +				"Boost converter overvoltage\n");
> +		if (val & 0b10000)
> +			dev_err(&maxim->client->dev,
> +				"Boost converter undervoltage\n");
> +		if (val & 0b100000)
> +			dev_err(&maxim->client->dev, "IREF out of range\n");
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
...
> +static int max25014_parse_dt(struct max25014 *maxim,
> +			     uint32_t *initial_brightness)
> +{
> +	struct device *dev = &maxim->client->dev;
> +	struct device_node *node = dev->of_node;
> +	struct fwnode_handle *child;
> +	uint32_t strings[4];
> +	int res, i;
> +
> +	if (!node) {
> +		dev_err(dev, "no platform data\n");
> +		return -EINVAL;
> +	}

call from probe, check other place

	return dev_err_probe()

> +
> +	child = device_get_next_child_node(dev, NULL);
> +	if (child) {
> +		res = fwnode_property_count_u32(child, "led-sources");
> +		if (res > 0) {
> +			fwnode_property_read_u32_array(child, "led-sources",
> +						       strings, res);
> +
> +			/* set all strings as disabled, then enable those in led-sources*/
> +			maxim->strings_mask = 0xf;
> +			for (i = 0; i < res; i++) {
> +				if (strings[i] <= 4)
> +					maxim->strings_mask &= ~BIT(strings[i]);
> +			}
> +		}
> +
> +		fwnode_property_read_u32(child, "default-brightness",
> +					 initial_brightness);
> +
> +		fwnode_handle_put(child);
> +	}
> +
> +	maxim->iset = MAX25014_ISET_DEFAULT_100;
> +	of_property_read_u32(node, "maxim,iset", &maxim->iset);
> +
> +	if (maxim->iset < 0 || maxim->iset > 15) {
> +		dev_err(dev,
> +			"Invalid iset, should be a value from 0-15, entered was %d\n",
> +			maxim->iset);
> +		return -EINVAL;
> +	}
> +
> +	if (*initial_brightness < 0 || *initial_brightness > 100) {
> +		dev_err(dev,
> +			"Invalid initial brightness, should be a value from 0-100, entered was %d\n",
> +			*initial_brightness);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max25014_probe(struct i2c_client *cl)
> +{
> +	struct backlight_device *bl;
> +	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
> +	struct max25014 *maxim;
> +	struct backlight_properties props;
> +	int ret;
> +	uint32_t initial_brightness = 50;

try keep reverise christmas order

> +
> +	maxim = devm_kzalloc(&cl->dev, sizeof(struct max25014), GFP_KERNEL);
> +	if (!maxim)
> +		return -ENOMEM;
> +
> +	maxim->client = cl;
> +
> +	ret = max25014_parse_dt(maxim, &initial_brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	maxim->vin = devm_regulator_get_optional(&maxim->client->dev, "power");
> +	if (IS_ERR(maxim->vin)) {
> +		if (PTR_ERR(maxim->vin) == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		maxim->vin = NULL;
> +	}
> +
> +	if (maxim->vin) {
> +		ret = regulator_enable(maxim->vin);
> +		if (ret < 0) {
> +			dev_err(&maxim->client->dev,
> +				"failed to enable Vin: %d\n", ret);
> +			return ret;
> +		}
> +	}

use devm_regulator_get_enable_optional() to combine devm_regulator_get_optional()
and regulator_enable() to one call.

> +
> +	maxim->enable = devm_gpiod_get_optional(&maxim->client->dev, "enable",
> +						GPIOD_ASIS);
> +	if (IS_ERR(maxim->enable)) {
> +		ret = PTR_ERR(maxim->enable);
> +		dev_err(&maxim->client->dev, "failed to get enable gpio: %d\n",
> +			ret);
> +		goto disable_vin;
> +	}
> +
> +	if (maxim->enable)
> +		gpiod_set_value_cansleep(maxim->enable, 1);

gpiod_set_value_cansleep() tolerate NULL, so needn't if check here

and if you pass GPIOD_OUT_HIGH at devm_gpiod_get_optional(), needn't call
this function.

> +
> +	/* Enable can be tied to vin rail wait if either is available */
> +	if (maxim->enable || maxim->vin) {
> +		/* Datasheet Electrical Characteristics tSTARTUP 2ms */
> +		usleep_range(2000, 2500);

now perfer use fsleep()

Frank
> +	}
> +
> +	maxim->regmap = devm_regmap_init_i2c(cl, &max25014_regmap_config);
> +	if (IS_ERR(maxim->regmap)) {
> +		ret = PTR_ERR(maxim->regmap);
> +		dev_err(&maxim->client->dev,
> +			"failed to initialize the i2c regmap: %d\n", ret);
> +		goto disable_full;
> +	}
> +
> +	i2c_set_clientdata(cl, maxim);
> +
> +	ret = max25014_check_errors(maxim);
> +	if (ret) { /* error is already reported in the above function */
> +		goto disable_full;
> +	}
> +
> +	ret = max25014_configure(maxim);
> +	if (ret) {
> +		dev_err(&maxim->client->dev, "device config err: %d", ret);
> +		goto disable_full;
> +	}
> +
> +	memset(&props, 0, sizeof(props));
> +	props.type = BACKLIGHT_PLATFORM;
> +	props.max_brightness = MAX_BRIGHTNESS;
> +	props.brightness = initial_brightness;
> +	props.scale = BACKLIGHT_SCALE_LINEAR;
> +
> +	bl = devm_backlight_device_register(&maxim->client->dev, id->name,
> +					    &maxim->client->dev, maxim,
> +					    &max25014_bl_ops, &props);
> +	if (IS_ERR(bl))
> +		return PTR_ERR(bl);
> +
> +	maxim->bl = bl;
> +
> +	return 0;
> +
> +disable_full:
> +	if (maxim->enable)
> +		gpiod_set_value_cansleep(maxim->enable, 0);
> +disable_vin:
> +	if (maxim->vin)
> +		regulator_disable(maxim->vin);
> +	return ret;
> +}
> +
> +static void max25014_remove(struct i2c_client *cl)
> +{
> +	struct max25014 *maxim = i2c_get_clientdata(cl);
> +
> +	maxim->bl->props.brightness = 0;
> +	max25014_update_status(maxim->bl);
> +	if (maxim->enable)
> +		gpiod_set_value_cansleep(maxim->enable, 0);
> +	if (maxim->vin)
> +		regulator_disable(maxim->vin);
> +}
> +
> +static const struct of_device_id max25014_dt_ids[] = {
> +	{ .compatible = "maxim,max25014", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max25014_dt_ids);
> +
> +static const struct i2c_device_id max25014_ids[] = {
> +	{ "max25014" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max25014_ids);
> +
> +static struct i2c_driver max25014_driver = {
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.of_match_table = of_match_ptr(max25014_dt_ids),
> +	},
> +	.probe = max25014_probe,
> +	.remove = max25014_remove,
> +	.id_table = max25014_ids,
> +};
> +module_i2c_driver(max25014_driver);
> +
> +MODULE_DESCRIPTION("Maxim MAX25014 backlight driver");
> +MODULE_AUTHOR("Maud Spierings <maudspierings@gocontroll.com>");
> +MODULE_LICENSE("GPL");
>
> --
> 2.51.2
>
>
