Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F7065DA19
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FB010E442;
	Wed,  4 Jan 2023 16:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0CE10E058;
 Wed,  4 Jan 2023 16:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmPHk+vtwvC2E+NzSb988m0wsN0l8v4x4MhvPxpMoifYy0FGnPgPg7Ix5wQ2vzRHJkIidZwBWvBZJ/TOcye24/Wftv/jQ582vY8piNPz/yckdaEcPJE+lhM2QFrGA698l+DFkzmAzsUwLm3/2JrY9bKu/J//CVeo0IDkaG0L32+MgEerEhtFIyjEvnrA6bLfAFft5ULF0K77zbpK+M76YqBXwkikGElhILz4ODd3Xkz+5QByUifrZmILvKKiBRT9mLnSBBo/VYQGdkuB2G1K4sSEE+0lnqcPN5W+kPKbWMCNveR4dCezcmuB+MmRPU560sINjdKsOETAsPCurRJLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoCJN3HhImmHrmnKweBk8pSJ5G2rBeB9x2K6QkGQYoU=;
 b=DHVMvyJFe0uRpMRDT/e3v3U57VgLHO8qwh/9lrNEnAyuafB8I4j+Wr8SJfoFy+yGamBiK7YYBYsL/2VOnr+eUJSmvYD+LyuWCiS1ILUWCISWo6dHFxyShAWLXuIZnWmvR4j3hy8AmXxTQHkB2EitOO2d7sIpUAWTTUGyVVpTcfZl7hm+NKre7BlTjYGNvAQGRsT+3B9Uk7xB5oGX075Lx68EI4lWo3CC1LEAiXnl+DOqmA80zIdBEpiVGqz2jgMqWnSHIbpcEv3udqj3RMJS4TNPgMHraUMEzKp6FjwRIfII1n2bsx5lbQ46CjaqLqle1oJb4rL1xWBP4mtlM+S+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoCJN3HhImmHrmnKweBk8pSJ5G2rBeB9x2K6QkGQYoU=;
 b=ESuJT9LRN/hod6dGSBHI14lQJPh4dEPE58/gUMNe/vGcCE2428TLqYW0ilL5RzVAxOw0zg0MD2Gq5uLMq9+IBtI+VHw9m994Mrr4PrIUPo+cFd14tiLg3x7zhSSv3yr9FNeI/63L2qDZnTIcBo24ZRkNFJ4sfzrylbVqPlU7KIk=
Received: from DS7PR03CA0328.namprd03.prod.outlook.com (2603:10b6:8:2b::30) by
 DS0PR12MB7509.namprd12.prod.outlook.com (2603:10b6:8:137::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Wed, 4 Jan 2023 16:41:51 +0000
Received: from DS1PEPF0000E644.namprd02.prod.outlook.com
 (2603:10b6:8:2b:cafe::fc) by DS7PR03CA0328.outlook.office365.com
 (2603:10b6:8:2b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:41:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E644.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:41:50 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:41:47 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 02/45] drm/amd: Add a legacy mapping to
 "amdgpu_ucode_ip_version_decode"
Date: Wed, 4 Jan 2023 10:39:51 -0600
Message-ID: <20230104164042.30271-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104164042.30271-1-mario.limonciello@amd.com>
References: <20230104164042.30271-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E644:EE_|DS0PR12MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ccae722-bac2-4a9b-a425-08daee72945e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rCDl3v02tdBs2nXZN7bWP0I5USI3JlSp803StcyC5JCqwq36JbX+xgugvJn86M+dadLX4TA8dZbDtzsJjyT2bvqgwCw5iHeRI2VyI1nnAfkVpV5uWoTu4n9ynIc9M3MuucKKQbCVPHbAw0H+lVfZpIYIgW36JBQDJkfzHA9R6qyiZ3d9P8c+5OTO5lm5Wqxgcy/n7sqhcc9pg+evbH71gBFe7Px1U+4LUJiJMBHpyyk1uDtiEDwNznAlCha625cpsgZ88oAnPg02D1LdtJHEHit/RD4/Gpzq6n/8dS6bjIck/TL72Ub4JgVV4PqMdwYSMio+5Wr2s2Ga3TU9FcsET3yxFGcmtXB15Kd9uJt/0OzBu3WEEpJS2JC6MVRw9pMei3JM9Ie3gZii26lxW8gNNhfgi4u4qMB/Wflyud77Dv245prv21dX0CPX5RqQBgEI1poVE6+7CmoD1TWX2avziNjkom6BhxBTKIPY/DgADi9XMV3rb/4VZh4KEVJ6wzSK1OosQusaxBj/YTUtcITjUOT49UHF8xfMJX3YS/eC6dekr/+i+3xAclTPIUXEffCpdj33yYKBwkpgZazVCpNKvc0gZjeCUzWjEeqMS20GGyzpuKO8gzlPn6c5MUtmhXvb9Fzc26e2KSPuAXiWe+awhZxzBggocTtdpU7q+pypqdBCIlieGBMNeeN023XYoWs08of0MTiyGXQEo6ePiD8J78q59a+kRmnkVjGxDipIJrQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199015)(36840700001)(46966006)(40470700004)(110136005)(54906003)(26005)(186003)(478600001)(1076003)(6666004)(70206006)(2616005)(16526019)(4326008)(83380400001)(336012)(426003)(8936002)(8676002)(5660300002)(44832011)(47076005)(41300700001)(2906002)(316002)(70586007)(36860700001)(82740400003)(40480700001)(356005)(81166007)(40460700003)(86362001)(7696005)(36756003)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:41:50.8478 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ccae722-bac2-4a9b-a425-08daee72945e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E644.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7509
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

