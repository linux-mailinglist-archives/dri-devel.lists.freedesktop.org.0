Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DCD49BEA0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 23:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1406D10E5A4;
	Tue, 25 Jan 2022 22:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21D510E5A4;
 Tue, 25 Jan 2022 22:38:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIo46iiGbR09Ue/UAZpyVMSVtN2t3nJTj/Y38iLUh8JpHUPngitUZShngIrvgkRiqGl4rNADE4g/QGg7VWvwtsbK8n1aLpkwsmB01S06M4y0bqDo2mbv4grfnbBQ74+2vnFtnWG+pBW3DAVYRbJ4JGzr2ZWNCGPPWx1RLlhnv40wypM4PvMix70QuOq9huzk2NCyj387pSgPywZ56IlgjAjxA257uZAxzQWplEHMXZXBlQ05om7Fv7D2zrnCyMbHzw1RmDv335X+WljRZEVXHBEig1dokQs1ZhO8zOTbMrTLIF77FU+TekXztyRe6ZSyfRogti2SWtQWZZnSDo6VTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jDyLVNTFQabu8nZ8kZWGIAPZD4i5irSpsyZpfcEzBU=;
 b=SnTWlag5nmp0WEwSllWd9zs5e0QsGt/Lq+1csSy0oAO3X99vuVhkuJSb/IezOpQr2yBuNKgbbL4/OwM7URI8i43ZN4vqx6WhrF0y/oxRWJOXlBLGlTMg7C8UacKoTn2iqE6XiECWHd5I6VJrujq/1nfbMyxt9xUeX/cq4B6AbUPMki1703duixeZVofoKDVUE/4Pvt4OdqVSsvzi/lal6LfRTd6Q0wMXWwjk5xu4HwlyDOX7ybVz+moXaTXGkYveva/37/AqlyeuRVg4inwbRh+CDp0p43lQzubbqKqwprrKEKORBSO3OsgadtTCGGIEW7/iTk0elXi5giUj/e5j3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jDyLVNTFQabu8nZ8kZWGIAPZD4i5irSpsyZpfcEzBU=;
 b=hLEuuckbMZEWcwhOV73qDD6lBduiwxMfLrtGOEevGTUGLwgNWL3opilYNZ3m29ZVKT1ubR3Vmn/SrF3shQ+dm30u0N1Eqnvw+eS7nztYTZurWRPZ1/MUo4ymAww8bxERNZtJiZFADu4x7ruljil0trXpl9/Ev7snI6RGb4yyuao=
Received: from DM5PR18CA0085.namprd18.prod.outlook.com (2603:10b6:3:3::23) by
 CY4PR12MB1176.namprd12.prod.outlook.com (2603:10b6:903:38::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.13; Tue, 25 Jan 2022 22:38:18 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:3:cafe::b9) by DM5PR18CA0085.outlook.office365.com
 (2603:10b6:3:3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Tue, 25 Jan 2022 22:38:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Tue, 25 Jan 2022 22:38:17 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 25 Jan 2022 16:38:16 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v3 01/12] drm/amdgpu: Introduce reset domain
Date: Tue, 25 Jan 2022 17:37:41 -0500
Message-ID: <20220125223752.200211-2-andrey.grodzovsky@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: fd593564-7dc8-475c-da8f-08d9e05361f2
X-MS-TrafficTypeDiagnostic: CY4PR12MB1176:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1176BF6467331D67289B4928EA5F9@CY4PR12MB1176.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /uB39u2WGOHi4Lvul5xs2sZrfezLcHBO3Fh2exkjSiHqKkXQlj+wfkoWnsScQLimeSI8oUKChmS3wklcqMaymnROkHtP0nHgBFggOfkx4/t4OdWc8TOxKp9/benCaV2vQAAEwQcJMbyEHKs31Y+FiqvrgIs9WP+s8Y+BB6v1a9ECbq4V4SssuqBTfLIkPzGEx3N9nuzjX4rf+Ly5uhVY4rDEWsFp7e1ycma2Fldwd2pniULN7fiVKRz8Vk9E+NdICJlH5Z+Ue2Oa1h2KjLf6D+qKnBMhnmb1HgJ6n1mo162nQsNDwerXpa89G3Fsnt8MGfQa9FXqtCApf75Io5Qg6/oXT2lHAmpDXatp9O0WkkA4uf1xX/gT3OGd4FyQvHLjzgerMjmelZxBTGyiVYckIKpyMJm1MsmGfUT9XxO1IA1yXJcD4k+X6Hio6lKbi5S8Yk7rX+VwbTc6rhYRACOS0+Dtl2ZPwUsagXdAQ0cYpgK0dAkLHKB2VQiU/Als9tNhQlPrT13zo+nXrcrtsfrirBOy46SVSdDQD/Sv4JtKCMCf3V1TsbA1D61KS3FngsIdLk0d1FDNvJ1f8C2hRIc/IfWbR7yWIkfnyRJyunMj0GJutzrXn4XtNbRnEcvgwk0tsCIAZLrRHYbnSaOLtCaNbAZUYMKd5s9Cd1Tnm60O+Izf6Oc4BWnZlAXFVVxRakYXeAzyOusvNf7uli7lDdRGEDLuFA+T1Q2RAlJnqsIwHRsCYAtGNZ0cw9c+HaAC8S8GYuTPvi60CA0G2x5Jog6I69jVRSd78Q+Fbf/wpjtWaDg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700004)(46966006)(36840700001)(186003)(86362001)(7696005)(1076003)(36860700001)(83380400001)(47076005)(82310400004)(2906002)(16526019)(316002)(5660300002)(508600001)(4326008)(26005)(8676002)(356005)(70586007)(110136005)(44832011)(426003)(81166007)(66574015)(40460700003)(36756003)(336012)(2616005)(8936002)(54906003)(70206006)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 22:38:17.9067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd593564-7dc8-475c-da8f-08d9e05361f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1176
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, horace.chen@amd.com,
 lijo.lazar@amd.com, jingwech@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Defined a reset_domain struct such that
all the entities that go through reset
together will be serialized one against
another. Do it for both single device and
XGMI hive cases.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Suggested-by: Christian König <ckoenig.leichtzumerken@gmail.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  7 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 20 +++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  9 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  2 ++
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 9f017663ac50..b5ff76aae7e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -812,6 +812,11 @@ struct amd_powerplay {
 
 #define AMDGPU_RESET_MAGIC_NUM 64
 #define AMDGPU_MAX_DF_PERFMONS 4
+
+struct amdgpu_reset_domain {
+	struct workqueue_struct *wq;
+};
+
 struct amdgpu_device {
 	struct device			*dev;
 	struct pci_dev			*pdev;
@@ -1096,6 +1101,8 @@ struct amdgpu_device {
 
 	struct amdgpu_reset_control     *reset_cntl;
 	uint32_t                        ip_versions[HW_ID_MAX][HWIP_MAX_INSTANCE];
+
+	struct amdgpu_reset_domain	reset_domain;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 90d22a376632..0f3e6c078f88 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2391,9 +2391,27 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	if (r)
 		goto init_failed;
 
-	if (adev->gmc.xgmi.num_physical_nodes > 1)
+	if (adev->gmc.xgmi.num_physical_nodes > 1) {
+		struct amdgpu_hive_info *hive;
+
 		amdgpu_xgmi_add_device(adev);
 
+		hive = amdgpu_get_xgmi_hive(adev);
+		if (!hive || !hive->reset_domain.wq) {
+			DRM_ERROR("Failed to obtain reset domain info for XGMI hive:%llx", hive->hive_id);
+			r = -EINVAL;
+			goto init_failed;
+		}
+
+		adev->reset_domain.wq = hive->reset_domain.wq;
+	} else {
+		adev->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-dev", 0);
+		if (!adev->reset_domain.wq) {
+			r = -ENOMEM;
+			goto init_failed;
+		}
+	}
+
 	/* Don't init kfd if whole hive need to be reset during init */
 	if (!adev->gmc.xgmi.pending_reset)
 		amdgpu_amdkfd_device_init(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 567df2db23ac..a858e3457c5c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -392,6 +392,14 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 		goto pro_end;
 	}
 
+	hive->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-hive", 0);
+	if (!hive->reset_domain.wq) {
+		dev_err(adev->dev, "XGMI: failed allocating wq for reset domain!\n");
+		kfree(hive);
+		hive = NULL;
+		goto pro_end;
+	}
+
 	hive->hive_id = adev->gmc.xgmi.hive_id;
 	INIT_LIST_HEAD(&hive->device_list);
 	INIT_LIST_HEAD(&hive->node);
@@ -401,6 +409,7 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 	task_barrier_init(&hive->tb);
 	hive->pstate = AMDGPU_XGMI_PSTATE_UNKNOWN;
 	hive->hi_req_gpu = NULL;
+
 	/*
 	 * hive pstate on boot is high in vega20 so we have to go to low
 	 * pstate on after boot.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
index d2189bf7d428..6121aaa292cb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
@@ -42,6 +42,8 @@ struct amdgpu_hive_info {
 		AMDGPU_XGMI_PSTATE_MAX_VEGA20,
 		AMDGPU_XGMI_PSTATE_UNKNOWN
 	} pstate;
+
+	struct amdgpu_reset_domain reset_domain;
 };
 
 struct amdgpu_pcs_ras_field {
-- 
2.25.1

