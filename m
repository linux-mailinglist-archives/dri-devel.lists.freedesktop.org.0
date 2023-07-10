Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7467174D031
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FFE10E227;
	Mon, 10 Jul 2023 08:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2327C10E227;
 Mon, 10 Jul 2023 08:39:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmB8nzdcmHCgHCybZo1dUPRDRE3w72Vldtd9XQl+R1UXHNowGyBaPbHPYWSVb4crOtikDPrM6bwd5B15mBcGpzvVbSHfeZ7pOT8l9g5KX+gQWIK4SgTYFbVMn3BAeUM0NJr1t4F9pYnRR2zd0BQFELoiwLQTQTx5/D1vpJYxGNiebs6vF+nuQO9AocJZ6RrYKb6S5uVKXdW/II6EUY7yzCOicYOSeTLDMZMG2Z+oaqvbM1Qzo7SjRiWW3A0WU6SFYPnaDQiI3IxFvMubTDvK0YC7ZKduJxRjGSF75CVnv5at/rAM9vPdTYspA5htYlZBQNhnH+yIvhB9YEdMouraRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiyRm8230ePWHdpc1Lroiu7N3Eh7mvvWEAN2GjgUtx0=;
 b=ieZVEhUpj0gnCs+VEMsLOnpP6Ib7Z6VmNYAjyXAN5Cpr+QAk1MOGm0jv4j/6WCWF5pXN8a6dFu4uNx5GDn7hbVDkEFNIujkbCFxwxcPub8NfiDRuyO6xWF1QID8IBu3sv/eFiTR0V7/26XSZ2aTwR5rAO2u7hEOV1a8wlD2RYagx4Mk1SX6HgwVii78r9J1HzZte6WC8qcvdIEL8aZAC5rjyk+INkNX06B9VpW+FH3RmfwNUXpDk13zIT1gjF2FVMnFML4w+pdWgB5WeeL0Xz6m0MPkbD1vA27TW7GkzCjy+CtK9j5j/q3Kc7i802gW+3HXFR6KPdyfL7mjyvMAIqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiyRm8230ePWHdpc1Lroiu7N3Eh7mvvWEAN2GjgUtx0=;
 b=THdDYaeDSkPyQkuBvKjrQAI2zGn+6c/vHjDrIzRKvPDOBCwegc1G7JClpDp/5JH4tugy9elWA24jIN92p3YDZ2kD9jR4BG+thEaCyMMD25ruikGH13s3Don6Q2xSZJvhOY4YzIJh2VvexGldUvb/H2NGkyapjNrfXKr5f/O9Fic=
Received: from MW4PR03CA0023.namprd03.prod.outlook.com (2603:10b6:303:8f::28)
 by DM4PR12MB6279.namprd12.prod.outlook.com (2603:10b6:8:a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 08:39:32 +0000
Received: from CO1NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::56) by MW4PR03CA0023.outlook.office365.com
 (2603:10b6:303:8f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31 via Frontend
 Transport; Mon, 10 Jul 2023 08:39:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT080.mail.protection.outlook.com (10.13.174.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.18 via Frontend Transport; Mon, 10 Jul 2023 08:39:32 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 10 Jul
 2023 03:39:00 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <Mario.Limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <Lijo.Lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>, <andrew@lunn.ch>
Subject: [PATCH V6 5/9] drm/amd/pm: update driver_if and ppsmc headers for
 coming wbrf feature
Date: Mon, 10 Jul 2023 16:36:37 +0800
Message-ID: <20230710083641.2132264-6-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710083641.2132264-1-evan.quan@amd.com>
References: <20230710083641.2132264-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT080:EE_|DM4PR12MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f126d7a-3179-4c7f-a059-08db81212eee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gP0FgY97xnGoRINwPi8NP57NZqdXKLBdMHNLRgq8mA9JrtLXUdfdHnS/8zN3siUiRFTVRykkMFvSrQBI0RxjaICJe8GOYUgcBiAVdyAPAHeAOWYwHWJmLooKFUX7S0ZYoHYXBjnBojYW7WE3T9OdylhZOqrJLFuxMRDYSbD+J2yM83AmnUQ5CkPNNs+u5cZsDRQFaC478scOFIPaPST4TP1MUrQ5AgPOQw2qt0DgNLWNW/2KQKmIFww7FvzNDhGkadG6DSYeAH+ZS69fRUWcoaEWyf1xXIWyKpQPMlFdYuVwccl+q1ZJgCaxwNiRPzVsXKYLrJReHJFjQCDJkS/wp576GwuJautwo6rwXVcRhjxxApVVXY4YQRrK8hfEjYRlp/Jo0XuMdhe88HIuDXimNyJPZPFEE5Xzjq8u42P3S1c9KDnMcttKCM+hW1XsJsDKhH47F3D5UlOjeiuV3Ccta1qIIHo4oJU58LVye4dg3hT7LNNhRZ9p/voweDyVuR8D/3VbEkBONA/1FDk3fdFdwLSgnCKcLAwTE3XfujilwOLrN39HxC+rcZi/1+yJbxrOoVtmyh5AZJnqsvg/Y4KbJY9NQLxD3QMEB02O/qncMbI7eae/9+NmH8eN/zPq6zsg+YKXH3o3MebWnZ1Pm8ko/IFo8WCUQveagIs/rBq9c7bqkIutlDn6Ju5p0oNy7BNi115HRow2OFRX6+WWt7QdIu/XEOvEYpoczALTXUBvJzyndpuAklvSlqm7EWFEmY8whhZ9sjWlEHhWYpect/2A9BVE1KsWrUu+EdH+CZFvFxVDWzbjY1CiAExgfOT26IZo098cSgJsfZxoasD+b+DOlg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(86362001)(82310400005)(82740400003)(40460700003)(40480700001)(36756003)(6666004)(7696005)(110136005)(54906003)(70206006)(70586007)(81166007)(356005)(921005)(36860700001)(16526019)(26005)(186003)(1076003)(2616005)(44832011)(7416002)(5660300002)(316002)(2906002)(478600001)(15650500001)(8676002)(8936002)(47076005)(336012)(426003)(83380400001)(4326008)(41300700001)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:39:32.2632 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f126d7a-3179-4c7f-a059-08db81212eee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6279
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
 Evan Quan <evan.quan@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
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
index b686fb68a6e7..d64188fb5839 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
@@ -388,6 +388,17 @@ typedef struct {
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
@@ -1592,7 +1603,8 @@ typedef struct {
 #define TABLE_I2C_COMMANDS            9
 #define TABLE_DRIVER_INFO             10
 #define TABLE_ECCINFO                 11
-#define TABLE_COUNT                   12
+#define TABLE_WIFIBAND                12
+#define TABLE_COUNT                   13
 
 //IH Interupt ID
 #define IH_INTERRUPT_ID_TO_DRIVER                   0xFE
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
index 4c46a0392451..77483e8485e7 100644
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
@@ -1624,7 +1635,8 @@ typedef struct {
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

