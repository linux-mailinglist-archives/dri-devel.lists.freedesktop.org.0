Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1B0CFAABB
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 20:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC05710E058;
	Tue,  6 Jan 2026 19:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="wupMON28";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012029.outbound.protection.outlook.com [52.101.53.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E7610E058
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 19:30:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBOyT5CVInUgExinLvmwtEiex5dakD/a3KatvdMxXVU04DmXJXrUXhi7DcZIp07kF5W7fY/YSU8gkHHU+DY1bECNRE08v0rdkG3XkYRPhhbpiShzYJZdljry1nqKAJQaGiMXT3a2uJPIVYGbH9N/UBI5Zr5DCP5r5XLmmFYB8nnzpUQHW1YSQEKUX6IeLIBAfFyR9poVLCgScHUD2zSjYGwlJy7WgkjFxju0MZXtD3+mjQ1PHq3eaC/n3HYDgdBLuZQ628HxCGPzv3TBDswPZM1oRff0RvMrC8++thAX07h5Vl2U7zCfEqTS5kBCUR4NPUqS+SR27arequUE+1epww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSnho8/YdFkWTsudTirs08PtJqxB6lqKGRNu9BDA07M=;
 b=AUUk6eRGW7yP8SM+yLZRiBrJZYPyhJ25O7eNVWC3xhpS6EuoFNmXlQzvoF2upYfGycVH5wMU0YMyoBzukGHoJKnEJIGUYvr3XadIEAavjlDJS/EmzINv+ahstpChYgZXERjuG9hTwD1IhafD2QrZCfPENoYcSH0nzQq5FRWYF8nRNsmcfZ5HEVRJKwbTVdvTjGIu6Vzsisk+g7NMPreMy6LjsEoE3liXZfJw/TYjBz5SAeDIgWSd95kuqYVyCAI/9SKTv4y8ozaZFeQ7Cas9Ro4MXXf7FmY67eaD3cmmiQyWn3GrQs6BcEvaRgYKCv/TcgB2BgaG8HObaAEo56TYBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSnho8/YdFkWTsudTirs08PtJqxB6lqKGRNu9BDA07M=;
 b=wupMON28WcqP6GyGAEQlexliTLlBfZJiWYzG5S51OAwLw7kwwaO6i1shp7/HgnYZG1UtBU/101xyZlpiRtGlwXFyaK9FolHJ9wZB9ZRyH14ovOn+z5jG2+MH4B50TFyZXFb6BcNKfrUNrXgcTkH1vBeQcjvt1w1Grph4vQefwLg=
Received: from SJ0PR03CA0382.namprd03.prod.outlook.com (2603:10b6:a03:3a1::27)
 by IA3PR10MB8491.namprd10.prod.outlook.com (2603:10b6:208:576::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 19:30:50 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::ce) by SJ0PR03CA0382.outlook.office365.com
 (2603:10b6:a03:3a1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 19:30:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 19:30:49 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 13:30:42 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 13:30:41 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 13:30:41 -0600
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 606JUemh3377538;
 Tue, 6 Jan 2026 13:30:41 -0600
Message-ID: <f9fb8050-89f9-4449-bc2c-ff284873be79@ti.com>
Date: Tue, 6 Jan 2026 13:30:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/22] drm/tilcdc: Add support for DRM bus flags and
 simplify panel config
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, "Bartosz
 Golaszewski" <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>
CC: Markus Schneider-Pargmann <msp@baylibre.com>, Bajjuri Praneeth
 <praneeth@ti.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, Herve Codina
 <herve.codina@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
 <20260106-feature_tilcdc-v3-4-9bad0f742164@bootlin.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260106-feature_tilcdc-v3-4-9bad0f742164@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|IA3PR10MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: fb5de584-e053-4a90-d66e-08de4d5a193a
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVNUM0ROekE2YTU0U2owUlJEOWRJeldYZDNUaW9xajg3OVFoS2VKMDl1b3NW?=
 =?utf-8?B?ekxGZmo3TFpXbHVnOUdzUGs1d3Jibkp4Y2pMQ2kza296OVRiNmNtVEFSaURa?=
 =?utf-8?B?cUtJcHdtbXJURGI2R3VDL1Voc0tHT0FwK214bE0yOFAyMVVhUk9BSXNUS2xo?=
 =?utf-8?B?QTZlK2YzUGJGUWhqSTI2azVndXc2K2lYdzVlZ0U1blNTU2hEanFYWS9YQ2Qw?=
 =?utf-8?B?R0R2ZE9TaURtTlE2OWczRkQ5akRpdGhid0QwVUw4U1YyUzZSNlREay96amk5?=
 =?utf-8?B?Y20ySDBuYkMyM2xSamc1Tk92VFpmckdOcTJQdTIzNzVjT2o4S3RlbEo5SGVt?=
 =?utf-8?B?eWk5NW5pZFo1SkV0ZC9aeW1YMTIzazZWTlFPTGZuVHVsWTdpeHNLTFlOTGNz?=
 =?utf-8?B?dFdsZTVpTy90QXVIRWdiOWxQL2sxUklmbkM4Y0xBYjdrSEZaUlFJMStPd0tl?=
 =?utf-8?B?RHhHeGFTdlY2MHgwQ1M1VS9tdkt5WXdrZlBpQU5VOHIvejgrUE12S2sxUGJt?=
 =?utf-8?B?U1MwcHFYcFFzelRjd1BadGxRb0kwcW9iRE5kUnpnT3IvdmpmMFZSb0dNZlhs?=
 =?utf-8?B?R0Z4cndIenk1TnkzYUVjbE84TStMRU1CcGtzUXVUUXF2QUdsMVVsSU9lNG5n?=
 =?utf-8?B?eE1CbWQ2Rkk3NmZ0dlpyTSsvYjFZU3FiNVRLM0VySE4vUlhnd204UldjeDBi?=
 =?utf-8?B?R1hYcDRsMzZQMldtMHFSN3JYMGMrTHh6Z2lQRkRZZkpyMkV2cWhCaElmSER1?=
 =?utf-8?B?ZEpSa1pwYitCbm45Y2pxYWZYbjNBYk9YeUt2a29DeThGV2hvZzZhUFRmZ0xx?=
 =?utf-8?B?am1iL29GVDc1aGFSeUdFSUZ0OGZwemRIZDRzYWFwQm5kYXNmdGpWZzI1ZHNR?=
 =?utf-8?B?Y3BNL1B4UytGSlNDQU8weitBNDlGY1d0dHE3S1pFUTlVeE1xUG1SMXhGaG11?=
 =?utf-8?B?eHFRQmZ3VW4xV1laM3R5SGhVM09UM0w2VG1MckN0czA5YlQ2L1l2c01UbXNK?=
 =?utf-8?B?RkZBdjlkMGszVFhGczNqRWhPdlBydUI4VHdNMytadmxOdTVtUjRwUTJKaFR2?=
 =?utf-8?B?NG04QkJXblYwVmwvY2dTMUVxNlRuSVFtUDFiSnpmdDhjSGw2S3BOMjJZRWhT?=
 =?utf-8?B?Y0x0TndwZndOSTVxNXJ0Z2llQUNnNFVIQURBWkp2VkN6WWpMaHJ6TTJTZ2Vu?=
 =?utf-8?B?QUJXSlZwZVZXancveUpwWEZZamRXSmJTQUFSQVNvejNBa0cxcVNBektTRHBD?=
 =?utf-8?B?YkMwRnJDaWxNOVBQV1RLQjh1L2NJL1hiY2tKWTVTK0RkVHc5TktNbGtOaFJx?=
 =?utf-8?B?Q0cvM1NXVjNrdFd1Nlc0S2tTc21sbUgwOUMwWGtDdGRIajVua0lMS1U0RC9t?=
 =?utf-8?B?NWpneGRnOEJSdi96SnJsblRNRmRuNjBPNVVTZFI2bHZjelhiTEpvcHdVOFRT?=
 =?utf-8?B?VTdHa2ZzODJ1OGtJdG10TlUxbVd6TGFRT01JUDlCTXFRUTBlaHcvZ2ZFaTRV?=
 =?utf-8?B?VjdPR0RBdEZPbmI5TmRGUURWcWR5QkEyNGNDMWFDUnJBMEdUZVJqcms4UHJ2?=
 =?utf-8?B?NHY0K0xzSE5ReEdVWXU0ZXQzWmkzUFBqL05MdWU3NFZwNldZdEV0bi9xM0pT?=
 =?utf-8?B?Q0dza041UlpoYkVQZEtadWVvZ1A4aEowRENweFhlN1gxS3dTMXljdXBObkt2?=
 =?utf-8?B?alc4bXpRdXdZRS9kUW41czNKV0p3VitQbldFaUpkRlNGSGhKdjI3U01kRVo1?=
 =?utf-8?B?UkNMZWRFWWx3Q2Zudm0xY051U282ZFoyWERHNEtFaWE1MDIvMGJTWkRnWi9L?=
 =?utf-8?B?ajN1bHBwNE1XWmV4aCtPSUNrMzlYb05STGRDRStaVUQ3SkpOWVZHRWRFeFFO?=
 =?utf-8?B?a1JTeXdzNXJnUHNVNHhwbW9vaUpKVVJ3Ri9WcEtVQVkwbU5Sb3oxOUVScUJy?=
 =?utf-8?B?OHNtTmdTNjI4d0YwblNWMkNHQis2dXdDSmE3dlBCcHdIQnNlYXBjZDU3MVJK?=
 =?utf-8?B?SWp4bHp4M2pPSlE0TS9uZkYxaWRRMEdVYThwL2xDbEdFRWtMS3ErR2MvbUJl?=
 =?utf-8?B?c1JLTkh5TjRUMnFJZFR4cm9mbFpKV3hrY0U1R09Way9xMExEWXR4QkN6M0E4?=
 =?utf-8?Q?SCKVJkxRdqVP+cJWJUihjFRkR?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 19:30:49.7836 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5de584-e053-4a90-d66e-08de4d5a193a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8491
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

On 1/6/26 11:42 AM, Kory Maincent (TI.com) wrote:
> Migrate CRTC mode configuration to use standard DRM bus flags in
> preparation for removing the tilcdc_panel driver and its custom
> tilcdc_panel_info structure.
> 
> Add support for DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE and
> DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE flags to control pixel clock and sync
> signal edge polarity, while maintaining backward compatibility with the
> existing tilcdc panel info structure.
> 
> Simplify several hardware parameters by setting them to fixed defaults
> based on common usage across existing device trees:
> - DMA burst size: 16 (previously configurable via switch statement)
> - AC bias frequency: 255 (previously panel-specific)
> - FIFO DMA request delay: 128 (previously panel-specific)
> 
> These parameters show no variation in real-world usage, so hardcoding
> them simplifies the driver without losing functionality.
> 
> Preserve FIFO threshold configurability by detecting the SoC type, as
> this parameter varies between AM33xx (8) and DA850 (16) platforms.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
> 
> Change in v2:
> - Use SoC type instead of devicetree parameter to set FIFO threshold
>    value.
> ---
>   drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 47 +++++++++++++-----------------------
>   drivers/gpu/drm/tilcdc/tilcdc_drv.c  | 29 ++++++++++++++++------
>   drivers/gpu/drm/tilcdc/tilcdc_drv.h  |  2 ++
>   3 files changed, 41 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> index b06b1453db2dd..2309a9a0c925d 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> @@ -285,27 +285,15 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
>   
>   	/* Configure the Burst Size and fifo threshold of DMA: */
>   	reg = tilcdc_read(dev, LCDC_DMA_CTRL_REG) & ~0x00000770;
> -	switch (info->dma_burst_sz) {
> -	case 1:
> -		reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_1);
> -		break;
> -	case 2:
> -		reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_2);
> -		break;
> -	case 4:
> -		reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_4);
> -		break;
> -	case 8:
> -		reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_8);
> -		break;
> -	case 16:
> -		reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_16);
> -		break;
> -	default:
> -		dev_err(dev->dev, "invalid burst size\n");
> -		return;
> +	/* Use 16 bit DMA burst size by default */
> +	reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_16);
> +	if (priv->fifo_th) {
> +		int fifo_th_val = ilog2(priv->fifo_th) - 3;
> +
> +		reg |= (fifo_th_val << 8);
> +	} else {
> +		reg |= (info->fifo_th << 8);
>   	}
> -	reg |= (info->fifo_th << 8);
>   	tilcdc_write(dev, LCDC_DMA_CTRL_REG, reg);
>   
>   	/* Configure timings: */
> @@ -321,8 +309,8 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
>   
>   	/* Set AC Bias Period and Number of Transitions per Interrupt: */
>   	reg = tilcdc_read(dev, LCDC_RASTER_TIMING_2_REG) & ~0x000fff00;
> -	reg |= LCDC_AC_BIAS_FREQUENCY(info->ac_bias) |
> -		LCDC_AC_BIAS_TRANSITIONS_PER_INT(info->ac_bias_intrpt);
> +	/* Use 255 AC Bias Pin Frequency by default */
> +	reg |= LCDC_AC_BIAS_FREQUENCY(255);
>   
>   	/*
>   	 * subtract one from hfp, hbp, hsw because the hardware uses
> @@ -392,20 +380,19 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
>   			return;
>   		}
>   	}
> -	reg |= info->fdd << 12;
> +	/* Use 128 FIFO DMA Request Delay by default */
> +	reg |= 128 << 12;
>   	tilcdc_write(dev, LCDC_RASTER_CTRL_REG, reg);
>   
> -	if (info->invert_pxl_clk)
> +	if (info->invert_pxl_clk ||
> +	    mode->flags == DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
>   		tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_INVERT_PIXEL_CLOCK);
>   	else
>   		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_INVERT_PIXEL_CLOCK);
>   
> -	if (info->sync_ctrl)
> -		tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_CTRL);
> -	else
> -		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_CTRL);
> -
> -	if (info->sync_edge)
> +	tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_CTRL);
> +	if (info->sync_edge ||
> +	    mode->flags == DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE)
>   		tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_EDGE);
>   	else
>   		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_EDGE);
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> index 3dcbec312bacb..60230fa9cec95 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -31,6 +31,11 @@
>   #include "tilcdc_panel.h"
>   #include "tilcdc_regs.h"
>   
> +enum {
> +	AM33XX_TILCDC,
> +	DA850_TILCDC,
> +};
> +
>   static LIST_HEAD(module_list);
>   
>   static const u32 tilcdc_rev1_formats[] = { DRM_FORMAT_RGB565 };
> @@ -192,11 +197,19 @@ static void tilcdc_fini(struct drm_device *dev)
>   	drm_dev_put(dev);
>   }
>   
> +static const struct of_device_id tilcdc_of_match[] = {
> +		{ .compatible = "ti,am33xx-tilcdc", .data = (void *)AM33XX_TILCDC},
> +		{ .compatible = "ti,da850-tilcdc", .data = (void *)DA850_TILCDC},
> +		{ },
> +};
> +MODULE_DEVICE_TABLE(of, tilcdc_of_match);
> +
>   static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
>   {
>   	struct drm_device *ddev;
>   	struct platform_device *pdev = to_platform_device(dev);
>   	struct device_node *node = dev->of_node;
> +	const struct of_device_id *of_id;
>   	struct tilcdc_drm_private *priv;
>   	u32 bpp = 0;
>   	int ret;
> @@ -209,6 +222,10 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
>   	if (IS_ERR(ddev))
>   		return PTR_ERR(ddev);
>   
> +	of_id = of_match_node(tilcdc_of_match, node);

You should be able to use `device_get_match_data()` here, then you would
also be able to keep the tilcdc_of_match table down were it was before.

Andrew

> +	if (!of_id)
> +		return -ENODEV;
> +
>   	ddev->dev_private = priv;
>   	platform_set_drvdata(pdev, ddev);
>   	drm_mode_config_init(ddev);
> @@ -309,6 +326,11 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
>   
>   	DBG("Maximum Pixel Clock Value %dKHz", priv->max_pixelclock);
>   
> +	if ((unsigned int)of_id->data == DA850_TILCDC)
> +		priv->fifo_th = 16;
> +	else
> +		priv->fifo_th = 8;
> +
>   	ret = tilcdc_crtc_create(ddev);
>   	if (ret < 0) {
>   		dev_err(dev, "failed to create crtc\n");
> @@ -597,13 +619,6 @@ static void tilcdc_pdev_shutdown(struct platform_device *pdev)
>   	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
>   }
>   
> -static const struct of_device_id tilcdc_of_match[] = {
> -		{ .compatible = "ti,am33xx-tilcdc", },
> -		{ .compatible = "ti,da850-tilcdc", },
> -		{ },
> -};
> -MODULE_DEVICE_TABLE(of, tilcdc_of_match);
> -
>   static struct platform_driver tilcdc_platform_driver = {
>   	.probe      = tilcdc_pdev_probe,
>   	.remove     = tilcdc_pdev_remove,
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
> index 3aba3a1155ba0..79078b4ae7393 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
> @@ -61,6 +61,8 @@ struct tilcdc_drm_private {
>   	 */
>   	uint32_t max_width;
>   
> +	u32 fifo_th;
> +
>   	/* Supported pixel formats */
>   	const uint32_t *pixelformats;
>   	uint32_t num_pixelformats;
> 

