Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743E86594F3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 06:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB06E10E0B6;
	Fri, 30 Dec 2022 05:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC8510E437;
 Fri, 30 Dec 2022 05:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9m4gEkpkw9G4iUYOccQ7UXGdVy6ey2nu4pFJx2fxu/zenEzPB1IRC7JQBUgLNuyFhUAoj/4b59/uZimO64vNMEBMA7TvCzBQpQdcf81Q8+14cwramEOcmaOeFU5vNtHNd7M2MCuwcjSSWfQYMol7fOV9fZYArbtUOeql3N29WQR7MwFgCM6aDeCvxGY0E7jKxpHIdKbIvh+3AwE3FYgGmrBxaUC9An//ucTWnk3BZAgHzMRwdJXUf4VwRdLPbHbBlIqNaxmTPiM1g+JgwsF8TPKb1HDUu6oJ7qTS8zYCOI9ZJC6E0+MVdgfAEwYaA9ZTnhN8V3kQTtQvbhLo9w6zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nc2u+ftA6WIEJ+pKMUpPUxmDYkflFJMwxD2uyyuQgU=;
 b=I5rL8+Hy86fOC7MStbaaenP9ArZZZev58BMGqA0a3EJTGQ/NpZSG3Kd5FcFR7PyOWGQPUXDYAbOcRw7pfqlVKLcpdYvZyxc4u/Nvfd+21yaEH/Q3cFuepG5ri9ly2VwrB6H+p9ZKUaNwumYOn4UkRlkk+xsS0Ia844xu2g9nYaYEQLKEsYWByyCNJyi5GExDTMA007W6fA6+C3Y8bRTmY23/jvLIjIymcd+pYWIklMhWgPGBT9iVfWtxVR//BpnaT0iTAwB55aHUrXwmyckmMdxaI+/9AkL47iz0h2/k9dg9GZN5L7pdEhDfXThLfa1Yn0qfg3KuyoOlw8Q6n9JY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nc2u+ftA6WIEJ+pKMUpPUxmDYkflFJMwxD2uyyuQgU=;
 b=Dqc50prXYxF0FZizH4nxhHkqntfrdGeLRsQCIWdoe3Sc9h+jK75SuyoTAYBFDbg2st5Tr8yXOGzGXJ5u/H5UFC4a/cD6Ur7p3vpXn7il8iZVzkyuE2bk/vEY0dgqc6fRYc1aMI8ncSUqFERLtQ+OJgvmu4lLlxLR4lWlHYyTXcg=
Received: from MW4PR03CA0339.namprd03.prod.outlook.com (2603:10b6:303:dc::14)
 by DS7PR12MB6142.namprd12.prod.outlook.com (2603:10b6:8:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 05:21:52 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::1c) by MW4PR03CA0339.outlook.office365.com
 (2603:10b6:303:dc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.18 via Frontend
 Transport; Fri, 30 Dec 2022 05:21:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Fri, 30 Dec 2022 05:21:52 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 29 Dec
 2022 23:21:50 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 11/11] drm/amd: Request PSP microcode during IP discovery
Date: Thu, 29 Dec 2022 23:21:15 -0600
Message-ID: <20221230052119.15096-12-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT055:EE_|DS7PR12MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: 4392865a-a076-4a39-150b-08daea25c298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zw4cNgM6IPchCF2NGSs/3WwqocjrS1SKX1y8JnlDv5Sti7teT1lQiFiKAeLbO95ypgmEZac5SdVDbQkK+M4KUyezvsnpRcu/+awpAxPuU+QqnAN6zCNhDO75MbtpJnEZadng5Kow5uBc/JdMuXqKDOvRktiR0fooRMPjfG40oUCwdMfAnAr+WzMDb3QKYPwl68QQ6ZG9idpUb9PO/hVNh2ljFMwNmICBP4Z/y6hbZTTqDDXZFLzV749HaL1qOdjqo+eP1V8d9zex1DZkO7EyOS3retMaPcTP/A87lUP2vi7iJRXzaMWNexRBnnwCHBNFHzcuDP4Y4bmU6yX2laLq/+BzW57WGqxjSurv94O7LUH1IflbylYERDACpvLvuoDEfvZ43C9g1MgR7x9qnrP/PdlFtgLGtJMmGPpUW7fCWNemGuNDModcQzbRUIe0zDwBQAPLIoI4fK8jMQgIjTmQEJRws0MojcevQGuPzLI115s7l3bFaLppgQKK+h6JWVEdWj/8aN43z4hd7Z6Q6LKQ0opyUIOpG6hu/V/vn98f13exDN6PE/BzmttPMIPGQgRwtkHdlohzzA40N94y5idY/GeQx2PmcuIA2pRtkFulJJR/bg3ohh7KXoQ1E9tY+rZqKCB0EyvkRGR1BUu87nB4ktuYis16MstTqtCoPLv0CTM6fezyBZ4PKuTzscluaAwdZlJsrKMcNUel/UAV9ENaDfwB7P2lLsVm++ZNNyu8Qcw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(41300700001)(86362001)(47076005)(478600001)(7696005)(6666004)(8936002)(36756003)(26005)(186003)(16526019)(316002)(40460700003)(110136005)(54906003)(70206006)(4326008)(8676002)(70586007)(1076003)(426003)(2616005)(336012)(40480700001)(44832011)(30864003)(82310400005)(2906002)(356005)(83380400001)(5660300002)(81166007)(82740400003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 05:21:52.4220 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4392865a-a076-4a39-150b-08daea25c298
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6142
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

If PSP microcode is required but not available during early init, the
firmware framebuffer will have already been released and the screen will
freeze.

Move the request for PSP microcode into the IP discovery phase
so that if it's not available, IP discovery will fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2->v3:
 * Only request_firmware, don't validate during discovery
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 173 +++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |  58 +-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h       |  12 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c        |  99 +++------
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        | 191 +++++-------------
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c        |  98 +++------
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c        |  46 +----
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c      |  18 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c         |  16 +-
 9 files changed, 297 insertions(+), 414 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index ce1aa7683738..6b7dd0cf56ad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -158,6 +158,40 @@ MODULE_FIRMWARE("amdgpu/gc_11_0_2_mes1.bin");
 MODULE_FIRMWARE("amdgpu/gc_11_0_3_mes.bin");
 MODULE_FIRMWARE("amdgpu/gc_11_0_3_mes1.bin");
 
+MODULE_FIRMWARE("amdgpu/aldebaran_sos.bin");
+MODULE_FIRMWARE("amdgpu/aldebaran_ta.bin");
+MODULE_FIRMWARE("amdgpu/aldebaran_cap.bin");
+MODULE_FIRMWARE("amdgpu/green_sardine_asd.bin");
+MODULE_FIRMWARE("amdgpu/green_sardine_ta.bin");
+MODULE_FIRMWARE("amdgpu/raven_asd.bin");
+MODULE_FIRMWARE("amdgpu/picasso_asd.bin");
+MODULE_FIRMWARE("amdgpu/raven2_asd.bin");
+MODULE_FIRMWARE("amdgpu/picasso_ta.bin");
+MODULE_FIRMWARE("amdgpu/raven2_ta.bin");
+MODULE_FIRMWARE("amdgpu/raven_ta.bin");
+MODULE_FIRMWARE("amdgpu/renoir_asd.bin");
+MODULE_FIRMWARE("amdgpu/renoir_ta.bin");
+MODULE_FIRMWARE("amdgpu/yellow_carp_toc.bin");
+MODULE_FIRMWARE("amdgpu/yellow_carp_ta.bin");
+MODULE_FIRMWARE("amdgpu/vega10_sos.bin");
+MODULE_FIRMWARE("amdgpu/vega10_asd.bin");
+MODULE_FIRMWARE("amdgpu/vega10_cap.bin");
+MODULE_FIRMWARE("amdgpu/vega12_sos.bin");
+MODULE_FIRMWARE("amdgpu/vega12_asd.bin");
+MODULE_FIRMWARE("amdgpu/psp_13_0_5_toc.bin");
+MODULE_FIRMWARE("amdgpu/psp_13_0_5_ta.bin");
+MODULE_FIRMWARE("amdgpu/psp_13_0_8_toc.bin");
+MODULE_FIRMWARE("amdgpu/psp_13_0_8_ta.bin");
+MODULE_FIRMWARE("amdgpu/psp_13_0_0_sos.bin");
+MODULE_FIRMWARE("amdgpu/psp_13_0_0_ta.bin");
+MODULE_FIRMWARE("amdgpu/psp_13_0_7_sos.bin");
+MODULE_FIRMWARE("amdgpu/psp_13_0_7_ta.bin");
+MODULE_FIRMWARE("amdgpu/psp_13_0_10_sos.bin");
+MODULE_FIRMWARE("amdgpu/psp_13_0_10_ta.bin");
+MODULE_FIRMWARE("amdgpu/psp_13_0_4_toc.bin");
+MODULE_FIRMWARE("amdgpu/psp_13_0_4_ta.bin");
+MODULE_FIRMWARE("amdgpu/psp_13_0_11_toc.bin");
+MODULE_FIRMWARE("amdgpu/psp_13_0_11_ta.bin");
 
 /* gfx9 */
 MODULE_FIRMWARE("amdgpu/vega10_ce.bin");
@@ -339,6 +373,13 @@ MODULE_FIRMWARE("amdgpu/gc_11_0_4_me.bin");
 MODULE_FIRMWARE("amdgpu/gc_11_0_4_mec.bin");
 MODULE_FIRMWARE("amdgpu/gc_11_0_4_rlc.bin");
 
+enum amd_psp_microcode_kind {
+	AMD_PSP_MICROCODE_SOS,
+	AMD_PSP_MICROCODE_ASD,
+	AMD_PSP_MICROCODE_TA,
+	AMD_PSP_MICROCODE_TOC,
+};
+
 static const char *hw_id_names[HW_ID_MAX] = {
 	[MP1_HWID]		= "MP1",
 	[MP2_HWID]		= "MP2",
@@ -1856,14 +1897,59 @@ static int amdgpu_discovery_set_ih_ip_blocks(struct amdgpu_device *adev)
 	return 0;
 }
 
+static int amdgpu_discovery_load_psp_fw(struct amdgpu_device *adev,
+					enum amd_psp_microcode_kind kind,
+					const char *chip_name)
+{
+	char fw_name[PSP_FW_NAME_LEN];
+
+	switch (kind) {
+	case AMD_PSP_MICROCODE_SOS:
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sos.bin", chip_name);
+		return request_firmware(&adev->psp.sos_fw, fw_name, adev->dev);
+	case AMD_PSP_MICROCODE_ASD:
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_asd.bin", chip_name);
+		return request_firmware(&adev->psp.asd_fw, fw_name, adev->dev);
+	case AMD_PSP_MICROCODE_TA:
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
+		return request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
+	case AMD_PSP_MICROCODE_TOC:
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", chip_name);
+		return request_firmware(&adev->psp.toc_fw, fw_name, adev->dev);
+	}
+	return -EINVAL;
+}
+
 static int amdgpu_discovery_set_psp_ip_blocks(struct amdgpu_device *adev)
 {
+	char ucode_prefix[30];
+	int r;
+
+	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
+	adev->psp.adev = adev;
+
 	switch (adev->ip_versions[MP0_HWIP][0]) {
 	case IP_VERSION(9, 0, 0):
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_SOS,
+						 ucode_prefix);
+		if (r)
+			return r;
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_ASD,
+						 ucode_prefix);
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &psp_v3_1_ip_block);
 		break;
 	case IP_VERSION(10, 0, 0):
 	case IP_VERSION(10, 0, 1):
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_ASD,
+						 ucode_prefix);
+		if (r)
+			return r;
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_TA,
+						 ucode_prefix);
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &psp_v10_0_ip_block);
 		break;
 	case IP_VERSION(11, 0, 0):
@@ -1871,11 +1957,41 @@ static int amdgpu_discovery_set_psp_ip_blocks(struct amdgpu_device *adev)
 	case IP_VERSION(11, 0, 4):
 	case IP_VERSION(11, 0, 5):
 	case IP_VERSION(11, 0, 9):
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_SOS,
+						 ucode_prefix);
+		if (r)
+			return r;
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_ASD,
+						 ucode_prefix);
+		if (r)
+			return r;
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_TA,
+						 ucode_prefix);
+		if (r)
+			return r;
+		break;
 	case IP_VERSION(11, 0, 7):
 	case IP_VERSION(11, 0, 11):
 	case IP_VERSION(11, 0, 12):
 	case IP_VERSION(11, 0, 13):
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_SOS,
+						 ucode_prefix);
+		if (r)
+			return r;
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_TA,
+						 ucode_prefix);
+		if (r)
+			return r;
+		break;
 	case IP_VERSION(11, 5, 0):
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_ASD,
+						 ucode_prefix);
+		if (r)
+			return r;
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_TOC,
+						 ucode_prefix);
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &psp_v11_0_ip_block);
 		break;
 	case IP_VERSION(11, 0, 8):
@@ -1883,20 +1999,69 @@ static int amdgpu_discovery_set_psp_ip_blocks(struct amdgpu_device *adev)
 		break;
 	case IP_VERSION(11, 0, 3):
 	case IP_VERSION(12, 0, 1):
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_ASD,
+						 ucode_prefix);
+		if (r)
+			return r;
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_TA,
+						 ucode_prefix);
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &psp_v12_0_ip_block);
 		break;
-	case IP_VERSION(13, 0, 0):
-	case IP_VERSION(13, 0, 1):
 	case IP_VERSION(13, 0, 2):
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_SOS,
+						 ucode_prefix);
+		if (r)
+			return r;
+		/* It's not necessary to load ras ta on Guest side */
+		if (!amdgpu_sriov_vf(adev)) {
+			r = amdgpu_discovery_load_psp_fw(adev,
+							 AMD_PSP_MICROCODE_TA,
+							 ucode_prefix);
+			if (r)
+				return r;
+		}
+		amdgpu_device_ip_block_add(adev, &psp_v13_0_ip_block);
+		break;
+	case IP_VERSION(13, 0, 1):
 	case IP_VERSION(13, 0, 3):
 	case IP_VERSION(13, 0, 5):
-	case IP_VERSION(13, 0, 7):
 	case IP_VERSION(13, 0, 8):
-	case IP_VERSION(13, 0, 10):
 	case IP_VERSION(13, 0, 11):
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_TOC,
+						 ucode_prefix);
+		if (r)
+			return r;
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_TA,
+						 ucode_prefix);
+		if (r)
+			return r;
+		amdgpu_device_ip_block_add(adev, &psp_v13_0_ip_block);
+		break;
+	case IP_VERSION(13, 0, 0):
+	case IP_VERSION(13, 0, 7):
+	case IP_VERSION(13, 0, 10):
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_SOS,
+						 ucode_prefix);
+		if (r)
+			return r;
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_TA,
+						 ucode_prefix);
+
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &psp_v13_0_ip_block);
 		break;
 	case IP_VERSION(13, 0, 4):
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_TOC,
+						 ucode_prefix);
+		if (r)
+			return r;
+		r = amdgpu_discovery_load_psp_fw(adev, AMD_PSP_MICROCODE_TA,
+						 ucode_prefix);
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &psp_v13_0_4_ip_block);
 		break;
 	default:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 7a2fc920739b..0aabf8d5a457 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -371,7 +371,7 @@ static int psp_init_sriov_microcode(struct psp_context *psp)
 	case IP_VERSION(13, 0, 2):
 		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
 		ret = psp_init_cap_microcode(psp, "aldebaran");
-		ret &= psp_init_ta_microcode(psp, "aldebaran");
+		ret &= psp_init_ta_microcode(psp);
 		break;
 	case IP_VERSION(13, 0, 0):
 		adev->virt.autoload_ucode_id = 0;
@@ -2908,24 +2908,12 @@ int psp_ring_cmd_submit(struct psp_context *psp,
 	return 0;
 }
 
-int psp_init_asd_microcode(struct psp_context *psp,
-			   const char *chip_name)
+int psp_init_asd_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	char fw_name[PSP_FW_NAME_LEN];
 	const struct psp_firmware_header_v1_0 *asd_hdr;
 	int err = 0;
 
-	if (!chip_name) {
-		dev_err(adev->dev, "invalid chip name for asd microcode\n");
-		return -EINVAL;
-	}
-
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_asd.bin", chip_name);
-	err = request_firmware(&adev->psp.asd_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-
 	err = amdgpu_ucode_validate(adev->psp.asd_fw);
 	if (err)
 		goto out;
@@ -2944,24 +2932,12 @@ int psp_init_asd_microcode(struct psp_context *psp,
 	return err;
 }
 
-int psp_init_toc_microcode(struct psp_context *psp,
-			   const char *chip_name)
+int psp_init_toc_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	char fw_name[PSP_FW_NAME_LEN];
 	const struct psp_firmware_header_v1_0 *toc_hdr;
 	int err = 0;
 
-	if (!chip_name) {
-		dev_err(adev->dev, "invalid chip name for toc microcode\n");
-		return -EINVAL;
-	}
-
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", chip_name);
-	err = request_firmware(&adev->psp.toc_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-
 	err = amdgpu_ucode_validate(adev->psp.toc_fw);
 	if (err)
 		goto out;
@@ -3107,11 +3083,9 @@ static int psp_init_sos_base_fw(struct amdgpu_device *adev)
 	return 0;
 }
 
-int psp_init_sos_microcode(struct psp_context *psp,
-			   const char *chip_name)
+int psp_init_sos_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	char fw_name[PSP_FW_NAME_LEN];
 	const struct psp_firmware_header_v1_0 *sos_hdr;
 	const struct psp_firmware_header_v1_1 *sos_hdr_v1_1;
 	const struct psp_firmware_header_v1_2 *sos_hdr_v1_2;
@@ -3121,16 +3095,6 @@ int psp_init_sos_microcode(struct psp_context *psp,
 	uint8_t *ucode_array_start_addr;
 	int fw_index = 0;
 
-	if (!chip_name) {
-		dev_err(adev->dev, "invalid chip name for sos microcode\n");
-		return -EINVAL;
-	}
-
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sos.bin", chip_name);
-	err = request_firmware(&adev->psp.sos_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-
 	err = amdgpu_ucode_validate(adev->psp.sos_fw);
 	if (err)
 		goto out;
@@ -3272,25 +3236,13 @@ static int parse_ta_bin_descriptor(struct psp_context *psp,
 	return 0;
 }
 
-int psp_init_ta_microcode(struct psp_context *psp,
-			  const char *chip_name)
+int psp_init_ta_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	char fw_name[PSP_FW_NAME_LEN];
 	const struct ta_firmware_header_v2_0 *ta_hdr;
 	int err = 0;
 	int ta_index = 0;
 
-	if (!chip_name) {
-		dev_err(adev->dev, "invalid chip name for ta microcode\n");
-		return -EINVAL;
-	}
-
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
-	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-
 	err = amdgpu_ucode_validate(adev->psp.ta_fw);
 	if (err)
 		goto out;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
index cf4f60c66122..530e9ec1e263 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
@@ -502,14 +502,10 @@ int psp_ring_cmd_submit(struct psp_context *psp,
 			uint64_t cmd_buf_mc_addr,
 			uint64_t fence_mc_addr,
 			int index);
-int psp_init_asd_microcode(struct psp_context *psp,
-			   const char *chip_name);
-int psp_init_toc_microcode(struct psp_context *psp,
-			   const char *chip_name);
-int psp_init_sos_microcode(struct psp_context *psp,
-			   const char *chip_name);
-int psp_init_ta_microcode(struct psp_context *psp,
-			  const char *chip_name);
+int psp_init_asd_microcode(struct psp_context *psp);
+int psp_init_toc_microcode(struct psp_context *psp);
+int psp_init_sos_microcode(struct psp_context *psp);
+int psp_init_ta_microcode(struct psp_context *psp);
 int psp_init_cap_microcode(struct psp_context *psp,
 			  const char *chip_name);
 int psp_get_fw_attestation_records_addr(struct psp_context *psp,
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
index 9de46fa8f46c..4357e6fbfe40 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
@@ -37,79 +37,45 @@
 #include "gc/gc_9_1_offset.h"
 #include "sdma0/sdma0_4_1_offset.h"
 
-MODULE_FIRMWARE("amdgpu/raven_asd.bin");
-MODULE_FIRMWARE("amdgpu/picasso_asd.bin");
-MODULE_FIRMWARE("amdgpu/raven2_asd.bin");
-MODULE_FIRMWARE("amdgpu/picasso_ta.bin");
-MODULE_FIRMWARE("amdgpu/raven2_ta.bin");
-MODULE_FIRMWARE("amdgpu/raven_ta.bin");
-
 static int psp_v10_0_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
-	char fw_name[30];
 	int err = 0;
 	const struct ta_firmware_header_v1_0 *ta_hdr;
 	DRM_DEBUG("\n");
 
-	switch (adev->asic_type) {
-	case CHIP_RAVEN:
-		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
-			chip_name = "raven2";
-		else if (adev->apu_flags & AMD_APU_IS_PICASSO)
-			chip_name = "picasso";
-		else
-			chip_name = "raven";
-		break;
-	default: BUG();
-	}
-
-	err = psp_init_asd_microcode(psp, chip_name);
+	err = psp_init_asd_microcode(psp);
 	if (err)
 		goto out;
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
-	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
-	if (err) {
-		release_firmware(adev->psp.ta_fw);
-		adev->psp.ta_fw = NULL;
-		dev_info(adev->dev,
-			 "psp v10.0: Failed to load firmware \"%s\"\n",
-			 fw_name);
-	} else {
-		err = amdgpu_ucode_validate(adev->psp.ta_fw);
-		if (err)
-			goto out2;
-
-		ta_hdr = (const struct ta_firmware_header_v1_0 *)
-				 adev->psp.ta_fw->data;
-		adev->psp.hdcp_context.context.bin_desc.fw_version =
-			le32_to_cpu(ta_hdr->hdcp.fw_version);
-		adev->psp.hdcp_context.context.bin_desc.size_bytes =
-			le32_to_cpu(ta_hdr->hdcp.size_bytes);
-		adev->psp.hdcp_context.context.bin_desc.start_addr =
-			(uint8_t *)ta_hdr +
-			le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
-
-		adev->psp.dtm_context.context.bin_desc.fw_version =
-			le32_to_cpu(ta_hdr->dtm.fw_version);
-		adev->psp.dtm_context.context.bin_desc.size_bytes =
-			le32_to_cpu(ta_hdr->dtm.size_bytes);
-		adev->psp.dtm_context.context.bin_desc.start_addr =
-			(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
-			le32_to_cpu(ta_hdr->dtm.offset_bytes);
-
-		adev->psp.securedisplay_context.context.bin_desc.fw_version =
-			le32_to_cpu(ta_hdr->securedisplay.fw_version);
-		adev->psp.securedisplay_context.context.bin_desc.size_bytes =
-			le32_to_cpu(ta_hdr->securedisplay.size_bytes);
-		adev->psp.securedisplay_context.context.bin_desc.start_addr =
-			(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
-			le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
-
-		adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
-	}
+	err = amdgpu_ucode_validate(adev->psp.ta_fw);
+	if (err)
+		goto out2;
+
+	ta_hdr = (const struct ta_firmware_header_v1_0 *)
+			 adev->psp.ta_fw->data;
+	adev->psp.hdcp_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->hdcp.fw_version);
+	adev->psp.hdcp_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->hdcp.size_bytes);
+	adev->psp.hdcp_context.context.bin_desc.start_addr =
+		(uint8_t *)ta_hdr +
+		le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
+	adev->psp.dtm_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->dtm.fw_version);
+	adev->psp.dtm_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->dtm.size_bytes);
+	adev->psp.dtm_context.context.bin_desc.start_addr =
+		(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
+		le32_to_cpu(ta_hdr->dtm.offset_bytes);
+	adev->psp.securedisplay_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->securedisplay.fw_version);
+	adev->psp.securedisplay_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->securedisplay.size_bytes);
+	adev->psp.securedisplay_context.context.bin_desc.start_addr =
+		(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
+		le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
+	adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
 
 	return 0;
 
@@ -117,11 +83,8 @@ static int psp_v10_0_init_microcode(struct psp_context *psp)
 	release_firmware(adev->psp.ta_fw);
 	adev->psp.ta_fw = NULL;
 out:
-	if (err) {
-		dev_err(adev->dev,
-			"psp v10.0: Failed to load firmware \"%s\"\n",
-			fw_name);
-	}
+	if (err)
+		dev_err(adev->dev, "psp v10.0: Failed to load firmware");
 
 	return err;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index bd3e3e23a939..34e93232f3e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -41,34 +41,6 @@
 #include "oss/osssys_4_0_offset.h"
 #include "oss/osssys_4_0_sh_mask.h"
 
-MODULE_FIRMWARE("amdgpu/vega20_sos.bin");
-MODULE_FIRMWARE("amdgpu/vega20_asd.bin");
-MODULE_FIRMWARE("amdgpu/vega20_ta.bin");
-MODULE_FIRMWARE("amdgpu/navi10_sos.bin");
-MODULE_FIRMWARE("amdgpu/navi10_asd.bin");
-MODULE_FIRMWARE("amdgpu/navi10_ta.bin");
-MODULE_FIRMWARE("amdgpu/navi14_sos.bin");
-MODULE_FIRMWARE("amdgpu/navi14_asd.bin");
-MODULE_FIRMWARE("amdgpu/navi14_ta.bin");
-MODULE_FIRMWARE("amdgpu/navi12_sos.bin");
-MODULE_FIRMWARE("amdgpu/navi12_asd.bin");
-MODULE_FIRMWARE("amdgpu/navi12_ta.bin");
-MODULE_FIRMWARE("amdgpu/navi12_cap.bin");
-MODULE_FIRMWARE("amdgpu/arcturus_sos.bin");
-MODULE_FIRMWARE("amdgpu/arcturus_asd.bin");
-MODULE_FIRMWARE("amdgpu/arcturus_ta.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_sos.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_ta.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_cap.bin");
-MODULE_FIRMWARE("amdgpu/navy_flounder_sos.bin");
-MODULE_FIRMWARE("amdgpu/navy_flounder_ta.bin");
-MODULE_FIRMWARE("amdgpu/vangogh_asd.bin");
-MODULE_FIRMWARE("amdgpu/vangogh_toc.bin");
-MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_sos.bin");
-MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_ta.bin");
-MODULE_FIRMWARE("amdgpu/beige_goby_sos.bin");
-MODULE_FIRMWARE("amdgpu/beige_goby_ta.bin");
-
 /* address block */
 #define smnMP1_FIRMWARE_FLAGS		0x3010024
 /* navi10 reg offset define */
@@ -88,147 +60,89 @@ MODULE_FIRMWARE("amdgpu/beige_goby_ta.bin");
 static int psp_v11_0_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
-	char fw_name[PSP_FW_NAME_LEN];
 	int err = 0;
 	const struct ta_firmware_header_v1_0 *ta_hdr;
 
 	DRM_DEBUG("\n");
 
-	switch (adev->ip_versions[MP0_HWIP][0]) {
-	case IP_VERSION(11, 0, 2):
-		chip_name = "vega20";
-		break;
-	case IP_VERSION(11, 0, 0):
-		chip_name = "navi10";
-		break;
-	case IP_VERSION(11, 0, 5):
-		chip_name = "navi14";
-		break;
-	case IP_VERSION(11, 0, 9):
-		chip_name = "navi12";
-		break;
-	case IP_VERSION(11, 0, 4):
-		chip_name = "arcturus";
-		break;
-	case IP_VERSION(11, 0, 7):
-		chip_name = "sienna_cichlid";
-		break;
-	case IP_VERSION(11, 0, 11):
-		chip_name = "navy_flounder";
-		break;
-	case IP_VERSION(11, 5, 0):
-		chip_name = "vangogh";
-		break;
-	case IP_VERSION(11, 0, 12):
-		chip_name = "dimgrey_cavefish";
-		break;
-	case IP_VERSION(11, 0, 13):
-		chip_name = "beige_goby";
-		break;
-	default:
-		BUG();
-	}
-
-
 	switch (adev->ip_versions[MP0_HWIP][0]) {
 	case IP_VERSION(11, 0, 2):
 	case IP_VERSION(11, 0, 4):
-		err = psp_init_sos_microcode(psp, chip_name);
+		err = psp_init_sos_microcode(psp);
 		if (err)
 			return err;
-		err = psp_init_asd_microcode(psp, chip_name);
+		err = psp_init_asd_microcode(psp);
 		if (err)
 			return err;
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
-		err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
-		if (err) {
-			release_firmware(adev->psp.ta_fw);
-			adev->psp.ta_fw = NULL;
-			dev_info(adev->dev,
-				 "psp v11.0: Failed to load firmware \"%s\"\n", fw_name);
-		} else {
-			err = amdgpu_ucode_validate(adev->psp.ta_fw);
-			if (err)
-				goto out2;
-
-			ta_hdr = (const struct ta_firmware_header_v1_0 *)adev->psp.ta_fw->data;
-			adev->psp.xgmi_context.context.bin_desc.fw_version =
-				le32_to_cpu(ta_hdr->xgmi.fw_version);
-			adev->psp.xgmi_context.context.bin_desc.size_bytes =
-				le32_to_cpu(ta_hdr->xgmi.size_bytes);
-			adev->psp.xgmi_context.context.bin_desc.start_addr =
-				(uint8_t *)ta_hdr +
-				le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
-			adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
-			adev->psp.ras_context.context.bin_desc.fw_version =
-				le32_to_cpu(ta_hdr->ras.fw_version);
-			adev->psp.ras_context.context.bin_desc.size_bytes =
-				le32_to_cpu(ta_hdr->ras.size_bytes);
-			adev->psp.ras_context.context.bin_desc.start_addr =
-				(uint8_t *)adev->psp.xgmi_context.context.bin_desc.start_addr +
-				le32_to_cpu(ta_hdr->ras.offset_bytes);
-		}
+		err = amdgpu_ucode_validate(adev->psp.ta_fw);
+		if (err)
+			return err;
+
+		ta_hdr = (const struct ta_firmware_header_v1_0 *)adev->psp.ta_fw->data;
+		adev->psp.xgmi_context.context.bin_desc.fw_version =
+			le32_to_cpu(ta_hdr->xgmi.fw_version);
+		adev->psp.xgmi_context.context.bin_desc.size_bytes =
+			le32_to_cpu(ta_hdr->xgmi.size_bytes);
+		adev->psp.xgmi_context.context.bin_desc.start_addr =
+			(uint8_t *)ta_hdr +
+			le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
+		adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
+		adev->psp.ras_context.context.bin_desc.fw_version =
+			le32_to_cpu(ta_hdr->ras.fw_version);
+		adev->psp.ras_context.context.bin_desc.size_bytes =
+			le32_to_cpu(ta_hdr->ras.size_bytes);
+		adev->psp.ras_context.context.bin_desc.start_addr =
+			(uint8_t *)adev->psp.xgmi_context.context.bin_desc.start_addr +
+			le32_to_cpu(ta_hdr->ras.offset_bytes);
 		break;
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 5):
 	case IP_VERSION(11, 0, 9):
-		err = psp_init_sos_microcode(psp, chip_name);
+		err = psp_init_sos_microcode(psp);
 		if (err)
 			return err;
-		err = psp_init_asd_microcode(psp, chip_name);
+		err = psp_init_asd_microcode(psp);
 		if (err)
 			return err;
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
-		err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
-		if (err) {
-			release_firmware(adev->psp.ta_fw);
-			adev->psp.ta_fw = NULL;
-			dev_info(adev->dev,
-				 "psp v11.0: Failed to load firmware \"%s\"\n", fw_name);
-		} else {
-			err = amdgpu_ucode_validate(adev->psp.ta_fw);
-			if (err)
-				goto out2;
-
-			ta_hdr = (const struct ta_firmware_header_v1_0 *)adev->psp.ta_fw->data;
-			adev->psp.hdcp_context.context.bin_desc.fw_version =
-				le32_to_cpu(ta_hdr->hdcp.fw_version);
-			adev->psp.hdcp_context.context.bin_desc.size_bytes =
-				le32_to_cpu(ta_hdr->hdcp.size_bytes);
-			adev->psp.hdcp_context.context.bin_desc.start_addr =
-				(uint8_t *)ta_hdr +
-				le32_to_cpu(
-					ta_hdr->header.ucode_array_offset_bytes);
-
-			adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
-
-			adev->psp.dtm_context.context.bin_desc.fw_version =
-				le32_to_cpu(ta_hdr->dtm.fw_version);
-			adev->psp.dtm_context.context.bin_desc.size_bytes =
-				le32_to_cpu(ta_hdr->dtm.size_bytes);
-			adev->psp.dtm_context.context.bin_desc.start_addr =
-				(uint8_t *)adev->psp.hdcp_context.context
-					.bin_desc.start_addr +
-				le32_to_cpu(ta_hdr->dtm.offset_bytes);
-		}
+		err = amdgpu_ucode_validate(adev->psp.ta_fw);
+		if (err)
+			return err;
+
+		ta_hdr = (const struct ta_firmware_header_v1_0 *)adev->psp.ta_fw->data;
+		adev->psp.hdcp_context.context.bin_desc.fw_version =
+			le32_to_cpu(ta_hdr->hdcp.fw_version);
+		adev->psp.hdcp_context.context.bin_desc.size_bytes =
+			le32_to_cpu(ta_hdr->hdcp.size_bytes);
+		adev->psp.hdcp_context.context.bin_desc.start_addr =
+			(uint8_t *)ta_hdr +
+			le32_to_cpu(
+				ta_hdr->header.ucode_array_offset_bytes);
+		adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
+		adev->psp.dtm_context.context.bin_desc.fw_version =
+			le32_to_cpu(ta_hdr->dtm.fw_version);
+		adev->psp.dtm_context.context.bin_desc.size_bytes =
+			le32_to_cpu(ta_hdr->dtm.size_bytes);
+		adev->psp.dtm_context.context.bin_desc.start_addr =
+			(uint8_t *)adev->psp.hdcp_context.context
+				.bin_desc.start_addr +
+			le32_to_cpu(ta_hdr->dtm.offset_bytes);
 		break;
 	case IP_VERSION(11, 0, 7):
 	case IP_VERSION(11, 0, 11):
 	case IP_VERSION(11, 0, 12):
 	case IP_VERSION(11, 0, 13):
-		err = psp_init_sos_microcode(psp, chip_name);
+		err = psp_init_sos_microcode(psp);
 		if (err)
 			return err;
-		err = psp_init_ta_microcode(psp, chip_name);
+		err = psp_init_ta_microcode(psp);
 		if (err)
 			return err;
 		break;
 	case IP_VERSION(11, 5, 0):
-		err = psp_init_asd_microcode(psp, chip_name);
+		err = psp_init_asd_microcode(psp);
 		if (err)
 			return err;
-		err = psp_init_toc_microcode(psp, chip_name);
+		err = psp_init_toc_microcode(psp);
 		if (err)
 			return err;
 		break;
@@ -237,11 +151,6 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 	}
 
 	return 0;
-
-out2:
-	release_firmware(adev->psp.ta_fw);
-	adev->psp.ta_fw = NULL;
-	return err;
 }
 
 static int psp_v11_0_wait_for_bootloader(struct psp_context *psp)
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
index 8ed2281b6557..4fa0cd6d5df9 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
@@ -37,94 +37,52 @@
 #include "oss/osssys_4_0_offset.h"
 #include "oss/osssys_4_0_sh_mask.h"
 
-MODULE_FIRMWARE("amdgpu/renoir_asd.bin");
-MODULE_FIRMWARE("amdgpu/renoir_ta.bin");
-MODULE_FIRMWARE("amdgpu/green_sardine_asd.bin");
-MODULE_FIRMWARE("amdgpu/green_sardine_ta.bin");
-
 /* address block */
 #define smnMP1_FIRMWARE_FLAGS		0x3010024
 
 static int psp_v12_0_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
-	char fw_name[30];
 	int err = 0;
 	const struct ta_firmware_header_v1_0 *ta_hdr;
 	DRM_DEBUG("\n");
 
-	switch (adev->asic_type) {
-	case CHIP_RENOIR:
-		if (adev->apu_flags & AMD_APU_IS_RENOIR)
-			chip_name = "renoir";
-		else
-			chip_name = "green_sardine";
-		break;
-	default:
-		BUG();
-	}
+	err = psp_init_asd_microcode(psp);
+	if (err)
+		return err;
 
-	err = psp_init_asd_microcode(psp, chip_name);
+	err = amdgpu_ucode_validate(adev->psp.ta_fw);
 	if (err)
 		return err;
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
-	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
-	if (err) {
-		release_firmware(adev->psp.ta_fw);
-		adev->psp.ta_fw = NULL;
-		dev_info(adev->dev,
-			 "psp v12.0: Failed to load firmware \"%s\"\n",
-			 fw_name);
-	} else {
-		err = amdgpu_ucode_validate(adev->psp.ta_fw);
-		if (err)
-			goto out;
-
-		ta_hdr = (const struct ta_firmware_header_v1_0 *)
-				 adev->psp.ta_fw->data;
-		adev->psp.hdcp_context.context.bin_desc.fw_version =
-			le32_to_cpu(ta_hdr->hdcp.fw_version);
-		adev->psp.hdcp_context.context.bin_desc.size_bytes =
-			le32_to_cpu(ta_hdr->hdcp.size_bytes);
-		adev->psp.hdcp_context.context.bin_desc.start_addr =
-			(uint8_t *)ta_hdr +
-			le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
-
-		adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
-
-		adev->psp.dtm_context.context.bin_desc.fw_version =
-			le32_to_cpu(ta_hdr->dtm.fw_version);
-		adev->psp.dtm_context.context.bin_desc.size_bytes =
-			le32_to_cpu(ta_hdr->dtm.size_bytes);
-		adev->psp.dtm_context.context.bin_desc.start_addr =
+	ta_hdr = (const struct ta_firmware_header_v1_0 *)
+			 adev->psp.ta_fw->data;
+	adev->psp.hdcp_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->hdcp.fw_version);
+	adev->psp.hdcp_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->hdcp.size_bytes);
+	adev->psp.hdcp_context.context.bin_desc.start_addr =
+		(uint8_t *)ta_hdr +
+		le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
+	adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
+	adev->psp.dtm_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->dtm.fw_version);
+	adev->psp.dtm_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->dtm.size_bytes);
+	adev->psp.dtm_context.context.bin_desc.start_addr =
+		(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
+		le32_to_cpu(ta_hdr->dtm.offset_bytes);
+	if (adev->apu_flags & AMD_APU_IS_RENOIR) {
+		adev->psp.securedisplay_context.context.bin_desc.fw_version =
+			le32_to_cpu(ta_hdr->securedisplay.fw_version);
+		adev->psp.securedisplay_context.context.bin_desc.size_bytes =
+			le32_to_cpu(ta_hdr->securedisplay.size_bytes);
+		adev->psp.securedisplay_context.context.bin_desc.start_addr =
 			(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
-			le32_to_cpu(ta_hdr->dtm.offset_bytes);
-
-		if (adev->apu_flags & AMD_APU_IS_RENOIR) {
-			adev->psp.securedisplay_context.context.bin_desc.fw_version =
-				le32_to_cpu(ta_hdr->securedisplay.fw_version);
-			adev->psp.securedisplay_context.context.bin_desc.size_bytes =
-				le32_to_cpu(ta_hdr->securedisplay.size_bytes);
-			adev->psp.securedisplay_context.context.bin_desc.start_addr =
-				(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
-				le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
+			le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
 		}
-	}
 
 	return 0;
-
-out:
-	release_firmware(adev->psp.ta_fw);
-	adev->psp.ta_fw = NULL;
-	if (err) {
-		dev_err(adev->dev,
-			"psp v12.0: Failed to load firmware \"%s\"\n",
-			fw_name);
-	}
-
-	return err;
 }
 
 static int psp_v12_0_bootloader_load_sysdrv(struct psp_context *psp)
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
index e6a26a7e5e5e..44026f7f60f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
@@ -31,24 +31,6 @@
 #include "mp/mp_13_0_2_offset.h"
 #include "mp/mp_13_0_2_sh_mask.h"
 
-MODULE_FIRMWARE("amdgpu/aldebaran_sos.bin");
-MODULE_FIRMWARE("amdgpu/aldebaran_ta.bin");
-MODULE_FIRMWARE("amdgpu/aldebaran_cap.bin");
-MODULE_FIRMWARE("amdgpu/yellow_carp_toc.bin");
-MODULE_FIRMWARE("amdgpu/yellow_carp_ta.bin");
-MODULE_FIRMWARE("amdgpu/psp_13_0_5_toc.bin");
-MODULE_FIRMWARE("amdgpu/psp_13_0_5_ta.bin");
-MODULE_FIRMWARE("amdgpu/psp_13_0_8_toc.bin");
-MODULE_FIRMWARE("amdgpu/psp_13_0_8_ta.bin");
-MODULE_FIRMWARE("amdgpu/psp_13_0_0_sos.bin");
-MODULE_FIRMWARE("amdgpu/psp_13_0_0_ta.bin");
-MODULE_FIRMWARE("amdgpu/psp_13_0_7_sos.bin");
-MODULE_FIRMWARE("amdgpu/psp_13_0_7_ta.bin");
-MODULE_FIRMWARE("amdgpu/psp_13_0_10_sos.bin");
-MODULE_FIRMWARE("amdgpu/psp_13_0_10_ta.bin");
-MODULE_FIRMWARE("amdgpu/psp_13_0_11_toc.bin");
-MODULE_FIRMWARE("amdgpu/psp_13_0_11_ta.bin");
-
 /* For large FW files the time to complete can be very long */
 #define USBC_PD_POLLING_LIMIT_S 240
 
@@ -70,32 +52,16 @@ MODULE_FIRMWARE("amdgpu/psp_13_0_11_ta.bin");
 static int psp_v13_0_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
-	char ucode_prefix[30];
 	int err = 0;
 
 	switch (adev->ip_versions[MP0_HWIP][0]) {
 	case IP_VERSION(13, 0, 2):
-		chip_name = "aldebaran";
-		break;
-	case IP_VERSION(13, 0, 1):
-	case IP_VERSION(13, 0, 3):
-		chip_name = "yellow_carp";
-		break;
-	default:
-		amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
-		chip_name = ucode_prefix;
-		break;
-	}
-
-	switch (adev->ip_versions[MP0_HWIP][0]) {
-	case IP_VERSION(13, 0, 2):
-		err = psp_init_sos_microcode(psp, chip_name);
+		err = psp_init_sos_microcode(psp);
 		if (err)
 			return err;
 		/* It's not necessary to load ras ta on Guest side */
 		if (!amdgpu_sriov_vf(adev)) {
-			err = psp_init_ta_microcode(&adev->psp, chip_name);
+			err = psp_init_ta_microcode(&adev->psp);
 			if (err)
 				return err;
 		}
@@ -105,21 +71,21 @@ static int psp_v13_0_init_microcode(struct psp_context *psp)
 	case IP_VERSION(13, 0, 5):
 	case IP_VERSION(13, 0, 8):
 	case IP_VERSION(13, 0, 11):
-		err = psp_init_toc_microcode(psp, chip_name);
+		err = psp_init_toc_microcode(psp);
 		if (err)
 			return err;
-		err = psp_init_ta_microcode(psp, chip_name);
+		err = psp_init_ta_microcode(psp);
 		if (err)
 			return err;
 		break;
 	case IP_VERSION(13, 0, 0):
 	case IP_VERSION(13, 0, 7):
 	case IP_VERSION(13, 0, 10):
-		err = psp_init_sos_microcode(psp, chip_name);
+		err = psp_init_sos_microcode(psp);
 		if (err)
 			return err;
 		/* It's not necessary to load ras ta on Guest side */
-		err = psp_init_ta_microcode(psp, chip_name);
+		err = psp_init_ta_microcode(psp);
 		if (err)
 			return err;
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c b/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
index 9d4e24e518e8..cef3848cd6a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
@@ -29,31 +29,17 @@
 #include "mp/mp_13_0_4_offset.h"
 #include "mp/mp_13_0_4_sh_mask.h"
 
-MODULE_FIRMWARE("amdgpu/psp_13_0_4_toc.bin");
-MODULE_FIRMWARE("amdgpu/psp_13_0_4_ta.bin");
-
 static int psp_v13_0_4_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
-	char ucode_prefix[30];
 	int err = 0;
 
 	switch (adev->ip_versions[MP0_HWIP][0]) {
 	case IP_VERSION(13, 0, 4):
-		amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
-		chip_name = ucode_prefix;
-		break;
-	default:
-		BUG();
-	}
-
-	switch (adev->ip_versions[MP0_HWIP][0]) {
-	case IP_VERSION(13, 0, 4):
-		err = psp_init_toc_microcode(psp, chip_name);
+		err = psp_init_toc_microcode(psp);
 		if (err)
 			return err;
-		err = psp_init_ta_microcode(psp, chip_name);
+		err = psp_init_ta_microcode(psp);
 		if (err)
 			return err;
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
index 157147c6c94e..d20e69e4c17b 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
@@ -56,27 +56,15 @@ static int psp_v3_1_ring_stop(struct psp_context *psp,
 
 static int psp_v3_1_init_microcode(struct psp_context *psp)
 {
-	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
 	int err = 0;
 
 	DRM_DEBUG("\n");
 
-	switch (adev->asic_type) {
-	case CHIP_VEGA10:
-		chip_name = "vega10";
-		break;
-	case CHIP_VEGA12:
-		chip_name = "vega12";
-		break;
-	default: BUG();
-	}
-
-	err = psp_init_sos_microcode(psp, chip_name);
+	err = psp_init_sos_microcode(psp);
 	if (err)
 		return err;
 
-	err = psp_init_asd_microcode(psp, chip_name);
+	err = psp_init_asd_microcode(psp);
 	if (err)
 		return err;
 
-- 
2.34.1

