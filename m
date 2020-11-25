Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B35A92C378B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 04:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DBA6E821;
	Wed, 25 Nov 2020 03:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCAB6E7F5;
 Wed, 25 Nov 2020 03:17:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cH4yKgiPrD/nCBCCZwGVlBxQIf/uU6rxgGGdvZPpnPzi2aoaPziZlzefUGoANTPEXr/pv/tJlCxTq2aOdctx2oq5cYcHCNYxRkqsbLKsTpXKmiWzZFHaKatkehMmWAuQRmJqG99+GgJIAmQ7KdbloC7a40uin4Bxc3L6/TcabwC66yR3GQ/4baTJbmPsANH3WCWwqCPlY38QR1PELFw3f5OUouKXndq+/d7L/lvTgnjEu9keYO8++eZSNKdUoTotC1GGScGBQzVYyyJwl1iJDDtwfOeVAhmM6a8sKMZTUOKPCh7P3WN61IUmdhfusR82WYmIYzgkpPYS7HoEFxSSSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdeKdKNlTD4dXgnHydLoGATCWS06729/VdPxAYfuwZY=;
 b=Akkqlx57MaJZb5Q1vaaDHIMtiiv9OZYUljs92gaWJqPWJ/Dglebn0q3OJPfczNoVa/rP6zD1R+6+yxVq0UZ602DM5GlwaHu165cvQEIeUMdgu5zCErR+koxTaS9QvXSEyfTN49L2MWXS0hTzxmEFmioP9uw0MvA0VjtSVeHlu/Y8LuSc8Y9LpVJmIX7iiPEqASTYSP8Qx883J6Olq4WkDxXDpXr+CfEsJ1YgyRlu8211MceTIMSaAnqXXzyT+M+wjAYwz7UVHeBM2qRXykWyKO1+cMtNXibcC5pWQwAVW0J1o3Da58YROqkh87m3rNN5//06aTkZsVOOa5TTy3rkfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdeKdKNlTD4dXgnHydLoGATCWS06729/VdPxAYfuwZY=;
 b=glYqNvlsSvpZyI6Zyf00txGKFV5dk5zBgSB0o6rGMVKoifHZe4IGFh7bVDysMch+QHEQ9VrFNId6IG9WIYN66d9eH19cclIji1Q8Z1y+FMPtMp8nmmoO0Apcu0J2YBEpleWNRLKJEkyrhE7f/NjLoO1n/6pyTiHPuq4lHTDV5f8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR1201MB2507.namprd12.prod.outlook.com (2603:10b6:3:e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Wed, 25 Nov
 2020 03:17:24 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3589.031; Wed, 25 Nov 2020
 03:17:24 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
Subject: [PATCH 3/6] drm/scheduler: Job timeout handler returns status
Date: Tue, 24 Nov 2020 22:17:05 -0500
Message-Id: <20201125031708.6433-4-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.29.2.154.g7f7ebe054a
In-Reply-To: <20201125031708.6433-1-luben.tuikov@amd.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
 <20201125031708.6433-1-luben.tuikov@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: CH2PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:610:59::36) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 CH2PR03CA0026.namprd03.prod.outlook.com (2603:10b6:610:59::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 03:17:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 31d15c60-29a0-4791-ce21-08d890f0a0e9
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2507B1BB484AF8762D3805BF99FA0@DM5PR1201MB2507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YzE2dp6JiLgV02bn0uX6vOJ+LzzZYU28kJlIG4CXsqYZ0lasKvs9sbAoE15zfxLpi95xXs1p+gJot0MkOCmMwITR3sZ/eAiT+ifxAP9nS+PxeS/cJhOldnHQ8dIPi2lR2EPomXpyiitbohZQrsvJdWJ/uTbIwoQ1pd2CbCvxjKWO/6w846V8MthrdD+Wr09UYhI5Watb4IyIn+up4mdXv0XzErvJ2a4eKtLXX/ywBRw/8xx4s4Sa4GrOSEQ4avNNywfZLyqlCaafQ7DwiR8eLgr5w3wQr/oqzUZsthFrh6tzpSh3L1cKHHtgYgKXLqC5hnddT+I+HhbFN8vUBz1SFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(7696005)(6486002)(54906003)(478600001)(26005)(52116002)(8936002)(83380400001)(8676002)(86362001)(2616005)(6636002)(5660300002)(956004)(1076003)(4326008)(2906002)(44832011)(186003)(66946007)(110136005)(316002)(36756003)(66476007)(16526019)(6666004)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: urGw28RAHVM8hkDJqMTTprLXcEPRcs8jz3n1Xsn1/UwEO8Hxe2s5cOcRBrjRtxeqyhwnR93D4wpz3lu9dzegJ96FRC/UHwXYQkai5nn7ILm1nfOKuLgyLIIGFPcjvuU+l7zp11tPw3huL6kHPQI6Da2/+xneiiomdYXaEuNbT08Q0iXkdu0f06GdhPY5YTZFYuNCYMPFbHotKmB5/92AsSXzpRIsrFIFF6aQ+BMG73x9yeQYIHxPzYcp9UUtKq+KN2ShphYnqY87sbyJ/IARU1e1Sg6261GEW1idMcw30SOW5lEET+9vmby6w/eUD/Ph00p4L/S/3fARc3uK1OvWJLIYYjP1U2bjM+bRmr7hw1C+boFZJOe0H+Fk7Kh59RMniIm8zOdZHXqLBOB7o252jBsQxFqxfne1v5Eb1Am4CYE027hVlM0F+pJNVywlsLcBXLCuuHuO5DKF2Wy7l1c0oXsgFlf3T5eTSFF1TW30Ljyq93CRea32OzNoOtE3qHqKe8ABGqKA0TNDPVH73eE5acrXfJuqQkdm8oRFpVwQN/CLxBBiXFMOAdQ3WpAMJ/f0Tg/rpHVdFDm4U/khwA0BYbHro14mvJtIg/pmYU1/BYHtKWSUrujIbP8NJikM9+ib2In+24KiNANXyT7MveZx3Cy2AmBTLUJrdu8JuyAurOTd72e0PqzwFm/VdgCx5EGDbPQ3nNhUcwzBCMMA3c/ZGLDGr/xmoerjiQgKuOCQc2DzO4F3cPeBQ+k3UYp8hBadU+U/g8f4g0gAHo7jX0q+3dV6Uv0MA+0j92oH1mysRDuGqxFS5ygphMOZbBffLUKW+fNafoR6httfRWN4z/EV97ar74DWjZfjDRYhvXx7HUcOZ9jC3A2jJdU0wzymz8+VNydydbQHpV1HZpP5y7G9eA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d15c60-29a0-4791-ce21-08d890f0a0e9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 03:17:24.0522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYClcIWeA36mMrAdDkGbkXcPE4IZQnb82SHB28asrotCSp44t7Z/Jv+BA3/fLnRd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2507
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
Cc: Emily Deng <Emily.Deng@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The job timeout handler now returns status
indicating back to the DRM layer whether the job
was successfully cancelled or whether more time
should be given to the job to complete.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  6 ++++--
 include/drm/gpu_scheduler.h             | 13 ++++++++++---
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index ff48101bab55..81b73790ecc6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -28,7 +28,7 @@
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 
-static void amdgpu_job_timedout(struct drm_sched_job *s_job)
+static int amdgpu_job_timedout(struct drm_sched_job *s_job)
 {
 	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
@@ -41,7 +41,7 @@ static void amdgpu_job_timedout(struct drm_sched_job *s_job)
 	    amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
 		DRM_ERROR("ring %s timeout, but soft recovered\n",
 			  s_job->sched->name);
-		return;
+		return 0;
 	}
 
 	amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
@@ -53,10 +53,12 @@ static void amdgpu_job_timedout(struct drm_sched_job *s_job)
 
 	if (amdgpu_device_should_recover_gpu(ring->adev)) {
 		amdgpu_device_gpu_recover(ring->adev, job);
+		return 0;
 	} else {
 		drm_sched_suspend_timeout(&ring->sched);
 		if (amdgpu_sriov_vf(adev))
 			adev->virt.tdr_debug = true;
+		return 1;
 	}
 }
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 2e0c368e19f6..61f7121e1c19 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -230,10 +230,17 @@ struct drm_sched_backend_ops {
 	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
 
 	/**
-         * @timedout_job: Called when a job has taken too long to execute,
-         * to trigger GPU recovery.
+	 * @timedout_job: Called when a job has taken too long to execute,
+	 * to trigger GPU recovery.
+	 *
+	 * Return 0, if the job has been aborted successfully and will
+	 * never be heard of from the device. Return non-zero if the
+	 * job wasn't able to be aborted, i.e. if more time should be
+	 * given to this job. The result is not "bool" as this
+	 * function is not a predicate, although its result may seem
+	 * as one.
 	 */
-	void (*timedout_job)(struct drm_sched_job *sched_job);
+	int (*timedout_job)(struct drm_sched_job *sched_job);
 
 	/**
          * @free_job: Called once the job's finished fence has been signaled
-- 
2.29.2.154.g7f7ebe054a

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
