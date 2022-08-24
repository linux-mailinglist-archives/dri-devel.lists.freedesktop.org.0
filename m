Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11CF59FD26
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 16:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45B6B6938;
	Wed, 24 Aug 2022 14:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F977B68A7;
 Wed, 24 Aug 2022 14:24:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecolYOScpO1RXKu3JIl56ydDh1l6anEDrsTPC3vrCkHgdiHTvLJhnWi2XCW/889guxpimpwJfEf+RiOZqOduBFxJTN2Fmej7slznMtMW6iuROQNroc82uoz82uTWYr4DS1zzuRCaINuFS/UBSuW4S8lLlwQl7zuyibmZLK2blHdads2e1zza254pk+MvisCuX9XkSOTIem+AGj9KSBJhMZvLh+cp1PdeY12x5e/xzcBkS9d2dyARm2LqOkh5KPlpI+sdla1/cgUJYKlCW4X4BXEDpbLO8A4b/AjaFD1rTTWn5CAhWNVDCgpdCfd2znlPQez74ncs4eZjrWEQr8h1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePLB8LFdcU3joNoyRNCrwH4jN2kRbFb4C/V9XNrJC9w=;
 b=GAsru2tqxkL0hcLpqtnsQtXyE2Gm0dWucATnHDZ9T7xtXLITtWSVEg2+DuopdrkgMMzXU7UGRslQNW2evOXI675CQSZn5jzkK/EAecZ1sHKl8M81GWxy2olII9W393PPo2WrIyPuQAgWkSTfkzQyl3FOGCkNA78RyLLGioIekyaaUXS4qPHUCHFpt677DkTqkV3O2cH4f40XkORKRBEmP0tWeRTLDmkq+KKF595pvIi2oFvtU1Bok2oy6eSi2fribXLYI+rt624Qhj8fYL90IgTKwSGNFHYeXPsDQLLJPae68F83VC0diI15k9gZpMtu3sbpmoQO4yV9bKOziQKKdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePLB8LFdcU3joNoyRNCrwH4jN2kRbFb4C/V9XNrJC9w=;
 b=RRQzkiqpXSpDmJq8EPilbWC/Cpb0ORfmYLXMmxsZymNrWEtUmx0qsPydJdxWO3U4RwFM1dZKgmSN73u9ilJSr12YW2ZuBriGPz3ioOvKyuEAAQwimP3dKNdbSBm4x9joAlgMviUfMa8c2rjRL8ZJbZi2270VfExI3DO2nhEFKQs=
Received: from BN9P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::29)
 by DM5PR12MB1530.namprd12.prod.outlook.com (2603:10b6:4:4::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.18; Wed, 24 Aug 2022 14:24:11 +0000
Received: from BN8NAM11FT072.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::86) by BN9P221CA0030.outlook.office365.com
 (2603:10b6:408:10a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.24 via Frontend
 Transport; Wed, 24 Aug 2022 14:24:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT072.mail.protection.outlook.com (10.13.176.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Wed, 24 Aug 2022 14:24:11 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 24 Aug
 2022 09:24:06 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: <dri-devel@lists.freedesktop.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/ttm: stop allocating dummy resources during BO
 creation
Date: Wed, 24 Aug 2022 10:23:52 -0400
Message-ID: <20220824142353.10293-2-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.36.1.74.g277cf0bc36
In-Reply-To: <20220824142353.10293-1-luben.tuikov@amd.com>
References: <20220824142353.10293-1-luben.tuikov@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9fbe726-9042-4a03-fe9b-08da85dc503b
X-MS-TrafficTypeDiagnostic: DM5PR12MB1530:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q8gOYlGs6soHyWcV/sb7SZW0aNzaLy9QwParfmWZAMBSTmr1h64gHEMgJrlnwXkquuKs97914Eb4qctHjbxzEEKoOPRj+3c+lJmLh73kGpIukHGMFeclQHeBZpx7g7npMDd7So74eVN9jr9ewUJiz79Lm66WfWYB9KF2Nhm9FRQ+EobzwDJdyERB/MuJIEGvPmzoNvywdQ5J4gHwkZ7VWTyRF/qR4md2WuFcfqNzJaxyAPXeschH3VVUfgYwxWv2ticpvKJiEL5btP/fTdq73sKKSKwJeKgtm1f6Wy8R1e+k5sSeKsvM6EBT4shy5xqzgj1o3R41x1MtU66FBaSxDlQ4yMLoRKlEv8R0TD0ymBjYOmZhatKk4+AjXMj4zA58V4XxWmysP1SiEBE/5LI/kAfPCAp1aojeTRuxovNFGx00M9CwbipMvCMKFKO69Id1JmU7sGAIAA3qYW9COOKFFaF+RNIrlVBgpJyjY/GbbnpUPBy162a1xVQYrs7aJu3QQkQWfW8DN+V2RyjR6gCIt8FELuXCOvFhpuJFkSPeSjgMRWsJ5fl3eCwbE/oi9WcE6LBnMsmkmG04+McQqCX7d9VkuMGLnKJIDhScjV7BPpCQ9oV4ZnFT6pEmOazpFgh3cW3H8E9GSEoFBM9pDGKcHVNWJrVEUGO6acED/bYtQV3hc4as+Uf9uR7dWsC90eQdqnCUqp/DyfXJ+g6bJGHhzNGXzLGw5Mg0+UKVm1mmuq+Mj7/3ZknEs1PVwYYRZOyFCeqjkTyhpCuLpir6HmpdKN3itUruHFIcEu86uHVAiY8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(40470700004)(36840700001)(46966006)(26005)(40480700001)(16526019)(2906002)(41300700001)(7696005)(36756003)(47076005)(6666004)(82740400003)(44832011)(70206006)(70586007)(4326008)(82310400005)(86362001)(8676002)(5660300002)(8936002)(110136005)(54906003)(316002)(478600001)(81166007)(356005)(40460700003)(1076003)(36860700001)(83380400001)(336012)(426003)(186003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 14:24:11.1129 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fbe726-9042-4a03-fe9b-08da85dc503b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT072.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1530
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
Cc: "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <christian.koenig@amd.com>

That should not be necessary any more when drivers should at least be
able to handle the move without a resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f066e8124c5058..d7ed891d388769 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -959,7 +959,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 			 struct sg_table *sg, struct dma_resv *resv,
 			 void (*destroy) (struct ttm_buffer_object *))
 {
-	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
 	int ret;
 
 	kref_init(&bo->kref);
@@ -977,12 +976,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 		bo->base.resv = &bo->base._resv;
 	atomic_inc(&ttm_glob.bo_count);
 
-	ret = ttm_resource_alloc(bo, &sys_mem, &bo->resource);
-	if (unlikely(ret)) {
-		ttm_bo_put(bo);
-		return ret;
-	}
-
 	/*
 	 * For ttm_bo_type_device buffers, allocate
 	 * address space from the device.
-- 
2.36.1.74.g277cf0bc36

