Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2779757220
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 05:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9366710E012;
	Tue, 18 Jul 2023 03:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A409410E012;
 Tue, 18 Jul 2023 03:20:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4pbN3tzjoEtIfmqsA8S1seuhpcoVvFyvwZLxAXc+UPpXVqry20nElX/lSIacoVp3Eoxddy0Za7WiJ9fqhi2mBwVD2XyiWf3Cu+YwwZ6Ruc3mTxubJNsR/lDvGhW/QaqxQ6qIWmrp9fMSYzz2CC/HFIGNmULQfgOOjFrmW8ZGiD9RviNHhNgSpeWJL9Ps7bQM/b//u3jI+6CVodqiHWaxlGdTNiJuMUd5Xl6G1fA2Nr9cQc13j0vBeWNjZ56UyUmHwIaunA9MhQKALnq2cCkHtAMbbP45mQIFVf423WCjaujhuiscaO27fZb+V+bJ/ZyNLsszPlIPHRNVqwW7R0jUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWChhiOgXEeARYRsLtkKWIQydtFPWF0qwfVIVu1iaTA=;
 b=AfUgie2loNiHJcCHXl1oL71ye37RjHqVdx+Lpd0jNcv6LPy1vP7rlhKIdbMj+p4Ji2Iyebtk6e6796Z/rJrYHecBBk9N8uVOL4L1kunAt4We9eg3lhFvLeTmEJl2aeH4UlzV8UPv5js8VhzRHbuf2vJlTmUWJOHjg76yxhKzhThbKCWrG0naUDmX3gK5DZfOxZbLZFdP3gZ3DVRuI56J/n/WYzfFna90tN1Wt72cMF6W7WwzjxRicJJ7Ka3qApEeTAF6Amd3WQZ37VVaEgLDHAY7unsvf8UwOabpwcX0+ZgAaNgIBxxEfkiGPNNDJJ9I6zHQv2LAdWwoVMZtsXjWZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWChhiOgXEeARYRsLtkKWIQydtFPWF0qwfVIVu1iaTA=;
 b=O/7iwfH+JlVKFpr8HMvQA1hLZVp2Nt8e+pWRGqcmc76vvC5LW5oemwbeeVAbO7/CxDjmjCOimzMLb3NRdsLYBOTlFLCLkrbFl+2D9VvcZA5/+NMMBjJzCFAOnSkCBv7Pvw+osUeLHTHgFd2PlGY6oaT+TtxftjV6l77NioTXVOY=
Received: from BN0PR04CA0026.namprd04.prod.outlook.com (2603:10b6:408:ee::31)
 by PH8PR12MB7280.namprd12.prod.outlook.com (2603:10b6:510:220::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 03:20:52 +0000
Received: from BN8NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::eb) by BN0PR04CA0026.outlook.office365.com
 (2603:10b6:408:ee::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Tue, 18 Jul 2023 03:20:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT078.mail.protection.outlook.com (10.13.176.251) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 03:20:52 +0000
Received: from ETHANOL.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 17 Jul
 2023 22:20:48 -0500
From: sguttula <Suresh.Guttula@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Leo Liu
 <leo.liu@amd.com>
Subject: [PATCH] drm/amdgpu: Enabling FW workaround through shared memory for
 VCN4_0_2
Date: Tue, 18 Jul 2023 08:50:32 +0530
Message-ID: <20230718032032.4115822-1-Suresh.Guttula@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT078:EE_|PH8PR12MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea12375-17df-431f-09a3-08db873dfdc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hsL1JjT30O1iV8noynXn0jxrDiU0dUlEp0JayOPahZNWWY8jAU1uQP9u8tzEjpN6z+G7U6G32wknsEZwMeYRCStV8RAOJK3tWm25+PjHDimkTkX0sCbYYcQGjpgecbsVvYZzWHaIVH+O0iZPN7aWcnruB+Ob2ewH+5u+nfWsw7npprheZIVArMXNqTqXye1fkOgWadH2bHB4DWvVi3+wpCOgDByNCFw99ATJWHLgvlMRqRf+XRqqvxCHWqxn8PaC5ZN3pMkoSFMR72R0Xu9r/3l78WSC1z3IHpyYme89Uv8qHkwGDiH4Fc0nsHQa0CAM6rdcN7kgheOBaHDOQs/nqsyHSEjVyVWuyFg6YAAvCuj0C2MSIdKa9iqnD+2HcBdV7JxZ13D7zMd0+ruwOdevOTGbNHP3tzqmml9Rfl3CqD/pZGOZ5oUi29eLKWsqG0gDRYdFhOQUC5pjlRV6cC/h/gMAi/G+etD/5o+T6/43rvUBj4aZ0YjIBjUAO92cHHhp9Nc0O6qzk4Gq8Bt6PlAvk3Z/zgARDDVnyZWM+MWJgXiacH4Xyvr3r2GJ3EK3Z9MjYz07QmUA4Z7a7vOEg9+A5qjg5VWcvxn0JEKPOrHz8YWzgOtpEqFB7/H+4BZHvgeyCK2lOvkKBJpbMqSgtmtrY2uG9wgnPm60W0+qF3MSL37QKC3Huh1UFcsA55G9HZHtt1lXdQZ6XyMdDzjPHvR234kQcSIineA/UZe1tgO/GtzMttxlCWUaB9VNZORYslYLI7EDHyInp2Lt2KGgQsFqc9rimSVtDsmXygakTlNSSCE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(2616005)(6666004)(478600001)(82740400003)(356005)(47076005)(36860700001)(16526019)(426003)(186003)(336012)(83380400001)(40460700003)(1076003)(40480700001)(4326008)(70586007)(41300700001)(8676002)(6636002)(8936002)(2906002)(86362001)(316002)(26005)(7696005)(450100002)(36756003)(70206006)(110136005)(81166007)(54906003)(5660300002)(43062005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 03:20:52.3154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea12375-17df-431f-09a3-08db873dfdc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7280
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 sguttula <Suresh.Guttula@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch will enable VCN FW workaround using
DRM KEY INJECT WORKAROUND method,
which is helping in fixing the secure playback.

Signed-off-by: sguttula <Suresh.Guttula@amd.com>

---

Changes in v2:
-updated commit message as per veera's feedback

Changes in v3:
-updated commit message as enabling for 402
-updated the logic as per leo, feedback
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h | 9 +++++++++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c   | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
index 1f1d7dc94f90..a3eed90b6af0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
@@ -161,6 +161,7 @@
 	} while (0)
 
 #define AMDGPU_FW_SHARED_FLAG_0_UNIFIED_QUEUE (1 << 2)
+#define AMDGPU_FW_SHARED_FLAG_0_DRM_KEY_INJECT (1 << 4)
 #define AMDGPU_VCN_FW_SHARED_FLAG_0_RB	(1 << 6)
 #define AMDGPU_VCN_MULTI_QUEUE_FLAG	(1 << 8)
 #define AMDGPU_VCN_SW_RING_FLAG		(1 << 9)
@@ -180,6 +181,8 @@
 #define AMDGPU_VCN_SMU_DPM_INTERFACE_DGPU (0)
 #define AMDGPU_VCN_SMU_DPM_INTERFACE_APU (1)
 
+#define AMDGPU_DRM_KEY_INJECT_WORKAROUND_VCNFW_ASD_HANDSHAKING 2
+
 enum fw_queue_mode {
 	FW_QUEUE_RING_RESET = 1,
 	FW_QUEUE_DPG_HOLD_OFF = 2,
@@ -343,6 +346,11 @@ struct amdgpu_fw_shared_rb_setup {
 	uint32_t  reserved[6];
 };
 
+struct amdgpu_fw_shared_drm_key_wa {
+	uint8_t  method;
+	uint8_t  reserved[3];
+};
+
 struct amdgpu_vcn4_fw_shared {
 	uint32_t present_flag_0;
 	uint8_t pad[12];
@@ -352,6 +360,7 @@ struct amdgpu_vcn4_fw_shared {
 	uint8_t pad2[20];
 	struct amdgpu_fw_shared_rb_setup rb_setup;
 	struct amdgpu_fw_shared_smu_interface_info smu_dpm_interface;
+	struct amdgpu_fw_shared_drm_key_wa drm_key_wa;
 };
 
 struct amdgpu_vcn_fwlog {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index e8c02ae10163..16ee73cfc3a8 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -169,6 +169,12 @@ static int vcn_v4_0_sw_init(void *handle)
 		fw_shared->smu_dpm_interface.smu_interface_type = (adev->flags & AMD_IS_APU) ?
 			AMDGPU_VCN_SMU_DPM_INTERFACE_APU : AMDGPU_VCN_SMU_DPM_INTERFACE_DGPU;
 
+		if (adev->ip_versions[VCN_HWIP][0] == IP_VERSION(4, 0, 2)) {
+			fw_shared->present_flag_0 |= AMDGPU_FW_SHARED_FLAG_0_DRM_KEY_INJECT;
+			fw_shared->drm_key_wa.method =
+				AMDGPU_DRM_KEY_INJECT_WORKAROUND_VCNFW_ASD_HANDSHAKING;
+		}
+
 		if (amdgpu_sriov_vf(adev))
 			fw_shared->present_flag_0 |= cpu_to_le32(AMDGPU_VCN_VF_RB_SETUP_FLAG);
 
-- 
2.25.1

