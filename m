Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7E04ECEAB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 23:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0944A10E09F;
	Wed, 30 Mar 2022 21:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3863010E09F;
 Wed, 30 Mar 2022 21:24:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPIJRmEYR3oEf5QR0Rc15ULPsaFQPVhtoKfyDYT8uI8dWDoTb6E11i0L0WL4BTI273gW6i+toBK+FKLirDWQVprritN2/Z5HHVq/18S6zPbleMZDt1UEL0x9KWliL7Z0GcvajhVNyzrHFbKn5yOkQSsBWeim0ByqP40Ahl5hYo6SFA2LH33OP9fL3b2lxKfZsl6rFzdjLNmLVq8zT2sceyYDiW+jO1pXkMT+5iwMwvhsVmrXcgzm8IdjuHgiM/xzr+p1glNnQ3yYh0RotSwnHeu20te9VipjcZGhHxGKxUUarh/pSrGPM1mhvvnrFjQS7+MPk+l1M/LHAEE01oQsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLIUZyRPEKUSzuG4lWIjaPQdPPxc6MOaIPQjEpwOAVI=;
 b=AZ8u2p39KOS9q3ASIBirKlXEbERNZXSO6v9AJD1VBSKcInwGT4JNvzb01E9f3qbwm7MRLIFYy53T2bzG/kIMPMjyT7b86gvXEhGYfK+XQ3sKqeY75tFLbrgGZS2TqR7mJ444f4rGRnJNfa6fuDaukgdGLUSZ0/wzt2hqjTtoXJm3BTJltASXkuKHNFBgvNYCxVS9GtUFDzcHIS+ttkypJc59FRrVlahFivTWM9i7XMf2dFI8XqYDlLVyXVt5V2tMlS55/UHYlZALFYgxf0YtZARuz/nVw7+bvpVQqGpzuzM/95skd/tKXutYjDwHD/W3RbIVVzPOsxFLt1VjFjXZyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLIUZyRPEKUSzuG4lWIjaPQdPPxc6MOaIPQjEpwOAVI=;
 b=uaUsVzNUrP53LAInUxzb/xTDSaOmhaw/Ev5E5OKcL4HlWhTqiJ+HKZmgy/km29YkeDKyH9LODCs8B2ajxFVN49wHdTXSzxRTOwMKLsMmPfWdC5nfIdq4d7CBDVBe0/VQwXv0Z5vCP84TNMQ7OgC1z5Ms016PVJ7uLHYAWaQu6e4=
Received: from MW4PR03CA0012.namprd03.prod.outlook.com (2603:10b6:303:8f::17)
 by DM5PR12MB1292.namprd12.prod.outlook.com (2603:10b6:3:73::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.19; Wed, 30 Mar 2022 21:24:32 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::c3) by MW4PR03CA0012.outlook.office365.com
 (2603:10b6:303:8f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 21:24:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Wed, 30 Mar 2022 21:24:31 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 30 Mar
 2022 16:24:30 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH] drm/amdkfd: Add SVM API support capability bits
Date: Wed, 30 Mar 2022 16:24:20 -0500
Message-ID: <20220330212420.12003-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8cfbc1c-0d29-4964-fc14-08da1293ae5b
X-MS-TrafficTypeDiagnostic: DM5PR12MB1292:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB129275290485D25A510CF4F4FD1F9@DM5PR12MB1292.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aupQPbJRX2JzI8WvZf0zE+nSjLTyRAlKukftwyodn5s4jQEj71Y9zV+8v3Mx4m5d9f2X+SffVwGNyCb0Vutznub6qgvS4lE4f/f/8TizBGFLFftaL83fZdhXDc3Ux1RjcgOWCyLo7QXCrriZWbcOql3VQTmjQ6dsx6l9vYFNT1ZlbYp04eE+ggw2IEB9LrhqQKI44pXJ0e4xXPoFX9hBFwVJS/GKaXJLTlBNgAK7NXNjzVH31Y8FXtCQJRZrfrwSGMnl0TqvjSm6DKr1++wH9R9tVg82eUtlFH9Bi4RPWZYsjQouEywSp/jmE9paVAZLdqKK4BSsNvammDRLmyNZjYrBBAEiPWFLU/V++V9szMXbTfTGbenN4rBTWtKAwRzyXxhsGBhS8AsyEAoBF0m3tahpvXSPiM6ZMD/VwQnW8Y9ATjYsjTnI3qfJ6DHRWUjGprzWBRKPpz1MSeuusx24HsEWGUQfASRrE+aCNvhrHSBLVrq6b5H1BJ8zjETxXHthc7ysKu7v6jg921SIVnYmmIHuW8SD+ErrAKvSWc5a67RcCYW7/UCsih/jKxKwHkP9KVeBQjNO1ZN+W8zq9GJT5u6U2weVFcb6OvcF4EwqAyD1IyTBwWYkSViUQXyFE8+dv9PW6YCVe5csjps8VDuWH3rzyQVhr/nph2WvElbMMG2/DcK0uHibDxl+mAMRgeuEFpOt27otBNAvstQ9Y8GhXw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(4326008)(6666004)(426003)(336012)(70206006)(82310400004)(7416002)(2906002)(7696005)(70586007)(54906003)(86362001)(40460700003)(508600001)(316002)(5660300002)(8676002)(44832011)(8936002)(6916009)(356005)(36756003)(2616005)(83380400001)(36860700001)(26005)(16526019)(1076003)(47076005)(186003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 21:24:31.9384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cfbc1c-0d29-4964-fc14-08da1293ae5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1292
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

SVMAPISupported property added to HSA_CAPABILITY, the value match
HSA_CAPABILITY defined in Thunk spec:

SVMAPISupported: it will not be supported on older kernels that don't
have HMM or on systems with GFXv8 or older GPUs without support for
48-bit virtual addresses.

CoherentHostAccess property added to HSA_MEMORYPROPERTY, the value match
HSA_MEMORYPROPERTY defined in Thunk spec:

CoherentHostAccess: whether or not device memory can be coherently
accessed by the host CPU.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c |  6 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h | 10 ++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index cdef608db4f4..083ac9babfa8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1419,6 +1419,12 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
 		dev->node_props.capability |= (adev->ras_features != 0) ?
 			HSA_CAP_RASEVENTNOTIFY : 0;
 
+	/* SVM API and HMM page migration work together, device memory type
+	 * is initialized to not 0 when page migration register device memory.
+	 */
+	if (adev->kfd.dev->pgmap.type != 0)
+		dev->node_props.capability |= HSA_CAP_SVMAPI_SUPPORTED;
+
 	kfd_debug_print_topology();
 
 	if (!res)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
index b8b68087bd7a..6bd6380b0ee0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
@@ -53,8 +53,9 @@
 #define HSA_CAP_ASIC_REVISION_MASK		0x03c00000
 #define HSA_CAP_ASIC_REVISION_SHIFT		22
 #define HSA_CAP_SRAM_EDCSUPPORTED		0x04000000
+#define HSA_CAP_SVMAPI_SUPPORTED		0x08000000
 
-#define HSA_CAP_RESERVED			0xf80f8000
+#define HSA_CAP_RESERVED			0xf00f8000
 
 struct kfd_node_properties {
 	uint64_t hive_id;
@@ -98,9 +99,10 @@ struct kfd_node_properties {
 #define HSA_MEM_HEAP_TYPE_GPU_LDS	4
 #define HSA_MEM_HEAP_TYPE_GPU_SCRATCH	5
 
-#define HSA_MEM_FLAGS_HOT_PLUGGABLE	0x00000001
-#define HSA_MEM_FLAGS_NON_VOLATILE	0x00000002
-#define HSA_MEM_FLAGS_RESERVED		0xfffffffc
+#define HSA_MEM_FLAGS_HOT_PLUGGABLE		0x00000001
+#define HSA_MEM_FLAGS_NON_VOLATILE		0x00000002
+#define HSA_MEM_FLAGS_COHERENTHOSTACCESS	0x00000004
+#define HSA_MEM_FLAGS_RESERVED			0xfffffff8
 
 struct kfd_mem_properties {
 	struct list_head	list;
-- 
2.32.0

