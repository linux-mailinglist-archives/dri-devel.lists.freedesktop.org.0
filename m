Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8774F7823F3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B2F10E1ED;
	Mon, 21 Aug 2023 06:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AC810E1ED;
 Mon, 21 Aug 2023 06:49:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TuFAQKE3QDfjAJkZOV395TFGrtMjqToykKQ+1vHGPg7pbueJ+/fGqfbScDgQF6ul1oY6eGYoyHfCW7zLqJkjhK7z/mnUh+ud9kCxTgPN7Oa+lSJdk2XEsJRkyYEWokdW2go7DVJCOQgklRbNFZKnRJKI+EWF+NmBWTgB6bowqEJhsU/DoYNkjD9OYRes9zt4okN6oI/OIXN2aDmUhNVytdnXq2rtA1EUSkXEhQfuo7o06mlUCpPtPS2vsjqBeNcOHrRRDJ3SSTnK9k31NGGGokuLxTEg68dGNRojMNepoOn9RoxzMpYk4dXsMTTHVBf6yYkaWmsiW2mJ/2D/juWeqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfBKkf3GTNxwnx22Mi5JbYNmfgDSBXfsvfOK+60+xNc=;
 b=BzWmRR2qdpAitecWDptkz3q3Kl3OdhpsXvhJMFxZAZLWlw6zZ6xTSFeifbpJK+kQ562zaz5Bex30BLqEQCvRJ6AU7ApLkDIXUgiCeYiFclC9NattrUKAQpfYIR7VX2KZecOd2VTS4pmlWavnYkSurkZZ6EA63lX3XOc1ODCmnHCBufCzv8QBoU3ScpOwMs6QvLlGEQzouFrjuHewSnakpKA58+4tHwNkaTYM/RXtt4Tvl4HQSgXqKRrUwaVDR4JwlQRxQbpbs9rXH6QQXSOB9REcuabRtNBguIUURerR3VwEp2Ll9BDnR6XaHKa0Eng1zOdRyx2o6Y2ZOQf0NBVPjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfBKkf3GTNxwnx22Mi5JbYNmfgDSBXfsvfOK+60+xNc=;
 b=sPdMVMchJNfxeB0k2yEZP/rRsZj/PfRzt6CVRYnauNjfF6eLPUymuwpOxvFh85mlS9EA6jJ2veMjFCVJgceUZGmDmeVg/ozQQWPTjOoRKZQiiyJ0AHicgShxiiJQbAXiAcCi6QBeg3D7juDFOVCLkAvzGa0w1qMxrNMXu7rip/c=
Received: from SN6PR2101CA0006.namprd21.prod.outlook.com
 (2603:10b6:805:106::16) by IA1PR12MB8406.namprd12.prod.outlook.com
 (2603:10b6:208:3da::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 06:48:59 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:805:106:cafe::55) by SN6PR2101CA0006.outlook.office365.com
 (2603:10b6:805:106::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.0 via Frontend
 Transport; Mon, 21 Aug 2023 06:48:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Mon, 21 Aug 2023 06:48:58 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 01:48:55 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 4/7] drm/amdgpu: Add suspend function to clear the GPU
 power profile.
Date: Mon, 21 Aug 2023 12:17:56 +0530
Message-ID: <20230821064759.94223-5-Arvind.Yadav@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|IA1PR12MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: 7531ad7c-4f3b-415a-d155-08dba212b26e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YkX6R5DcqDCFDD8NrtF1M2BWzzKuWcowiAUCiR/ImEyffZHERddHOO6UZm017gGOFkmICXMVxxxBflNCdk+y6VP+hMkdB3nMaVgaoeJ9LbVgH1ePjY31LrKykyEse/NpdKq8QAtg2yrzns0XLb0WHQGndlTnbvai3PvZrAjeGr+VORifqUF2z5jV57olNDvBzH+XBJwxhSf0sJbnH3FrIE1XxJOuPxO2KyTphJF4P9Z0Am4VLMSj1uJBcB2tXT594WwbkZi2ys7d9yKmML+YwX4e6b2d/qt9rfcRXDTBjwJnYseo66AWDtvKOO/EQnh6uOdlCkZwqOwaDicSKovJbZNqYTcMZBGAy91SGKOQPq2bcCXJkKCO6nUKzxC3k8WAsYVRzeXOzULv8j3XH9B8U+8tnRPNwxp7w/+wofKNGNzvL3jzZcTxsK7nu+xHE2zJ+1M2gHUKC/6wbq5kUvxyHBX5Rt7Ox5Lxl5uR2RBZcoNEp3xe2QLMcIJExB8LfMxI+5kc/aLWlno+W8QnJcwQeXwcF6Tav9+seGYhXEm7qVN0z39haGvfLsfnyQZtYzWpA+1l1PIhsCcRYMM3h/FICnArXNCjgQlIyCY0Aoguqlslod44kGiOMNLwIT+AbHWnHZc7exwMFdU/YYnxWewPEDMS9PyicDTFcyx9hNngTGteVzVrAWl/M1vGCbTm/sUM0O9PmPlujdLRbyTaN31lKqzkFNdqfl5yZqDjAyF9XJaOSJNqpbq2D6nz2kv8DHIuA+dOgQUqlq2n+kbRc484XA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(186009)(1800799009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(40480700001)(86362001)(36756003)(356005)(40460700003)(316002)(70206006)(54906003)(70586007)(478600001)(110136005)(41300700001)(82740400003)(81166007)(7696005)(16526019)(26005)(47076005)(426003)(1076003)(336012)(36860700001)(8676002)(4326008)(2906002)(2616005)(83380400001)(15650500001)(8936002)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 06:48:58.9150 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7531ad7c-4f3b-415a-d155-08dba212b26e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8406
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

This patch adds a suspend function that will clear the GPU
power profile before going into suspend state.

v2:
- Add the new suspend function based on review comment.

Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 23 +++++++++++++++++++
 drivers/gpu/drm/amd/include/amdgpu_workload.h |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index cd3bf641b630..3b70e657b439 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4212,6 +4212,8 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
 
 	amdgpu_ras_suspend(adev);
 
+	amdgpu_workload_profile_suspend(adev);
+
 	amdgpu_device_ip_suspend_phase1(adev);
 
 	if (!adev->in_s0ix)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
index 6367eb88a44d..44ca8e986984 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
@@ -174,6 +174,29 @@ void amdgpu_workload_profile_set(struct amdgpu_device *adev,
 	mutex_unlock(&workload->workload_lock);
 }
 
+void amdgpu_workload_profile_suspend(struct amdgpu_device *adev)
+{
+	struct amdgpu_smu_workload *workload = &adev->smu_workload;
+	int ret;
+
+	mutex_lock(&workload->workload_lock);
+	cancel_delayed_work_sync(&workload->smu_delayed_work);
+
+	/* Clear all the set GPU power profile*/
+	for (int index = fls(workload->submit_workload_status);
+	     index > 0; index--) {
+		if (workload->submit_workload_status & (1 << index)) {
+			atomic_set(&workload->power_profile_ref[index], 0);
+			ret = amdgpu_power_profile_clear(adev, index);
+			if (ret)
+				DRM_WARN("Failed to clear power profile %s, err = %d\n",
+					 amdgpu_workload_mode_name[index], ret);
+		}
+	}
+	workload->submit_workload_status = 0;
+	mutex_unlock(&workload->workload_lock);
+}
+
 void amdgpu_workload_profile_init(struct amdgpu_device *adev)
 {
 	adev->smu_workload.adev = adev;
diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
index ee1f87257f2d..0acd8769ec52 100644
--- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
+++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
@@ -52,6 +52,8 @@ void amdgpu_workload_profile_put(struct amdgpu_device *adev,
 void amdgpu_workload_profile_set(struct amdgpu_device *adev,
 				 uint32_t ring_type);
 
+void amdgpu_workload_profile_suspend(struct amdgpu_device *adev);
+
 void amdgpu_workload_profile_init(struct amdgpu_device *adev);
 
 void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
-- 
2.34.1

