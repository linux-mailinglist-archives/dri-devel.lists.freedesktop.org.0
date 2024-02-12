Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C593D851F15
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 22:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E7B10E7B9;
	Mon, 12 Feb 2024 21:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TqYQGgTt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2085.outbound.protection.outlook.com [40.107.100.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D67F10E687;
 Mon, 12 Feb 2024 21:04:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eY/WjeKB+BAbLfimTFmhSJuciNevYosD9jtZL7jpm66m1gBRKHHx3DgDYrlyEoAnC12SchjA/uunl+vjVvmmmwVtXR/L7apNsD9vWSNCLFGJfWSDpA7jOV7emF+KKOCwUrYetb19hu7fVI9/E3ZQxBzrbrkELnAfrbU4S0yX+5w0a6GqmyiBnT0t4LgX6X5azeCwc5E6UCnDeIL29XkuBhbrKgLNdWUkMGKcszgM5KYYhZaNlhBhA/dmfhs+g7KOO5NDHxYFoxozl/l9+J1fqZzIRBHMjhUu6UDVYzmY3aZ0ZVnTT7Nn97KAiLGoegVL/uWHtDfSRCGZ7x84VMdKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YVKnoGgKkZc7MoAGUDW0o4DHwsUZtPtNerq3Jcp78A=;
 b=RJfecvkxrJIZ5qL65eKljUJQEViA2qNgKyPntYEKaCsYUjDzjWIQLRp76ioElIryTlHB1tmm18zY6Cssu7RFAgJZ7XMkTXUoI4iN9nId1PI/vzHCf7rV03z6qBX56pFURjQyStrkct30G4Quucn3VFfWV5rtZaSQe7U+QeNtYkmQrVqqq/as2iRojedzSpYUc8LzIKCRK8SYKq8u17TpEPd4t5r7ZpoPl13+a0rCfC2ltmSnH+0rjXMQVZIxN0aFl6pchzFmcZoqTy3hiIIP7r/tmA84pUo8wtI0Z2fYfpBhadF9mmrDG8LTdXHBImP7LxQU5cv2OSfkRp6dog7I4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YVKnoGgKkZc7MoAGUDW0o4DHwsUZtPtNerq3Jcp78A=;
 b=TqYQGgTt7tLHqIleFiLyPv82RqW7NKdRYzle3/zxYLWcQUe9Juwmq2HbHmP8C3yc2vOiyXvrS+Pbuzw5Jnpj0dmf017CxtZNoF0c/qN+RgHdLg0UTIOOgAg6PmxgU/qJgwbY4HJtuuEMAzAs9JdGWHDlRP2DoQ+mW1GYPx7ToKc=
Received: from CH0PR03CA0412.namprd03.prod.outlook.com (2603:10b6:610:11b::24)
 by DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Mon, 12 Feb
 2024 21:04:48 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::c) by CH0PR03CA0412.outlook.office365.com
 (2603:10b6:610:11b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Mon, 12 Feb 2024 21:04:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 21:04:47 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 12 Feb
 2024 15:04:46 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <tvrtko.ursulin@linux.intel.com>, <daniel@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>, Rob Clark <robdclark@gmail.com>
Subject: [PATCH 4/6] drm/amdgpu: add shared fdinfo stats
Date: Mon, 12 Feb 2024 16:04:26 -0500
Message-ID: <20240212210428.851952-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240212210428.851952-1-alexander.deucher@amd.com>
References: <20240212210428.851952-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|DM6PR12MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: c772eccb-29f3-497b-44b4-08dc2c0e3f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1jUbtLRDDDEgmI74g6yN2HDKD7pdyT/SEVfmmKIar2KbU3MYsiPCuaJU+6M579POHJCl2oQ/o9sV1Vc6ez5Iw5xXpWZRZo3qptwZxuJtGash8p2sjw8NAW/2i5rpQ1GUB3c84m+jEQ4rDrywQ7hY4RFJR96Y7VdDVBTz1ycn7h4rrxTYk+Mujsaa+DTK9gkx3fxClBXPGb54fLAnPbodhEvLHtGFeeDUa+g7Y/O7Gah4QhjUYbOBbBnEChv9l6n4ZmnsEwW1YlbcyUJ6yQ70XO7EIBYn5rhXtrV+LkBIcBvGkLTCKZUX4+hrGgJEy93+c7l6BGC0ICY2dNWGz6BOcDCjvCU5dyBoXgriuBQ55b8nRVNLxMmsf+zPywz7Vnhw9pukSKGV5RPM3+VadzFEF+vFBHCUvBiDRU/WWB08c91hP02KsyserAOmgeEdhK4z6QPr/9nzoXtITXesB+Non60iCnys9rGz7SxELpAPGpJWPOOV9RukaTX4DOTbd8mYnY14OOHiAR0Ibao8jpgcSiEntPAZSFypHsFnRFfQLCYgCjmq0TxbWm13qWIfT9SEPZSGiIhmPf2FN2Oy+8gvrQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(82310400011)(186009)(64100799003)(1800799012)(451199024)(40470700004)(36840700001)(46966006)(41300700001)(6666004)(356005)(81166007)(2616005)(336012)(426003)(70586007)(110136005)(70206006)(8676002)(316002)(4326008)(8936002)(2906002)(82740400003)(54906003)(5660300002)(36756003)(16526019)(1076003)(86362001)(478600001)(26005)(83380400001)(7696005)(966005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 21:04:47.7354 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c772eccb-29f3-497b-44b4-08dc2c0e3f01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4124
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

