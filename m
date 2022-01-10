Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E06748A1D8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 22:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B583710EA96;
	Mon, 10 Jan 2022 21:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A41F10E4B3;
 Mon, 10 Jan 2022 21:23:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K61LMIAHKg75k+Mrw/dk0tMq/1vOjrjLya6KUXAN0shIKr9wnubKeynFC5o4t2FjyuTP1vAjHVtu/Ap/pImzDl0vT/CfFoyc6h7RBRy2RbMo5Kync2HSagIOLoJ5Bc7MpMOB0CnfY4P9RS0aEaq+YYkBwQ11DVNkvCxUH2fC+fnEgPThPn3OqtQyi/hO10pRSuizuyCBbcZB33x3b0YPqp/UWeXZBloguT11gbPM/TIKMYk+5PmaxgLawm6wStnd75wNket0i/TKuClGRbrQ7QmfULmVbeqcxab9jZaOPWQgoulhYghgbSG9jTwIDGh60Lx3tmHv2SuZFrad2vAEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N90+uyMCblzmnpTiWteE1eLektIBJWx8KnSmHIwyysE=;
 b=jCcd0DGJnTCK2wralWu0OmUrdRc8PqwPeQxxGjScuHlWqUrLhKpS2xNZNMatS66W95OFu9zq9zhYpHwXZ7hshPYui+i+pFejPZk+olTieCj/ru0XvCoGRYs6XFFwx4qNL97nbiDZOAkMipyXoTyixPa5ObFQZujkORv64qK2f2WX5MW2DROMIqV9lqNrJrpDw/m19+eW7EWymEXXo6qYLrOBfYEjcO21PHrmgOYR0GOFUmvog8r+l/8im32liL837v+jU+R2kPrhm2rCB2px4qrB5l1R3s52z2DU5iEXUl6crqhE6j3FzzdSoXBz82goqUKIFJWBzuF7KTfWzIdqNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N90+uyMCblzmnpTiWteE1eLektIBJWx8KnSmHIwyysE=;
 b=JGUU+1IcvrayFoM+Jn3scVYR3iXFodILWwSgVRiibXQbETrff69viw9NXYioaDNp3QO+asuv7YGdAQMKETeMMrrmfshpz971F5/l79fNU5H+LDnUAdvyn0IcNW6cs5SZJJWUHi+vrn5YT5h6iKXCjJDAf7Zg6yxp+mo8U9b5M7w=
Received: from DM5PR19CA0048.namprd19.prod.outlook.com (2603:10b6:3:9a::34) by
 DM4PR12MB5261.namprd12.prod.outlook.com (2603:10b6:5:398::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.11; Mon, 10 Jan 2022 21:23:52 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:9a:cafe::83) by DM5PR19CA0048.outlook.office365.com
 (2603:10b6:3:9a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Mon, 10 Jan 2022 21:23:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Mon, 10 Jan 2022 21:23:52 +0000
Received: from magnus.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 15:23:51 -0600
From: Daniel Phillips <daniel.phillips@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/1] Add hsaKmtAvailableMemory available memory inquiry to
 libhsakmt
Date: Mon, 10 Jan 2022 13:23:28 -0800
Message-ID: <20220110212328.3171408-1-daniel.phillips@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fb15efb-2002-489b-7da7-08d9d47f8025
X-MS-TrafficTypeDiagnostic: DM4PR12MB5261:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB52615426BB1509B975808A97E3509@DM4PR12MB5261.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cLoX4CQuqyKMDtzGxpgEY0rKtIysIvDy166kEjBPK/YZb7Kx/aggFNe3M8pz9JhK97hKqlA4wORxow3+HPh+it8mzTCo7iJ3cgodcm5ih3/eelBW+ny+CEDFgS3l19f4MAZEIc0IYGRhadMRbvuWqr04LTFoOOlr1VRiObmfGwFV0fCIzzF7VVOa44ixMLfuSY1o8gxoiDwh70I+z7mCzPYY/1YK2drJbQCiW65hBFQDP8xrvp0PeSRR3ywNmNRvSxmeHyl+Z7oOfPAhi1SZ4wtNn1jhLpBSkMGWFjrUSkkHHLyJ/iUWeDTg92e9zAbwOo3cgjzuPbfoMoEI/z0xJRj7CSjLsIU0z4XjxKtMmuh7/YjNN9G71HwgmROUxrlw/lonz+rACsA7p39g2W3oS5sOObgX6YtFxVpR9LXHKCS1XiD1yNwxfQXW7N8vgJQWTvGX41ZYo4byMnTbVQA1ODHrXJiecGpV+g2+aI8aqu7jEpYRwt6E+CW7BoPtwDAy2OrG1Ya01pQntyU0DepjQY6e+xbxERThJcdIMxvQ79wOGI0fVrf0PEvFFsVPIM3OkiJ1PqgCtD4uiniMNBhwQtvNdl+hDDR7NA7braj28o81j9ZgNC6Cl3WhoTLMdBu12hL4Bz+yM/f3R6HlQpydNvIscNqMWBPBKapOLnDMGK0N4gDV8qo14YyoUZNl9DkIc9Rgp18NrYjvNLF6kHcNYcP7ePVNOmkDN1mFWmyTXebRvnwwrSIK1xbH3uFLxjAvRzqCkBv61pVAiCjGy1rtInRyf2Ccwb1b2rDMK/3U2Un7YyoNkj2qwfq2oWgWoVShcO+6D6CXRKrzlx7x4o/IzjAjktsnRNL2yesRg/8AFFw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(316002)(450100002)(110136005)(16526019)(36860700001)(186003)(4326008)(81166007)(83380400001)(1076003)(47076005)(36756003)(426003)(44832011)(86362001)(508600001)(2616005)(356005)(336012)(5660300002)(70206006)(2906002)(40460700001)(7696005)(6666004)(8936002)(82310400004)(8676002)(70586007)(26005)(131093003)(145543001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 21:23:52.4730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb15efb-2002-489b-7da7-08d9d47f8025
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5261
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
Cc: Daniel Phillips <daniel.phillips@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a library call to inquire memory available for allocation per
node. Uses the AMDKFD_IOC_AVAILABLE_MEMORY ioctl available in KFD
ioctl version 1.7

Change-Id: Id770fc2261e9e076f2fbce7dcdac640a6354ddbe
---
 include/hsakmt.h          | 11 +++++++++++
 include/linux/kfd_ioctl.h | 18 ++++++++++++++++--
 src/memory.c              | 23 +++++++++++++++++++++++
 3 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/include/hsakmt.h b/include/hsakmt.h
index ff2d023..abc617f 100644
--- a/include/hsakmt.h
+++ b/include/hsakmt.h
@@ -374,6 +374,17 @@ hsaKmtFreeMemory(
     HSAuint64   SizeInBytes         //IN
     );
 
+/**
+  Inquires memory available for allocation as a memory buffer
+*/
+
+HSAKMT_STATUS
+HSAKMTAPI
+hsaKmtAvailableMemory(
+    HSAuint32 Node,
+    HSAuint64 *AvailableBytes
+    );
+
 /**
   Registers with KFD a memory buffer that may be accessed by the GPU
 */
diff --git a/include/linux/kfd_ioctl.h b/include/linux/kfd_ioctl.h
index 039b30b..a81ae37 100644
--- a/include/linux/kfd_ioctl.h
+++ b/include/linux/kfd_ioctl.h
@@ -32,9 +32,10 @@
  * - 1.4 - Indicate new SRAM EDC bit in device properties
  * - 1.5 - Add SVM API
  * - 1.6 - Query clear flags in SVM get_attr API
+ * - 1.7 - Add available_memory ioctl
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 6
+#define KFD_IOCTL_MINOR_VERSION 7
 
 /*
  * Debug revision change log
@@ -761,6 +762,16 @@ struct kfd_ioctl_free_memory_of_gpu_args {
 	__u64 handle;		/* to KFD */
 };
 
+/* Inquire available memory with kfd_ioctl_get_available_memory
+ *
+ * @available: memory available for alloc
+ */
+struct kfd_ioctl_get_available_memory_args {
+	__u64 available;	/* from KFD */
+	__u32 gpu_id;		/* to KFD */
+	__u32 pad;
+};
+
 /* Map memory to one or more GPUs
  *
  * @handle:                memory handle returned by alloc
@@ -1240,8 +1251,11 @@ struct kfd_ioctl_set_xnack_mode_args {
 #define AMDKFD_IOC_SET_XNACK_MODE		\
 		AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)
 
+#define AMDKFD_IOC_AVAILABLE_MEMORY		\
+		AMDKFD_IOR(0x22, struct kfd_ioctl_get_available_memory_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x22
+#define AMDKFD_COMMAND_END		0x23
 
 /* non-upstream ioctls */
 #define AMDKFD_IOC_IPC_IMPORT_HANDLE                                    \
diff --git a/src/memory.c b/src/memory.c
index 6d2a4f4..b2cd759 100644
--- a/src/memory.c
+++ b/src/memory.c
@@ -199,6 +199,29 @@ HSAKMT_STATUS HSAKMTAPI hsaKmtFreeMemory(void *MemoryAddress,
 	return fmm_release(MemoryAddress);
 }
 
+HSAKMT_STATUS HSAKMTAPI hsaKmtAvailableMemory(HSAuint32 Node, HSAuint64 *AvailableBytes)
+{
+	struct kfd_ioctl_get_available_memory_args args = {};
+	HSAKMT_STATUS result;
+
+	CHECK_KFD_OPEN();
+	CHECK_KFD_MINOR_VERSION(7);
+
+	pr_debug("[%s] node %d\n", __func__, Node);
+
+	result = validate_nodeid(Node, &args.gpu_id);
+	if (result != HSAKMT_STATUS_SUCCESS) {
+		pr_err("[%s] invalid node ID: %d\n", __func__, Node);
+		return result;
+	}
+
+	if (kmtIoctl(kfd_fd, AMDKFD_IOC_AVAILABLE_MEMORY, &args))
+		return HSAKMT_STATUS_ERROR;
+
+	*AvailableBytes = args.available;
+	return HSAKMT_STATUS_SUCCESS;
+}
+
 HSAKMT_STATUS HSAKMTAPI hsaKmtRegisterMemory(void *MemoryAddress,
 					     HSAuint64 MemorySizeInBytes)
 {
-- 
2.34.1

