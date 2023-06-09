Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 222F8729103
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 09:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4890210E647;
	Fri,  9 Jun 2023 07:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A987B10E640;
 Fri,  9 Jun 2023 07:29:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLN7xKcE+hmgG5UwW7HXoONAvSQZ43bWKZ6Oe7lF9kR9U+j4/f0xwltVs4oECxrAhOlBTQVbrWBbi0ArszoGC64Mdbo5SRfGoLeR+KNPR428tu8mRXq/23kdLdTUTysvZVGUXbsTdK906+w/+inI4OctfhL2nVZjFL49FYRoYfbRF4iL2oZ3QDsVCbd8j0+nDWhkSvX+k4cmhVypy5AnCL6C48lZuRKhWmpuSceOecNoUbQfOkkUiXM0vckcflt+l2bMXfJX3WF9xBjJ+2+sLtqSPh9OOcbfC7ZWpMlbvhKAb8Xkj5majqyheDNIHRtVFHm3WRZfSfEXxSxqwsaKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kS47+VWF7plcjJrQqiMe6eoziGUpBc8BpsIj7V5A+pk=;
 b=AhZHW9V07VFgtjfhqD4yCvuFGIxCBylGfSI2gNk5M9Vcy7mIgjTmXl4mb08Q3qYWE20rX5tlTitBGCsV/f+8ykMwfZpO54jriLIt8iMu2HoCHW7Gy4My6PpAE74r48UcsBIuk0YKO/CQLccMs3FX7mxJXOmW4Szt5WKCcsz5BGKNhhgVSh+Ba7tnqwl3K2fhFJ1imkaZyQhNCXKgCOfymzz0AFhVddgt4pj9Trad/T+EoiHxoCwOuNXru3MLTmOpSng/KRzCf7Pw6+KvE+JB/45ks6eOaetDVP25/lD9Xk9/5MRRYeULDZCj1XjFEFvYxasgKmEXb1PaWq1vED5Qfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kS47+VWF7plcjJrQqiMe6eoziGUpBc8BpsIj7V5A+pk=;
 b=ur4/Td+qFYC3a6y1nNOUeEYmXFTNXS7cHvnejQ645SvyAP8GKsrbeIix3iHaOwse9QPbrLeH2Yac80qFODdC+WLmsmPH3vZhA5WEsHSvfp+NyFq82U2eXMMwNPzB0LJON8ZXpXvDE/f1Gth5l8CkuHpK0qHtaNgYmIXMeA35R00=
Received: from DM6PR08CA0008.namprd08.prod.outlook.com (2603:10b6:5:80::21) by
 DS7PR12MB6215.namprd12.prod.outlook.com (2603:10b6:8:95::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.44; Fri, 9 Jun 2023 07:29:37 +0000
Received: from DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::35) by DM6PR08CA0008.outlook.office365.com
 (2603:10b6:5:80::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.26 via Frontend
 Transport; Fri, 9 Jun 2023 07:29:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT085.mail.protection.outlook.com (10.13.172.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.25 via Frontend Transport; Fri, 9 Jun 2023 07:29:37 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Jun
 2023 02:29:29 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <kvalo@kernel.org>, <nbd@nbd.name>, <lorenzo@kernel.org>,
 <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH V2 3/7] drm/amd/pm: update driver_if and ppsmc headers for
 coming wbrf feature
Date: Fri, 9 Jun 2023 15:28:42 +0800
Message-ID: <20230609072846.1552238-4-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609072846.1552238-1-evan.quan@amd.com>
References: <20230609072846.1552238-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT085:EE_|DS7PR12MB6215:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d12b73-ae6d-46fa-aa2c-08db68bb47ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xXjP9xKvs4hUSH4R9ADETvhlBnJAXYfovmizC1NFpFZZZtt5w9mp41l2uVQtk9w7dAegvXNbWzaO3nWOhG+IZ/D9T0j2St6vAESxg6jH5SVDYJ1XigYQPJuhx5ihxweeMy6uY1Agns/f9BMymtjinL/9dQpaDj+7ExZVYtvwdBuPXLvv1tRWTqbCUqnEpSW+iKk9/uOSu4siG66i09zGVP9loUCxnJH/i73tIP+E7iQzvP9ZnOgCnTg3vhABZNTe59cYLO1xP7wnGKmsg7uV/aB4QiofEzLtAyJnN/HDRSlsPd/j5x2m7jXSmMmAak88g5tAG+FNJhcRh+tEaHP1pzZOKDw3mwlcnj1/AMmNvb2Idy6kDMhJiYnTbkJ/wFt+8aOQlyx8geNx/B4wkF/HpIbxWJYhyNmkmV/S5Jn0686f1FiJTm5RT8yrVZeFjtQPURaMD23743WJKbZkJnKnpdVb7rs/LPR5NVe2Ee+XhQPsAR0cCdPToeuJdkWY68Z13gUK2CWZ85R806wfLTjFUBJ6O3d8HbKxPMAKYRTwgQz+/LTTeR9nly59tBnxjzvLaxqtZ0JUj4f2sYsdJRyTZSlvQHeIqlPJWhJFeOmtrpxtzXZp9eQYJXBfnkmZCJQDhJQPlTztI+O9SjMU/rFkJGNnjimqmy8SCfXlpDWzTiSqfcpd2Hfb6cBf2asx0wy+j3kaSiOi71lLT1TqvTckRGghmLSq4u++wZmBE/tVETXJ3huXUopNG5NX2OkkW2+YHm8ZitBhgOVP7eOPvQR0iAZoPCRzSj5Z+vPiDHi6J9Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(46966006)(40470700004)(36840700001)(15650500001)(110136005)(54906003)(36756003)(2906002)(82310400005)(5660300002)(40460700003)(336012)(426003)(44832011)(7416002)(7696005)(2616005)(40480700001)(86362001)(6666004)(478600001)(41300700001)(47076005)(1076003)(356005)(921005)(26005)(82740400003)(36860700001)(316002)(81166007)(70586007)(70206006)(4326008)(6636002)(186003)(16526019)(8676002)(8936002)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 07:29:37.7338 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d12b73-ae6d-46fa-aa2c-08db68bb47ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6215
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

