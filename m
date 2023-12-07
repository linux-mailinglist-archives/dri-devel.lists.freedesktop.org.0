Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB067808F51
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A687810E92C;
	Thu,  7 Dec 2023 18:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4FB10E20A;
 Thu,  7 Dec 2023 18:02:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiJ+bKctkpq/rRLR+twNAtti+8YcoaxvX6LeiWhw8PXN6O3LFHulAvjIIqYCO+90tPHZH9dmRZQl1RKRyNKwkuSQaRtpJr6nhpntVRPVMMih27hWReJtvZIOb/gZ+B8eGyEPwf8MjLoNV5DnEENAsFHbqzDsNSwB5ToXY6yuP6160//7b3H2eGhB/AvGM2ci7772rhM1ivQkMPwyHUXatSD04jppQlkEbhgzagxMyxrIY4pvlUFWNMGZXAhvTAx6SQUbb0bo8UPIlGnxdm44S+yWeI6xKvH6L03HBQSBDOEVs9Bl96dziiue/R1MLo+yCTwN00XuO7NQbsFFqxG3Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kj87g1VjJdRzosP+Z6gauk9gxv2SC0vGyYk4F2mwoPI=;
 b=hc4WS/uyn8dO/9HAxVy3it6Hq7FCCxKqoR8QEB6woyyyDq1N/Ywbf7Vv3IuJIaLMcRT9StYjoMa1A4rdYwRNCd4NeCcMBvtPrWRSDGGcgmznJiA7ZWcGsD5Cig3hrsJid87eC2hMfm8SiunjyNZxNjs+1is5x1Uxw96/7gkZrVXS7mlWWGmAuFqL60ucbAoXmY1myID5pX9kNN7FDJRsv/JCxX5o4ABtT/RRmYe8x/5uNSYcZIwY7mFFgVGCwV6LhHr4Wxx5V+AF6dY86tV4c3qIf6rw1ha2bY4VGzYO8qO5S7RQnizUuvUpZgw5TF1La0bnGdqPg4fzSg1Q8h9Kgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kj87g1VjJdRzosP+Z6gauk9gxv2SC0vGyYk4F2mwoPI=;
 b=vL4luwVZVVJWPJFJuguQogg1QZI6w5ETxViS6VMgo7uaGgDxaDA/YezYNqxthhYTr7Qx3wd/u0zB6nKvILhYkK+vx58pW961Xkytw2QFS0SMaERfBjClopwW8pIdaZyuRWeJxdjer4gzHJjedO1ldtKy7PdaJAKLP/avFvjqSiE=
Received: from CH0PR03CA0368.namprd03.prod.outlook.com (2603:10b6:610:119::17)
 by LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 18:02:42 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::b2) by CH0PR03CA0368.outlook.office365.com
 (2603:10b6:610:119::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25 via Frontend
 Transport; Thu, 7 Dec 2023 18:02:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Thu, 7 Dec 2023 18:02:42 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 7 Dec
 2023 12:02:40 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: add shared fdinfo stats
Date: Thu, 7 Dec 2023 13:02:25 -0500
Message-ID: <20231207180225.439482-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231207180225.439482-1-alexander.deucher@amd.com>
References: <20231207180225.439482-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|LV3PR12MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ad4958-764b-432f-5681-08dbf74eb554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 73UpvnBJQzCS7LC70EffgjiAGO2Bo2WQtC9TmLFV3Lpxr6h3k2Xh9Jq8oo6a6ARJXbycN+nv1fdAdxkKo29qgI70hWufmBL5KgF5sAHhiksuZQNz+bxMabxZ5eOZqSanjnqBiUJOJmPtEs5pZD6j1VNemmdgyKckZq94AJg19Rzojm1RqIDMJc2FSPa5QtsS3X63uh6aGyOEVMnem/Kiv32g3EQrzZbOC9PrpfzM796oCmim/Ijtz8HWwajHo7C4V17AdgJXqmnHbmqsq+K865+Eg4AOVG2Vyx1fK1vIaNPqglAQIYpt5JSzxygFahj4gKgEAD5yBogIDl//uStOPOtdBHiFcorsezRm0T5d9TjLonDfigzNQ3vbO/OjZMO9k68enOFr+kdghp17G0WHqmh+JhZnEw/3iJjzJ5uSOZCZhf4sONYkTKjYspCggT6v0hSRW2ls7r6zc4md6+Kq7ktsOtFcusbAvkTLSm0fkCS68NkbylEbhawO3gP2WSKUTSNHQ069F+yAUPYSQNHVscGcpCBo+hbcKbXRmIbTiK0rPoIB6zhjcCVgjWSWSljiQoB8KE1RiQ4n6EseqEgvUuY1qoOikyGSAtVgo5O+0ojKwqBuhmQ22CrGKK5lCyZFf5XeGYN208ABTlLUOasHa7bJk278Hjsrpan5pIJaEWdKsHP189LwovlW0wrPa5Lc0BWzKPzJlXHHCcQFxiUIpxoEUUbHrBT1lc3idUQqx6BbhclBLJtZpJ2eG/20V5Xf9hVkVa2fFw2mGGo9gkHLgA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(5660300002)(2906002)(41300700001)(36860700001)(70586007)(86362001)(54906003)(82740400003)(47076005)(26005)(70206006)(1076003)(426003)(356005)(110136005)(478600001)(81166007)(336012)(16526019)(2616005)(6666004)(7696005)(83380400001)(8936002)(8676002)(4326008)(316002)(36756003)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 18:02:42.3832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ad4958-764b-432f-5681-08dbf74eb554
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9412
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
index d79b4ca1ecfc..1b37d95475b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1287,25 +1287,36 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
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
+	shared = (obj->handle_count > 1) || obj->dma_buf;
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
index d28e21baef16..0503af75dc26 100644
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

