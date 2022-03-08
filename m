Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D26864D230F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 22:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D885910E32A;
	Tue,  8 Mar 2022 21:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C977110E32A;
 Tue,  8 Mar 2022 21:08:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuVdjUf5/IlH5Xkm7+UMjbL2QMnx/NA19l9PlRJmSaBR7Sn7TCmJNeSiGVWcQVOresgNG4Zww9S/KDSzgSdI6G1gdDHxilOxBm1lcuAHQQzai9ZNPtFyqn2ck4jTLn319oyVlzTyrYCQjN57zVxRbnj2W72dconuqxCfsRaHICQWoM5DM3X0Fj3AeTzw5GUfYuAlQ25toTlbmbjAx9vbRcoQ15J7x8QnJt+WBp4t7A1w/0uMuIpzRgOD6f+99yR5oIylj/qKlvLNF2U+5U0jkr3KVe5/UKsr5mxMk2EaepOBC3VnbY4KdYdknLvRzJdoSQ2qnn3DJLLLplI3OAdh/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYJDLqu18T+btDJibllwwMAkNVTlfPE/86h03rB2fXo=;
 b=OYcWUjVg8DBNGq3ge8ZO1cnMJM3EJQeXgWIUWHUTuy4LORH3oeOMybRvfCC5SxnI0tQWpC9j8ptwGu04Dn1034c1LsN2UQb/VKhv7A9zp9Pw26w5mQebNDw/V7xIF27EkN5UbiV8Ih1WIpKKo74rc/97LIoviCvuhkGBH4Q2VPb/dGuE/o2hzw3J/jp//P0rWLl7xti/89cSwUXVFc2bqmTSgeP0aVPFip9rVR9F2laSeRwLSrfmhLFUUpu31HiRqsnvwpBVGqjMCnLA1KzRFLkfZ9GCd7oKcFm4BeuzHRmL9mDAnZVRJTw2aKRgqsF+cWVIzMXfqvAGVVek0VQYLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYJDLqu18T+btDJibllwwMAkNVTlfPE/86h03rB2fXo=;
 b=xNNOMivxuhpXG9TKohJy6Z/qS9+CXgBM/B1JOTClWb+NTegWgr8ooEAn/u18whVLp2hn+4K8FDod1a3qxNOY2aKQRZjz1HPkS++M47FP/h2nxZS2TTc0TrQBSZs43uoldg0pMZeBi7ftekNjQNJbdczBjXI5hy62RZL8G2sVJvs=
Received: from DS7PR06CA0042.namprd06.prod.outlook.com (2603:10b6:8:54::23) by
 BN8PR12MB3106.namprd12.prod.outlook.com (2603:10b6:408:45::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Tue, 8 Mar 2022 21:08:32 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::5d) by DS7PR06CA0042.outlook.office365.com
 (2603:10b6:8:54::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 21:08:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 21:08:32 +0000
Received: from dayatsin-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 15:08:30 -0600
From: David Yat Sin <david.yatsin@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm/amdkfd: CRIU export dmabuf handles for GTT BOs
Date: Tue, 8 Mar 2022 16:08:18 -0500
Message-ID: <20220308210818.2864-1-david.yatsin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cf7f563-51e6-4cde-f941-08da0147cd37
X-MS-TrafficTypeDiagnostic: BN8PR12MB3106:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3106406854F1032E0112D5CD95099@BN8PR12MB3106.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YrWU6bGVLBEHi02qoKoGnguRXfpYCFKRAbApJg5iMHkThPauWCl5A6NSyMn4L606tcms83znYkxQN6oJ3usrHJrxoetW5548Z2aT0eVZtLmi5nXV535GKg4xgBinOJ46UJ0tVX6kKePjbderOjHGtv3C8ZAV+LnMNuvqY+PUV4jd50wOf+ffAMu+sktsKDF4tSh6UNumGjqz6IWlpGHLvpnaPU3nYPrA7D2Nq1VV0k8oeRGcT2IZrgVmKjvBY7vAkK3fGSljbHgRWL/F7xi1XYVOr2lGKngBCJr2oM4UHNDA7TkNf2c9nrHRaWA+Je/cD31/Nq/uobdbyfAcdsDPsU8J3SOwqWZIUsgMc9ogt8fqd7MDUbHlx5F+9mH8cLQIdq11Y0mP/k9hz00ogFx94WQ4pDN+wVafQTib7gQulTkHBtDFGgBDmStx4qb2+pBYL8JOvbNsPQ3x0+E1Ut96X/0I2QXbPu+9w4KH2wkx06dz5tffEOVkjmpo+BUKJSEZPGThnyGBtuptF+aVP/3cUlPgIkDO2C6oxiDyI/14K9O6DIC7k9hZH2qBFfyHoqWK+s8dUhKxhCtxU99BKnF8fg6p8BuCyFmsNeraDLqUxaLVIh6gWKM2rA0b/HRxkB3vj95xe1L/z0e7y+pEenUvFHaLLrT7Y9lu5nFueKw3A/HL7Ii8IG/9E6LPUM8GcQ9c+4oWBiCPMvPiCTQpi2z2Cw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(356005)(86362001)(82310400004)(81166007)(47076005)(336012)(426003)(83380400001)(40460700003)(1076003)(26005)(186003)(16526019)(70586007)(4326008)(8676002)(2616005)(70206006)(36860700001)(316002)(450100002)(2906002)(36756003)(8936002)(5660300002)(6666004)(7696005)(54906003)(508600001)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 21:08:32.2556 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf7f563-51e6-4cde-f941-08da0147cd37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3106
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

Export dmabuf handles for GTT BOs so that their contents can be accessed
using SDMA during checkpoint/restore.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 12 ++++++++----
 include/uapi/linux/kfd_ioctl.h           |  3 ++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 2c7d76e67ddb..e1e2362841f8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1759,7 +1759,8 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 					goto exit;
 				}
 			}
-			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
+			if (bo_bucket->alloc_flags
+			    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT)) {
 				ret = criu_get_prime_handle(&dumper_bo->tbo.base,
 						bo_bucket->alloc_flags &
 						KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ? DRM_RDWR : 0,
@@ -1812,7 +1813,8 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 
 exit:
 	while (ret && bo_index--) {
-		if (bo_buckets[bo_index].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
+		if (bo_buckets[bo_index].alloc_flags
+		    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT))
 			close_fd(bo_buckets[bo_index].dmabuf_fd);
 	}
 
@@ -2211,7 +2213,8 @@ static int criu_restore_bo(struct kfd_process *p,
 
 	pr_debug("map memory was successful for the BO\n");
 	/* create the dmabuf object and export the bo */
-	if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
+	if (bo_bucket->alloc_flags
+	    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT)) {
 		ret = criu_get_prime_handle(&kgd_mem->bo->tbo.base, DRM_RDWR,
 					    &bo_bucket->dmabuf_fd);
 		if (ret)
@@ -2281,7 +2284,8 @@ static int criu_restore_bos(struct kfd_process *p,
 
 exit:
 	while (ret && i--) {
-		if (bo_buckets[i].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
+		if (bo_buckets[i].alloc_flags
+		   & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT))
 			close_fd(bo_buckets[i].dmabuf_fd);
 	}
 	kvfree(bo_buckets);
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index b40687bf1014..eb9ff85f8556 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -33,9 +33,10 @@
  * - 1.5 - Add SVM API
  * - 1.6 - Query clear flags in SVM get_attr API
  * - 1.7 - Checkpoint Restore (CRIU) API
+ * - 1.8 - CRIU - Support for SDMA transfers with GTT BOs
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 7
+#define KFD_IOCTL_MINOR_VERSION 8
 
 struct kfd_ioctl_get_version_args {
 	__u32 major_version;	/* from KFD */
-- 
2.17.1

