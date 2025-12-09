Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809BFCAFDAD
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 13:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D844010E51B;
	Tue,  9 Dec 2025 12:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="J1ujTVnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48E210E1A1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 12:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVLH/BBQgpJUNm2bYJ1LmWVIiSpe6iw8WO8KWRreI2/eAvKSjH82SSbnlJWoB4wtY0NW/QlJraj3Mt4PEgJfUFZlzrUMawpAIggDM2y1ouOcZmNyKS8VPcaaBt2O9LTf57xA9eEDNSLyC3WmLgiemSk2cvZzw3x1Z65ahCJFunWjxaChzbLvhU1i6lSzqltSCjIi+FfQ42NARAOJ1yJM6GbLmNytK2/Hi+lemGNPJVWEK8YYX9V0t0nIAWhoZWBStdZqMzHfA7eZh/M+yJwEAQofVqs8IqJuGu8H6T/nHjhHY6AXrwV5yahD1p9ESiEyUX+eTtcUGz8t0EpodTPVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQD89qd5XrrvYJb738qPXuB0VroCPb8QMjU1Qya+lTk=;
 b=xyz+tVV80uNOfxk/FzXSUj+Y3KCluUn7GApLvN/dnxUy2fJf/n6oUPuDN1tS7BY6JxM9yIVZP7R2HgIQK8jKeqV+ivAI7YNl6Nm/UwkUwH6tSF2PxV14OOoq0MZw66ACwIUxNHYFITHDfEmx5MqyT/deyWOLkh8e2ahfJDJtbfaJYBsuKWbQ1GSwAUek1AUNt/kdowUDxKL/t4L8vdm8L1o/p6TGMOcJNxeOD2j2FsZ/su7x/rrrGxhjdmsw1IWtMORoRcfzubImRw2JmEOz4dtwZX3Agd/Uriuzbx2523foWeKTYAipTRQH5c17zyXxOqLIKHUx3GZACGsWc+UF6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQD89qd5XrrvYJb738qPXuB0VroCPb8QMjU1Qya+lTk=;
 b=J1ujTVnENBZzWOrHXrokUgS/+evUS1PWiEt+ZOZI2SsWgw5/zxHMCaY0Y+BUwv2I6fxvtHJaffugRleVyGB5S5aQQjQG2As+MDwIqp52KsVt5X2QvHq2lfw44qXkFSkwnh/ubTtidPEah2kF/JcPnz3+YubPPapP/Gy1xGNAlrY=
Received: from CH5PR02CA0010.namprd02.prod.outlook.com (2603:10b6:610:1ed::22)
 by PH7PR10MB6107.namprd10.prod.outlook.com (2603:10b6:510:1f9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 12:03:53 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:1ed:cafe::be) by CH5PR02CA0010.outlook.office365.com
 (2603:10b6:610:1ed::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 12:03:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 12:03:53 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 06:03:53 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 06:03:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 06:03:52 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9C3XBN1165975;
 Tue, 9 Dec 2025 06:03:46 -0600
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <andy.yan@rock-chips.com>,
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <javierm@redhat.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <linux-kernel@vger.kernel.org>, <linux@treblig.org>,
 <luca.ceresoli@bootlin.com>, <lumag@kernel.org>, <lyude@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mordan@ispras.ru>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <s-jain1@ti.com>, <simona@ffwll.ch>, <tomi.valkeinen@ideasonboard.com>,
 <tzimmermann@suse.de>, <u-kumar1@ti.com>
Subject: [PATCH v10 2/6] drm/bridge: cadence: cdns-mhdp8546-core: Add
 mode_valid hook to drm_bridge_funcs
Date: Tue, 9 Dec 2025 17:33:28 +0530
Message-ID: <20251209120332.3559893-3-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209120332.3559893-1-h-shenoy@ti.com>
References: <20251209120332.3559893-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|PH7PR10MB6107:EE_
X-MS-Office365-Filtering-Correlation-Id: 77392126-6127-4b91-2839-08de371b05f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|82310400026|36860700013|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?764bRKMLni9+gp4EnADFhpaSEGI/tyABXu6r6vWcrV7VF99Nx5OTf4ECbSTH?=
 =?us-ascii?Q?rZo3XDE1qGRjiJoo7/4ZSwn9ZA+/VoyK8juhT3bvb1Ar6PkPqcXZeoFSSDMB?=
 =?us-ascii?Q?6YEFOhCFEayb00slFitIdB4647KzvXDQ7Z+u9ok2wErOv6c7ASap0HNw2Zuc?=
 =?us-ascii?Q?Zwka1q0NBOP6nbeL85OIkGzHR1B3Vpvgxj0rVJKT4dYhXYTGmI6n/LaxNLub?=
 =?us-ascii?Q?gn1coIQwnJ2pZxDfPQEI/8OgwyP1Un2RnbP3GkUy9oRMlQ+g72/UTq+RTmW+?=
 =?us-ascii?Q?B9kkl7/Op0Fx8mNrN9mpXw6CyowsiFB+ofvP/xWYoMrvm995BJMLgqlWlim+?=
 =?us-ascii?Q?iBd3O6GW9A77/5dW6e8r0sqIPH3/9bjNb3WG9M6m2lsphoTN+P9Ag2I5EtXy?=
 =?us-ascii?Q?03loCUxQPhf9X9z0SZpUY7zs+ZenJXxFX+V8AxzJv8c9ar1Kz4CgxiGCSEwA?=
 =?us-ascii?Q?xgU4bUhYPdffwcd6x1y+iNoKo8t/C4LmEmZkn2/xC6TdSEZwGJ8rVYUsR68L?=
 =?us-ascii?Q?k8oBkNzdvepkwVOWYunMfz0t7ulvIhDy5mHDBSzBUEvKqbzFndxJ4T45XSQI?=
 =?us-ascii?Q?64fww8w6Y4RG/thqWk1/kE2zypWn5dGsTcIhW0PWu1Bwaw/VH+M0VjJIuo30?=
 =?us-ascii?Q?8kFGfX6REI3XPT6lOMXlKlcKqeoLhfsDhNBWsmgG9RmHkDLKIv8AwKh8WPDE?=
 =?us-ascii?Q?rznIE79ZpiEWeyrqEsmVfAgkZ+vnUns0lStStx5DdY6TYGq4XfKaSPWuH447?=
 =?us-ascii?Q?/8isL0ZIBdr9YxERaRFnl+DG1Ah9avMUyzUxhYIdFMNz8FIW5HSCPHh6snGi?=
 =?us-ascii?Q?7z6UPcIoFQLo5S/Csq+Od1UdRLBYf401dssKLNmqRsmU9qtfvH3AYEsod6e8?=
 =?us-ascii?Q?aId28Nxmmx9IwdspFn9vIjuts52KQB+bBmHHPNZ9ovgdtb4IlpO6Qp9qJhMb?=
 =?us-ascii?Q?9cgNqzovhdFW2n5wlFGICSMDvoGMbsVvQVrQpqc5z+T/liR8WtIrdrrHRer9?=
 =?us-ascii?Q?UmZkfbZCs5GfSNRiGnlCyrLoQdKfWHknksY74FbZkHTa9RLoh2CNsgCDPYl2?=
 =?us-ascii?Q?oJFjRMEh+DQEBIIFpWVi4IO73B2XyBw5dBv8QXnb/TE0ukqhxMw48YY0GnZE?=
 =?us-ascii?Q?V9HmpcMrRlajFqUHAxCA+wWgzWLzk0Hr5GQHxVTyOmMQysqGtAMifd+8abrF?=
 =?us-ascii?Q?MuHzyCUZUAlWzvB7qF8YpHq/ij8E3XUf3X/9u+GkSee46dfPxNFKZCF6GTK2?=
 =?us-ascii?Q?pbW+FKagCV6TfOThoteZbskG+uCOUy4Y4+dc3M8Zw9EXaB9yiTuRIYm2fXef?=
 =?us-ascii?Q?q+tAFR1IGDwI+/5h6gLtGejdYGXZumQp6kBZuU0N5zaU2XfTkUeQO7Gjeg9z?=
 =?us-ascii?Q?um8XvhZhzIPsv6MKXiNyIQZtUcwNNlyTFgu1xhx917DHDHhlY4hlTx1c1cEj?=
 =?us-ascii?Q?PWdXZ2S+WjyDvFe1Tfox1jAqUlx8kL4Xw9Y1C+GHphnyFe9UBOKi0TcBmmIU?=
 =?us-ascii?Q?x6elvglKWIi5d/sFTCDjnib5k6uUgQ/DWhrPlaj1H1t+kohU8IC0ubGcOHuQ?=
 =?us-ascii?Q?oyvfKzRs/3w1pPvnjoE4s2bXgDVQGAvVENtc5HCA?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(82310400026)(36860700013)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:03:53.6340 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77392126-6127-4b91-2839-08de371b05f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6107
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

From: Jayesh Choudhary <j-choudhary@ti.com>

Add cdns_mhdp_bridge_mode_valid() to check if specific mode is valid for
this bridge or not. In the legacy usecase with
!DRM_BRIDGE_ATTACH_NO_CONNECTOR we were using the hook from
drm_connector_helper_funcs but with DRM_BRIDGE_ATTACH_NO_CONNECTOR
we need to have mode_valid() in drm_bridge_funcs.

Without this patch, when using DRM_BRIDGE_ATTACH_NO_CONNECTOR
flag, the cdns_mhdp_bandwidth_ok() function would not be called
during  mode validation, potentially allowing modes that exceed
the bridge's bandwidth capabilities to be incorrectly marked as
valid.

Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index ef2d0ea606f78..2fb8acd363b14 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2162,6 +2162,25 @@ static const struct drm_edid *cdns_mhdp_bridge_edid_read(struct drm_bridge *brid
 	return cdns_mhdp_edid_read(mhdp, connector);
 }
 
+static enum drm_mode_status
+cdns_mhdp_bridge_mode_valid(struct drm_bridge *bridge,
+			    const struct drm_display_info *info,
+			    const struct drm_display_mode *mode)
+{
+	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
+
+	mutex_lock(&mhdp->link_mutex);
+
+	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
+				    mhdp->link.rate)) {
+		mutex_unlock(&mhdp->link_mutex);
+		return MODE_CLOCK_HIGH;
+	}
+
+	mutex_unlock(&mhdp->link_mutex);
+	return MODE_OK;
+}
+
 static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
 	.atomic_enable = cdns_mhdp_atomic_enable,
 	.atomic_disable = cdns_mhdp_atomic_disable,
@@ -2176,6 +2195,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
 	.edid_read = cdns_mhdp_bridge_edid_read,
 	.hpd_enable = cdns_mhdp_bridge_hpd_enable,
 	.hpd_disable = cdns_mhdp_bridge_hpd_disable,
+	.mode_valid = cdns_mhdp_bridge_mode_valid,
 };
 
 static bool cdns_mhdp_detect_hpd(struct cdns_mhdp_device *mhdp, bool *hpd_pulse)
-- 
2.34.1

