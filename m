Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9719768EA59
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 10:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB6410E0AD;
	Wed,  8 Feb 2023 09:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1091F10E6E1;
 Wed,  8 Feb 2023 09:02:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUTb7gNz7vemeyIo0mtLFGmozn0IY5jcPldR+fg/5Okkvk2wtsFd0x5FJSHKKJDMBnEe3P3qw+nZYper6rLlu6xjxtmTMjJC7j+BeAiqHSIG8hYXhOmSEwx9rpVFsvfUSu/eul4unrx2tAhytR22r6u9EMQArwkc5nQlX3sLtyQUR7awp1Jo9aM6tflz0ooHwEsk0EVKT88Iryx+uWLuuscC0zvftbvvSt38SVGM1dbUCfoo4/1D+81mmlAjQHkc8flzjOn4fLcmfo89T6tGe0VEptCL+tlTusTSyHoRR1+7FPYzaRNYkoauCibP4UUxq7vpmiB1m5GuhpTzKn5mpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvSz4nNJj0ftQTyDv0JhIyYioyL8Dm2ndD5DHlDVh+o=;
 b=AlfntoYhxqllBWmvHpCKAaMhNHKdRd0JSh2oXntk76M8Kq/cf5cS343wV67/Rdc7PI9KPPBM5rORz6w32ZEtnSJqoGc2Y/zdCXMG2gzvT28bGRfIHs8rIdXbr5Hq+kcQaoYyLCSb7LqVCZDGjjpFIfBdJwvoiy0hZTDIzJh8pR/k6NVZ4qcMYi7fK5JpW0O0s+zQb0y547fRIX8/0nJZ+bB37/4fHOhuDCoz6lqI/DCiDskiibF3IfJC/tDHNc5d3Ip4krJ14ibEKfjTfriGDlhvJgcDDudZMYXawTwIeb/y3FHT2fRXEUcuwzFUJqtVyGlwsmqWD1MTa6UqK4Vd8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvSz4nNJj0ftQTyDv0JhIyYioyL8Dm2ndD5DHlDVh+o=;
 b=q8LAxonsx/4WuzzQKQIdqCtzRthK30eKM4XvDXsjS61RbUTEY8GpWcR2kuPNrTtEtpw0yKDSZIDSwnoDmGY61aQ96WSu+sI68eJKUqYk4QGEMEb26NVus19yl6091ePMD/ZUba80tP1NyPV/o7f92P1gPVuTvyTsk7p3EpaxZJo=
Received: from BN0PR03CA0038.namprd03.prod.outlook.com (2603:10b6:408:e7::13)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 09:02:00 +0000
Received: from BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::61) by BN0PR03CA0038.outlook.office365.com
 (2603:10b6:408:e7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Wed, 8 Feb 2023 09:01:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT091.mail.protection.outlook.com (10.13.176.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 09:01:59 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 8 Feb 2023 03:01:56 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-graphics-maintainer@vmware.com>
Subject: [PATCH 2/6] drm/amdgpu: Remove TTM resource->start visible VRAM
 condition
Date: Wed, 8 Feb 2023 14:31:02 +0530
Message-ID: <20230208090106.9659-2-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230208090106.9659-1-Amaranath.Somalapuram@amd.com>
References: <20230208090106.9659-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT091:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 606405e4-79bc-4b1e-e45b-08db09b32349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eNbC0fyl3NC5vvKEgx/vPh0N88x+ie4HMy1meQRutiA0KPH4MU9Qqfm0b/nOzb8s85WzVwOiIO+i4VM/ssJjNFQxO8ieUB3mrXU5SGGinoOz5hXvSXFrskSiF42aDWu3WOkqKs7KAyrmSeSuP0V7mMZ4SSunrAgQeS7Ew/vglInl062Mn4bRcxRKZRgPR1zNXadSrjlYuzSjcacvlrHyhHBh/7Aqn4ScJrJyPBPxDfPfw+UKJ1HzIgFiWmEy1JYRBxfHy9djACE/b0rQeYdsfkLXyJE1NHYhIJeduo3P0jqSCmzIYte+ar2QGCBpbFxbQitBUuvQJGrlSC9PiVIQcI6WPMwgE3LgMoPdKh1WowoIq0lU9jWMNLkqTdjfWnWQHrG35eJ1jSR6hd/ilp4vhAGSO97H2IQ4JqnWYeOA75UdeioHGaq0k4LqJoE2o6JbB5+S5Hj0QHWn1g8+we77to0QekJ6Lwe1kLakmFjfisx0DEZbhYIuAt0E+qm+HyMT1h8HwTbqWv1eRv0IXygtl4JiZg7vukBKSc1RXRIv0ya0Su47KvBP69MoR80hn7E+gObqDexv6ed7RFHWKowBYCtWuh0AmHXXvmbCqr3UB4PaO7KcirMaxzOZaDziaVOfrcPxTtwpQ7EjR2onrkT4/I3nC/Plq8x3P1cV7mybuRIipoAFq21QhRcbF2FfJ0wje3naB/Qv0LyzRjEdU/l7bjvD0QCihhTv0vKtIUO1ieM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199018)(36840700001)(46966006)(40470700004)(40480700001)(5660300002)(8936002)(2906002)(36756003)(41300700001)(186003)(8676002)(4326008)(16526019)(40460700003)(336012)(478600001)(426003)(47076005)(1076003)(26005)(2616005)(6666004)(54906003)(110136005)(83380400001)(316002)(70206006)(70586007)(86362001)(356005)(82310400005)(7696005)(82740400003)(36860700001)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:01:59.8429 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 606405e4-79bc-4b1e-e45b-08db09b32349
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005
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
Cc: shashank.sharma@amd.com, arunpravin.paneerselvam@amd.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, arvind.yadav@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use amdgpu_bo_in_cpu_visible_vram() instead.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 981010de0a28..d835ee2131d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -600,7 +600,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 
 	if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM &&
-	    bo->tbo.resource->start < adev->gmc.visible_vram_size >> PAGE_SHIFT)
+	    amdgpu_bo_in_cpu_visible_vram(bo))
 		amdgpu_cs_report_moved_bytes(adev, ctx.bytes_moved,
 					     ctx.bytes_moved);
 	else
@@ -1346,7 +1346,6 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct ttm_operation_ctx ctx = { false, false };
 	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
-	unsigned long offset;
 	int r;
 
 	/* Remember that this BO was accessed by the CPU */
@@ -1355,8 +1354,7 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 	if (bo->resource->mem_type != TTM_PL_VRAM)
 		return 0;
 
-	offset = bo->resource->start << PAGE_SHIFT;
-	if ((offset + bo->base.size) <= adev->gmc.visible_vram_size)
+	if (amdgpu_bo_in_cpu_visible_vram(abo))
 		return 0;
 
 	/* Can't move a pinned BO to visible VRAM */
@@ -1378,10 +1376,9 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 	else if (unlikely(r))
 		return VM_FAULT_SIGBUS;
 
-	offset = bo->resource->start << PAGE_SHIFT;
 	/* this should never happen */
 	if (bo->resource->mem_type == TTM_PL_VRAM &&
-	    (offset + bo->base.size) > adev->gmc.visible_vram_size)
+	    amdgpu_bo_in_cpu_visible_vram(abo))
 		return VM_FAULT_SIGBUS;
 
 	ttm_bo_move_to_lru_tail_unlocked(bo);
-- 
2.32.0

