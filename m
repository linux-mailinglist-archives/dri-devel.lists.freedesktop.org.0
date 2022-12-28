Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079736581BF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 17:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64BA10E3C1;
	Wed, 28 Dec 2022 16:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2049.outbound.protection.outlook.com [40.107.212.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F08F10E3BB;
 Wed, 28 Dec 2022 16:31:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChdHcUOAZPQqfAvaO2cLTNoU1FghvAgbJoZodc5Vm3Jp5yIB9uO6/AVOMU0mjzxz/0xNTQgJaF423pAuWfKPWZlOc3PxA/eun50Z94JMSy7TRGvpBYMmu9X6KJFsMO5Uiyyury6WJ0DhemNZBghI4HZC1u8F16fdb/Rujn3pT2SDzSLekd8myV2Tg7VExLUIzo3nSveZcBtHdTUrmpkiOcYRqm5UlSfw1Qi3Ig/GdRrjrAdQ6Hun2L3uL1aGgzZ377HlINtFeVJIEO0jOUwKbCevWD0vfxgGPtt6qveF8N9XJRtHHuHzyfPqpgehCTgdivuGWdL54OnLOwI/0ZgY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAcXvEZP2+uIyy/W1PQlQJTFN/DyTURf7lYcFW1XoEA=;
 b=Q80PBk8CaJjDzcCtmsPaDN9u4TWsB90iNbmhwjuqaJ1+TiPNTJ+PFM9F2Er0FFBooiZUQoqXM/z8iwbcPRu8WDYC45DZtjdMU64H3SEIX/Qtl/J4Of7vdYnt6yhYauwBg8pIFM8Ra/T+zUFY6dRrZbHUngQZoX7DYqeTTsEuAVIGfoxBue5BAkFlVHusv2R+98mqup05h+4rUsTp25xwPHezMF5gflHtafuF0XHIZNPAMzWq0OCHUzHneb8M3HZi8PFdDjseMX39Ko6TXiE7GHWVRSbHWciWeVYECmJUKVTIY6nIqEn9DvmT05umUQK5mPG+jkv34m0IPWN2Lw0vTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAcXvEZP2+uIyy/W1PQlQJTFN/DyTURf7lYcFW1XoEA=;
 b=4dr6Yol1vIW/clZ0c+55kBaGtf9rXPiSmQuwn9qKUA+ML33uD8Ofs9qWOL78Pk4hhRBruoOSpz7JS7NUXZBGc5DG/As/Kl5s4k18Ej6BxV0yzIb44S/feEz7ugXsxJhmSPNWRvOo4lDANFL4AKy5/pY103B9D31Bv9eJENKq/eQ=
Received: from MW4PR03CA0306.namprd03.prod.outlook.com (2603:10b6:303:dd::11)
 by PH7PR12MB6719.namprd12.prod.outlook.com (2603:10b6:510:1b2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 16:31:17 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::3e) by MW4PR03CA0306.outlook.office365.com
 (2603:10b6:303:dd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17 via Frontend
 Transport; Wed, 28 Dec 2022 16:31:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Wed, 28 Dec 2022 16:31:16 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 28 Dec
 2022 10:31:15 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Javier Martinez Canillas <javierm@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 02/11] drm/amd: Add a legacy mapping to
 "amdgpu_ucode_ip_version_decode"
Date: Wed, 28 Dec 2022 10:30:49 -0600
Message-ID: <20221228163102.468-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228163102.468-1-mario.limonciello@amd.com>
References: <20221228163102.468-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT032:EE_|PH7PR12MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc5944f-d3c1-4998-c15e-08dae8f0f1b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: snMjEir5QHSuv0kUu4x9wT1G8lz2MIXDlOQeWHmGz6MR97pqHAYBRaoJBDDWjW/JpDvICo6J2jfleXUGjuOeQ6h2A2OCud0j7q5t2t0LvgK1MjzsQ6kqPk277T/1DoCtfpxFBtFLsrMsmJcyAE5HS9OLe+Vz0El3JBzpb9+JpAS7mDVcCeB9u2Yb88JtphESUMxrgVJ13UqkG0T10CLHOsei6bjzYxQjI1OT9e3uo5J+XDk8D4HlUoLoV3Ijn7pvrYqDOh2rInZ+ITiYaODGS/UILKYddlfn90TQb65yVJSaolkw9pt8n4E1FIKmfSn/ROcoDz2GZPWV8P4wBHj9ufasLiVdeYqK+VAhiNWtLnPnv5m0EM/XS3WN/VhGCGKX8MpmWA8oaQP0PN914i4mRWS5fF/gaHmTC7fkKO7UeX4QYhVzWMO4xmtAI4QJ+wB7RIV5FrwvwKhJGkAPIQ2pAKqlv7nqBiVxwg+RGgp14YnkB1RMaDiirl9WIqVFDj2PGInI1yEOIs2FmTol2aXyGOJJiqSi2JrO+bzCEa5lXWksjoTet5BcwY3zqbwcK10rtD5WC4ituv8zMzuxybBF4fHKhXcx/Dfk9jE1xs8ivxjOzvJZ+d/pM/xtVCel/63Ead+4Jx4Wy0/cC31lFwXF99te24d/Nfydx7WFGS4TVF+qPJIFoYt1l8StAiSS5B/k/5mMzVW+yuZHEphlmAmUJ67nFVfo8W//a5A5rea1kSU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(316002)(41300700001)(36860700001)(82310400005)(336012)(54906003)(47076005)(6666004)(2906002)(81166007)(36756003)(82740400003)(478600001)(426003)(110136005)(2616005)(1076003)(8936002)(44832011)(356005)(83380400001)(26005)(186003)(5660300002)(86362001)(8676002)(40480700001)(40460700003)(4326008)(70206006)(70586007)(7696005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2022 16:31:16.9577 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc5944f-d3c1-4998-c15e-08dae8f0f1b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6719
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will allow other parts of the driver that currently special
case firmware file names to before IP version style naming to just
have a single call to `amdgpu_ucode_ip_version_decode`.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 208 ++++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index 5cb62e6249c2..5392c1fe434b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -1059,12 +1059,220 @@ int amdgpu_ucode_init_bo(struct amdgpu_device *adev)
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
+				else
+					return "raven";
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
+				else
+					return "green_sardine";
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
+			return "vega10";
+		case IP_VERSION(4, 0, 1):
+			return "vega12";
+		case IP_VERSION(4, 1, 0):
+		case IP_VERSION(4, 1, 1):
+			if (adev->apu_flags & AMD_APU_IS_RAVEN2)
+				return "raven2";
+			else if (adev->apu_flags & AMD_APU_IS_PICASSO)
+				return "picasso";
+			else
+				return "raven";
+		case IP_VERSION(4, 1, 2):
+			if (adev->apu_flags & AMD_APU_IS_RENOIR)
+				return "renoir";
+			else
+				return "green_sardine";
+		case IP_VERSION(4, 2, 0):
+			return "vega20";
+		case IP_VERSION(4, 2, 2):
+			return "arcturus";
+		case IP_VERSION(4, 4, 0):
+			return "aldebaran";
+		case IP_VERSION(5, 0, 0):
+			return "navi10";
+		case IP_VERSION(5, 0, 1):
+			return "cyan_skillfish2";
+		case IP_VERSION(5, 0, 2):
+			return "navi14";
+		case IP_VERSION(5, 0, 5):
+			return "navi12";
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
+			else
+				return "raven_vcn";
+			break;
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
+			else
+				return "navi14_vcn";
+		case IP_VERSION(3, 0, 0):
+		case IP_VERSION(3, 0, 64):
+		case IP_VERSION(3, 0, 192):
+			if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
+				return "sienna_cichlid_vcn";
+			else
+				return "navy_flounder_vcn";
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

