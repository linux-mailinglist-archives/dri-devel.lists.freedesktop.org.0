Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCC164F841
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 09:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465BF10E0B4;
	Sat, 17 Dec 2022 08:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2088.outbound.protection.outlook.com [40.107.241.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22EE10E0B4
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Dec 2022 08:30:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bd7PlkRIrLkcdb0wi8aPw5mGjKCREztKqgDf7YicE8COeQ30D5aYoP7BBkwDtWNomLdCZk3RTTWSyYCbad+z59pN1dg8Zj+AObzK2GWmNL+AJHXRERtfdy3pyEaIFwm60H/T8BBVN04hGgXCHpqJH5KnD8VGv27x1PIpFarhg5pAyAUNOB16Xh8dpx45PGZHJ+ZsaNw736C1un7PR9lTrsKecrWaM88kG0NmurAOcyFQpByR4pvc393OC4RA1pGc4+B1+cBritFQ2Pwr6rzlI8+W6GPko+1Q0i8KGIkB1KFc6xruxrg+9W/OJxucEUhX3Jkk56PIe7dPe1t6OK+p7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sd8sy3hMo3wy+o41tkaRE2ZczvGH9G6vjYuRX/zH+zM=;
 b=E/7GIQ3eYJxXXRjFrdsaX2H796pXPSm8zhXoh/WthnnETrGxTOdtfnuihxjUPl94KfV4tVRhP3n4j8RnqUGR3EFimH57wpJsZUtsxxIx57uZGS5p1obXcW7BsOZxt/ogleiyZko4u6JsOFynVHFE92vZyJGzXLoELnE80zTSNKYxJ6ODHXpniLWpNhHqIKZsD5swzbk9ulnAaBaGgv8FKyidgjViZ5RMUeXf4c9HuG6C7ePXK4ucQrYGIu8KmA/dQDUCxL42aeol7sth3LLTDWXxSDfRzZ6hgh8iD0CSMeYguV+KlRIoUZVdUl0zXhNvI/hNgT5yhre/SCM8DBtGpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sd8sy3hMo3wy+o41tkaRE2ZczvGH9G6vjYuRX/zH+zM=;
 b=YILvhKhq4I/1gxdYPLvDhBuKkeqwKFDLddIX9kEr0NNoGRoYld3sEUE5pPtbPaPUU0NjeuzRjdblk3JpMSGHqw0Mq9JQNrO8vODJWk7ztH2BVzMuahXTtf2YbFeL206Ty05rM758oXyUohOS0JYX0Db/VoJcJ+/VeYTAScM4YDQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7889.eurprd04.prod.outlook.com (2603:10a6:20b:24c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Sat, 17 Dec
 2022 08:30:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ce5b:991d:5f5e:388]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ce5b:991d:5f5e:388%7]) with mapi id 15.20.5924.016; Sat, 17 Dec 2022
 08:30:03 +0000
Message-ID: <eb199fc25e7cc6d76677225929cf3ad3ca9d410d.camel@nxp.com>
Subject: Re: [PATCH v2 2/4] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI
From: Liu Ying <victor.liu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 17 Dec 2022 16:29:27 +0800
In-Reply-To: <20221216210742.3233382-2-l.stach@pengutronix.de>
References: <20221216210742.3233382-1-l.stach@pengutronix.de>
 <20221216210742.3233382-2-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM8PR04MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 632333e6-d9ac-4edb-715f-08dae008e4d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iBj7NfpKFYRZaklB9eSCUwjsnEBgqo3w5/CY21sqUvz9G+52K8P5wtvAANwAF8nQUXbzGsGIY7KruZSxlIpzzRpCogqs3FINV3ZZy6MG9YekgE+0+0o+phE4s/Lt+OAjn9OYxmEB55hNrmu1NOzaA5dCrdmwvOR7bhxVHoVPVmwBCnal8gH7duJjtt5OSw+t4aTmR+1Rn9xPCUfrY4aJgix/i67qBAjekGolAJGPrypNSIDMPKstpnoPXI4HbSmYCioBmO9KOTWSF0zil28jSOkelRoXSyDCZl4SvZ/4FLL9Dtg0HRUg2BBerZb0c3Uu06H1ae5m+zJNHGzMyVde1L6xRa/7KnvVnoFmzeDcQ7sg/KvF9PY14zBqgNdy/ICR0fVlBIVeQS900gPh3caTI9m4EHJao3Tb2pD+PW+hrlbNdQ4At0TPxyZ8KSL09nfxvJq7FjAqmRqjCxWcaZvNBcTe62TbcnxdoqCb05F3fukq5xXxQas5DvOkc9T4Dyj5ptzgRGNE5pN9kEAeBubuYA7Oq9ukyEyR6PRrvV9nTxqYQkejj32wjyLebf5KESCgzHsuXLEQ1QIvrF973tO7gLiRi6iS5gQEnKH16OeUP/H9Isl3GRQuqDs6Bpgh1fbaXNxTT3/9qAiDw64e4YhPXDcQyAe6V/JJ2NM3/GUv+wGedpTtyuoRZfHAEWBD1ydgUvl5REPf1++wdGJY+WfpB2P1XuCJmuPmEP5CdYWL668=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199015)(86362001)(36756003)(54906003)(478600001)(110136005)(316002)(6486002)(52116002)(7416002)(5660300002)(6666004)(8676002)(66476007)(2906002)(4001150100001)(4326008)(66556008)(66946007)(41300700001)(8936002)(6506007)(38350700002)(38100700002)(26005)(6512007)(186003)(83380400001)(2616005)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmhtRFZDZjN4aEpwQUI5Rmh0K2ZUalBsZHVZbGVNLzJsa2lTUTNHc0hnTTFD?=
 =?utf-8?B?c0tRTmtwTlRvemIvaVh6bXc2a1RtWWhlRDJTdnZUa2tKRnNVbDlKMzZBWDky?=
 =?utf-8?B?cUg1L3AvcklzSFFvT0VtSnNMVFcweU9mZVJIUmdsV1hMTERNMGpNZG11blJN?=
 =?utf-8?B?VFB4dGEzT1VJaW5mWUpQMlN3eGZWdXFlSmVvaU1FVEVVSlNzb09UNTZqTWti?=
 =?utf-8?B?MjVoTU9xS0Vqa1RZdjd6VytsNlB6U2JOSnk0SFZzRFdWb3dQOXBrQ2M3eUg4?=
 =?utf-8?B?amFJdFBQY0RiQmJJQktySm1WNlpVdDdJdHZ1dWJaMHlWMmdqZE1Ua2JqT1dz?=
 =?utf-8?B?YVNyTTlCVFRxRUQ1d3lOckNzZUdVNHpMYTIvSG8yUnI2d1RURGFILzVFVjZL?=
 =?utf-8?B?QWw2cWE2WHlJZVNpczlWLzVCVGozME04b0x6T2htcHpMQ3NqelFlSlV0QWsv?=
 =?utf-8?B?UFpER2RuL1AwYUNqRmsxcmk4V3hzbTJoOFdYVExNQm83ZmI0SHBpV0Q0RTJM?=
 =?utf-8?B?OS8yQXBER2V5bDg2NEtMaCtnaEJwdTdGYW5VU0NSQ09nOGNuei9kNXdKdHlj?=
 =?utf-8?B?T1M2ZVBzSGVIT1Jid2d2Ykh0T3QrSVJyeW1XeWxoaGlpeTBLelNQVzhZbmZF?=
 =?utf-8?B?VjZPSnlEZUZ6aS9KWEhBWEVkUjRtbUFseEQxeFNlK2V3c3Y2azBBUjZlUHdV?=
 =?utf-8?B?cXNrdGJCM0hjSXhSck9IQWk1YkxEM3A4ZTRlRkRWVk9CQlFSUkpucUtUU2Na?=
 =?utf-8?B?RmVLc3hRdmpiRmsyM2dlRDArOHpOeVdUTndlQkdzNzZ5RHM1Um1RQitoNFF5?=
 =?utf-8?B?aWEwczhzQ2xjSCsyWit4YnZsRi9ISGlPVGpnb3p4TVZ6RnhBeDBMalVJWDlX?=
 =?utf-8?B?REVxYlc1M05Yc21sbDhVS3I4cmYrbVN0a0s4SEpJc29IWUVScUQwdkVkZVdK?=
 =?utf-8?B?eFZRbDhjVnJsSU5qS09pdCt4RW9Ub0gzTG04MTdUUnk0dGd4bUxXOGt0T2pV?=
 =?utf-8?B?ay9qS1FlSGhFc1FPbStxLy9yN3pYUkVGK2xtWE5GVmVKbEQwSDNuWkx4Wjkz?=
 =?utf-8?B?VDhwcjVkZk9KaTRmR28vYzB3UitxY3ZkL2pSMjQvdm1wQUxMSVFyaUZRT1M0?=
 =?utf-8?B?WHkyMmVKL3dBNXRiWS9CYmlPekFoV1RLdGtlZHlBMzFzUmVUeENKKzk3VTFU?=
 =?utf-8?B?Q0xtU3YralNzczdaTEpLbHQvN0NqcWtIc2p2RFAzUnJLSzF4MHdoQkhFRnJx?=
 =?utf-8?B?V2NnZUJTN1cwOS9ENk9hLzJGMGl5Y3pSYXdjTEpHRk5PSlRmQjlCeXVydTFJ?=
 =?utf-8?B?ZjAzMnBrUS9mNWZxbGtUK1ZOTWJNTnh3MWlkTXZscUZucXVZZWx4YWhBVzVu?=
 =?utf-8?B?amw1Wk05OGU1N3FjWWZUOVpBREh5dDdpQStpU1Y3ckkwK3p3K1NYOVE3RWFG?=
 =?utf-8?B?ZnhUMGM4STZpWG95Z1NHZDh0aWliQk9GLzZkZEozdjRubDRDYXBaRGhWNnc2?=
 =?utf-8?B?M0VSalA3U1hyVHZxT0lWWitaRk5BQ1lZNjN4WkJBSDVSYnp0VkxVR2pRU0VT?=
 =?utf-8?B?T0ZoRzhYZkpnYjZYbnBqS29yZ2Fia055bVJQQ2NyUC81b2ZPWGROWUN2WXpK?=
 =?utf-8?B?WU9DdEtrRUlVbTF6R0pkQWFCZTl5K3ZJQ1EzK3I5cHg2YUNQNVZ1RnB6V2p3?=
 =?utf-8?B?RGo5VGRHNk5Eemd6Tjl1NVlSVW5EQU5wUzNORGk3NkcvcjRNcEdKNmdiYXdH?=
 =?utf-8?B?RmRPYkdkMGFKOFNGVzBYZDJjem40Y2w2cDB6V0dlT3hwc0dpVm4rMnltSzBF?=
 =?utf-8?B?YlBJNVNoRWY4WE9xZEtDWkhFMzVkUGhQYlhYNGFRb25MZjliMFRoU1FqaWh5?=
 =?utf-8?B?TlIzRm9WTXJ5STBsWFBOMzNOK1N1c1U0VUVOSlJDZytmTm9xWDZXU2Y1LzBl?=
 =?utf-8?B?Rkg4aE9tUW5kYWZ5SGg3TkQxTURXUFBOVmw5RE1Lc0pkZGI3RldUUEFoNDdE?=
 =?utf-8?B?dXJvbm54OFJ4OHZ4MjZRSVJNZVFrRHFFV3lnT05nT3diQXpOZHhUSHVZQkhB?=
 =?utf-8?B?THdwdjVudXFKRkhoU0hUUDdsaDAwUTMxT0N6M0ZpL3ZGZkF5VCs3enhVa1FR?=
 =?utf-8?Q?GvO8vgUe4zueYEL7IK25xAfir?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 632333e6-d9ac-4edb-715f-08dae008e4d7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2022 08:30:03.5967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFT5m8wvh/wJZicU5ugL4kTkPhiNhAK6feTyjK6tuwrw1cnwKL8ePPf6GDt6Ai4cFzFk51QeEMkAoAEC+jDW3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7889
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 Sandor.yu@nxp.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, patchwork-lst@pengutronix.de,
 NXP Linux Team <linux-imx@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-12-16 at 22:07 +0100, Lucas Stach wrote:
> Add a simple wrapper driver for the DWC HDMI bridge driver that
> implements the few bits that are necessary to abstract the i.MX8MP
> SoC integration.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Marek Vasut <marex@denx.de>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig       |   9 ++
>  drivers/gpu/drm/bridge/imx/Makefile      |   2 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c | 140
> +++++++++++++++++++++++
>  3 files changed, 151 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c
> 

Can you please provide a changelog since this is v2?

> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> b/drivers/gpu/drm/bridge/imx/Kconfig
> index 608f47f41bcd..d828d8bfd893 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -44,4 +44,13 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
>  	  Choose this to enable pixel link to display pixel
> interface(PXL2DPI)
>  	  found in Freescale i.MX8qxp processor.
>  
> +config DRM_IMX8MP_DW_HDMI_BRIDGE

Sort the config names alphabetically please.

> +	tristate "i.MX8MP HDMI bridge support"

To show the prompts in this Kconfig file in a consistent fashion,
please add 'Freescale' before 'i.MX8MP'.

> +	depends on OF
> +	depends on COMMON_CLK
> +	select DRM_DW_HDMI
> +	help
> +	  Choose this to enable support for the internal HDMI encoder
> found
> +	  on the i.MX8MP SoC.
> +
>  endif # ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile
> b/drivers/gpu/drm/bridge/imx/Makefile
> index aa90ec8d5433..03b0074ae538 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -7,3 +7,5 @@ obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
> +
> +obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi.o

Sort the config names alphabetically.

> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c
> b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c
> new file mode 100644
> index 000000000000..06849b817aed
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright (C) 2022 Pengutronix, Lucas Stach <
> kernel@pengutronix.de>
> + */
> +
> +#include <drm/bridge/dw_hdmi.h>
> +#include <drm/drm_modes.h>
> +#include <linux/clk.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

Header files in linux/ come before those in drm/.

> +
> +struct imx8mp_hdmi {
> +	struct dw_hdmi_plat_data plat_data;
> +	struct dw_hdmi *dw_hdmi;
> +	struct clk *pixclk;
> +	struct clk *fdcc;
> +};
> +
> +static enum drm_mode_status
> +imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
> +		       const struct drm_display_info *info,
> +		       const struct drm_display_mode *mode)
> +{
> +	struct imx8mp_hdmi *hdmi = (struct imx8mp_hdmi *)data;
> +
> +	if (mode->clock < 13500)
> +		return MODE_CLOCK_LOW;
> +
> +	if (mode->clock > 297000)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (clk_round_rate(hdmi->pixclk, mode->clock * 1000) !=
> +	    mode->clock * 1000)
> +		return MODE_CLOCK_RANGE;
> +
> +	/* We don't support double-clocked and Interlaced modes */
> +	if ((mode->flags & DRM_MODE_FLAG_DBLCLK) ||
> +	    (mode->flags & DRM_MODE_FLAG_INTERLACE))
> +		return MODE_BAD;
> +
> +	return MODE_OK;
> +}
> +
> +static int imx8mp_hdmi_phy_init(struct dw_hdmi *dw_hdmi, void *data,
> +				const struct drm_display_info *display,
> +				const struct drm_display_mode *mode)
> +{
> +	return 0;
> +}
> +
> +static void imx8mp_hdmi_phy_disable(struct dw_hdmi *dw_hdmi, void
> *data)
> +{
> +}
> +
> +static void im8mp_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void
> *data)
> +{
> +	/*
> +	 * Just release PHY core from reset, all other power management
> is done
> +	 * by the PHY driver.
> +	 */
> +	dw_hdmi_phy_gen1_reset(hdmi);
> +
> +	dw_hdmi_phy_setup_hpd(hdmi, data);
> +}
> +
> +static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops = {
> +	.init		= imx8mp_hdmi_phy_init,
> +	.disable	= imx8mp_hdmi_phy_disable,
> +	.setup_hpd	= im8mp_hdmi_phy_setup_hpd,
> +	.read_hpd	= dw_hdmi_phy_read_hpd,
> +	.update_hpd	= dw_hdmi_phy_update_hpd,
> +};
> +
> +static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct dw_hdmi_plat_data *plat_data;
> +	struct imx8mp_hdmi *hdmi;
> +	int ret;

Please fix this build warning:

drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c: In function
‘imx8mp_dw_hdmi_probe’:
drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c:80:13: warning: unused
variable ‘ret’ [-Wunused-variable]
   80 |         int ret;
      |             ^~~

> +
> +	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> +	if (!hdmi)
> +		return -ENOMEM;
> +
> +	plat_data = &hdmi->plat_data;
> +
> +	hdmi->pixclk = devm_clk_get(dev, "pix");
> +	if (IS_ERR(hdmi->pixclk))
> +		return dev_err_probe(dev, PTR_ERR(hdmi->pixclk),
> +				     "Unable to get pixel clock\n");
> +
> +	hdmi->fdcc = devm_clk_get_enabled(dev, "fdcc");
> +	if (IS_ERR(hdmi->fdcc))
> +		return dev_err_probe(dev, PTR_ERR(hdmi->fdcc),
> +				     "Unable to get FDCC clock\n");

Similar to Laurent's comment on v1 here, why does fdcc clock need to be
always enabled? 

> +
> +	plat_data->mode_valid = imx8mp_hdmi_mode_valid;
> +	plat_data->phy_ops = &imx8mp_hdmi_phy_ops;
> +	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
> +	plat_data->priv_data = hdmi;

Need to set plat_data->phy_force_vendor to be true? Or, you rely on
reading the HDMI_CONFIG2_ID register to determine the phy type?

> +
> +	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
> +	if (IS_ERR(hdmi->dw_hdmi))
> +		return PTR_ERR(hdmi->dw_hdmi);
> +
> +	platform_set_drvdata(pdev, hdmi);
> +
> +	return 0;
> +}
> +
> +static int imx8mp_dw_hdmi_remove(struct platform_device *pdev)
> +{
> +	struct imx8mp_hdmi *hdmi = platform_get_drvdata(pdev);
> +
> +	dw_hdmi_remove(hdmi->dw_hdmi);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id imx8mp_dw_hdmi_of_table[] = {
> +	{ .compatible = "fsl,imx8mp-hdmi" },
> +	{ /* Sentinel */ },

Nitpick: ',' after the sentinel is not needed since it's the last one.

Regards,
Liu Ying

> +};
> +MODULE_DEVICE_TABLE(of, imx8mp_dw_hdmi_of_table);
> +
> +static struct platform_driver imx8mp_dw_hdmi_platform_driver = {
> +	.probe		= imx8mp_dw_hdmi_probe,
> +	.remove		= imx8mp_dw_hdmi_remove,
> +	.driver		= {
> +		.name	= "imx8mp-dw-hdmi",
> +		.of_match_table = imx8mp_dw_hdmi_of_table,
> +	},
> +};
> +
> +module_platform_driver(imx8mp_dw_hdmi_platform_driver);
> +
> +MODULE_DESCRIPTION("i.MX8MP HDMI encoder driver");
> +MODULE_LICENSE("GPL");

