Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C9B6594E0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 06:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7020E10E082;
	Fri, 30 Dec 2022 05:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45DD10E059;
 Fri, 30 Dec 2022 05:21:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geGveOrSO1qz4oaJBQKJJ1On73NN50IeJ+SIEao5elWpvWe6w4ZhLD+GOyC++9fsqGUjgP1fmlAxk3GHERgqZLWU9U8dbgY1/MFOcjYu202ZIcrqiru7d5GhUw8UBoTbd45+k7sZuhB+cyCts6ZPWDq2MyJe9GvZLLVu9WBbwEcyh4yYWXJ8d74wyv+DCxN19Yb8+dKo448+pVkprARJmqJ/59eWv06IZEtKLcQCtZiJb3YkkVQWWq2MEl0nLRmxEjkkzUJUVwNpahqbH9d11eYEDIHgSc237UHQH+wXvosNBtla8LCJvVa3tZblfbXRCWN1+NkNJecLCiQs88nWBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNTzdji72o46pwicV5EkYUF7sldXH2ebgHPkENhol1U=;
 b=akv1ZkaIeYv2+VMank5l2C9+gQO0CRtSbjP+26S/TLf6Kb9zbYmBd2muzcc7crVaTyz58CGzC5t8tVGD4jSSlXnb2pBf6whBHPStgPh//LgeAX+Bmr6i6TO/61E8OivGthfgN13NZ0jKrY7bcOR0MP2ennScby8XoeyxFPv00BzxDV91M7dIZF7HJjC1j832pMXeq/sAlmG+1jWALauOQscUltsy2iKGmTI6ej/1pqwMy5BUsZeXOpG0/HL3B5l7R71w/c5FvS9YZ7ns7hGy405Hbe3jt9KJZIxftD3o9laDvhJIs4Wx0yqICiw1VrtyUQ3zxlCyNYo5p1yUCGe1iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNTzdji72o46pwicV5EkYUF7sldXH2ebgHPkENhol1U=;
 b=T78FMpYd+EnGxeCNXvWlr2EBHtDdV0IUUTl36xvho/7qhR9ej1zfohQ9fLjhyz7BqLjvWW2FiHB3eRPsPrBgTyw3/O7vnP2W4b9GMbvAFtRxVZaIvfuywCjfyHs6QkTSm9zCZIsCciQzXwn/NLLzgCkH8Kba7bPuRwtCRYm+Zek=
Received: from MW4PR04CA0294.namprd04.prod.outlook.com (2603:10b6:303:89::29)
 by DM6PR12MB4927.namprd12.prod.outlook.com (2603:10b6:5:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 05:21:41 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::d2) by MW4PR04CA0294.outlook.office365.com
 (2603:10b6:303:89::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17 via Frontend
 Transport; Fri, 30 Dec 2022 05:21:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.6 via Frontend Transport; Fri, 30 Dec 2022 05:21:41 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 29 Dec
 2022 23:21:38 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 02/11] drm/amd: Add a legacy mapping to
 "amdgpu_ucode_ip_version_decode"
Date: Thu, 29 Dec 2022 23:21:06 -0600
Message-ID: <20221230052119.15096-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221230052119.15096-1-mario.limonciello@amd.com>
References: <20221230052119.15096-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT043:EE_|DM6PR12MB4927:EE_
X-MS-Office365-Filtering-Correlation-Id: 9402070f-a147-41de-e849-08daea25bbdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H325NaH/GAymvoCWNzbtnzsUdA1jL1JJ8hW5OCerGZ8MohEBt3DkSnLij009zlAAJceQixkWowv0WX3kEoNqZAf4aYZtb9GCGTZPH/2iCJsqMsy81iHz6PgcilJICzw/6Jk3+8Z3zfoGZD7cIsE6dMkpLN5fojXv4ik+NcXqgtksR7OxxoUbXwlQwhOWpHVfUOdKHNmqR2IHOu/OQrI6qFoCOvpaagb2KSa/OtGj5kYmPlY1LcAxyR0zu9tyacIgMLmCpeUUXjK/F04CyBwQqk9FFgXSTQRoOVHeVWmvu684CiM+4yviN54LgTfQeD9VkpXJH8SuOWEJ0eQGTkCdelXW4Axpmunos8HcJZ2byiobEOY8hHvCDpEQW4Hgb56pt1sD26TSf4dst0HmoU80O6WyvDF59EmgisvEgVp9jN137LPvhB+bsB7+CYIpkgjlE4v3GN14SXvqzr/neqUaQ5wETPTIPilWAMKzZfoRTZtcM6/ZpkCS1nJO1xo9tf4pIoejP1ngdMSaYV6tFcJ2nxW/LabKBtzclZmiboxfsuiLoEHxjqVwHcvx1CxFdiNfamQjN8LfT3UJJmd1UVonpu9vxx0rwfef1QP/TBMo3Mvnum3NILeaQ7jr4heRPQfXA+GbUufNGvFxmflG2ubiZ6IjzWyBq4XiuIfGICZ4CpW4yzeayoVChLQS4ioQM/zpnQ4+YX+0rYe/V0t1Ov2ZIJdA/n850BhaQLO4AK4e1jY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(356005)(6666004)(5660300002)(82740400003)(81166007)(16526019)(186003)(26005)(2906002)(316002)(40460700003)(7696005)(54906003)(478600001)(86362001)(44832011)(36756003)(110136005)(40480700001)(426003)(47076005)(41300700001)(83380400001)(8936002)(70586007)(82310400005)(70206006)(1076003)(8676002)(2616005)(4326008)(336012)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 05:21:41.1643 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9402070f-a147-41de-e849-08daea25bbdf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4927
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will allow other parts of the driver that currently special
case firmware file names to before IP version style naming to just
have a single call to `amdgpu_ucode_ip_version_decode`.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2->v3:
 * Fixes for GFX9 SDMA
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 221 ++++++++++++++++++++++
 1 file changed, 221 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index 5cb62e6249c2..eafcddce58d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -1059,12 +1059,233 @@ int amdgpu_ucode_init_bo(struct amdgpu_device *adev)
 	return 0;
 }
 
+static const char *amdgpu_ucode_legacy_naming(struct amdgpu_device *adev, int block_type)
+{
+	if (block_type == MP0_HWIP) {
+		switch (adev->ip_versions[MP0_HWIP][0]) {
+		case IP_VERSION(9, 0, 0):
+			switch (adev->asic_type) {
+			case CHIP_VEGA10:
+				return "vega10";
+			case CHIP_VEGA12:
+				return "vega12";
+			default:
+				return NULL;
+			}
+			break;
+		case IP_VERSION(10, 0, 0):
+		case IP_VERSION(10, 0, 1):
+			if (adev->asic_type == CHIP_RAVEN) {
+				if (adev->apu_flags & AMD_APU_IS_RAVEN2)
+					return "raven2";
+				else if (adev->apu_flags & AMD_APU_IS_PICASSO)
+					return "picasso";
+				return "raven";
+			}
+			break;
+		case IP_VERSION(11, 0, 0):
+			return "navi10";
+		case IP_VERSION(11, 0, 2):
+			return "vega20";
+		case IP_VERSION(11, 0, 4):
+			return "arcturus";
+		case IP_VERSION(11, 0, 5):
+			return "navi14";
+		case IP_VERSION(11, 0, 7):
+			return "sienna_cichlid";
+		case IP_VERSION(11, 0, 9):
+			return "navi12";
+		case IP_VERSION(11, 0, 11):
+			return "navy_flounder";
+		case IP_VERSION(11, 0, 12):
+			return "dimgrey_cavefish";
+		case IP_VERSION(11, 0, 13):
+			return "beige_goby";
+		case IP_VERSION(11, 5, 0):
+			return "vangogh";
+		case IP_VERSION(12, 0, 1):
+			if (adev->asic_type == CHIP_RENOIR) {
+				if (adev->apu_flags & AMD_APU_IS_RENOIR)
+					return "renoir";
+				return "green_sardine";
+			}
+			break;
+		case IP_VERSION(13, 0, 2):
+			return "aldebaran";
+		case IP_VERSION(13, 0, 1):
+		case IP_VERSION(13, 0, 3):
+			return "yellow_carp";
+		}
+	} else if (block_type == MP1_HWIP) {
+		switch (adev->ip_versions[MP1_HWIP][0]) {
+		case IP_VERSION(9, 0, 0):
+		case IP_VERSION(10, 0, 0):
+		case IP_VERSION(10, 0, 1):
+		case IP_VERSION(11, 0, 2):
+			if (adev->asic_type == CHIP_ARCTURUS)
+				return "arcturus_smc";
+			return NULL;
+		case IP_VERSION(11, 0, 0):
+			return "navi10_smc";
+		case IP_VERSION(11, 0, 5):
+			return "navi14_smc";
+		case IP_VERSION(11, 0, 9):
+			return "navi12_smc";
+		case IP_VERSION(11, 0, 7):
+			return "sienna_cichlid_smc";
+		case IP_VERSION(11, 0, 11):
+			return "navy_flounder_smc";
+		case IP_VERSION(11, 0, 12):
+			return "dimgrey_cavefish_smc";
+		case IP_VERSION(11, 0, 13):
+			return "beige_goby_smc";
+		case IP_VERSION(13, 0, 2):
+			return "aldebaran_smc";
+		}
+	} else if (block_type == SDMA0_HWIP) {
+		switch (adev->ip_versions[SDMA0_HWIP][0]) {
+		case IP_VERSION(4, 0, 0):
+			return "vega10_sdma";
+		case IP_VERSION(4, 0, 1):
+			return "vega12_sdma";
+		case IP_VERSION(4, 1, 0):
+		case IP_VERSION(4, 1, 1):
+			if (adev->apu_flags & AMD_APU_IS_RAVEN2)
+				return "raven2_sdma";
+			else if (adev->apu_flags & AMD_APU_IS_PICASSO)
+				return "picasso_sdma";
+			return "raven_sdma";
+		case IP_VERSION(4, 1, 2):
+			if (adev->apu_flags & AMD_APU_IS_RENOIR)
+				return "renoir_sdma";
+			return "green_sardine_sdma";
+		case IP_VERSION(4, 2, 0):
+			return "vega20_sdma";
+		case IP_VERSION(4, 2, 2):
+			return "arcturus_sdma";
+		case IP_VERSION(4, 4, 0):
+			return "aldebaran_sdma";
+		case IP_VERSION(5, 0, 0):
+			return "navi10_sdma";
+		case IP_VERSION(5, 0, 1):
+			return "cyan_skillfish2_sdma";
+		case IP_VERSION(5, 0, 2):
+			return "navi14_sdma";
+		case IP_VERSION(5, 0, 5):
+			return "navi12_sdma";
+		case IP_VERSION(5, 2, 0):
+			return "sienna_cichlid_sdma";
+		case IP_VERSION(5, 2, 2):
+			return "navy_flounder_sdma";
+		case IP_VERSION(5, 2, 4):
+			return "dimgrey_cavefish_sdma";
+		case IP_VERSION(5, 2, 5):
+			return "beige_goby_sdma";
+		case IP_VERSION(5, 2, 3):
+			return "yellow_carp_sdma";
+		case IP_VERSION(5, 2, 1):
+			return "vangogh_sdma";
+		}
+	} else if (block_type == UVD_HWIP) {
+		switch (adev->ip_versions[UVD_HWIP][0]) {
+		case IP_VERSION(1, 0, 0):
+		case IP_VERSION(1, 0, 1):
+			if (adev->apu_flags & AMD_APU_IS_RAVEN2)
+				return "raven2_vcn";
+			else if (adev->apu_flags & AMD_APU_IS_PICASSO)
+				return "picasso_vcn";
+			return "raven_vcn";
+		case IP_VERSION(2, 5, 0):
+			return "arcturus_vcn";
+		case IP_VERSION(2, 2, 0):
+			if (adev->apu_flags & AMD_APU_IS_RENOIR)
+				return "renoir_vcn";
+			return "green_sardine_vcn";
+		case IP_VERSION(2, 6, 0):
+			return "aldebaran_vcn";
+		case IP_VERSION(2, 0, 0):
+			return "navi10_vcn";
+		case IP_VERSION(2, 0, 2):
+			if (adev->asic_type == CHIP_NAVI12)
+				return "navi12_vcn";
+			return "navi14_vcn";
+		case IP_VERSION(3, 0, 0):
+		case IP_VERSION(3, 0, 64):
+		case IP_VERSION(3, 0, 192):
+			if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
+				return "sienna_cichlid_vcn";
+			return "navy_flounder_vcn";
+		case IP_VERSION(3, 0, 2):
+			return "vangogh_vcn";
+		case IP_VERSION(3, 0, 16):
+			return "dimgrey_cavefish_vcn";
+		case IP_VERSION(3, 0, 33):
+			return "beige_goby_vcn";
+		case IP_VERSION(3, 1, 1):
+			return "yellow_carp_vcn";
+		}
+	} else if (block_type == GC_HWIP) {
+		switch (adev->ip_versions[GC_HWIP][0]) {
+		case IP_VERSION(9, 0, 1):
+			return "vega10";
+		case IP_VERSION(9, 2, 1):
+			return "vega12";
+		case IP_VERSION(9, 4, 0):
+			return "vega20";
+		case IP_VERSION(9, 2, 2):
+		case IP_VERSION(9, 1, 0):
+			if (adev->apu_flags & AMD_APU_IS_RAVEN2)
+				return "raven2";
+			else if (adev->apu_flags & AMD_APU_IS_PICASSO)
+				return "picasso";
+			return "raven";
+		case IP_VERSION(9, 4, 1):
+			return "arcturus";
+		case IP_VERSION(9, 3, 0):
+			if (adev->apu_flags & AMD_APU_IS_RENOIR)
+				return "renoir";
+			return "green_sardine";
+		case IP_VERSION(9, 4, 2):
+			return "aldebaran";
+		case IP_VERSION(10, 1, 10):
+			return "navi10";
+		case IP_VERSION(10, 1, 1):
+			return "navi14";
+		case IP_VERSION(10, 1, 2):
+			return "navi12";
+		case IP_VERSION(10, 3, 0):
+			return "sienna_cichlid";
+		case IP_VERSION(10, 3, 2):
+			return "navy_flounder";
+		case IP_VERSION(10, 3, 1):
+			return "vangogh";
+		case IP_VERSION(10, 3, 4):
+			return "dimgrey_cavefish";
+		case IP_VERSION(10, 3, 5):
+			return "beige_goby";
+		case IP_VERSION(10, 3, 3):
+			return "yellow_carp";
+		case IP_VERSION(10, 1, 3):
+		case IP_VERSION(10, 1, 4):
+			return "cyan_skillfish2";
+		}
+	}
+	return NULL;
+}
+
 void amdgpu_ucode_ip_version_decode(struct amdgpu_device *adev, int block_type, char *ucode_prefix, int len)
 {
 	int maj, min, rev;
 	char *ip_name;
+	const char *legacy;
 	uint32_t version = adev->ip_versions[block_type][0];
 
+	legacy = amdgpu_ucode_legacy_naming(adev, block_type);
+	if (legacy) {
+		snprintf(ucode_prefix, len, "%s", legacy);
+		return;
+	}
+
 	switch (block_type) {
 	case GC_HWIP:
 		ip_name = "gc";
-- 
2.34.1

