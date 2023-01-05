Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 306F465E3B8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C56110E63C;
	Thu,  5 Jan 2023 03:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8032110E638;
 Thu,  5 Jan 2023 03:43:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBBsbEqbDKQ2R8uD6ImoY56AkvJLkBcoILCHU5PF4qCnsM6445tfiXHLLZmiBUrIuSy4pzaqwBCwttA66rgWP4EnKsijSt+hKmN+RyCbp8/K64fehJRln0DIPu41EDYQanndHnERv4Kw4jroP4/p8tpGl5wSM8Z6cgkSvGp7A1T8PBjfWT++nKiYH+fdcvaE/wn9Cl42C603oo34weLzuPfe8vhUSJcFhbigdoaVAgBcPkrjsoXgvFLdQf6dGn0XzWCAwT6WzrLvi8y7yAtBMr6dlzkYxm9rfsHoZd925zS4NH5vjmUUGenv4D1ViltLiOWMzQ0ux3uZU5dgf79Jmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPUhLGTIynvt/p0QSZas3hi/uxVvXqmflyBkHEhe2gU=;
 b=BIOnoa5bepJ8Y1wTiWUH1GayCxq6uU4xuyQPIZi2NuOpIt19LODj8cJVIUQ1COZQUX3shR32JGeyPXHB1lUOfuLxLXXfOlcIXvjVwyAtCOYoP1vN64/4jxI8DX8PGQA4+MICDDyD2nebches6JorBfyikz6k5cSdnYGwUzPvj3olLB0F/YWgbhP6J3jgag6Bx8NKCPQY8GAzRxUigXT1w8ZvLWZkZBHRwIKmFXETxQJWAWFIvBvbqY/E+cOx8GE6nS57NlDWLJj9XnKkh/YSr4DwGCorQYTUxjsF9lAgAMau6erL1aOZdsxIOH9LLlDDMczkm83jwsw8wPYDl5neiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPUhLGTIynvt/p0QSZas3hi/uxVvXqmflyBkHEhe2gU=;
 b=y3IThn2Uv/Pza4vJeUNAcXIQG+W+ELo0yDoybWiQtBKAKEDezVIHPzm6rTDaPvaIIEbQNb+TcBJUBqN55NpsW2pPco+E6qC6PrU/+UkQNZXdOheHUQslO7sKqEJ6cJQiGGj6xwxsw9wKxDjlIB17PZ8TdVHMcLGRTDEqRKby9dQ=
Received: from BN0PR04CA0195.namprd04.prod.outlook.com (2603:10b6:408:e9::20)
 by PH8PR12MB7376.namprd12.prod.outlook.com (2603:10b6:510:214::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:43:54 +0000
Received: from BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::70) by BN0PR04CA0195.outlook.office365.com
 (2603:10b6:408:e9::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:43:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT105.mail.protection.outlook.com (10.13.176.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 03:43:54 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:43:52 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 02/45] drm/amd: Add a legacy mapping to
 "amdgpu_ucode_ip_version_decode"
Date: Wed, 4 Jan 2023 21:42:36 -0600
Message-ID: <20230105034327.1439-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105034327.1439-1-mario.limonciello@amd.com>
References: <20230105034327.1439-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT105:EE_|PH8PR12MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: a6a1e970-fa42-4a79-369c-08daeecf1160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rDZ2wIuoLmvUrsn5gbkrYXDr00CTqlXRSXg7dYr3j4bl+/Q65BoMspHGqUnbPVExoZCqH0boYNfHRP8dxXfngbiQTUquNt0mEVTeO8qeu92ZSqbhDintVSaFJVKYKLErtwPcd91K75eCqUPdLdc71n9mPckWjc8Var8KsCX8a/+imV/Zqx+VGgRsqy/KqgewrWqTd0VV8HRqc2eYF9+DogFhzNwnQeIJNkmnOte8Xi9Fy5+xUFtsKGFdnK7skQLRSDI9zjimLhcdmLgULPgozcbJATch7jB+wuilH5FLr5C4b5eKo2qd8y/j9KG7cjmnQKwXEU9RsUzhGVRJ9IO25WdObQWdVwfPuRbtfS4lAaARzL4QiHZl68VeUI0knumzbgPi/kpt9WyGOGnkLLsYgpit4cLah6xTkqMPMtN+Vdvc+/yIWll1zmEweAMgjETye6k4vGQgknJpW2qeAQn0yi7bWG8FVw44/WwWrRYToQCrQtIrhJHUWYOi+XPPK83g5bMil/8PYoLn48yL04G0FOsjlfwcbQAdzKbNJMdBOETKrjkjSiv1Mnq3wxj9rvXAiITzZY8wHJ65JgJolrRdl9UejZFYRaAsKHF0qLKcRn0/YKHMgl3JNJBZoYoPWlCEO04V3vTtkuLKUFiUgqXdA/0qauG62iQbGLBya7AeO7ASATukCOeIKw4rHrtoTqwR9VfQP9IgD/9pXdB9eKAca+buyqD0d9eJJq63x0kWSDQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(47076005)(16526019)(1076003)(426003)(2616005)(186003)(26005)(81166007)(82740400003)(356005)(336012)(86362001)(83380400001)(82310400005)(36756003)(36860700001)(44832011)(40480700001)(41300700001)(4326008)(8936002)(8676002)(40460700003)(5660300002)(6666004)(70586007)(316002)(70206006)(478600001)(54906003)(7696005)(2906002)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:43:54.3193 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a1e970-fa42-4a79-369c-08daeecf1160
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7376
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

This will allow other parts of the driver that currently special
case firmware file names to before IP version style naming to just
have a single call to `amdgpu_ucode_ip_version_decode`.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
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

