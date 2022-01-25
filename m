Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEE249BEA4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 23:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED30310E5C8;
	Tue, 25 Jan 2022 22:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1204610E5C8;
 Tue, 25 Jan 2022 22:38:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckXZy6hIulgGi4VJHHPO/q4BF1ATYMbuyFS21v6PIxiCw4u1xVu3lTK/lQGb8ccSUmNlZpQ13fU36V6ILHrJud4EeBHUAY5HyvQgAWPUZFvi+E+lXRtMKlfUi24oYCeDh8BytRl4Z/f6QLf0iz874lB8FWKypUmMampXwntmONGKNwyp3XUJmkCBAM7r/ZDp8Lo9Rl3HD4ZAGwjGWcPo/hxZ0VC2+JsY1FrQKiciXMVdL7rnQseqBrNe0n5Ux5ZmGylyJWTOlzwRb1pB3l/nFefCVwC/BhB3AHDABqZh8vPHoRq70rQqRjTaVRktjdRHhcX+DMhLDHnUYnEobKkrEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXPHRz93dMIbfZthT6QahT88P9RqNy3wVpD2fnD1Fzg=;
 b=UmQFb2a9196rtGxulK3I5Mu/wuGPmL8+f46LjEOinOlAmbr3/JhAXks6s4lu4DPRUNggVygrKc1Wq3xmRZHrKs/dCFlN02H9IPkLY5b6aaVnciFUyxe0tBmvUkS2g6/tk4v55S3b+CBLzcYb8sasbNdM1xBkgq9yv5nV12nWlzR+Gn0tRxJohMQ0jog3pz9Hhg+TDkv/a5fiOPBWe+2CE/AnnT6TCuG1y7arHDok94iFCs3TNG9/YgXE3OfhlQWRITwkvAWg8XJq0SIKZ2nj15ty7IEXP4zbMbRcxvFR5nMrCADPVaU18UX6TblADycMC18Ph30c85Vx4AlMpH47bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXPHRz93dMIbfZthT6QahT88P9RqNy3wVpD2fnD1Fzg=;
 b=PWe9Pe5ayu94Oz/ZSKxz6/XRlIBn1r/Xy1sPrtjgFNXTD2/hjUyiDYLD7Tj8BsOxU62TWxeU590Xz77fxHdTOxxH0uZ9IO46uSoKDAlmmfjam32wd1iT0U+IhrKIH4xsopStBZdsCD9QtlWSfnMvyWH8rGUy6zHCClPXh+6Vhn8=
Received: from DM3PR03CA0014.namprd03.prod.outlook.com (2603:10b6:0:50::24) by
 BY5PR12MB3747.namprd12.prod.outlook.com (2603:10b6:a03:1ac::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 25 Jan
 2022 22:38:25 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:50:cafe::80) by DM3PR03CA0014.outlook.office365.com
 (2603:10b6:0:50::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Tue, 25 Jan 2022 22:38:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Tue, 25 Jan 2022 22:38:24 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 25 Jan 2022 16:38:22 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v3 05/12] drm/amd/virt: For SRIOV send GPU reset directly to TDR
 queue.
Date: Tue, 25 Jan 2022 17:37:45 -0500
Message-ID: <20220125223752.200211-6-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a585500b-5797-4afd-10f0-08d9e05365c4
X-MS-TrafficTypeDiagnostic: BY5PR12MB3747:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3747ACF877F3E7CC681869D3EA5F9@BY5PR12MB3747.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kf742XcC1KglmzIjfFnpuNt64EMtWj946G8zwfS6HH3XkU9q8VUzLCzTbhDJZQMoUe3NnSVpWJ4/vTFSZSOZ/xE/XTe5P72B7FCUyrCQ2dkbzlNrOaVapco9CHv1Hu4imiFmXdqZvNNmFotKmd1FzsOhvLgBdsonubnzVFzYtRpjp+xeKqvKz+1kYZWLk8mb1w9rvpYVnhPDP6Cdzb9QKd921gswfBs2DRPBWHtLi98+45LUv3KuEhBuqZfR+e9RpgXQxyCj/vio850lLW1RiYYPW/4e4Tzo0d3MhcA+mdyoLMCKrSHI3zY2h1kIn3KeRjjkyfYONI4aZ67wMIJ9BA1R2czkcfjCbCl7She4l/xhRulZytO2iCCGOu0M7jgyuJmXpkLpaomrDE0Vj+8EHoTFlF18dAeS6EWPN5WCPXFAZBQqkG1W+2T7Qhg3n9msuZ4e4hwc6effFrLN3QIvgNeMtHFl6ogMZpLbwTbyePuijrW6k8+uXG94N4MurN+Y+zq4VCw454iujtGxJHfGvPAgXXql6FSHtb3tvISNzvTnPSDfyAfhGfiSSOJG6+z5pONudZ/3g/TpdVbb0gXDgDZU7cHj9RzkfWP0+ZPuiOUF4XnG5hIY209/ewAjTDRWQy0iVWAQnd5t8ZQH/5rJ98YisBkVVMVSF3qJIoXnHdRYR5rD6wMq07zQUepmyeqQU9kx4a2pZBIcM4jXyVucySru0lQQlZNrEJuA6iixlDRtFJpI9yUPAeAGg2I6+TQuN4y48NfFATtAHvCnwhlQ2KyUgvk6gUuojDYfi6jBOYg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700004)(36840700001)(46966006)(356005)(426003)(83380400001)(86362001)(81166007)(1076003)(70586007)(54906003)(4326008)(336012)(70206006)(508600001)(40460700003)(47076005)(7696005)(36860700001)(44832011)(2906002)(6666004)(2616005)(26005)(8676002)(8936002)(316002)(5660300002)(36756003)(82310400004)(186003)(110136005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 22:38:24.3110 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a585500b-5797-4afd-10f0-08d9e05365c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3747
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com, Liu Shaoyun <Shaoyun.Liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No need to to trigger another work queue inside the work queue.

v3:

Problem:
Extra reset caused by host side FLR notification
following guest side triggered reset.
Fix: Preven qeuing flr_work from mailbox irq if guest
already executing a reset.

Suggested-by: Liu Shaoyun <Shaoyun.Liu@amd.com>
Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 9 ++++++---
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 9 ++++++---
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 9 ++++++---
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
index 23b066bcffb2..b2b40e169342 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -276,7 +276,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 	if (amdgpu_device_should_recover_gpu(adev)
 		&& (!amdgpu_device_has_job_running(adev) ||
 		adev->sdma_timeout == MAX_SCHEDULE_TIMEOUT))
-		amdgpu_device_gpu_recover(adev, NULL);
+		amdgpu_device_gpu_recover_imp(adev, NULL);
 }
 
 static int xgpu_ai_set_mailbox_rcv_irq(struct amdgpu_device *adev,
@@ -301,8 +301,11 @@ static int xgpu_ai_mailbox_rcv_irq(struct amdgpu_device *adev,
 
 	switch (event) {
 		case IDH_FLR_NOTIFICATION:
-		if (amdgpu_sriov_runtime(adev))
-			schedule_work(&adev->virt.flr_work);
+		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
+			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+					      &adev->virt.flr_work),
+				  "Failed to queue work! at %s",
+				  __func__);
 		break;
 		case IDH_QUERY_ALIVE:
 			xgpu_ai_mailbox_send_ack(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index a35e6d87e537..08411924150d 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -308,7 +308,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 		adev->gfx_timeout == MAX_SCHEDULE_TIMEOUT ||
 		adev->compute_timeout == MAX_SCHEDULE_TIMEOUT ||
 		adev->video_timeout == MAX_SCHEDULE_TIMEOUT))
-		amdgpu_device_gpu_recover(adev, NULL);
+		amdgpu_device_gpu_recover_imp(adev, NULL);
 }
 
 static int xgpu_nv_set_mailbox_rcv_irq(struct amdgpu_device *adev,
@@ -336,8 +336,11 @@ static int xgpu_nv_mailbox_rcv_irq(struct amdgpu_device *adev,
 
 	switch (event) {
 	case IDH_FLR_NOTIFICATION:
-		if (amdgpu_sriov_runtime(adev))
-			schedule_work(&adev->virt.flr_work);
+		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
+			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+					      &adev->virt.flr_work),
+				  "Failed to queue work! at %s",
+				  __func__);
 		break;
 		/* READY_TO_ACCESS_GPU is fetched by kernel polling, IRQ can ignore
 		 * it byfar since that polling thread will handle it,
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
index aef9d059ae52..02290febfcf4 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
@@ -521,7 +521,7 @@ static void xgpu_vi_mailbox_flr_work(struct work_struct *work)
 
 	/* Trigger recovery due to world switch failure */
 	if (amdgpu_device_should_recover_gpu(adev))
-		amdgpu_device_gpu_recover(adev, NULL);
+		amdgpu_device_gpu_recover_imp(adev, NULL);
 }
 
 static int xgpu_vi_set_mailbox_rcv_irq(struct amdgpu_device *adev,
@@ -550,8 +550,11 @@ static int xgpu_vi_mailbox_rcv_irq(struct amdgpu_device *adev,
 		r = xgpu_vi_mailbox_rcv_msg(adev, IDH_FLR_NOTIFICATION);
 
 		/* only handle FLR_NOTIFY now */
-		if (!r)
-			schedule_work(&adev->virt.flr_work);
+		if (!r && !amdgpu_in_reset(adev))
+			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+					      &adev->virt.flr_work),
+				  "Failed to queue work! at %s",
+				  __func__);
 	}
 
 	return 0;
-- 
2.25.1

