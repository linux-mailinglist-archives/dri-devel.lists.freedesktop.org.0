Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B84D74A76D3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 18:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF5710E389;
	Wed,  2 Feb 2022 17:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BAF10E389;
 Wed,  2 Feb 2022 17:26:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEMXaF3cypkvWQ9VQeoEJ8CuoKvlE+edUIFc12Z1o+5IOWz6x8RB6Q+3UE+ngIyAjUmaXXcE3JAC/h8hdsgFrYd9lJrZz4ucHwk4+4dVyAw716c79TOCexley2uJi48CwhUEa7E4EP0prbOEl0pmqnyWzjz8euw+okQWKr3tFeX2YC7/FiITb1zWMXy6kt7qeZZJZy7R1p1dTz8MZsiGv6zA1HhCr6d7SBTrf5tW5nTauFvZEcKvHTSNH7KKcwHF/rF7yfZJeJxPGn+XK8hE1j4tkw7O3fmmjfJicS8DJnyJDARqkarhQ87qNksivJsbjb2H2Qmxyg+AFGPIJFIehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZoR4DYaC3KM7Uek+cutRn7eJlY+jLTG24OfEQuryl0=;
 b=fUG9/9NWDWggyCemKS+d3V3VOvXyZ8lSoNzJSGc6eP+uK3wrIVXEAciBEAKYgOHBixB85TP2WjYbIM5R+CPxb9/l9U7kXhfDP4liBpScVBudRVbhm1MR0YPYZnwl1scc20mnuDQ313/0/lYg6ZCsW19NnjYRWH6hVo8+fhkBpIFjpZyoZkIbvg9qBCK8cnK15InI0MHWAD3ZeYLXc+eWB8iwrICHTQlRs/Bg08hJQ08Z7fbI17t9iZ86+9G7E8y93e8kXZIeukYgLT0XLE3muUwIXj/0tTaNWC3zWj5pYmvkZhUd7kwEGN9vnrbR9Qd4DTZCRQ6ONM6oCanBbLfyMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZoR4DYaC3KM7Uek+cutRn7eJlY+jLTG24OfEQuryl0=;
 b=BqDuElo6hedgqFqyxjhdgy33tP7xqwWpalfmGcK78+JjdZrtfCRTsoIayrEiQ50gk9j02geIwQm1hp+9tCqbRpCpZHw+zADB2JDJW8k3G6/IJhi3UtZEeX2aTyS05zsdfVsDiyK+OLkjODlet5P/BYYlPu41Kizi4DFYr9+Xrw4=
Received: from BN8PR15CA0069.namprd15.prod.outlook.com (2603:10b6:408:80::46)
 by BYAPR12MB3461.namprd12.prod.outlook.com (2603:10b6:a03:da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Wed, 2 Feb
 2022 17:26:30 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::ac) by BN8PR15CA0069.outlook.office365.com
 (2603:10b6:408:80::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 2 Feb 2022 17:26:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Wed, 2 Feb 2022 17:26:30 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Wed, 2 Feb 2022 11:26:28 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v4] drm/amdgpu: Rework reset domain to be refcounted.
Date: Wed, 2 Feb 2022 12:26:17 -0500
Message-ID: <20220202172617.16181-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125223752.200211-9-andrey.grodzovsky@amd.com>
References: <20220125223752.200211-9-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe1960a4-f7bd-4020-bf8a-08d9e671267c
X-MS-TrafficTypeDiagnostic: BYAPR12MB3461:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3461D3D3BC676C8B9CE784A4EA279@BYAPR12MB3461.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m38Omzonh5Vq2qrvdX/GW+Z7iYRPVXSaG4QlrTdPrCnlwXolnRpflxELKf4YuN5MIkirrFypkg/3/nFUkczABsnnIvQKVZS1EFrziZrXB5HBmVAmW7qaLmm7aF7XcS+Cntsmvth3jZClwYiM6FY3JAPUO2IWLudgt758MbPEjCN43XwBvJPRX6HmOyh7WA50q364hwJFiTUgPOnEoOjactwDZMCTyOspMWJj6BwtLJssWooRzmrBv8Mpt3CS7znXUcwdkmSncj8ZTW48EOFGhTgBgu8wNqazZkOFClVXlcwXh1NtlhNQFPfRSsfEcvXZnVrcTQaXXef79KgL1rn8pcLU+iz2vNFYAWTIc1nvQuIb1CAg/n3djrQ99y1sEDihyvZGrXM+LDdWtKrFQuUe6aSHpeSnyOCD3auOYuX+esebRpCLhvk79SLrtlj26nGtNSb2/HY7QMPggwndF8OCvEjz0PjkyTGrxyWLuG8U3wWnhv11hFPdNCf/kPvqEM8+UYN5WSaa+3Y33ruPu/EAbdqJs0zmuqXMvZ+rGtQhjjxN7o0nj0cfBEcf65a2vZi4qGAtNtGW5UzNmFvjmzj1V9XDJaCnW5QLoBpg1uFsT5VwyFlwH+E4bo1awzseWtffHv/KczZXNohTE1SP5BSo0C4jNNZRExINpy8Wee4JKcTo20U37mRNTXogdcyq9V+AxGMmn2WiuRbSU4ysOGhTunz2Ldmhi8ui9RaiyNGc5zqpCR0UzhWVOcSgeWstR9JqBo7gsCzkyHa1gvoRxlGw/KBzurztaM96r1eX+ibR+YM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8936002)(110136005)(40460700003)(86362001)(36860700001)(70206006)(81166007)(356005)(4326008)(82310400004)(70586007)(8676002)(54906003)(316002)(336012)(186003)(83380400001)(6666004)(30864003)(5660300002)(426003)(1076003)(16526019)(44832011)(508600001)(966005)(2616005)(26005)(7696005)(2906002)(47076005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 17:26:30.0257 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1960a4-f7bd-4020-bf8a-08d9e671267c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3461
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

v4:
Fix crash on boot with XGMI hive by adding type to reset_domain.
XGMI will only create a new reset_domain if prevoius was of single
device type meaning it's first boot. Otherwsie it will take a
refocunt to exsiting reset_domain from the amdgou device.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 44 +++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 38 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  | 18 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   | 29 +++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c      |  4 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c      |  4 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c      |  4 +-
 9 files changed, 118 insertions(+), 31 deletions(-)

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
index fef952ca8db5..cd1b7af69c35 100644
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
+	adev->reset_domain = amdgpu_reset_create_reset_domain(SINGLE_DEVICE ,"amdgpu-reset-dev");
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
index 02afd4115675..14f003d5ebe8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -96,3 +96,41 @@ int amdgpu_reset_perform_reset(struct amdgpu_device *adev,
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
+struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum amdgpu_reset_domain_type type,
+							     char *wq_name)
+{
+	struct amdgpu_reset_domain *reset_domain;
+
+	reset_domain = kvzalloc(sizeof(struct amdgpu_reset_domain), GFP_KERNEL);
+	if (!reset_domain) {
+		DRM_ERROR("Failed to allocate amdgpu_reset_domain!");
+		return NULL;
+	}
+
+	reset_domain->type = type;
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
index e00d38d9160a..0b310cd963d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
@@ -70,6 +70,19 @@ struct amdgpu_reset_control {
 	void (*async_reset)(struct work_struct *work);
 };
 
+
+enum amdgpu_reset_domain_type {
+	SINGLE_DEVICE,
+	XGMI_HIVE
+};
+
+struct amdgpu_reset_domain {
+	struct kref refcount;
+	struct workqueue_struct *wq;
+	enum amdgpu_reset_domain_type type;
+};
+
+
 int amdgpu_reset_init(struct amdgpu_device *adev);
 int amdgpu_reset_fini(struct amdgpu_device *adev);
 
@@ -82,4 +95,9 @@ int amdgpu_reset_perform_reset(struct amdgpu_device *adev,
 int amdgpu_reset_add_handler(struct amdgpu_reset_control *reset_ctl,
 			     struct amdgpu_reset_handler *handler);
 
+struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum amdgpu_reset_domain_type type,
+							     char *wq_name);
+
+void amdgpu_reset_destroy_reset_domain(struct kref *ref);
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 9ad742039ac9..a216e88a7b54 100644
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
@@ -392,12 +397,24 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
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
+	if (adev->reset_domain->type != XGMI_HIVE) {
+		hive->reset_domain = amdgpu_reset_create_reset_domain(XGMI_HIVE, "amdgpu-reset-hive");
+			if (!hive->reset_domain) {
+				dev_err(adev->dev, "XGMI: failed initializing reset domain for xgmi hive\n");
+				ret = -ENOMEM;
+				kobject_put(&hive->kobj);
+				kfree(hive);
+				hive = NULL;
+				goto pro_end;
+			}
+	} else {
+		kref_get_unless_zero(&adev->reset_domain->refcount);
+		hive->reset_domain = adev->reset_domain;
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

