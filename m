Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB9F65E3CF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E1410E648;
	Thu,  5 Jan 2023 03:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79A110E641;
 Thu,  5 Jan 2023 03:44:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G++5PejB2StgAbT+v9L9xF+pz+HP6jvo0+z3L+s918osbldhNXAYGrfWmhPBdDLfcscatd7cb9Ti3ls67/6+x80vxDIWOZuB/sgd6dEO/sp+THWeZmYyaUH3Xj9Xp4eVl8crp0TYPZCr6hGuLbRN4BTikyo68wcfsAQCRGLprwPvj5dyc/73+1bwOETFJTJohHeyo5OlT6xxc+cgyEqawQQDyW0ITgctlSmDLYu5sH63q9wlQCy786cnjapoSYyWNtXRIF6P9xsxJf8euDIIGrIW7FgrgL07HhjolndnO4vcPh1yr33VHH764z40TJQ0zuA0M1XZ/assOAUuUB6edA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGNl0bQjNdxCWyrGklBESgCarjug1oYy0XlvG0E1d6g=;
 b=je4tm96nm1y5f/Wi21bvKOh48Wg8KBXSFakFZcKj7tierpRPy9Q+Ib4huBHB8ib9xfICIpEvJX5w/8CV9vjYO2mTt1dIeMoEWSWaJE2+KrJ/AOHx3gdy6fC0t0OjDSHn3+XNv6ZUrl8QfvYK1Y1hLdhXXpxwzD9yKvCg1YmGE9Y6O5MWmGANhFaqR6UHWF6WkqYv784rpeg1aL3w6b4yitI4PkHQLEaREz2hK9C6A0omv0eMr2h7mPUA2MtgVug+nBstv8MndCkrxkcybyc3Vz8J3P+M+24jGzRVGsUZj0kBBGGl8W0RqvuVgJKPT2w2jEe2+Jb0dPhv1iDbI8vgcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGNl0bQjNdxCWyrGklBESgCarjug1oYy0XlvG0E1d6g=;
 b=YbrIKJc6YPsFTj88cG921i4hG/mk517g9SWgdciH4vUB9KpilwCUT6DL3JSa8h5HqvzCIAC3wEPptvRsOnghORI6STLmjqkQOAG0jInSNNbMU+C3gwlRksqc9FlxnPIPasQ25U6Ol82oIZe0jrIUl6PhIGHACuzW061TQdPyD4M=
Received: from BN0PR04CA0039.namprd04.prod.outlook.com (2603:10b6:408:e8::14)
 by IA0PR12MB7652.namprd12.prod.outlook.com (2603:10b6:208:434::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:12 +0000
Received: from BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::94) by BN0PR04CA0039.outlook.office365.com
 (2603:10b6:408:e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT109.mail.protection.outlook.com (10.13.176.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 03:44:12 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:08 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 10/45] drm/amd: Load VCN microcode during early_init
Date: Wed, 4 Jan 2023 21:42:44 -0600
Message-ID: <20230105034327.1439-11-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105034327.1439-1-mario.limonciello@amd.com>
References: <20230105034327.1439-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT109:EE_|IA0PR12MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: abd4b61b-8249-4f30-afd7-08daeecf1c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F2WCgZ4J5V5Z8IJnhRyLBprISpNZL+kX5I7EN6TpX6aQwbA6KzYLEIWdHvImKkf36Q2GHTb4Te1cnYMXF/MmFwmKTGXEz7R0I7dswjVcI+6mLgttF6f3EYAa9FStJQWCU/tMTHCeaJcjl7zcR3aaLXLRAhfV9fDV+XK841j4MsoKhDuuLYPIHP4+mbZyTFIwIW+qp8XPBfLWk1/fMQ8ju2pGhkUFSACOR2ylnMZPJ7ILRc0Hl26+JQd5NQ5gWZAhuibMN/KLOlVjyrI+1KCyT22LRdDyFB8/uYP6rRQNANBkW+hw0c0Y2zF/HqJtM29pz+qQZdCI7umbGFPsmbHr4vHs/WHpmOBlh1+jCfBFJ9GSgun2SV53DoB8GbnBx8r665+emQcjDd0hcl1osaUQ9w0g0A/oJPmnRmIKOOiAxvh/LV8hS4WURexPDBmK7axevNKv9n6rHjX3qGYqGt+BTL8OpFmvVV7ODJJQoa+r4ePpt6TaGrNHk8opUhOMoy3J4aKGTI3SEFIyDFSG/Qr140UfCFNctATB6Vs+7V+5GbnrbyzW+Uw6MFGI0HbFeAsysbtDtbi0mV2tNo0CQktTomCUV0Wi6mfTV7nuG8F577mF1wexCgamaxfTuvEHCHpLHP+OdqIZUDwX4NcLaPmPOQVDTK+8O6QQwHO0RbCREkpXGwc5PJYy4DYWBvxbZceTMKoY2r9UWBZHW138w+i/NQTlhrvx+eo1wpC85CGxc+Mb62CyUw9oaQoo2wA+7PAxXKDdKmU+S3Z+iWJCBpZFbpv++eIVC3Qy7bKlU7Zw2hI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(6666004)(36756003)(36860700001)(478600001)(82310400005)(16526019)(40460700003)(86362001)(81166007)(82740400003)(356005)(40480700001)(47076005)(1076003)(426003)(186003)(26005)(2616005)(7696005)(110136005)(336012)(5660300002)(30864003)(44832011)(70586007)(8676002)(4326008)(70206006)(8936002)(41300700001)(54906003)(2906002)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:12.2898 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abd4b61b-8249-4f30-afd7-08daeecf1c18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7652
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lazar Lijo <Lijo.Lazar@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplifies the code so that all VCN versions will get the firmware
name from `amdgpu_ucode_ip_version_decode` and then use this filename
to load microcode as part of the early_init process.

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

