Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66035C9B7CD
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 13:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E125110E047;
	Tue,  2 Dec 2025 12:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="EI3fikyw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013041.outbound.protection.outlook.com
 [40.93.196.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6286210E047
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 12:25:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiNFRz6lxaJGiibuwjS2isFjoXtRK3CAfIcBk0VzNI4zwuu6PO/Qu07fJOO/mMP/RTciVL4PLuv2XViPb0iY2zfbPewR//DiY74EOITXeMgwu2MwaYJMZPfnME53dmD2XEs4J3OfqngYqQ6sWe90Wkb+wcQyGTfqNnbvtWvPaPE+4SGZnUVrdOb5NZx346inpTizabXTNVWfmXdoELZbVHq5INVwJaGYYryl/xRD7/OQ2V9d3xYE5GhfOq8KkILFItK7G6AXCOqluNs1iWnk/8JFMysOmc9Q7nAhHg7nYcghYZshymnUjR50sTspeoXlcWpM/ZDiEp+xf+Wye+MCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmObU8DSK+8IY5/zZJBSEdulBlvEVHoUo6i9HXNrRu4=;
 b=KoQ4mHLiTy2x8pMJ6BXUp8dTZ3egG2rIkgaPMIJTLgcZiUgcFe9Xs3xqT+jSDcAipg/6tOuWOe9cROIp8tDEG3Ntm9WaV9QOxgdbGfOAtwvo0bnZnVAI8C68rG1XzYrgb5HOk2SmUd3VDcBkx6FfV+rbazVfHqUb1aGsFdM1C5AW099xpcA3mMRA2Mg5KlNByoUXHA8WYe8A4NqOi9GChuebBFobdk7oHxVPGJaqPZU1tRkP2lOAWOBYh53iTtkCg9NtrCsAjXTPtf3JOKEs9QTzDSIegNb5sYBOF5lzX6/0tTrEqcZSjV00B/WF2pQXDEjRPAHFRQdZ4ve4+uaVbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmObU8DSK+8IY5/zZJBSEdulBlvEVHoUo6i9HXNrRu4=;
 b=EI3fikyw6cLpaKM5M2BQ1Rp6HPNyLIPsOZnH6qJWUIzlAEGXTNNQ4W2IbGxRBvnQaRxrlWgl7fRqZVsqxRRztExfGuZAglON5CqFsNDOYLAsVq1nwu2aBAs/Foc9fISq5yOsxSAxXmaHrgPWw+fZnvexbhpBFUZIjFmUl+S35jE=
Received: from DS7PR05CA0010.namprd05.prod.outlook.com (2603:10b6:5:3b9::15)
 by DS0PR10MB6223.namprd10.prod.outlook.com (2603:10b6:8:d3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 12:25:23 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::54) by DS7PR05CA0010.outlook.office365.com
 (2603:10b6:5:3b9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 12:24:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 12:25:23 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 06:25:23 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 06:25:23 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 06:25:23 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2CPFAd2241797;
 Tue, 2 Dec 2025 06:25:16 -0600
Message-ID: <7b8e22d1-a872-4ea0-8fce-4323d2bf81ff@ti.com>
Date: Tue, 2 Dec 2025 17:55:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] Clean and update tilcdc driver to support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
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
CC: Markus Schneider-Pargmann <msp@baylibre.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|DS0PR10MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: a99b2e69-568a-4d5e-d4d1-08de319dde0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|36860700013|1800799024|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWc3QXBERDRFZ1dHdlpJY3BPTmNVVjlHOU1DUUFBRFgzZ3FTTDRPaXNVM2tk?=
 =?utf-8?B?OEFmd25RSCtQNUVDSUtLQzBJYTZuZS9WdXllS2Q4US9BVVJoejhQMGdudlZH?=
 =?utf-8?B?RU9YcnNsSStHcWJ3Zlk5T1RzRy83cFIwa2Q2Ly9IVGhkaGVKN3VtVVo2N282?=
 =?utf-8?B?QVAwUmZiZWJtZGlUaUFYYmY4TkRRY3RJVzdncDBsNTAzU3pKQytQcU9rQk9r?=
 =?utf-8?B?QndXQWZQUENxMWV1eURodEJUcVI1RTI1MzFHU3VWZ1MrY21jazM5UzYrSHRu?=
 =?utf-8?B?bFNYbmsvaXljQmJrNVpScHFFVzAyT1FYR2ErZE9jVklkNGQzTDRhZ0NqSkpO?=
 =?utf-8?B?TDRhWHpRSUQ0UkdzQnRRdTVxVEVtNURDUUhTbTR0M0tJa1kwTjIwSkdGSi9L?=
 =?utf-8?B?VlVxaUJMa2x0MXhlOTdyVWp4RzhvMklBZ08yRThwWFAzVTViNWk1K1I3ZGN6?=
 =?utf-8?B?L3gvRGVLcmpiSUx0YnBuU0RiOVpRTVF6TWlLQVZORlh3R0NNeEZrOFRKYXFD?=
 =?utf-8?B?V2FtYzZ4V1pya0RKV0kxWGZpMDVXWVhiREtGUURnQjFqcFVrbXVSRWpGR2Qw?=
 =?utf-8?B?ZU1HcU5WdklzNFFGUWZBOHNMVVhzSHdNejhEYytna2ZoK2xtNTkyTmNTMzZC?=
 =?utf-8?B?S0FWSkdDbUlXSzkyUW9xaVNEa01WeVFyaThvbllWeWdqZjduZ0pjR0JTamtr?=
 =?utf-8?B?aXRaNE5hbWcwKzZEdkFCUzMySVRINjZZZ0ZXTXZhNUcwV09xTUFUd21uQ1lw?=
 =?utf-8?B?ZFgyUlZ6UWRYeEhiUnVKK0pZUVg1MWJhUnZlTHRBblpwa2dpQlJMaTRZb2d0?=
 =?utf-8?B?MXlBWDE2K2JzZFdOYXBDYk45d3RTaTU0MFpjdzFLblJ4NWttRmJScWVOcUl4?=
 =?utf-8?B?c1orcnFUNVkvb2F2bDNKNlg1QXVhc0ZlMU9zcmpFVTV1UU1RYTZaSDViNTRC?=
 =?utf-8?B?ajVacWN6M2lEczF4SXdxSGxsTVd1R3d4elZMOGRqVkZiYmt6WnJ4NnlnM01a?=
 =?utf-8?B?OTFBbDRuR1V0R0ZiOWZLR2pUejZETThrdE9qZ3Nyckw4SmpjRk4xYU9DYWVP?=
 =?utf-8?B?UjQxQWc3cEp5QlBTSkpuMUF0QXpsZDV0M1o2THgvT3QvZWpielE5SDROYnVF?=
 =?utf-8?B?MFFaNERjQk1vVERYVkF1czhvWC9EVE5MaC9ndU5xbWtPb0RRcXpJTVU1cnI0?=
 =?utf-8?B?L2g2alVjMHQ3MTBTN3ZwM2xnenp3eDZkeDZZTDk2eTR4MDZOVWo2SncvenlL?=
 =?utf-8?B?NG1VWU9qRWc2cVdBenpKUXZwVlNLUmVtT1ZoUThVT2ZhN2U1NDJ5V1Z1UFQ0?=
 =?utf-8?B?RDlydmlsVVB3TjFwRHVZK1pPZW9GQlkwNmgzczRCVTc4emhQMTJlZWFuVm1z?=
 =?utf-8?B?RjVnbU4vaktsa2NmbEU4dHBoaDMxVkJZUXR3ZTcybFBjMlNHUnV6blQ3SHNR?=
 =?utf-8?B?NC84bktVMzVXeVRHa3ZGYWN2NXVrdW5nR1NFSWpQR2VCV0VMTkpHMXZ4VS9m?=
 =?utf-8?B?ejFYUEVEMG42VGJGamwxbUQ3eDJnSldtNTFuSVpsaThIbnFpRlN1S0REYlVk?=
 =?utf-8?B?MUZxMmw5bHBQM244TmRad2l2RGVZVDhPWkRQWWQrV3o3U2tSelZiMWxjV0Nw?=
 =?utf-8?B?dWlDRXJ6WnVEYTd0dTY3UWtVNDNBMmtRSjZiWGU3a1ZKbVJaSFBNd0ZaZDNK?=
 =?utf-8?B?d1FLR1JGRmdWcTE0RER3Tk9KODJVYkhFMTU0N1ZYQ2RqUHFFSEVpcDluWThS?=
 =?utf-8?B?U1h2UEFLbDQyUUpOVkx0byt2TnhFRWpkK0FZUzRWQVJ1TnVjWWJ2TElVemM1?=
 =?utf-8?B?L0x4OWJpdW1pUUxWZUs1OHZnSjE0MlRhaHpCdHpqeGV5VmxyWlp6emJpQjhD?=
 =?utf-8?B?MDg1V296eDU2ZUNKR1lFNkFlcjNjNHFpYnZTOURJMkRWQ2Y0Mjdicmc5akpM?=
 =?utf-8?B?SGhUVVhYdml5SjFwRU9SUU1TQVZ4U0FRMyt1NGloRTN5ZG1YVDF1TmlScWMv?=
 =?utf-8?B?UUk1b2lnTjBGMVlhY2xWWmpSWDZFMHhaOVkyd09XZTNJVEl4RnZZbE9aMWZ2?=
 =?utf-8?Q?5PWWw/?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(36860700013)(1800799024)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 12:25:23.7612 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a99b2e69-568a-4d5e-d4d1-08de319dde0d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6223
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

Hi Kory,
Thanks for the series.

On 11/26/25 23:05, Kory Maincent (TI.com) wrote:
> The starting point for this work was adding support for the HDMI cape:
> https://www.seeedstudio.com/Seeed-Studio-BeagleBone-Green-HDMI-Cape.html
> This will be sent in a later series.
> 
> Initially, Miguel proposed modifying the ite-it66121 bridge to support
> the legacy behavior without the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag:
> https://lore.kernel.org/lkml/20250909-it66121-fix-v1-1-bc79ca83df17@bootlin.com/
> This patch was NAK'd as we don't want to add more legacy code. Maxime
> requested that the tilcdc driver be updated to use
> DRM_BRIDGE_ATTACH_NO_CONNECTOR instead.
> 
> While working on this update, I discovered that the tilcdc driver
> contained significant amounts of legacy code that needed cleaning.
> Since this driver was developed alongside the tda998x driver for
> several AM335x boards, the tda998x driver also required cleanup and
> support for the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
> 
> This series is based on the tilcdc fix sent to mainline:
> https://lore.kernel.org/lkml/20251125090546.137193-1-kory.maincent@bootlin.com/
> 
> Patch 1-7: Convert tilcdc binding to YAML and remove the ti,tilcdc,panel
> 	   sub-binding and driver
> Patch 8-16: Clean up tilcdc driver
> Patch 17-19: Clean up tda998x driver
> Patch 20: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support to tda998x
> Patch 21: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support to tilcdc
> 
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
> Kory Maincent (TI.com) (21):
>        dt-bindings: display: tilcdc: Convert to DT schema
>        dt-bindings: display: tilcdc: Add fifo-threshold property
>        drm/tilcdc: Remove simulate_vesa_sync flag
>        drm/tilcdc: Add support for DRM bus flags and simplify panel config
>        ARM: dts: omap: Bind panel to panel-dpi instead of ti,tilcdc,panel driver
>        dt-bindings: display: tilcdc: Remove panel binding
>        drm/tilcdc: Remove tilcdc panel driver
>        drm/tilcdc: Remove component framework support
>        drm/tilcdc: Remove tilcdc_panel_info structure
>        drm/tilcdc: Remove redundant #endif/#ifdef in debugfs code
>        drm/tilcdc: Remove unused encoder and connector tracking arrays
>        drm/tilcdc: Rename external_encoder and external_connector to encoder and connector
>        drm/tilcdc: Rename tilcdc_external to tilcdc_encoder
>        drm/tilcdc: Remove the useless module list support
>        drm/tilcdc: Modernize driver initialization and cleanup paths
>        drm/tilcdc: Remove the use of drm_device private_data
>        drm/bridge: tda998x: Remove component support
>        drm/bridge: tda998x: Move tda998x_create/destroy into probe and remove
>        drm/bridge: tda998x: Remove useless tda998x_connector_destroy wrapper
>        drm/bridge: tda998x: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
>        drm/tilcdc: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
> 
>   .../devicetree/bindings/display/tilcdc/panel.txt   |  66 ---
>   .../devicetree/bindings/display/tilcdc/tilcdc.txt  |  82 ----
>   .../devicetree/bindings/display/tilcdc/tilcdc.yaml | 103 +++++
>   arch/arm/boot/dts/ti/davinci/da850-evm.dts         |  26 +-
>   arch/arm/boot/dts/ti/omap/am335x-guardian.dts      |  25 +-
>   arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |  21 +-
>   arch/arm/boot/dts/ti/omap/am335x-pepper.dts        |  22 +-
>   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts      |  25 +-
>   arch/arm/boot/dts/ti/omap/am335x-sl50.dts          |  25 +-
>   drivers/gpu/drm/bridge/tda998x_drv.c               | 251 ++++++------
>   drivers/gpu/drm/tilcdc/Makefile                    |   3 +-
>   drivers/gpu/drm/tilcdc/tilcdc_crtc.c               | 117 ++----
>   drivers/gpu/drm/tilcdc/tilcdc_drv.c                | 456 +++++++--------------
>   drivers/gpu/drm/tilcdc/tilcdc_drv.h                |  88 +---
>   drivers/gpu/drm/tilcdc/tilcdc_encoder.c            |  93 +++++
>   .../tilcdc/{tilcdc_external.h => tilcdc_encoder.h} |   5 +-
>   drivers/gpu/drm/tilcdc/tilcdc_external.c           | 179 --------
>   drivers/gpu/drm/tilcdc/tilcdc_panel.c              | 408 ------------------
>   drivers/gpu/drm/tilcdc/tilcdc_panel.h              |  15 -
>   drivers/gpu/drm/tilcdc/tilcdc_plane.c              |   2 +-
>   drivers/gpu/drm/tilcdc/tilcdc_regs.h               |   8 +-
>   21 files changed, 589 insertions(+), 1431 deletions(-)
> ---
> base-commit: 670bacfc7579bdd79a3069cfb5ab60a6a7923003

I was trying to test the patches, unable to find the base-commit, are
you using drm-misc-next?

Regards,
Swamil.

> change-id: 20251014-feature_tilcdc-79cd49e67bf9
> 
> Best regards,

