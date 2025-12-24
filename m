Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC91CDB8BB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 08:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6002B10E109;
	Wed, 24 Dec 2025 07:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="MMFxI03R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011008.outbound.protection.outlook.com [52.101.52.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285BE10E109
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:00:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hpRdCZviw4IqwsbDq1/BeXGZ2kGIvnGCVTN8Z3oImLDLSj/wu7vVG4ahwh8xpJ0A22qcc6AimKhN+8UIEvwOTnt0dj/q5qiPoLC2YYb/YvctwBhDV/n/eeEPTW2qddVj+VVe28R3Ow058fCMYqEz/o4EE0zVO9t1dzzBnLdi2kCGjrUhsVvnLo/K7TrgxagBdh3oCtAQo07VawlS12foOOv23AvFtDDzfpm+rxAc7HsBlkGRbZtKqcIIv2/yuLlycP+b3I7dRqqqyUyT890TiKwn02+f3OY9WojMNFFa6PEjB7XH2uY46WxDyj9v7LWW1BEBUUDHo0uXi17R2nymog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjPOXf6UIpBH3DjNVSSvff9U2HA2ENTvrG1H6wH71iE=;
 b=x6AhlYBcAQ+c4NHsguX7URg/6tnnSpZY7paW94ASYMvFWbQH2CtLfyXN0txMqwpjCnFNRHGmSijvUcqAZSGLXZQIr/X71vOTTTLxeG/BPeLmpJ7/VGWk9+0TkWjs8p1eJJMtYveMixllCLJntOLJjffgUDZXOw4hQq/cEmTfkg+XyTIB/EJuBc2furA0IqqumbJHFLO9iWGu1RTCawa5SkNVZ4GmgvB+E5fCiNgwiQkR+W6NLKN8a0GqUDNu3Rfgzs0k0wMoZkHdZG9lPUGAQfOSrZia/lgfjhPBvLhJcFq6qHS48R8ySK1GRTcPkWOJ+9uejYYOdUyKciySybn0Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjPOXf6UIpBH3DjNVSSvff9U2HA2ENTvrG1H6wH71iE=;
 b=MMFxI03Rc5rQjuGVCUUQjokHs/5I06pjwfIFaw+3BZ98ZoFUUPhMRWEew2Gj1U/BZMU/NHWC75xI7gjqTQb156lpfDgAzUnMkGCd4lwcVJoGPpls6RDqhtIy9spNNGF6nfgMh0Pns5NYvDD5Fl2iDPzcxx02rquNV0QTKGmgHOo=
Received: from SJ0PR05CA0007.namprd05.prod.outlook.com (2603:10b6:a03:33b::12)
 by IA3PR10MB8637.namprd10.prod.outlook.com (2603:10b6:208:577::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 24 Dec
 2025 07:00:03 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::7a) by SJ0PR05CA0007.outlook.office365.com
 (2603:10b6:a03:33b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.11 via Frontend Transport; Wed,
 24 Dec 2025 06:59:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Wed, 24 Dec 2025 07:00:01 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 00:59:57 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 00:59:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Dec 2025 00:59:57 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BO6xohn164077;
 Wed, 24 Dec 2025 00:59:50 -0600
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dmitry.baryshkov@oss.qualcomm.com>,
 <sjakhade@cadence.com>, <nathan@kernel.org>, <dianders@chromium.org>,
 <luca.ceresoli@bootlin.com>, <andy.yan@rock-chips.com>, <xiqi2@huawei.com>,
 <mordan@ispras.ru>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <aradhya.bhatia@linux.dev>,
 <devarsht@ti.com>, <s-jain1@ti.com>, <tomi.valkeinen@ideasonboard.com>,
 <u-kumar1@ti.com>
Subject: [PATCH v6 0/2] Add support for DSC and FEC for cadence MHDP8546 bridge
Date: Wed, 24 Dec 2025 12:29:47 +0530
Message-ID: <20251224065949.2268373-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|IA3PR10MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: b73da55c-31b8-4af3-ea5a-08de42ba0f2f
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|7416014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pt5Emoc163hrq0CTp8iUroHh3xDhaFrQdbShb0jhB9uqeCzN5uftAT3/Xtzm?=
 =?us-ascii?Q?2pr3zC41XAWXYFh+goaGu56DlGMPEubPIjjnSw08ZeodLdrgYfZUl3v4BkTn?=
 =?us-ascii?Q?baWra3kNs3JvSIX9dT8f6k2aQLiceRWX+g9Zb2mIZynEXo+Gaop1FXzxLL+C?=
 =?us-ascii?Q?Zj4ySrQtQgzSOQFfBMBYX1fxTYYuBjAl3vTbE/nmXRGAdcro4JOXIQyUC6Ib?=
 =?us-ascii?Q?rbdk1iIYVNmiqBRzVydj+p7H4c2VsCndMdTdVtG2IR85WSy9bxJ62e5uZ3Yz?=
 =?us-ascii?Q?Ex6yLAZVkq5vgs3Y92XHCMDD0mHpeT42hUNusADol8P65GdmHr1CeyrvBtfg?=
 =?us-ascii?Q?GgslCZ0kr4PjF6iJhm2fyYhNBAwwCk1PjNjy5/mFILtcqaoaTc9HdLQ+gMps?=
 =?us-ascii?Q?vwk546op+xtAK0fzH7MKt1Hnn+NDwl1Bnm7WTpF48GEKA5duJaQMyufnemUb?=
 =?us-ascii?Q?ahXFzEER895xKRLEaw7ibwdEs8Rjr3SrXMudYT2Vc/F9knnZareXm3UJUmhb?=
 =?us-ascii?Q?0rcJX3SMKJaPR1tvNjmVA9+g9vwtool3oL+RwXkOh2fkXzV5JnJdcPy6wpse?=
 =?us-ascii?Q?Q3jFtQUK0i+frCcTRNjVMXDOxBBCkv92ZyZSKLDLnIbQrlpNEr6XoLkHf6ma?=
 =?us-ascii?Q?ti7YOsHqT/MknmE6dSqCM2HjYX9pvcTgHNBJoZdHOzTRHFGy4esGKaT3ol2S?=
 =?us-ascii?Q?NI8oxORw0xYJcm6Vokm8ESUEK4AA4YKSUIwSzrGpjkW+8b61/vB3QnN98SsJ?=
 =?us-ascii?Q?xT2LoxknZ1IaVyesnVf/g748dwhNNeI0P+5mF08v/AGJd6g2u+TfQbLR92M4?=
 =?us-ascii?Q?vIw1X7ro2FmdyzEC1EronwNom5BaIg0Xkqy6/cywlTgSC7ve1D1ZhIT8BRNV?=
 =?us-ascii?Q?4nMH1U/FyfeUBZkwZTygO239hwqX9zJWgFHsE33pR8ONFL/JEGFEmJR0sr/7?=
 =?us-ascii?Q?MGpKQX4d4WJCs3LBn+lmVwC3WwHW4ppY/XnONqBhdQ1Q8E3A5i8O/VZvedBf?=
 =?us-ascii?Q?xzdcYVnVno/+6v8On5fUvFfhsfZifCGd8NUt5muW2XYf9AXls1MbZPMDZfq7?=
 =?us-ascii?Q?NhTg/meGATmibR+RZ7LxjkVO1D23nVpvoQIV2RSxJb5cRubb6JISopGp2jaj?=
 =?us-ascii?Q?kG1vKEPUeYHuBozfBZMw1AU2GM88O87Tuwr1UTn1T4/i3yokdeCl0a2lrcy3?=
 =?us-ascii?Q?OTDyL4N9s4rfs13YbcAivm8yZY7c2JYhgiIeW1yI7VSlMl8ljW3hu24VAW3K?=
 =?us-ascii?Q?Q+xrrsKg7YJ8behTk3/qNGZV/2rT7TLa/hQAY0Y1hnoZrZ6MG13YgG7svZzE?=
 =?us-ascii?Q?0f9Nr9mGNRjzL74trDAHLhZyow3+VO1ot7oqlMJPPJYAP2Re2gOmQ3CkHBAF?=
 =?us-ascii?Q?hpHUjXrb7oehqGcXD+gxo494kU79a2gnVA69TfSCJukI2e5zLLqdHTTpF4DF?=
 =?us-ascii?Q?V/2NjS/DjncvEv4K9g/kUt+hAntG8svA7wSe+IvfsdcCPsXNvYF1sOZp8k4n?=
 =?us-ascii?Q?UpjNBihD4hgokybwzMsEVvfpnMfT4cCVC2cx3GM2dTHb1uVV48OH3khRmCv3?=
 =?us-ascii?Q?zCZbhIsY3EqxDU2GjsPatNpFADZq+gLxNQoNe6CM?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 07:00:01.8665 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b73da55c-31b8-4af3-ea5a-08de42ba0f2f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8637
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

Hi all,

This patch series extends the Cadence MHDP8546 DisplayPort bridge
driver to support Display Stream Compression (DSC) and Forward Error
Correction (FEC).

DSC acts as an encoder block: when the sink reports DSC capability,
the DPI input stream to the MHDP8546 TX is compressed, and the sink
decodes the stream for display.

The first patch add the DSC module to the code.
The second patch implements the corresponding driver changes to enable
DSC and FEC when advertised by the sink and configured via DT.

Link: https://www.ti.com/lit/zip/spruil1
TRM File: SPRUIL_DRA829_TDA4VM_Technical Reference Manual.pdf 
(Figure 12-1115 and DSC related sections) 

Link to v5:
<https://lore.kernel.org/all/20250915103041.3891448-1-h-shenoy@ti.com/>

Changelog v5 -> v6:
-Drop binding patches, changes done in binding via fixes patch
<https://lore.kernel.org/all/20251203-caped-bullmastiff-from-jupiter-3dcaf3@quoll/>
-Split the implementation of dsc and adding support to driver parts of patch.
-Add a version check before attempting to read FEC capability.
-Reduce log level to debug for cdns_mhdp_fec_sink_support.
-Use the newer DPCD helpers that return 0 on success instead of size.
-No Need to Read Back DPCD.
-Optional Feature Messaging for FEC.
-Add FEC check before attempting DSC.
-Simplify initial lines calculation.
-Formatting issues in SOURCE_PIF_PKT_ALLOC_WR_EN_EN writel resolved.
-Use sizeof instead of magic number for pps_infoframe.
-Use forward declaration and remove redundant headers.
-Add DRM_DISPLAY_DSC_HELPER as dependency.

Link to v4: 
<https://lore.kernel.org/all/20250909054622.1439487-1-h-shenoy@ti.com>

Changelog v4 -> v5:
-Defining reg-names item list in iF conditional, added 
description for reg-names.
-Verified the bindings with cdns,mhdp8546 compatible.
-Add code for enabling DSC in bridge driver.
Log link-
<https://gist.github.com/h-shenoy/0318e2c6e7df539e6bdd39b77e5a8f05> 

Link to v3:
<https://lore.kernel.org/all/20250908054609.1113360-1-h-shenoy@ti.com/>

Changelog v3 -> v4:
-Remove maxItems as item list is mentioned for reg-names, resolves 
dt_bindings_check warning.
Log link- <https://gist.github.com/h-shenoy/5391ea514bb58a6cba3f39248d20916b>

Link to v2:
<https://lore.kernel.org/all/20250903111357.2605199-1-h-shenoy@ti.com/>
Changelog v2 --> v3:
-Update the name of dsc register block.
-Add the reg-name list in conditional based on compatible.

Link to v1:
<https://lore.kernel.org/all/9599e17c-96d5-448f-96a2-bbcfcc3657a2@ti.com/>


Swapnil Jakhade (2):
  drm/bridge: cdns-mhdp: Implement Display Stream Compression (DSC) for
    cdns-mhdp driver
  drm/bridge: cdns-mhdp8546: Add DSC support for Cadence MHDP8546 bridge

 drivers/gpu/drm/bridge/cadence/Kconfig        |   1 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 357 ++++++++-
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  69 ++
 .../drm/bridge/cadence/cdns-mhdp8546-dsc.c    | 718 ++++++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-dsc.h    | 284 +++++++
 6 files changed, 1409 insertions(+), 22 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.h

-- 
2.34.1

