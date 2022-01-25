Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D15B649BEA6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 23:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927BA10E5D6;
	Tue, 25 Jan 2022 22:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4986710E5C6;
 Tue, 25 Jan 2022 22:38:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBUshsDTePQLh2J1MNiYsnYC2ipwOGhGxDKDJRNsKk4X0TeLHErpfN6yyIasCDO6ocL51MVtW3VyMjSw3RGQbZt+Jxtq5RWCt79A6Ug9wFVYn5a544I8udAMkR7cLbdsE1RdsZx/BxGvLWSdoBVONaNDIWH5Y6F75lVIqqNUKJn4qZ6apggjQdjDgNklro59zNi6CdFt1W3HQDjuJV21+b8nJ0FscCPywDZDJjGzDxFf8VGxV7985AiB4Fi5VfvYNlb9hXDa+IMRwrYkv4sgE5nRRdLN8ZTLgPSOraWxcGOfIInGibi5ipe1r7BV1DSQZP/JgN7PQ8C4/9b4l60UvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tk0lmiHnwhXobIoL+v78mNejaKAHB5ZSYteesuwgxwM=;
 b=B3rJn0zJw1fpj6Y+f3EYrIGJ3jPjXVQ+TzSYcgfoA6fD8txjvsZ+byPXqFKDC6Glx5gl22EUbyOJhDRad/HrcnQpaqQRbGsQdYidC7Z4g4vfkuaUjsImMnxfenk/qWqprS0xHqUbdsA36J7NSPHw/wniaAxF/4Nr6FlN15KZKYroZPLZr0DPU6PhXPD2xGABMIQOBKNU6xflnXPmqs/ZPgnSm//m0CQZPZMKw8z9H1XSUj7I2IIx2hoLKFUIN2c3db3iMlrE8KcegDbtl1jOAKbijkPfhEHhZ95M56+E96tBsuG15xbKUT3JHyzwf+WQhUUcYCQMrW0Vmdwzq3rlLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk0lmiHnwhXobIoL+v78mNejaKAHB5ZSYteesuwgxwM=;
 b=bRgJYdDvmhK+HlLV3Wnybru7r/2Z69au7gHG3tATd5Ru9CKeMuTBIRzjDQJ2OpmxlXx+kpZYr2ylXwoYWY8GQ0LRZLWKH80urU709F2uuDJBi1o0xdMXDbjfuydE2rPNa8YhPbALtshYxWlwEhccLYW6FUeilKbEsvREYwKskqU=
Received: from DM5PR21CA0037.namprd21.prod.outlook.com (2603:10b6:3:ed::23) by
 CH2PR12MB3686.namprd12.prod.outlook.com (2603:10b6:610:23::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.8; Tue, 25 Jan 2022 22:38:30 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ed:cafe::7) by DM5PR21CA0037.outlook.office365.com
 (2603:10b6:3:ed::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.4 via Frontend
 Transport; Tue, 25 Jan 2022 22:38:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 25 Jan 2022 22:38:29 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 25 Jan 2022 16:38:27 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v3 08/12] drm/amdgpu: Rework reset domain to be refcounted.
Date: Tue, 25 Jan 2022 17:37:48 -0500
Message-ID: <20220125223752.200211-9-andrey.grodzovsky@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: bea94110-323c-4608-5533-08d9e05368f2
X-MS-TrafficTypeDiagnostic: CH2PR12MB3686:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3686F1C4A3CC6F3B35548A1EEA5F9@CH2PR12MB3686.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1H2ihwTnyXcp/fe+VgJ034e2KUJHOdpF4Kf+gHGKs5dzQ+FWHwBt9+5nk529lws4+kT2Cn2ghw4lHPVnqp0asjlrWTqE6R+yQ1A1x/jJGLkXLE3bBl3zW8mFY5a35QBg42rLmOpPsjg15eUyzR2N7klNeAirSWuYQUT7kyKgFBfI3QJAhZ5URxfCKyRFlBXDfFjlhFGsT+/wnOzumcyLV+TZrK+irQXXFcYbZgDT/K2AZR2sw//5MyjVQpvv0NFS7iYSpC3RUyx5ZcC1eYkWE02HC9L1MDd2d8cwNzJyQgEWY64ubSC35lWknoP3UvRKDKI9eTdhYZjXXtAFv1MrWQa7JdU050/PuNqX/1lMpzYrNpsYiun4izNbaxPe4ZnTMgaQ6Yh8vKYw4dT2wbEOZsMlbUaaxwdtV8ArcKSWDVoGUJ7TtA73Bq3iY6NcmbHw9XPUFI4L/eyjL4QHb6d5VEOpQoWKXnhsX8CbEgXvi4R9Tfzb9V29pIrtXXj+kq3aw59VpBfcljV4MlRPk2RxuUSEI9Nn9MixApn1hExmzi0PArjfAFZXi4Y0LL7C1mKryDBilxh/DIvLFra8R5E8jWO2mOxnxWDsj/38M1j0pihlMFumwN7hEVpA3YOZ+Q7Qec038GQb98eM6FfZG669UDbFy11YxgfrkLLWs/eN2tBzQFWxpgHoWdOxVRfKxgHx5F9vUjp1Q64RmF1lSal0cKZ1TUJORqv0rjzf5rGumAYpVI+q6AbSWxH9Z1sjIDAiYDAdD30mDMZL90JpfC1zwaJDZD/ftzt3f1S40zQ/Db9fiq3yMYouEUTaF4JdqS4ljYagMqRdRIEcBIiVs/XSBBxuDGpUDHoVQRHlbwlAyf8kKFVevwdLhphG2HVMKEwQ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700004)(46966006)(36840700001)(47076005)(336012)(36860700001)(966005)(426003)(40460700003)(70206006)(70586007)(6666004)(8676002)(186003)(26005)(110136005)(83380400001)(4326008)(7696005)(5660300002)(44832011)(30864003)(1076003)(81166007)(82310400004)(2616005)(54906003)(508600001)(316002)(2906002)(8936002)(36756003)(16526019)(86362001)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 22:38:29.6161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bea94110-323c-4608-5533-08d9e05368f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3686
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

The reset domain contains register access semaphor
now and so needs to be present as long as each device
in a hive needs it and so it cannot be binded to XGMI
hive life cycle.
Adress this by making reset domain refcounted and pointed
by each member of the hive and the hive itself.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 44 +++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 36 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  | 10 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   | 26 ++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c      |  4 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c      |  4 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c      |  4 +-
 9 files changed, 105 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 8e96b9a14452..f2ba460bfd59 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -813,9 +813,7 @@ struct amd_powerplay {
 #define AMDGPU_RESET_MAGIC_NUM 64
 #define AMDGPU_MAX_DF_PERFMONS 4
 
-struct amdgpu_reset_domain {
-	struct workqueue_struct *wq;
-};
+struct amdgpu_reset_domain;
 
 struct amdgpu_device {
 	struct device			*dev;
@@ -1102,7 +1100,7 @@ struct amdgpu_device {
 	struct amdgpu_reset_control     *reset_cntl;
 	uint32_t                        ip_versions[HW_ID_MAX][HWIP_MAX_INSTANCE];
 
-	struct amdgpu_reset_domain	reset_domain;
+	struct amdgpu_reset_domain	*reset_domain;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index fef952ca8db5..b24829096359 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2313,7 +2313,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 
 		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
 				   ring->num_hw_submission, amdgpu_job_hang_limit,
-				   timeout, adev->reset_domain.wq, ring->sched_score, ring->name);
+				   timeout, adev->reset_domain->wq, ring->sched_score, ring->name);
 		if (r) {
 			DRM_ERROR("Failed to create scheduler on ring %s.\n",
 				  ring->name);
@@ -2432,24 +2432,22 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	if (r)
 		goto init_failed;
 
+	/**
+	 * In case of XGMI grab extra reference for reset domain for this device
+	 */
 	if (adev->gmc.xgmi.num_physical_nodes > 1) {
-		struct amdgpu_hive_info *hive;
-
-		amdgpu_xgmi_add_device(adev);
+		if (amdgpu_xgmi_add_device(adev) == 0) {
+			struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev);
 
-		hive = amdgpu_get_xgmi_hive(adev);
-		if (!hive || !hive->reset_domain.wq) {
-			DRM_ERROR("Failed to obtain reset domain info for XGMI hive:%llx", hive->hive_id);
-			r = -EINVAL;
-			goto init_failed;
-		}
+			if (!hive->reset_domain ||
+			    !kref_get_unless_zero(&hive->reset_domain->refcount)) {
+				r = -ENOENT;
+				goto init_failed;
+			}
 
-		adev->reset_domain.wq = hive->reset_domain.wq;
-	} else {
-		adev->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-dev", 0);
-		if (!adev->reset_domain.wq) {
-			r = -ENOMEM;
-			goto init_failed;
+			/* Drop the early temporary reset domain we created for device */
+			kref_put(&adev->reset_domain->refcount, amdgpu_reset_destroy_reset_domain);
+			adev->reset_domain = hive->reset_domain;
 		}
 	}
 
@@ -3599,6 +3597,15 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 		return r;
 	}
 
+	/*
+	 * Reset domain needs to be present early, before XGMI hive discovered
+	 * (if any) and intitialized to use reset sem and in_gpu reset flag
+	 * early on during init.
+	 */
+	adev->reset_domain = amdgpu_reset_create_reset_domain("amdgpu-reset-dev");
+	if (!adev->reset_domain)
+		return -ENOMEM;
+
 	/* early init functions */
 	r = amdgpu_device_ip_early_init(adev);
 	if (r)
@@ -3949,6 +3956,9 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 	if (adev->mman.discovery_bin)
 		amdgpu_discovery_fini(adev);
 
+	kref_put(&adev->reset_domain->refcount, amdgpu_reset_destroy_reset_domain);
+	adev->reset_domain = NULL;
+
 	kfree(adev->pci_state);
 
 }
@@ -5186,7 +5196,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 
 	INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
 
-	if (!queue_work(adev->reset_domain.wq, &work.base))
+	if (!queue_work(adev->reset_domain->wq, &work.base))
 		return -EAGAIN;
 
 	flush_work(&work.base);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index 02afd4115675..f2d310cd8d40 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -96,3 +96,39 @@ int amdgpu_reset_perform_reset(struct amdgpu_device *adev,
 	return reset_handler->restore_hwcontext(adev->reset_cntl,
 						reset_context);
 }
+
+
+void amdgpu_reset_destroy_reset_domain(struct kref *ref)
+{
+	struct amdgpu_reset_domain *reset_domain = container_of(ref,
+								struct amdgpu_reset_domain,
+								refcount);
+	destroy_workqueue(reset_domain->wq);
+	kvfree(reset_domain);
+}
+
+struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(char *wq_name)
+{
+	struct amdgpu_reset_domain *reset_domain;
+
+	reset_domain = kvzalloc(sizeof(struct amdgpu_reset_domain), GFP_KERNEL);
+	if (!reset_domain) {
+		DRM_ERROR("Failed to allocate amdgpu_reset_domain!");
+		return NULL;
+	}
+
+	kref_init(&reset_domain->refcount);
+
+	reset_domain->wq = create_singlethread_workqueue(wq_name);
+	if (!reset_domain->wq) {
+		DRM_ERROR("Failed to allocate wq for amdgpu_reset_domain!");
+		kref_put(&reset_domain->refcount, amdgpu_reset_destroy_reset_domain);
+		return NULL;
+
+	}
+
+	return reset_domain;
+}
+
+
+
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
index e00d38d9160a..cd030e63e4c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
@@ -70,6 +70,12 @@ struct amdgpu_reset_control {
 	void (*async_reset)(struct work_struct *work);
 };
 
+struct amdgpu_reset_domain {
+	struct kref refcount;
+	struct workqueue_struct *wq;
+};
+
+
 int amdgpu_reset_init(struct amdgpu_device *adev);
 int amdgpu_reset_fini(struct amdgpu_device *adev);
 
@@ -82,4 +88,8 @@ int amdgpu_reset_perform_reset(struct amdgpu_device *adev,
 int amdgpu_reset_add_handler(struct amdgpu_reset_control *reset_ctl,
 			     struct amdgpu_reset_handler *handler);
 
+struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(char *wq_name);
+
+void amdgpu_reset_destroy_reset_domain(struct kref *ref);
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 9ad742039ac9..5908a3f8208a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -32,6 +32,8 @@
 #include "wafl/wafl2_4_0_0_smn.h"
 #include "wafl/wafl2_4_0_0_sh_mask.h"
 
+#include "amdgpu_reset.h"
+
 #define smnPCS_XGMI23_PCS_ERROR_STATUS   0x11a01210
 #define smnPCS_XGMI3X16_PCS_ERROR_STATUS 0x11a0020c
 #define smnPCS_GOPX1_PCS_ERROR_STATUS    0x12200210
@@ -226,6 +228,9 @@ static void amdgpu_xgmi_hive_release(struct kobject *kobj)
 	struct amdgpu_hive_info *hive = container_of(
 		kobj, struct amdgpu_hive_info, kobj);
 
+	kref_put(&hive->reset_domain->refcount, amdgpu_reset_destroy_reset_domain);
+	hive->reset_domain = NULL;
+
 	mutex_destroy(&hive->hive_lock);
 	kfree(hive);
 }
@@ -392,12 +397,21 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 		goto pro_end;
 	}
 
-	hive->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-hive", 0);
-	if (!hive->reset_domain.wq) {
-		dev_err(adev->dev, "XGMI: failed allocating wq for reset domain!\n");
-		kfree(hive);
-		hive = NULL;
-		goto pro_end;
+	/**
+	 * Avoid recreating reset domain when hive is reconstructed for the case
+	 * of reset the devices in the XGMI hive during probe for SRIOV
+	 * See https://www.spinics.net/lists/amd-gfx/msg58836.html
+	 */
+	if (!adev->reset_domain) {
+		hive->reset_domain = amdgpu_reset_create_reset_domain("amdgpu-reset-hive");
+			if (!hive->reset_domain) {
+				dev_err(adev->dev, "XGMI: failed initializing reset domain for xgmi hive\n");
+				ret = -ENOMEM;
+				kobject_put(&hive->kobj);
+				kfree(hive);
+				hive = NULL;
+				goto pro_end;
+			}
 	}
 
 	hive->hive_id = adev->gmc.xgmi.hive_id;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
index 2f2ce53645a5..dcaad22be492 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
@@ -42,7 +42,7 @@ struct amdgpu_hive_info {
 		AMDGPU_XGMI_PSTATE_UNKNOWN
 	} pstate;
 
-	struct amdgpu_reset_domain reset_domain;
+	struct amdgpu_reset_domain *reset_domain;
 };
 
 struct amdgpu_pcs_ras_field {
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
index b2b40e169342..05e98af30b48 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -32,6 +32,8 @@
 #include "soc15_common.h"
 #include "mxgpu_ai.h"
 
+#include "amdgpu_reset.h"
+
 static void xgpu_ai_mailbox_send_ack(struct amdgpu_device *adev)
 {
 	WREG8(AI_MAIBOX_CONTROL_RCV_OFFSET_BYTE, 2);
@@ -302,7 +304,7 @@ static int xgpu_ai_mailbox_rcv_irq(struct amdgpu_device *adev,
 	switch (event) {
 		case IDH_FLR_NOTIFICATION:
 		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
-			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+			WARN_ONCE(!queue_work(adev->reset_domain->wq,
 					      &adev->virt.flr_work),
 				  "Failed to queue work! at %s",
 				  __func__);
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index 08411924150d..6e12055f3f4a 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -31,6 +31,8 @@
 #include "soc15_common.h"
 #include "mxgpu_nv.h"
 
+#include "amdgpu_reset.h"
+
 static void xgpu_nv_mailbox_send_ack(struct amdgpu_device *adev)
 {
 	WREG8(NV_MAIBOX_CONTROL_RCV_OFFSET_BYTE, 2);
@@ -337,7 +339,7 @@ static int xgpu_nv_mailbox_rcv_irq(struct amdgpu_device *adev,
 	switch (event) {
 	case IDH_FLR_NOTIFICATION:
 		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
-			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+			WARN_ONCE(!queue_work(adev->reset_domain->wq,
 					      &adev->virt.flr_work),
 				  "Failed to queue work! at %s",
 				  __func__);
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
index 02290febfcf4..fe1570c2146e 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
@@ -42,6 +42,8 @@
 #include "smu/smu_7_1_3_d.h"
 #include "mxgpu_vi.h"
 
+#include "amdgpu_reset.h"
+
 /* VI golden setting */
 static const u32 xgpu_fiji_mgcg_cgcg_init[] = {
 	mmRLC_CGTT_MGCG_OVERRIDE, 0xffffffff, 0xffffffff,
@@ -551,7 +553,7 @@ static int xgpu_vi_mailbox_rcv_irq(struct amdgpu_device *adev,
 
 		/* only handle FLR_NOTIFY now */
 		if (!r && !amdgpu_in_reset(adev))
-			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+			WARN_ONCE(!queue_work(adev->reset_domain->wq,
 					      &adev->virt.flr_work),
 				  "Failed to queue work! at %s",
 				  __func__);
-- 
2.25.1

