Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF1ACFAB57
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 20:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E2310E1FD;
	Tue,  6 Jan 2026 19:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="kgQqMIeR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010012.outbound.protection.outlook.com [52.101.61.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE9510E1FD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 19:38:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaHw7atqJOQem5QV36qUO8ry/JtUO3Rm0hN2KcilTpoGBL6788k2H+Jz271r1F9c4rjTsR7sOmnH54ehbhsWIJ2EUyMx5LGq+xcH/CqV+pyPql2/Y6e7ch5bchWo0gg0BfHAw94oaF95/w7guBcr96AAWooDTgwMxPwdsnLaiJfqvjaBoxMMyDGCWcLnb6wg1L3gqQ+XlY1r/uglw09MgTiOkFhEWBGxQl/Fs26K1zDsI0hFhoIU7n4ifUQsLQzxLBHl6aTiar1XMJgStPlOR0cSrOUU7sutUJlTYPaBgwJXKQKvevAc3CUGbL9U52+4wwnfxKGuWoAfRo3APJxShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1wL7JzPUb61E0SRqEOrMexmsNBx3RbfYFLeqAVV0vo=;
 b=lHBOh8E71K/DWftMj9YPfsnZEiPoNydhWmbKG0zx6PGePH1lh+AfEX3JSpB84oQk6mdSSax3UE02eK39aTHebnmLozZIeJ95fJ/uV/oKdFM/s0dAHNavY3Dk8KZpsXp9mJGF1Aww3Ndq46ooWHB+e8oy6qJYgr26d8H5f/i+1d7U1WVr3NZugbopERAEFHX0yx6V4Nk1EqfoTBGWKp0ZT07wk5AD3B4WJXqjnzAERHqr2krPjQWKPNdRovEkbiY27ybiCaKNZO8kkheLNDQ2q4sJGLsX5BymJbVJU2vvNSIdiI8TzPvuKnTQfv2z8XeGfD8s2N6rBlerAn5r6pG7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1wL7JzPUb61E0SRqEOrMexmsNBx3RbfYFLeqAVV0vo=;
 b=kgQqMIeRO+FSwVdnJWe2FqcSZqNaPT6dk+EbFIGXqjG2TfX1IGCm+dN571Qeotsc6fsGtfpFugxPEmJReWdv3KaKCn34JY83t9qCO5JseX0hEQ1XsiXiwfx770b2ytunvSUigIr7OC4XyeRoOjBMPpYYitoQfzx0GZ83kCOGov8=
Received: from SN7PR04CA0097.namprd04.prod.outlook.com (2603:10b6:806:122::12)
 by CH4PR10MB8098.namprd10.prod.outlook.com (2603:10b6:610:238::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 19:38:43 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:122:cafe::b5) by SN7PR04CA0097.outlook.office365.com
 (2603:10b6:806:122::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 19:38:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 19:38:42 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 13:38:38 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 13:38:38 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 13:38:38 -0600
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 606JcbcV3385164;
 Tue, 6 Jan 2026 13:38:37 -0600
Message-ID: <897ee11b-442c-4d09-95fa-f3cb9cec612b@ti.com>
Date: Tue, 6 Jan 2026 13:38:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/22] drm/tilcdc: Convert legacy panel binding via DT
 overlay at boot time
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
 <20260106-feature_tilcdc-v3-5-9bad0f742164@bootlin.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260106-feature_tilcdc-v3-5-9bad0f742164@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|CH4PR10MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c318032-6b9e-40bf-0436-08de4d5b32d5
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFRIQVVXQmY0VmkxSHdGT0IvQjA0UHk4RDN0bW5tWk1CSzFxUGJydUVpMmt3?=
 =?utf-8?B?NmprVkRPUGltU1NkamFxcmc0MlRrWkpFekdCR3luS1ZobTZlSVpEWWRYZDlS?=
 =?utf-8?B?VXFRSHduZVZWUjUxVStMcFczTHB1TnMzL1dYdnpMa2hGZ251ZGZVbGlpc2dw?=
 =?utf-8?B?K0hYS1U4WkF0b0oyUzVLdDJieVFrSGUzOFBuQ2NIWmd6VkpBK0Fqa28zZlNv?=
 =?utf-8?B?QmIvS252ejExVUxDR010dkM4akxpV3l3ZytJZFFpc0h3bGdlaHV6T0tMbFVX?=
 =?utf-8?B?SEp3SjRRTmladzBrOUphVXJrYWg1ZmlxTkN4RFdXejhpMmdOSFI5U2NLY2tK?=
 =?utf-8?B?ME9ja2pESTcrL0EzU0Q2SzNWOXpicHluVjEvQVcxT3R2SjZ5T2lvamd1N0p5?=
 =?utf-8?B?NGdSL01RUENCQ2R5Tnc3SjAzUHR3L2k3UWVCMGUwOFZZWFN5MXdONjNUK3VF?=
 =?utf-8?B?c3RZNlRNeXlLejQ0R0NEQ2F1cG5zdEwva2R2MVZlVWpmeWFERzlJNFQ0bmxu?=
 =?utf-8?B?SDUrUmZNaFExb0VQWFN1TFZOQnR4eTdxVHllOUd3Q0t2V1NKUDEzU2hYZlBM?=
 =?utf-8?B?ai81eVk1dUcrMHlPcnROM0d3QmNYS1pPWnVWWU5JZmk4blFhWXlIMGRzZEcy?=
 =?utf-8?B?aGVuZE5tY0xyTlhCc1EwZ3EwQTdHQjNpSGxzUnY3aXdmc2IvUWdSZmNBL3Rw?=
 =?utf-8?B?Q2JVZklyY0NYNjVaKzhEY3pJSVU1N2pHaTIyK243NkhEb2RYL0VUV2FsSDhV?=
 =?utf-8?B?NlJQVzlmN0RMck1xcmVtaDQ4bDQzUldoRHY2bUQzNSt3bSthYWdUR3BXb3ZC?=
 =?utf-8?B?TXdBeVV1eTc3enh3b043Zko5MEZsbm1XYm1ic2xNVm50V3QzWGRFUTdDVUdU?=
 =?utf-8?B?WmpzN2Y2YzVqQ2ViaGdjdWtqVElPRmlyLzlyT055R1AvaW9UNzNIUlJhc0wy?=
 =?utf-8?B?Q2NwaWlvTjdxWHJJcVppVHhBalJUYnhkai9GUkdLR0pCNDMzSnZVK1RrcytX?=
 =?utf-8?B?UVovNS9HQmdlZ2NFNTVJemd5SHhHY3RGODcyQ0FmemZDYUE2UjNvL3J0WERI?=
 =?utf-8?B?NndHM0JvRzJPRVR4QkZwUW5kMkdqaEd0RXhxSVFOM0tTM3IyYWt4MHZYZm01?=
 =?utf-8?B?YllVd2JNMFVETWtrc0c1cTdUOExoVTdzaWN4SEFIYzEzVXRVVC9qWEd2OFR3?=
 =?utf-8?B?Nml5UjdzT2t4REdvRzhETGdZSFhzWmh0MUZPT085RWU0Q1l5NWVQVjdVanRr?=
 =?utf-8?B?SmRwbDJLVE4zbDBOQzU2RDQxbmx6NWxGWXhpSkp4aEtqU3Y4eGFXV0ZTaW8v?=
 =?utf-8?B?UE4wY1lFNW5INUU2eCsvdHZxeGlHTDNWeU1uUlJtY0hvWGR4WXpYVGVIelBC?=
 =?utf-8?B?Rk1oTm9iQ2JxeVpHZVdIVm1zd0FrbWNvT01XUVF5SHFWL28yYkVjMjVBSjg5?=
 =?utf-8?B?RHhWazVPWmdMa2M5TGRxbEs1U0N1eU5HRm0wd1doUGhiaUZCNzJPNzRLZy9s?=
 =?utf-8?B?SmlYc1QyeTJlR3VvQXZ5V1UxWU1IYkNSVmdhLzFoek5wYzNORlA1VHhHKzFK?=
 =?utf-8?B?RUxBUU9aRFFrU2dMTEpMd2NPZGZEd2dXa1BmandKRmR4VkVRcUVCWFl6Z1ZM?=
 =?utf-8?B?N0hlblRZZys0Z2x3RDZ5ak9nNGZYdE44VW8rYTZOWUIrempJbW55a1hHNi9Z?=
 =?utf-8?B?ZkRXQjlQbVkwczZGRXRIaXA2TVBiTUFXZXhMb1NhbGVFalNpRVFUdFIrTi9X?=
 =?utf-8?B?N040V1pCem9VU1FOVEVmdDIwVTE1RGFEU1M2Mm1mSStuTitKejRPelN1dnRB?=
 =?utf-8?B?NklmbW9vSXZpOHlVMjRTUUtGWVM1RHZQVmMzL0VYWjdEN1R6dGFMRUF4SWlp?=
 =?utf-8?B?c2hHMk91cC8xTStOWUNPMDg2Z2Z4clNYcVBVcUdDbFRoTWhNaEN2WStkSm9j?=
 =?utf-8?B?RlI4ZUY3ZHRpbzZyT1JZS2lwbmVzbDV6TVZyc3dhTlpud1hyUzBsQmREVmhn?=
 =?utf-8?B?RmVDRnNuTDh2MUlUcjdOOVBHRXNJNVVyNVc3WU9iK0tvNnppMTBCbVhyOE9n?=
 =?utf-8?B?alpnRzRLaWZEZkN3RG4rSTM4b1lKai9NcEExc2x0dDFIMEs2YURYS3MzN1lG?=
 =?utf-8?Q?HJnklVYkF0VaBGWxHZY/Ad+ww?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 19:38:42.3025 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c318032-6b9e-40bf-0436-08de4d5b32d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8098
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
> To maintain backward compatibility while removing the deprecated
> tilcdc_panel driver, add a tilcdc_panel_legacy subdriver that converts
> the legacy "ti,tilcdc,panel" devicetree binding to the standard
> panel-dpi binding at early boot.
> 
> The conversion uses an embedded device tree overlay that is applied and
> modified during subsys_initcall. The process:
> 
> - Apply embedded overlay to create a tilcdc-panel-dpi node with
>    port/endpoint connections to the LCDC
> - Copy all properties from the legacy panel node to the new
>    tilcdc-panel-dpi node
> - Copy display-timings from the legacy panel
> - Convert legacy panel-info properties (invert-pxl-clk, sync-edge) to
>    standard display timing properties (pixelclk-active, syncclk-active)
> - Disable the legacy panel by removing its compatible property to
>    prevent the deprecated driver from binding
> 
> The result is a standard tilcdc-panel-dpi node with proper endpoints and
> timing properties, allowing the DRM panel infrastructure to work with
> legacy devicetrees without modification.
> 
> Other legacy panel-info properties are not migrated as they consistently
> use default values across all mainline devicetrees and can be hardcoded
> in the tilcdc driver.
> 
> This feature is optional via CONFIG_DRM_TILCDC_PANEL_LEGACY and should
> only be enabled for systems with legacy devicetrees containing
> "ti,tilcdc,panel" nodes.
> 
> Suggested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Link: https://lore.kernel.org/all/1d9a9269-bfda-4d43-938b-2df6b82b9369@ideasonboard.com/
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
> 
> Using the approach of applying an overlay and then modifying the live
> device tree is the solution I found that requires no modification of the
> OF core. Dealing entirely with changesets would bring additional
> requirements such as phandle resolution management, which is internal to
> the OF framework. I intend to avoid OF core change to support this legacy
> binding.
> 
> Change in v3:
> - Use __free() macro instead of manual house cleaning.
> - Enable CONFIG_DRM_TILCDC_PANEL_LEGACY config by default.
> - Improve config description.
> - Rename "panel-dpi" to "tilcdc-panel-dpi" to avoid any future conflict.
> - Use OF changeset instead of modifying the live devicetree step by
>    step.
> - Add kfree to avoid memory leak.
> 
> Change in v2:
> - New patch.
> ---
>   drivers/gpu/drm/tilcdc/Kconfig                  |  16 ++
>   drivers/gpu/drm/tilcdc/Makefile                 |   2 +
>   drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c    | 185 ++++++++++++++++++++++++
>   drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso |  29 ++++
>   4 files changed, 232 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tilcdc/Kconfig b/drivers/gpu/drm/tilcdc/Kconfig
> index 24f9a245ba593..4fca8058eb7db 100644
> --- a/drivers/gpu/drm/tilcdc/Kconfig
> +++ b/drivers/gpu/drm/tilcdc/Kconfig
> @@ -14,3 +14,19 @@ config DRM_TILCDC
>   	  controller, for example AM33xx in beagle-bone, DA8xx, or
>   	  OMAP-L1xx.  This driver replaces the FB_DA8XX fbdev driver.
>   
> +config DRM_TILCDC_PANEL_LEGACY
> +	bool "Support device tree blobs using TI LCDC Panel binding"
> +	default y
> +	depends on DRM_TILCDC
> +        depends on OF
> +        depends on BACKLIGHT_CLASS_DEVICE
> +        depends on PM

Spaces -> tabs

> +	select OF_OVERLAY
> +	select DRM_PANEL_SIMPLE
> +	help
> +	  Modifies the live device tree at early boot to convert the legacy
> +	  "ti,tilcdc,panel" devicetree node to the standard panel-dpi node.
> +	  This allows to maintain backward compatibility for boards which
> +	  were using the deprecated tilcdc_panel driver.
> +	  If you find "ti,tilcdc,panel"-string from your DTB, you probably
> +	  need this. Otherwise you do not.
> diff --git a/drivers/gpu/drm/tilcdc/Makefile b/drivers/gpu/drm/tilcdc/Makefile
> index f5190477de721..6d6a08b5adf40 100644
> --- a/drivers/gpu/drm/tilcdc/Makefile
> +++ b/drivers/gpu/drm/tilcdc/Makefile
> @@ -11,3 +11,5 @@ tilcdc-y := \
>   	tilcdc_drv.o
>   
>   obj-$(CONFIG_DRM_TILCDC)	+= tilcdc.o
> +obj-$(CONFIG_DRM_TILCDC_PANEL_LEGACY)	+= tilcdc_panel_legacy.o \
> +					   tilcdc_panel_legacy.dtbo.o
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c
> new file mode 100644
> index 0000000000000..37a69b3cf04b2
> --- /dev/null
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c
> @@ -0,0 +1,185 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Bootlin
> + * Author: Kory Maincent <kory.maincent@bootlin.com>
> + *
> + * To support the legacy "ti,tilcdc,panel" binding, the devicetree has to
> + * be transformed to the new panel-dpi binding with the endpoint associated.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/slab.h>
> +
> +/* Embedded dtbo symbols created by cmd_wrap_S_dtb in scripts/Makefile.lib */
> +extern char __dtbo_tilcdc_panel_legacy_begin[];
> +extern char __dtbo_tilcdc_panel_legacy_end[];
> +
> +static int __init
> +tilcdc_panel_update_prop(struct of_changeset *ocs, struct device_node *node,
> +			 char *name, void *val, int length)
> +{
> +	struct property *prop;
> +
> +	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	prop->name = kstrdup(name, GFP_KERNEL);
> +	prop->length = length;
> +	prop->value = kmemdup(val, length, GFP_KERNEL);
> +	if (!prop->name || !prop->value) {
> +		kfree(prop->name);
> +		kfree(prop->value);
> +		kfree(prop);
> +		return -ENOMEM;
> +	}
> +
> +	return of_changeset_update_property(ocs, node, prop);
> +}
> +
> +static int __init tilcdc_panel_copy_props(struct device_node *old_panel,
> +					  struct device_node *new_panel)
> +{
> +	struct device_node *old_timing __free(device_node) = NULL;
> +	struct device_node *new_timing __free(device_node) = NULL;
> +	struct device_node *panel_info __free(device_node) = NULL;
> +	struct device_node *child __free(device_node) = NULL;
> +	u32 invert_pxl_clk = 0, sync_edge = 0;
> +	struct of_changeset ocs;
> +	struct property *prop;
> +	int ret;
> +
> +	child = of_get_child_by_name(old_panel, "display-timings");
> +	if (!child)
> +		return -EINVAL;
> +
> +	/* The default display timing is the one specified as native-mode.
> +	 * If no native-mode is specified then the first node is assumed
> +	 * to be the native mode.
> +	 */
> +	old_timing = of_parse_phandle(child, "native-mode", 0);
> +	if (!old_timing) {
> +		old_timing = of_get_next_child(child, NULL);
> +		if (!old_timing)
> +			return -EINVAL;
> +	}
> +
> +	panel_info = of_get_child_by_name(old_panel, "panel-info");
> +	if (!panel_info)
> +		return -EINVAL;
> +
> +	of_changeset_init(&ocs);
> +
> +	/* Copy all panel properties to the new panel node */
> +	for_each_property_of_node(old_panel, prop) {
> +		if (!strncmp(prop->name, "compatible", sizeof("compatible")))
> +			continue;
> +
> +		ret = tilcdc_panel_update_prop(&ocs, new_panel, prop->name,
> +					       prop->value, prop->length);
> +		if (ret)
> +			goto destroy_ocs;
> +	}
> +
> +	new_timing = of_changeset_create_node(&ocs, new_panel, "panel-timing");
> +	if (!new_timing) {
> +		ret = -ENODEV;
> +		goto destroy_ocs;
> +	}
> +
> +	/* Copy all panel timing properties to the new panel node */
> +	for_each_property_of_node(old_timing, prop) {
> +		ret = tilcdc_panel_update_prop(&ocs, new_timing, prop->name,
> +					       prop->value, prop->length);
> +		if (ret)
> +			goto destroy_ocs;
> +	}
> +
> +	/* Looked only for these two parameter as all the other are always
> +	 * set to default and not related to common DRM properties.
> +	 */
> +	of_property_read_u32(panel_info, "invert-pxl-clk", &invert_pxl_clk);
> +	of_property_read_u32(panel_info, "sync-edge", &sync_edge);
> +
> +	if (!invert_pxl_clk) {
> +		ret = tilcdc_panel_update_prop(&ocs, new_timing, "pixelclk-active",
> +					       &(u32){cpu_to_be32(1)}, sizeof(u32));
> +		if (ret)
> +			goto destroy_ocs;
> +	}
> +
> +	if (!sync_edge) {
> +		ret = tilcdc_panel_update_prop(&ocs, new_timing, "syncclk-active",
> +					       &(u32){cpu_to_be32(1)}, sizeof(u32));
> +		if (ret)
> +			goto destroy_ocs;
> +	}
> +
> +	/* Remove compatible property to avoid any driver compatible match */
> +	of_changeset_remove_property(&ocs, old_panel,
> +				     of_find_property(old_panel, "compatible", NULL));
> +
> +	of_changeset_apply(&ocs);
> +	return 0;
> +
> +destroy_ocs:
> +	of_changeset_destroy(&ocs);
> +	return ret;
> +}
> +
> +static const struct of_device_id tilcdc_panel_of_match[] __initconst = {
> +	{ .compatible = "ti,tilcdc,panel", },
> +	{},
> +};
> +
> +static const struct of_device_id tilcdc_of_match[] __initconst = {
> +	{ .compatible = "ti,am33xx-tilcdc", },
> +	{ .compatible = "ti,da850-tilcdc", },
> +	{},
> +};
> +
> +static int __init tilcdc_panel_legacy_init(void)
> +{
> +	struct device_node *new_panel __free(device_node) = NULL;
> +	struct device_node *panel __free(device_node) = NULL;
> +	struct device_node *lcdc __free(device_node) = NULL;
> +	void *dtbo_start;
> +	u32 dtbo_size;
> +	int ovcs_id;
> +	int ret;
> +
> +	lcdc = of_find_matching_node(NULL, tilcdc_of_match);
> +	panel = of_find_matching_node(NULL, tilcdc_panel_of_match);
> +
> +	if (!of_device_is_available(panel) ||
> +	    !of_device_is_available(lcdc))
> +		return 0;
> +
> +	dtbo_start = __dtbo_tilcdc_panel_legacy_begin;
> +	dtbo_size = __dtbo_tilcdc_panel_legacy_end -
> +		    __dtbo_tilcdc_panel_legacy_begin;
> +
> +	ret = of_overlay_fdt_apply(dtbo_start, dtbo_size, &ovcs_id, NULL);
> +	if (ret)
> +		return ret;

Looking over the users of `of_overlay_fdt_apply()` they all seem
to start with a begin and end address, then have to convert to start
and size. I wonder if this function should be converted to just take
begin and end addresses instead.. (not a problem for this series, just
thinking out loud).

Andrew

> +
> +	new_panel = of_find_node_by_name(NULL, "tilcdc-panel-dpi");
> +	if (!new_panel) {
> +		ret = -ENODEV;
> +		goto overlay_remove;
> +	}
> +
> +	ret = tilcdc_panel_copy_props(panel, new_panel);
> +	if (ret)
> +		goto overlay_remove;
> +
> +	return 0;
> +
> +overlay_remove:
> +	of_overlay_remove(&ovcs_id);
> +	return ret;
> +}
> +
> +subsys_initcall(tilcdc_panel_legacy_init);
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso
> new file mode 100644
> index 0000000000000..ae71d10f5ec13
> --- /dev/null
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * DTS overlay for converting ti,tilcdc,panel binding to new binding.
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: Kory Maincent <kory.maincent@bootlin.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	tilcdc-panel-dpi {
> +		compatible = "panel-dpi";
> +		port {
> +			panel_in: endpoint@0 {
> +				remote-endpoint = <&lcd_0>;
> +			};
> +		};
> +	};
> +};
> +
> +&lcdc {
> +	port {
> +		lcd_0: endpoint@0 {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
> +};
> 

