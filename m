Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1F865F1BD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B3D10E77A;
	Thu,  5 Jan 2023 17:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071FA10E76E;
 Thu,  5 Jan 2023 17:02:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erDoW6yqG0K957VTA0u5ltcZlxmkiPApy/kFvf+A8QL6/a0l7oRBcWOEHcCD2KKbNVS9WyyfJtWbwl2IAzye7sC6+Q/M73tTgjM568t6rh2tSEky1UdjoMFKuZVMtMU8QKsg/mthAZo8W88VI3JPWjwaZRZcEwtl0BNP4ypx7YllajmI4KmADWlLy8Ww+C7VxpynQur+obqb5LhhrcsEkMWoTBcojV/Get1G0TkVNGZjD09NOGMZxVe8844tXdr17+/Ey8jzeGBQfFt1c+57rLSyster95orIS7YcOKmfJDtVy8+dgtDQ/7Ya2SoG5wzFmhvLntM79938XShGiAkbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPslT2pJVW6R0ETsW1wEswJDQxUOgm4yjR2syhjKgvQ=;
 b=hyS02r9gcDHQVPmYfXu8dqm87agmnJTo0cc9Xttwu3w7PFGJqZkx7mahprmk6i36Ufe29BmvqzKlMlEF3FPiYwnJcdKNHfOX8gL0ghx4EOgvGH5e5+/BqWiPLW1ffCJmL84W0qJ3SJE4xfe4GQoMFloC7SKZWSGr5ExYi8zkXflNDi67s8EqpyV/q8Q1mXIEvdZL/IqnC2xq2etlXcfidVTb3/FgqkJTKdhDBwlM4sSw13nXwbrH/FScHBCoDDK7axCxnwKGE3KBAatds8NxJf2lejoW65elKoJAPSYVDeFYL8Cc/NtR94xMYEpdHrEcAFAve7rKkOoGZEUMJyQBjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPslT2pJVW6R0ETsW1wEswJDQxUOgm4yjR2syhjKgvQ=;
 b=o1qRfVSIL3Ar+BP3A23tdB59QbEcpLeDHZml3Bu6pnr3oX418wJpNGsR6H7iDbxi4X4TIsSzezqJMCZpjmyAlc1hCmYA/PMkxwVKPCLFW/5aardbXZSFVWaL8euD6JCmal6eztotU4pr/PX47Ng2qiyFaHl2M9+GrjUG9tgyAL0=
Received: from BN9PR03CA0368.namprd03.prod.outlook.com (2603:10b6:408:f7::13)
 by SJ0PR12MB8167.namprd12.prod.outlook.com (2603:10b6:a03:4e6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:11 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::9f) by BN9PR03CA0368.outlook.office365.com
 (2603:10b6:408:f7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 17:02:10 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:08 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 10/45] drm/amd: Load VCN microcode during early_init
Date: Thu, 5 Jan 2023 11:00:56 -0600
Message-ID: <20230105170138.717-11-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105170138.717-1-mario.limonciello@amd.com>
References: <20230105170138.717-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|SJ0PR12MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: 31cc690a-ede1-4416-a89f-08daef3e95b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 52O0Da6ArnBvQBggASAwcnaQL+YHQnO5IywaZvzrQUgoDSY25ThGU+LfuoPEIZnU1Q7R8tiR7tM8bYsaJbJ8JB2Tmo5gwejLGeuN2f8KmBp8VEss2ZKMoheDFLxEhlA+lqWNSeTSsuohW+zsR1c/idMRHbzubEZ0JeueCpZXmQMRMrkaF+1zu9YpogJKNHk3Qmyvcb3BiIBQq3WrEIJT4uIlAUKUy3z57UgdSE/gI+m6ktnYvpYw1tcG+yIRUanf0Bu8PEXMcuXdoVzTIX1gCFxor8uMj0AoUJDsRweoodWWtXIIgFQa2oxT2i0iXtwrK0+JN1NnrUC068fxhS1Xj24VCWSBJ5vpe8Vg0UC+3DuX9AwY/FbeRuso7FvFn+8IxCZs708jNtS46gRpex9TKOvmjSs6zJbTb7h7AZ3VhtlWCb/8d6Hm/vHGBplRC3IL0QwO6cGQ4zr0OQ4whvh//TgZMXSX2aq+Sm/Y7qDoOheG66WA/7paWaeu2VbJ0Mdw2HriJr33PpMqPmS3qukU20p2sKcFywLo1ZSsD+XNfqm43kbfYJ5HJNC0izaaevNuQ6xFAIScUMlAFk8MQY+cVL+EdSvVm/wTfWLoAyEIyivIqyA4UHfyvJdO0YQU7uLQ1TAGrkRAJRpj71xn+3NiRQWWQdNtThUjKpkCltNKaDQjYOEWyCvV6v+kMJxdcqPISD2m5DNVwFMCgszGsQr9Ms+VYpBaYOfLZFw8+6cwiv4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(426003)(47076005)(83380400001)(16526019)(1076003)(40480700001)(26005)(7696005)(2616005)(336012)(6666004)(82310400005)(186003)(86362001)(36756003)(36860700001)(82740400003)(81166007)(40460700003)(356005)(316002)(8676002)(41300700001)(4326008)(8936002)(2906002)(30864003)(5660300002)(44832011)(478600001)(110136005)(70586007)(70206006)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:10.4271 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31cc690a-ede1-4416-a89f-08daef3e95b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8167
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Lijo
 Lazar <lijo.lazar@amd.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Carlos Soriano Sanchez <csoriano@redhat.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplifies the code so that all VCN versions will get the firmware
name from `amdgpu_ucode_ip_version_decode` and then use this filename
to load microcode as part of the early_init process.

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Fix whitespace problem in firmware file names
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 53 +++++++------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c   |  5 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c   |  5 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c   |  5 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c   |  5 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c   |  5 ++-
 7 files changed, 31 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index b37400107a37..0fb9a6d23065 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -80,10 +80,24 @@ MODULE_FIRMWARE(FIRMWARE_VCN4_0_4);
 
 static void amdgpu_vcn_idle_work_handler(struct work_struct *work);
 
+int amdgpu_vcn_early_init(struct amdgpu_device *adev)
+{
+	char ucode_prefix[30];
+	char fw_name[40];
+	int r;
+
+	amdgpu_ucode_ip_version_decode(adev, UVD_HWIP, ucode_prefix, sizeof(ucode_prefix));
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
+	r = amdgpu_ucode_request(adev, &adev->vcn.fw, fw_name);
+	if (r)
+		amdgpu_ucode_release(&adev->vcn.fw);
+
+	return r;
+}
+
 int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 {
 	unsigned long bo_size;
-	const char *fw_name;
 	const struct common_firmware_header *hdr;
 	unsigned char fw_check;
 	unsigned int fw_shared_size, log_offset;
@@ -99,46 +113,27 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 	switch (adev->ip_versions[UVD_HWIP][0]) {
 	case IP_VERSION(1, 0, 0):
 	case IP_VERSION(1, 0, 1):
-		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
-			fw_name = FIRMWARE_RAVEN2;
-		else if (adev->apu_flags & AMD_APU_IS_PICASSO)
-			fw_name = FIRMWARE_PICASSO;
-		else
-			fw_name = FIRMWARE_RAVEN;
-		break;
 	case IP_VERSION(2, 5, 0):
-		fw_name = FIRMWARE_ARCTURUS;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(2, 2, 0):
-		if (adev->apu_flags & AMD_APU_IS_RENOIR)
-			fw_name = FIRMWARE_RENOIR;
-		else
-			fw_name = FIRMWARE_GREEN_SARDINE;
-
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(2, 6, 0):
-		fw_name = FIRMWARE_ALDEBARAN;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(2, 0, 0):
-		fw_name = FIRMWARE_NAVI10;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(2, 0, 2):
-		if (adev->asic_type == CHIP_NAVI12)
-			fw_name = FIRMWARE_NAVI12;
-		else
-			fw_name = FIRMWARE_NAVI14;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
@@ -146,58 +141,46 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 	case IP_VERSION(3, 0, 0):
 	case IP_VERSION(3, 0, 64):
 	case IP_VERSION(3, 0, 192):
-		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
-			fw_name = FIRMWARE_SIENNA_CICHLID;
-		else
-			fw_name = FIRMWARE_NAVY_FLOUNDER;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(3, 0, 2):
-		fw_name = FIRMWARE_VANGOGH;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(3, 0, 16):
-		fw_name = FIRMWARE_DIMGREY_CAVEFISH;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(3, 0, 33):
-		fw_name = FIRMWARE_BEIGE_GOBY;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(3, 1, 1):
-		fw_name = FIRMWARE_YELLOW_CARP;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(3, 1, 2):
-		fw_name = FIRMWARE_VCN_3_1_2;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(4, 0, 0):
-		fw_name = FIRMWARE_VCN4_0_0;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(4, 0, 2):
-		fw_name = FIRMWARE_VCN4_0_2;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(4, 0, 4):
-		fw_name = FIRMWARE_VCN4_0_4;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
@@ -206,12 +189,6 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
-	r = amdgpu_ucode_request(adev, &adev->vcn.fw, fw_name);
-	if (r) {
-		amdgpu_ucode_release(&adev->vcn.fw);
-		return r;
-	}
-
 	hdr = (const struct common_firmware_header *)adev->vcn.fw->data;
 	adev->vcn.fw_version = le32_to_cpu(hdr->ucode_version);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
index dbb8d68a30c6..d3e2af902907 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
@@ -369,6 +369,7 @@ enum vcn_ring_type {
 	VCN_UNIFIED_RING,
 };
 
+int amdgpu_vcn_early_init(struct amdgpu_device *adev);
 int amdgpu_vcn_sw_init(struct amdgpu_device *adev);
 int amdgpu_vcn_sw_fini(struct amdgpu_device *adev);
 int amdgpu_vcn_suspend(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index f0fbcda76f5e..c305b2cb8490 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -57,11 +57,12 @@ static void vcn_v1_0_idle_work_handler(struct work_struct *work);
 static void vcn_v1_0_ring_begin_use(struct amdgpu_ring *ring);
 
 /**
- * vcn_v1_0_early_init - set function pointers
+ * vcn_v1_0_early_init - set function pointers and load microcode
  *
  * @handle: amdgpu_device pointer
  *
  * Set ring and irq function pointers
+ * Load microcode from filesystem
  */
 static int vcn_v1_0_early_init(void *handle)
 {
@@ -75,7 +76,7 @@ static int vcn_v1_0_early_init(void *handle)
 
 	jpeg_v1_0_early_init(handle);
 
-	return 0;
+	return amdgpu_vcn_early_init(adev);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index 08871bad9994..4b4cd88414e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -62,11 +62,12 @@ static int vcn_v2_0_pause_dpg_mode(struct amdgpu_device *adev,
 				int inst_idx, struct dpg_pause_state *new_state);
 static int vcn_v2_0_start_sriov(struct amdgpu_device *adev);
 /**
- * vcn_v2_0_early_init - set function pointers
+ * vcn_v2_0_early_init - set function pointers and load microcode
  *
  * @handle: amdgpu_device pointer
  *
  * Set ring and irq function pointers
+ * Load microcode from filesystem
  */
 static int vcn_v2_0_early_init(void *handle)
 {
@@ -81,7 +82,7 @@ static int vcn_v2_0_early_init(void *handle)
 	vcn_v2_0_set_enc_ring_funcs(adev);
 	vcn_v2_0_set_irq_funcs(adev);
 
-	return 0;
+	return amdgpu_vcn_early_init(adev);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index ec87b00f2e05..b0b0e69c6a94 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -71,11 +71,12 @@ static int amdgpu_ih_clientid_vcns[] = {
 };
 
 /**
- * vcn_v2_5_early_init - set function pointers
+ * vcn_v2_5_early_init - set function pointers and load microcode
  *
  * @handle: amdgpu_device pointer
  *
  * Set ring and irq function pointers
+ * Load microcode from filesystem
  */
 static int vcn_v2_5_early_init(void *handle)
 {
@@ -107,7 +108,7 @@ static int vcn_v2_5_early_init(void *handle)
 	vcn_v2_5_set_irq_funcs(adev);
 	vcn_v2_5_set_ras_funcs(adev);
 
-	return 0;
+	return amdgpu_vcn_early_init(adev);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 9c8b5fd99037..bd228512424a 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -78,11 +78,12 @@ static void vcn_v3_0_dec_ring_set_wptr(struct amdgpu_ring *ring);
 static void vcn_v3_0_enc_ring_set_wptr(struct amdgpu_ring *ring);
 
 /**
- * vcn_v3_0_early_init - set function pointers
+ * vcn_v3_0_early_init - set function pointers and load microcode
  *
  * @handle: amdgpu_device pointer
  *
  * Set ring and irq function pointers
+ * Load microcode from filesystem
  */
 static int vcn_v3_0_early_init(void *handle)
 {
@@ -109,7 +110,7 @@ static int vcn_v3_0_early_init(void *handle)
 	vcn_v3_0_set_enc_ring_funcs(adev);
 	vcn_v3_0_set_irq_funcs(adev);
 
-	return 0;
+	return amdgpu_vcn_early_init(adev);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index 1e2b22299975..a79b6088374b 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -68,11 +68,12 @@ static void vcn_v4_0_unified_ring_set_wptr(struct amdgpu_ring *ring);
 static void vcn_v4_0_set_ras_funcs(struct amdgpu_device *adev);
 
 /**
- * vcn_v4_0_early_init - set function pointers
+ * vcn_v4_0_early_init - set function pointers and load microcode
  *
  * @handle: amdgpu_device pointer
  *
  * Set ring and irq function pointers
+ * Load microcode from filesystem
  */
 static int vcn_v4_0_early_init(void *handle)
 {
@@ -88,7 +89,7 @@ static int vcn_v4_0_early_init(void *handle)
 	vcn_v4_0_set_irq_funcs(adev);
 	vcn_v4_0_set_ras_funcs(adev);
 
-	return 0;
+	return amdgpu_vcn_early_init(adev);
 }
 
 /**
-- 
2.34.1

