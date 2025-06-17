Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD2BADC086
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A161710E519;
	Tue, 17 Jun 2025 04:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iOakudqc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2080.outbound.protection.outlook.com [40.107.96.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED0110E519;
 Tue, 17 Jun 2025 04:27:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKU7B9PC8xJAb+sxLL7GdPnDubvWNOsaLaklwDynk+iKrH851bg/inl1SATb5DP6hGRFU5bPXMJm48n3rU1PtML1M8WJyUo789r8odMFOXEVpKmVhSgsknwz/nBl4HOACIT6J1qgdg3ingGwkFGp2/Mrc+nNuPgKKC6PKtCKpf+F9jCB1BCWK05hXlG04A0d+79zlmVUFZ+6YvNBFwpjueVcSVDobtoPA8Pedmb4aS8unEmq8JbSvS2FnsRVSxN/E46V7cY5hKxvd+xpfCe07hV7J5HAD+2qpvhfRbw+hNl3QW4rCh7dH9S7LxzwX8eP0PpTt30w97L5cYzfgOx/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyXpRUx0uoSRvfnUnA0UaGT5VcV1GHKyhTqPTas9/AY=;
 b=MtOVTBRM/sIMyvdtTJ+kPBwmTB0d/XjspM1PVbpH4zGuuh7RgoGdgAn3ZcCSv+Vhiv2vLIc1KrbMpIdX203e7LJY+4eSzY+aXLtyi63P2BhrTl8QIO/0OGabal6vS3FSNHL3NubCpme5kqj/aDXNJKyHmBUh7ef4Iw4LmectblPov/Mi/bWd8/BmtAiIqUadlQIHZwL1OkSK7GKXMjkomVnW73iROGaU1Y/QBA3+ExbL52UC5ulW/LpmlhXL/G+kPuyHxRW0Oc6y66vUGfLneuKaVkHXaWz/vP1xvb7I75KQ2LU6Lu8d7+RYImlvQ4fY/6KA+K+lPMvqGWwrbsUaWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyXpRUx0uoSRvfnUnA0UaGT5VcV1GHKyhTqPTas9/AY=;
 b=iOakudqc+lfr3LKAGAUJeRfq/3T4ktVNKyiGr7MxI/5sm0kkN8mEqVKNJ9DAM0iigCgFqpafpQKeEuCfXR8vWcMoTP5aPcxPK+YTT6kAmhklKYCDJIrlEOmMvc6/GUuvyK0qar/0R/jLgUKCmvWdkmrzjqHdLr6lyG2KI7lb4yw=
Received: from ROAP284CA0293.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:f0::18) by
 DM4PR12MB7717.namprd12.prod.outlook.com (2603:10b6:8:103::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.25; Tue, 17 Jun 2025 04:27:35 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10d6:10:f0:cafe::40) by ROAP284CA0293.outlook.office365.com
 (2603:10d6:10:f0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 04:27:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:27:33 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:27:27 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 39/46] drm/amd/display: Swap matrix and multiplier
Date: Mon, 16 Jun 2025 22:17:21 -0600
Message-ID: <20250617041746.2884343-40-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|DM4PR12MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: b01b9df3-e7e5-4e45-a2fe-08ddad57480c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x/QSjCgL35YAJ9KaiYfBW8QYenqj5600eGcDjX+God5WoibAEtb3SnkILSZJ?=
 =?us-ascii?Q?6iqWt6esC4aufJ2M28S8oMJx3B4lhYlDGtzlqpTE8R8e3OjjY3k4Y2E/86z9?=
 =?us-ascii?Q?PU9cCMI/S6CJXJFdMiA56GH8KJB5RIwJ3Ow/pZmG7L2ZwEZv7H74GPfCyquo?=
 =?us-ascii?Q?7haF09zaz0EJSLcGrm/ODqLudcWqSq5ydJmQJvHIsONK34z7zRLK19unSGgP?=
 =?us-ascii?Q?HycD+hxYkNrQ0J96LQElyXvhCJQZ5mADybC1QDHgHGnTxuKcjIUnNMtNPrd6?=
 =?us-ascii?Q?dRxg/EaHWFg0p/zUOzQV4l0nKQuq09FowUrclD5x+V05uHUEMf7fYhYqg+3z?=
 =?us-ascii?Q?7fRWi0yLEWjG+aY+mNQ/JO0uAxWLnTG86hMxDMq+06q/V6cmjz3Gr9e18und?=
 =?us-ascii?Q?JnP9eB4IzuqkXnr56p6Tw6a7NhcGCdmUuSxqve1+2tnkvCi/7SnL+d1ozNnA?=
 =?us-ascii?Q?uFtSJE7WBvS7OiobTjP08t9Rrg7/km+ik1TJ1TyMCGCRlcO100rfSzdNCgbc?=
 =?us-ascii?Q?UtEsz4mCShVvCUabIssO6LuxnqQuSYDu5yL5uKqrnUB7cVWys9VWditkzNuC?=
 =?us-ascii?Q?4cTFtZ07rvZoE7mEdy15CCYF1IeGVwk8TBl5jZv4JjxU1fqsRiEm+ugy08Z+?=
 =?us-ascii?Q?Nzv4xaPuPvsiGI7kfpqpJgwbAWVcLCpev1OK8HzhkQ0Ptw6BV/8CwVPc0ISv?=
 =?us-ascii?Q?7/BzXm6Ga5JAGg2uy7XIIcsFg0QZu10u1rjRN2EVCkcdPPxIkZSXccFxl2Ak?=
 =?us-ascii?Q?Ka3c2Snp5TyNwHXWzvRIov0R6A4YwmuPZypGdo/6KI22arfClRXAZKMXD7eS?=
 =?us-ascii?Q?zF0lQoYieVuiE/iyIrHptaJ8nMqTFcxSK0TfoSSuGVIkApdWaUjE5sir03k0?=
 =?us-ascii?Q?L0H0jOgXAVkF7u6sBgnmasUWuPZ4iH+wedIX6CBouxuiQsXgo2VuKBZLjWko?=
 =?us-ascii?Q?YwKIi8b5uQWo6fczvXg6H80mk49KM78+eANh+dAuMWETnxFibZzd3yn8Xlks?=
 =?us-ascii?Q?fb416Aqql6Vch7xep99UBEdqyVgdWShdDOVw2gMi/QvMeMTHG9EUq3DhkeGu?=
 =?us-ascii?Q?JI/q3xkRfIYRVfDv7f9SNk07Kz0ofjxVm7wxNqwO4OtyMWw046aH9R437FVX?=
 =?us-ascii?Q?d7RC9+CTs66U7gyVEMu0RoIQHnYA79+Lsfv7Jrz9vw70uUbGvf9b1SKTr28j?=
 =?us-ascii?Q?j+UhYn/RDuQki6abUWBfzVJYsRwLkuYdZvpe7kpFP1YCWEOaS9Qn3V139k3u?=
 =?us-ascii?Q?Q61Tlxf7sW1Yq14AFnAspY1bZJdvsTLQEKyNa3Ge/IWdI60hErVUprp8tVkd?=
 =?us-ascii?Q?b6xH/km2e2R8XNImB9Gwuy6F8Iu9XBKYIYihw4MY+lfJ1oJyNRtbmVEcwIim?=
 =?us-ascii?Q?uHmZlsq8d3/yDuRzEmuV49tK7wqMQuHUggjFBFdBVb45W7f2X4r4oXgdZcm8?=
 =?us-ascii?Q?w0Tl0iY+qWkozyHQY3a2Bj+Vi7aetMrrB8oImRxwq0cjRuuVl0OBh8eRHQb/?=
 =?us-ascii?Q?qxSKeErXHKDGnwnD0JUGIh13ecKcYvduNBIX?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:27:33.8476 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b01b9df3-e7e5-4e45-a2fe-08ddad57480c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7717
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
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  | 12 ++++++------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c    |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index f110b5ae3a77..47414f9c5757 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1617,25 +1617,25 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index c31c201e0a83..f89f6631062e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -74,14 +74,14 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	/* 3x4 matrix */
+	/* Multiplier */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
 		ret = -ENOMEM;
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_mult_init(dev, ops[i], plane);
 	if (ret)
 		goto cleanup;
 
@@ -89,14 +89,14 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	/* Multiplier */
+	/* 3x4 matrix */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
 		ret = -ENOMEM;
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_mult_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
 	if (ret)
 		goto cleanup;
 
-- 
2.43.0

