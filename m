Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9970E6B1AF2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 06:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B04A10E78D;
	Thu,  9 Mar 2023 05:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A9E10E0BF;
 Thu,  9 Mar 2023 05:48:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/Jd6zyMwa/yR2K8IyWraBcBqTL2f03W1Oov4Wdo0kNIgw1SPotgg/xn0tvP5pfkUg4xKAm9cS390tsqG7Za4ebJTXfeLZRNa3HbPAhosySiyA/zoW2GltX5jQwi9MudtLi/LTyqgekyGmwP6waEHCi2En7dTdOONwvUNjMBysECLIOXD6rHIt0KxlCShb2TTD5avdC7/Z0pdZR4Ag+hsfVGL4AyNYHftZRbGtBFcYaODu3W0hCpuUCsDO3Qm+g0hdY6BOTTPgvka0VeYKBtRa15c8MsDfjzYtiT+M87sJiuX001bEMtD7QmW9qkNCRjkOeODJjaizxEbJ9N9kHNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUxrncIEplV1dk1Zto5rY5xzp8SKpKpkEIzU4l6PLVY=;
 b=OfMi2oYUFz+KGvpeoXLnTKZr3wZfmKNikJNC3CrFO/dRCfTKOwBrO5OeBe70jZLph5/1znXYDRMEPbhFBUjdD4VoUKSlZGartBLFnSBJu2B29g7WkHrhBgPsU/GPunccJj2E+K0tch+sni9Inu3pAEg/p6AvMYUo1OVhWXJVv83qjNq/OpBT3lAi80Oj78qC/VIlQqy2voe9Pd4g71evhywI24l3ZfBZY01etrGcEGnvuP/x3gI1TV9yBMJz4wxufJUk/sCqQun0j+d7fjaAWCQb7/+Dtfo9EvIQ6U3AnG7fLBTCdrjozSO/pEa/whFJAWrXOSXdinhYGyDO73v2XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUxrncIEplV1dk1Zto5rY5xzp8SKpKpkEIzU4l6PLVY=;
 b=gVYMfmB5velXujBKJSHvmRFKJqJkeEXF/r0FHoTBfPhCBy+joAfqIMWcVHPMIC+NPev6Qpb/k8tznZTqaGEQy5HeliRNIFZaLWwc/IxYbAE5sIOyOFpztBvKtR5unjmOMzSMN0liQYcnonUx2MAwXY7MKQ2On+vZv2otlCVXgYY=
Received: from CY5PR22CA0002.namprd22.prod.outlook.com (2603:10b6:930:16::11)
 by SN7PR12MB8130.namprd12.prod.outlook.com (2603:10b6:806:32e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Thu, 9 Mar
 2023 05:48:25 +0000
Received: from CY4PEPF0000C977.namprd02.prod.outlook.com
 (2603:10b6:930:16:cafe::e6) by CY5PR22CA0002.outlook.office365.com
 (2603:10b6:930:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Thu, 9 Mar 2023 05:48:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C977.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Thu, 9 Mar 2023 05:48:25 +0000
Received: from guchchen-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 8 Mar 2023 23:48:22 -0600
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <alexander.deucher@amd.com>, <hawking.zhang@amd.com>,
 <dmitry.baryshkov@linaro.org>, <spasswolf@web.de>, <mike@fireburn.co.uk>
Subject: [PATCH 1/2] drm/amdgpu: move poll enabled/disable into non DC path
Date: Thu, 9 Mar 2023 13:48:01 +0800
Message-ID: <20230309054801.2709152-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C977:EE_|SN7PR12MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: f218ab99-964e-48fd-ce15-08db2061e651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: brHOxEkkzYmQN2SEUkqUCzdUSsAe5qjaY0giVh3bp0vUaXJ+Ub9aM9WhPJpqvqa/xfogK/voVH+O7vXlBxNnc5N5iWqX+bNsV+JZ/dIJndHtyCHFuValKRFxkwLKm/6LYeIuHeDTgV3DFuR8ginf7+rFmZ34QDzkDRX1xLmqs8xurwMTCEDeizPmAijIp+Y9tie3j8fxycLt1ospWc977vZmmtRKJv/pjEo+Ll5ETEb3LO4Fz2mrEXCTY0s8ak7Y0YA7UQJf0qLRzxAXNegDVs2rZUicd0bprEKZUXWvRnwEBKOIgf4OUMDyDjahIxt5I5ZOmc40oGjKQ5sNnVPbcqHL7VYkYHsebeaEhP/Lr+NN1Bcfv9ZQWJwI0JFZGRFs3aS+E0ZpGF3H2EGUuo8pq69e1+xppoTKHJFxZe6nE9RVVgitTNR9Tsp/TpxrXKAXA8YZYVHvVELqNgoU/uQtzs9G8kiZzvWlwv1kCYLHsvcghHmVLIrT1a/1n1bltL0TuT/AiHrtq+oGQne/jQUG5jjS+4t5K6c/oF2As0n2sCAcBAsIcAKhwR8UIDRfOcbc2ubqVl2wfMM/8pjro3TZMPVjTD+g+S8EyL8pDCsM9I2MEqY3zYIlcBmdd5+C8tnZXWt5Lw70qRdlSui7qG0uorStgVOZ5QXYg0P2YqwMPBKP+MENFEH1/cPTkZfci8tc
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(110136005)(82740400003)(316002)(2616005)(36756003)(6666004)(478600001)(26005)(81166007)(1076003)(36860700001)(336012)(70586007)(8676002)(70206006)(2906002)(4326008)(40480700001)(41300700001)(86362001)(82310400005)(47076005)(356005)(8936002)(426003)(44832011)(83380400001)(186003)(5660300002)(7696005)(966005)(16526019)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 05:48:25.0000 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f218ab99-964e-48fd-ce15-08db2061e651
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C977.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8130
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

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2411
Fixes: a4e771729a51("drm/probe_helper: sort out poll_running vs poll_enabled")
Reported-by: Bert Karwatzki <spasswolf@web.de>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Suggested-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Guchun Chen <guchun.chen@amd.com>
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

