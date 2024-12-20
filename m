Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF6D9F8B96
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E1810EEE8;
	Fri, 20 Dec 2024 04:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BzvMO+ps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB16D10EEE4;
 Fri, 20 Dec 2024 04:46:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9qwTjC9eM8NKrNuwRCKYo6VsXkfa7VSeiS20HBQC8ZnIOjtxoeomX0a9SuyKClHydbOzVNW2um1cIyd450Q2d8jX6l6eiXC7S3srS9asqoSeJxdr6cbo8+LcmNckI/tiR8kxfrUOn/mzihGwLaEak60T5NeLyJ0SiE7DI1BpyvUScqmK2r4j12JAnb+Dye15eUQVgKkMKBmUq51r+4vs8yHWAkNyPK/3jdsCIK0k21o82/43AWPxs7T8rMwtoM4GMGRJaFM7PB3oIxKltBJEF8dtxuNHwtGL0TgJjyPJy0t0eAmn6iA51vruhNYj9TdMKgBmAmzyvjX78z6xrMYwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMStaKi+HVRNtScSYmMDaMrB1L5IkaCNk+upg53fPF8=;
 b=lewDeQBxs+7wkxgdESqYdqoIasRavvn1T3rmZ1CnfHCCuvKEfck5dpUIzOiOXp9XL0wPc0ktQMVP4IKdLcIpJjIdz247l0L5MhS654pZAFEkDH0dfG5dg8xISR4T4o6K5Ilqgu/ar9/hDib6PPlWYcZ2oudciBLqw1vF89tdVOM0UzkqFh11/fDmnEhcAbtLzBHdFtzulgxcLK+Jv4H32Nucx/YmAY7h68bl2usUJyxRfuM9VQ1RiQmiXZU7PkSNYkv07fdILTz+QVXQrVJ42VwEPmI991M41V3H2xQ20tWuXxjxYhnWc3U2qP3wgIPGxRgh97mDg9U7371+NyY2eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMStaKi+HVRNtScSYmMDaMrB1L5IkaCNk+upg53fPF8=;
 b=BzvMO+psgF7SKRmIrZUgRIuzINCYjvob25BC/GZUfSbgm0TPC4NmogffJOqz0/8FMY6KKdM+XkbbCBfAlK/v/Dk7+MyKy4Ueq9tb/rWnSzpVqkbrf0zE7kHXmLokeGdkfyvLTbtTicqroY37v7puhOFQ7xhnDFgfpSoF9svyGFM=
Received: from MW4PR03CA0173.namprd03.prod.outlook.com (2603:10b6:303:8d::28)
 by PH8PR12MB6986.namprd12.prod.outlook.com (2603:10b6:510:1bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 04:46:08 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::bf) by MW4PR03CA0173.outlook.office365.com
 (2603:10b6:303:8d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Fri,
 20 Dec 2024 04:46:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:46:07 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:46:05 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 38/45] drm/amd/display: Swap matrix and multiplier
Date: Thu, 19 Dec 2024 21:33:44 -0700
Message-ID: <20241220043410.416867-39-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|PH8PR12MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 645fd476-70e8-4430-a85d-08dd20b137c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qDkxL3wbdci/2pDCPsJXs1ZVQVEQuiaUnM26ohhNyHbDGI5my4/EtWrmm80K?=
 =?us-ascii?Q?Rme0R7SGkxeVvQ/1Vi0app/z3x7TK4oOqvPcryQ3geMKHTwBm1diePCp0InE?=
 =?us-ascii?Q?tGULjGykY3dKe8ZDjoqBz4gALhDk4tTrz55QX0AhM9RXuN6mSrOv0j2IOWNf?=
 =?us-ascii?Q?x4B5p+oYyFRaW7S1Jp0sG3lOecAIjnQa8htpmMUPjPxaUG1v3I0kvkJtTQ04?=
 =?us-ascii?Q?zAUbJlIy4fikoFC3L37qJHrnwtAiUDdjkmfjcEa+wKqjFnewz3GMv+QatQ05?=
 =?us-ascii?Q?1lHyS2UgOgE36J4GSe1IceXKdQCeRAx49Wo2JYoIAjULNeYTNo2VDNgA4IZo?=
 =?us-ascii?Q?3zPfIrSZvDn7zBvYyVPrsAZN4OwC1RT98dr/f2rjnAW0BkGY3Ar7wxBHxYHw?=
 =?us-ascii?Q?mi+1gtW2HAayT5DMBcrj0EgMvpTU/sK9p9N31VHCTeTtNFeQ3Bu19zRJ1D0F?=
 =?us-ascii?Q?l2lZNBl23hqvNxrKHwYWsI0MYkFKQF0fYDQoP69tc7rXthv+3p3McjHgEhoc?=
 =?us-ascii?Q?jwPTfQXSbuRan5U+1CFh9Qs8FCWwa/CeICeFvOwjUOQ+8f/SGpN8F4TN1Slw?=
 =?us-ascii?Q?Q0KAUqdZFnnnpdoDThB0f9CkBxAILX4RgJdE8cPWeMFvRnC77af+Rl0fi9yp?=
 =?us-ascii?Q?qYM1sf/GTnbzhq/vUdQ3EFXsooBkMh2i4yArOJa6708pXL2DM9DruyKi06nC?=
 =?us-ascii?Q?46T0Xa81cSB5P5BHgp+cJYpPgy2lH88koAL1iyZkelNn8C0ArM6ZfdxWA1bp?=
 =?us-ascii?Q?7sUl6WLj9DgyxDwYtioY5LcaU23v+o+aUtvgwiszk02JyKDpFHasCUElMq/f?=
 =?us-ascii?Q?QMLEeBdPcqsgnqIz7AEF7paOYocqhFn/39bxOHBaTNJS1E1e7XTKLeE0Uf7M?=
 =?us-ascii?Q?2ZsHxkQHYE9vZzRPtB9ZBf7/e2YCWny5MslID7Y4SYVH1uXJb0Pia6VmvcRA?=
 =?us-ascii?Q?G63mmoAKIfwlK4vfmG1tkWmV9M9X/Y3RTUTUp8GpzDu0G2/lvhbJNfOdhtEC?=
 =?us-ascii?Q?ewRxkSfIyQMX7rJ98eDa312FZUTZal099akP/zMGK1TZ/pYTNhETZM+HOcek?=
 =?us-ascii?Q?hwrUZjZyA/l7X1bWc77FyxuDg/iHbs1ayS4sd6t7DRPbanpWjlHc2blq0As5?=
 =?us-ascii?Q?uomtuImFWMuAv1fble9lpmHndKDnay3QISMEiVRuV157lPRKxdecUWwcEXMi?=
 =?us-ascii?Q?/VBacDoc09SbXVWYowDnUhcEAvaqmRkzm6ujepUb3q6GWRZlkla7sFh6iQJw?=
 =?us-ascii?Q?By2pHl6PM5d6ZyJVeimvN4vUYBEz/oucsPuOsqLIsLt1j1TlcxCY817RY96c?=
 =?us-ascii?Q?FyJE5HB3ETW/DVIhPtB8AiunngP0zXw1SUEUhs0TyKtaf7TClt+5ff0CxnQg?=
 =?us-ascii?Q?j8nTcOVULTeNTjXEb+jCS/StWYyxu5Mlwph4/YZHGAHC50iSuM8d2kRSV5j5?=
 =?us-ascii?Q?/LLL3gFc+TWaxRFVwLPPGa9m2z4pQnys74e4phEZy/1bi3SGkPd/o1xQ1hV9?=
 =?us-ascii?Q?k9ueub55xCorh4s=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:46:07.2047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 645fd476-70e8-4430-a85d-08dd20b137c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6986
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
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  | 12 ++++++------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c    |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index edf05290d441..54ec12c1352f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1477,25 +1477,25 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index 33156531d751..d0777691862b 100644
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
 
-	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_colorop_mult_init(dev, ops[i], plane);
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
 
-	ret = drm_colorop_mult_init(dev, ops[i], plane);
+	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
 	if (ret)
 		goto cleanup;
 
-- 
2.43.0

