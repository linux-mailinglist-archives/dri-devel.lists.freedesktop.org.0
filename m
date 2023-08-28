Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F70678B022
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 14:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B761810E2B6;
	Mon, 28 Aug 2023 12:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589E710E2B4;
 Mon, 28 Aug 2023 12:28:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLJOYilCTHdtzwcR/L2vDu80520YEAK1OzK8gkMdTs7ba7qR4fYEKsZKWmke4gUEF0mcOsO99I7GAQ5DhuvUn22eZ2P4jugPbiroa2wvx2viSovi2DiFdfRmlGjZ89tlb5x9xNegNJl3NFZQgYF50FyJKsXC0elIJVSzgxmml6Jvxlj2SQEEQLMinBReqtcVskJ56aWRMi8orT2HxOebGfgMQuENwNpjQqrhmMAqJak2AscNBJR4Tq5reS+GyI5+cuR+JxQwCP3Oj2DKJj6VZlfvHryYi6D7yS9w2gwsod6GOD4rego2fsUbGjzTyR2kK9koUm1zHhF5qAc96Ybtug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zb2pTTGjpeJLzXMgSR4oMcDxQbF235H4NzUyWEJjcL8=;
 b=T42JQp/LWA2ubiAMPhKGS7NLUm0Q/9CBqKFxUyhmruzEFVzQ3vq3QpMVso0CqZV4xyG7tqVDBWRzmyvs7UBejy5llMr1gKLcC9ixTHJWppKKqEzsGExoZOHg7wrPVw1N2xKE4b/nuUe40xkoosBMUD44tGMVpVq6t6HqftoBSk+fbduEz9UN16QkkYiV1pjJWHOvF9q47Nj2KJsxHPMh6hapMLyNeP82fSwzOiTAHErmKMgVAhc8FRP9A2st/RkG77+jaS/sZCj4vLlSDtFkrpRGBS3OLCLo6ItwDHoy0QvhpIz19FwKEa+h+cSonBFBVHo3YncBxeCS7TAoQhjXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zb2pTTGjpeJLzXMgSR4oMcDxQbF235H4NzUyWEJjcL8=;
 b=DltAJbhDrb8tTDa2Jwtyk/Gth2k5pBki1sG0HSZz5lc4G8ajBlU2sXyVE3vtxtIeFDF80jZ3DZ4PcnYECayCN1rmPs2PrNVtDjbRLiNzzs+sqnrwLQRL3/TLOkbApc3hpNfGQAvmfIoP/rwxIbj+TlZfZ0jpMoe+NB7dZT/RSw4=
Received: from DM6PR06CA0047.namprd06.prod.outlook.com (2603:10b6:5:54::24) by
 CH2PR12MB4038.namprd12.prod.outlook.com (2603:10b6:610:7b::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.34; Mon, 28 Aug 2023 12:28:31 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:5:54:cafe::2) by DM6PR06CA0047.outlook.office365.com
 (2603:10b6:5:54::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34 via Frontend
 Transport; Mon, 28 Aug 2023 12:28:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.82) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Mon, 28 Aug 2023 12:28:31 +0000
Received: from rtg-Artic.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 07:28:27 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 2/7] drm/amdgpu: Add new function to set GPU power profile
Date: Mon, 28 Aug 2023 17:56:09 +0530
Message-ID: <20230828122614.3815122-3-Arvind.Yadav@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|CH2PR12MB4038:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e5f1d6c-7462-415b-0083-08dba7c24a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4RuVTzwVnCZsBBc2q1BZy98nLTttf90ZbwE9fhCI9QsUIxtEjIeAPAdmbQ2KBxptkwY5UQFdIqoXFGxOXVbajzkGvpNh6e/xfC4n36oJj+rd5uaW8Sjf4jSbz4TtsdW4DdboY/Xud1u34kLJ66c1IZVptKcNQkxdPdFSkH8H2Cm4IJKjHYYPZO1q51+rcNDMzG4vOF8Oe1IZ7HrW0LIrduYVKqjFhYHUHSR0Zwpt3zYUKVhBvP4xXn16CKQWw1IP8PjYvxbZrZ4bzu07Sj22aek/wecXK1nBcf17Mp+uw/Kzux4wsk6nwpx/My07LZ5mqv9HcTOtpNsP8fEHIqh4GSVfjlvG/NNscDcqOPyJUt2n+nkR5gsYn4/tqDLcxgYGBfmG1PPSCf5/ZWH3nUeTm4MZyfW1wsJkES6KdyuFLzt8Zj7WBVm4AX8+f4X0eqe7ho5sevaWQhLz7a5K/TMjHtzmQEUZd2QT0p5vuFt3DK6iTWrwqoq2fkuKKZFjB/GxQBCUBf+otrkpDV3b5RYj2D8pZzToXFvRP8EJ1eJHROWOTBSNiA3wbglpnP/Sl/1BPPuL0Isogq0BHmTUKGNvLnpRNf4HMDrqIF9eN2emwsvCKYUn70CmB+wIa1J6ciXKEoyargyAap1xH38cmngSLDvCu4FpGxvJvA40ol3HNZMzJ60tzDdl5EHr9QvMo8macZAACvTYvgcBsgfOE/4I1FAyT9rxCWqzqxPm+h/wQsXjK+MoXfYgpzu1nKTfsSxDoF/Gz2m5q5VoOPFMlTeUwA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(186009)(1800799009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(6666004)(40480700001)(7696005)(82740400003)(86362001)(40460700003)(16526019)(26005)(1076003)(36756003)(2616005)(426003)(336012)(83380400001)(316002)(36860700001)(5660300002)(110136005)(70206006)(70586007)(54906003)(41300700001)(47076005)(81166007)(2906002)(478600001)(356005)(8676002)(8936002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 12:28:31.4214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5f1d6c-7462-415b-0083-08dba7c24a50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4038
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

v3:
- Adressed all the review comment.
- Changing the function name from *_set() to *_get().
- Now setting a power profile when refcount is zero.

Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 59 +++++++++++++++++++
 drivers/gpu/drm/amd/include/amdgpu_workload.h |  3 +
 2 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
index 32166f482f77..67eacaac6c9b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
@@ -24,6 +24,65 @@
 
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
+		set_bit(profile, &adev->smu_workload.submit_workload_status);
+	}
+
+	return ret;
+}
+
+void amdgpu_workload_profile_get(struct amdgpu_device *adev,
+				 uint32_t ring_type)
+{
+	struct amdgpu_smu_workload *workload = &adev->smu_workload;
+	enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
+	int ret, refcount;
+
+	if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
+		return;
+
+	mutex_lock(&workload->workload_lock);
+
+	refcount = atomic_read(&workload->power_profile_ref[profile]);
+	if (!refcount) {
+		ret = amdgpu_power_profile_set(adev, profile);
+		if (ret) {
+			DRM_WARN("Failed to set workload profile to %s, error = %d\n",
+				 amdgpu_workload_mode_name[profile], ret);
+		}
+	}
+
+	atomic_inc(&adev->smu_workload.power_profile_ref[profile]);
+	mutex_unlock(&workload->workload_lock);
+}
+
 void amdgpu_workload_profile_init(struct amdgpu_device *adev)
 {
 	adev->smu_workload.adev = adev;
diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
index dc12448764a3..5fc0bc2a74a4 100644
--- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
+++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
@@ -46,6 +46,9 @@ static const char * const amdgpu_workload_mode_name[] = {
 	"Window3D"
 };
 
+void amdgpu_workload_profile_get(struct amdgpu_device *adev,
+				 uint32_t ring_type);
+
 void amdgpu_workload_profile_init(struct amdgpu_device *adev);
 
 void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
-- 
2.34.1

