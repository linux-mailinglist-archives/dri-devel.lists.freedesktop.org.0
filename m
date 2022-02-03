Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E354A8118
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB4510EB34;
	Thu,  3 Feb 2022 09:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A1610EA5E;
 Thu,  3 Feb 2022 09:09:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AszySK6LPeDtWebU5/zW5+9E4dUA6hoPJ++Dy+p9mKIYl08mYr6pNe/oTrHxkYF41WNr07rIQiYNj1w+YZu7ElHbZkXuG8ewaYkqQdD+gcPOSLuQNWMPEk3DashPVNYsAYsUJta8rpKQwNkIFtLOwXjpNqi5y6HMUHZA1N2YU/hOrHzoUeiZFNlEeaGVQ7ka33shKn3ZqCmdIOK8IO2TG+MFQxok0COcb1+BbYeDRYU+kz3cnDWHlZQUoUmpqW29ulGJ6u6yqar8KMamQWavd85QTYqTuOmO7hz4Dasu7OupwQkXKZrTzb6dcspJyjzt9RvILKAl6pSJr6XuGnucgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeOjQRSrK6pF5FvgINDs5c/wxFXnheu0NAEe1HZ4jYk=;
 b=ZYQ6utc4hnf1k3Pv9E9arYAegvxRe4Bo8YalpBZYXJK3jwmgB0PwNLcZxYWw4R3lPw3oQqi6A7vtlQp0OALvC0jvpnDnFEGXlR4S78XbzxzTc8RktU1StZuAj7evN6fACeENfuvSbKNnYi2VyG/rXfXxjYpEW0WD3KbVkmAxPWIksypwNuxHfDISYQCFMdBcirgmwP5dgyH7g5R5wVUBOwb0AkCLJZ52SBjoFmfnqYvYrs0FMsGti0V2vmphKLsuo2JGIUTJy3hZ6Dr3oHaSf+gu1r9tQ7lW56SNAsNVvGW6LCk3Qkj94L9CWmgQletZ1MwuJ32U4MDl11Q25tWvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeOjQRSrK6pF5FvgINDs5c/wxFXnheu0NAEe1HZ4jYk=;
 b=W0lROeyn1390NePI1mCdX5GoEsak9SJPju2Kv68AnXZCMDrR77bDUD6Ff7CnUjidBX11il7EiWUhtEFoZQ1RrFJ/9beG+yu/17yN2bjVM3/Pwobt+pGI+5gLdn8p9V2JbjJd8KGLJ9kKsybbV3KrGF+b/8eCrih5r68HixpAwRE=
Received: from BN6PR11CA0055.namprd11.prod.outlook.com (2603:10b6:404:f7::17)
 by MN2PR12MB4813.namprd12.prod.outlook.com (2603:10b6:208:1bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 09:09:44 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f7:cafe::96) by BN6PR11CA0055.outlook.office365.com
 (2603:10b6:404:f7::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:44 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:42 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 18/24] drm/amdkfd: CRIU allow external mm for svm ranges
Date: Thu, 3 Feb 2022 04:09:12 -0500
Message-ID: <20220203090918.11520-19-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
References: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 711cde85-4449-48a7-5a44-08d9e6f4eb4c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4813:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4813B6864D85C044E89B81A8FE289@MN2PR12MB4813.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C5os0sWT0FIkTV41r1tnaYwPNfjP2tvV+KpVfdlT+0j8zuhdWCC1pxBQcg1w3g1v0ggVFZRoM5or2E0heIwYj1iHLZTm3XyRP8v3aDoKT9UAczCNA9ZOHZyhp2a0fStr/shOxeIWH+OJYxsmxz6jjawo1rK0bmVmnEUP098HZ+NA3V7UA8X4SeyxAz+1hAyAK6ru+g1tCOscCvQuq1xOrv/zIKT2mupcxU+lEknINnI6Dj0QcyE41txhNIz2p1A526v4slCa2EQy5PcOGzKW08IyIKBpl4CfXlEqrJ3AXfZ4ixl8A6XsDQSKGxHsdKM8qcLTq5tLKQcKFi0MWitpWdDh8O8H434oG1NVUA1LrpK9esnfDk3HbDcLTA8iQDVvN162lPMEG/udKmSl1HADn5BtG1BAB5c70rwdnjiOP0t81YaTfO9URH2Y4rHDwQoF14VEGWDqvpKXlYNdhZRAB9DbugrPa0B9WYRIAeCkSWepumbi9n6xYokYFUfMsbU26dZL3vz5/dQBCRLmzP73sjGllxe0ve0g7+0ighqRvVOKSRnhF4wHt5RfeBvNahzz+5NRAJvMYZdJOO4OPGsU195+8z6HFmRSrtE6PY6OpRY84DweglU+GVfjibwJxP1hvLOK/Ldaj9lTnlKumoVcOHSJZYs6nskAdEnRuay8rOdA6J9DF/nDa1MWd5YhwimNr0roAAfx5M6bAPijkjlJ2Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6916009)(86362001)(316002)(40460700003)(81166007)(2906002)(82310400004)(356005)(54906003)(83380400001)(6666004)(7696005)(36756003)(47076005)(336012)(186003)(26005)(8936002)(2616005)(1076003)(16526019)(5660300002)(44832011)(450100002)(70206006)(508600001)(426003)(36860700001)(70586007)(8676002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:44.2913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 711cde85-4449-48a7-5a44-08d9e6f4eb4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4813
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, david.yatsin@amd.com,
 Rajneesh
 Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both svm_range_get_attr and svm_range_set_attr helpers use mm struct
from current but for a Checkpoint or Restore operation, the current->mm
will fetch the mm for the CRIU master process. So modify these helpers to
accept the task mm for a target kfd process to support Checkpoint
Restore.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index ffec25e642e2..d34508f5e88b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -3203,10 +3203,10 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
 }
 
 static int
-svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
-		   uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
+svm_range_set_attr(struct kfd_process *p, struct mm_struct *mm,
+		   uint64_t start, uint64_t size, uint32_t nattr,
+		   struct kfd_ioctl_svm_attribute *attrs)
 {
-	struct mm_struct *mm = current->mm;
 	struct list_head update_list;
 	struct list_head insert_list;
 	struct list_head remove_list;
@@ -3305,8 +3305,9 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 }
 
 static int
-svm_range_get_attr(struct kfd_process *p, uint64_t start, uint64_t size,
-		   uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
+svm_range_get_attr(struct kfd_process *p, struct mm_struct *mm,
+		   uint64_t start, uint64_t size, uint32_t nattr,
+		   struct kfd_ioctl_svm_attribute *attrs)
 {
 	DECLARE_BITMAP(bitmap_access, MAX_GPU_INSTANCE);
 	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
@@ -3316,7 +3317,6 @@ svm_range_get_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 	bool get_accessible = false;
 	bool get_flags = false;
 	uint64_t last = start + size - 1UL;
-	struct mm_struct *mm = current->mm;
 	uint8_t granularity = 0xff;
 	struct interval_tree_node *node;
 	struct svm_range_list *svms;
@@ -3485,6 +3485,7 @@ int
 svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 	  uint64_t size, uint32_t nattrs, struct kfd_ioctl_svm_attribute *attrs)
 {
+	struct mm_struct *mm = current->mm;
 	int r;
 
 	start >>= PAGE_SHIFT;
@@ -3492,10 +3493,10 @@ svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 
 	switch (op) {
 	case KFD_IOCTL_SVM_OP_SET_ATTR:
-		r = svm_range_set_attr(p, start, size, nattrs, attrs);
+		r = svm_range_set_attr(p, mm, start, size, nattrs, attrs);
 		break;
 	case KFD_IOCTL_SVM_OP_GET_ATTR:
-		r = svm_range_get_attr(p, start, size, nattrs, attrs);
+		r = svm_range_get_attr(p, mm, start, size, nattrs, attrs);
 		break;
 	default:
 		r = EINVAL;
-- 
2.17.1

