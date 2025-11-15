Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A81BC5FB58
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7798110EB5B;
	Sat, 15 Nov 2025 00:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bSnPZkSQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010038.outbound.protection.outlook.com [52.101.61.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4525610EC07;
 Sat, 15 Nov 2025 00:13:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBfatchCThHbBwY5qkjEyxHxg9u1Cn4+JeRpAToy8KRObF0UvxyoYhK/TpCVyJlhFuBE7V3Sg3r2GHaGwjhaNloBwHYbsyxzwFBmG62whTk5dr7x/ocmGOJF55fk7HjixEbSslLGwIztFYBVFHL0S8Zgi3MnYG6j/Og7XonQ3p6NE0h9dNygWJq8og51OFwmNxs5um/EwQ82FvugqffQEcyzGf2RHERBMQDNhZQx9Ij5x90Hkjrv6UdCZN6dWmdt+xJdRBdT4y/HH9QSCh2RY7SXdu0G3SMuUBgfeQnHimMy1WLt2yKGN6qI9hwhZCZbmZckxBagIIIDitRbofeh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSeh5Ove9WiRn4dtjiUqdAHi6yqbwNSIfuwn108PuAo=;
 b=WjSoNzGVZRWJMG01ahtkd8o/JTytFchgpRETrYFQM0aa9cq1Lpdr3TsD7kAgrOobwbmZNJY08AXjYfiOyKncAN4LaXEZVZSh2RvvM2tY4y6qBlpsXIVS7SLi0jEpoFXk15PDogOMQPIte/qiBTahayY4BB7otO0grJU2Z2cl+R2pr80NvipKpBxl5dnmXyk1oGDjw2KNY6Ml0LoaWGqJqWFA8zCbdcgSFqNOZ+miu0WZxJdRUEzxPRBB9ufe2YpQoiYcHmia9c5hfqWbLW4AQhGnuej3kaelWQ/VZujST4NRe3/XRuD1SJn5jlKd/G8fJzokUv4SYGqr1IOlHywq8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSeh5Ove9WiRn4dtjiUqdAHi6yqbwNSIfuwn108PuAo=;
 b=bSnPZkSQJm3namDD+BMkZDVO5F185CVZTbHrSLBdyTZFt1T/Oh6bFglx2ABt2K033kmSq+kcffJxJ+Sn1r3p0HB+fOlJ+yWwfV4SnHkYKybckT7MC578CxlvgUYzZUa068oUj9K/skCqSy0w02TKWu1wnHvTGXFES0uIqyqN8EY=
Received: from PH8PR07CA0006.namprd07.prod.outlook.com (2603:10b6:510:2cd::7)
 by IA1PR12MB6385.namprd12.prod.outlook.com (2603:10b6:208:38b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:13:06 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::ae) by PH8PR07CA0006.outlook.office365.com
 (2603:10b6:510:2cd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:13:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:13:05 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:13:02 -0800
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
Subject: [PATCH V13 39/51] drm/amd/display: add 3x4 matrix colorop
Date: Fri, 14 Nov 2025 17:02:04 -0700
Message-ID: <20251115000237.3561250-40-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|IA1PR12MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: 55adc5d5-ca93-44b9-0aea-08de23dbc00f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DRH9ip8srIv+f591oWtoTsErO4pwz14WDvfNynoUSq2Cg4MKRQ+IXFxzPZgA?=
 =?us-ascii?Q?w7FpfjXHL/oQEBgLu8Ru+07vB8piPCPzNU4EVrQxqLVffQpCkNbRsRKLPwpi?=
 =?us-ascii?Q?Ljp2o2PbV6H6GQl9NL7T7BUtbQvDUaDJfKbKAO3NG/6ZYAOUe3MTb6xZFY8T?=
 =?us-ascii?Q?1X2EYrIG6jvPSp85dy1F2iBV/WrwF46sVHshvi/eCUG0my/mnAwJOSJwnble?=
 =?us-ascii?Q?KRQ1tdQRjeua4SNSnhJRxLpPLZ981w4wRvPvWB5LMVjsuHOhBWsR7qVblOFe?=
 =?us-ascii?Q?8XhpjkR2dIrXazjESzx7rcKe+uFiZmslKw5XmeQxIVXxPt1asnlod9XAvBpo?=
 =?us-ascii?Q?fgBmmCQ8mSNSp0riOU0b2hIyoVguAL3iRJsSgBJFgvI9pABc07CqM+hfSKiB?=
 =?us-ascii?Q?vcfC3BZDJvvDBN1FuMfRIf/ttJwKJmEs8q/dtiui2iO5oXUYCAzMFlTBktyH?=
 =?us-ascii?Q?OrsB3QD5dCrFZCiI6xvkV0JAcaSydi3iXs/o4SWoXa+GFid73fP2z8GbfzRl?=
 =?us-ascii?Q?aj4VNz2KMZpqXaP0V2Mq4TTfWidJK4hFjgjc7lGI2pHdtDqkK2YLqWSgUkbJ?=
 =?us-ascii?Q?kuU+bSUsjlMGTWo22M59Lr+qZ4RRc3YMXfRbZsCL5tzoXvup/DqLRz39uFOz?=
 =?us-ascii?Q?Qbzxy2nDhCFFw/DnCF9pOEpatM8HoCk3bJDDgyyHgjWK3sfKnWziLX8z7Z5W?=
 =?us-ascii?Q?vy8BY364kmRJbn9cyMoKMUEeJ9OnmuWhNLFUW115/GG5iqxaD8FTA8+tsZ1U?=
 =?us-ascii?Q?BvQhhyh6QAt2Khg+p44Da2VUwtP9jwO0M8WDhlwOpPQOeGH7t/w+9Qikd857?=
 =?us-ascii?Q?SeyFNM0meb6xo2BxQULejIBASQHroY5gMkgo3bIBq96ZA1NztYHlTG5CnvkV?=
 =?us-ascii?Q?xv98bi8o55/aqh2vNjKEWqP9FUOvjugi7YRSmEYoyRDIEocEfs46zrqIw9Cg?=
 =?us-ascii?Q?J7U6qUQWsFnuL0VWoaKXv3ubObn27E9shCe8rBFhp0r0MDGKtcb9pkd9d7eK?=
 =?us-ascii?Q?n6Jy3wHRSAIlgnZC2kS6KB+Kp/WKViV4LoKVficLtvjLyYUmG6I7iKUQCnMC?=
 =?us-ascii?Q?QSkZyvYDUPdzwgh2jP1j0azs1MYplIEPQYKOHSCPnzHCPGOtXEsw6Sajxw6b?=
 =?us-ascii?Q?AGELpSJdKpYgiKPoZXdnbgkgB6sGImiXIj8QvDWsGqNVFWUBCxBDOkXZd+4N?=
 =?us-ascii?Q?t9ejM1fzo1THhntDHO9ix/54rFWHIjPi8NR6bJItP9l0CA5/vAVCWAlrLrvy?=
 =?us-ascii?Q?ay7ztja1HyqcLy7Wtg6CBi7VyYA0Q7vOxnHzPmEUbDSY7diq8iIiN07U1Mbk?=
 =?us-ascii?Q?CEtmnckwm5eBNJ/WGSkqLDz6hee68XabfKJg+eQfwMBu5+AIhYTPXgtEj0+d?=
 =?us-ascii?Q?rKK4xyPWSz1qjDAtNxr0EfWuEq49Q8mL03uviFfT1JocZfjdNKHz7+iivevP?=
 =?us-ascii?Q?FwG4Dy1U4H8OyrFRKsGZ8f4zaNVZoeqUqou+faNNMpj7ylO57JN2eRfLVsxY?=
 =?us-ascii?Q?I0a6O3sw8oEmvD0FV0lgoP18Y6dmGgHuWj9saljl4vV34Jny8ih8ggF37JcU?=
 =?us-ascii?Q?UzcrI3ITYW4Nejs6jJM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:13:05.9327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55adc5d5-ca93-44b9-0aea-08de23dbc00f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6385
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

This adds support for a 3x4 color transformation matrix.

With this change the following IGT tests pass:
kms_colorop --run plane-XR30-XR30-ctm_3x4_50_desat
kms_colorop --run plane-XR30-XR30-ctm_3x4_overdrive
kms_colorop --run plane-XR30-XR30-ctm_3x4_oversaturate
kms_colorop --run plane-XR30-XR30-ctm_3x4_bt709_enc
kms_colorop --run plane-XR30-XR30-ctm_3x4_bt709_dec

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. 3x4 CTM
3. 1D curve colorop
4. 1D LUT
5. 1D curve colorop
6. 1D LUT

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v13:
 - Remove redundant ternary null check for drm_color_ctm_3x4 blob (Coverity Scan)

V10:
 - Change %lu to %zu for sizeof() in drm_warn (kernel test robot)
 - Remove redundant DRM_ERROR(...)

V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v8:
 - Return -EINVAL when drm_color_ctm_3x4's size mismatches (Leo Li)

v7:
 - Change %lu to %zu for sizeof() in drm_warn

v6:
 - fix warnings in dbg prints

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 52 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 15 ++++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index b958f9c0a0c2..298f337f0eb4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1378,6 +1378,47 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
 }
 
+static int
+__set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
+				  struct dc_plane_state *dc_plane_state,
+				  struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct drm_device *dev = colorop->dev;
+	const struct drm_property_blob *blob;
+	struct drm_color_ctm_3x4 *ctm = NULL;
+	int i = 0;
+
+	/* 3x4 matrix */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_CTM_3X4) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_CTM_3X4) {
+		drm_dbg(dev, "3x4 matrix colorop with ID: %d\n", colorop->base.id);
+		blob = colorop_state->data;
+		if (blob->length == sizeof(struct drm_color_ctm_3x4)) {
+			ctm = (struct drm_color_ctm_3x4 *) blob->data;
+			__drm_ctm_3x4_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
+			dc_plane_state->gamut_remap_matrix.enable_remap = true;
+			dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
+		} else {
+			drm_warn(dev, "blob->length (%zu) isn't equal to drm_color_ctm_3x4 (%zu)\n",
+				 blob->length, sizeof(struct drm_color_ctm_3x4));
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
@@ -1581,6 +1622,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* 3x4 matrix */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no 3x4 matrix colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 4845f26e4a8a..f2be75b9b073 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -74,6 +74,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* 3x4 matrix */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
 	/* 1D curve - SHAPER TF */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
-- 
2.43.0

