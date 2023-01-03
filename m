Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AC665C950
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B943010E28E;
	Tue,  3 Jan 2023 22:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BBB10E234;
 Tue,  3 Jan 2023 22:19:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1nozkx9ThV2hJzHOCt2bjP5Pdw2/WXL6eXV2YtC3BpeLLRfbuGT2H0aBwl7ALZm1QWfTjxneWTfLKieYptIEiJm/weaFUddKyHrWJFEV5VTKT5PXr3r1Be4YUuPFeNkJpLmzZm4JUBXTTsjMaXJNKqZEh5d4w+GhjqAMtVvuTtW+eQlbZkKKAez5iNhqZ8h0knOpj5sZOBCkUy9chz2AQoKj+UBVkLTRFuWme8ovuTvblAfwPu25bntGN1IR1rXufoTLmBkmKLYe5T440dwkBiKpA+ULzXzhCLFBDHL6KDkqBd7x/zOHvO31m9zjtj8sFPLf6bEfVLNvJ38kH0o2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyppqitZSKdQlbSpU3ipsKCDy/XzTWZGuEg81T3C8U8=;
 b=CFXnK2mO9UkKN2m9r7YSKo80Ce74Q6pm7h0UUMdabOXK0SAtjtvkwNdON4j3OlKhDMULt9uREgrEKqEPzQuiUxi5ChLaWE3z5mwg1WS9Y8TewhkZ9eQNONiRJokAasmTpVdgHQgWMHdL2I7isMxQ/iVU4dro+6u9TIaBPeoxUeMKDnUKm4nFLJDFcMLwtaYlJr+mO3Ol8RByPGmMJH6oYaaqjbW+pXPu9VkuGEuvyx9mP4JOYP830Q5GTHbYQ2Yzb+m4m10Lmm/LhSND6LMDd3zzRfIKhyqdPxwQXExxvS2/BppJBVEllQ9BypLVpPdniOr/e8VXmtw/ht7DAPkbpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyppqitZSKdQlbSpU3ipsKCDy/XzTWZGuEg81T3C8U8=;
 b=rFFbLjwQPuVpKADz6EM3tZDiFXwUlUbhiBXq2kt7GNO+NojoxLokO0Vf9Q6atleyC6Ze5Gxc34bPxtIIpyCudbNbYxqEO3My0Anf2NOmGmdPOdr8TOSk5mR2Nias2lMTWGma5rlqmvyVJdY9xEr3WZot2aX784C4Gyn504s5K/A=
Received: from DS7PR03CA0209.namprd03.prod.outlook.com (2603:10b6:5:3b6::34)
 by IA1PR12MB8553.namprd12.prod.outlook.com (2603:10b6:208:44e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 22:19:29 +0000
Received: from DS1PEPF0000E64F.namprd02.prod.outlook.com
 (2603:10b6:5:3b6:cafe::4f) by DS7PR03CA0209.outlook.office365.com
 (2603:10b6:5:3b6::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E64F.mail.protection.outlook.com (10.167.18.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:29 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:27 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 02/27] drm/amd: Add a legacy mapping to
 "amdgpu_ucode_ip_version_decode"
Date: Tue, 3 Jan 2023 16:18:21 -0600
Message-ID: <20230103221852.22813-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230103221852.22813-1-mario.limonciello@amd.com>
References: <20230103221852.22813-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E64F:EE_|IA1PR12MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f98dbbc-fd80-457a-73ca-08daedd894cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RLNF3BQZg+e/k2f8djTrJheHCpvzdjCN9oU2tZ26JXPiudhPC84AYjaI2rDlUNwFWfUKDck/yzPCFKoUpwQtY8yj64l8tTg5PrEeBNgjN1K1MWP6gkjokMSEKyMwRjYWpkc30EQUiZSAnlApVqv+1BTcukIVd2H4vZWsdXCiWrbaD2BESo8Zq3Re0T/E6kWqoIUpeuV2ob15gJ+Jv3aJQJf+ZhvxM89ACy23DsXwY68JDAIBnNbBpVqWUCaHijZ6S9/1qD56r8/BtkQZ02+QejTK8XjlZlriJ+QPRFbk5PYU0yoRWuKDpVoV12jJbXPGJMJCzBQdx3kqUtIw+S2/20qTzFt9FyEprLNxyu4kqPAbcsmDFifX/v39bgZl6y1K7tKwi/GFMQwoVXkRev3fMZq0hMr4l6mXXZT1lQ5gy4sj748dXNTLnBM0S6R1ykevt/Zh7bmLFJF03En4HFanrw3SXV0ZLR3GVOstraK3j+nsK8y1BjeNsSUEOHpJRjsrQOj18Inx8v4ZEYvOKJTHZB5T4Ri+KfxOe9VCy4nn1pFOHsYSabvxwu/ujt/Wc7RQWffbYt0gZmiYQcfRzt+27V+jzK8hlybLN5IwG7EMvllZ264bamOWsdmdnOuwS1ZYof6CZWXAqfgRaciDI3wApAczBHTYWMqV9cH3B3YjwGdJ2Z9L/0VyMWF9Be35C/ob27d3u/6zhNqMN4RdtZAcdFewdrARKpNw52W0hCi1oNpqLO+P9p9c9fC/gkV7pd754Vk2GXYz+BDfvFoZUe1IRg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(316002)(54906003)(110136005)(26005)(186003)(36860700001)(2616005)(6666004)(1076003)(70206006)(478600001)(16526019)(4326008)(426003)(41300700001)(5660300002)(44832011)(83380400001)(47076005)(8936002)(2906002)(336012)(70586007)(8676002)(82740400003)(40480700001)(356005)(81166007)(86362001)(7696005)(40460700003)(36756003)(82310400005)(22166009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:29.0907 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f98dbbc-fd80-457a-73ca-08daedd894cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E64F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8553
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
v3->v4:
 * No changes
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

