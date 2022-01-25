Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F9049BEB1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 23:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47ED10E5F7;
	Tue, 25 Jan 2022 22:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2089.outbound.protection.outlook.com [40.107.95.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BA010E5DA;
 Tue, 25 Jan 2022 22:38:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZ7nC8m/eWY83Q2bJwRTDt5iP5KFUsE/pBt156ZY0v9CZHTjnQgEvr2w3piOxD8AqL5mato6QFuT6VzhPD1O398XEk+BPMAa/BecjNatsZ/L6wk+zLbIIv8UqKrr09gsAVjxhCfCoSWfTjqi18GPRoPmFhNId/3LZlCCrXvC22zCqS+S98g1fDefd9a/1Yi78q4TMIbrM23SyKULgBEy7uSZfBvVE/U8mDa0xwKHOsz2UT1JVuVt3vs2XtCihtwEmCs7NJwJy6yaXEIOeGfJvV6+bDf80QhZvqRGhE86ml8+AZ7oGDYhuZTNth0fL8qR/eMm8qrIh8rYcoh4NVQQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fm5PX92PEbyjiTVhDa7CxIOGfvRFr8DJ2CxkHrnwccY=;
 b=jHj8DWg0sf/lWqZX9i+K5GJA2xBEOWRyz7jsKQijQVZuXyhMzYKRzyBf97jnVqUCr3d7NEmS4L5IFmpYmJQnIYHU0VUcShB2xATH6B8JhzftWqF9m7AetOQnyoJ7zL8ELA1Lkz2+hK42mpJiPrjdo71hfHCG3BRkrslkXTebvPwpIUNd8KM9TCD0knU1uXkv6e0kX7xLXmhL0rg5CJy2wTsDzM0mElHfZUvuT0mZgXK6yM8ErKhuk80gzlU+YQOxT8d5hrpQuV6U1D1darXdqf827Fj58F/o8rTjYrfLapsFpAk+vTBfnrdMIV48W/1SLUBNYN7v0Oj2UmVR3EoPGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fm5PX92PEbyjiTVhDa7CxIOGfvRFr8DJ2CxkHrnwccY=;
 b=zndcqgLqx2gMvLpcO+qegBVpzpxaPEu70qEjfnveT+EqiHXpZmRrfSMWXJmh1rRvveJ05urUyettObOrf5WRyCAcm8y+V/nD1//L5D4bgNYVWmDrsScc9aNtH89oAx3PUwzjLkyHOQQ5CdJqqTsmP47XtaC/ZPAyKpIssoV/ZO4=
Received: from DM5PR21CA0041.namprd21.prod.outlook.com (2603:10b6:3:ed::27) by
 DM6PR12MB3516.namprd12.prod.outlook.com (2603:10b6:5:18b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.14; Tue, 25 Jan 2022 22:38:33 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ed:cafe::22) by DM5PR21CA0041.outlook.office365.com
 (2603:10b6:3:ed::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.4 via Frontend
 Transport; Tue, 25 Jan 2022 22:38:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 25 Jan 2022 22:38:32 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 25 Jan 2022 16:38:30 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v3 10/12] drm/amdgpu: Move in_gpu_reset into reset_domain
Date: Tue, 25 Jan 2022 17:37:50 -0500
Message-ID: <20220125223752.200211-11-andrey.grodzovsky@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4fc5add5-76dd-453a-c312-08d9e0536aad
X-MS-TrafficTypeDiagnostic: DM6PR12MB3516:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB351675F24FA117D6F176E4C7EA5F9@DM6PR12MB3516.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V/NLgI01CBCh8k+Bi3QrVq/oKrKbQ4FHV8R3lix4a/4z6NWk1EDp4IZYPDp/veZgci8+76PZxSSyboG9IfkPOiSH3qf77+Xv8fiQq/TQyHilYmi8Oy+rSN4EIynswgfLHWtKJvY/beOcEeN8fbjHVNM4l7XEF5S2l5XA/XBHKf/2e7Es6ZXbgZNFcdDkcf0ZmQ4vqqZIxkO74R/cpNqDZ/NEwpaK8U/RGgGpfemPxG+xf7OBWT5NeoteE6u04F+iohzS9KyDuBQkbevV2UgX6sAqX6TGX+Yhm3pg8tlCeTt1OlmcQQEHT+FnvA0jSuOFcj3S0/nRN1f+UMvwCPKFEewpae1bTAvgK3VmqmOvWloVzbBTvnJLlGroTFVr2WyU4cFA4EteaUf227kUe2FQca9G8Q66J0z/hj6rcxsRgTUXbj50EqdQRQnB6Y5b8BC86PuZ+c5VRfHnYuUzcnXEUDFHPAzQQlRfRQnm4bI2kMH/+dr4PjfmOfKhA2FxFOvUmvg3bdHhv33/RzNMWitWH0D9N1I4AaaNZ5F5sNcYR+sa5k3uy16Vxfc+O6VfWQ+u7UFGShcXJtstU0ueLkiWm3wPsgBWjkD6kr3bDcIAfslvX2RNB+LC6CXU6J5UllmSn5bNd2tuz++SeTbURmS2AJSA9DOrxb6CPhrspgLAb+XP4eAW4Pl7JKK8TgAQY/NXs4aES7FN+xlBPbfQopZObPnNLsKz1ccd/o2FResDzmVODaQFV3iVJz8oEXZhLHZOtfxDzH3zk9RsGjHWVNEWM1bYlyPh2zRvK95sLbQLZaM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(40470700004)(36840700001)(36860700001)(86362001)(5660300002)(44832011)(82310400004)(336012)(6666004)(40460700003)(426003)(186003)(508600001)(54906003)(26005)(16526019)(2906002)(8676002)(2616005)(70206006)(316002)(83380400001)(110136005)(4326008)(47076005)(7696005)(8936002)(81166007)(70586007)(356005)(36756003)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 22:38:32.5222 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc5add5-76dd-453a-c312-08d9e0536aad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3516
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

We should have a single instance per entrire reset domain.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Suggested-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  7 ++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 +++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  |  1 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c      |  4 ++--
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c      |  4 ++--
 6 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index f021cd3c9d34..087796e389ab 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1056,7 +1056,6 @@ struct amdgpu_device {
 	bool				in_s4;
 	bool				in_s0ix;
 
-	atomic_t 			in_gpu_reset;
 	enum pp_mp1_state               mp1_state;
 	struct amdgpu_doorbell_index doorbell_index;
 
@@ -1461,8 +1460,6 @@ static inline bool amdgpu_is_tmz(struct amdgpu_device *adev)
        return adev->gmc.tmz_enabled;
 }
 
-static inline int amdgpu_in_reset(struct amdgpu_device *adev)
-{
-	return atomic_read(&adev->in_gpu_reset);
-}
+int amdgpu_in_reset(struct amdgpu_device *adev);
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 6991ab4a8191..aa43af443ebe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3511,7 +3511,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	mutex_init(&adev->mn_lock);
 	mutex_init(&adev->virt.vf_errors.lock);
 	hash_init(adev->mn_hash);
-	atomic_set(&adev->in_gpu_reset, 0);
 	mutex_init(&adev->psp.mutex);
 	mutex_init(&adev->notifier_lock);
 
@@ -4775,7 +4774,7 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 static void amdgpu_device_lock_adev(struct amdgpu_device *adev,
 				struct amdgpu_hive_info *hive)
 {
-	atomic_set(&adev->in_gpu_reset, 1);
+	atomic_set(&adev->reset_domain->in_gpu_reset, 1);
 
 	if (hive) {
 		down_write_nest_lock(&adev->reset_domain->sem, &hive->hive_lock);
@@ -4800,7 +4799,7 @@ static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
 {
 	amdgpu_vf_error_trans_all(adev);
 	adev->mp1_state = PP_MP1_STATE_NONE;
-	atomic_set(&adev->in_gpu_reset, 0);
+	atomic_set(&adev->reset_domain->in_gpu_reset, 0);
 	up_write(&adev->reset_domain->sem);
 }
 
@@ -5643,3 +5642,8 @@ void amdgpu_device_invalidate_hdp(struct amdgpu_device *adev,
 
 	amdgpu_asic_invalidate_hdp(adev, ring);
 }
+
+int amdgpu_in_reset(struct amdgpu_device *adev)
+{
+	return atomic_read(&adev->reset_domain->in_gpu_reset);
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index 011585e330f6..e9b804a89b34 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -127,6 +127,7 @@ struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(char *wq_name)
 
 	}
 
+	atomic_set(&reset_domain->in_gpu_reset, 0);
 	init_rwsem(&reset_domain->sem);
 
 	return reset_domain;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
index 7451089b0c06..413982f4e1ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
@@ -74,6 +74,7 @@ struct amdgpu_reset_domain {
 	struct kref refcount;
 	struct workqueue_struct *wq;
 	struct rw_semaphore sem;
+	atomic_t in_gpu_reset;
 };
 
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
index 5dab06fce26a..6c79746d18db 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -258,7 +258,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 		return;
 
 	amdgpu_virt_fini_data_exchange(adev);
-	atomic_set(&adev->in_gpu_reset, 1);
+	atomic_set(&adev->reset_domain->in_gpu_reset, 1);
 
 	xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
 
@@ -271,7 +271,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 	} while (timeout > 1);
 
 flr_done:
-	atomic_set(&adev->in_gpu_reset, 0);
+	atomic_set(&adev->reset_domain->in_gpu_reset, 0);
 	up_write(&adev->reset_domain->sem);
 
 	/* Trigger recovery for world switch failure if no TDR */
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index 868144fff16a..39f7e1e9ab81 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -287,7 +287,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 		return;
 
 	amdgpu_virt_fini_data_exchange(adev);
-	atomic_set(&adev->in_gpu_reset, 1);
+	atomic_set(&adev->reset_domain->in_gpu_reset, 1);
 
 	xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
 
@@ -300,7 +300,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 	} while (timeout > 1);
 
 flr_done:
-	atomic_set(&adev->in_gpu_reset, 0);
+	atomic_set(&adev->reset_domain->in_gpu_reset, 0);
 	up_write(&adev->reset_domain->sem);
 
 	/* Trigger recovery for world switch failure if no TDR */
-- 
2.25.1

