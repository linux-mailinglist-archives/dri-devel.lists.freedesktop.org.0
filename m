Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 833A07E4960
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 20:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203EE10E678;
	Tue,  7 Nov 2023 19:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B7210E677;
 Tue,  7 Nov 2023 19:46:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9F98C3Ue+qU4UguMNx7PHQ5cAqurPWnziShB4oX35akT9r//t6BygY06f5FSWLjGQU5RM631ilxokaNBESiMct/O9rcFXRcMVo04yXVIArFeREpD2iEdZIgFBFEWZnXHix0HcSqM8eD42nR+tAFSC4++47pBduwofsaTV0Mi6e8u10plet1d8VDQIylIXcnxYl/JrVR3zjdDVjfVQt8e3ywbsV9OrNmDjPtZng6wNwurK7QtmgkCcbRAT79n6Z3uHTYC8miWBlClxpizf32Si0+q26GeXqJo+chad3v01PuJrKOPYfnM4GRkYL+3RgcMtwnzLY0HktHm8d4nhD/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1r1PVucqcx0QUGyoKMucUNHCEa3dMtKZnhBgywt1c2o=;
 b=Lnt2uc/cYXlbC6cYS+jfVkkeGkNtgYUoGjspgFDjF3czqFSyKnF/CT/iqao6V40N4hES1FbNH9hqBjuxLLZ3nGDogmkHMrVvnrg7uHNyM1n8yUxgqpDLW1J6uxWFPrNVFwpRch37h1sHnIGtC2aH1jGuBEStKHzGDgWXH/oopxhWnFRL9ASh5FMaizqKfpFy53C/fYyd974YZpFJeLvXsifT+GzyPafxxEx09e1mWpA0Zp6gum3Qbd0egVCoNiPXvHM4q+6dcNm7bwF5rs+zMIOlo2i176aeDOzw7I48Z6Ti/ne/+uQP92UGfrnUPKH4gXreqBnXFrfzE6DVzmLG/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1r1PVucqcx0QUGyoKMucUNHCEa3dMtKZnhBgywt1c2o=;
 b=QL4hrbbgUmJETkJpxRybKOjDQ+7dd45tdSUAsBq1YYBVuonP29HEFW20fR7HKOgDzsY+94rntv1nK6Ca5dHl4SRMlL85KRPv9eYxthG95B9ZULEsc1zWtrhL8Zhe7EbEYo3l8xoIR/AUbSipWfsZbTlKkmxVfETDC1UXLOGdrPU=
Received: from CY8P222CA0015.NAMP222.PROD.OUTLOOK.COM (2603:10b6:930:6b::25)
 by DM4PR12MB8572.namprd12.prod.outlook.com (2603:10b6:8:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 19:46:21 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:930:6b:cafe::c2) by CY8P222CA0015.outlook.office365.com
 (2603:10b6:930:6b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28 via Frontend
 Transport; Tue, 7 Nov 2023 19:46:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 19:46:21 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 7 Nov
 2023 13:46:16 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: Schedule delayed_delete worker closer
Date: Tue, 7 Nov 2023 14:45:54 -0500
Message-ID: <20231107194554.945018-1-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|DM4PR12MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: c61b91e8-eacf-4258-0974-08dbdfca3792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: llITVD1kZU9fvOrwQ3K5dqsBDDPHAuXzGpy5j9CAEY2FA+JWVg1oyzYtOvBMBOjdJFC1MqveHwzAAJsliLdj/DLP1rgrUD+/koFSSknEDpEJb99eRmhbMxvfcvKcyhklEVSE6ZFU3sVlmXRJSlA8gGUwR7Hrd6z60cF26EuCo/5WVpXMYdOi8xQGughZhcrd0Mh5eT7fbBx2BuKs8PagcECa0mqwQwpyShf/UfiZBlyQLHomoyzhKHot6YwMgKuIaSePxnGbRzCd8m7URdgtYgdJCbJC3H0wsGSfOGAAU5O/sbvyJ7ALTblm5dahdWqAkCp8mvYlcSLx9FZoIc8KZcFJQ1p1nuun16bDBSvpXcnPvELmzg0NaYsodJZkvWL1lxUBz9u/ldKbSqaZeNz9tZMEWOHMI428pt5bmyd9CuOz7CYdu/wiJUcl+al8VxleD/mxqB7nOAAcda8vkAufvUDI9ohRFag7Vd1XhoSTieLSlEDfKZe+oP94y1czuZU+uxLpCT6Wdc3rVLx7mBKWvRDlYvqQ2MAlJtVq93Ee4l4Xhe4dlyER7nO5a0/wXURBITx/xM31ycPSubBNJaFXIu/VarY5q7rmiMM6WTGGMhUU3HmloPVmBYCHbkz1iKperALpYxPFquVdFEXsh8ZHGxe6wq59TG1KsCTqSso0j6Ep3xUNFJUcOURN/Fm0VY6w/ydaHNcXc/sRlVPlAf3b7MH9TpjLdkCscKHGyPj7vF/uXbpwkJJO5m/scD8es7MZcokRGFLu/vI5bOJgAGGVuQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(47076005)(450100002)(8936002)(4326008)(40460700003)(8676002)(70206006)(316002)(70586007)(54906003)(6916009)(41300700001)(2906002)(86362001)(44832011)(5660300002)(426003)(81166007)(83380400001)(336012)(356005)(2616005)(16526019)(26005)(1076003)(82740400003)(36860700001)(40480700001)(36756003)(478600001)(7696005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 19:46:21.0668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c61b91e8-eacf-4258-0974-08dbdfca3792
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8572
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a TTM BO is getting freed, to optimize the clearing operation on
the workqueue, schedule it closer to a NUMA node where the memory was
allocated. This avoids the cases where the ttm_bo_delayed_delete gets
scheduled on the CPU cores that are across interconnect boundaries such
as xGMI, PCIe etc.

This change helps USWC GTT allocations on NUMA systems (dGPU) and AMD
APU platforms such as GFXIP9.4.3.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c     | 10 +++++++++-
 drivers/gpu/drm/ttm/ttm_device.c |  3 ++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 5757b9415e37..0d608441a112 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -370,7 +370,15 @@ static void ttm_bo_release(struct kref *kref)
 			spin_unlock(&bo->bdev->lru_lock);
 
 			INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
-			queue_work(bdev->wq, &bo->delayed_delete);
+			/* Schedule the worker on the closest NUMA node, if no
+			 * CPUs are available, this falls back to any CPU core
+			 * available system wide. This helps avoid the
+			 * bottleneck to clear memory in cases where the worker
+			 * is scheduled on a CPU which is remote to the node
+			 * where the memory is getting freed.
+			 */
+
+			queue_work_node(bdev->pool.nid, bdev->wq, &bo->delayed_delete);
 			return;
 		}
 
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 43e27ab77f95..72b81a2ee6c7 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -213,7 +213,8 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
 	bdev->funcs = funcs;
 
 	ttm_sys_man_init(bdev);
-	ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc, use_dma32);
+
+	ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, use_dma32);
 
 	bdev->vma_manager = vma_manager;
 	spin_lock_init(&bdev->lru_lock);
-- 
2.34.1

