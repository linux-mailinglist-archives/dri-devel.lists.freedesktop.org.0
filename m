Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFD54D1BB5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 16:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623CD10E341;
	Tue,  8 Mar 2022 15:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2051.outbound.protection.outlook.com [40.107.95.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E3C10E341;
 Tue,  8 Mar 2022 15:28:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1GSCIB1cwiGZyXBD7a41WSGpnnmj8e/QmTEr04StBb4nK1t048w3iNRTeejAbTpuXkHKz6ISo3hE8mkP9glsnMtLeAzGIkBD5kPqQkzGgwQMSrY4Ox/l9BuWMAms+2qJWqgBSDYUAllv5vr/8omyfdYKVccURVKMcn0EcB9de2LCnrEBkYQt4ykvL97wBohBMXpI/M/sZ4uvcfNpPwIDjtzol7+vs1IoZubCDgs0W0pb5a4cvtGgVt3YUIz4HqOkaDh/RwfU/Z8b3aHowB/NJQBu8bod5YfabfKyRpVaMaBiXBvw5277G6tDyW2JCM3isorg1FzXAXoWgmZVDD1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKF1HDe0mOCSvwcGK+Ws0QErr+6c+PUkuTEKN0nqjNQ=;
 b=V7UwcHt+a7ntKQ5Tf6NA0aevidg36A9FDAjIiXsvCeQR9OHaDOgz96DZN2Ujvme1AgtYTFaJwk+ABe2VBvxKzJ02MJ33hu/iTFoIUSuuQLVIj4lSLH6zmyBEQpmxahtApFmYcx8atUy570ZB8Fjf+gwMsHsMneUm4NXQeZ6w8Ss96nRkx1l0AnVUpgyzaMbnhAiq4lsLTaYvkJo2UZtDXaZo8WijCNzI6UeIXs/ZHPg6u+wFF6aatTU/dUUj+2u7biIi7ibjDmMYSHj8JUTuOr1H7EykjzxcogPYVKdQxClrjQkQhsiMRACCuwK+roj8Xltd0GRKeMkOBq/zHLaFLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKF1HDe0mOCSvwcGK+Ws0QErr+6c+PUkuTEKN0nqjNQ=;
 b=aSwSmc7eE0FtKBDm++1M0lDhkoPFR6bKgQxBi5yM2rVVHZyE5lgNeDpjbO+dbDK12ptBKEDJqi/X01NCVbPWKhnGm2Iad6uFdpZOn2JYLf9+lrhMhF5mf6qsu+gMsoNOH48iIicwPjQ/Sn5xAh1/IpEM7MpjYtE9ocNEo6egIvE=
Received: from MW4P223CA0020.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::25)
 by BL1PR12MB5378.namprd12.prod.outlook.com (2603:10b6:208:31d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 15:28:35 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::c6) by MW4P223CA0020.outlook.office365.com
 (2603:10b6:303:80::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15 via Frontend
 Transport; Tue, 8 Mar 2022 15:28:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 15:28:33 +0000
Received: from dayatsin-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 09:28:31 -0600
From: David Yat Sin <david.yatsin@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdkfd: CRIU remove sync and TLB flush on restore
Date: Tue, 8 Mar 2022 10:28:11 -0500
Message-ID: <20220308152812.7929-1-david.yatsin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6703d0a3-0fc5-4ab9-e7ba-08da01184eea
X-MS-TrafficTypeDiagnostic: BL1PR12MB5378:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5378CC606D7B3B02D7D9FF1395099@BL1PR12MB5378.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dzMXT9Yu4IZruIWV8UknMQwLhGiibvS+dgNuexvOT/sK/NnZu9o71wThjHkViAEIJnNjteBJy2UGp+W6ectCEcPPeqh1SOZO7SVeXApuVk7TaXu6LMT5ShRC6PQwLYpVz3ycOWr+apCBuAhwVkqM5x6lkm7Fj3G4u1l8cNNUypAbtTNgeRTLjQ2+bAuesQB+9zEK0YJIJPRFRGirEUyfW05QgD8WBsSW9v7OzNem1bfRQvAxSliQsVCYhPvtd4LkHGXjWJmnJJZf0ZqRSWZLWWe1BuGZgmwdKjq6XqN0H/No9GPizySPBDmyMV6gCNA2MyhKk5N8jFj3QdmTg6L0zd7sjnCYWIRtOaaB6YK5yfzhMgVDZjmb1uAPYvHapaemPRNOZPUz/VMVcHKw5jFK7hnQy8/7J4lmcL57QiE8HekgjYKRgh+31hUdpdx/zznCTLfineGudHo+8HfAjg9zpDNHpbVz/Ut+P9+NJ85FF5Rjore6HNDB4x61uLSDSqp5b26GyzXRR+0QT4yNA8UruzOKwI45van0WH29j3DbcGpYXfH/CqIxVrj/I4VvemdmwEzLuh2mCNau8fYVD82aZRQZoSNX8Ta9kBr+swBCZVyY8xF3R1LY6ifLbGqtYmtfsiqm49wgUmOgaGu4xcVZZPu0IFYZa+MDy4V0D9xcOk/nHDKFu9HieqkYl3/HLUmVUV4KKXQW+7/mn9XuGYL3ew==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(83380400001)(316002)(508600001)(47076005)(54906003)(36756003)(356005)(7696005)(6666004)(36860700001)(2906002)(8936002)(40460700003)(4326008)(110136005)(81166007)(8676002)(86362001)(82310400004)(450100002)(186003)(26005)(5660300002)(70586007)(70206006)(1076003)(426003)(336012)(2616005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 15:28:33.9175 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6703d0a3-0fc5-4ab9-e7ba-08da01184eea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5378
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
Cc: Felix.Kuehling@amd.com, David Yat Sin <david.yatsin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the process is getting restored, the queues are not mapped yet, so
there is no VMID assigned for this process and no TLBs to flush.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 30 +-----------------------
 1 file changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 59d3fe269e7c..789bdfbd3f9b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2102,7 +2102,6 @@ static int criu_restore_bos(struct kfd_process *p,
 	struct kfd_criu_bo_bucket *bo_buckets = NULL;
 	struct kfd_criu_bo_priv_data *bo_privs = NULL;
 	const bool criu_resume = true;
-	bool flush_tlbs = false;
 	int ret = 0, j = 0;
 	uint32_t i = 0;
 
@@ -2248,7 +2247,6 @@ static int criu_restore_bos(struct kfd_process *p,
 		for (j = 0; j < p->n_pdds; j++) {
 			struct kfd_dev *peer;
 			struct kfd_process_device *peer_pdd;
-			bool table_freed = false;
 
 			if (!bo_priv->mapped_gpuids[j])
 				break;
@@ -2268,20 +2266,11 @@ static int criu_restore_bos(struct kfd_process *p,
 			pr_debug("map mem in restore ioctl -> 0x%llx\n",
 				 ((struct kgd_mem *)mem)->va);
 			ret = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(peer->adev,
-				(struct kgd_mem *)mem, peer_pdd->drm_priv, &table_freed);
+				(struct kgd_mem *)mem, peer_pdd->drm_priv, NULL);
 			if (ret) {
 				pr_err("Failed to map to gpu %d/%d\n", j, p->n_pdds);
 				goto exit;
 			}
-			if (table_freed)
-				flush_tlbs = true;
-		}
-
-		ret = amdgpu_amdkfd_gpuvm_sync_memory(dev->adev,
-						      (struct kgd_mem *) mem, true);
-		if (ret) {
-			pr_debug("Sync memory failed, wait interrupted by user signal\n");
-			goto exit;
 		}
 
 		pr_debug("map memory was successful for the BO\n");
@@ -2296,23 +2285,6 @@ static int criu_restore_bos(struct kfd_process *p,
 		}
 	} /* done */
 
-	if (flush_tlbs) {
-		/* Flush TLBs after waiting for the page table updates to complete */
-		for (j = 0; j < p->n_pdds; j++) {
-			struct kfd_dev *peer;
-			struct kfd_process_device *pdd = p->pdds[j];
-			struct kfd_process_device *peer_pdd;
-
-			peer = kfd_device_by_id(pdd->dev->id);
-			if (WARN_ON_ONCE(!peer))
-				continue;
-			peer_pdd = kfd_get_process_device_data(peer, p);
-			if (WARN_ON_ONCE(!peer_pdd))
-				continue;
-			kfd_flush_tlb(peer_pdd, TLB_FLUSH_LEGACY);
-		}
-	}
-
 	/* Copy only the buckets back so user can read bo_buckets[N].restored_offset */
 	ret = copy_to_user((void __user *)args->bos,
 				bo_buckets,
-- 
2.17.1

