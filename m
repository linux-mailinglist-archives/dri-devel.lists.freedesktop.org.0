Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC5849BEA1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 23:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2FB10E5AE;
	Tue, 25 Jan 2022 22:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD67310E5C1;
 Tue, 25 Jan 2022 22:38:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqgM4CeoJT2KlyGO5JTM+vXBy7xUCkTSUsMyUM73TorCAyDFwOk6HvaG5+F5bxYiToEBLGRGk6TOvcbQz+pu8LLyuQBhKdZUt46Iq38pH9wNxUosMLimuDf66xYWlErivjUT68AEy1Cyragfnv6ze5WlEJzqa3GPJ2sIXTo31w77bNcD7J09qtv2VpNG3om9wwUv5gVGk1QcTqSF5jCI/PmwI3geYC5/Efl72KRa+GC9kxb/r9fZXUtOqDxrXPgCODQi5nAF2hQBNwnOAs9Ahfx4HqwAerqCk8Emibs9AyrbfE99xzFGJS0oU6VU0x9qP12mQTfsrl8r9IGGCfmYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lk+/v5Ru5WVHNwhF49eB/zlLQWIh929hS53FBd/x8jo=;
 b=J5uMu0AFcNwBOwr0nCYiUUnaSqJMDY1nQvKpFoFCDeDFkWGMIMdPzRqxC5Uj5PcXMGo/1Dm7VYq6sYNrR1yzRkbBmeUh7MfHlatYO5Ud0tMjRgXfWI7ppkDtwam+phTfr8i0ZT7YrpAJI92mcpyeWftbnRc/t+1SwJfOJvGODnxQRR9XIrM3kAsQpJP1MjXU9dSZcJ1om9vLxS4A40v9yd5bTW8usEgJlFtUXjBLhGwrqSFOWO+gf2gc2gKkD2ZZoLQGoros+oY2pgb0hqOwPeoG9q4eunH6BVUAynr0JtGFSacuqZufVJH+I4AlFGmOShuQZ/PjfCZCH1Udzh5R8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lk+/v5Ru5WVHNwhF49eB/zlLQWIh929hS53FBd/x8jo=;
 b=hQgt6Dt1kVQCIzCUciI4mPWV35ad7hfOY1OILPdtE+PXq6wXGCEq7CZnVeLswLqmcmTquTg+JFdmLNo8VBHynv477Ur6g86P2QP8yWD+8uUXKWdUQ/vEnVSM9Vso6iH44MbpXRYbFuS6mhucRz0WWmakerU+PC73CGom/+Uia3c=
Received: from DM5PR2001CA0022.namprd20.prod.outlook.com (2603:10b6:4:16::32)
 by BY5PR12MB4933.namprd12.prod.outlook.com (2603:10b6:a03:1d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 22:38:21 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:16:cafe::7e) by DM5PR2001CA0022.outlook.office365.com
 (2603:10b6:4:16::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Tue, 25 Jan 2022 22:38:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 25 Jan 2022 22:38:19 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 25 Jan 2022 16:38:17 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v3 02/12] drm/amdgpu: Move scheduler init to after XGMI is ready
Date: Tue, 25 Jan 2022 17:37:42 -0500
Message-ID: <20220125223752.200211-3-andrey.grodzovsky@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 60e7710c-a2ca-41bf-6d96-08d9e0536311
X-MS-TrafficTypeDiagnostic: BY5PR12MB4933:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB49330178B189C604345E78F0EA5F9@BY5PR12MB4933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gizId0HATbUtVjib76/WsST3HtlgsRH7X+S2YrUf/brMyftoHJxYBUwn1qScf+jdggoLAIK6CKTuBYAdtTUCQbwaQl/i2AGeuSY53AVEekhoaA3Uk8CMAKSfvP6JXu/FSnqcMQuwML+IpFqj+tf/7SYyzy+7rOPqW9yp89lnNQnIs6aIWslL8unLNwoptnjLF8aH+CPx21P+F1WVgr/XMxRm/0GfLkpgYig5UhOy69aKdCJmkujIKuS+UC8W82XrjltG24Z6+vZh/MghE2lT6imPrgxyHJibjaXesOQ3P8FeP/vkgx+x2zsVmJCHJCqFzmdE5V4IgnVQoe0RT6gH4hqtOCrIsO22jbulYMSQdsjtMA66i87iS4vjHd/SmzY4bBucXG98EeuWX0utvMb7/TndnOhQQzz4uC9DY7gyGsEb4za11pQlX1N3TEY90WhAFg3L1voDrE0Tzgl9DvG9AXPeCa7DLVnGxMraI5gaG0lM/gTUM7TA5hzOQctIHKJAE85G4FdFlYmbPoGd9RbYzxbUm1qqcrdoe0lDS+BMvkowk0GUVUSE6cU9X0Ss1QZl47vbhga978gNmS8ZuKzDSlEFmaoHfiGVbYz04Jes4GCnuaWlRpJyyQ8rtGsnFizFg/G1G4bwIOlMDnEhiB6IWpAU+v4yIPeBQKB1b8IbkVNRn3cXnjq5d4g/RQxoKcdHGReN7KxzmIh2bJeYwpyUNklYcj5FnAURpOkoNKXazuND+pZw7rzvRCIVkej22IbchmNQWtoDThqdkAg83jlxzk0oJESPwGRYZNGEyNoq+yA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700004)(70586007)(356005)(508600001)(70206006)(2616005)(54906003)(336012)(81166007)(36756003)(426003)(316002)(1076003)(40460700003)(44832011)(47076005)(86362001)(8936002)(7696005)(110136005)(2906002)(6666004)(4326008)(5660300002)(36860700001)(16526019)(82310400004)(83380400001)(8676002)(186003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 22:38:19.7848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e7710c-a2ca-41bf-6d96-08d9e0536311
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4933
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
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before we initialize schedulers we must know which reset
domain are we in - for single device there iis a single
domain per device and so single wq per device. For XGMI
the reset domain spans the entire XGMI hive and so the
reset wq is per hive.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 45 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 34 ++--------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  2 +
 3 files changed, 51 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 0f3e6c078f88..7c063fd37389 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2284,6 +2284,47 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
 	return r;
 }
 
+static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
+{
+	long timeout;
+	int r, i;
+
+	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
+		struct amdgpu_ring *ring = adev->rings[i];
+
+		/* No need to setup the GPU scheduler for rings that don't need it */
+		if (!ring || ring->no_scheduler)
+			continue;
+
+		switch (ring->funcs->type) {
+		case AMDGPU_RING_TYPE_GFX:
+			timeout = adev->gfx_timeout;
+			break;
+		case AMDGPU_RING_TYPE_COMPUTE:
+			timeout = adev->compute_timeout;
+			break;
+		case AMDGPU_RING_TYPE_SDMA:
+			timeout = adev->sdma_timeout;
+			break;
+		default:
+			timeout = adev->video_timeout;
+			break;
+		}
+
+		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
+				   ring->num_hw_submission, amdgpu_job_hang_limit,
+				   timeout, adev->reset_domain.wq, ring->sched_score, ring->name);
+		if (r) {
+			DRM_ERROR("Failed to create scheduler on ring %s.\n",
+				  ring->name);
+			return r;
+		}
+	}
+
+	return 0;
+}
+
+
 /**
  * amdgpu_device_ip_init - run init for hardware IPs
  *
@@ -2412,6 +2453,10 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 		}
 	}
 
+	r = amdgpu_device_init_schedulers(adev);
+	if (r)
+		goto init_failed;
+
 	/* Don't init kfd if whole hive need to be reset during init */
 	if (!adev->gmc.xgmi.pending_reset)
 		amdgpu_amdkfd_device_init(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 3b7e86ea7167..5527c68c51de 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -456,8 +456,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
 				  atomic_t *sched_score)
 {
 	struct amdgpu_device *adev = ring->adev;
-	long timeout;
-	int r;
 
 	if (!adev)
 		return -EINVAL;
@@ -477,36 +475,12 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
 	spin_lock_init(&ring->fence_drv.lock);
 	ring->fence_drv.fences = kcalloc(num_hw_submission * 2, sizeof(void *),
 					 GFP_KERNEL);
-	if (!ring->fence_drv.fences)
-		return -ENOMEM;
 
-	/* No need to setup the GPU scheduler for rings that don't need it */
-	if (ring->no_scheduler)
-		return 0;
+	ring->num_hw_submission = num_hw_submission;
+	ring->sched_score = sched_score;
 
-	switch (ring->funcs->type) {
-	case AMDGPU_RING_TYPE_GFX:
-		timeout = adev->gfx_timeout;
-		break;
-	case AMDGPU_RING_TYPE_COMPUTE:
-		timeout = adev->compute_timeout;
-		break;
-	case AMDGPU_RING_TYPE_SDMA:
-		timeout = adev->sdma_timeout;
-		break;
-	default:
-		timeout = adev->video_timeout;
-		break;
-	}
-
-	r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
-			   num_hw_submission, amdgpu_job_hang_limit,
-			   timeout, NULL, sched_score, ring->name);
-	if (r) {
-		DRM_ERROR("Failed to create scheduler on ring %s.\n",
-			  ring->name);
-		return r;
-	}
+	if (!ring->fence_drv.fences)
+		return -ENOMEM;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 4d380e79752c..a4b8279e3011 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -253,6 +253,8 @@ struct amdgpu_ring {
 	bool			has_compute_vm_bug;
 	bool			no_scheduler;
 	int			hw_prio;
+	unsigned 		num_hw_submission;
+	atomic_t		*sched_score;
 };
 
 #define amdgpu_ring_parse_cs(r, p, ib) ((r)->funcs->parse_cs((p), (ib)))
-- 
2.25.1

