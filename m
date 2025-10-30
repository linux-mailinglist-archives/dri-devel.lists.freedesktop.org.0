Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D0BC1E3F9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C598810E8AA;
	Thu, 30 Oct 2025 03:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="m23tK910";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010014.outbound.protection.outlook.com [52.101.201.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DCB10E8B8;
 Thu, 30 Oct 2025 03:46:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2iz55mpz+FddwBk52dWxVCJrYZivU3+4iU76gvkn1fsS2y5wqONhoss7BTT53B1rgCZJKspOKwn30eTey6eyQJo1bcnYNiFwFxsp4GmxuHMzgcXbycyzRM7W6qoC+3YbbTYsbEUrNhDlNasxKF0/tttrgIQFkWgO11PnjaF7NRSRK7ckEb89CfpJ32Pe3aKEsqVDDORy0aAeWCrmYvpg2OmHInLfZmxAWLRhixYBBiWjimsoUsJ0LHGoRFqDARUsZ+Dui2wRyJRSBUKyGW9vupvPuLeetax7qntkiWdBgnSBqzPn8ScRDXZ8fPbZ9gfYrT+i4NJr8yh+jIG5LO8Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOGzo0JBjSqkOtKwt10cmoY4odmA/01zisVvpd09ndg=;
 b=LIvu6IxVTq5c5xXJZ2CjROGvyWsdqUQo70II9zZyOFJOkdTgBFzfKYUsvJdUU5GhpF/JGg3HhRfj3D07Zvf4fhb9DsyvJVXke3DS2nteoqriBdALYadYnrXw2r9DwYfMFcPxFVHp+c1HiEM+flibl+tag2gOgUIoYhbqYkr0Cni503UEUym1NRfhSwcvByAQelmZtg5uE4gEavfWPA6BkedGEjIP5YKzW3zPKycJFZLL3ssAEdX4naCSmAYmpxiI3XBiVI85+KcbNeKisrIOLpSZaST+br8Zqt7uBd9QLF+wauwxryYsPxDkzZNakpCaiDdBj7+gjgCy5gxdTmeJtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOGzo0JBjSqkOtKwt10cmoY4odmA/01zisVvpd09ndg=;
 b=m23tK910NuF0OlPhSbjUTP27fTxM+3bb+qaDYPRP5iS5bLYHCZmK5LejNoAsbZOgFYtWtKd8/jf0aDxUC+E3MhXOlgMRkGzIOAo6mMeipaY+lGVWVsE8qbF7s+ErSvPZkXpKPf9JjBChqIA/rELnE5ANZXwoL5AHAFXQmiXN2Rg=
Received: from BN9PR03CA0160.namprd03.prod.outlook.com (2603:10b6:408:f4::15)
 by DS7PR12MB8372.namprd12.prod.outlook.com (2603:10b6:8:eb::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.12; Thu, 30 Oct 2025 03:46:45 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:f4:cafe::4f) by BN9PR03CA0160.outlook.office365.com
 (2603:10b6:408:f4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.20 via Frontend Transport; Thu,
 30 Oct 2025 03:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:46:44 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:46:38 -0700
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V12 09/49] drm/colorop: Add atomic state print for drm_colorop
Date: Wed, 29 Oct 2025 21:42:14 -0600
Message-ID: <20251030034349.2309829-10-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|DS7PR12MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: afe29583-3d40-4fcd-7d84-08de1766f1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t9F8H7TFWA6rgtss1+SrZDOCI0V596e+GEUpNzP7muxAsevC2JGsL1q2ymbZ?=
 =?us-ascii?Q?DlWMkRfMhlXgQMGveyfkvnVlvFfMcTKcsyhIJPOeX05t+YLTzuHM9JVAgTiy?=
 =?us-ascii?Q?XyG/4YA2I9cAUc2ORq8CJEKgvymdwztj3rdhLyYUInrgkwVeaK7RTjQQRgbp?=
 =?us-ascii?Q?ngDWjZTZh7gvI9Qm/Wo0cxDp49Nv2R0tkRYHiEzsnsf5um6FqxQYlxgAOapH?=
 =?us-ascii?Q?B+Dc2X9HSEuFwMUD7KEukbdroF7XLWh6DddNdpj8iRCffxP6MNT4qd+XY4kL?=
 =?us-ascii?Q?bALy56Ua6v1z4AW/YyovsTrDwJNJF2X3N35dVdg1Q3oh9CXJAHjk14QVe7uc?=
 =?us-ascii?Q?v4hG4MXOH+/jZkIKlk+MsHXJrnFaFAcEGSkY+qEvlngsvHAsbuofTT2T7w5t?=
 =?us-ascii?Q?JXlJxLWCZp5IJsWFkggFVM5t6WKz106SfOj0hjafW6zxPl12kHMwBqTy4VTT?=
 =?us-ascii?Q?pYlrKUm+BWglqeA92tiZlbI7yjog4q9Pt8FoAvwo9DcgNKBXYNXL9Uo0+Z75?=
 =?us-ascii?Q?SSIs3tQrd8SXr6EDOMuh2HI6hX1+4W65QOyTTk8Vfp8KhinIUDLi8JgT1wZv?=
 =?us-ascii?Q?itpGPFLJ4EM3uqxljhv/qdftBTR7z5XNvXPAzMbF3mWOY/1ZB1bsIV9MUQ6m?=
 =?us-ascii?Q?XDHFg3jJ083FNhJn5Jv2Mj/IqT1fFjx8veuN3OTBMg6/LTIeHm+KMDxlahxZ?=
 =?us-ascii?Q?rVy3JwXNW0d5YzkqFAGZlC/r8xlNhu8TVSok6CvNQsRHFb/I0jxKpy8IgXei?=
 =?us-ascii?Q?MqqB1BkfHG6/wSBCJGnOaSGTKyhsWbavA10rEYfmhY9tc3jkcqmUOtfS9yKT?=
 =?us-ascii?Q?CNmTJbdpYieK28yf3Aa2EYECr6/z4om0L5eIAbnnkem6hiKa5YPSsKZSg8oR?=
 =?us-ascii?Q?DydpYgSSf9we8y4rsw+ihI/ePdNjyuPFD3qmffbHjOfA+cYwgOn0fPLSar6T?=
 =?us-ascii?Q?/xNmDHOEB12Z7ZLEgp8yQvAhxrrTjA8bQpcTLmfLoR+BwOvEYZMumzNpseQ1?=
 =?us-ascii?Q?rSn4SsFeGOlmdG5su05fopr5sKGY4BFCWrgPYgM+ksHXg+ByJ51kyMZqBObe?=
 =?us-ascii?Q?NZawiv3wQJezGFs3KPgIz6uPXGRt84uEF7oaSsq6Yf/Xi1YlSEyT3urkBzdn?=
 =?us-ascii?Q?0hsKID10LClylJIG9bIfHk8AyY1cO6mk37ieaSGPR9nMQBbl4kQDDQCY+2T4?=
 =?us-ascii?Q?253n9TYQGtB0V705zZhV1FZLrUQdYtls5388UpvEaPyVHWLHVYsuVKmPjwLR?=
 =?us-ascii?Q?IS64BZZhLoTwNw3iabGoj8CABRUD+LAgkCDu1ql+YW6nMOiOS5cDohun8IhV?=
 =?us-ascii?Q?ai91P9ZzkECOZvuJzrX5uXFquNhSfVNeKefi3cmZz02s6MMmcjCAzrIIWodW?=
 =?us-ascii?Q?A9fZn3b17xvGU96zElquCnmVBrIG6w/8uX8bV2EVdXIo8lP/P4BW7xuuTHPd?=
 =?us-ascii?Q?v64B609hSYcksjlnG8oWUUKBYkbS/XixPsozT34hWz+EXElL9e2lkNUW889q?=
 =?us-ascii?Q?urNoqLwy9KaGr4u5A4P/2Q+cOabW/ZzywAnRUXYe8A6kBHnNJ5xnNkLmO7Ih?=
 =?us-ascii?Q?MfeYK6wLTp5OancjYOg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:46:44.6075 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afe29583-3d40-4fcd-7d84-08de1766f1f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8372
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
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v8:
 - Add switch statement to print colorop type (Simon Ser)

v7:
 - Add a commit messages
 - Squash "drm/colorop: Add NEXT to colorop state print" (Simon Ser)

 drivers/gpu/drm/drm_atomic.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 8c6a53ff04c8..8611342bb445 100644
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

