Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C90CDB8C1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 08:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E20910E338;
	Wed, 24 Dec 2025 07:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="gsAP4HuL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442D410E338
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:00:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0K/8PPQFJg5XP0izcJ4XpILraz9yj3DGZSXoIyzvks7C4SJesFwwPA4tHmYTPc9eYSMIx6MoOxMqqmOJSOWADidG4v5J2hEMeol8P+F3FX3tp0fA4skiArrSn2SC7vPaP3lrevgJQcsu7I7GE4Gr7L4ipNN8j1GrN6YmrScA1y6nNVbj/shu/mgLi0C4fwph9Ek7kx/gg5viNYxzlxpTuoXbJRVF75x0miE6qg+Vgwh0nqq57/hvUa/lY1fYVpvTt81Vcn/jC1LWceWD2yQ/7CHbgc86cPZFIDnhg1xYESzq+gAGogvmc8cAYCOwuVZiEY3KaR39VaLTItNPW9cdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/YaZNbOmTjiqw3aSslspm5ia/VYumGs/a1ujF2Z99U=;
 b=Dj1C/PE5/p9dm2y20PbIzQQw1wAqZdsNbBPvhscoQfFBlXVSU29Q5sYwXzU5AGdHQTpYEN+pynAmcOWiKfZj4qhmvIs5V5Tg3fLhUKW7yHUryoCkP/MTgwH7S6OquErM0cfQ5bOQQNox3EySunXNkSKYraOnki1zt17xYAl5JjtOV4MgrglKSwjtljx0hOLRu4Bte2Buonoq+yHAGsCjAQwywJmcp+0AGXczI3J2QdygSmWK64yZfONyLu0pH4OmYdStMXplGDuM4Zx7E5LFXhg7kmpY61OeUP9GA+1A57rqu3GiBOrvzXjBDBEC3oaGHGQCoI9Q8ZUp/7YORfQOEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/YaZNbOmTjiqw3aSslspm5ia/VYumGs/a1ujF2Z99U=;
 b=gsAP4HuL1ARykAWabMnt4QIzYYDF2sxalBkoabvMHbD/QBqP3/ok3YSPfRry+4HPl60+w0+3mRf27FwQSnpX52KIzdvsfmFYVNJPVPMZrRvH03hO5cgofNXflmMi56WBzQs5Mc41OoqnOP7UcLoLp0XdQF/mhgqoGyT+rgrJWWM=
Received: from CH0PR04CA0063.namprd04.prod.outlook.com (2603:10b6:610:74::8)
 by PH3PPFF6F1F7CB1.namprd10.prod.outlook.com (2603:10b6:518:1::7d9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 07:00:10 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::49) by CH0PR04CA0063.outlook.office365.com
 (2603:10b6:610:74::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Wed,
 24 Dec 2025 07:00:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Wed, 24 Dec 2025 07:00:07 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 01:00:04 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 01:00:03 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Dec 2025 01:00:03 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BO6xoho164077;
 Wed, 24 Dec 2025 00:59:57 -0600
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
Subject: [PATCH v6 1/2] drm/bridge: cdns-mhdp: Implement Display Stream
 Compression (DSC) for cdns-mhdp driver
Date: Wed, 24 Dec 2025 12:29:48 +0530
Message-ID: <20251224065949.2268373-2-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251224065949.2268373-1-h-shenoy@ti.com>
References: <20251224065949.2268373-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|PH3PPFF6F1F7CB1:EE_
X-MS-Office365-Filtering-Correlation-Id: cdecd610-b2c9-4410-0278-08de42ba12c2
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xr/9pUyZC9pr2Ta3l0eWW+jtSXHCNYZ08TH3d1Mrf7U2CWfyXpebl3Xd9cCN?=
 =?us-ascii?Q?u2+SwjwmaxwTeoXJVM3L9xUPBsBFFdjRDXPlPyDqCyvLZos7pPipo9Kwy+k6?=
 =?us-ascii?Q?mO308TLtHE7a+6D1NwdU0aYzGkA1X0eZSM2X27YFLXWYUhJM1KB6PcJ+h/m4?=
 =?us-ascii?Q?zta0VyQ08X6a50U9nEogyRwJLT45PRB7jUBqfY18Xr35ck6l0sGoIccZqpMs?=
 =?us-ascii?Q?N0MD1WwVJAk3p7NLlzsYxhf7TjGKup72qU9Db+fZoomBRiHfvtyToaxG+coq?=
 =?us-ascii?Q?q2oiIh2B8m/OUXsa3aP5H03bSWtwlBe0uDNc+qBWR/a4lJclyRtGogOg4qCr?=
 =?us-ascii?Q?DU7yMdr72z2IU2c24tuR/xFXDZJMTqU15uVsfpBE4BhPZqo5bEkynEzFSf5U?=
 =?us-ascii?Q?Kkp7x0r/Rf1Bv163u6My1zdo921UmIne/Yj4mDV+vghL90lda39bofIYB5V/?=
 =?us-ascii?Q?I7bUbFSlivBqQl1/kkVASQEunR5snbwbugOlCZKmbt7VAsf+jrt6RXzm+zrv?=
 =?us-ascii?Q?ECNa9CWC2Pkxv0sUYUPJ5YSNRaBDe2tVnD+NnT4gE0UauNrh40lHL3aZavqk?=
 =?us-ascii?Q?dN3a45OEF+GdMIaLAD2c+FDYovMHBvxF2ldAfnAuWaq0M34GwfgXeQNRH/Dt?=
 =?us-ascii?Q?09BTYHZIFsryPL9RNKzvQva80t50m/6KVqOxfFArmkJtm81eGyrc8r26xIzG?=
 =?us-ascii?Q?LwHfJGsFrKb/IPca4W13eT90GmdqGVuyVt/ZaADkY8TA8/jXHqB87Hp2E/cc?=
 =?us-ascii?Q?qcHkTSTlgZXGo2tQrxii4RsWI3vONBqR2bDMvgzSv7GT3WezYMZkqZrchBzH?=
 =?us-ascii?Q?HPOe5Ej9E26kxIIhp24+dG9fjjEziJgMy9YZO7NCEXQGWDxao57t9k0xDREQ?=
 =?us-ascii?Q?0c7FCCjGRl8fvEig45phJk2zwuGgmHpLc4kYBQXxIqKpltm5PCpamICqXkgG?=
 =?us-ascii?Q?zQCBQt8HjHd+qYQPTCrVclHr6oIRj4EM5d4FjnIJ6YrAAOCjcOJoYaDc/HE4?=
 =?us-ascii?Q?xuglpsEBrJv7368W7D0x0vq3PClDAR6PInHA5vNoOuBoWndqsq3lzG+WnEth?=
 =?us-ascii?Q?lwARLxAOe7hDTJY33l+ACIz/pYTNk4AuQ2stIiVkaYjNFWLcnb/ZUSaF+4QN?=
 =?us-ascii?Q?JVFLE5MTAIQEZg7QYSiBTcaAYWqgvNRpWPxNmfw3uGOvrBNz4kMQ+mQvOeS2?=
 =?us-ascii?Q?KOttEYfZFQVjDebTkYKH4c05hjAt8V3Lwl8V73/rgTSEirUKI/APgDltakfW?=
 =?us-ascii?Q?7407f3XBn5zUWrnHIQGaSV63pQhEJKeYFtSk6HaK1qBiwMP0kbEAxrQJg+02?=
 =?us-ascii?Q?dnykSxDggJEPzGDVD4G2WoMtV+zjE/z3A2nI1zo/WupBSZXXKU8DOLQj0LZ1?=
 =?us-ascii?Q?++Rh7LY7vAma2KX5MuwvBgkfzXsg4xLZ3pdluvuLYH96sLL7Lcr4uclAyhsy?=
 =?us-ascii?Q?1cr9urGqOwdCT9ImQ7uQWzoeH8GlVi/htv6nW2exBMZdRLrwTob8tr/Bf6/K?=
 =?us-ascii?Q?uRnNFm02apb/IxG0HEd70lQ93kTvUk8c/IEVbAfal61nKT/Uw+k8OKarN8He?=
 =?us-ascii?Q?MFBsAnAVPNbiFqzWpfcbBuXRkf5gIlbWkSR/DZOV?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 07:00:07.8376 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdecd610-b2c9-4410-0278-08de42ba12c2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF6F1F7CB1
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

From: Swapnil Jakhade <sjakhade@cadence.com>

This commit includes below changes.

1)Add header file with register definitions and function declarations for
Display Stream Compression (DSC) support in the Cadence MHDP controller.
This includes register offsets, bit definitions, and helper functions for
DSC configuration

2)Add support for Display Stream Compression (DSC) in the Cadence MHDP
controller.

This implementation includes:
- Functions to configure DSC parameters based on display requirements
- Register programming for the DSC encoder
- Computation of compression parameters
- Support for sending Picture Parameter Set (PPS) data over DisplayPort

3)Add the necessary data structures to the cdns_mhdp_device structure to
support Display Stream Compression (DSC). These include:

- A pointer to DSC registers
- The DSC configuration parameters structure
- DSC capability and state tracking fields
- FEC enablement tracking

These fields store DSC parameters, capabilities, and state information
needed for configuring and managing DSC compression in the Cadence MHDP
DisplayPort controller.

4)Add the Display Stream Compression (DSC) helper dependency by selecting
DRM_DISPLAY_DSC_HELPER in the Kconfig for the Cadence MHDP8546 bridge.
This enables the driver to use common DSC helper functions from the DRM
subsystem when implementing DSC support.

5)Add the DSC (Display Stream Compression) implementation file to the build
by including cdns-mhdp8546-dsc.o in the cdns-mhdp8546 module build list.

Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 drivers/gpu/drm/bridge/cadence/Kconfig        |   1 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  69 ++
 .../drm/bridge/cadence/cdns-mhdp8546-dsc.c    | 718 ++++++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-dsc.h    | 284 +++++++
 5 files changed, 1073 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.h

diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index f1d8a8a151d84..fd25e4e8dcc4c 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -25,6 +25,7 @@ endif
 config DRM_CDNS_MHDP8546
 	tristate "Cadence DPI/DP bridge"
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
index c95fd5b81d137..7957fbdc1b781 100644
--- a/drivers/gpu/drm/bridge/cadence/Makefile
+++ b/drivers/gpu/drm/bridge/cadence/Makefile
@@ -3,5 +3,5 @@ obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 cdns-dsi-y := cdns-dsi-core.o
 cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) += cdns-dsi-j721e.o
 obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
-cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
+cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o cdns-mhdp8546-dsc.o
 cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index bad2fc0c73066..fb06576162ee2 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -16,6 +16,7 @@
 #include <linux/spinlock.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_dsc.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
 
@@ -66,18 +67,30 @@ struct phy;
 #define CDNS_VIF_CLK_EN				BIT(0)
 #define CDNS_VIF_CLK_RSTN			BIT(1)
 
+#define CDNS_SOURCE_PKT_CAR			0x00918
+#define CDNS_PKT_DATA_CLK_EN			BIT(0)
+#define CDNS_PKT_DATA_RSTN			BIT(1)
+#define CDNS_PKT_SYS_CLK_EN			BIT(2)
+#define CDNS_PKT_SYS_RSTN			BIT(3)
+
 #define CDNS_SOURCE_VIDEO_IF(s)			(0x00b00 + ((s) * 0x20))
 #define CDNS_BND_HSYNC2VSYNC(s)			(CDNS_SOURCE_VIDEO_IF(s) + \
 						 0x00)
 #define CDNS_IP_DTCT_WIN			GENMASK(11, 0)
 #define CDNS_IP_DET_INTERLACE_FORMAT		BIT(12)
 #define CDNS_IP_BYPASS_V_INTERFACE		BIT(13)
+#define CDNS_IP_VIF_ALIGNMENT_LSB		BIT(14)
 
 #define CDNS_HSYNC2VSYNC_POL_CTRL(s)		(CDNS_SOURCE_VIDEO_IF(s) + \
 						 0x10)
 #define CDNS_H2V_HSYNC_POL_ACTIVE_LOW		BIT(1)
 #define CDNS_H2V_VSYNC_POL_ACTIVE_LOW		BIT(2)
 
+#define CDNS_DP_DSC_CTRL(s)		        (CDNS_SOURCE_VIDEO_IF(s) + 0x14)
+#define CDNS_DP_DSC_CTRL_EN_BIT			0
+#define CDNS_DP_DSC_CTRL_SW_RST_BIT		1
+#define CDNS_DP_DSC_CTRL_REG_UPDATE_BIT		2
+
 #define CDNS_DPTX_PHY_CONFIG			0x02000
 #define CDNS_PHY_TRAINING_EN			BIT(0)
 #define CDNS_PHY_TRAINING_TYPE(x)		(((x) & GENMASK(3, 0)) << 1)
@@ -121,6 +134,10 @@ struct phy;
 
 #define CDNS_DP_ENHNCD				0x02304
 
+#define CDNS_DP_FEC_CTRL			0x02310
+#define CDNS_DP_FEC_STATUS			0x02314
+#define CDNS_DP_FEC_BUSY			BIT(0)
+
 #define CDNS_DPTX_STREAM(s)			(0x03000 + (s) * 0x80)
 #define CDNS_DP_MSA_HORIZONTAL_0(s)		(CDNS_DPTX_STREAM(s) + 0x00)
 #define CDNS_DP_MSAH0_H_TOTAL(x)		(x)
@@ -178,6 +195,10 @@ struct phy;
 #define CDNS_DP_FRAMER_YCBCR422			BIT(2)
 #define CDNS_DP_FRAMER_YCBCR420			BIT(3)
 #define CDNS_DP_FRAMER_Y_ONLY			BIT(4)
+#define CDNS_DP_FRAMER_PXL_REPR_M		GENMASK(22, 16)
+#define CDNS_DP_FRAMER_PXL_REPR_DIFF		GENMASK(30, 24)
+#define CDNS_DP_FRAMER_PXL_REPR_M_SHIFT		16
+#define CDNS_DP_FRAMER_PXL_REPR_DIFF_SHIFT	24
 
 #define CDNS_DP_FRAMER_SP(s)			(CDNS_DPTX_STREAM(s) + 0x50)
 #define CDNS_DP_FRAMER_VSYNC_POL_LOW		BIT(0)
@@ -198,6 +219,38 @@ struct phy;
 #define CDNS_DP_BYTE_COUNT(s)			(CDNS_DPTX_STREAM(s) + 0x7c)
 #define CDNS_DP_BYTE_COUNT_BYTES_IN_CHUNK_SHIFT	16
 
+#define CDNS_SOURCE_PACKET_IF(s)		(0x30800 + ((s) * 0x40))
+#define CDNS_SOURCE_PIF_WR_ADDR(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x00)
+
+#define CDNS_SOURCE_PIF_WR_REQ(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x04)
+#define SOURCE_PIF_WR_REQ_HOST_WR		BIT(0)
+
+#define CDNS_SOURCE_PIF_RD_ADDR(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x08)
+#define CDNS_SOURCE_PIF_RD_REQ(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x0c)
+#define CDNS_SOURCE_PIF_DATA_WR(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x10)
+#define CDNS_SOURCE_PIF_DATA_RD(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x14)
+#define CDNS_SOURCE_PIF_FIFO1_FLUSH(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x18)
+#define CDNS_SOURCE_PIF_FIFO2_FLUSH(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x1c)
+#define CDNS_SOURCE_PIF_STATUS(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x20)
+#define CDNS_SOURCE_PIF_INT_SOURCE(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x24)
+#define CDNS_SOURCE_PIF_INT_MASK(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x28)
+
+#define CDNS_SOURCE_PIF_PKT_ALLOC_REG(s)	(CDNS_SOURCE_PACKET_IF(s) + 0x2c)
+#define SOURCE_PIF_PKT_ALLOC_REG_ACTIVE_IDLE_TYPE	BIT(17)
+#define SOURCE_PIF_PKT_ALLOC_REG_TYPE_VALID		BIT(16)
+#define SOURCE_PIF_PKT_ALLOC_REG_PACKET_TYPE		GENMASK(15, 8)
+#define SOURCE_PIF_PKT_ALLOC_REG_PACKET_TYPE_SHIFT	8
+#define SOURCE_PIF_PKT_ALLOC_REG_PKT_ALLOC_ADDR		GENMASK(3, 0)
+
+#define CDNS_SOURCE_PIF_PKT_ALLOC_WR_EN(s)	(CDNS_SOURCE_PACKET_IF(s) + 0x30)
+#define SOURCE_PIF_PKT_ALLOC_WR_EN_EN		BIT(0)
+
+#define CDNS_SOURCE_PIF_SW_RST(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x34)
+#define CDNS_SOURCE_PIF_PPS_HEADER(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x38)
+
+#define CDNS_SOURCE_PIF_PPS(s)			(CDNS_SOURCE_PACKET_IF(s) + 0x3c)
+#define SOURCE_PIF_PPS_PPS			BIT(0)
+
 /* mailbox */
 #define MAILBOX_RETRY_US			1000
 #define MAILBOX_TIMEOUT_US			2000000
@@ -354,6 +407,7 @@ struct cdns_mhdp_hdcp {
 struct cdns_mhdp_device {
 	void __iomem *regs;
 	void __iomem *sapb_regs;
+	void __iomem *dsc_regs;
 	void __iomem *j721e_regs;
 
 	struct device *dev;
@@ -412,6 +466,21 @@ struct cdns_mhdp_device {
 
 	struct cdns_mhdp_hdcp hdcp;
 	bool hdcp_supported;
+
+	struct drm_dsc_config dsc_config;
+
+	/* Display Stream Compression state */
+	bool dsc_supported;
+
+	struct {
+		bool compression_enable;
+		bool dsc_split;
+		u16 compressed_bpp;
+		u8 slice_count;
+		u8 dsc_cap[DP_DSC_RECEIVER_CAP_SIZE];
+	} dsc_params;
+
+	bool fec_enabled;
 };
 
 #define connector_to_mhdp(x) container_of(x, struct cdns_mhdp_device, connector)
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.c
new file mode 100644
index 0000000000000..e6f125142575c
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.c
@@ -0,0 +1,718 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Cadence Design Systems, Inc.
+ *
+ * Author: Swapnil Jakhade <sjakhade@cadence.com>
+ */
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_print.h>
+
+#include "cdns-mhdp8546-core.h"
+#include "cdns-mhdp8546-dsc.h"
+
+void cdns_mhdp_dsc_write_config(struct cdns_mhdp_device *mhdp)
+{
+	u32 main_conf = 0;
+
+	main_conf = CDNS_DP_COM_MAIN_CONF_INPUT_MODE |
+				CDNS_DP_COM_MAIN_CONF_AUTO_DB_UPDATE;
+
+	if (mhdp->dsc_params.dsc_split) {
+		main_conf |= CDNS_DP_COM_MAIN_CONF_MUX_MODE |
+					 CDNS_DP_COM_MAIN_CONF_SPLIT_PANEL;
+	}
+
+	writel(main_conf, mhdp->dsc_regs + CDNS_DP_COM_MAIN_CONF);
+}
+
+static u8 cdns_mhdp_dsc_compute_initial_lines(struct cdns_mhdp_device *mhdp)
+{
+	struct drm_dsc_config *dsc_cfg = &mhdp->dsc_config;
+	unsigned long k1;
+	unsigned long real_bpp;
+	unsigned long chunk_bits;
+	unsigned long overhead_bits;
+	unsigned long numerator;
+	unsigned long denominator;
+	unsigned long bits_per_pixel_fraction;
+	unsigned long adjustment_factor;
+	unsigned long adjusted_chunk_bits;
+	u8 initial_lines;
+
+	real_bpp = (unsigned long)dsc_cfg->bits_per_pixel / 16;
+
+	if (dsc_cfg->bits_per_component == 8)
+		k1 = 296;
+	else
+		k1 = 320;
+
+	/* Slice chunk size in bits */
+	chunk_bits = (unsigned long)dsc_cfg->slice_chunk_size * 8;
+
+	/* Standard overhead bits */
+	overhead_bits = 144;
+
+	/* Denominator is slice width */
+	denominator = (unsigned long)dsc_cfg->slice_width;
+
+	if (mhdp->dsc_params.dsc_split) {
+		bits_per_pixel_fraction = (chunk_bits + overhead_bits) / real_bpp;
+		numerator = k1 + (unsigned long)dsc_cfg->initial_xmit_delay
+					+ bits_per_pixel_fraction;
+	} else {
+		adjustment_factor = 1 - (real_bpp / 48);
+		adjusted_chunk_bits = DIV_ROUND_UP(adjustment_factor * chunk_bits, 1);
+		bits_per_pixel_fraction = (adjusted_chunk_bits + overhead_bits)
+								/ real_bpp;
+		numerator = k1 + (unsigned long)dsc_cfg->initial_xmit_delay
+					+ bits_per_pixel_fraction;
+	}
+
+	initial_lines = (u8)DIV_ROUND_UP(numerator, denominator);
+
+	return initial_lines;
+}
+
+static void write_enc_main_conf(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	u32 reg_val = 0;
+
+	if (mhdp->dsc_config.convert_rgb)
+		reg_val |= CDNS_DP_ENC_MAIN_CONF_CONVERT_RGB;
+
+	reg_val |= (mhdp->dsc_config.line_buf_depth <<
+		   CDNS_DP_ENC_MAIN_CONF_LINEBUF_DEPTH_SHIFT) &
+		   CDNS_DP_ENC_MAIN_CONF_LINEBUF_DEPTH;
+
+	reg_val |= (mhdp->dsc_config.bits_per_pixel <<
+		   CDNS_DP_ENC_MAIN_CONF_BITS_PER_PIXEL_SHIFT) &
+		   CDNS_DP_ENC_MAIN_CONF_BITS_PER_PIXEL;
+
+	if (mhdp->dsc_config.block_pred_enable)
+		reg_val |= CDNS_DP_ENC_MAIN_CONF_BLOCK_PRED_EN;
+
+	reg_val |= CDNS_DP_ENC_MAIN_CONF_VIDEO_MODE;
+
+	reg_val |= (cdns_mhdp_dsc_compute_initial_lines(mhdp) <<
+		   CDNS_DP_ENC_MAIN_CONF_INITIAL_LINES_SHIFT) &
+		   CDNS_DP_ENC_MAIN_CONF_INITIAL_LINES;
+
+	if (mhdp->dsc_config.bits_per_component == 10)
+		reg_val |= 0x1;
+	else if (mhdp->dsc_config.bits_per_component != 8)
+		dev_err(mhdp->dev, "Unsupported bits_per_component = %d\n",
+			mhdp->dsc_config.bits_per_component);
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_MAIN_CONF(stream_id));
+}
+
+static void write_enc_picture_size(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	u32 reg_val = 0;
+
+	reg_val = (mhdp->dsc_config.pic_width &
+		   CDNS_DP_ENC_PICTURE_SIZE_WIDTH);
+
+	reg_val |= (mhdp->dsc_config.pic_height <<
+		   CDNS_DP_ENC_PICTURE_SIZE_HEIGHT_SHIFT) &
+		   CDNS_DP_ENC_PICTURE_SIZE_HEIGHT;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_PICTURE_SIZE(stream_id));
+}
+
+static void write_enc_slice_size(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	u32 reg_val = 0;
+
+	reg_val = (mhdp->dsc_config.slice_width &
+		   CDNS_DP_ENC_SLICE_SIZE_WIDTH);
+
+	reg_val |= (mhdp->dsc_config.slice_height <<
+		   CDNS_DP_ENC_SLICE_SIZE_HEIGHT_SHIFT) &
+		   CDNS_DP_ENC_SLICE_SIZE_HEIGHT;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_SLICE_SIZE(stream_id));
+}
+
+static void write_enc_misc_size(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	u32 reg_val = 0;
+
+	reg_val = ((mhdp->dsc_config.slice_width + 2) % 3) &
+		   CDNS_DP_ENC_MISC_SIZE_LAST_GRP_SIZE;
+
+	reg_val |= (DSC_OUTPUT_BUFFER_MAX_ADDRESS <<
+		   CDNS_DP_ENC_MISC_SIZE_OB_MAX_ADDR_SHIFT) &
+		   CDNS_DP_ENC_MISC_SIZE_OB_MAX_ADDR;
+
+	reg_val |= (mhdp->dsc_config.slice_chunk_size <<
+		   CDNS_DP_ENC_MISC_SIZE_CHUNK_SIZE_SHIFT) &
+		   CDNS_DP_ENC_MISC_SIZE_CHUNK_SIZE;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_MISC_SIZE(stream_id));
+}
+
+static void write_enc_hrd_delays(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	u32 reg_val = 0;
+
+	reg_val = (mhdp->dsc_config.initial_xmit_delay &
+		   CDNS_DP_ENC_HRD_DELAYS_INIT_XMIT_DELAY);
+
+	reg_val |= (mhdp->dsc_config.initial_dec_delay <<
+		   CDNS_DP_ENC_HRD_DELAYS_INIT_DEC_DELAY_SHIFT) &
+		   CDNS_DP_ENC_HRD_DELAYS_INIT_DEC_DELAY;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_HRD_DELAYS(stream_id));
+}
+
+static void write_enc_rc_scale(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	u32 reg_val = 0;
+
+	reg_val = (mhdp->dsc_config.initial_scale_value &
+		   CDNS_DP_ENC_RC_SCALE_INIT_SCALE_VALUE);
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_SCALE(stream_id));
+}
+
+static void write_enc_rc_scale_inc_dec(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	u32 reg_val = 0;
+
+	reg_val = (mhdp->dsc_config.scale_increment_interval &
+		   CDNS_DP_ENC_RC_SCALE_INC_INTERVAL);
+
+	reg_val |= (mhdp->dsc_config.scale_decrement_interval <<
+		   CDNS_DP_ENC_RC_SCALE_DEC_INTERVAL_SHIFT) &
+		   CDNS_DP_ENC_RC_SCALE_DEC_INTERVAL;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_SCALE_INC_DEC(stream_id));
+}
+
+static void write_enc_rc_offsets(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	u32 reg_val;
+
+	reg_val = (mhdp->dsc_config.first_line_bpg_offset &
+		     CDNS_DP_ENC_RC_OFFSETS_1_FL_BPG_OFFSET);
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_OFFSETS_1(stream_id));
+
+	reg_val = (mhdp->dsc_config.nfl_bpg_offset &
+		   CDNS_DP_ENC_RC_OFFSETS_2_NFL_BPG_OFFSET);
+
+	reg_val |= (mhdp->dsc_config.slice_bpg_offset <<
+		   CDNS_DP_ENC_RC_OFFSETS_2_SL_BPG_OFFSET_SHIFT) &
+		   CDNS_DP_ENC_RC_OFFSETS_2_SL_BPG_OFFSET;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_OFFSETS_2(stream_id));
+
+	reg_val = (mhdp->dsc_config.initial_offset &
+		   CDNS_DP_ENC_RC_OFFSETS_3_INIT_OFFSET);
+
+	reg_val |= (mhdp->dsc_config.final_offset <<
+		   CDNS_DP_ENC_RC_OFFSETS_3_FINAL_OFFSET_SHIFT) &
+		   CDNS_DP_ENC_RC_OFFSETS_3_FINAL_OFFSET;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_OFFSETS_3(stream_id));
+}
+
+static void write_enc_flatness_detection(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	u32 reg_val;
+
+	reg_val = (mhdp->dsc_config.flatness_min_qp &
+		   CDNS_DP_ENC_FLATNESS_DETECTION_MIN_QP);
+
+	reg_val |= (mhdp->dsc_config.flatness_max_qp <<
+		   CDNS_DP_ENC_FLATNESS_DETECTION_MAX_QP_SHIFT) &
+		   CDNS_DP_ENC_FLATNESS_DETECTION_MAX_QP;
+
+	reg_val |= (drm_dsc_flatness_det_thresh(&mhdp->dsc_config) <<
+		   CDNS_DP_ENC_FLATNESS_DETECTION_THRESH_SHIFT) &
+		   CDNS_DP_ENC_FLATNESS_DETECTION_THRESH;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_FLATNESS_DETECTION(stream_id));
+}
+
+static void write_enc_rc_model_size(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	u32 reg_val;
+
+	reg_val = (mhdp->dsc_config.rc_model_size &
+		   CDNS_DP_ENC_RC_MODEL_SIZE_RC_MODEL_SIZE);
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_MODEL_SIZE(stream_id));
+}
+
+static void write_enc_rc_config(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	u32 reg_val;
+
+	reg_val = (mhdp->dsc_config.rc_edge_factor &
+		   CDNS_DP_ENC_RC_CONFIG_EDGE_FACTOR);
+
+	reg_val |= (mhdp->dsc_config.rc_quant_incr_limit0 <<
+		   CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_0_SHIFT) &
+		   CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_0;
+
+	reg_val |= (mhdp->dsc_config.rc_quant_incr_limit1 <<
+		   CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_1_SHIFT) &
+		   CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_1;
+
+	reg_val |= (mhdp->dsc_config.rc_tgt_offset_high <<
+		   CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_HI_SHIFT) &
+		   CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_HI;
+
+	reg_val |= (mhdp->dsc_config.rc_tgt_offset_low <<
+		   CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_LO_SHIFT) &
+		   CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_LO;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_CONFIG(stream_id));
+}
+
+static void write_enc_rc_buf_thresh(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	u32 reg_val;
+	int index = 0;
+
+	reg_val = (mhdp->dsc_config.rc_buf_thresh[index++] &
+		   CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_0);
+
+	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
+		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_1_SHIFT) &
+		   CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_1;
+
+	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
+		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_2_SHIFT) &
+		   CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_2;
+
+	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
+		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_3_SHIFT) &
+		   CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_3;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_BUF_THRESH_0(stream_id));
+
+	reg_val = (mhdp->dsc_config.rc_buf_thresh[index++] &
+		   CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_4);
+
+	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
+		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_1_SHIFT) &
+		   CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_5;
+
+	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
+		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_2_SHIFT) &
+		   CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_6;
+
+	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
+		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_3_SHIFT) &
+		   CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_7;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_BUF_THRESH_1(stream_id));
+
+	reg_val = (mhdp->dsc_config.rc_buf_thresh[index++] &
+		   CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_8);
+
+	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
+		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_1_SHIFT) &
+		   CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_9;
+
+	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
+		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_2_SHIFT) &
+		   CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_10;
+
+	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
+		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_3_SHIFT) &
+		   CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_11;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_BUF_THRESH_2(stream_id));
+
+	reg_val = (mhdp->dsc_config.rc_buf_thresh[index++] &
+		   CDNS_DP_ENC_RC_BUF_THRESH_3_THRESH_12);
+
+	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
+		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_1_SHIFT) &
+		   CDNS_DP_ENC_RC_BUF_THRESH_3_THRESH_13;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_BUF_THRESH_3(stream_id));
+}
+
+static void write_enc_rc_min_qp(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	u32 reg_val;
+	int index = 0;
+
+	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_min_qp &
+		   CDNS_DP_ENC_RC_MIN_QP_0_RANGE_0);
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
+		   CDNS_DP_ENC_RC_MIN_QP_0_RANGE_1;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
+		   CDNS_DP_ENC_RC_MIN_QP_0_RANGE_2;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
+		   CDNS_DP_ENC_RC_MIN_QP_0_RANGE_3;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
+		   CDNS_DP_ENC_RC_MIN_QP_0_RANGE_4;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_MIN_QP_0(stream_id));
+
+	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_min_qp &
+		   CDNS_DP_ENC_RC_MIN_QP_1_RANGE_5);
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
+		   CDNS_DP_ENC_RC_MIN_QP_1_RANGE_6;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
+		   CDNS_DP_ENC_RC_MIN_QP_1_RANGE_7;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
+		   CDNS_DP_ENC_RC_MIN_QP_1_RANGE_8;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
+		   CDNS_DP_ENC_RC_MIN_QP_1_RANGE_9;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_MIN_QP_1(stream_id));
+
+	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_min_qp &
+		   CDNS_DP_ENC_RC_MIN_QP_2_RANGE_10);
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
+		   CDNS_DP_ENC_RC_MIN_QP_2_RANGE_11;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
+		   CDNS_DP_ENC_RC_MIN_QP_2_RANGE_12;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
+		   CDNS_DP_ENC_RC_MIN_QP_2_RANGE_13;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
+		   CDNS_DP_ENC_RC_MIN_QP_2_RANGE_14;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_MIN_QP_2(stream_id));
+}
+
+static void write_enc_rc_max_qp(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	u32 reg_val;
+	int index = 0;
+
+	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_max_qp &
+		   CDNS_DP_ENC_RC_MAX_QP_0_RANGE_0);
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
+		   CDNS_DP_ENC_RC_MAX_QP_0_RANGE_1;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
+		   CDNS_DP_ENC_RC_MAX_QP_0_RANGE_2;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
+		   CDNS_DP_ENC_RC_MAX_QP_0_RANGE_3;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
+		   CDNS_DP_ENC_RC_MAX_QP_0_RANGE_4;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_MAX_QP_0(stream_id));
+
+	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_max_qp &
+		   CDNS_DP_ENC_RC_MAX_QP_1_RANGE_5);
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
+		   CDNS_DP_ENC_RC_MAX_QP_1_RANGE_6;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
+		   CDNS_DP_ENC_RC_MAX_QP_1_RANGE_7;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
+		   CDNS_DP_ENC_RC_MAX_QP_1_RANGE_8;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
+		   CDNS_DP_ENC_RC_MAX_QP_1_RANGE_9;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_MAX_QP_1(stream_id));
+
+	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_max_qp &
+		   CDNS_DP_ENC_RC_MAX_QP_2_RANGE_10);
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
+		   CDNS_DP_ENC_RC_MAX_QP_2_RANGE_11;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
+		   CDNS_DP_ENC_RC_MAX_QP_2_RANGE_12;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
+		   CDNS_DP_ENC_RC_MAX_QP_2_RANGE_13;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
+		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
+		   CDNS_DP_ENC_RC_MAX_QP_2_RANGE_14;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_MAX_QP_2(stream_id));
+}
+
+static void write_enc_rc_range_bpg(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	u32 reg_val;
+	int index = 0;
+
+	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset &
+		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_0);
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
+		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
+		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_1;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
+		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
+		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_2;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
+		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
+		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_3;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
+		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
+		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_4;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0(stream_id));
+
+	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset &
+		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_5);
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
+		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
+		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_6;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
+		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
+		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_7;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
+		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
+		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_8;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
+		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
+		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_9;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_1(stream_id));
+
+	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset &
+		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_10);
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
+		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
+		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_11;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
+		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
+		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_12;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
+		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
+		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_13;
+
+	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
+		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
+		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_14;
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_2(stream_id));
+}
+
+static void write_enc_dpi_ctrl(struct cdns_mhdp_device *mhdp, int stream_id,
+			       const struct drm_display_mode *mode)
+{
+	u32 reg_val = 0;
+
+	reg_val = ((mode->crtc_htotal * cdns_mhdp_dsc_compute_initial_lines(mhdp)) &
+		  CDNS_DP_ENC_DPI_CTRL_OUT_DELAY_CYCLES);
+
+	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_DPI_CTRL_OUT_DELAY(stream_id));
+}
+
+void cdns_mhdp_dsc_write_enc_config(struct cdns_mhdp_device *mhdp, int stream_id,
+				    const struct drm_display_mode *mode)
+{
+	write_enc_main_conf(mhdp, stream_id);
+	write_enc_picture_size(mhdp, stream_id);
+	write_enc_slice_size(mhdp, stream_id);
+	write_enc_misc_size(mhdp, stream_id);
+	write_enc_hrd_delays(mhdp, stream_id);
+	write_enc_rc_scale(mhdp, stream_id);
+	write_enc_rc_scale_inc_dec(mhdp, stream_id);
+	write_enc_rc_offsets(mhdp, stream_id);
+	write_enc_flatness_detection(mhdp, stream_id);
+	write_enc_rc_model_size(mhdp, stream_id);
+	write_enc_rc_config(mhdp, stream_id);
+	write_enc_rc_buf_thresh(mhdp, stream_id);
+	write_enc_rc_min_qp(mhdp, stream_id);
+	write_enc_rc_max_qp(mhdp, stream_id);
+	write_enc_rc_range_bpg(mhdp, stream_id);
+	write_enc_dpi_ctrl(mhdp, stream_id, mode);
+}
+
+int cdns_mhdp_dsc_sink_support(struct cdns_mhdp_device *mhdp)
+{
+	int ret;
+
+	ret = drm_dp_dpcd_read(&mhdp->aux, DP_DSC_SUPPORT, &mhdp->dsc_params.dsc_cap,
+			       DP_DSC_RECEIVER_CAP_SIZE);
+	if (ret != DP_DSC_RECEIVER_CAP_SIZE) {
+		DRM_DEV_ERROR(mhdp->dev, "cannot read sink DSC DPCD: %d\n", ret);
+		goto err;
+	}
+	if (!(mhdp->dsc_params.dsc_cap[0] & DP_DSC_DECOMPRESSION_IS_SUPPORTED)) {
+		ret = -EOPNOTSUPP;
+		DRM_DEV_ERROR(mhdp->dev, "sink does not support DSC: %d\n", ret);
+		goto err;
+	}
+
+	ret = 0;
+err:
+	return ret;
+}
+
+int cdns_mhdp_compute_dsc_params(struct cdns_mhdp_device *mhdp)
+{
+	struct drm_bridge *bridge = &mhdp->bridge;
+	struct drm_dsc_config *dsc_cfg = &mhdp->dsc_config;
+	struct drm_crtc_state *crtc_state = bridge->encoder->crtc->state;
+	u8 *dsc_dpcd = (u8 *)&mhdp->dsc_params.dsc_cap;
+	int ret;
+
+	dsc_cfg->pic_width = crtc_state->adjusted_mode.crtc_hdisplay;
+	dsc_cfg->pic_height = crtc_state->adjusted_mode.crtc_vdisplay;
+
+	dsc_cfg->slice_width = dsc_cfg->pic_width;
+	dsc_cfg->slice_height = DIV_ROUND_UP(dsc_cfg->pic_height,
+					     mhdp->dsc_params.slice_count);
+
+	dsc_cfg->dsc_version_major = (dsc_dpcd[DP_DSC_REV - DP_DSC_SUPPORT] &
+				      DP_DSC_MAJOR_MASK) >> DP_DSC_MAJOR_SHIFT;
+	dsc_cfg->dsc_version_minor =
+		min(DSC_SUPPORTED_VERSION_MIN,
+		    (dsc_dpcd[DP_DSC_REV - DP_DSC_SUPPORT] &
+		     DP_DSC_MINOR_MASK) >> DP_DSC_MINOR_SHIFT);
+
+	dsc_cfg->convert_rgb =
+		dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT] & DP_DSC_RGB;
+
+	dsc_cfg->vbr_enable = false;
+
+	dsc_cfg->block_pred_enable =
+		dsc_dpcd[DP_DSC_BLK_PREDICTION_SUPPORT - DP_DSC_SUPPORT] &
+		DP_DSC_BLK_PREDICTION_IS_SUPPORTED;
+
+	dsc_cfg->bits_per_pixel = mhdp->dsc_params.compressed_bpp << 4;
+
+	dsc_cfg->bits_per_component = mhdp->display_fmt.bpc;
+
+	if (mhdp->dsc_config.bits_per_component == 8)
+		dsc_cfg->line_buf_depth = min(9, drm_dp_dsc_sink_line_buf_depth(dsc_dpcd));
+	else if (mhdp->dsc_config.bits_per_component == 10)
+		dsc_cfg->line_buf_depth = min(11, drm_dp_dsc_sink_line_buf_depth(dsc_dpcd));
+
+	drm_dsc_set_const_params(dsc_cfg);
+	drm_dsc_set_rc_buf_thresh(dsc_cfg);
+
+	ret = drm_dsc_setup_rc_params(dsc_cfg, DRM_DSC_1_1_PRE_SCR);
+	if (ret) {
+		dev_err(mhdp->dev, "could not find DSC RC parameters");
+		return ret;
+	}
+
+	dsc_cfg->initial_scale_value = drm_dsc_initial_scale_value(dsc_cfg);
+	dsc_cfg->slice_count = mhdp->dsc_params.slice_count;
+
+	return drm_dsc_compute_rc_parameters(dsc_cfg);
+}
+
+static void cdns_mhdp_write_data_packet(struct cdns_mhdp_device *mhdp, u32 *buf,
+					int length, int stream_id)
+{
+	int i;
+	u32 reg_val;
+
+	for (i = 0; i < length; i++) {
+		reg_val = buf[i];
+		writel(reg_val, mhdp->regs + CDNS_SOURCE_PIF_DATA_WR(stream_id));
+	}
+}
+
+static void cdns_mhdp_write_pps_header(struct cdns_mhdp_device *mhdp, u32 *buf,
+				       int stream_id)
+{
+	writel(SOURCE_PIF_PPS_PPS, mhdp->regs + CDNS_SOURCE_PIF_PPS(stream_id));
+	writel(*buf, mhdp->regs + CDNS_SOURCE_PIF_PPS_HEADER(stream_id));
+}
+
+static int cdns_mhdp_write_pps_infoframe(struct cdns_mhdp_device *mhdp, int stream_id,
+					 struct drm_dsc_pps_infoframe *pps_infoframe)
+{
+	u32 reg_val;
+	u32 entry_id = 0;
+
+	writel(1, mhdp->regs + CDNS_SOURCE_PIF_FIFO1_FLUSH(stream_id));
+
+	cdns_mhdp_write_pps_header(mhdp, (u32 *)&pps_infoframe->pps_header, 0);
+	cdns_mhdp_write_data_packet(mhdp, (u32 *)&pps_infoframe->pps_payload,
+				    sizeof(pps_infoframe->pps_payload) / 4, 0);
+
+	/* Entry ID */
+	writel(entry_id, mhdp->regs + CDNS_SOURCE_PIF_WR_ADDR(stream_id));
+
+	writel(SOURCE_PIF_WR_REQ_HOST_WR,
+	       mhdp->regs + CDNS_SOURCE_PIF_WR_REQ(stream_id));
+
+	reg_val = SOURCE_PIF_PKT_ALLOC_REG_ACTIVE_IDLE_TYPE |
+		  SOURCE_PIF_PKT_ALLOC_REG_TYPE_VALID |
+		  ((DP_SDP_PPS << SOURCE_PIF_PKT_ALLOC_REG_PACKET_TYPE_SHIFT) &
+		  SOURCE_PIF_PKT_ALLOC_REG_PACKET_TYPE) |
+		  (entry_id & SOURCE_PIF_PKT_ALLOC_REG_PKT_ALLOC_ADDR);
+
+	writel(reg_val, mhdp->regs + CDNS_SOURCE_PIF_PKT_ALLOC_REG(stream_id));
+
+	writel
+	(SOURCE_PIF_PKT_ALLOC_WR_EN_EN, mhdp->regs + CDNS_SOURCE_PIF_PKT_ALLOC_WR_EN(stream_id));
+
+	return 0;
+}
+
+int cdns_mhdp_dsc_send_pps_sdp(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	struct drm_dsc_config *dsc_cfg = &mhdp->dsc_config;
+	struct drm_dsc_pps_infoframe dp_dsc_pps_sdp;
+
+	drm_dsc_dp_pps_header_init(&dp_dsc_pps_sdp.pps_header);
+
+	drm_dsc_pps_payload_pack(&dp_dsc_pps_sdp.pps_payload, dsc_cfg);
+
+	return cdns_mhdp_write_pps_infoframe(mhdp, stream_id, &dp_dsc_pps_sdp);
+}
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.h
new file mode 100644
index 0000000000000..09b9f2af83a87
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.h
@@ -0,0 +1,284 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) Cadence Design Systems, Inc.
+ *
+ * Author: Swapnil Jakhade <sjakhade@cadence.com>
+ */
+
+#ifndef CDNS_MHDP_DSC_H_
+#define CDNS_MHDP_DSC_H_
+
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/minmax.h>
+
+#define DSC_SUPPORTED_VERSION_MIN			1
+
+#define DSC_OUTPUT_BUFFER_MAX_ADDRESS			3667U
+#define DP_DSC_PPS_SIZE					128
+
+#define CDNS_DP_COM_MAIN_CONF				0
+#define CDNS_DP_COM_MAIN_CONF_SPLIT_PANEL		BIT(0)
+#define CDNS_DP_COM_MAIN_CONF_MUX_MODE			BIT(1)
+#define CDNS_DP_COM_MAIN_CONF_MUX_SEL_OUT		BIT(2)
+#define CDNS_DP_COM_MAIN_CONF_DE_RASTER_EN		BIT(3)
+#define CDNS_DP_COM_MAIN_CONF_INPUT_MODE		BIT(4)
+#define CDNS_DP_COM_MAIN_CONF_MUX_EOC_EN		BIT(5)
+#define CDNS_DP_COM_MAIN_CONF_AUTO_DB_UPDATE		BIT(6)
+
+#define CDNS_DP_ENC_MAIN_CONF(d)			(0x120 + ((d) * 0x100))
+#define CDNS_DP_ENC_MAIN_CONF_INPUT_BPC			GENMASK(1, 0)
+#define CDNS_DP_ENC_MAIN_CONF_CONVERT_RGB		BIT(2)
+#define CDNS_DP_ENC_MAIN_CONF_ENABLE_422		BIT(3)
+#define CDNS_DP_ENC_MAIN_CONF_LINEBUF_DEPTH		GENMASK(7, 4)
+#define CDNS_DP_ENC_MAIN_CONF_LINEBUF_DEPTH_SHIFT	4
+#define CDNS_DP_ENC_MAIN_CONF_BITS_PER_PIXEL		GENMASK(17, 8)
+#define CDNS_DP_ENC_MAIN_CONF_BITS_PER_PIXEL_SHIFT	8
+#define CDNS_DP_ENC_MAIN_CONF_BLOCK_PRED_EN		BIT(18)
+#define CDNS_DP_ENC_MAIN_CONF_VIDEO_MODE		BIT(19)
+#define CDNS_DP_ENC_MAIN_CONF_ICH_RST_EOL		BIT(20)
+#define CDNS_DP_ENC_MAIN_CONF_INITIAL_LINES		GENMASK(31, 24)
+#define CDNS_DP_ENC_MAIN_CONF_INITIAL_LINES_SHIFT	24
+
+#define CDNS_DP_ENC_PICTURE_SIZE(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x4)
+#define CDNS_DP_ENC_PICTURE_SIZE_HEIGHT			GENMASK(31, 16)
+#define CDNS_DP_ENC_PICTURE_SIZE_HEIGHT_SHIFT		16
+#define CDNS_DP_ENC_PICTURE_SIZE_WIDTH			GENMASK(15, 0)
+
+#define CDNS_DP_ENC_SLICE_SIZE(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x8)
+#define CDNS_DP_ENC_SLICE_SIZE_HEIGHT			GENMASK(31, 16)
+#define CDNS_DP_ENC_SLICE_SIZE_HEIGHT_SHIFT		16
+#define CDNS_DP_ENC_SLICE_SIZE_WIDTH			GENMASK(15, 0)
+
+#define CDNS_DP_ENC_MISC_SIZE(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0xc)
+#define CDNS_DP_ENC_MISC_SIZE_CHUNK_SIZE		GENMASK(31, 16)
+#define CDNS_DP_ENC_MISC_SIZE_CHUNK_SIZE_SHIFT		16
+#define CDNS_DP_ENC_MISC_SIZE_OB_MAX_ADDR		GENMASK(15, 2)
+#define CDNS_DP_ENC_MISC_SIZE_OB_MAX_ADDR_SHIFT		2
+#define CDNS_DP_ENC_MISC_SIZE_LAST_GRP_SIZE		GENMASK(1, 0)
+
+#define CDNS_DP_ENC_HRD_DELAYS(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x10)
+#define CDNS_DP_ENC_HRD_DELAYS_INIT_DEC_DELAY		GENMASK(31, 16)
+#define CDNS_DP_ENC_HRD_DELAYS_INIT_DEC_DELAY_SHIFT	16
+#define CDNS_DP_ENC_HRD_DELAYS_INIT_XMIT_DELAY		GENMASK(9, 0)
+
+#define CDNS_DP_ENC_RC_SCALE(d)				(CDNS_DP_ENC_MAIN_CONF(d) + 0x14)
+#define CDNS_DP_ENC_RC_SCALE_INIT_SCALE_VALUE		GENMASK(5, 0)
+
+#define CDNS_DP_ENC_RC_SCALE_INC_DEC(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x18)
+#define CDNS_DP_ENC_RC_SCALE_DEC_INTERVAL		GENMASK(27, 16)
+#define CDNS_DP_ENC_RC_SCALE_DEC_INTERVAL_SHIFT		16
+#define CDNS_DP_ENC_RC_SCALE_INC_INTERVAL		GENMASK(15, 0)
+
+#define CDNS_DP_ENC_RC_OFFSETS_1(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x1c)
+#define CDNS_DP_ENC_RC_OFFSETS_1_FL_BPG_OFFSET		GENMASK(4, 0)
+
+#define CDNS_DP_ENC_RC_OFFSETS_2(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x20)
+#define CDNS_DP_ENC_RC_OFFSETS_2_SL_BPG_OFFSET		GENMASK(31, 16)
+#define CDNS_DP_ENC_RC_OFFSETS_2_SL_BPG_OFFSET_SHIFT	16
+#define CDNS_DP_ENC_RC_OFFSETS_2_NFL_BPG_OFFSET		GENMASK(15, 0)
+
+#define CDNS_DP_ENC_RC_OFFSETS_3(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x24)
+#define CDNS_DP_ENC_RC_OFFSETS_3_FINAL_OFFSET		GENMASK(31, 16)
+#define CDNS_DP_ENC_RC_OFFSETS_3_FINAL_OFFSET_SHIFT	16
+#define CDNS_DP_ENC_RC_OFFSETS_3_INIT_OFFSET		GENMASK(15, 0)
+
+#define CDNS_DP_ENC_FLATNESS_DETECTION(d)		(CDNS_DP_ENC_MAIN_CONF(d) + 0x28)
+#define CDNS_DP_ENC_FLATNESS_DETECTION_THRESH		GENMASK(17, 10)
+#define CDNS_DP_ENC_FLATNESS_DETECTION_THRESH_SHIFT	10
+#define CDNS_DP_ENC_FLATNESS_DETECTION_MAX_QP		GENMASK(9, 5)
+#define CDNS_DP_ENC_FLATNESS_DETECTION_MAX_QP_SHIFT	5
+#define CDNS_DP_ENC_FLATNESS_DETECTION_MIN_QP		GENMASK(4, 0)
+
+#define CDNS_DP_ENC_RC_MODEL_SIZE(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x2c)
+#define CDNS_DP_ENC_RC_MODEL_SIZE_RC_MODEL_SIZE		GENMASK(15, 0)
+
+#define CDNS_DP_ENC_RC_CONFIG(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x30)
+#define CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_LO		GENMASK(27, 24)
+#define CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_LO_SHIFT	24
+#define CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_HI		GENMASK(23, 20)
+#define CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_HI_SHIFT	20
+#define CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_1		GENMASK(17, 13)
+#define CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_1_SHIFT	13
+#define CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_0		GENMASK(12, 8)
+#define CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_0_SHIFT	8
+#define CDNS_DP_ENC_RC_CONFIG_EDGE_FACTOR		GENMASK(3, 0)
+
+#define CDNS_DP_ENC_RC_BUF_THRESH_0(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x34)
+#define CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_3		GENMASK(31, 24)
+#define CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_2		GENMASK(23, 16)
+#define CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_1		GENMASK(15, 8)
+#define CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_0		GENMASK(7, 0)
+
+#define CDNS_DP_ENC_RC_BUF_THRESH_1(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x38)
+#define CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_7		GENMASK(31, 24)
+#define CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_6		GENMASK(23, 16)
+#define CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_5		GENMASK(15, 8)
+#define CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_4		GENMASK(7, 0)
+
+#define CDNS_DP_ENC_RC_BUF_THRESH_2(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x3c)
+#define CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_11		GENMASK(31, 24)
+#define CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_10		GENMASK(23, 16)
+#define CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_9		GENMASK(15, 8)
+#define CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_8		GENMASK(7, 0)
+
+#define CDNS_DP_ENC_RC_BUF_THRESH_3(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x40)
+#define CDNS_DP_ENC_RC_BUF_THRESH_3_THRESH_13		GENMASK(15, 8)
+#define CDNS_DP_ENC_RC_BUF_THRESH_3_THRESH_12		GENMASK(7, 0)
+
+#define CDNS_DP_ENC_RC_BUF_THRESH_THRESH_3_SHIFT	24
+#define CDNS_DP_ENC_RC_BUF_THRESH_THRESH_2_SHIFT	16
+#define CDNS_DP_ENC_RC_BUF_THRESH_THRESH_1_SHIFT	8
+
+#define CDNS_DP_ENC_RC_MIN_QP_0(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x44)
+#define CDNS_DP_ENC_RC_MIN_QP_0_RANGE_4			GENMASK(24, 20)
+#define CDNS_DP_ENC_RC_MIN_QP_0_RANGE_3			GENMASK(19, 15)
+#define CDNS_DP_ENC_RC_MIN_QP_0_RANGE_2			GENMASK(14, 10)
+#define CDNS_DP_ENC_RC_MIN_QP_0_RANGE_1			GENMASK(9, 5)
+#define CDNS_DP_ENC_RC_MIN_QP_0_RANGE_0			GENMASK(4, 0)
+
+#define CDNS_DP_ENC_RC_MIN_QP_1(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x48)
+#define CDNS_DP_ENC_RC_MIN_QP_1_RANGE_9			GENMASK(24, 20)
+#define CDNS_DP_ENC_RC_MIN_QP_1_RANGE_8			GENMASK(19, 15)
+#define CDNS_DP_ENC_RC_MIN_QP_1_RANGE_7			GENMASK(14, 10)
+#define CDNS_DP_ENC_RC_MIN_QP_1_RANGE_6			GENMASK(9, 5)
+#define CDNS_DP_ENC_RC_MIN_QP_1_RANGE_5			GENMASK(4, 0)
+
+#define CDNS_DP_ENC_RC_MIN_QP_2(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x4c)
+#define CDNS_DP_ENC_RC_MIN_QP_2_RANGE_14		GENMASK(24, 20)
+#define CDNS_DP_ENC_RC_MIN_QP_2_RANGE_13		GENMASK(19, 15)
+#define CDNS_DP_ENC_RC_MIN_QP_2_RANGE_12		GENMASK(14, 10)
+#define CDNS_DP_ENC_RC_MIN_QP_2_RANGE_11		GENMASK(9, 5)
+#define CDNS_DP_ENC_RC_MIN_QP_2_RANGE_10		GENMASK(4, 0)
+
+#define CDNS_DP_ENC_RC_MAX_QP_0(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x50)
+#define CDNS_DP_ENC_RC_MAX_QP_0_RANGE_4			GENMASK(24, 20)
+#define CDNS_DP_ENC_RC_MAX_QP_0_RANGE_3			GENMASK(19, 15)
+#define CDNS_DP_ENC_RC_MAX_QP_0_RANGE_2			GENMASK(14, 10)
+#define CDNS_DP_ENC_RC_MAX_QP_0_RANGE_1			GENMASK(9, 5)
+#define CDNS_DP_ENC_RC_MAX_QP_0_RANGE_0			GENMASK(4, 0)
+
+#define CDNS_DP_ENC_RC_MAX_QP_1(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x54)
+#define CDNS_DP_ENC_RC_MAX_QP_1_RANGE_9			GENMASK(24, 20)
+#define CDNS_DP_ENC_RC_MAX_QP_1_RANGE_8			GENMASK(19, 15)
+#define CDNS_DP_ENC_RC_MAX_QP_1_RANGE_7			GENMASK(14, 10)
+#define CDNS_DP_ENC_RC_MAX_QP_1_RANGE_6			GENMASK(9, 5)
+#define CDNS_DP_ENC_RC_MAX_QP_1_RANGE_5			GENMASK(4, 0)
+
+#define CDNS_DP_ENC_RC_MAX_QP_2(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x58)
+#define CDNS_DP_ENC_RC_MAX_QP_2_RANGE_14		GENMASK(24, 20)
+#define CDNS_DP_ENC_RC_MAX_QP_2_RANGE_13		GENMASK(19, 15)
+#define CDNS_DP_ENC_RC_MAX_QP_2_RANGE_12		GENMASK(14, 10)
+#define CDNS_DP_ENC_RC_MAX_QP_2_RANGE_11		GENMASK(9, 5)
+#define CDNS_DP_ENC_RC_MAX_QP_2_RANGE_10		GENMASK(4, 0)
+
+#define CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT			20
+#define CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT			15
+#define CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT			10
+#define CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT			5
+
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0(d)		(CDNS_DP_ENC_MAIN_CONF(d) + 0x5c)
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_4		GENMASK(24, 20)
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_3		GENMASK(19, 15)
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_2		GENMASK(14, 10)
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_1		GENMASK(9, 5)
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_0		GENMASK(4, 0)
+
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_1(d)		(CDNS_DP_ENC_MAIN_CONF(d) + 0x60)
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_9		GENMASK(24, 20)
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_8		GENMASK(19, 15)
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_7		GENMASK(14, 10)
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_6		GENMASK(9, 5)
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_5		GENMASK(4, 0)
+
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_2(d)		(CDNS_DP_ENC_MAIN_CONF(d) + 0x64)
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_14		GENMASK(24, 20)
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_13		GENMASK(19, 15)
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_12		GENMASK(14, 10)
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_11		GENMASK(9, 5)
+#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_10		GENMASK(4, 0)
+
+#define CDNS_DP_ENC_DPI_CTRL_OUT_DELAY(d)		(CDNS_DP_ENC_MAIN_CONF(d) + 0x68)
+#define CDNS_DP_ENC_DPI_CTRL_OUT_DELAY_CYCLES		GENMASK(15, 0)
+
+#define CDNS_DP_ENC_GENERAL_STATUS(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0xa0)
+#define CDNS_DP_ENC_GENERAL_STATUS_OUT_BUFF_FULL_1	BIT(6)
+#define CDNS_DP_ENC_GENERAL_STATUS_OUT_BUFF_FULL_0	BIT(5)
+#define CDNS_DP_ENC_GENERAL_STATUS_OUT_BUFF_EMPTY_1	BIT(4)
+#define CDNS_DP_ENC_GENERAL_STATUS_OUT_BUFF_EMPTY_0	BIT(3)
+#define CDNS_DP_ENC_GENERAL_STATUS_FRAME_DONE		BIT(2)
+#define CDNS_DP_ENC_GENERAL_STATUS_FRAME_STARTED	BIT(1)
+#define CDNS_DP_ENC_GENERAL_STATUS_CE			BIT(0)
+
+#define CDNS_DP_ENC_HSLICE_STATUS(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0xa4)
+#define CDNS_DP_ENC_HSLICE_STATUS_ACTUAL_SLICE		GENMASK(31, 16)
+#define CDNS_DP_ENC_HSLICE_STATUS_ACTUAL_LINE		GENMASK(15, 0)
+
+#define CDNS_DP_ENC_OUT_STATUS(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0xa8)
+#define CDNS_DP_ENC_OUT_STATUS_ACTUAL_SLICE		GENMASK(31, 16)
+#define CDNS_DP_ENC_OUT_STATUS_ACTUAL_LINE		GENMASK(15, 0)
+
+#define CDNS_DP_ENC_INT_STAT(d)				(CDNS_DP_ENC_MAIN_CONF(d) + 0xac)
+#define CDNS_DP_ENC_INT_STAT_OUT_BUFF_FULL_1		BIT(10)
+#define CDNS_DP_ENC_INT_STAT_OUT_BUFF_FULL_0		BIT(9)
+#define CDNS_DP_ENC_INT_STAT_OUT_BUFF_EMPTY_1		BIT(8)
+#define CDNS_DP_ENC_INT_STAT_OUT_BUFF_EMPTY_0		BIT(7)
+#define CDNS_DP_ENC_INT_STAT_FRAME_DONE			BIT(6)
+#define CDNS_DP_ENC_INT_STAT_FRAME_STARTED		BIT(5)
+#define CDNS_DP_ENC_INT_STAT_CE				BIT(4)
+#define CDNS_DP_ENC_INT_STAT_RC_BUFF_OVER_1		BIT(3)
+#define CDNS_DP_ENC_INT_STAT_RC_BUFF_OVER_0		BIT(2)
+#define CDNS_DP_ENC_INT_STAT_OUT_BUFF_UND_1		BIT(1)
+#define CDNS_DP_ENC_INT_STAT_OUT_BUFF_UND_0		BIT(0)
+
+#define CDNS_DP_ENC_INT_CLR(d)				(CDNS_DP_ENC_MAIN_CONF(d) + 0xb0)
+#define CDNS_DP_ENC_INT_CLR_OUT_BUFF_FULL_1		BIT(10)
+#define CDNS_DP_ENC_INT_CLR_OUT_BUFF_FULL_0		BIT(9)
+#define CDNS_DP_ENC_INT_CLR_OUT_BUFF_EMPTY_1		BIT(8)
+#define CDNS_DP_ENC_INT_CLR_OUT_BUFF_EMPTY_0		BIT(7)
+#define CDNS_DP_ENC_INT_CLR_FRAME_DONE			BIT(6)
+#define CDNS_DP_ENC_INT_CLR_FRAME_STARTED		BIT(5)
+#define CDNS_DP_ENC_INT_CLR_CE				BIT(4)
+#define CDNS_DP_ENC_INT_CLR_RC_BUFF_OVER_1		BIT(3)
+#define CDNS_DP_ENC_INT_CLR_RC_BUFF_OVER_0		BIT(2)
+#define CDNS_DP_ENC_INT_CLR_OUT_BUFF_UND_1		BIT(1)
+#define CDNS_DP_ENC_INT_CLR_OUT_BUFF_UND_0		BIT(0)
+
+#define CDNS_DP_ENC_INT_MASK(d)				(CDNS_DP_ENC_MAIN_CONF(d) + 0xb4)
+#define CDNS_DP_ENC_INT_MASK_OUT_BUFF_FULL_1		BIT(10)
+#define CDNS_DP_ENC_INT_MASK_OUT_BUFF_FULL_0		BIT(9)
+#define CDNS_DP_ENC_INT_MASK_OUT_BUFF_EMPTY_1		BIT(8)
+#define CDNS_DP_ENC_INT_MASK_OUT_BUFF_EMPTY_0		BIT(7)
+#define CDNS_DP_ENC_INT_MASK_FRAME_DONE			BIT(6)
+#define CDNS_DP_ENC_INT_MASK_FRAME_STARTED		BIT(5)
+#define CDNS_DP_ENC_INT_MASK_CE				BIT(4)
+#define CDNS_DP_ENC_INT_MASK_RC_BUFF_OVER_1		BIT(3)
+#define CDNS_DP_ENC_INT_MASK_RC_BUFF_OVER_0		BIT(2)
+#define CDNS_DP_ENC_INT_MASK_OUT_BUFF_UND_1		BIT(1)
+#define CDNS_DP_ENC_INT_MASK_OUT_BUFF_UND_0		BIT(0)
+
+#define CDNS_DP_ENC_INT_TEST(d)				(CDNS_DP_ENC_MAIN_CONF(d) + 0xb8)
+#define CDNS_DP_ENC_INT_TEST_OUT_BUFF_FULL_1		BIT(10)
+#define CDNS_DP_ENC_INT_TEST_OUT_BUFF_FULL_0		BIT(9)
+#define CDNS_DP_ENC_INT_TEST_OUT_BUFF_EMPTY_1		BIT(8)
+#define CDNS_DP_ENC_INT_TEST_OUT_BUFF_EMPTY_0		BIT(7)
+#define CDNS_DP_ENC_INT_TEST_FRAME_DONE			BIT(6)
+#define CDNS_DP_ENC_INT_TEST_FRAME_STARTED		BIT(5)
+#define CDNS_DP_ENC_INT_TEST_CE				BIT(4)
+#define CDNS_DP_ENC_INT_TEST_RC_BUFF_OVER_1		BIT(3)
+#define CDNS_DP_ENC_INT_TEST_RC_BUFF_OVER_0		BIT(2)
+#define CDNS_DP_ENC_INT_TEST_OUT_BUFF_UND_1		BIT(1)
+#define CDNS_DP_ENC_INT_TEST_OUT_BUFF_UND_0		BIT(0)
+
+struct cdns_mhdp_device;
+struct drm_display_mode;
+struct drm_dsc_config;
+
+void cdns_mhdp_dsc_write_config(struct cdns_mhdp_device *mhdp);
+void cdns_mhdp_dsc_write_enc_config(struct cdns_mhdp_device *mhdp, int stream_id,
+				    const struct drm_display_mode *mode);
+int cdns_mhdp_dsc_sink_support(struct cdns_mhdp_device *mhdp);
+int cdns_mhdp_compute_dsc_params(struct cdns_mhdp_device *mhdp);
+int cdns_mhdp_dsc_send_pps_sdp(struct cdns_mhdp_device *mhdp, int stream_id);
+
+#endif /* MHDP_DSC_H_ */
-- 
2.34.1

