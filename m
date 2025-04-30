Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EC5AA4053
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F7510E645;
	Wed, 30 Apr 2025 01:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AkSXBhqJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF5310E63E;
 Wed, 30 Apr 2025 01:17:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQCGKTMe69xEgiH7JiACRjbB2lCpcNLloPke0s6AKg8jOFZB+rKhpLeRZ8RnovgdJwqJCfC6w3t0iDT4BftsMIollKyVO/JTPrr1pgdZQ9nkdxVLTaY37hnZWRPSviezKcT3pPXzEFeWE26shbbz06hGBgWSK0D20CQf4UzVbOimHxZb0vbHJ5m/o1KBxYv+b45siAeyXjsYIOrBAIn/09hYGWIvav+EYsi53LwGnLlRqb1TcMugecxyw5n9zkWeJsnUXw2q500YP0H3k6jDmQdB7oi5kcq6j3onDPLh7tyJL842uCidwOFOSWbIwL5W9Eb/GqHZGBfvBvQAT5aD+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHSZV1aeI4kahc9enJBm7tlakAK07Bhjuq5AOxYnx4w=;
 b=bnR8I6mKwntHou12bdTWLGNrbvtJq1+XCslwJ1TolSh3fixxVIJyDSa20wT8XceCsRBwV4gQ96MF4Txu2g6i2gEcIws0wS9Wu145viflV/oGxjBuxCvxEaK77xCIRpZVjPGJa69hDvXaL8JG+Em9wlMtfVEA51wJQZGwilc07GLMSDP02ixYa3iyVwgt9MMgsx0oME1vMoPQlqZXTYLdVHsnOWSij0xmUXpTEWybAmfKWDXXXK7xge6hJIsnSe+X9LOfo741pqGWDilHB5f2aXClGiFMlB7YszAGR1I6qvxlqGFHRtJ3y6kDHVnbHXLVq4PrBKjeDG8NXWuy+7rsUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHSZV1aeI4kahc9enJBm7tlakAK07Bhjuq5AOxYnx4w=;
 b=AkSXBhqJRpJRR07BdpmKR5fZ7EKAhGT8OpAgqtWlyhyC8kUiCB/VA243WQmdwPaA+Jhc8WTTT2v9M1yb5e7/Ga5Nj/U4e77nQ6n7oN3VglyvtI8rwJIdz5YhV8oVaJyPK+a8ku1v9GQ67D2k4bz07ndjFOlmREqYRBUVaYtGYJw=
Received: from SJ0PR03CA0043.namprd03.prod.outlook.com (2603:10b6:a03:33e::18)
 by MW4PR12MB5643.namprd12.prod.outlook.com (2603:10b6:303:188::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 30 Apr
 2025 01:17:08 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::8d) by SJ0PR03CA0043.outlook.office365.com
 (2603:10b6:a03:33e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Wed,
 30 Apr 2025 01:17:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:17:07 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:17:00 -0500
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
Subject: [PATCH V9 21/43] drm/colorop: pass plane_color_pipeline client cap to
 atomic check
Date: Tue, 29 Apr 2025 19:10:51 -0600
Message-ID: <20250430011115.223996-22-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|MW4PR12MB5643:EE_
X-MS-Office365-Filtering-Correlation-Id: 378888b7-701c-46d6-2546-08dd8784b995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JuLikPZA7E9k3VPHLMKJhv7ucvVuNIdJckP4ThOU5heG30xp2r+OdOo7CX8c?=
 =?us-ascii?Q?CO1Z8mPxz7q/i9KbeVoGpz51iQsH0PhRFVHnE0CyhOY+7a0QrEXLs0MwvF9y?=
 =?us-ascii?Q?+4nSw/aJTJaGLs0+0lkOa33eGo70z91A3THjalhnwC7EFQ3iV9evIqpFVc+g?=
 =?us-ascii?Q?XQrOWACLgLFkeOnOFcYCHA+eQC5xuoO5K4PML++XqcNyPU3EDE0qa+ei8PC/?=
 =?us-ascii?Q?OyGre8hbLyk5gwHy4PczT7+Q66v/YXds2tRPUVkUya3gEEzfJwwqUbftAhJR?=
 =?us-ascii?Q?e3rGDN7/3FmbXwfFcB8bv8dWYhlgU8yZ+axT7gPuEtaypRkvyliu+QHmVwQh?=
 =?us-ascii?Q?0QnLEE8YegNvV6KnN6e70esxiqqigzP5W+JkfysvzE/++Wu7l/uOyCYIleJG?=
 =?us-ascii?Q?AwqixB+3DsPcba0+NK9hERCn4gbBcQsLm+G16WoCzpcsP7pwEHlB8J3tRpLi?=
 =?us-ascii?Q?nkLMyyAPyPJc0fXi4otx6x8E8GrfOMI6E42TpMblYqc4aAUa1l3E+ceYe6ko?=
 =?us-ascii?Q?HXSiyB+l+CxJQJRySzIDStqY7rZGMS/X+f4C49t7Bp22qQUpP5ps94hRlB/e?=
 =?us-ascii?Q?g5XHkuz5ajUu48Oaj+QUbdNTrjcf+RsBBwJ67H2Uoc/2uZ38yVITQhO3hRpU?=
 =?us-ascii?Q?XWXath9XoNpHg5HALT7LX6EBxPCqvXWQeC0iH3YZh/FNa/AG0ixXHMcCGfW3?=
 =?us-ascii?Q?s4cTnhJ73hOL81OtAcP9F3bvtuE2YR5bIGH6uPccePKOfmAeKEErkwPCVsve?=
 =?us-ascii?Q?ScP78xiao2cnmKBuN9mHLbKPhw2cadtMYsKugpEfWWJIkDLmcSbwghOKCvoQ?=
 =?us-ascii?Q?MsXenj1qK/HVpNvaCQPFyxZBpFNdRoGzgzpJztKHXdci5pPbCI6jcrMTzWcw?=
 =?us-ascii?Q?ruvzzYb5kgN8tZP2Fg2m9ga1t+Z7rQLQxKdJmZ2yrWSA76hC0pjH+5hXm4fl?=
 =?us-ascii?Q?s2Z6w0H+pzGlFDcHSnD3KsiKseu5Pd4HRpIkzQ0vlnkkoOSml4/wCTdmY7CU?=
 =?us-ascii?Q?m3JkhHxD9bnpa/paMhsYGqTWdW19chh8kOAAXtOMqmJPeiLlORYnYGRzpqmR?=
 =?us-ascii?Q?E/6v/kEfdazaPJOHoTUYtQry02SAvys8L/nitzbqsgrrENxm8uMJBSMuyCRl?=
 =?us-ascii?Q?3SbJ2NvMQgQ0x5fbpIxUC24zX5901CaGa5MXK6wSpVkiDoXKpApFmpkpWl2w?=
 =?us-ascii?Q?RTF91iml1MGYA7rISJts3Uh4LThJUGHTq8DDm53zFUjxb9BO9iWQ6vd84R2g?=
 =?us-ascii?Q?7MzDDl65fjeht2Gi+6YIO1VvipH0llrknfZRchv+Bpk69cmCyTYMnSNLl/2U?=
 =?us-ascii?Q?O5TyuPe7clveUpwYNuU0zdQZjBojaQfq1VF2hvC6NtFdplR1HDTHNndIvqNN?=
 =?us-ascii?Q?CqJZTm+hCytlSvf9GvIgYiQbZhJtxdaiLNxKQndtGogH/EvQX6r83oI25mdG?=
 =?us-ascii?Q?Z6qCYgb4skkY/7aQ1YheP8EEqHUNF634lf9yJ4xkYZCmeREu9xAdzHlyGBpU?=
 =?us-ascii?Q?VFJrd1zCXnMLbqtH5Vy9H1IYndcgk1qJjom6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:17:07.4695 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 378888b7-701c-46d6-2546-08dd8784b995
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5643
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

Drivers will need to know whether an atomic check/commit
originated from a client with DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
so they can ignore deprecated properties, like COLOR_ENCODING
and COLOR_RANGE.

Pass the plane_color_pipeline bit to drm_atomic_state.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v5:
 - Fix kernel docs

 drivers/gpu/drm/drm_atomic_uapi.c |  1 +
 include/drm/drm_atomic.h          | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index be73cb9f502e..0de0fdd8af5b 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1603,6 +1603,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
+	state->plane_color_pipeline = file_priv->plane_color_pipeline;
 
 retry:
 	copied_objs = 0;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 7904a38caa77..4a30ed8ab1a8 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -464,6 +464,24 @@ struct drm_atomic_state {
 	 */
 	bool duplicated : 1;
 
+	/**
+	 * @plane_color_pipeline:
+	 *
+	 * Indicates whether this atomic state originated with a client that
+	 * set the DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE.
+	 *
+	 * Drivers and helper functions should use this to ignore legacy
+	 * properties that are incompatible with the drm_plane COLOR_PIPELINE
+	 * behavior, such as:
+	 *
+	 *  - COLOR_RANGE
+	 *  - COLOR_ENCODING
+	 *
+	 * or any other driver-specific properties that might affect pixel
+	 * values.
+	 */
+	bool plane_color_pipeline : 1;
+
 	/**
 	 * @colorops:
 	 *
-- 
2.43.0

