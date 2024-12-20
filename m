Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 533699F8B5A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EBB10EE7D;
	Fri, 20 Dec 2024 04:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="D1iiRMt/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748EC10EE79;
 Fri, 20 Dec 2024 04:38:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cX9MH5mHmvCYJW3xWLWZU/FoXpYGWf8Ed4j2F4dl9LWaNG8WILcMJBrxns69ftcYPJ846uYvqrrOxaejjpTGopS4PlHXKHmRbnabsLNAl1AlBPfJPd/qT+Wk0DvUuMCR+8Co1LuHVzKQMWAw5TrfrP190Cc9jefs6DYlBNSbjcGVaarDTFkNi1vr/JgnA+8LP6nonckwJfBboty/MXl1f6NnmdjJ+FhpTkpBYBxMLwMXGxzB7UJbf/sj5IKB2EqZ8husClAXGVWhhhOv5tzGqiNfulhHttikrm8tokULsMZ/DVAh3kmE8vGeMLI0/AzSO/fYW8XnnPJjvapT3KkjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7Nq8bGVLWWw3BeYCxdq1Ji+TV1YSD0iD1bqUbpIbVQ=;
 b=hp+R9iUYnzwtwqjlIO8AzUS98dxIpwHbKoICHtWqYmd/SNsh9gz4Qaxtm2Ohg9AHLR1ni7kA7Iub00sgwVzv3AwzO3kAPvwYYpEHfPBZmuZOadRWlLCdtiXWuOqYHsOLOnqE2QzhZpsWomcHRhUvQuSbrW4V0hG9AFHrHMyLnoGTJFVqWlC9rQ8KSofZKPBiKNJ1jM8VuXkkKkji15X8bnY0oFexXpkPPRwRoRmwjt9akUN4MzViJ0F6EJJrqJx+7vcdbJZyf5Zjo4VaN2rOemhHIxtwmB8gARqI/xyR15/JmtVzeJ9rcuPsQ5Lm9Mmd/TJF++a3zLCRwc/dGsvl2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7Nq8bGVLWWw3BeYCxdq1Ji+TV1YSD0iD1bqUbpIbVQ=;
 b=D1iiRMt/urHNPmmOyM8/tQjQJhWxhZwUg2LJw68SE7TW1emFHesT3mvAgywKvQui5SrKNjqLIjtqIL4Jywl3FR4UHofNaCK7A4+K+TWHKRrYFMq/vGRrWpuA1I1d6yPXqFeDzwEOrD0+UCLzA1B2HduBtnSRoXA+C+PXK8a/YO4=
Received: from SA9PR11CA0005.namprd11.prod.outlook.com (2603:10b6:806:6e::10)
 by DM4PR12MB5916.namprd12.prod.outlook.com (2603:10b6:8:69::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 04:38:23 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:6e:cafe::66) by SA9PR11CA0005.outlook.office365.com
 (2603:10b6:806:6e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Fri,
 20 Dec 2024 04:38:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:38:23 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:38:22 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 11/45] drm/colorop: Add atomic state print for drm_colorop
Date: Thu, 19 Dec 2024 21:33:17 -0700
Message-ID: <20241220043410.416867-12-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|DM4PR12MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e1d42b0-ef98-41b3-83ee-08dd20b02370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BZ+ykR6E0OSOJ7HlYwTu3zh+ao1ig2Sh65KGvvVgBa+TPi07LZ1usBVMEkON?=
 =?us-ascii?Q?W3nXH5VLYXLfaIL1uGRG09vok9ilWSP3nocN53dCrPkcZs81LIoDInuieX3Z?=
 =?us-ascii?Q?O4XhS7H5nvYywOqUD++mG4i+XqQg64KFdT3TxgCXYGI11jo50CFGm7TAOQpq?=
 =?us-ascii?Q?58e46+vQ/ER9CjwBqsx6DmQjiOiygO/WbJIvihOmUmTAHpBGAlTBYIRUBLSe?=
 =?us-ascii?Q?GK1uhmM7XPZ3pz41BpGT6OyJHGwc9zCFiilT6dLrF5ldbmhsUyISGlxizZnW?=
 =?us-ascii?Q?DxDQTA/Of8RSvarx8MxtJqfwpQg6iMMBlJp2LbIPQcb97IQahiq5WD4wsO3R?=
 =?us-ascii?Q?1yHis3/mv0T2YEfZOZ2838N8MrvCVLPv33EDMUkxyG2kzFb3FVKBo2F1S7/S?=
 =?us-ascii?Q?nVFF98nClghNSlJqdrHkofeCwjgTf/0zO7ftgkfROT5hfv3Ddbir9QIE563u?=
 =?us-ascii?Q?JGX3eAECj+Gwrn6aDpgS/r4sw8siwuOe15ErpczWBwLELDSyqqAhxrfywmOo?=
 =?us-ascii?Q?ZjFmP2qbQNeLHhnPItjQQduS0kVtAY2UxDaeIFRGfs0/ay2h/vKfLsIFmFV3?=
 =?us-ascii?Q?jyomTH9ggbCw6gZcjaryJs+EgsKl4eMKWiiGEoIm4ExnU6LFNp1mhgovj8Fh?=
 =?us-ascii?Q?3STwp0PRJRpbc4Lg/rwnAs1CIvggzYt4oHbHGz1dHqu5Ul9Z0BbYbgaqKQkZ?=
 =?us-ascii?Q?LGfJe2tFEyDHWgDWIgE3ZAc6qCOpDtINj57YzQfU8S4mfwr/4IrSyrtmoC7o?=
 =?us-ascii?Q?mE3hdt0dnLs+QbuCOw98sW6ib50+AeX8SamaMtVIEz7eYEL/tuCdYSvYKsqU?=
 =?us-ascii?Q?g2A9Vpm3BUn60W5zR2PG7CdV3X7xibE3NOqBRKtOUm3EqkFvAxUuPXP4wcG5?=
 =?us-ascii?Q?yCOnOFB5IcQ2E3GtXYZmTsJ2d0NSVX78yc1Ua5mYC67JnazIrtEv8rQ3aZyS?=
 =?us-ascii?Q?/ynC/DHSFzKd5pBv8+8Qa2mQCTiP4N15rF1I5p35hHwuVQpD8jF9D/kn04uY?=
 =?us-ascii?Q?O3w/rPQCzTIi+Ohr8g9t7+jwROf+ODAnlX2jWGOXX4QnJ5RuwxguJSPFXNp7?=
 =?us-ascii?Q?mm3+NH9pKEDXvpekJLGyN0yWREETVow4//eW/2qoYJ0ycLzwZeRS4msLPBgL?=
 =?us-ascii?Q?1vURiN0V9j0NI+E4vrPFEi29hmyMZ2TCDbZxc9TmYqwJNay9QWsFMGHilrSC?=
 =?us-ascii?Q?1I01U203emC0xKJud5pZC3c5RtuKKciBCm2GpNJZ5iSYLMeqYjYhpkw1StrB?=
 =?us-ascii?Q?oFquDUJYPfGhM4w1RR+rEllTf55VRfXFFDeQpL+8jhPwaSne6JNP7MJsLQAl?=
 =?us-ascii?Q?x8i/DFcJ5wE50baCIaZ3iwzvMKck5jziNSrDB4nkTbB5G5TwE33kX+JTse6n?=
 =?us-ascii?Q?Rb1r5AtcaK3NbX8G4ydW7uRQNlio21GfrDlwAvwpUDh+/OMHym/P+ZYSqjZW?=
 =?us-ascii?Q?ozNJuZnx6AWQP8rFJjhtpftqbirTw/nFhF52aTllOnoJsyUz2Wv3YA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:38:23.6450 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1d42b0-ef98-41b3-83ee-08dd20b02370
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5916
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
v7:
 - Add a commit messages
 - Squash "drm/colorop: Add NEXT to colorop state print" (Simon Ser)

 drivers/gpu/drm/drm_atomic.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 44c5b5dd8b33..736fa6a11c08 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -777,6 +777,20 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
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
+	drm_printf(p, "\tcurve_1d_type=%s\n", drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+	drm_printf(p, "\tnext=%d\n", colorop->next ? colorop->next->base.id : 0);
+}
+
 static void drm_atomic_plane_print_state(struct drm_printer *p,
 		const struct drm_plane_state *state)
 {
@@ -798,7 +812,8 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
 	drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
-
+	drm_printf(p, "\tcolor-pipeline=%d\n",
+		   state->color_pipeline ? state->color_pipeline->base.id : 0);
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
 }
@@ -1842,6 +1857,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 			     bool take_locks)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
@@ -1851,6 +1867,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
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

