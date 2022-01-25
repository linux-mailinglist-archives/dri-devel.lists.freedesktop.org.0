Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDC749BEB2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 23:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0742210E60F;
	Tue, 25 Jan 2022 22:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77DF10E5C6;
 Tue, 25 Jan 2022 22:38:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgjlTlbwn6SZFf9KHzBv9GjkEPJtoxj2A9cWlWcFPJTzvlGjyRVBXJGe++Ohfy7+hlj9kgRsSxZz4M83bq/hGR7RiGeB31G3FAoiDSkCkoRYEJwSE2f95+rB4L5ERz6g8hioO3xLxxCd6PkkPjOPsOs/d+1S6skh5R6hI2DAjVcNk+s/bfBxPcOkGATDfHce98qLUo+CbdRRsevENIgOnuPZf3pnSKyaJnRUTg2nfW3rx/CagwHMQrtTrA3+KOwqwo2f7kXlD3uZzGyI+H5mXabF4UbfAFYhHwGEO7bwgVNUnyPLda4K0KtMrsLbTC4hIyQ4/9kxg0UagaZupTLdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhXyC0flfwv6bNeZ29uT/mET9BrHzj+KxClAUd2H4Vw=;
 b=IL8Ih6M033k1Mf8H+3FocDsxZXVnh1XwpuoghhLsVlBFRfxeDbkytUD+z5ylLbvkX10zl0RGS5bVCnD+bDvKGrkGxWF8z6kGlV/zySpIkd6WKHSQFvctCRlmEQBTTXPJtGWNF+wcgl7SElExBD0wcFcI21zoWsVUdPoZopRBeTMqgxEh4dSMgMk/lEevdSepdFMi9Bfnak/xg+1FpYQPJhojtnZGg1TVAAjUtn3RxqZB0AQtuSjzB6sT9nfZqPbm8up3wWANShfjvkNW3STjMxYhmYs6cXiOt2bXSoezi+fmXpN24KyLsOV9W6AWB9lMNj45pyBgd1GO2ITKYCggFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhXyC0flfwv6bNeZ29uT/mET9BrHzj+KxClAUd2H4Vw=;
 b=QF87UZznlSGS4XhhiA3eNmEv/FTm2LE+WpB9lke6+pYQU7IDTEO9BJkSKnNRLUwBwi4IUQtEDJOimGENAaGAum9SglLpmmP5lUE5xurakwXXoM9KTZs0yWik2g9nMvSqLzZXLq53lAS19+PRg0B6N4SeFnAFZ05dVzjKLrupcK0=
Received: from DM3PR03CA0002.namprd03.prod.outlook.com (2603:10b6:0:50::12) by
 DM5PR12MB2472.namprd12.prod.outlook.com (2603:10b6:4:b9::39) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.10; Tue, 25 Jan 2022 22:38:26 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:50:cafe::1b) by DM3PR03CA0002.outlook.office365.com
 (2603:10b6:0:50::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Tue, 25 Jan 2022 22:38:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Tue, 25 Jan 2022 22:38:26 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 25 Jan 2022 16:38:24 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v3 06/12] drm/amdgpu: Drop hive->in_reset
Date: Tue, 25 Jan 2022 17:37:46 -0500
Message-ID: <20220125223752.200211-7-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d2df4c8-bfc9-4753-d814-08d9e05366d3
X-MS-TrafficTypeDiagnostic: DM5PR12MB2472:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2472A8044B1F3AA019427711EA5F9@DM5PR12MB2472.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gV/ZDuTA+ghjIWPhcVHrQ+QnFntvSSEtStMC34a2fKAsibpOuEEVYXSJ+0d3qKbNAIl++RqY1lK+3c7jEHupBaWjEa3JEIJ7lsGoYOpTn72b5UJb8t5H81Cf/EQXeUJnWrYENG2MSYTUbdD6Pvm6frxJnpK++/3m+I3/HmwJJxMUxhsu/dkMdWgmEoACEakFekd76FHOxTepoCzKAEdzEvtK4+zlTyASqp+AGvSu8TsimAYTnde5D0/hq2ChD9DTnZAlI6kJydnhOhwPDitg/5jhbDgw9H0KcMgmjBR9nD/A6V6mxDzHnrKlWL69l6PN2mGSHCleK5tNsYZ6DOp2pW30fF9udopjBWA0l9a36XnH7gZscjJxdsOxRM//a+ym0k0lpGj3MEE3jJTG5yJfrUPiTwuoUI78cd3ccUJgGusg7aVoZnqC9dbhaZi6E7SBHMvqv1AofYtM1TkUOSDsTshVRVffrPPhowpYnp9d81uRgZaWoi5zfSp8J3Bcnzs8iCqVXHb1U+uL7T6T9ANnWyWdrI4MjO3dE+8dkT6J32diutMukviUKKyoIO3PmIJpoX4lSyE2b4D0dbjPWcL+u0+altR+Nv7H2uBg3gKjzqVrc5r8oS2cV9WHDfj/WwID41a1YXtijTANQT2rrntZkh59aD7g6fqAmJqEaTnjozUoSU6KxibkX7kH+VcOaDqST+fG2TNOtCp4VnyLRW391DJLA8gvki1XgaXycqNc9OBKgP7Slb/6F1zQx3l/zDj28m1l5wZFgWpTik3Xc/XeEBZowqXHfvlPpZZa0DHX1zo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700004)(36840700001)(46966006)(36860700001)(2906002)(44832011)(36756003)(426003)(47076005)(81166007)(16526019)(8936002)(2616005)(7696005)(86362001)(82310400004)(356005)(70206006)(26005)(54906003)(336012)(186003)(4326008)(5660300002)(6666004)(66574015)(70586007)(110136005)(83380400001)(40460700003)(316002)(1076003)(508600001)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 22:38:26.0765 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2df4c8-bfc9-4753-d814-08d9e05366d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2472
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

Since we serialize all resets no need to protect from concurrent
resets.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  1 -
 3 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 258ec3c0b2af..107a393ebbfd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5013,25 +5013,9 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 	dev_info(adev->dev, "GPU %s begin!\n",
 		need_emergency_restart ? "jobs stop":"reset");
 
-	/*
-	 * Here we trylock to avoid chain of resets executing from
-	 * either trigger by jobs on different adevs in XGMI hive or jobs on
-	 * different schedulers for same device while this TO handler is running.
-	 * We always reset all schedulers for device and all devices for XGMI
-	 * hive so that should take care of them too.
-	 */
 	hive = amdgpu_get_xgmi_hive(adev);
-	if (hive) {
-		if (atomic_cmpxchg(&hive->in_reset, 0, 1) != 0) {
-			DRM_INFO("Bailing on TDR for s_job:%llx, hive: %llx as another already in progress",
-				job ? job->base.id : -1, hive->hive_id);
-			amdgpu_put_xgmi_hive(hive);
-			if (job && job->vm)
-				drm_sched_increase_karma(&job->base);
-			return 0;
-		}
+	if (hive)
 		mutex_lock(&hive->hive_lock);
-	}
 
 	reset_context.method = AMD_RESET_METHOD_NONE;
 	reset_context.reset_req_dev = adev;
@@ -5227,7 +5211,6 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 
 skip_recovery:
 	if (hive) {
-		atomic_set(&hive->in_reset, 0);
 		mutex_unlock(&hive->hive_lock);
 		amdgpu_put_xgmi_hive(hive);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index a858e3457c5c..9ad742039ac9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -404,7 +404,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 	INIT_LIST_HEAD(&hive->device_list);
 	INIT_LIST_HEAD(&hive->node);
 	mutex_init(&hive->hive_lock);
-	atomic_set(&hive->in_reset, 0);
 	atomic_set(&hive->number_devices, 0);
 	task_barrier_init(&hive->tb);
 	hive->pstate = AMDGPU_XGMI_PSTATE_UNKNOWN;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
index 6121aaa292cb..2f2ce53645a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
@@ -33,7 +33,6 @@ struct amdgpu_hive_info {
 	struct list_head node;
 	atomic_t number_devices;
 	struct mutex hive_lock;
-	atomic_t in_reset;
 	int hi_req_count;
 	struct amdgpu_device *hi_req_gpu;
 	struct task_barrier tb;
-- 
2.25.1

