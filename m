Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DE66581D8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 17:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A315D10E3C3;
	Wed, 28 Dec 2022 16:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0C910E3CE;
 Wed, 28 Dec 2022 16:31:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePAxLWS4FAV2AkbSVY8vtomx3ia6Ju5Etqn6UJrb3QAB5lOwyPCzyjNONhAmvNe2pakS2K/rEl3VWJ2dKnQA/HSZBglvW/3A9WgFKiY6+w2KO5bWTtC1behrtBNtHioUQpdnCShHHBGeLikbfveWo/JUY7iRsogvcVnIXLiKhYbFbsBmgrdLMJio6F0EeN4NkbYohDc8WgVIbWtgMo8ha6CT9rtdPs/FOXn4WJkjGBVeeN1mRBEWyQgJdY8WwAuNHAAhY/5AUYMORp7d9+U5enbZvI8HwB2NIIt87Zoxha8PbZuheScdLAzCIUOe5LOr7kP/dbT159BjPBMtoyCTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxUcyHn5B4I03aplh1VL3nE9O/uV93+hQyTDV/TjVSo=;
 b=nTR5oYbCqzF0QIM6DaD5nvNxQzQIzTP2gIbXd8RFlvCUVTX5OvIl2ZPldd2Bh5CdHpvbYnqcFaj98Owuitz/ercwFL/VZ8DX/TbmvdEqoj69FlmLn87G/qofDVphIucQtZ1JhQkI8NjBGwtqtbbYllv5xGLwYtVEsUujkjlFiX6QmVJ3kRzVgbGNmZumMqh37jhyslf9GyihTgzQGqqRP5gbu8O5ENHN/OWzGvGjD1uVo3A/gmyg7VHKnCQnb/9aQeEsYU2/91StlJ3P5yPGdfR/dGkcQE0G8ZCf7UQt4Ygeyf9cydOVntWCnOW+CjrQHaYEzwukdwV1oBI150VRDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxUcyHn5B4I03aplh1VL3nE9O/uV93+hQyTDV/TjVSo=;
 b=taFvX/e+oggNlxNB7UrRl0h9KkP1gEhvGjg57OYRASB9HZpnzj73M3q+GEeDittxS/ANK5IPb4jqMmZSvNhE6vffsiaGhaX38ublsUxhHq84t1emT0KnB6YJN8YMm6p6p9wOl9+ki0ABUErvqG4xswE6ntxARxVuQ7GW8xeA3ck=
Received: from MW2PR2101CA0019.namprd21.prod.outlook.com (2603:10b6:302:1::32)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 16:31:28 +0000
Received: from CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::76) by MW2PR2101CA0019.outlook.office365.com
 (2603:10b6:302:1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.7 via Frontend
 Transport; Wed, 28 Dec 2022 16:31:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT076.mail.protection.outlook.com (10.13.174.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.16 via Frontend Transport; Wed, 28 Dec 2022 16:31:28 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 28 Dec
 2022 10:31:27 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Javier Martinez Canillas <javierm@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 11/11] drm/amd: Request PSP microcode during IP discovery
Date: Wed, 28 Dec 2022 10:30:58 -0600
Message-ID: <20221228163102.468-12-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT076:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: d91ce792-67ac-4235-0112-08dae8f0f8a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3S2lFyt+KNzzrM8p342GU1r0Z5YWLtH8GEq2iuwJ2fwHubWxdbsgW82V6pboT9+g55rctvVzYgcEtddFoEzoRDxcB4/oRUtqcsFQvyF8bxMy8Sue3yunX+IZ4U1Wyq4YLE02hg7XqwGlD+uju2oWKflqRvNmKU31NCMYnG5dwPUH23ytcsG/oY8R3npDXnSt2rxiwd+ZGsIE4XG12jDypcpvROU5B6+Y/GCjXMLRiTuxdu/x4XBfExxXL0smkEDs5leSrNNfTvNoxH2RgNH9gwJC151QSHMgx2ozlvosQ6JxHjg0dso87cAooMBCLWWiigl2yTmyc5bEoc0poM3z+kDaFsYgLcuM/P/V3mq8efzXGqoviFFQ1m6IstM2vhhDw/jdz+ylEPUjroXTu7hLQ1pmeZhP6TnDFcugavjQ7+Xk259qMdJN3tlVq55shfjfkV9RcB3DJgleZN7PyHrbs5QZt33rfHKunTqaDxS/nejKb5hq61Cz9PIJcZsCkRWhaMv5JUCfPu6hR6Y66ZgMvOUvmPRWN5BdILL3hXuUcVMuQADqTSpSr1kj9FNmmwDPTBbLap6aqX3F7aRnU0ABHsHmTKVKV7rzjQNGKxAuDhG5Vh9z+I+EMFcEtQ52AcKrHkTlx27mYjSMe0W4PNX6MeGjBShhXFeFsLkXsv1gO3XJjhtgSwzAWZGockvqDiQVW9bKMSscgQCBg/OGZ6owicNJ9+6zO0krH5dk3OBCfdg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(4326008)(8676002)(86362001)(70206006)(2906002)(41300700001)(70586007)(8936002)(44832011)(5660300002)(30864003)(40480700001)(83380400001)(478600001)(1076003)(2616005)(26005)(16526019)(6666004)(47076005)(426003)(186003)(40460700003)(7696005)(82740400003)(81166007)(336012)(356005)(110136005)(316002)(54906003)(36860700001)(82310400005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2022 16:31:28.5789 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d91ce792-67ac-4235-0112-08dae8f0f8a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428
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

If PSP microcode is required but not available during early init, the
firmware framebuffer will have already been released and the screen will
freeze.

Move the request for PSP microcode into the IP discovery phase
so that if it's not available, IP discovery will fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 120 ++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |   2 -
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c        | 106 +++--------
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        | 165 ++++--------------
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c        | 102 +++--------
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c        |  82 ---------
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c      |  36 ----
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c         |  36 ----
 8 files changed, 202 insertions(+), 447 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index c8c538a768fe..6199ab078bc7 100644
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
@@ -1858,12 +1892,30 @@ static int amdgpu_discovery_set_ih_ip_blocks(struct amdgpu_device *adev)
 
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
+		r = psp_init_sos_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
+		r = psp_init_asd_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &psp_v3_1_ip_block);
 		break;
 	case IP_VERSION(10, 0, 0):
 	case IP_VERSION(10, 0, 1):
+		r = psp_init_asd_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
+		r = psp_init_ta_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &psp_v10_0_ip_block);
 		break;
 	case IP_VERSION(11, 0, 0):
@@ -1871,11 +1923,34 @@ static int amdgpu_discovery_set_psp_ip_blocks(struct amdgpu_device *adev)
 	case IP_VERSION(11, 0, 4):
 	case IP_VERSION(11, 0, 5):
 	case IP_VERSION(11, 0, 9):
+		r = psp_init_sos_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
+		r = psp_init_asd_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
+		r = psp_init_ta_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
+		break;
 	case IP_VERSION(11, 0, 7):
 	case IP_VERSION(11, 0, 11):
 	case IP_VERSION(11, 0, 12):
 	case IP_VERSION(11, 0, 13):
+		r = psp_init_sos_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
+		r = psp_init_ta_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
+		break;
 	case IP_VERSION(11, 5, 0):
+		r = psp_init_asd_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
+		r = psp_init_toc_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &psp_v11_0_ip_block);
 		break;
 	case IP_VERSION(11, 0, 8):
@@ -1883,20 +1958,57 @@ static int amdgpu_discovery_set_psp_ip_blocks(struct amdgpu_device *adev)
 		break;
 	case IP_VERSION(11, 0, 3):
 	case IP_VERSION(12, 0, 1):
+		r = psp_init_asd_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
+		r = psp_init_ta_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &psp_v12_0_ip_block);
 		break;
-	case IP_VERSION(13, 0, 0):
-	case IP_VERSION(13, 0, 1):
 	case IP_VERSION(13, 0, 2):
+		r = psp_init_sos_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
+		/* It's not necessary to load ras ta on Guest side */
+		if (!amdgpu_sriov_vf(adev)) {
+			r = psp_init_ta_microcode(&adev->psp, ucode_prefix);
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
+		r = psp_init_toc_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
+		r = psp_init_ta_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
+		amdgpu_device_ip_block_add(adev, &psp_v13_0_ip_block);
+		break;
+	case IP_VERSION(13, 0, 0):
+	case IP_VERSION(13, 0, 7):
+	case IP_VERSION(13, 0, 10):
+		r = psp_init_sos_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
+		r = psp_init_ta_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &psp_v13_0_ip_block);
 		break;
 	case IP_VERSION(13, 0, 4):
+		r = psp_init_toc_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
+		r = psp_init_ta_microcode(&adev->psp, ucode_prefix);
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &psp_v13_0_4_ip_block);
 		break;
 	default:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 7a2fc920739b..f7103b3354c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -188,8 +188,6 @@ static int psp_early_init(void *handle)
 		return -EINVAL;
 	}
 
-	psp->adev = adev;
-
 	psp_check_pmfw_centralized_cstate_management(psp);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
index 9de46fa8f46c..710445d39df1 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
@@ -37,93 +37,37 @@
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
-	int err = 0;
 	const struct ta_firmware_header_v1_0 *ta_hdr;
-	DRM_DEBUG("\n");
-
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
-	if (err)
-		goto out;
-
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
 
-	return 0;
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
 
-out2:
-	release_firmware(adev->psp.ta_fw);
-	adev->psp.ta_fw = NULL;
-out:
-	if (err) {
-		dev_err(adev->dev,
-			"psp v10.0: Failed to load firmware \"%s\"\n",
-			fw_name);
-	}
-
-	return err;
+	return 0;
 }
 
 static int psp_v10_0_ring_create(struct psp_context *psp,
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index bd3e3e23a939..880fd90311e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -88,160 +88,63 @@ MODULE_FIRMWARE("amdgpu/beige_goby_ta.bin");
 static int psp_v11_0_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
-	char fw_name[PSP_FW_NAME_LEN];
-	int err = 0;
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
-		if (err)
-			return err;
-		err = psp_init_asd_microcode(psp, chip_name);
-		if (err)
-			return err;
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
-		if (err)
-			return err;
-		err = psp_init_asd_microcode(psp, chip_name);
-		if (err)
-			return err;
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
-		if (err)
-			return err;
-		err = psp_init_ta_microcode(psp, chip_name);
-		if (err)
-			return err;
-		break;
 	case IP_VERSION(11, 5, 0):
-		err = psp_init_asd_microcode(psp, chip_name);
-		if (err)
-			return err;
-		err = psp_init_toc_microcode(psp, chip_name);
-		if (err)
-			return err;
 		break;
 	default:
 		BUG();
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
index 8ed2281b6557..0b5d63735f39 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
@@ -37,94 +37,46 @@
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
-	int err = 0;
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
-
-	err = psp_init_asd_microcode(psp, chip_name);
-	if (err)
-		return err;
-
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
+				adev->psp.ta_fw->data;
+	adev->psp.hdcp_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->hdcp.fw_version);
+	adev->psp.hdcp_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->hdcp.size_bytes);
+	adev->psp.hdcp_context.context.bin_desc.start_addr =
+		(uint8_t *)ta_hdr +
+		le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
+
+	adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
+
+	adev->psp.dtm_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->dtm.fw_version);
+	adev->psp.dtm_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->dtm.size_bytes);
+	adev->psp.dtm_context.context.bin_desc.start_addr =
+		(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
+		le32_to_cpu(ta_hdr->dtm.offset_bytes);
+
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
-		}
+			le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
 	}
 
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
index e6a26a7e5e5e..2228994ef096 100644
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
 
@@ -67,69 +49,6 @@ MODULE_FIRMWARE("amdgpu/psp_13_0_11_ta.bin");
 /* memory training timeout define */
 #define MEM_TRAIN_SEND_MSG_TIMEOUT_US	3000000
 
-static int psp_v13_0_init_microcode(struct psp_context *psp)
-{
-	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
-	char ucode_prefix[30];
-	int err = 0;
-
-	switch (adev->ip_versions[MP0_HWIP][0]) {
-	case IP_VERSION(13, 0, 2):
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
-		if (err)
-			return err;
-		/* It's not necessary to load ras ta on Guest side */
-		if (!amdgpu_sriov_vf(adev)) {
-			err = psp_init_ta_microcode(&adev->psp, chip_name);
-			if (err)
-				return err;
-		}
-		break;
-	case IP_VERSION(13, 0, 1):
-	case IP_VERSION(13, 0, 3):
-	case IP_VERSION(13, 0, 5):
-	case IP_VERSION(13, 0, 8):
-	case IP_VERSION(13, 0, 11):
-		err = psp_init_toc_microcode(psp, chip_name);
-		if (err)
-			return err;
-		err = psp_init_ta_microcode(psp, chip_name);
-		if (err)
-			return err;
-		break;
-	case IP_VERSION(13, 0, 0):
-	case IP_VERSION(13, 0, 7):
-	case IP_VERSION(13, 0, 10):
-		err = psp_init_sos_microcode(psp, chip_name);
-		if (err)
-			return err;
-		/* It's not necessary to load ras ta on Guest side */
-		err = psp_init_ta_microcode(psp, chip_name);
-		if (err)
-			return err;
-		break;
-	default:
-		BUG();
-	}
-
-	return 0;
-}
-
 static bool psp_v13_0_is_sos_alive(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
@@ -697,7 +616,6 @@ static int psp_v13_0_vbflash_status(struct psp_context *psp)
 }
 
 static const struct psp_funcs psp_v13_0_funcs = {
-	.init_microcode = psp_v13_0_init_microcode,
 	.bootloader_load_kdb = psp_v13_0_bootloader_load_kdb,
 	.bootloader_load_spl = psp_v13_0_bootloader_load_spl,
 	.bootloader_load_sysdrv = psp_v13_0_bootloader_load_sysdrv,
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c b/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
index 9d4e24e518e8..9e34c7ee9304 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
@@ -29,41 +29,6 @@
 #include "mp/mp_13_0_4_offset.h"
 #include "mp/mp_13_0_4_sh_mask.h"
 
-MODULE_FIRMWARE("amdgpu/psp_13_0_4_toc.bin");
-MODULE_FIRMWARE("amdgpu/psp_13_0_4_ta.bin");
-
-static int psp_v13_0_4_init_microcode(struct psp_context *psp)
-{
-	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
-	char ucode_prefix[30];
-	int err = 0;
-
-	switch (adev->ip_versions[MP0_HWIP][0]) {
-	case IP_VERSION(13, 0, 4):
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
-		if (err)
-			return err;
-		err = psp_init_ta_microcode(psp, chip_name);
-		if (err)
-			return err;
-		break;
-	default:
-		BUG();
-	}
-
-	return 0;
-}
-
 static bool psp_v13_0_4_is_sos_alive(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
@@ -339,7 +304,6 @@ static void psp_v13_0_4_ring_set_wptr(struct psp_context *psp, uint32_t value)
 }
 
 static const struct psp_funcs psp_v13_0_4_funcs = {
-	.init_microcode = psp_v13_0_4_init_microcode,
 	.bootloader_load_kdb = psp_v13_0_4_bootloader_load_kdb,
 	.bootloader_load_spl = psp_v13_0_4_bootloader_load_spl,
 	.bootloader_load_sysdrv = psp_v13_0_4_bootloader_load_sysdrv,
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
index 157147c6c94e..a04ca4cdf211 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
@@ -42,46 +42,11 @@
 #include "oss/osssys_4_0_offset.h"
 #include "oss/osssys_4_0_sh_mask.h"
 
-MODULE_FIRMWARE("amdgpu/vega10_sos.bin");
-MODULE_FIRMWARE("amdgpu/vega10_asd.bin");
-MODULE_FIRMWARE("amdgpu/vega10_cap.bin");
-MODULE_FIRMWARE("amdgpu/vega12_sos.bin");
-MODULE_FIRMWARE("amdgpu/vega12_asd.bin");
-
-
 #define smnMP1_FIRMWARE_FLAGS 0x3010028
 
 static int psp_v3_1_ring_stop(struct psp_context *psp,
 			      enum psp_ring_type ring_type);
 
-static int psp_v3_1_init_microcode(struct psp_context *psp)
-{
-	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
-	int err = 0;
-
-	DRM_DEBUG("\n");
-
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
-	if (err)
-		return err;
-
-	err = psp_init_asd_microcode(psp, chip_name);
-	if (err)
-		return err;
-
-	return 0;
-}
 
 static int psp_v3_1_bootloader_load_sysdrv(struct psp_context *psp)
 {
@@ -372,7 +337,6 @@ static void psp_v3_1_ring_set_wptr(struct psp_context *psp, uint32_t value)
 }
 
 static const struct psp_funcs psp_v3_1_funcs = {
-	.init_microcode = psp_v3_1_init_microcode,
 	.bootloader_load_sysdrv = psp_v3_1_bootloader_load_sysdrv,
 	.bootloader_load_sos = psp_v3_1_bootloader_load_sos,
 	.ring_create = psp_v3_1_ring_create,
-- 
2.34.1

