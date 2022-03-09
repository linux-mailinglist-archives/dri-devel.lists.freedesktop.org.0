Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9124D3BF9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 22:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DDD10E438;
	Wed,  9 Mar 2022 21:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB5510E435;
 Wed,  9 Mar 2022 21:20:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsUvfgsXOdBxh5dFGnULZVJ+1D4t1LJSkYIvhuEK8PMBVtM9qb1dIzYmvM61LOFGjg423TbBdmNQlqdGCvYHePxW0bIOFnEW0zbKLi/yU0uHE/daNBbK/gL7kZ6RYHKhc+iAJ2oL9JrJ9Vv/3mWTObjzl70hGiYSOSbpFfIurSKmG+WE5sZDDv862sAnXnbLco7WstDLQzL6vKSTUoIhI7Zncq6u37/nSzLFGiyndhxiRlRZn9YSrSIC7EPpxcB2JQ/EvjqDiyssyRKB0D89PsHhym9FQZ9Zatkw0jVsQl4VJerbTL3EhDx8SiWFeGSIRtB4pqGBHTBaKo5c3AumrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noQG20Hev1fgOJYeVJD1Nwz/2BpTKipKy6PAdIzKQxI=;
 b=bMVpoNCGr5Buk2bmeX3U6HLeOOMqXix8dMF/Aix0bY08cjNIwKioqNgRK5J8UPHRG10MhUDbgcO2f650RsKiqkRfh4ED3rXBWLE5u863QTF+JACg1IFbCKyVNbWkCPEjyp1kx1r4jdB3kMzOjBTkc5O3qrF2gyQcHpXWtup1Yh0kfVOgQRE5kPIxCfAhOzR/cMuRHsrF5HEmRBx6An3TD66fnvIqv3ZQJL/8hYwHXZRaaha0Rhir5MCIWLXhavTtRHf8mFUdrVCe+euCy++c9zieyj/uqflNuZmtqkxbRUPyCOTKq3R94r/TFE2owCXct7RWtNQW076M6k1YWxFYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noQG20Hev1fgOJYeVJD1Nwz/2BpTKipKy6PAdIzKQxI=;
 b=BC8bYq2NFRvbfS9yV7Zm5SSlbH5EwmurqErW5XQr+DhaKU1O9UcOXvhM74px802sSIERx0hvRzol46oQXmFy1kVsWSD0Z8qDtDC3SgXwzGJnLCGqPA4ioLnel2o1NgQcovhvBvxlz1EBz9xkIK33GsqZj4a14DirEOAUul7V/lc=
Received: from BN0PR02CA0035.namprd02.prod.outlook.com (2603:10b6:408:e5::10)
 by DM6PR12MB3355.namprd12.prod.outlook.com (2603:10b6:5:115::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Wed, 9 Mar
 2022 21:20:48 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::72) by BN0PR02CA0035.outlook.office365.com
 (2603:10b6:408:e5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Wed, 9 Mar 2022 21:20:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Wed, 9 Mar 2022 21:20:48 +0000
Received: from dayatsin-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 9 Mar
 2022 15:20:46 -0600
From: David Yat Sin <david.yatsin@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] fixup! drm/amdkfd: CRIU export dmabuf handles for GTT BOs
Date: Wed, 9 Mar 2022 16:20:31 -0500
Message-ID: <20220309212031.3063-1-david.yatsin@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20846a5d-c0ad-4670-def6-08da0212ae43
X-MS-TrafficTypeDiagnostic: DM6PR12MB3355:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB33555A62257BC9CCE61BBC0E950A9@DM6PR12MB3355.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nzguhpAVV8s7uLPRaLDWkIrtQ+vxFQnHtWcTKjCo+nY5nP0sE4oql4VG5nX3HvZOBZPtFWbRQMpuLadjBYO3fEaJApLYIgZMcixuVM/O6Eb3okuIye1oEksfICp4ZfWPrYV6dT762NxKuiIOCbM5CG35qFi7Jqacwf+qS2bQqk5gXO2//EIFI7Ab8VDBW7lHBT9MiJDZ5nOQkpVAUydLdRvt/vBp46v2s/h9WnUHnnhcq4v3abhHShjbg3m5LsQiwCw4/eCSl9kOuqu6PxXXxXcXeGyLD3xpzCZ3JV3m7wrLp7yJW0qlIk7WN96L3//z3yWZeTRt4rC4uj8E39/YuMqz+JgtU7reFLq9uF67+dOE45REB1bCK8ItqpAIUzWrx12GsLtS4//l5tIYlVi3jchZCiPBC37EKC9RrOgnwfHDwghi6qIDCLHomg2sVDeuq68sHCZg1zGmRrRr5POI6ZJvv1LfF3EvDJaDcuflH+E41D1194eoCWlFQjqSgCexV0n1FH8R50yvjro1A9nzEo68qhCoH1URwKVFr+uNnVvxyDoPKKcS9isqrRJ3w4FfquWGlY5NrCOs3NKCPRPIhKn2Wn1cttu4mSN5NU1G4UOa2SHzrirS0Ql7ayOV6qLWAHZJ8WCMOEv+jv7eNDg9WMT6tFRp1Y+CXOVOpOS/Ya3/UTp0UYQO3MXeVfY3BHSgC+teNZF951pQImVyl7KgNQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36756003)(110136005)(8676002)(70206006)(70586007)(4326008)(450100002)(1076003)(47076005)(82310400004)(54906003)(36860700001)(16526019)(426003)(186003)(2906002)(81166007)(336012)(356005)(2616005)(26005)(7696005)(83380400001)(5660300002)(6666004)(86362001)(8936002)(508600001)(40460700003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 21:20:48.2071 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20846a5d-c0ad-4670-def6-08da0212ae43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3355
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
Cc: alexander.deucher@amd.com, Felix.Kuehling@amd.com,
 David Yat Sin <david.yatsin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 6 ++++++
 include/uapi/linux/kfd_ioctl.h           | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index e1e2362841f8..607f65ab39ac 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1767,7 +1767,10 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 						&bo_bucket->dmabuf_fd);
 				if (ret)
 					goto exit;
+			} else {
+				bo_bucket->dmabuf_fd = KFD_INVALID_FD;
 			}
+
 			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
 				bo_bucket->offset = KFD_MMAP_TYPE_DOORBELL |
 					KFD_MMAP_GPU_ID(pdd->dev->id);
@@ -2219,7 +2222,10 @@ static int criu_restore_bo(struct kfd_process *p,
 					    &bo_bucket->dmabuf_fd);
 		if (ret)
 			return ret;
+	} else {
+		bo_bucket->dmabuf_fd = KFD_INVALID_FD;
 	}
+
 	return 0;
 }
 
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index eb9ff85f8556..42975e940758 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -196,6 +196,8 @@ struct kfd_ioctl_dbg_wave_control_args {
 	__u32 buf_size_in_bytes;	/*including gpu_id and buf_size */
 };
 
+#define KFD_INVALID_FD     0xffffffff
+
 /* Matching HSA_EVENTTYPE */
 #define KFD_IOC_EVENT_SIGNAL			0
 #define KFD_IOC_EVENT_NODECHANGE		1
-- 
2.35.1

