Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C311C842A50
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 18:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A193B10F950;
	Tue, 30 Jan 2024 17:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F61010F93B;
 Tue, 30 Jan 2024 17:02:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zcl6ifCPTzGAlHYbsbwWo6nZ2RnGyBqA+uFPC7MCY9ztpYaY+DwQn/FM9SxP87i2t5oskMIC2leksw8EnJ7Jaj2M8C05j7VbaTxgpCX/MNunesJh3QBf5QkB3prD7VAe/dndvULTA2R6mqGM9hAwEKD2iW3qC3CGA0OzeBl44q+rVdRAHE3J8lw74THHz1BCPt/dtey10WZ4ZHrnlVOQeVTV3zSb1fXE1MVZY1KE5CzRjxtr5zVUK5AGzXj+FCzB2yyKv+ajirC2oraFC7NaJaksqP0ugZhabL6dQfgy2gHI6fe4DpJ8ipJd5aqIdfe6tw455i/J60RC66ifIMWYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YVKnoGgKkZc7MoAGUDW0o4DHwsUZtPtNerq3Jcp78A=;
 b=YAc673CWlLBI1ZxwQTcFtpzmphV2rsCK9ZSF2IYSsx+1hMmyJXZ7TSrAvQOyTyoFbY9724C9FRMSh3/xcyS5OSZQcCmavZDO1AGtCWck72lI8B15j8nKXMbhb9FOaofR/zb9MMYvDMI8jO4pXW6u/HSrZyIU6T89dcJylgeKYGZbyiuXNXRBXrzSjQYMqzGQS24GOY0AUpiPezhxNid3Qc3vAzsbWk/93APpd85z/oqNOSBo4BK/40A991dGsB37T4rZBAHDUQaXRiAduGTWBR6mHttIoKK5ajX81WHQDmayjRgRse0pyFW82zmDxwQGcKkgIFQm7sUPlqW6XzXhVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YVKnoGgKkZc7MoAGUDW0o4DHwsUZtPtNerq3Jcp78A=;
 b=F6bF8ToX9gJuEx+FFermQkwV7FEMZa4CHsED2QK5CjRKEsKKCxWhzgK0L6OGUSdZ5Q2yDmQjsr09Vdt2b9dNiM47bUnwbF5F9yIZyGoeFYg8qjCg9d6G/WOv8Spm/oOJ79GbMmFtdAS4X6ARbelrffOdiO+3X/X0MwzBaNI7qrY=
Received: from CH0PR03CA0341.namprd03.prod.outlook.com (2603:10b6:610:11a::18)
 by PH8PR12MB7026.namprd12.prod.outlook.com (2603:10b6:510:1bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 16:13:29 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::9f) by CH0PR03CA0341.outlook.office365.com
 (2603:10b6:610:11a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Tue, 30 Jan 2024 16:13:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 16:13:28 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 10:13:27 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <tvrtko.ursulin@linux.intel.com>, <daniel@ffwll.ch>
Subject: [PATCH 4/6] drm/amdgpu: add shared fdinfo stats
Date: Tue, 30 Jan 2024 11:12:33 -0500
Message-ID: <20240130161235.3237122-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240130161235.3237122-1-alexander.deucher@amd.com>
References: <20240130161235.3237122-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|PH8PR12MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1c6115-8f35-488e-a31c-08dc21ae656d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hUy3lR+Pw8fRWPkS+jFYlGVEnqkLUWc+rZ0Q94fwjqbv96l/JzxhTldVSork7sRcRp6d+jlm6UJkIaMgrQvDZC+oXX0cK42X42bszcQw+Ze5AoLv4dfRSImK4Js1Hcmfddgjq3U0vBmcSCDBkyC7muMomKQYLgdCK48W80g1VrVex3O/5hErXxc74rhBB52w7Qt1KI+HobUq4sFQrfI5ZpUAZ+dHeFLwySIXo/IctwuAm+MxA3lnp+3m+wwRtm+G+jOxWK9ZtE0YVwdCtjdCRcrI5h/b5TBbd0SWm0QRdSaneY5KRY+rgYv1Izg5FDWES8XKyo3Y675ciy77dWj+pnBgq7NPzY6ZHAA2jqpUf/91WCMlwx+bsNzhU9Dwrl8j+pDaptSaiFC/IfFCOWfDVK0/IwVPGQOEC2JSuofAAUrY+yOymMVlOzIaPBFoZIgYL6OWBdZQl+lGr5cHxNElvsgONZVfpVXSP3GHtHT48HlEAJl8sTylIpyWnEi0+UBzqDe6vFaa7ywBdZ9+8Ilsed+vIy7hfCWM6YgD2digZo9zFfbofuc6hxdIger10UL7gln4U0oypu1NzRK5r87mspYKrqOKYEKuRP/n0ubJvQb1F2g17kJki+Zd2vOfOxvxWcJj345OLxzdA5zCMmkOt4vMCeX8IAD4qWUn9HS4rcay4P3kgqrOzueCB+nmUgtgVoxURjj0gtLp+FYcdAcohT4q2ZjdRcQF5hq+O86ncEmN+9o2ubLCveyM/lm8VCy/
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(451199024)(186009)(82310400011)(64100799003)(1800799012)(40470700004)(46966006)(36840700001)(47076005)(70586007)(70206006)(6666004)(336012)(40480700001)(40460700003)(1076003)(110136005)(426003)(316002)(54906003)(86362001)(81166007)(4326008)(8936002)(356005)(8676002)(36860700001)(478600001)(7696005)(2616005)(16526019)(26005)(83380400001)(966005)(82740400003)(36756003)(2906002)(5660300002)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 16:13:28.8696 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1c6115-8f35-488e-a31c-08dc21ae656d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7026
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add shared stats.  Useful for seeing shared memory.

v2: take dma-buf into account as well
v3: use the new gem helper

Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index 5706b282a0c7..c7df7fa3459f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -97,6 +97,10 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 		   stats.requested_visible_vram/1024UL);
 	drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
 		   stats.requested_gtt/1024UL);
+	drm_printf(p, "drm-shared-vram:\t%llu KiB\n", stats.vram_shared/1024UL);
+	drm_printf(p, "drm-shared-gtt:\t%llu KiB\n", stats.gtt_shared/1024UL);
+	drm_printf(p, "drm-shared-cpu:\t%llu KiB\n", stats.cpu_shared/1024UL);
+
 	for (hw_ip = 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
 		if (!usage[hw_ip])
 			continue;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 425cebcc5cbf..e6f69fce539b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1276,25 +1276,36 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
 			  struct amdgpu_mem_stats *stats)
 {
 	uint64_t size = amdgpu_bo_size(bo);
+	struct drm_gem_object *obj;
 	unsigned int domain;
+	bool shared;
 
 	/* Abort if the BO doesn't currently have a backing store */
 	if (!bo->tbo.resource)
 		return;
 
+	obj = &bo->tbo.base;
+	shared = drm_gem_object_is_shared_for_memory_stats(obj);
+
 	domain = amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type);
 	switch (domain) {
 	case AMDGPU_GEM_DOMAIN_VRAM:
 		stats->vram += size;
 		if (amdgpu_bo_in_cpu_visible_vram(bo))
 			stats->visible_vram += size;
+		if (shared)
+			stats->vram_shared += size;
 		break;
 	case AMDGPU_GEM_DOMAIN_GTT:
 		stats->gtt += size;
+		if (shared)
+			stats->gtt_shared += size;
 		break;
 	case AMDGPU_GEM_DOMAIN_CPU:
 	default:
 		stats->cpu += size;
+		if (shared)
+			stats->cpu_shared += size;
 		break;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index a3ea8a82db23..be679c42b0b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -138,12 +138,18 @@ struct amdgpu_bo_vm {
 struct amdgpu_mem_stats {
 	/* current VRAM usage, includes visible VRAM */
 	uint64_t vram;
+	/* current shared VRAM usage, includes visible VRAM */
+	uint64_t vram_shared;
 	/* current visible VRAM usage */
 	uint64_t visible_vram;
 	/* current GTT usage */
 	uint64_t gtt;
+	/* current shared GTT usage */
+	uint64_t gtt_shared;
 	/* current system memory usage */
 	uint64_t cpu;
+	/* current shared system memory usage */
+	uint64_t cpu_shared;
 	/* sum of evicted buffers, includes visible VRAM */
 	uint64_t evicted_vram;
 	/* sum of evicted buffers due to CPU access */
-- 
2.42.0

