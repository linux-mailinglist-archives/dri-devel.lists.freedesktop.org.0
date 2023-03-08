Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5966B06C1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 13:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57CC10E0E0;
	Wed,  8 Mar 2023 12:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AF710E030;
 Wed,  8 Mar 2023 12:17:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNEQSarEITENvR4g/DXD0AdcPiobZLU3lSAtWKmbP5qEqG4n2lfhlkkVxzZxDAkZwe7IXJBaaePPaA9LAO9QZX2Q8hakLX4XTupyH5Z1YhplR9+uMAvGL2ESm/eG3wDGaJih1LLPlzVV1mECrQrlj5ffDypnrEWPPQdivPNo7BIdP6elN4GHd6KtZ3KbXI6j/JeQtiwTfky+UAZkiRhSIY/nc76BdDJyxIWZJzEWgdYSD6JqRjUc2418bCt12k6M5Zhn4Qv6b86rVbCf7sZCOy8x6atf4G/68VU2bpmgBuqMQX0Oh16zrMGytELIvn2fDr+5g4AG/rblSa4NTjXMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mk0hqcIXl2jOS9JWR5lj8LPPQkBuWbkwjg9xKHnu/q4=;
 b=Zeqfswm6Se/4luhX4CsZU6y8VKP18wIuT0HRpXeDoNUd5Hazlx7JpwN2r6KNRLothS1XLRKRppkl7Mnl9u2mMr+35SeVht1N5EOMbBssteodSi/eUONbeK+lnw7Q1TZ7OfPY1YwuyqqQU42YQZbhpYY2iOU9kg5mxkuSl844m0+aZ+wY8i1bKxaM0e8fefrd2QxiBSGs55bzxS7RqiywN8vZJSUD0h9kDJJu3Fmq+2zPJIU3skkPZNE5izIwcyjiPP7VXRZKzjGIYKYr4t1JwEBBG05YzVU5Gay8CJxwHzLLeamgCw/w4+NLl7COKxHvO/9we2HjHJhP2+qEezPJqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mk0hqcIXl2jOS9JWR5lj8LPPQkBuWbkwjg9xKHnu/q4=;
 b=MAXXeQ1NTEggEMikZkBUrR6YnGN611FHBOe0vjm115kzCHnNRsq6Lgb2q8HFvMHK9N39YnVNyirGpRxqjK4ewbxqRJOTzu4VYwO+65gtM+UgMmRhK+yqfo93KBakW3DPgvsSdlTvQdLgldJ1eJMvEaT7wDu7Hhoh7ficiu7ieUE=
Received: from DM6PR05CA0057.namprd05.prod.outlook.com (2603:10b6:5:335::26)
 by CY5PR12MB6226.namprd12.prod.outlook.com (2603:10b6:930:22::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 12:17:08 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::4a) by DM6PR05CA0057.outlook.office365.com
 (2603:10b6:5:335::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17 via Frontend
 Transport; Wed, 8 Mar 2023 12:17:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.17 via Frontend Transport; Wed, 8 Mar 2023 12:17:08 +0000
Received: from guchchen-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 8 Mar 2023 06:17:05 -0600
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <alexander.deucher@amd.com>, <hawking.zhang@amd.com>,
 <dmitry.baryshkov@linaro.org>, <spasswolf@web.de>
Subject: [PATCH 1/2] drm/amdgpu: add flag to enable/disable poll in
 suspend/resume path
Date: Wed, 8 Mar 2023 20:16:49 +0800
Message-ID: <20230308121649.2586705-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT026:EE_|CY5PR12MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: d52c7ab0-e696-4a06-6657-08db1fcf099a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q1+xn/z7WICrlKnLgZ0hbks0pIy0m/LEA8x2ceqDVtisZMCSBwCg0u4w0HVKmwYFKjgcoiG5niFYTxjZenX81dYzo0yDiOEHYbnf8UQN2FdXhvOqvoORcCH8VaB+qhByPp+dc2+QwRcnUHvhpbm5lR9dTlBA41G68T+5Pni97Ct60eI+r28ZnRRKvuF0gpTIzmliwImQpv5dHZT7482qIhOam0Teg4uZKEDpUsYHcetV6ey2nutxhTVn3fAAUjCpPIm95SkkZpx5LfLFcXbAknh1iZGcUOUVtHqS8AWZ2SoZM5v3WgIgsUP+R7WW9tPieXyw8mzDSmeKAplNp8DYH38KCeIMPKgtBQVskuTDiKqG6AyVTTAQ7kHdVBVTF0RFcooqKdIpH/r42wZ7fpfTn37BK+wZE2Bwt+wmO2FR1Zyo33097bNOVufx96T6KC5elJ01j1lDK0jy/pXjkL4geaBm3jbRGuGns2/+1lWNo2doRF18Crr36lCJzRVsuyoU737DQTjFS7HG42lQLg6VbcC6fU7lclBRRmTYghfDtI9zkjKADWoXtHomW77NLGL/oi+i/bJ8DUcDvGHNVNhCwzrGwip6IIe5JnWAdgyMOv1vKiSNtW9aTCBDq5QkeoJagAM05LNwvZfvBm6KFgSQEGwq6dGSf7PtYyo1xilUwKI/oguXtnnsO7Fi2aJIlc6d
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199018)(40470700004)(36840700001)(46966006)(8676002)(41300700001)(70206006)(70586007)(4326008)(81166007)(2906002)(356005)(7696005)(316002)(8936002)(110136005)(82740400003)(186003)(16526019)(5660300002)(44832011)(478600001)(82310400005)(15650500001)(36860700001)(40460700003)(36756003)(966005)(6666004)(83380400001)(40480700001)(26005)(1076003)(2616005)(86362001)(336012)(47076005)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 12:17:08.2080 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d52c7ab0-e696-4a06-6657-08db1fcf099a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6226
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
Cc: Guchun Chen <guchun.chen@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some amd asics having reliable hotplug support don't call
drm_kms_helper_poll_init in driver init sequence. However,
due to the unified suspend/resume path for all asics, because
the output_poll_work->func is not set for these asics, a warning
arrives when suspending.

[   90.656049]  <TASK>
[   90.656050]  ? console_unlock+0x4d/0x100
[   90.656053]  ? __irq_work_queue_local+0x27/0x60
[   90.656056]  ? irq_work_queue+0x2b/0x50
[   90.656057]  ? __wake_up_klogd+0x40/0x60
[   90.656059]  __cancel_work_timer+0xed/0x180
[   90.656061]  drm_kms_helper_poll_disable.cold+0x1f/0x2c [drm_kms_helper]
[   90.656072]  amdgpu_device_suspend+0x81/0x170 [amdgpu]
[   90.656180]  amdgpu_pmops_runtime_suspend+0xb5/0x1b0 [amdgpu]
[   90.656269]  pci_pm_runtime_suspend+0x61/0x1b0

So add use_kms_poll flag as the initialization check in amdgpu code before
calling drm_kms_helper_poll_disable/drm_kms_helper_poll_enable in suspend/resume
path.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2411
Fixes: a4e771729a51("drm/probe_helper: sort out poll_running vs poll_enabled")
Reported-by: Bert Karwatzki <spasswolf@web.de>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Guchun Chen <guchun.chen@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h   | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c   | 1 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c     | 1 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c     | 1 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c      | 1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c      | 1 +
 7 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c4a4e2fe6681..74af0b8c0d08 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4145,7 +4145,8 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
 	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D3))
 		DRM_WARN("smart shift update failed\n");
 
-	drm_kms_helper_poll_disable(dev);
+	if (adev->mode_info.use_kms_poll)
+		drm_kms_helper_poll_disable(dev);
 
 	if (fbcon)
 		drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, true);
@@ -4243,7 +4244,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
 	if (fbcon)
 		drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, false);
 
-	drm_kms_helper_poll_enable(dev);
+	if (adev->mode_info.use_kms_poll)
+		drm_kms_helper_poll_enable(dev);
 
 	amdgpu_ras_resume(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 32fe05c810c6..d383ea3e8e94 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -343,6 +343,7 @@ struct amdgpu_mode_info {
 	int			disp_priority;
 	const struct amdgpu_display_funcs *funcs;
 	const enum drm_plane_type *plane_type;
+	bool use_kms_poll;
 };
 
 #define AMDGPU_MAX_BL_LEVEL 0xFF
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 53ff91fc6cf6..3277799a80bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -518,6 +518,7 @@ static int amdgpu_vkms_sw_init(void *handle)
 		return r;
 
 	drm_kms_helper_poll_init(adev_to_drm(adev));
+	adev->mode_info.use_kms_poll = true;
 
 	adev->mode_info.mode_config_initialized = true;
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 9a24ed463abd..f4d0a7cf588b 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -2842,6 +2842,7 @@ static int dce_v10_0_sw_init(void *handle)
 		  amdgpu_display_hotplug_work_func);
 
 	drm_kms_helper_poll_init(adev_to_drm(adev));
+	adev->mode_info.use_kms_poll = true;
 
 	adev->mode_info.mode_config_initialized = true;
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index c14b70350a51..25d0a866ca28 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -2961,6 +2961,7 @@ static int dce_v11_0_sw_init(void *handle)
 		  amdgpu_display_hotplug_work_func);
 
 	drm_kms_helper_poll_init(adev_to_drm(adev));
+	adev->mode_info.use_kms_poll = true;
 
 	adev->mode_info.mode_config_initialized = true;
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 7f85ba5b726f..3936c6bfe2e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -2720,6 +2720,7 @@ static int dce_v6_0_sw_init(void *handle)
 		  amdgpu_display_hotplug_work_func);
 
 	drm_kms_helper_poll_init(adev_to_drm(adev));
+	adev->mode_info.use_kms_poll = true;
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index d421a268c9ff..29fb837f5ebf 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2744,6 +2744,7 @@ static int dce_v8_0_sw_init(void *handle)
 		  amdgpu_display_hotplug_work_func);
 
 	drm_kms_helper_poll_init(adev_to_drm(adev));
+	adev->mode_info.use_kms_poll = true;
 
 	adev->mode_info.mode_config_initialized = true;
 	return 0;
-- 
2.25.1

