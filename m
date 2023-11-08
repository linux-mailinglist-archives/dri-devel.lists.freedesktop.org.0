Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4267E569E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 13:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BF410E735;
	Wed,  8 Nov 2023 12:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B8610E733;
 Wed,  8 Nov 2023 12:58:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXuAhKlz0Azpj0rgE8V6F6MnfdTFs/HgD3SjPg3JcX9YOmUA/cwjqjgZUJAEBYDoN3zfVNOwy7a3DN3FPPLUTu3GIMkQbBGAxHmU6lmcEr9xXiwibctFZAyx36H9w/aVH0fQp4je+h0YFGoRudBEHijnhYbYf5MT0HRB5HTFSICmo6RtYrnHW9YIIFHdo3CbXNPHVoEMWsJYAM3fnNCiN69Zu++ksPGrIxn3SYHn4BRt3CvrXV1u6TdxD/QXazQIe68gTsb4Iln80dOg/tA7aGjl6ovc7yFaeXXmGobhiE4S2vxcBqzAc/jtxm5YzPxxYNREroK8oiqcbIorEHFZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZ10U9I1/Fxa0glj2D37iTFm7+TMSEMxpn4M80ZDVdI=;
 b=EyX6CR1E9wq/eZfjfWm2ZmjqckZttw0udddrK/ZCZsLOlTZp6SRrzg7YjqzhU6QsqbdfsrzRsa83HyAd3sp1s8qBtmsHKihp50LpyrvRp/ZnFyS6tfk/tVpKpJFztBI2uzV1+kgx7V/Lz+8Ujl1Vd0J4ji9Zsdn8GG23j46Fta5J8nT7lPh/INQTZXJZfnzWXPGxFeYvuRhdZX6dLl4Plj3JCSdu9Zo4uDevBQbczFmOetXiVWAphwEC+XhWqBKzUaBaHlmqkDBqjFQb9bQ9kbvsoTU7GVMQ+pw6hnDOTeQrv9GusMn/uurWOjq4p9ll/JusaRYGJ5eVFCcX1gf+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZ10U9I1/Fxa0glj2D37iTFm7+TMSEMxpn4M80ZDVdI=;
 b=DjWhwjPlj12AriwxuGrsKWMPdeJTSZ5kfASaT6y2lziPcSgo+Gp3W7+MkZd2Jg77pngLqIzzjKDC96XUZhbutK0N7x8WdT8Uk0xM37bi4aeLrWioE0sOCMHPogjda6m/xXKdXimwNpHOEnEIhkioPSaBwNA61n/AHFYBpQbLue4=
Received: from MN2PR03CA0010.namprd03.prod.outlook.com (2603:10b6:208:23a::15)
 by PH8PR12MB8430.namprd12.prod.outlook.com (2603:10b6:510:259::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Wed, 8 Nov
 2023 12:58:51 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:23a:cafe::76) by MN2PR03CA0010.outlook.office365.com
 (2603:10b6:208:23a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 12:58:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 12:58:51 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 06:58:50 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v2] drm/ttm: Schedule delayed_delete worker closer
Date: Wed, 8 Nov 2023 07:58:24 -0500
Message-ID: <20231108125824.995445-1-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|PH8PR12MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 2218b6ab-e7fb-4dc8-96b7-08dbe05a749c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UBMxqV32C8HuGdaorD6xZffVu2cyC+t2jQ86PZOavHyYaiEQJeQGD/BOZQaPbPO0fTcxTFH1ZXlQy7HVd5Iwyoc2pxWn8NGlhqIkLC/ipstt1isT4Uyqg/x1dE23oHOXHUZxqOo+WKTJ8C/jxR33IlxTzWwvPmQAZ4CpcINzP1UXvwHynbcR9/SyCHQeDH45FYiJaIZdCctUDrVC+Utave0OD8EvCXFC/2PyScjfsQuFEDz19vPulYfjn2AJQJpxIXqYfevptnTj8jPlq5dmx4nKkRap45n0o6kHuI4bFY5VA2WdWxlOUj8zlqa3lerBYoihHE1q29OejSRyBcN+V8gM4essbX9n7oShJpIvfyVXCfweooDTn5YdyPNhAS9HDcMwF0f293yaxnbTvuAcaY/c0h8nt1QK/Bg57wZ6i6P0z7AEPA74TGbOs51/W8H6kosNJRdMSm638jt5jqTDatt3vPrpfzqRK8+8KmjUOZBgIztwpuOfU71Yo/1vjEVDBLFxu1JdV+IJi8N6uW0W08apU758nYoqjWKM6N+9f4Ro77BncZHw1+AzzQY5PrLDQMzIrTUOlC4KDiK3Cipfa45XkZ9tJs/IQjTqs3XTykQFQqrLY3ehht1IpPf+oVVoRs1sT8zfXt7a6S5eqV/dpVDJxRg1orxBdT/LSocWRLflI+cf6+3EESeH2emlkP7qJnz63AQU4pCLOJlKBaugU8ikhxnv9XukQS7RnfaEbDf0oomXAEGyZa9ctDU+GiyNz9oixllUkF3hYBaXMt3Ypg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(451199024)(82310400011)(186009)(64100799003)(1800799009)(36840700001)(40470700004)(46966006)(26005)(47076005)(81166007)(426003)(336012)(16526019)(2906002)(83380400001)(40460700003)(36756003)(86362001)(82740400003)(41300700001)(356005)(36860700001)(8936002)(450100002)(4326008)(7696005)(44832011)(478600001)(316002)(8676002)(70586007)(70206006)(6916009)(54906003)(1076003)(6666004)(40480700001)(2616005)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 12:58:51.0686 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2218b6ab-e7fb-4dc8-96b7-08dbe05a749c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8430
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

Changes in v2:
 - Absorbed the feedback provided by Christian in the commit message and
   the comment.

 drivers/gpu/drm/ttm/ttm_bo.c     | 8 +++++++-
 drivers/gpu/drm/ttm/ttm_device.c | 3 ++-
 2 files changed, 9 insertions(+), 2 deletions(-)

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

