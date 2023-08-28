Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DFB78B025
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 14:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E1810E2B9;
	Mon, 28 Aug 2023 12:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AA910E2B7;
 Mon, 28 Aug 2023 12:28:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddnSsSUYXSJPls0MROiidGVgQTsBoFzB4ySktO9GZmduSMpHCL/DefQ5ws3Y/hkMZWcZimMwCzyeykwcjjckQhP5p8EKbN0g/cUEDdLtgs3K6yOZWQXDT/Zc+CUqnW0WD+LKhgz2FGSiSXngISWpT7rLPSKUEHdD8PqySGRZZL+X4GTTxcFFhwzhNLfYhrV5VJWl0poq0E30NW7OGn3S+qXn3vrV0wycHCgAM3P0/ed6qpp/88z2qcz+3mr0+ayJVzqLT3dH28g7KH22IMWOoO+hf2aFGeb9hnQhxf4Miw0oP3UBmOPbFS7NvHaL/jaaTMWmSAL5QOl5Z6xyPg5NHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zO5A2SF/ZdFbofTXiFUeWps8hAhB2ILUUQ9TmuV0fqw=;
 b=PWpy48Hiy3BojrdItxh7TBk3kY53YLjXzfklokZyndwUf37ezI8jxQpqjRMs235+N45P1Dkr+6BonaBeNTcMA+1VhzxKsvWAENZqIxGX2wUh6o2VyphIki/YAYFteZSSMSN0qdIi90CYk3NQadfl6IsYTl0X2cQokEpv4kG8rie/YKgutVrd3LNDPM5E3focV9VHDcwNCpbXrANIwdLdkSUXqCsjfrAcric+Th77Am59KHLkRn0iHDp+ml9N6p063SNZtKyvTLEaGt3C3uqQTjH4EQH+ddlHOneJq9svrGtQqOp13+iI1fBJGl90jMGL0PWRZ4+1Ux1KD50Q1O0s4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zO5A2SF/ZdFbofTXiFUeWps8hAhB2ILUUQ9TmuV0fqw=;
 b=uzTnuq7SAjwLMkNJqB6cwnHsPOvh9HsTQJbtjPjooF3XzOo+ahSxXlSmuOIzGbEeGqVKNXPKHIp+q0MT44aIyQkYyAGKkzZGhZ6dNY6LY5ykgFuvINQurmcYRLAaeDKc2dpfQO237gptkFMtA7yBcdEWilS1xY26rAno1EHS9/g=
Received: from DM6PR06CA0092.namprd06.prod.outlook.com (2603:10b6:5:336::25)
 by PH7PR12MB7939.namprd12.prod.outlook.com (2603:10b6:510:278::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 12:28:38 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:5:336:cafe::7f) by DM6PR06CA0092.outlook.office365.com
 (2603:10b6:5:336::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34 via Frontend
 Transport; Mon, 28 Aug 2023 12:28:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.79) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Mon, 28 Aug 2023 12:28:37 +0000
Received: from rtg-Artic.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 07:28:33 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 3/7] drm/amdgpu: Add new function to put GPU power profile
Date: Mon, 28 Aug 2023 17:56:10 +0530
Message-ID: <20230828122614.3815122-4-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230828122614.3815122-1-Arvind.Yadav@amd.com>
References: <20230828122614.3815122-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|PH7PR12MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: 465fa6a5-9029-45e1-400f-08dba7c24e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OvKakjFhU5s4nyLfHf4blQkzZXDEFkIXwZoffmUi7Gk9bL0PmKEaFmWEeEJ29Yx9bfoCHfRH7WXU74eIr3tMqM4DZTCkLk3se6ia/lwIcxOCH/+SYMM/b06lSKkBll42iWD72FxRWHoKyihszJvAZYpk4fe6tLaNTP5vJ+XqLv7ZQFNYkz/6KJniqKOwuXuyroJdvXcrsu66B+qpa1z+KW4pVFw85/pZ0yTRlY+9eImXSPspxrXiUv73IsaNXvLfoabUJ9M/6+UI5pONjSZpfoV6WN+zj/clFfSwj925TEQ9BocJAU2W4gQfV9B+RBB/f7F7D9ZMQMwrrKHvt4YkSicb9e46Yz/B1jfa2vjOSFAevDWTR/XgeZaH0CTkPZ/pPUiv+hsqJSXGszXVLX1ixgQptJkLPvDIycCgf0VJ+yGpkAyzfcag6f7JiYLsoBU2DssHoTJRSviXaV1bSFhEWFKplepbHPFW8UZ6mMD7OGdFIzHBnKGjR/Zk5QH0w/laBQFuclEdP0PQBUrpASC1iybH9sHyvAdyELcerr23XEemX1ebPYQfCRT7X6up4kfPttOURHhIwHEeC7feea8x+p6/uWrqD8Vcnq/8NDLROspHvbjzZJyEzrS+1OPeDT8vxp58RHx4251a1jMjF0I/m+WYhZSJlOv0x2pgpC8Em13tkdO+1ftzh3rHUMS2fHPhZ4/vBbsxQhHx9mOAtypL0bFQMeOlgdfTtpCHIVW7mXmvnZ2y4fqGPX8wCwU9XKX7PwVGoHLZV0O2gPdZrlO8fg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(136003)(396003)(346002)(186009)(82310400011)(451199024)(1800799009)(40470700004)(46966006)(36840700001)(7696005)(40460700003)(6666004)(36756003)(40480700001)(86362001)(81166007)(82740400003)(356005)(36860700001)(47076005)(2616005)(83380400001)(2906002)(426003)(336012)(26005)(1076003)(478600001)(16526019)(110136005)(70586007)(41300700001)(70206006)(8676002)(8936002)(5660300002)(316002)(54906003)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 12:28:37.8390 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 465fa6a5-9029-45e1-400f-08dba7c24e23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7939
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

v3:
- Adressed all the review comment.
- Now clearing all the profile in work handler.
- Added *_clear_all function to clear all the power profile.
- scheduling delay work to clear the power profile when refcount
  becomes zero.

Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 118 +++++++++++++++++-
 drivers/gpu/drm/amd/include/amdgpu_workload.h |   3 +
 2 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
index 67eacaac6c9b..fbe86ee5b8bf 100644
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
@@ -58,16 +61,111 @@ amdgpu_power_profile_set(struct amdgpu_device *adev,
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
+		clear_bit(profile, &adev->smu_workload.submit_workload_status);
+	}
+
+	return ret;
+}
+
+static void
+amdgpu_power_profile_clear_all(struct amdgpu_device *adev,
+			       struct amdgpu_smu_workload *workload)
+{
+	int ret;
+	int profile = PP_SMC_POWER_PROFILE_COMPUTE;
+
+	cancel_delayed_work_sync(&workload->power_profile_work);
+	mutex_lock(&workload->workload_lock);
+
+	/* Clear all the GPU power profile*/
+	for (; profile > 0; profile--) {
+		atomic_set(&workload->power_profile_ref[profile], 0);
+		ret = amdgpu_power_profile_clear(adev, profile);
+		if (ret) {
+			DRM_WARN("Failed to clear workload %s,error = %d\n",
+				 amdgpu_workload_mode_name[profile], ret);
+		}
+	}
+
+	workload->submit_workload_status = 0;
+	mutex_unlock(&workload->workload_lock);
+}
+
+static void
+amdgpu_power_profile_idle_work_handler(struct work_struct *work)
+{
+
+	struct amdgpu_smu_workload *workload = container_of(work,
+						      struct amdgpu_smu_workload,
+						      power_profile_work.work);
+	struct amdgpu_device *adev = workload->adev;
+	int ret;
+	int profile;
+
+	mutex_lock(&workload->workload_lock);
+
+	/* Clear all the GPU power profile*/
+	for_each_set_bit(profile, &workload->submit_workload_status,
+			 PP_SMC_POWER_PROFILE_CUSTOM) {
+		if (!atomic_read(&workload->power_profile_ref[profile])) {
+			ret = amdgpu_power_profile_clear(adev, profile);
+			if (ret) {
+				DRM_WARN("Failed to clear workload %s,error = %d\n",
+					 amdgpu_workload_mode_name[profile], ret);
+			}
+		}
+	}
+
+	mutex_unlock(&workload->workload_lock);
+}
+
+void amdgpu_workload_profile_put(struct amdgpu_device *adev,
+				 uint32_t ring_type)
+{
+	struct amdgpu_smu_workload *workload = &adev->smu_workload;
+	enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
+	int refcount;
+
+	if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
+		return;
+
+	mutex_lock(&workload->workload_lock);
+
+	refcount = atomic_read(&workload->power_profile_ref[profile]);
+	if (!refcount) {
+		DRM_WARN("Power profile %s ref. count error\n",
+			 amdgpu_workload_mode_name[profile]);
+	} else {
+		if (refcount == 1)
+			schedule_delayed_work(&workload->power_profile_work,
+					      SMU_IDLE_TIMEOUT);
+
+		atomic_dec(&workload->power_profile_ref[profile]);
+	}
+
+	mutex_unlock(&workload->workload_lock);
+}
+
 void amdgpu_workload_profile_get(struct amdgpu_device *adev,
 				 uint32_t ring_type)
 {
 	struct amdgpu_smu_workload *workload = &adev->smu_workload;
 	enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
 	int ret, refcount;
+	int index;
 
 	if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
 		return;
 
+	cancel_delayed_work_sync(&workload->power_profile_work);
 	mutex_lock(&workload->workload_lock);
 
 	refcount = atomic_read(&workload->power_profile_ref[profile]);
@@ -80,6 +178,22 @@ void amdgpu_workload_profile_get(struct amdgpu_device *adev,
 	}
 
 	atomic_inc(&adev->smu_workload.power_profile_ref[profile]);
+
+	/* As we cancelled the delayed work, check and clear the pending
+	 * power profiles set by previous jobs which are now done.
+	 */
+	for_each_set_bit(index, &workload->submit_workload_status,
+			 PP_SMC_POWER_PROFILE_CUSTOM) {
+		if (!atomic_read(&workload->power_profile_ref[index]) &&
+		    (index != profile)) {
+			ret = amdgpu_power_profile_clear(adev, index);
+			if (ret) {
+				DRM_WARN("Failed to clear workload %s, err = %d\n",
+					 amdgpu_workload_mode_name[profile], ret);
+			}
+		}
+	}
+
 	mutex_unlock(&workload->workload_lock);
 }
 
@@ -90,6 +204,8 @@ void amdgpu_workload_profile_init(struct amdgpu_device *adev)
 	adev->smu_workload.initialized = true;
 
 	mutex_init(&adev->smu_workload.workload_lock);
+	INIT_DELAYED_WORK(&adev->smu_workload.power_profile_work,
+			  amdgpu_power_profile_idle_work_handler);
 }
 
 void amdgpu_workload_profile_fini(struct amdgpu_device *adev)
@@ -97,7 +213,7 @@ void amdgpu_workload_profile_fini(struct amdgpu_device *adev)
 	if (!adev->smu_workload.initialized)
 		return;
 
-	adev->smu_workload.submit_workload_status = 0;
+	amdgpu_power_profile_clear_all(adev, &adev->smu_workload);
 	adev->smu_workload.initialized = false;
 	mutex_destroy(&adev->smu_workload.workload_lock);
 }
diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
index 5fc0bc2a74a4..596a962800e9 100644
--- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
+++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
@@ -46,6 +46,9 @@ static const char * const amdgpu_workload_mode_name[] = {
 	"Window3D"
 };
 
+void amdgpu_workload_profile_put(struct amdgpu_device *adev,
+				 uint32_t ring_type);
+
 void amdgpu_workload_profile_get(struct amdgpu_device *adev,
 				 uint32_t ring_type);
 
-- 
2.34.1

