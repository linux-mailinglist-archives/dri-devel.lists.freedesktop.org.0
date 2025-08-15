Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED2BB27738
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA82810E927;
	Fri, 15 Aug 2025 03:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ciIoyz2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E5410E927;
 Fri, 15 Aug 2025 03:53:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oh9CdSgCUSn08W7lxZC5bBmWClXeCXg0P1xhXmY1GRHySoPAkeB8pQoDpaEWM2t8M1qwobRwJ9GMnZ7WKzoVBkhKbNGAJVPq5wCBCJppQU3Hohj9SxijjLMO6GY0D6/P5Ja1sj8baVSKTNKm+zjVsDXs6yPvmcC3eCGFxjjjZwvjYpH3bcA/gSBW3QeZRTCxd58Yx+S3CfGMawBv8+tbuwoUPhZg8ML5sL7xH7AdncCfqRwh7ee2KdQkFZJuLtLiiV1M4MtQaScsR1fBK+2YRI6eTO0pgzdVKw7yKG7SdOioxehxNNdm20sZEwTx3ysglfDI0tlchliYN9u7pO0QPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTonRt5VvZ+uM++jTw+GoupSeCTx6wufo1UFrmLxGro=;
 b=inDrvnh734FJEeiRNC6xxh2YaFNFBZvn2iep4VO4NUUj3uVlvPOb4QtjosYNPr4aPnV2ZOxKfHMN6NGgexYuWZWOO+KNEpUyETy7QubOPWEV7d0Nt4DbGOYeWCB5lHwHU6d/hcehEsEIKkA0JtE7jv+w3UtRXSN4cxrp2/4BAEzOHTgc+fjRVNbMBRtmPkVGFr9uSendJUBJpXwj8FJW49rYGKE8mfiGkqfigasomtcxj2zVYxnsplF9/BKl/1C+/RF30Fy234zyMgF+zAtx23yy7BKyxs9klwBhIIan4YoDvMaicLzGV3EaLFd2qqbnlBZIZ9ktkIuxhL1ofqDC3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTonRt5VvZ+uM++jTw+GoupSeCTx6wufo1UFrmLxGro=;
 b=ciIoyz2osL2Vz7k5k54z5XzyvY/krYh97hlBVPVFM4VooWFMD0aH8+AXwi/VrJKTbQtdbAc3ujBYb4BlcLTr3OryZ/I/yD1dNXMBjEZ33hIf6+2hDd91LrH/0NMhUZnwcNCmpvbNGPGeO8LvcaHl5k4kWe1DOOExK+FAyvJAyBQ=
Received: from DM6PR11CA0031.namprd11.prod.outlook.com (2603:10b6:5:190::44)
 by LV5PR12MB9780.namprd12.prod.outlook.com (2603:10b6:408:304::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Fri, 15 Aug
 2025 03:53:48 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:5:190:cafe::c9) by DM6PR11CA0031.outlook.office365.com
 (2603:10b6:5:190::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 03:53:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:53:48 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:53:45 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 09/47] drm/colorop: Add atomic state print for drm_colorop
Date: Thu, 14 Aug 2025 21:49:58 -0600
Message-ID: <20250815035047.3319284-10-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|LV5PR12MB9780:EE_
X-MS-Office365-Filtering-Correlation-Id: 4608b789-d5dd-47da-6b49-08dddbaf5748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BnoCr/uqaE2ymqJhtgjzgqI9dTz7FXw0ZzJMNUHAUUIVTpTf5Om1WFc4jn8u?=
 =?us-ascii?Q?nx75y7RX/SJU7zwRW6N3i5wdGP3hER3JGlKxHXfhN12d5Gv6Ql/UA+mi5u/2?=
 =?us-ascii?Q?yvko9yh4AScwzYLfhJDaCUrj6eZ6CuEQQ0ft0n7yL4TyaBkcTPjkh94/fvnT?=
 =?us-ascii?Q?OdjXbhE6bMaIipLCjvrzEzJ3adu2WxOD8KRG89sqagK5gWraJOk1MMZEYVL1?=
 =?us-ascii?Q?tRvd2fqJPVPlfwIqU/8ZJjTD7+6yhme3pfQkG5Rz9900TBcCAGUFsacDg4m6?=
 =?us-ascii?Q?H0cIFOfiQOQ7Pc2d/uUbqgAE20AKFXOfi829uXIpwv0kD4GTokSYy6e1MSCB?=
 =?us-ascii?Q?ZMGLC6HtZiyQ6Ch1CEuNi9UV7xyMdpUmiBSy6QawQvkOqY3cytb+BXPpSZEX?=
 =?us-ascii?Q?/Z8E1iAiSvvaW6ALomi6nyTOEYGn0GsGJ4kRoyItdQ8NihQbM5cecB9HkfM5?=
 =?us-ascii?Q?aMzxWYt5kmI6S9lVpxNECaMWzyX+mVp/lw620O8yxrc3YCfoV9cJowTouQkw?=
 =?us-ascii?Q?UXROLgrvZqmbzVB/sxWzP6/nayghh5ysT0jym6/XvrSTKU8bVZkaM9rxIt75?=
 =?us-ascii?Q?Io3Orwt+5thjyii7iWocEkJYgOmGr1yS6xp6+ZtiSGMVXnk02tzXoGUay6X0?=
 =?us-ascii?Q?P7WC1MnmQ0Op1+/7YwSdDeiAA0obg1Toest85apOA9TAWp4afgPqxvzoLDcE?=
 =?us-ascii?Q?ZE4RM6aEjz3/2IvDLR3qdgMZF0/Kb488y58L3PaXrg/cgOIalr7KUk5nNL/A?=
 =?us-ascii?Q?F8UOrGDi1BUqL0sqY8exLdgqfEQatQ1iNs+2LnLRO+bfB01c/MSt7ytF+tIb?=
 =?us-ascii?Q?bhE9AAfUPm+OX1fzGyfGg/gf081RecVk7vjyvk5r2++jS0a278Mw71drixUR?=
 =?us-ascii?Q?/9C46iOk+pdsj12jUkMJ8aS92VzPXp3MqUJoozEtF/KaMZWmgU9D+QagsWle?=
 =?us-ascii?Q?a83LcqDOC3n1ac/pB+jWlhVrd4exbINU8E7vDnc+wiVb6t01IeKikoJZgI+z?=
 =?us-ascii?Q?npoD2Gcq9CDTxruuFucW2esZZ8U5umKMs9lWztgBOCguDxDy0YSmZk5NSjgi?=
 =?us-ascii?Q?OWv5RsvEISD9AzTxc+iKo5Tl0gmmupZQd79e7k+I8Pez7akRrVNvfX9k8oG3?=
 =?us-ascii?Q?mQTSloGEh5tXOCiblmp9Xhtt6Sp0bPX6NX4BtHIfSq8bVB7nc0wDt/xU2SVZ?=
 =?us-ascii?Q?4PEmwS5bPvd8BrmO9RkN7WsNNKULFZzXfwazvM4o5lHRKiqpntpxY8rosd6i?=
 =?us-ascii?Q?8bpcKFqsEk6TmunPJLex/VBP7f+iLpVQpuSQGATNJCSOF1VmKZ78AEaxpWDQ?=
 =?us-ascii?Q?JyI32WHuYLHWO8/deY0ukFQ/lRIzbkkGD8c91XCLBXI6mvRrn7xZg1jApUBK?=
 =?us-ascii?Q?E1/Tsmez1PZSoSji32stSzg/sgjFlx4TtuItNYqrw08fYU3uHnIPDXrAEqG7?=
 =?us-ascii?Q?cM9kDIz+5XX9Nmk2MOZJResdqp10p1VeY7t4h0KBow63OpfJxYo3QofixJrM?=
 =?us-ascii?Q?LDnRiTbCdSJMxBrVWKycggsHW2vJprR/LsC6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:53:48.5721 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4608b789-d5dd-47da-6b49-08dddbaf5748
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9780
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

From: Harry Wentland <harry.wentland@amd.com>

Print atomic state for drm_colorop in debugfs

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v8:
 - Add switch statement to print colorop type (Simon Ser)

v7:
 - Add a commit messages
 - Squash "drm/colorop: Add NEXT to colorop state print" (Simon Ser)

 drivers/gpu/drm/drm_atomic.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index cb7df543bcdb..9fef7807eec5 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -777,6 +777,29 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	return 0;
 }
 
+
+
+static void drm_atomic_colorop_print_state(struct drm_printer *p,
+		const struct drm_colorop_state *state)
+{
+	struct drm_colorop *colorop = state->colorop;
+
+	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
+	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
+	drm_printf(p, "\tbypass=%u\n", state->bypass);
+
+	switch (colorop->type) {
+	case DRM_COLOROP_1D_CURVE:
+		drm_printf(p, "\tcurve_1d_type=%s\n",
+			   drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+		break;
+	default:
+		break;
+	}
+
+	drm_printf(p, "\tnext=%d\n", colorop->next ? colorop->next->base.id : 0);
+}
+
 static void drm_atomic_plane_print_state(struct drm_printer *p,
 		const struct drm_plane_state *state)
 {
@@ -798,7 +821,8 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
 	drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
-
+	drm_printf(p, "\tcolor-pipeline=%d\n",
+		   state->color_pipeline ? state->color_pipeline->base.id : 0);
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
 }
@@ -1903,6 +1927,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 			     bool take_locks)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
@@ -1912,6 +1937,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 	if (!drm_drv_uses_atomic_modeset(dev))
 		return;
 
+	list_for_each_entry(colorop, &config->colorop_list, head) {
+		if (take_locks)
+			drm_modeset_lock(&colorop->plane->mutex, NULL);
+		drm_atomic_colorop_print_state(p, colorop->state);
+		if (take_locks)
+			drm_modeset_unlock(&colorop->plane->mutex);
+	}
+
 	list_for_each_entry(plane, &config->plane_list, head) {
 		if (take_locks)
 			drm_modeset_lock(&plane->mutex, NULL);
-- 
2.43.0

