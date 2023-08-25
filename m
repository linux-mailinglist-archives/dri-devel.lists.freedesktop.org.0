Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F0A788259
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 10:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8231610E63A;
	Fri, 25 Aug 2023 08:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F55310E637;
 Fri, 25 Aug 2023 08:40:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ez3RQZdOgQo13b1nJQXaa+n2z2Q4jj9zllyWrah2HdFR/SEaDpH6gMBiXQ1sdGCC0YxOooho7NJuWcbDh2pEr6hdJ2Y3I+UyPOoG0KCjjqvLDWHoGOdNDWiBomum1RW0wjhiOh5RTUZQ7Co+/aVkZciKL6vbmnNbvSBk5wXpx2fV1KXpK6mT2bL1dQLvjmpV7PbMHqvVqFZCzNHjTVS39K9VrMAphEmYpmSWhB9mYvKUvV9zA7Im2rp+dz/MwXPq738fFwNbXRvQ8Al/kuzxsrGp220BuxPalP/EBgt97B1ccLhvtd0G8FN9Iiu3v+A6rhQ0fJQwVaF65OLyZLuitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KVZcsU5wLNmNsZV2fXC998Zi1YeRhJaLYvlo00xQX4=;
 b=S/3G79vt6YCfmMdJDt+n+NQnbOvDF+bagEeccDDCG390KZDPCUrXoD75BH6kfSlNCabeA+3PVMMCbM1PNNsNTjo/w2xEJUK+/57g7ygSFZjSfiyoeFBN8C0GVo0+qiekTqN3xeQdRdCnOn2vLZGF836QxwGh8MyAWLfP26QOfLTB7Wnq6yTpuQUyFxOR38MCLV5rCv7DfLov3wCTBux401wKm72jBbsEhqbnqXipgCAM2UltvWKSMcwZpk5z83pt57GDZ4i61WOmJS1j6iSM8uglXjnQUb3tmGvWJ5yAEE4dnpfd4VfWG+/2d0JSyjkx/gbJPMFyKfGOm9hk0F0wZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KVZcsU5wLNmNsZV2fXC998Zi1YeRhJaLYvlo00xQX4=;
 b=lqNUzECiP8qG2YGhcion6lN+u2LqQfe8fozbAIx/x2hShGFujfF9cxPiRs3+5lChJirJROhSiGVIY98Vm5NNbWGfq4Qm7z39HEtxVhgCiUhnO2B55HqmVewwRNUuKcB33I3q6sRzsvxmawnt85r3UX1yGLpoZ/IP707d2T5O3io=
Received: from BYAPR07CA0055.namprd07.prod.outlook.com (2603:10b6:a03:60::32)
 by MW4PR12MB6803.namprd12.prod.outlook.com (2603:10b6:303:20e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 08:40:39 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a03:60:cafe::f1) by BYAPR07CA0055.outlook.office365.com
 (2603:10b6:a03:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Fri, 25 Aug 2023 08:40:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 25 Aug 2023 08:40:38 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:40:33 -0500
From: Evan Quan <evan.quan@amd.com>
To: <lenb@kernel.org>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <alexander.deucher@amd.com>, <rafael@kernel.org>, <Lijo.Lazar@amd.com>,
 <mario.limonciello@amd.com>
Subject: [V10 4/8] drm/amd/pm: update driver_if and ppsmc headers for coming
 wbrf feature
Date: Fri, 25 Aug 2023 16:38:42 +0800
Message-ID: <20230825083846.4001973-5-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825083846.4001973-1-evan.quan@amd.com>
References: <20230825083846.4001973-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|MW4PR12MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: 19244d0b-3550-43ed-3c08-08dba546f58f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x8K2+OybpS17o892W/xvnAn0g4r7PlgmFAreKSyXuMiwweX+4DuVyODUlFMejkA4s0+EEHZfDktnCC4DpkJtR+t7WKEaNiYnX+ns8Ye1tlKT/PfBFv4ya7kRJmhfmX5fx7Ea55/WU//eSL88EZWeXzGvpxwJDe0C3WESgYysP7Eei1/NzfqOcVPBSXKiJsENOn8flFrc5Oj6QZXutYkHw5r9dkoXs2nIUQM2lb0JstdgaByudaKHkbO7anIBHyEZ3hoNqYG/GHe4Pln7ZMrdcJjEspuVkuRo20vd+5gRUAhG4S+m/M/+b01kvWKbXZzak0JOcPe0UpcfFVs3kBF5OHvPsyrdYDga8ljWewNEinQvgOVUZNkYmnO/5sayL4AYFaaoQ528j9HkXsWFf9cpd9Hkh8uhBFjsG0fNUTniVYg28VnMynS2vrb0RwqlEW/G3EbBNXkrz+dH/aFxoeMHD6gfkN3PwXO3G1jiux1vC1j5Cx+i8jMhlnIz/5WleImusPxGQsdiBu98LoQFcpFOeRTHVu5TPFB0HyGV7ky9PXzBYAQeKmHDchgLGz9ITlNySkLwTC0Rus8R/oEbfPI/KUTIT7f/Cwmq+/6DemBA2VDXsAIpQxuUohBYH9t7lRI/pS9/CWJCwiRwGWgTdHYKiJmt0WMlVn3zqcUcJA+tUIQO816xrSXKcmfySmKvs8zNKNNvNOpEjxTBFqoa8ypR/M1HAxGq0IMSIQfF5Ms3chx1iiQHf6iGhXsuPIYfHJfn4rarU63TECwoakZNo3AfWXbFPPmiVot/HvcIhZ7ZmYk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(1800799009)(82310400011)(451199024)(186009)(36840700001)(46966006)(40470700004)(336012)(36860700001)(1076003)(44832011)(15650500001)(7416002)(83380400001)(26005)(16526019)(478600001)(47076005)(40480700001)(2616005)(5660300002)(426003)(2906002)(8676002)(8936002)(4326008)(921005)(356005)(82740400003)(81166007)(40460700003)(6636002)(110136005)(70206006)(70586007)(86362001)(41300700001)(54906003)(36756003)(7696005)(6666004)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:40:38.7593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19244d0b-3550-43ed-3c08-08dba546f58f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6803
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add those data structures to support Wifi RFI mitigation feature.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h | 14 +++++++++++++-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h | 14 +++++++++++++-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h   |  3 ++-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h   |  3 ++-
 4 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
index 9dd1ed5b8940..e481407b6584 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
@@ -391,6 +391,17 @@ typedef struct {
   EccInfo_t  EccInfo[24];
 } EccInfoTable_t;
 
+typedef struct {
+  uint16_t     LowFreq;
+  uint16_t     HighFreq;
+} WifiOneBand_t;
+
+typedef struct {
+  uint32_t         WifiBandEntryNum;
+  WifiOneBand_t    WifiBandEntry[11];
+  uint32_t         MmHubPadding[8];
+} WifiBandEntryTable_t;
+
 //D3HOT sequences
 typedef enum {
   BACO_SEQUENCE,
@@ -1615,7 +1626,8 @@ typedef struct {
 #define TABLE_I2C_COMMANDS            9
 #define TABLE_DRIVER_INFO             10
 #define TABLE_ECCINFO                 11
-#define TABLE_COUNT                   12
+#define TABLE_WIFIBAND                12
+#define TABLE_COUNT                   13
 
 //IH Interupt ID
 #define IH_INTERRUPT_ID_TO_DRIVER                   0xFE
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
index 62b7c0daff68..1530ca002c6c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
@@ -392,6 +392,17 @@ typedef struct {
   EccInfo_t  EccInfo[24];
 } EccInfoTable_t;
 
+typedef struct {
+  uint16_t     LowFreq;
+  uint16_t     HighFreq;
+} WifiOneBand_t;
+
+typedef struct {
+  uint32_t         WifiBandEntryNum;
+  WifiOneBand_t    WifiBandEntry[11];
+  uint32_t         MmHubPadding[8];
+} WifiBandEntryTable_t;
+
 //D3HOT sequences
 typedef enum {
   BACO_SEQUENCE,
@@ -1605,7 +1616,8 @@ typedef struct {
 #define TABLE_I2C_COMMANDS            9
 #define TABLE_DRIVER_INFO             10
 #define TABLE_ECCINFO                 11
-#define TABLE_COUNT                   12
+#define TABLE_WIFIBAND                12
+#define TABLE_COUNT                   13
 
 //IH Interupt ID
 #define IH_INTERRUPT_ID_TO_DRIVER                   0xFE
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h
index 10cff75b44d5..c98cc32d11bd 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h
@@ -138,7 +138,8 @@
 #define PPSMC_MSG_SetBadMemoryPagesRetiredFlagsPerChannel 0x4A
 #define PPSMC_MSG_SetPriorityDeltaGain           0x4B
 #define PPSMC_MSG_AllowIHHostInterrupt           0x4C
-#define PPSMC_Message_Count                      0x4D
+#define PPSMC_MSG_EnableUCLKShadow               0x51
+#define PPSMC_Message_Count                      0x52
 
 //Debug Dump Message
 #define DEBUGSMC_MSG_TestMessage                    0x1
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h
index 6aaefca9b595..a6bf9cdd130e 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h
@@ -134,6 +134,7 @@
 #define PPSMC_MSG_SetBadMemoryPagesRetiredFlagsPerChannel 0x4A
 #define PPSMC_MSG_SetPriorityDeltaGain           0x4B
 #define PPSMC_MSG_AllowIHHostInterrupt           0x4C
-#define PPSMC_Message_Count                      0x4D
+#define PPSMC_MSG_EnableUCLKShadow               0x51
+#define PPSMC_Message_Count                      0x52
 
 #endif
-- 
2.34.1

