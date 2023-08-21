Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F117823EE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A73C10E1EA;
	Mon, 21 Aug 2023 06:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC15C10E1E9;
 Mon, 21 Aug 2023 06:48:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpnxwbGE8eIzEl42YWWJK9AqL7KWX0LvkakXh3wWJ6aAmBQrAvWu4rJAfl2uoWHnsDNN1B/qbwI4nvP84L5AGxOexYE5wLZF+SKU1ER1tJSQk2gY6rD+GOPT881v5mHQS8UDpwhiPWbcQ09OkfcccGaoevVamzgrpdeLfrcQWSTuWCRfAxUXyI36sr0Js4Nfj0spfQzJYCLaPYLvSW6804YJ1Sz34AicQKsjzk4DKe5JDbQs99EWDIa6/EwKE5KY83T5ULlDXu0aVcn9LPF/gmHzE+u3MbTAbVfKmCLVP8kLPMly/87Zk2TySejHPGTLUEtx+E4vq1ZxBeE+HOwHLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V25dkPwoSUODTsgPmxA1jt+a/rBCgzBUPan+NTYQ/dU=;
 b=k8jl1rsClu6YgRahveObBOliyZ4+SwaA8rr+zJPJGt9Bx8a4dnCCNF2jg4Zd9P9mSSrCU9nXjqd11NOgPc06qdSAHslfMj92wGUZOXwdkQW8ZfSesqMW1xoR76MmzS6/WFN30a3JN8lTy7rKK1mEfRnWFRarkRSXtXXYXEjnVWRSn+du1Tpt9Kog9clJijuhZIP/WiDr0Omx3ugAF54X5NRZXOqLhPBejBdmhHopzOeRfPkMPIDyX8Dq3pJEJXAfkgAIhY6XbQjyp+I9rYu4zZy/kk+rYR/bAol1+jOM5fcsjNwbC7UHm+1tsbLfbb3rK1T3FCs9x9p8gBaOU344LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V25dkPwoSUODTsgPmxA1jt+a/rBCgzBUPan+NTYQ/dU=;
 b=oF2dKzK+yfIGnfc3zFFxqmbG2AG73EHxXZzaVA8gKbxl9i6NNMmPdTInkirR6EEJryjD90g7pL7wcgIqEXjqxjmEJ/uJxzGLza9T4B54I07axy4vO8ic3xF8qbkwWfNPNgnYSIlsfCFKOK6jtMHPUc9t6MXez0KfufiKYIJRcvM=
Received: from SN6PR2101CA0014.namprd21.prod.outlook.com
 (2603:10b6:805:106::24) by DM4PR12MB5376.namprd12.prod.outlook.com
 (2603:10b6:5:39f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 06:48:40 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:805:106:cafe::41) by SN6PR2101CA0014.outlook.office365.com
 (2603:10b6:805:106::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.0 via Frontend
 Transport; Mon, 21 Aug 2023 06:48:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Mon, 21 Aug 2023 06:48:40 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 01:48:36 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/7] drm/amdgpu: Add new function to set GPU power profile
Date: Mon, 21 Aug 2023 12:17:54 +0530
Message-ID: <20230821064759.94223-3-Arvind.Yadav@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|DM4PR12MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9014ac-a516-483b-bd54-08dba212a72e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9dfpD475izJ8b9Cm/ddDFJbXU0c/xdMPxgJGep1ibpjn3R1S6iaRbMYlbJymtGGyK9r+DCsLCOorJYnlWUXESPe/nCV8ShbYUUqovyxQJynHleEuO4ii8kW4tRLUvdYzq7DxBLzZkvDoXvQTAFs8hC6Dxe2nM959UAQihAadLuGmIughqwvHwIjcCI/bAkKumc1/a49nteNlmDxiMWCT5bPlj3bvrBNs8dsPRhP+Q0T097Fueu9W79bsAi5srGWIUBdrzNjLCAH2xhXPl8hoqqqP1druMlNug1E2iaW2RS8XpzO1NfnvwEShKvndBAjOhKYKqpgoSUnPjOxMjXXFQeTANP986AIybhECVfBlE6LmFTpCvanjC8NQbbRWCsy4CuQwew4MVA2rhMro6Po2QWTa7KN0BbAVQvQuPrZmiplxSF8XuxFwb6PaSu9g56A6x7VDVgJAhW481seuxYdbN6VDHLJ7kEkx7ciWMPNyIb1n771qUdxsKnTM20+yZvWBbphX6p9IBa0VgCoLFEV+gyK/8DvXfE/M1dxHWoy9Y79HLwo/WkTrdMKaJ4OuPEVDUGdw3brvKJwoHeZpJqtopnEOfdHNrCDn8gItBkadkEQThQuuBbgtyQOv/mFnjbHOnDqaW8dUIJjDVLIfujo1LnWPGhtPssPbOOY5DosneO8o3NnH8dF6ffD8S/Do6LmniX+V2yTCLIQTFpe+F2B4z9Gb3bfFc9GUFAjvKwBOtUrSx7QWhpr8eN7wGpOQbjxvBQ2quPdiifbwowzIKfX1bg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(2906002)(83380400001)(7696005)(40480700001)(5660300002)(336012)(426003)(26005)(16526019)(86362001)(47076005)(36860700001)(8676002)(2616005)(8936002)(4326008)(70206006)(316002)(54906003)(70586007)(110136005)(478600001)(82740400003)(356005)(81166007)(6666004)(36756003)(40460700003)(41300700001)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 06:48:40.0401 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9014ac-a516-483b-bd54-08dba212a72e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5376
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

This patch adds a function which will change the GPU
power profile based on a submitted job. This can optimize
the power performance when the workload is on.

v2:
- Splitting workload_profile_set and workload_profile_put
  into two separate patches.
- Addressed review comment.

Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 56 +++++++++++++++++++
 drivers/gpu/drm/amd/include/amdgpu_workload.h |  3 +
 2 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
index 32166f482f77..e661cc5b3d92 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
@@ -24,6 +24,62 @@
 
 #include "amdgpu.h"
 
+static enum PP_SMC_POWER_PROFILE
+ring_to_power_profile(uint32_t ring_type)
+{
+	switch (ring_type) {
+	case AMDGPU_RING_TYPE_GFX:
+		return PP_SMC_POWER_PROFILE_FULLSCREEN3D;
+	case AMDGPU_RING_TYPE_COMPUTE:
+		return PP_SMC_POWER_PROFILE_COMPUTE;
+	case AMDGPU_RING_TYPE_UVD:
+	case AMDGPU_RING_TYPE_VCE:
+	case AMDGPU_RING_TYPE_UVD_ENC:
+	case AMDGPU_RING_TYPE_VCN_DEC:
+	case AMDGPU_RING_TYPE_VCN_ENC:
+	case AMDGPU_RING_TYPE_VCN_JPEG:
+		return PP_SMC_POWER_PROFILE_VIDEO;
+	default:
+		return PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
+	}
+}
+
+static int
+amdgpu_power_profile_set(struct amdgpu_device *adev,
+			 enum PP_SMC_POWER_PROFILE profile)
+{
+	int ret = amdgpu_dpm_switch_power_profile(adev, profile, true);
+
+	if (!ret) {
+		/* Set the bit for the submitted workload profile */
+		adev->smu_workload.submit_workload_status |= (1 << profile);
+		atomic_inc(&adev->smu_workload.power_profile_ref[profile]);
+	}
+
+	return ret;
+}
+
+void amdgpu_workload_profile_set(struct amdgpu_device *adev,
+				 uint32_t ring_type)
+{
+	struct amdgpu_smu_workload *workload = &adev->smu_workload;
+	enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
+	int ret;
+
+	if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
+		return;
+
+	mutex_lock(&workload->workload_lock);
+
+	ret = amdgpu_power_profile_set(adev, profile);
+	if (ret) {
+		DRM_WARN("Failed to set workload profile to %s, error = %d\n",
+			 amdgpu_workload_mode_name[profile], ret);
+	}
+
+	mutex_unlock(&workload->workload_lock);
+}
+
 void amdgpu_workload_profile_init(struct amdgpu_device *adev)
 {
 	adev->smu_workload.adev = adev;
diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
index 5d0f068422d4..5022f28fc2f9 100644
--- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
+++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
@@ -46,6 +46,9 @@ static const char * const amdgpu_workload_mode_name[] = {
 	"Window3D"
 };
 
+void amdgpu_workload_profile_set(struct amdgpu_device *adev,
+				 uint32_t ring_type);
+
 void amdgpu_workload_profile_init(struct amdgpu_device *adev);
 
 void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
-- 
2.34.1

