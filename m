Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B1C73281F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 08:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E9210E5AD;
	Fri, 16 Jun 2023 06:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8DE10E5AD;
 Fri, 16 Jun 2023 06:59:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVHJo6BtSOf+rpHF7tFA3kO8Hlj9WimIG9dP72GQWXFjebt5wHwBIyC5tYkEc7nS3futC/Igwc+yoDJk9V0rNIqCxZITNIpxAJ1pdS48gPruxhVbCbICUb/n50ZlL4en/EAFpXgLqlUBvraRW9FAl+9WX76cWWCIIudsei+Pr6+gSS+KG0+VX/EJFPId18j0vXEexsTgm8C0RHXH6aMCrQI5akLtlbYBi/PJ/E1gGUEJim3y7O+LPAag/83YXXqOmXl4VDnCOi+9L2EOmUV35ucplSooC2aMGum27YvQlolpmVTsnkK0Xv2tsfaWsQJ4b/MMLNVPmZWQxXE/04lbAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kS47+VWF7plcjJrQqiMe6eoziGUpBc8BpsIj7V5A+pk=;
 b=EvyPbDqqMwbR2J+bT53IUeXdjW2l5X+0yZK5obmVr1Pg7IhZMtuWj4Pr7E1MNADYgykX38mZQduRXGeTUNyqGQahIerMbMFcGW9sAs5OLkt1l5GTRoIwfMfJgjGCQ0CYPUrv65efd2qgH1xqCPCa4ydA1fZ+mJftdpbSgUzykwhGQSop7TxSBAhHm+ChO+DFgwRgmEzfNBLLE2LtcwtMZEUuxsDN/Ao6asZo4iIdDJTjsZqndCe6srK+WZlzwOHdOADyeCme3Vib3hfomDYNxaUwDYsPAiXD/4ab1sY8S/5H37lyqx5//+WJMve+mzHxAUf8HDcDeVHmDTp2G+JwBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kS47+VWF7plcjJrQqiMe6eoziGUpBc8BpsIj7V5A+pk=;
 b=pYDFYaJ6TdVANy6iFGLiRzm8JYqz+arM031kX3qmIGkE7kGRl9hdUS2GCldl+4gbYmYhAOvUSrAXG8q6vYwb3+Oo8CeZRGubdS49egNTeT3aoKY6iNa8wpXBqXmeAuckKTIJDv3AOwPODzsy+W/ira1w+eUTG5Murz9cQOiUY/Y=
Received: from BN9PR03CA0928.namprd03.prod.outlook.com (2603:10b6:408:107::33)
 by MN6PR12MB8567.namprd12.prod.outlook.com (2603:10b6:208:478::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 06:59:13 +0000
Received: from BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::56) by BN9PR03CA0928.outlook.office365.com
 (2603:10b6:408:107::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27 via Frontend
 Transport; Fri, 16 Jun 2023 06:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT081.mail.protection.outlook.com (10.13.177.233) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.29 via Frontend Transport; Fri, 16 Jun 2023 06:59:13 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 16 Jun
 2023 01:58:55 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <kvalo@kernel.org>, <nbd@nbd.name>, <lorenzo@kernel.org>,
 <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH V3 3/7] drm/amd/pm: update driver_if and ppsmc headers for
 coming wbrf feature
Date: Fri, 16 Jun 2023 14:57:53 +0800
Message-ID: <20230616065757.1054422-4-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616065757.1054422-1-evan.quan@amd.com>
References: <20230616065757.1054422-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT081:EE_|MN6PR12MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: 949f6eec-dd2e-4b48-d4ab-08db6e37314d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dCBgxXyH1a/wD/K6qmMTLUnqKElp0ykSm8ulSH6Bx4kHbcYXpqNyBQ8NPPFJl+VUWGywd/EJTFdqsExxUM8lGsPzftrtJTUsbiuGFeDGZV2vZA7VYYa5/X4rhiaIdOf9gDcN9SO1/94vlmKPABZkPfJ+CWrWB4WLgc0FXdiepXzCuLvPf78k3Gc3ssUXcq9MTo0HRMAhJjqAHRhpvSSWzfxL8royUe5MtHZpqRXBF+088dHaOxA80lhlA6R5I8e6nfmyj8nzW9i1LoHYkUf/u8xK+jTPSGRYKEe4YAD2qR0emgOF+9cgkUbOlxGlWocvDB+v+kPbBX6S/w3O558tNWHJp9iphVWNv+l3W9SlZE4SeYFXA4JWbYTqZQJsa9YVSbSo7CFaEPgYVkI0yKgYBzknk3TcMIhbPlwpsb9dXal+fee5KISD7EoQg09EEEdADkOLRIcE8IUHG60SbAkzo0Q+dqg6fiOat6OiDvXaP3kEJoy6ZZBF0ADMX3CF5YAiVRo8zWsohga5xlP41tFp0k0YUhhwLIO4RA2v1xW+GKxXtL8gseJMaVHd3tH2vNlCrXeKK9+qi8HPK+VnrEsiV263kdEBP3nRFx/hWpc96MrIkxalp51DNFsz85AoH9HJ87AsM0zXz5AxdiuAgqfhr3rjWV1Z3FUNgzeljDO2b4wRak7/YrIuS92pyH/2Oz5oRId8RqiBggWshkdmQNFUh3vrkncXaRV9r3ayNURp/1XDYEM/C3XFMzg5U9bRrnkE/dNR4zOzi5156CCsWybZRD7huN7GcTkNoGWHvAPRSvU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(478600001)(40480700001)(44832011)(86362001)(7696005)(40460700003)(316002)(82310400005)(41300700001)(47076005)(83380400001)(36860700001)(70206006)(70586007)(4326008)(6636002)(81166007)(82740400003)(5660300002)(8676002)(15650500001)(8936002)(356005)(921005)(2906002)(16526019)(186003)(110136005)(54906003)(1076003)(26005)(2616005)(36756003)(7416002)(426003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 06:59:13.2185 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 949f6eec-dd2e-4b48-d4ab-08db6e37314d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8567
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add those data structures to support Wifi RFI mitigation feature.

Signed-off-by: Evan Quan <evan.quan@amd.com>
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

