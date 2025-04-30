Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F195AA402F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0815110E5FD;
	Wed, 30 Apr 2025 01:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I3gg1Vp5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F64610E220;
 Wed, 30 Apr 2025 01:14:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yq/O5Vl+WStf7oLo0lC2/unCNB0w8lAybu2/5AQ+1X9sVwaz41ey1I8aYgNakVYqaivzZ1/RZhld6sRtJY5jq6MbaIpExVoxKvN3unNlHAJgMzfKErccdgrNu54YKjytFaKjM0VslwZNttOuJJZHkyiGoslBAlBHmnHQyY/DFznBnjOZt3h+y/ugAn+KXTtHVPKig6TdhJ/ZyT8TH/ky0wVX1OaJfAr5NiKS2+C2/PqW4rZV5RdPCUVPlhPUYyxEV+yb05WhZYSXOZ4qx+/asV+HqRMkcpQglWAHe3T6T6ti+oaaxjmfGvS1V57Q32jgtJZyQvbT1mwFD2BPeSEreg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMsFhKR4IBN2fjN/hArVvhMg1pbL7BqTe9bvvykW320=;
 b=Ajg3bBv6vQI2I3R+N7g4e0Ny1NIVzzDm5Wp+nKuyAdysx2J/fKUmrfxdQAX2d+66HcpApA2s+dB4dsoQ5oHvcXitJgpapmXNVC4kb7J8voTYnp44wFusSvridEwbojX1csF16w8taWUFDpb4Cc/KLNZKptq7qrXIShkGGutnZ+RBvJ12swlconAwpVlcd6ShM2PiI6ZPhX5BWm3VSPsTC1ykkl+I05GCiFQxhz8K+0kAAlxLRxKM1q63oCTDnv/MxmJ0ynGAz32zR/fQ5TQlTf7yzWb/TUeApTVI9jnRVdq3WedbJ86LvmgyKoKkyX9GsyRzEO9yu1a6qjtA14BXBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMsFhKR4IBN2fjN/hArVvhMg1pbL7BqTe9bvvykW320=;
 b=I3gg1Vp5n3H///UZMAGfnzfS8rHqslw6f20deVVa9osev8qxRy+M5htCmOC3zKNtXtsGvLJu3k8jrk6r/kmc2RfzvcX54HoZS0DbXcScWtuZmPKKqLvlmBC4CDFICWooqmGDpT0WbWzHRFU+HZGt49HeM2PQMrnfWK8OBECSxog=
Received: from SJ0PR03CA0234.namprd03.prod.outlook.com (2603:10b6:a03:39f::29)
 by DS0PR12MB6392.namprd12.prod.outlook.com (2603:10b6:8:cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:14:10 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::2c) by SJ0PR03CA0234.outlook.office365.com
 (2603:10b6:a03:39f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:14:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:14:09 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:14:05 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 09/43] drm/colorop: Add atomic state print for drm_colorop
Date: Tue, 29 Apr 2025 19:10:39 -0600
Message-ID: <20250430011115.223996-10-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|DS0PR12MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: 734a2902-a371-4cfa-083f-08dd87844f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pbA5o5xICOG8fxiY/Ju4AUmnfsx0A/tfj+HF96vz00/hj6U2vlqfT+ggSNwK?=
 =?us-ascii?Q?rBZADFJ9brDjHzLSajJb35tuNJk6iigbZ4viWzILVz/UxKxir1fgT4Uz1sH9?=
 =?us-ascii?Q?+1OdUUk6Ymq3owMyfvlVwnexXNBlWt0p82DInO22b1m3+IxsRGrxiGr/hq6y?=
 =?us-ascii?Q?z2rlQnJ9m5vKBZ7+0MOfF1gaOcxWNq8j00jeiTVj1NyP4RkwcMn4OtjEbURL?=
 =?us-ascii?Q?x8H8iMQE7VKYEAyyv/fecdqAx0zIY1q5e4kDxK9G5LboVN6WaQJUpaxHmT+f?=
 =?us-ascii?Q?OtyzVi1haWlK7NBGIIBg6iHEvA8Ct3pYap3CZo8fs4Chp3TPmAIfUUV4cven?=
 =?us-ascii?Q?on/nA9zl3Y1p20NANW9Hexvp+6/94yKD44NFC9Q7KCvY2nhi0ASXSDiDmACZ?=
 =?us-ascii?Q?5H92QxT11xERpfP/Y3LMX47Kks8LVrQIYy+5CHwH8ExN8R6Q+bMQJjcchwzZ?=
 =?us-ascii?Q?aOhqP2O5+r8aP4cVj9ueXV7nz1SYGf9hXM4/VocZkIXu06ZXMfdHcUdShO4C?=
 =?us-ascii?Q?ii2BNQiazuSfpVwqka+7bic6wDowtXwdiuPGNcAdmOanN08n2FG1zpdLBayB?=
 =?us-ascii?Q?5TdQYIAgok/XkerI8Y5UYAdCgo1SkCgbWiMb2gPuxag7gS977fd/acKGCeeT?=
 =?us-ascii?Q?8TNiV+Ooh3VXpJIsactWntBoi+YYZcnegebpllBQx9qbdQOOCuwbRbINSuWS?=
 =?us-ascii?Q?TpXDtq2xhI3GhMCb2XIvALcoDo2SSKLll9a2UI4/nArjB2xAm4o1oE1uzHvf?=
 =?us-ascii?Q?cJX9jZWpuR18PcwOz6GPoBAu/AUUduoMn3LpjiWXJSHa6YUHBM5PuESpqnRM?=
 =?us-ascii?Q?DF3r9LPFnETj8OemhjQMDxz6QNKbiYZoUZjWyAB0zumFqUx/jqKM4LSZGWoU?=
 =?us-ascii?Q?S0qtF4kKGa/SOsvzfYFDlUEbc2d0btJ5XaNQK4lPRHWBOQhs0FtgAfhHK0c1?=
 =?us-ascii?Q?XeM8S6lTcb3QpTg1R9RQ3hBgLcxke27FLyfkffloaBy/4N0iFrDXyQD28Bgv?=
 =?us-ascii?Q?GbUxBat7vBTTfJBc5/oj945upb7MiNrhscMWdWaJ24LrAKLiRvFirmUpzu3T?=
 =?us-ascii?Q?QHPglgqIEqdJ0BKkbyhmHJ/bnVNqrBWnkQ/8UYJ73FLHcVKdH4KYy7PW/GPl?=
 =?us-ascii?Q?slonxS+N/++mFbAzm4JFg2BZcPsew9+VvFWk7zTJDiC+FHlzniBvf5avnH19?=
 =?us-ascii?Q?pf8O++9qE6AB6yEONwdOcJnxgtx6h6F8zdKq4s3Th6ny5Dv7D1cWerbDkSNE?=
 =?us-ascii?Q?MUb+k4QwypWtLqb6pR4YguOlGeRp7OhAXW/lCr9iHA6OKjreofLkna+uZHxz?=
 =?us-ascii?Q?iw41jAiQFB64zst5joafgdK/CGftJ6wG8WVDDyEfbKuk89nQvrcOx/2kGvXi?=
 =?us-ascii?Q?8GsnC6enZ1Zj5/KrhpUz4J+Ex2m0i9seC7sHUjsX0sB6HhvQKZanU9XpDOzQ?=
 =?us-ascii?Q?rOFnmsq9Ut5ZPGlajYd4OdOFdFnOAjsr4X1YMvWJ1C63SOjoJwn64OfdS8WM?=
 =?us-ascii?Q?ePhM3yOxMjcWQilMuaqZmtdvVpg9Eu7+mp5Z?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:14:09.6291 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 734a2902-a371-4cfa-083f-08dd87844f95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6392
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
---
v8:
 - Add switch statement to print colorop type (Simon Ser)

v7:
 - Add a commit messages
 - Squash "drm/colorop: Add NEXT to colorop state print" (Simon Ser)

 drivers/gpu/drm/drm_atomic.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 886dc8b28abc..dc679c8b904e 100644
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

