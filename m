Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DB47823F1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2BB10E1EB;
	Mon, 21 Aug 2023 06:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EEC10E1EB;
 Mon, 21 Aug 2023 06:48:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQh/hIf8SCOLoK3IbFL/OJplNvxdntMXInO7xC5fz0OQtejT/w0vH45eM/uYZ3P2RW9F+zw74uZwLPiOmdIcqp7cY6ZBkWPrfoCBOqJCoLfZoblyMtZmFMOM/beE+fLaUWancDv+u+D90/502JcMIsMtKibOHIa/nkU020OGBKhIwnPKEqqdyxhvoTOeq+sOyzLASNaAYX0NVxDAiF1tl3QDn+a3S7wsDczMDOBapIxhnQ1TWb4r855aLoQHPYh18Lrxw1yFsr8+OMkizoVlVThF2f0B4/TjuY26MkiOm+l6cKYR4o2zGGnEgAyXwnTF1bfmqQJilrLaUvV2T8XF6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/Y5OWeLTWYsw8szkDB+4ChijrVJXVvY8eenpKtJVP8=;
 b=oDnsCSADQ7F4/nLex8nfTz6w+e0M3kqJlv1EK2zva+XfedEAWsYBtjKhqdJiDGoGy3em4BuM7W7MJNEGkRVeL14PKeLiHcBafID5FD6vxEcnK+iJMtKQBD0ztDg9wjkmpMpU5wur9OYbkOE49mxScrl71+eOwMCHuoqncGu0QRlwnkruEqrni//Ai4cxvMpwsToi2+jYRtMGCVMU7dpcdhTk9aD8gL1PLuIrcmzL2JVtCChWcvPuLfzH83VpQVySx80wck+7v3wwaDS6a/SsqzFlLJWUtRhWfWcQTVtlwgVLw04bwLCmguL5l+QWBHOb9HBwkP+ptNmZseuBZGgtuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/Y5OWeLTWYsw8szkDB+4ChijrVJXVvY8eenpKtJVP8=;
 b=p5sQv/vZtw8yauC2Z3uDjdfBurpWQvmPow/9P7kuzt08E71BcW8u0XL4Mf62vf57ByPZCht2ZB9kPj5ifdJHkwrMk3+U7+KDNS/0AANJ+hSXV0xI3/njL4hCC9LOj9RJnYjLD0c1AFmVHChVn7JMYWLqdTWbCOBFwVX/CHV0w6c=
Received: from SN7PR18CA0028.namprd18.prod.outlook.com (2603:10b6:806:f3::11)
 by MN2PR12MB4358.namprd12.prod.outlook.com (2603:10b6:208:24f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 06:48:48 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:f3:cafe::f) by SN7PR18CA0028.outlook.office365.com
 (2603:10b6:806:f3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 06:48:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Mon, 21 Aug 2023 06:48:47 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 01:48:43 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 3/7] drm/amdgpu: Add new function to put GPU power profile
Date: Mon, 21 Aug 2023 12:17:55 +0530
Message-ID: <20230821064759.94223-4-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821064759.94223-1-Arvind.Yadav@amd.com>
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|MN2PR12MB4358:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc91acb-27d5-4ea8-57bc-08dba212abcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nLUzBUzA0yDMgvYuCliLi1xmCzGTvwc7fZe/M9uf6ClvkaIA1biwqkjT3M8plp9Se6Nqhc9J/0OsEVRFaonaj2EWcXaJmq1xffHf6oEDLavZcPSaP2duDVv1m8RlCdaQVb+B5tZ4efAhkFDsOLNEScnz+QCMb1BtX/K1FrhAfvJZUmvHqy5SWmyXTWlx0mQfZfucAmgELXts1zLpiEOWZc6A6UShD7FWuoZTSt7LoSPDlEa8mJbihdGtHCYlzMi1KBA/lN1QujXPdlauASMLKx+sp0qjU83U8fd5DQq164MdGoXT9lgidZXQb9Q334ev6BffRypuTvUfO+GRVE8VxXheie++GfOR8oBSIvzjDXsdqu0Y8Afqw77uGeZry7fFhdjI/femU1oTCIvAHU8q5wqJacfInvzxa2w9eE+yLoGNFL4r6XkGT/VPFTGHn4V09QJeRdHicOXwLQ90LuFyFfyzDVHOBpoeTcQDwJTCGh+Rf2oIfjr9r1IwyWGB5wYJ4weHgPdTvDoma8PIA1dFmznRJdP+hXwcrTgWS4a9Mj/LD8vrQjUsYb+bIwbj00RWDwZnuOee0DiYSt/ZW6evuqvk5Dan1OQdONYGk7MoXdP+rUc4TfSN+wmfsQM3CLrlv+YdTbcg1SRMK5yCyx4BtTitpH9C3OmE53aemtiUX2AhFtdIr/kW8mS0t7FBUv8Qo4Zjy4HxWykf/+zqJ3ArsWkAd/oKN63HttONvrpfGQijPyfnoEq5IZSat18cQ2Dsp2bPu9lZfkf9pSvdBZl2eA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(186009)(1800799009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(54906003)(70586007)(70206006)(316002)(110136005)(8676002)(2616005)(8936002)(4326008)(1076003)(36756003)(40460700003)(41300700001)(82740400003)(356005)(81166007)(478600001)(6666004)(7696005)(40480700001)(2906002)(83380400001)(86362001)(36860700001)(47076005)(336012)(426003)(5660300002)(26005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 06:48:47.7773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc91acb-27d5-4ea8-57bc-08dba212abcb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4358
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a function which will clear the GPU
power profile after job finished.

This is how it works:
- schedular will set the GPU power profile based on ring_type.
- Schedular will clear the GPU Power profile once job finished.
- Here, the *_workload_profile_set function will set the GPU
  power profile and the *_workload_profile_put function will
  schedule the smu_delayed_work task after 100ms delay. This
  smu_delayed_work task will clear a GPU power profile if any
  new jobs are not scheduled within 100 ms. But if any new job
  comes within 100ms then the *_workload_profile_set function
  will cancel this work and set the GPU power profile based on
  preferences.

v2:
- Splitting workload_profile_set and workload_profile_put
  into two separate patches.
- Addressed review comment.

Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 97 +++++++++++++++++++
 drivers/gpu/drm/amd/include/amdgpu_workload.h |  3 +
 2 files changed, 100 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
index e661cc5b3d92..6367eb88a44d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
@@ -24,6 +24,9 @@
 
 #include "amdgpu.h"
 
+/* 100 millsecond timeout */
+#define SMU_IDLE_TIMEOUT	msecs_to_jiffies(100)
+
 static enum PP_SMC_POWER_PROFILE
 ring_to_power_profile(uint32_t ring_type)
 {
@@ -59,6 +62,80 @@ amdgpu_power_profile_set(struct amdgpu_device *adev,
 	return ret;
 }
 
+static int
+amdgpu_power_profile_clear(struct amdgpu_device *adev,
+			   enum PP_SMC_POWER_PROFILE profile)
+{
+	int ret = amdgpu_dpm_switch_power_profile(adev, profile, false);
+
+	if (!ret) {
+		/* Clear the bit for the submitted workload profile */
+		adev->smu_workload.submit_workload_status &= ~(1 << profile);
+	}
+
+	return ret;
+}
+
+static void
+amdgpu_power_profile_idle_work_handler(struct work_struct *work)
+{
+
+	struct amdgpu_smu_workload *workload = container_of(work,
+						      struct amdgpu_smu_workload,
+						      smu_delayed_work.work);
+	struct amdgpu_device *adev = workload->adev;
+	bool reschedule = false;
+	int index  = fls(workload->submit_workload_status);
+	int ret;
+
+	mutex_lock(&workload->workload_lock);
+	for (; index > 0; index--) {
+		int val = atomic_read(&workload->power_profile_ref[index]);
+
+		if (val) {
+			reschedule = true;
+		} else {
+			if (workload->submit_workload_status &
+			    (1 << index)) {
+				ret = amdgpu_power_profile_clear(adev, index);
+				if (ret) {
+					DRM_WARN("Failed to clear workload %s,error = %d\n",
+						 amdgpu_workload_mode_name[index], ret);
+					goto exit;
+				}
+			}
+		}
+	}
+	if (reschedule)
+		schedule_delayed_work(&workload->smu_delayed_work,
+				      SMU_IDLE_TIMEOUT);
+exit:
+	mutex_unlock(&workload->workload_lock);
+}
+
+void amdgpu_workload_profile_put(struct amdgpu_device *adev,
+				 uint32_t ring_type)
+{
+	struct amdgpu_smu_workload *workload = &adev->smu_workload;
+	enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
+
+	if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
+		return;
+
+	mutex_lock(&workload->workload_lock);
+
+	if (!atomic_read(&workload->power_profile_ref[profile])) {
+		DRM_WARN("Power profile %s ref. count error\n",
+			 amdgpu_workload_mode_name[profile]);
+	} else {
+		atomic_dec(&workload->power_profile_ref[profile]);
+		schedule_delayed_work(&workload->smu_delayed_work,
+				      SMU_IDLE_TIMEOUT);
+	}
+
+	mutex_unlock(&workload->workload_lock);
+}
+
 void amdgpu_workload_profile_set(struct amdgpu_device *adev,
 				 uint32_t ring_type)
 {
@@ -70,13 +147,30 @@ void amdgpu_workload_profile_set(struct amdgpu_device *adev,
 		return;
 
 	mutex_lock(&workload->workload_lock);
+	cancel_delayed_work_sync(&workload->smu_delayed_work);
 
 	ret = amdgpu_power_profile_set(adev, profile);
 	if (ret) {
 		DRM_WARN("Failed to set workload profile to %s, error = %d\n",
 			 amdgpu_workload_mode_name[profile], ret);
+		goto exit;
+	}
+
+	/* Clear the already finished jobs of higher power profile*/
+	for (int index = fls(workload->submit_workload_status);
+	     index > profile; index--) {
+		if (!atomic_read(&workload->power_profile_ref[index]) &&
+		    workload->submit_workload_status & (1 << index)) {
+			ret = amdgpu_power_profile_clear(adev, index);
+			if (ret) {
+				DRM_WARN("Failed to clear workload %s, err = %d\n",
+					 amdgpu_workload_mode_name[profile], ret);
+				goto exit;
+			}
+		}
 	}
 
+exit:
 	mutex_unlock(&workload->workload_lock);
 }
 
@@ -87,6 +181,8 @@ void amdgpu_workload_profile_init(struct amdgpu_device *adev)
 	adev->smu_workload.initialized = true;
 
 	mutex_init(&adev->smu_workload.workload_lock);
+	INIT_DELAYED_WORK(&adev->smu_workload.smu_delayed_work,
+			  amdgpu_power_profile_idle_work_handler);
 }
 
 void amdgpu_workload_profile_fini(struct amdgpu_device *adev)
@@ -94,6 +190,7 @@ void amdgpu_workload_profile_fini(struct amdgpu_device *adev)
 	if (!adev->smu_workload.initialized)
 		return;
 
+	cancel_delayed_work_sync(&adev->smu_workload.smu_delayed_work);
 	adev->smu_workload.submit_workload_status = 0;
 	adev->smu_workload.initialized = false;
 	mutex_destroy(&adev->smu_workload.workload_lock);
diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
index 5022f28fc2f9..ee1f87257f2d 100644
--- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
+++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
@@ -46,6 +46,9 @@ static const char * const amdgpu_workload_mode_name[] = {
 	"Window3D"
 };
 
+void amdgpu_workload_profile_put(struct amdgpu_device *adev,
+				 uint32_t ring_type);
+
 void amdgpu_workload_profile_set(struct amdgpu_device *adev,
 				 uint32_t ring_type);
 
-- 
2.34.1

