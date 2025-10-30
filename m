Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77854C1E45B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD4110E978;
	Thu, 30 Oct 2025 03:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CMQO+XOC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012061.outbound.protection.outlook.com [52.101.53.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E205310E978;
 Thu, 30 Oct 2025 03:51:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxRczzBC/Wx5QXX2XZBge+f30qu61rAKt3P2Z37nmxVT30XCbO2QHggjq8ZRctv2cUfztF8EU5tCJO12pn+keR7bobLLpSjZc8lmPUCIjtKBc4QxgZusFydm3hWHZxJNTtgDQZe9MAzSTMW4c2HZjsCI4Ct7ouFIpxTOYItucHeuKlnbACcU/FroFHaByUymEgHAKITWBU6h6P0Ls+jmL+aVb/VlBGX8v/0GHZN1HlWhzfpsq43bqWwPwNpur4I7RSac/vpLMzpyLxKeIiswoiwrGMyoVDb/Bp93M60lOAWpbsH47YQMha1//YaeW8gC04uVwHk7c+8n6f6HuE/8Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZU/wFT1mY057Pbn2oAXx4AvswRpp9suTFpkFVcVKag=;
 b=JnKsDSiRW+voPJXYw0tbYYopRTs7771xGgwU4NdSRb+JTuYjKApufctT0c7U7+TLhcggv1bqGT5zXmkYWckXEJqFoek/OesJMmE9HKLauAq/jbH5T5tb8uwdum5nv7OSSMXCTJMtKnxKuuVDZVtG9dWdQifD8NPpTpgZg0z2+0LVjvHxQUu300tCupwllLlBk5BRGRUvCUk9z9UTtwf4XCiLhjGZwpjqpa/iG1z9/gM3aRQtkTvqOoeypIYJyqe1CsKCIxZmDeCqWYnv666t/r22tmjyzf27WF+r0HYHnziFTJyEEviUhfRmrydcgzZbGNK3A2zTNhNyIKfXou+tGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZU/wFT1mY057Pbn2oAXx4AvswRpp9suTFpkFVcVKag=;
 b=CMQO+XOCTgXURnWRm5oEYxJi4OQsmHCBSfmjPfb4tjxMNiBeeVByHFn0xuzfocE2LlzhtmKifiPB7uJZLjtkMDOVJfij4WOf/hpvoXgdut+jqH7EMVUWUyd1Ebid9gtbr8sPQ7CaeobCX3foHuQx5RRXMVAvbm/bWSEbj3m7J5Y=
Received: from MN0PR05CA0022.namprd05.prod.outlook.com (2603:10b6:208:52c::22)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 03:51:00 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::7c) by MN0PR05CA0022.outlook.office365.com
 (2603:10b6:208:52c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.4 via Frontend Transport; Thu,
 30 Oct 2025 03:50:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:50:59 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:50:56 -0700
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
Subject: [PATCH V12 25/49] drm/amd/display: Skip color pipeline initialization
 for cursor plane
Date: Wed, 29 Oct 2025 21:42:30 -0600
Message-ID: <20251030034349.2309829-26-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|SA0PR12MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4c812d-4950-43ed-3737-08de17678a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sbmXfNQSMXbNdA7OF/2GHRU8WDjSYmgrQ2OV/pbJiV6ZVn49ISA5+hRCrgDS?=
 =?us-ascii?Q?Zz4Cdg9cdCEVaJsRMLzIe9jniuoqYIk+D87N/a4R6KQ2GlTp8F5VUGaYkIze?=
 =?us-ascii?Q?mKi7CMW8D4KYPt5/HNtsKh4uOYF6pbT2ygVxY0mlPkwoGHFY8h2FbJld0stM?=
 =?us-ascii?Q?nVvQMgHvr9Y16sIPPWavZgE6r0Xaqv9dDYQk30dne3COQL5Xq4s0k/K0jC/h?=
 =?us-ascii?Q?zxf/apdCG72qvGQ/nfBvHSab+o9uwRZWoyjsllMKB9+zHVikJBrmUPqKRPba?=
 =?us-ascii?Q?EjEocvkSriU/Cibidl7nC3Fct2G3tLYZO76cCPjuDayXpJU93DE92377hDLW?=
 =?us-ascii?Q?ORJZSbnyP3YoqMXbffLpqr6ZLtiavJufA1d3C1n9sxvxfI6Jo5WuCBw+c/U1?=
 =?us-ascii?Q?07hYMvN7RuCR5ghg10hqJFs6bVHibpi9kZuIWjaD2bkQdl+3NyqtYBVNCkc0?=
 =?us-ascii?Q?XVeTaYbnBo+oIUUUicaXxx5Yk/byNF9ODdCKbXeMAm/z1Kg8PcrE6aGm8U5p?=
 =?us-ascii?Q?5z9q7dJQhGGZniVUqmtYIOjY9t6Y/6dhmY8iuh5UeajgtUgqIEGaszbSG4YX?=
 =?us-ascii?Q?e6Nyebl9vdoEg3an0KSRsodqYKnf+ZzBvEDYMflGKJleWWsHyAh59YOcTiIY?=
 =?us-ascii?Q?a79dTDNg3XVHBp4mWraGIeQgNq9j/6qgRzHlbjJQNzKA7ACiruW3LdBGTWfe?=
 =?us-ascii?Q?5LyTKuq6Rn2iRtDFs4tTlBgIWqz6ROeokIkwIFU93Mztip4RducyP0Ts5U2a?=
 =?us-ascii?Q?NZbDz1EySA+fNmSqquy9M2mHvvGLL0LI3hFaugMWSX0Sl/s9UYqtG4byN3YY?=
 =?us-ascii?Q?r9bHbKFb0vZlFI0JcA5WbN/XYYvo8ISZV2nvFjOSq/dHKKj9nQlX7SaBqMCS?=
 =?us-ascii?Q?PAkJ8hxL0BBAMkpCSNG6gNyB/SXFyu2GOGU6HjDXv16h6wTfLdWyIYTPIR5j?=
 =?us-ascii?Q?JMb8G0SCpsZknZIvVp5NJmZM7KrH9S6VZHHXsoXy/NoMzOYRtbqw9wv9Abeh?=
 =?us-ascii?Q?oD1DiQ2g5ekr8AK5GwAT7Fh2mzK7IJtx8EZ9UGTBeSICgeBfNzrmDPxxnVDd?=
 =?us-ascii?Q?WBUGCVm+U8wR8Ud9rbb3UXk7dT5IFOzivTom4/d+Vt27P553YWqH/Ebs7zCL?=
 =?us-ascii?Q?z6Zxj3ppFpg89Axfr5gxZQh1QvTySchYcn38nx15zUCYDn50ZJS3wEzA0zmZ?=
 =?us-ascii?Q?3/IMcLzt/gS7A7U+/ZSMAfhvC71g2llXGblCXAWYh4TXBs4TZl/4BOtnUfhS?=
 =?us-ascii?Q?8Cp/Q4ZSV1hGPlDnJtJemzpIg/aOKr2kR6NYoKbp+FYJnqYyk1Wlsyf4QCSj?=
 =?us-ascii?Q?D11B7MUaEfjm4BOnmkUfe0+IfYMOEh8PpXduatBhBA2LPaEqlHo6pVQ6lW1t?=
 =?us-ascii?Q?iQukx3OMNlUg8knDbPbEHve+LEVVErzoL3+2dhftAA3R1B/i3qsbZqvrq3hU?=
 =?us-ascii?Q?3bCV/DtxNUnpRVk+Jv26mE3wUYdMU1dQ+NnpFIkxvieAww4RR/B59oqevlbG?=
 =?us-ascii?Q?I3ALJEPKG3HNu87TGmN15qLWNNHIWHUNzbsRNkVLFYcDw4V2wwoxzXDnD2os?=
 =?us-ascii?Q?S1oKqKBojGXHA2vJIY8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:50:59.9726 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4c812d-4950-43ed-3737-08de17678a29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
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

cursor plane does not need to have color pipeline.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v7:
 - Add a commit messages

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 877fd221c81a..f3efaf55e099 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1792,6 +1792,9 @@ dm_plane_init_colorops(struct drm_plane *plane)
 	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
 	int len = 0;
 
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return 0;
+
 	/* Create COLOR_PIPELINE property and attach */
 	drm_plane_create_color_pipeline_property(plane, pipelines, len);
 
-- 
2.43.0

