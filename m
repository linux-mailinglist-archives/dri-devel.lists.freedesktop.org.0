Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D78A7274D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB15410E7C6;
	Wed, 26 Mar 2025 23:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BvJAApwE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B4210E7C4;
 Wed, 26 Mar 2025 23:50:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmT1e5mFx1grAmh+EYuNht8dmSytVHSqQxh2Fvaj2srBwAPb5KWWSI3RdsOYRGeo5baJROnJsSRYitTHBvDi5hY7nrNIf0OxDVgitxDesl76rJbVx3zEZzO2GravGf3UZ8PRwK+7Ljf2h4ifR/8V/GBokY4HL+DJIuNACDQjsTljhThUznrrVuUL5oa0YLAv45r4RI/iWRnCcDNmND181rc61a6xotG2vfb/XDw5om0VtiDemdcmFD7nyeAMktQmvRxAzXOgkSaklmu52by8rx0JX3T8ojdcvxBJmq22x+FYKaub7tcGgbMwhmSKnMAk1hHhwSY5A2dOgbpXF+8sww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxCkuHqsy7Wl/4ScsD4TfFFgXpDkjr8vQd6OHbv8Qxw=;
 b=pioYQ2k4e2/il4/p43SRUdwfEeT0DN/6fbrHYm/jA1x135doMoD4+BiZ7SOJO5RVo+/FPV2r6dA34kEVZXvnV4l1rYCYK6OLdfTzbJsIeegSn6urR1VZgqi7faRaznH8NNBz5fvp0ZZvM7Mcpu09sNqSUxx8Q091mwJoxzseOPxlSHwr0Y4s0K9PgJzmTfWSYNwWArO5g1hoxM//k/0VPH+9I6JrjIxz2mtYClG74+n+QFiE/xoyAOAITx9oXDInEW2Zr+mauLiiLgXOS7As27e+s6tprg5GhGUzAY44CZtD9+sorIWxlcRPcWCiRA2EMyNl2TnEw1afSs4CCXwi1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxCkuHqsy7Wl/4ScsD4TfFFgXpDkjr8vQd6OHbv8Qxw=;
 b=BvJAApwE+ylYwUS7d8D9BxmsW3Nw/kS4iIF4UNFByBHjrG+3n7N1Rl5FRZhHFTXPZltHbHnul33Dpj83xQwaHpy8MnvlS26rOXaEt2xnYRVWVXhrhl0R8soIeeP3/+rADBR+Pz0pzC+nleJS4kyb+3SgF7NCVhZ+VLrlqfpZCe0=
Received: from MN2PR04CA0016.namprd04.prod.outlook.com (2603:10b6:208:d4::29)
 by LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:50:42 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:d4:cafe::5b) by MN2PR04CA0016.outlook.office365.com
 (2603:10b6:208:d4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:50:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:50:41 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:50:38 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 09/43] drm/colorop: Add atomic state print for drm_colorop
Date: Wed, 26 Mar 2025 17:46:50 -0600
Message-ID: <20250326234748.2982010-10-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8754b1-c5b5-4ffc-7491-08dd6cc104a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J52h/46VZRxDoL7k+GDjWlX9B8zcl/mi6VJ3Fj0fM7dFQNNlmn5u2ek/RyoI?=
 =?us-ascii?Q?MaFYfa7IxzWVRVRZeiJa4btPksJP2orxQFXk3KmtfEWDxPWOKAoeg1X93fTU?=
 =?us-ascii?Q?L7Fv/cBW5UVKfYOZrsC/lTpggheLH6m4afYls2ZB0ZZ9X8fDg3oDw9BhTCWF?=
 =?us-ascii?Q?uAOzf7I9Om1AoMv2WUO1lc0RBPSEEpopp/DJhEivvAgyNwjlfjMaMX+eyeTI?=
 =?us-ascii?Q?JU+Fc4DNnsDcmCzdp2PAqGNyBDwVpKjp6sXfPdeTcZV7WXWgxi1U34Wj8VpU?=
 =?us-ascii?Q?Riyh6fuCi2rtEi/h3Eanm1RjdNpYLrs+xQumzOiaKLvNcuV/+jBP6WPO5Y9e?=
 =?us-ascii?Q?Cd4dT0IU3NLwzwrya0MbpGr9AgHtTnjpqX5a3J9ckUYfn3XZofYugRuk7LeA?=
 =?us-ascii?Q?VdCZRi+gvhlqFjj2veXp/5720dO1bAlrviNI/MxZMfU5Q/DxwlmIVR3ZnSoW?=
 =?us-ascii?Q?fh9Qh+iYUQ2VN7FZAiKY9dp9GSqjdZ+7PkpKnusnC50K4YX/j/3c8ywM0z7S?=
 =?us-ascii?Q?yBF+5DO3J4XuUCWturzUHYW6qnkx7rZz4oMsi+E+wPWv6SldO/8lsmKnjQtj?=
 =?us-ascii?Q?JgpbIKzOLDY9LP2zz9Rx0Zv2cgndxUlXXF1U00xfGXCjEYw3PzgK/aoqYSZc?=
 =?us-ascii?Q?64F3LY9WpPjBRhZdyBBfCNA09QnQPmreEH1bb56BfXgaYo5HcK5aoNG0e4jT?=
 =?us-ascii?Q?ghzZJCM9vTr96apFWCYISG0iYbOPnmgtT+lXEKLup1pmCWFz4x95UmwFYnYK?=
 =?us-ascii?Q?8YKweV++gsYqXhSVQAP54PpTc5zUIHJLZCq0ryrKe/RcJsfRAUTcYZkU7QTn?=
 =?us-ascii?Q?N9tuqp+XM6JGyZAaABE20z6h44kEYKuC7NvFXNAf84KaQSMJKxSxZCVu01sU?=
 =?us-ascii?Q?UotiPkifRfRy+pxKfIvUh/ySe7kaSggUC9RgTeR5P5q+UUDEGQZU/VLGChxa?=
 =?us-ascii?Q?0whjQFlEcCxroCLjlA3Oq2Fdui1aNa17/0p05NIWaiRF6idKBNK+gLWGyH1R?=
 =?us-ascii?Q?gNTEFogY6P0zhWGKReqEpw0sC+TFn46QJ45TYFS216z1Lqt7UyutVWWkr4+U?=
 =?us-ascii?Q?CaHA29Hb6/9/4ni+whabwLrhU8lwD0OYp2dHZVA8XNiiKU2+SczjqwOvSGD0?=
 =?us-ascii?Q?OAQvTbIPJAOqzODja5KHE2ZhHwYz9nI6KfWs01CEJctRGN78ExzMLhZe7L7Q?=
 =?us-ascii?Q?Fh9hpK5lcEmvqx4WX5s64SIJUV3cIw1Q/7gnsCB1TKvVPqlj4acY6kXswzRb?=
 =?us-ascii?Q?f7OBqYON16YTlt4o1ohiNv9RlZ7fZTgR2skutMnlR3t6yEqcoP9JhN0y9aJ1?=
 =?us-ascii?Q?2qAfqCiBM8Iy7DvJdNdanF86+R6T4vmPPWUVP6t3wGp/Y9IUPJsv0SXLg687?=
 =?us-ascii?Q?AbOj1Z6EDZCkq2d0MHzHfncFPHn+c6FuMQgeHXO1dj3NjrszFSrrnXQnI4ik?=
 =?us-ascii?Q?kB+MWAYY/sEieJVrdrxOXgIyIITXykIfikgfVs0wzYIDu0moJvEjCQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:50:41.8122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8754b1-c5b5-4ffc-7491-08dd6cc104a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v8:
 - Add switch statement to print colorop type (Simon Ser)

v7:
 - Add a commit messages
 - Squash "drm/colorop: Add NEXT to colorop state print" (Simon Ser)

 drivers/gpu/drm/drm_atomic.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 12c313d43e56..97a30d6a68a1 100644
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
@@ -1844,6 +1868,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 			     bool take_locks)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
@@ -1853,6 +1878,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
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

