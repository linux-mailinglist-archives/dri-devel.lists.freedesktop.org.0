Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3F2B2778B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 06:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E436210EB61;
	Fri, 15 Aug 2025 04:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OekCq2ZS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2086.outbound.protection.outlook.com [40.107.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F35710EB6C;
 Fri, 15 Aug 2025 04:01:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQKY5IyqT8SEFMPX0FjG2ccUHFQSV9XBQ/uzEJsBNDdCU9kywvrR792f8A7mvtCy5icjUOMa0VgG+N+WV1wRqAenbYDxOIKQPAw8v9pZ4EYCfNO8J9aDTB8mt87cnRo+ZhBpVlRP5vbC9+iKHgw2MU5GAeC4gDbLRgT0TwjTQtokd+0T9P+BOImbp2Kg33bSbsIEf2Q+MYHYsUX/IiH1V+mMOA34xnWo1vIlhcRrdfW+dBzH4PBqafj6KWKF8z2ggIAr6nfNsK8FQaD8HvxFlpOyoLemuWaKTZnFODYT1uPPBBj2vA9q24oSAs0GkQjI9j58ktnVdH/u3N8PIqIyzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2mDWb2NuzFr+arDjTKzqGgWAsJfm3ewVGMfZxvMkIw=;
 b=TF87KTwtp0roKcxoISKPHhl5zZT9jBMmqNdF7baFRJo43VeDj8vnAzE15gTKUJ7wsh8w05LFOtW1oTdYGNcwxrZFq2S4TIUwfG0Wa3ylZ50B6XYDATvgFSkfW0WiW88tCNYAseYbkoVsXpYS3EMIodzQGMXPvv4LrGo4YZWFhNxvPTMgwGHD445/jZiixjNulCV6lwQ8cGnRRAYLigM4lr4aZ4H7Hn+i/cAzvIiWdIOnDiG51Ddwdl7n3+tU2Wbg+bQsoEjkLs6JFwSIQ5KQ5V9bZjdFx5DRhs0Eiq6AsNa3fPma+QLPd8Rd9lFbuCu5PhAMQOk8hgJKZAhMUyGwlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2mDWb2NuzFr+arDjTKzqGgWAsJfm3ewVGMfZxvMkIw=;
 b=OekCq2ZSf8+Wa3/wpPLVK+lEvlfiKgTVQYKO/bI2/PlV73TjObj4lfSwqABln2oZYZBfv1Me4UW7GbBp1VkW+LBFebyYg9HYY7Q/6oq1kzhGVh/LDNIgAgQ1vBfwphj2HX/o+Sdvis1Wf1DPQ+kAzTQWQ7AbUdOdsmW1Mzh43Vg=
Received: from BN0PR07CA0013.namprd07.prod.outlook.com (2603:10b6:408:141::19)
 by DM4PR12MB7744.namprd12.prod.outlook.com (2603:10b6:8:100::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 04:01:17 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::49) by BN0PR07CA0013.outlook.office365.com
 (2603:10b6:408:141::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:01:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:01:16 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:01:13 -0500
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
Subject: [PATCH V11 40/47] drm/amd/display: Swap matrix and multiplier
Date: Thu, 14 Aug 2025 21:50:29 -0600
Message-ID: <20250815035047.3319284-41-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|DM4PR12MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: cd1410bd-fd78-4a05-2a7d-08dddbb06268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1SJIN+b9WJyobNMtsUtIjpHcNA70PszqCNB/daZ6TVuyozDWpfLanyVhr59V?=
 =?us-ascii?Q?U+M989HKo/el8IFxiySQOrbqbKCvKx+AL5GsC8Nhq7VUFfrB4eO/rmyUNwPM?=
 =?us-ascii?Q?WfC8CCfr5mw/12huW3tdTOLX6ws43YwjKf7G1Hd0wAPfoy/aY/UNFBK+oMXN?=
 =?us-ascii?Q?hODpuaUG18Fnl8JuTtGSngsqDFyMiBRHd5dTLyAaIBCO+U9cuxR1KshzQ1ac?=
 =?us-ascii?Q?rtcCRW3evId5Ye/0gwp55onFz2wWxO7C2GVaw16TSbVwaqmo59PB9oazfxu+?=
 =?us-ascii?Q?NhRWsGyxQ2M97D5zqlF+/on5I4I6oTax/46d1bL+PPvMeaqJrUs0ZBgJL+Zx?=
 =?us-ascii?Q?C/JM5QHRTW/dkyX5bE/gxPFeFjNGCP0wxQEi/CinLjBG0tBSLyiiUGeyAR6z?=
 =?us-ascii?Q?uYyjEMcjpgveuFWlS1z6CWzpIoQOuQF7rdmnmVDteE9vo3cJAB7AOg0MxiPS?=
 =?us-ascii?Q?2c/zNHh6IFcB7FEmO6K6zp2iiGOhgrYP0KVkAGMqEmGb9SM4g6aTgCMIE4S2?=
 =?us-ascii?Q?kEPafQcmORcfA4X6nRtWLQkFqtXXEmQzB2ZI8eIOWp2vwdpjeuHgotm5hBQY?=
 =?us-ascii?Q?oehNYM+DKa/ipz6Gyup23acGQxrC14SNQdG1/UoPjbxOINpa2IPP56ILF9uo?=
 =?us-ascii?Q?wji0kHOrCfkKp7/dJtv49wMSHlSlR0dJwhtFHNr4I28E/27VA3d9tUzHaGnN?=
 =?us-ascii?Q?7nGnoSgzZuVMRO+Zpo76Dq7I4ilex5O8M6S+r1fFTFdrOl9nX0nQ9iTVavqn?=
 =?us-ascii?Q?GNGc1EvZxnkbFYrW5wsDJY9UxgbsfJdMyZDWE+dZT4mGjq1aSjP6V+wIqCtO?=
 =?us-ascii?Q?8s9kooWDb1r4pc0fPh9j3W/Hu3Cid9l0h/0PohfIXyvE/3OURl2qGMzsIIcP?=
 =?us-ascii?Q?9pOyEIyMY7QcG3jEpgppdQAPbgrmmq89aTpAHilSlDBX+moAFHxMkDAqKk/d?=
 =?us-ascii?Q?CZK2FsCJPIY1YjLvkWlkB/b5jZnD8xm0PI4E9iiqtrCTALZA6iEWYXIIRGag?=
 =?us-ascii?Q?v9U3ePW3ROm9IVYcYRBFUBlRgYK3ujcs9gqJypLwq7ggUaIM6OpdQ30lwAI/?=
 =?us-ascii?Q?kL82JiJhKcnv+ix5fflFFtl0eAyiQqJIw78x3xs7qcRDTwovdCE1F6NbdRM8?=
 =?us-ascii?Q?FGKHAzQL46lW9szu2xlCofCPBoIZGAI4v+pK+eP4jASUvlMbvSH3N+GN+ind?=
 =?us-ascii?Q?BSS2PZVdZzOZU8ydsGDHyyy9Pt0QbZaQeUbaKQ2+9gbgBrNBPw61FBClTmOJ?=
 =?us-ascii?Q?1PR5D59FYLFluHbONhuwRYmHK3GiROIVcFvpzEbb6vqfcMiQ1JSH1E+XIz8u?=
 =?us-ascii?Q?JlzbUFEPrDowUrvTUz7HsWgRY3b+63z9GoCiLxuUEtB1wzzQQncoOqilUeTM?=
 =?us-ascii?Q?vKNoL5RpJq2u3euHiEsRPKT/44TvHcMkjyczgUVlpNYBqg/lQ4c+7imrZbeG?=
 =?us-ascii?Q?ahbhKtFU6Pm/tCjKvdUffyqi0m1jcsXz2I3kDYLNZ6L9IYrlWNYE/s9hgQhQ?=
 =?us-ascii?Q?OlVpeRafqR5uNFTVkpf51aBZL88ibeUOLsxM?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:01:16.7765 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1410bd-fd78-4a05-2a7d-08dddbb06268
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7744
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
v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  | 12 ++++++------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c    |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index e28550e8994b..7d7df27535c8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1611,25 +1611,25 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index 888494d17509..934cbfca0168 100644
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

