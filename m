Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5336EC9EF1E
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 13:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E40610E120;
	Wed,  3 Dec 2025 12:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="DPET5RQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4937910E120
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 12:14:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFVZc4uiOLn9FwQ/YVSv9wO0+vJMe33dMrNjBJkLzQU6Ozr5iortp8aCZo+DgugSxlpkt45udZuelwJlACBSzN+0OGCsxjph/5WHfsRonqPhwfRe5s5RuPPtB6v6oCAv+CevgFB4wkWtBvKIzbzOQ5W4q6pPTl6jvr8s/ghjRCS1v2HSe3+jPWm9+ob/iI/AqxKoSY22rJ956Igaj757TiHuaKbwYYvLJeHgZoKksAnuvkCiBoDfhI2MLJ5jd7kphncIzREX36ciM899unyemeoFEmOEMmKvntVTJfQgTvNLMHfrDjgWL13gXDh25+pT7sID0oMEvpKPut5ATZyt5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FItVlMrRvYSm/z5YIX5F8uem2kZe0Wd8fwcWbKXfT0=;
 b=dlaqPU76ALTAtR/9RS6lyC6s7KMnd6IQlDOV0A+5auKlYmFrOplBAyVGbqVhw7r2oMKgWxju4tdJiRxGGYoOJn2ljHy+nhnokuxQbr3OrlCqWKxtsgCxZvoY+fYKTluGP+Kjp74lFGDwZ7LqCm/TV/LVx1b0SuXZpPDhrJDksK0I9KLIaHQ2Ck1R5hhf3azuMwDtnm7z7KWYUTOFd2EhK/xoQIcREtbNsYthfcsK2xMEKNSwffILdSmw7HDsuJDOiwXhkISPV682xB+bDjwMVWl+VDLViPltQvMWYPWZE59o8Ue2Z/+dS6e5TPXpTrgr4z5Il1fXdru+KXn5IJ5TUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FItVlMrRvYSm/z5YIX5F8uem2kZe0Wd8fwcWbKXfT0=;
 b=DPET5RQiInC2S0YlnsqIfXVR2fpCqvEF2SwlijrlRdqdsDvd6MZaL2bZ981BELgq2llii1om5ZMiFCWoqSz4++kBAQ8jAGfhb23AAOUeUNiGVhrrF6PXIWXyKJl8iDj+ItbpUYSQVmSXURaCTbe+0G5F9+x+5cBQZ6KS86jbhpQ=
Received: from BYAPR01CA0065.prod.exchangelabs.com (2603:10b6:a03:94::42) by
 CH3PR10MB7416.namprd10.prod.outlook.com (2603:10b6:610:156::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 12:13:57 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::d0) by BYAPR01CA0065.outlook.office365.com
 (2603:10b6:a03:94::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Wed, 3
 Dec 2025 12:13:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 12:13:55 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 06:13:49 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 06:13:49 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 3 Dec 2025 06:13:49 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B3CDdJN3987980;
 Wed, 3 Dec 2025 06:13:40 -0600
Message-ID: <3ebd23db-8ebb-4b04-88a6-415ce92da131@ti.com>
Date: Wed, 3 Dec 2025 17:43:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] Clean and update tilcdc driver to support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Kory Maincent <kory.maincent@bootlin.com>
CC: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Russell
 King" <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <7b8e22d1-a872-4ea0-8fce-4323d2bf81ff@ti.com>
 <20251203114941.1fafd9dd@kmaincent-XPS-13-7390>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20251203114941.1fafd9dd@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|CH3PR10MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 68b2731b-44af-434e-464d-08de32656e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|36860700013|376014|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0FSTnVLUDd1bVJ2T3Nma3BBaHk5RXJxcVB1L0hyUXBrVDErZlptZmhqa2p4?=
 =?utf-8?B?R1ZseXhMRVErcmZmYUlBdVRlV3A4cDVNcFR0QnZ4VlRRQkg5QzNiMXI4TTdy?=
 =?utf-8?B?MmF6OFpMalJYdnRmekcrSGFJU0JLU0o2dm1HRjVlbmpOZTA1MzRSU1QyRG0x?=
 =?utf-8?B?OXhPSlI2dSs1Z0t5eHRCVXhlNFRTQVFjRjk0K0dCNjVSTjNNNzYzcUpVQUpP?=
 =?utf-8?B?b3NGd1hkNE84S3A5R1lwYll6dlNiY0p3MWtQcnpNZkNDeDkwTUJ0MVl6em1n?=
 =?utf-8?B?TTNadHYyYzJTRWJlWWxBWGFSdlpGZnNjMFpsNHpZQjhXVUlYMzVoNVVENFE2?=
 =?utf-8?B?azMzblp6VTEzNVZUdFY5T2xzaCsrTDI2QUx4QmU0SU1QNUlSUDB5Sm55cW5k?=
 =?utf-8?B?UE5mNlBpb2kzVGNBTVNzUTJNQjVOVVZiNVQrdmlqRzh3alNEc0Y1YkFKTEZm?=
 =?utf-8?B?QWE3NEQwSCs3VGxyM290REdyNFh3K3FqOHF1UVgzOHN6cGhoelVSV2pQS2NC?=
 =?utf-8?B?a05GZ1Z2dXVYSnlINWt1R2hCTUo4ek52K0QrcHN6dWxCcDVqdzZQMkd0MktP?=
 =?utf-8?B?cnFZSWo5U1hhMERhNGtzaDd1WjkrSzZlMGJ3RWhLanpheThSc3BwVDBVYnAx?=
 =?utf-8?B?K2E0cnJUYlpCQ2xGVCtLYUFFWTN1UmVUL2N4M3pVNkJtSzV6dkpWWW1aNkFR?=
 =?utf-8?B?TnZ3cS9rd29ibGljSWRlQy9nT0d1OGR5cExYc2ZuaFhJenpQNmtCR0lVMkM1?=
 =?utf-8?B?ZGRUeno5VGpna1plOHlXSkJYemVJdE1HT3JWK0VibjkrVUNJZDZZTExQOEto?=
 =?utf-8?B?QUVKY254dDhoTFlFVGs1OE9JVUFDZEFENGF0Y3FMWDNMWnhTck1rVERxa2tx?=
 =?utf-8?B?ZFpFTHpyd0s5bFFyQTNZdnQ5cmZxV1g3bnBDUnRyNkVmdzc4Wk5SWHNQMEJS?=
 =?utf-8?B?ZC83SjhLMVlzLzQ3U3ZvYldsbEJFUHZKM0tXazY2QnJVcWsxTWg3bUx5NDEw?=
 =?utf-8?B?ZDlNajRuT3ZudUp0aFp3U3BaWmUzL1lucjdySnhsZU8rdHlFVXRBZ2c3S09w?=
 =?utf-8?B?RnpJYXpuVHl4MGdldzkrbVZINWFpREFaSzdZZFVjdXQrU2p3dU42TXpyWjhN?=
 =?utf-8?B?VkltNFR3b1ZPdHdwSzhnY1FNWWYvZDdZWkVlWXNQZDhVY29mR3VtVnhkZTU3?=
 =?utf-8?B?YWh3amY5Z3UzZjgvRUNHSXR2T2I2aS9Kb3Q3Y3NHeU9NeG82Y2k1cmhYeEJN?=
 =?utf-8?B?VFVBZlpUcm9FM25SanJTdGJJWk53OUFteDljWjZRQW8vMkpmZ2F0aStRNy8r?=
 =?utf-8?B?WUM3ZGpoQjdZdTBxRnR3SWRnNWc5MzkwTHYwelZEaGMxYnFaR25DYkxnS3hv?=
 =?utf-8?B?ZjFOK1ZtS25BSFIrZU5zaENGUzNSUkU4NElxeFlwWnpwWTBnaUVyVm1YVWFY?=
 =?utf-8?B?d1NmdjJOQk9zYXM5THBxWHFrUmJoODhuekVqeTdiY1pjOXFVYk5sT1FucmRN?=
 =?utf-8?B?aHhUVmFRSmU3OEFYSWVuRDVJU05nM21zeSsya0U5Q29VZi9XY3U3OHhETVRH?=
 =?utf-8?B?eml6d0R1M0NjMGpEZVlISTN4SS9MejVCT2VZaVRzM3BiTVhDWU5Yd1RYenRm?=
 =?utf-8?B?YUdXVWxjdGtGbE1xM0FqN1ozeXYxN2E0TXRCN2Z6eDh4Q1MycXZyR0hodTlN?=
 =?utf-8?B?NXR4b3NZL0c3STRFNzVkTi9Ia2V2WHJUZnR0VW5ob3AvMnRFcWo3WFZjenFE?=
 =?utf-8?B?Qnp6WG16R1hmUFdLNG9Cc3FBQVpDenRBK1NNVW92NG13czh1VXpoT3BWQm8x?=
 =?utf-8?B?WU1JT3h3TlY5SzRSN1A2UHNqU3ZaTzBxb3hVK0cyMGg0U1pXVmp0ZVhqR2hY?=
 =?utf-8?B?dGdFNkFWTVhMbnBjRHVsSWI2VHdqRnNRclVteVZTci9DT2wya1NyNTVWV21P?=
 =?utf-8?B?Z1B0RUN1Y3RGMVk4cFY1NDRSTmgzTFNzb29xNllCRFNWRDhCSGNRSC9KODhZ?=
 =?utf-8?B?RTNNVHpwVW5ndGE0V1B0L09rT1J5bWNERHlGbmdwYm4vd2sxcWVVMTlWak9P?=
 =?utf-8?B?ZXQxZVpsZFpUZ0pwa1JFMmFmRnQxeERrUlNtNFhITlZWTUFzRVlYSG92STRK?=
 =?utf-8?Q?NS4A=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(7416014)(36860700013)(376014)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 12:13:55.6336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b2731b-44af-434e-464d-08de32656e54
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7416
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



On 12/3/25 16:19, Kory Maincent wrote:
> On Tue, 2 Dec 2025 17:55:15 +0530
> Swamil Jain <s-jain1@ti.com> wrote:
> 
>> Hi Kory,
>> Thanks for the series.
>>
>> On 11/26/25 23:05, Kory Maincent (TI.com) wrote:
>>> The starting point for this work was adding support for the HDMI cape:
>>> https://www.seeedstudio.com/Seeed-Studio-BeagleBone-Green-HDMI-Cape.html
>>> This will be sent in a later series.
>>>
>>> Initially, Miguel proposed modifying the ite-it66121 bridge to support
>>> the legacy behavior without the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag:
>>> https://lore.kernel.org/lkml/20250909-it66121-fix-v1-1-bc79ca83df17@bootlin.com/
>>> This patch was NAK'd as we don't want to add more legacy code. Maxime
>>> requested that the tilcdc driver be updated to use
>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR instead.
>>>
>>> While working on this update, I discovered that the tilcdc driver
>>> contained significant amounts of legacy code that needed cleaning.
>>> Since this driver was developed alongside the tda998x driver for
>>> several AM335x boards, the tda998x driver also required cleanup and
>>> support for the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>>>
>>> This series is based on the tilcdc fix sent to mainline:
>>> https://lore.kernel.org/lkml/20251125090546.137193-1-kory.maincent@bootlin.com/
>>>
>>> Patch 1-7: Convert tilcdc binding to YAML and remove the ti,tilcdc,panel
>>> 	   sub-binding and driver
>>> Patch 8-16: Clean up tilcdc driver
>>> Patch 17-19: Clean up tda998x driver
>>> Patch 20: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support to tda998x
>>> Patch 21: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support to tilcdc
>>>
>>> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
>>> ---
>>> Kory Maincent (TI.com) (21):
>>>         dt-bindings: display: tilcdc: Convert to DT schema
>>>         dt-bindings: display: tilcdc: Add fifo-threshold property
>>>         drm/tilcdc: Remove simulate_vesa_sync flag
>>>         drm/tilcdc: Add support for DRM bus flags and simplify panel config
>>>         ARM: dts: omap: Bind panel to panel-dpi instead of ti,tilcdc,panel
>>> driver dt-bindings: display: tilcdc: Remove panel binding
>>>         drm/tilcdc: Remove tilcdc panel driver
>>>         drm/tilcdc: Remove component framework support
>>>         drm/tilcdc: Remove tilcdc_panel_info structure
>>>         drm/tilcdc: Remove redundant #endif/#ifdef in debugfs code
>>>         drm/tilcdc: Remove unused encoder and connector tracking arrays
>>>         drm/tilcdc: Rename external_encoder and external_connector to
>>> encoder and connector drm/tilcdc: Rename tilcdc_external to tilcdc_encoder
>>>         drm/tilcdc: Remove the useless module list support
>>>         drm/tilcdc: Modernize driver initialization and cleanup paths
>>>         drm/tilcdc: Remove the use of drm_device private_data
>>>         drm/bridge: tda998x: Remove component support
>>>         drm/bridge: tda998x: Move tda998x_create/destroy into probe and
>>> remove drm/bridge: tda998x: Remove useless tda998x_connector_destroy wrapper
>>>         drm/bridge: tda998x: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
>>>         drm/tilcdc: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
>>>
>>>    .../devicetree/bindings/display/tilcdc/panel.txt   |  66 ---
>>>    .../devicetree/bindings/display/tilcdc/tilcdc.txt  |  82 ----
>>>    .../devicetree/bindings/display/tilcdc/tilcdc.yaml | 103 +++++
>>>    arch/arm/boot/dts/ti/davinci/da850-evm.dts         |  26 +-
>>>    arch/arm/boot/dts/ti/omap/am335x-guardian.dts      |  25 +-
>>>    arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |  21 +-
>>>    arch/arm/boot/dts/ti/omap/am335x-pepper.dts        |  22 +-
>>>    arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts      |  25 +-
>>>    arch/arm/boot/dts/ti/omap/am335x-sl50.dts          |  25 +-
>>>    drivers/gpu/drm/bridge/tda998x_drv.c               | 251 ++++++------
>>>    drivers/gpu/drm/tilcdc/Makefile                    |   3 +-
>>>    drivers/gpu/drm/tilcdc/tilcdc_crtc.c               | 117 ++----
>>>    drivers/gpu/drm/tilcdc/tilcdc_drv.c                | 456
>>> +++++++-------------- drivers/gpu/drm/tilcdc/tilcdc_drv.h                |
>>> 88 +--- drivers/gpu/drm/tilcdc/tilcdc_encoder.c            |  93 +++++
>>>    .../tilcdc/{tilcdc_external.h => tilcdc_encoder.h} |   5 +-
>>>    drivers/gpu/drm/tilcdc/tilcdc_external.c           | 179 --------
>>>    drivers/gpu/drm/tilcdc/tilcdc_panel.c              | 408
>>> ------------------ drivers/gpu/drm/tilcdc/tilcdc_panel.h              |  15
>>> - drivers/gpu/drm/tilcdc/tilcdc_plane.c              |   2 +-
>>>    drivers/gpu/drm/tilcdc/tilcdc_regs.h               |   8 +-
>>>    21 files changed, 589 insertions(+), 1431 deletions(-)
>>> ---
>>> base-commit: 670bacfc7579bdd79a3069cfb5ab60a6a7923003
>>
>> I was trying to test the patches, unable to find the base-commit, are
>> you using drm-misc-next?
> 
> It is based on the tilcdc fix as explained in the cover letter.
> https://lore.kernel.org/lkml/20251125090546.137193-1-kory.maincent@bootlin.com/
> Therefore you won't be able to find this base commit hash.

Sorry I missed it. Thanks for pointing.

Regards,
Swamil.

> 
> Regards,

