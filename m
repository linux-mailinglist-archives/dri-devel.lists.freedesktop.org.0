Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5B2AA4077
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70A210E68D;
	Wed, 30 Apr 2025 01:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5iZmymSW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C702810E68D;
 Wed, 30 Apr 2025 01:21:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjiJDYiUjTSd8M0loM6mD1iqfw2EFRxJj7zmSjgXKap5CyevGqACYbRZHL4mfHZbyiDAPRI2JEIuNUfWX+KJd6rbAk46yqJ1sg69QwP+a4NGvgkAT44KMB5EGpaeCKUGDFGs+rwSoPvqiMRNLKz7k/WsBddgv+YFWgLfDtbgXEI11rvzf6E/rG3Wra3gJZ4Vdv/GYE710Esw4xNne7Znt/y30pDQZvKl+kOn2vVsfp+zwBSWS53jzZM4+oGvAJZx9bh1H10aI9zln4jz0xOo2bV1aqnk/7Q8irkBB2f2ommgFZ9tGKC3MA49BInAoWWas1EE2NwiCLCrTU0SQYsOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHCa+cvzAs9R2pyoFc5a1G3eWxHVXSdEkh+//fkOYSk=;
 b=Yc5dXVgqWl8KOL3oPrb44oAr1mTIHW8hB881+jM5/3VZjuq7EC9In7OXrBhSafwg9UOjIadnEoV8xXaArhFK0MwaAkzT+2xh/r51kfOPZFn94y1J2q6L+wpv1y48Y8zvZ48SAdO1nIr9XMHLnCy1HuRFFJlUo0cctR6NQrJVUKshTGxAI4OO7pZjmDR246w2/dgz+E03PLw3L3gHJDxcOuY1Az24FUbjHlfLnnmEyfv5ylg5PvKTR+10WggUpIFteiRhp9ac1/16LP/GifKgkBWUjYkp+JowxnnYiXpckedhXzWfcNBLnw+s7v4Go9T82PF0yeCMXvlltPqNQKnuGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHCa+cvzAs9R2pyoFc5a1G3eWxHVXSdEkh+//fkOYSk=;
 b=5iZmymSWN4M8enuIbzxs0fEKK2H05fCxJAe0QlC9zbqlU6xLChOTHcT7i6/Jpdrr68I8AtkfjlIfJt2IwwZzhQnHrOJTjb4IBgXtyyE6q1Z6HQiKifoloMRl09XCSimQQoWQd4e8DANjLkWT/fA53yt2MoB7ssJh+ieyPIB6LBo=
Received: from BLAPR03CA0037.namprd03.prod.outlook.com (2603:10b6:208:32d::12)
 by DM4PR12MB5817.namprd12.prod.outlook.com (2603:10b6:8:60::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.32; Wed, 30 Apr
 2025 01:21:11 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:208:32d:cafe::11) by BLAPR03CA0037.outlook.office365.com
 (2603:10b6:208:32d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.39 via Frontend Transport; Wed,
 30 Apr 2025 01:21:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:21:11 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:21:07 -0500
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
Subject: [PATCH V9 38/43] drm/amd/display: Swap matrix and multiplier
Date: Tue, 29 Apr 2025 19:11:08 -0600
Message-ID: <20250430011115.223996-39-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|DM4PR12MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: f12de73e-1615-4302-51bf-08dd87854ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U8AJFfPFS3RR+r1gWy26za8F0YRIMALSUdPiu/XAyuBDgKxzLlY3reZpZ4Mx?=
 =?us-ascii?Q?DOGr5nrTy/H3Jgviv3Y3yLiXbArr9LtQTzwgDGaxM7Efs9v2d6TAd+Y42puB?=
 =?us-ascii?Q?L5fva4LKl3bbL79hJgtDZGfH36VepL080g6zhxBjY9hlvQuf24RQcCpXDQmT?=
 =?us-ascii?Q?zjoLMl7XNY/x57vBYD1WOUtyrlxolmV7Fapu5aTAOQ6bZrdlX5l/0NdQYp1w?=
 =?us-ascii?Q?aCZDmOHU9510nLW3IuiGu6GL/z+LCix9n430cMlpIhTr9J0BV+NC5rxrm8no?=
 =?us-ascii?Q?UGMXMXA6mVF2vWJxYP11to09RLxQx7p4pW49IRugoI6usmjbIYdNlE2Xejb+?=
 =?us-ascii?Q?4ktdW/Ak+7W+bJ+e72pH0D3MCb2ok4unKVKM9P2QMqQuICLYSclP6ynY0h+f?=
 =?us-ascii?Q?errM3hr5L0RIUW2v0eLB38VnDc+1PuMQ0J4innm0HJUOtJXsVnl5Wbo9KF3o?=
 =?us-ascii?Q?kblLczh3BDMGc9ZT0ngQEryMe6k8Y7iA/TBre3ZI7yvIG2fBUDmHUrxpDDw4?=
 =?us-ascii?Q?1no/5jLTKxmpFhDc6GjcBZMjmqdvlm3dL0+S495O27BL4icETr4CRpA1Fxe1?=
 =?us-ascii?Q?7ZwQDdoxQn4ICY/Ka9lQOB6k5kzPBAPHYnqiFNAfHkxZc/ywF1qWaLGc2H8Q?=
 =?us-ascii?Q?DTusgb6qHHN4XYqXhKMmsMZh41GY4OPWJQXRGmbL8D4nA+FJJ4F9rptjfgot?=
 =?us-ascii?Q?NP+dr+bMEcyVrpfKP6dHUbTOPvOdmlPKElH0zdMHrXNmOomjnJTfc4g0vzZC?=
 =?us-ascii?Q?NefFfjcroLbi5ea8giIeJycw/R81fu9eBxRUwlC7b6pyJgzlJ+QIESko/vmM?=
 =?us-ascii?Q?pja8U3eF0yp9KZ+pyeGJh9QKrF0I2k5Fays8lVCFxa2b58udSycnWZ67sUHg?=
 =?us-ascii?Q?wMNBD9h8BhHq3tmYbz+B5Wa6EvQYQHUyxAdpJP4petkw9aYFqZNeFKWzE6Sp?=
 =?us-ascii?Q?M2dza+iX3v/qaeJ9ShMrNrvEdTdc0E+iYjknVZitTGEVN/nbw6MMExRc2zzZ?=
 =?us-ascii?Q?shU2frmCSKYbtRccxTDY2+a/ApGtPDzYCVv02JuocoUEMGVeqVB6pq5qO7Uw?=
 =?us-ascii?Q?pnkFNkJdevlhUFxn3b7q+l+D74Nvay07NAXx/GICvSoe63P5RPmx5M0Olu6U?=
 =?us-ascii?Q?MtwwON9IMo+W/XAi+G8drfA7F4wvoUBxv4ZRLreaOVpbfh/vDxDKsgChbEfU?=
 =?us-ascii?Q?URsxuK/iMZ4RNLX8LFeJtE3Fgze+7a81b80ymCV8SLH+32UAZHTnXt7zI6rV?=
 =?us-ascii?Q?GhNpCK5aWmbd5AXMz9z18fT6zrvkeMWY84s2l8WisfG+DaqR4CSW2uR5a72h?=
 =?us-ascii?Q?JJmsjdhYABpFyqS2afFQlpzeLcRt2z3Zq5yxHpnRYXwZVoUjHjsRSgKHAkrr?=
 =?us-ascii?Q?29j3WSHm2QjKlYB7us7/hefM3TrZ+NakIzPcsbDKaVuwWgOmg5SXBQqAGwZf?=
 =?us-ascii?Q?HihqK3kUt4jxrjdgtBB71txV+ace1qhfKn4JtnuWrAZ3MN2MhQLL+fN/uAMa?=
 =?us-ascii?Q?8waYT1bmTNbI1v+DgOX6QZQIfapyYjOJ9SNv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:21:11.1048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f12de73e-1615-4302-51bf-08dd87854ac5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5817
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

Swap the order of matrix and multiplier as designed in hardware.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  | 12 ++++++------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c    |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 0044ea112ef8..313716f2003f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1484,25 +1484,25 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 3x4 matrix */
+	/* Multiplier */
 	colorop = colorop->next;
 	if (!colorop) {
-		drm_dbg(dev, "no 3x4 matrix colorop found\n");
+		drm_dbg(dev, "no multiplier colorop found\n");
 		return -EINVAL;
 	}
 
-	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
+	ret = __set_dm_plane_colorop_multiplier(plane_state, dc_plane_state, colorop);
 	if (ret)
 		return ret;
 
-	/* Multiplier */
+	/* 3x4 matrix */
 	colorop = colorop->next;
 	if (!colorop) {
-		drm_dbg(dev, "no multiplier colorop found\n");
+		drm_dbg(dev, "no 3x4 matrix colorop found\n");
 		return -EINVAL;
 	}
 
-	ret = __set_dm_plane_colorop_multiplier(plane_state, dc_plane_state, colorop);
+	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index efd4799165a8..bce461ecdad4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -75,7 +75,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	/* 3x4 matrix */
+	/* Multiplier */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
 		DRM_ERROR("KMS: Failed to allocate colorop\n");
@@ -83,7 +83,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_mult_init(dev, ops[i], plane);
 	if (ret)
 		goto cleanup;
 
@@ -91,7 +91,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	/* Multiplier */
+	/* 3x4 matrix */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
 		DRM_ERROR("KMS: Failed to allocate colorop\n");
@@ -99,7 +99,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_mult_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
 	if (ret)
 		goto cleanup;
 
-- 
2.43.0

