Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB67E7E8B00
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 14:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13A210E096;
	Sat, 11 Nov 2023 13:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96CF10E096;
 Sat, 11 Nov 2023 13:09:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huwJ2YI9u7CJ4+5w8j48p1xlxwXtZ5WgL7VXhWKWbGik9/YwHvATNEUn+9o1+3K4s0Qv7O2K5fpPZlNW2m6h9tUf3ecW2MCXMZsPklFHo/yTcvQk9dNcyeGB1El2ihtrubw5IL3leTBtT9FEsKUcZUR+wAQZ3ptZE1oe953mmgFVd/5Mh3ibBd/oZL4L1n/mdCss5vsHoh/KAqZ44KE1jIBcTw19C7d/ifKSAXWGnum0TzOoUOHOmO/oAX56p3NNiMm6rBmIph0rvbFusIhtzWddB7kdCliWgLbzExNNLv5BaXO8RpXw3ALIk3eNe6pFmWQ1XfdraZd69+UCsFVLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jw0ZI9w2RA0SxqVW79HzdYs2b02dxXoOVmKROHr0gL8=;
 b=oDruirtSUn/r2gSVeK3BryXges7k0pLCpLZqVEA1OF/ebJbSq+TaVvkNdfZn3qpAPB2MpGqre1j9SechP/LM9YpArT6txiiJc0nrAgP5ApstBXuvsVSqJbaXeUS6hV4gRa0CIKt0ndMjhCnwNQJhXhUKJDOA9ldqf1uytypjy/igajwFgD2YOXZCHRoB8bFzRatgOOp2Fu1NwGzmP98ajnIrVp0UPVemetfF+LjEZVYHR3dUc2mfXiaE1XRQbA80EgPqykGxQPOQ7jU42NuzUwXYUU9kqaOztG4nakdFWua6Mgi9IoVesLAsMc9PiTOqv40ARogxUwDVIbotHz2BWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jw0ZI9w2RA0SxqVW79HzdYs2b02dxXoOVmKROHr0gL8=;
 b=Qv/SRIfLg51flfVQbQ6FPSoq51PH24KysE5oiT/fSpJ2khArOohIQiY8u5UjW+VnFW8eDwooJkeJ5yW3x8LErl3dJpw5AnBf4wGInK+ULZvHCtVDJQQ99705o0cIrpxq3YcoLUhmrUjzGzvGfo77aCdgmBu4xRySsQ2ArOa8XTw=
Received: from MN2PR12CA0024.namprd12.prod.outlook.com (2603:10b6:208:a8::37)
 by SA1PR12MB7270.namprd12.prod.outlook.com (2603:10b6:806:2b9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Sat, 11 Nov
 2023 13:09:15 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:a8:cafe::ee) by MN2PR12CA0024.outlook.office365.com
 (2603:10b6:208:a8::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.22 via Frontend
 Transport; Sat, 11 Nov 2023 13:09:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.13 via Frontend Transport; Sat, 11 Nov 2023 13:09:14 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Sat, 11 Nov
 2023 07:09:09 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v3] drm/ttm: Schedule delayed_delete worker closer
Date: Sat, 11 Nov 2023 08:08:56 -0500
Message-ID: <20231111130856.1168304-1-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|SA1PR12MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e5c679d-9ad4-4f7d-d861-08dbe2b76778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FORgHS31T2W7srPdkpLFNqpyxw5ayilTX682OQF2kC/s7loiAZqqwgkYESFatpqP485C9C4q0CfIWsr92M1niTa49b2c0BWTjaGibc3q4pgHfahgDKIpmTAzyxugJwscM2VSaH3uodhOG5YhsjKoKbPH9O4LPoB+K7E0L6XQ+LHGdpX1fE2TMiEjyxf6R2/O6A0jw46VSY3Q2kN0MpVfMbyzJT7THK4DabnYXzTvLNJHYFZrSSUapm4X8mJYeBgGREjduav51OZ0PiOSSdRvGx4Wea2FiNBd2Ip0490GFdvCKOWtvZnATO3pDoM3eX3otDLTObz9RXhOJACNq7SX9YCpsG3k3Gr2XuQ2diIax3IGQeh7rEZtG9GBa8tAIhvTyV2/PSNp8/0krbzO8dCscN8M1E78+xwMRsm4xqGj3/fQUGrUrY5uVkWXqxIdQbi0R/2ha4Zvkik0VAP9ogltXNDWTbt8dQRHUtPpPEWnZpaVIG8o8OSOSEMSS1t3usIg2tTZOiYoC6UisiOelJ4IIVGy5jvRQHzRfqxDnTkhj1+aMs82RUKQH7oSrW6I7pVrMxFy4Dqi48/zwrDiR54GtQ1PY9fGBAjfMh477R+yy86+aHOtI9zflv/JrAERGGDc9JaOmf6AdZ1LIVDPZYzaGnEA1k9QuxL/GfErlkjMdkVnOnos5xo2h7e1lcNlwYvU83raYfVr6FFUV4ghtJNoR18MUstUZP1h9rs7PLlIlw09s/jqmvaXg67Gm7BuJNg4ThYT9AMZ0zpPtQDkPdZ3gFmMexshrb9Er45P0LnQ0bNfUpNO/Rb8BPYljAZFq3HF
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230273577357003)(230173577357003)(230922051799003)(451199024)(186009)(64100799003)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(36860700001)(5660300002)(478600001)(40460700003)(7696005)(8676002)(82740400003)(44832011)(356005)(6916009)(41300700001)(86362001)(70586007)(8936002)(316002)(54906003)(70206006)(36756003)(2906002)(81166007)(4326008)(450100002)(2616005)(426003)(336012)(1076003)(26005)(16526019)(6666004)(83380400001)(47076005)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2023 13:09:14.5453 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5c679d-9ad4-4f7d-d861-08dbe2b76778
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7270
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
Cc: alexander.deucher@amd.com, Felix Kuehling <Felix.Kuehling@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Try to allocate system memory on the NUMA node the device is closest to
and try to run delayed_delete workers on a CPU of this node as well.

To optimize the memory clearing operation when a TTM BO gets freed by
the delayed_delete worker, scheduling it closer to a NUMA node where the
memory was initially allocated helps avoid the cases where the worker
gets randomly scheduled on the CPU cores that are across interconnect
boundaries such as xGMI, PCIe etc.

This change helps USWC GTT allocations on NUMA systems (dGPU) and AMD
APU platforms such as GFXIP9.4.3.

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
Changes in v3:
 * Use WQ_UNBOUND to address the warning reported by CI pipeline.

 drivers/gpu/drm/ttm/ttm_bo.c     | 8 +++++++-
 drivers/gpu/drm/ttm/ttm_device.c | 6 ++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 5757b9415e37..6f28a77a565b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -370,7 +370,13 @@ static void ttm_bo_release(struct kref *kref)
 			spin_unlock(&bo->bdev->lru_lock);
 
 			INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
-			queue_work(bdev->wq, &bo->delayed_delete);
+
+			/* Schedule the worker on the closest NUMA node. This
+			 * improves performance since system memory might be
+			 * cleared on free and that is best done on a CPU core
+			 * close to it.
+			 */
+			queue_work_node(bdev->pool.nid, bdev->wq, &bo->delayed_delete);
 			return;
 		}
 
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 43e27ab77f95..bc97e3dd40f0 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -204,7 +204,8 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
 	if (ret)
 		return ret;
 
-	bdev->wq = alloc_workqueue("ttm", WQ_MEM_RECLAIM | WQ_HIGHPRI, 16);
+	bdev->wq = alloc_workqueue("ttm",
+				   WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_UNBOUND, 16);
 	if (!bdev->wq) {
 		ttm_global_release();
 		return -ENOMEM;
@@ -213,7 +214,8 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
 	bdev->funcs = funcs;
 
 	ttm_sys_man_init(bdev);
-	ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc, use_dma32);
+
+	ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, use_dma32);
 
 	bdev->vma_manager = vma_manager;
 	spin_lock_init(&bdev->lru_lock);
-- 
2.34.1

