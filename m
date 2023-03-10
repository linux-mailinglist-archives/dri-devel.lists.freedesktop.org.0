Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CED66B336F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 02:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C06810E91E;
	Fri, 10 Mar 2023 01:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8604910E91C;
 Fri, 10 Mar 2023 01:01:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNjKWdp8UiUM77V/y0DH+WkxSgQGXg/s5crPpfjjZcQvs3zp8Nh6i95zhSHS7Gtqm4/N/oELLRd0dMJ56j+ovJw2VgznHaJPxlQ/VTZvRnN/QC7pP/cN2+9OmOCVA9pipOaFKch/lerrQGsNTK4nbIRBPdxpxNFaEeQkfVg8uNb3vAueSpNxVqvAUhyPJaiB/Ok3k/Knz9uXN3EbkmjGQDmGlFNjBFePDWZgrU6TYoknCNdgU2q0gOngXUzL3uokT9qf6VlOLGe53x57o6FehXqWj12YnMyCQapJuZZh52Cujmt1itGmYGHB3u+XTh5P/mTMqhJJPTbGP/PeSftirA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWLmDO4KucMeWUOJnWo/AWyJhuYxu4raCdgM0ilL6fo=;
 b=FGEcPtUbX3R8c89QKTDeyusZpGPeWCobPD+68YAJxzf/9SggJBlf3pcTxVOiSsIYmr/BOGOUy1bDcwQZkm4Dx6Sca/Y+Cpf1SbNeadRzQf+G3M/6O4SplZHpk/vGdDP9GK8sDbJNsU1bv1gKbeJ5ht+ycRsFuF60V+rBw5rqXR3ItsWljjCRlqtFrxlTtavRBN1H04m4Of3576a9gKEQmWMHz09U3nXPc7NABRniE2G4gSUtmmYSSlgywKBpKNsfT56GC8WpmTqYJW5umMQ6MLHhHv0FiWiz4ySxzLWeSoWIBqP/F93HxjPdsOgcWSaj+9l281sz+H96P7E8Lyiy/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWLmDO4KucMeWUOJnWo/AWyJhuYxu4raCdgM0ilL6fo=;
 b=1RqJxCOLfW1iXQiVzjk4gud6SQCaJm5EeaUz+wbyg7JJ3p/ifYsNvrQgANhKcK2ossOK417K6WZwkbpGzzEzBB6rlgszAqPahHd8ft2UYPAS5i49KZEbvk6dyXQTHZ5O4Wds2TH5lZWx543YCOfIgc8TKIbpFmLSdFWPUHyHv5E=
Received: from BL0PR02CA0092.namprd02.prod.outlook.com (2603:10b6:208:51::33)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 01:01:31 +0000
Received: from BL02EPF000100D3.namprd05.prod.outlook.com
 (2603:10b6:208:51:cafe::87) by BL0PR02CA0092.outlook.office365.com
 (2603:10b6:208:51::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Fri, 10 Mar 2023 01:01:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000100D3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.17 via Frontend Transport; Fri, 10 Mar 2023 01:01:31 +0000
Received: from guchchen-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 9 Mar 2023 19:01:08 -0600
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <alexander.deucher@amd.com>, <hawking.zhang@amd.com>,
 <dmitry.baryshkov@linaro.org>, <spasswolf@web.de>, <mike@fireburn.co.uk>
Subject: [PATCH v3 1/2] drm/amdgpu: move poll enabled/disable into non DC path
Date: Fri, 10 Mar 2023 09:00:52 +0800
Message-ID: <20230310010052.2810468-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000100D3:EE_|MN2PR12MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e98091-a149-48c4-5fb5-08db2102fcad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cgo+RrY7CA9tyPGpHgZ38Onk1Un8b2DCxiiSABijVITNqdwwOaCGrEwEBVc+WlMP/taPOoAnCMhHHX5FKy/34gHzJZI9M60qyA4yU/JS/DPwHyBvRDqRF3bBJPEcw41XGg2Tlsm0mAodkLKm/jKpk11KPnjKRPoPAmAnraD37lj7QtSQQHEsUCXSuNSmYMo2Zus/329dnAtGept3XBFWY5LHtL5UbPHYT1HGWLWKaxmSdIyY+nOOOK7iPsUYtxv9c2VlFmezzIQsPqJvsHfgJn3ZrwVA0yeip2d2fW5ss3iGqxToxAsAvsdLL52CTu7dEPLyU8kyLPZVS0jb+70ikLVgbwVbGK16alERF2tFEE5WRXlao+Ng/96vSRvkBsxu2UXi2/tWXzru3onWScG1UANyHu93DxvLLCTvbd46Y0IRwTH45Zhp/yPUwtTLZmQoYheH9wD11YgHkkXmmn4NJ5eKHDmK62gCYEBuaMZkeuCYL9vCed082G+3ybpqw0pvNQTr0cGhqxmtghLU6ZmZqnB3rjt+UKobWBSi58oOKA6Pjw0vETeDKUAuU5mY0yqWaJQM2IFDSPVN/C4F6I6Xh86t9EDlZT0h/+vR+Cxi7ipBRfCQIOMVbJ4EOIvu9SxoiFfN/S4piRMQ72QsFj2N7s4Qk4iOUHnmcQa72uX9ijAW5Qmk5xHhuJe8r/GHCkWc
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199018)(36840700001)(40470700004)(46966006)(36756003)(36860700001)(966005)(7696005)(82740400003)(186003)(1076003)(2616005)(40460700003)(6666004)(16526019)(41300700001)(26005)(478600001)(83380400001)(40480700001)(8936002)(47076005)(4326008)(8676002)(70586007)(2906002)(70206006)(5660300002)(44832011)(426003)(356005)(110136005)(316002)(86362001)(81166007)(336012)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 01:01:31.4522 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e98091-a149-48c4-5fb5-08db2102fcad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000100D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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

drm_kms_helper_poll_enable/disable is valid when poll_init is called in
amdgpu code, which is only used in non DC path. So move such codes into
non-DC path code to get rid of such warnings.

v1: introduce use_kms_poll flag in amdgpu as the poll stuff check
v2: use dc_enabled as the flag to simply code
v3: move code into non DC path instead of relying on any flag

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2411
Fixes: a4e771729a51("drm/probe_helper: sort out poll_running vs poll_enabled")
Reported-by: Bert Karwatzki <spasswolf@web.de>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Suggested-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 4 ----
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c4a4e2fe6681..da5b0258a237 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4145,8 +4145,6 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
 	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D3))
 		DRM_WARN("smart shift update failed\n");
 
-	drm_kms_helper_poll_disable(dev);
-
 	if (fbcon)
 		drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, true);
 
@@ -4243,8 +4241,6 @@ int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
 	if (fbcon)
 		drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, false);
 
-	drm_kms_helper_poll_enable(dev);
-
 	amdgpu_ras_resume(adev);
 
 	if (adev->mode_info.num_crtc) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 503f89a766c3..d60fe7eb5579 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1618,6 +1618,8 @@ int amdgpu_display_suspend_helper(struct amdgpu_device *adev)
 	struct drm_connector_list_iter iter;
 	int r;
 
+	drm_kms_helper_poll_disable(dev);
+
 	/* turn off display hw */
 	drm_modeset_lock_all(dev);
 	drm_connector_list_iter_begin(dev, &iter);
@@ -1694,6 +1696,8 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
 
 	drm_modeset_unlock_all(dev);
 
+	drm_kms_helper_poll_enable(dev);
+
 	return 0;
 }
 
-- 
2.25.1

