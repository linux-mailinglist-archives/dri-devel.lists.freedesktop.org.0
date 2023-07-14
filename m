Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AC275383A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5609F10E86A;
	Fri, 14 Jul 2023 10:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273A710E869;
 Fri, 14 Jul 2023 10:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIJw8M8QvDxJDyqJH3+EZgFBG765e0Rwfj+PI0fK+1+iRn5ScOzk2MDiKuKFYNy6wl6BfBV5c+K/qx9HlRVaWTyXnrbigetu4DbbIwpFFv0hzPlLXSqL0iPs+Y1LJsEA2GpRAjmbZeVCLW+8P0RXEtZ5FG5HfpweIA+MEb5xzt63agLPKFS98azqj7nH5nOsNZ9DsrGA87qMNVy6kyUl8tmfnRX5nTYU34w9HT1KWNtaylyb425vLoAmGMig8926H7Gt55PxOJU9PE77NKUA6puhfrP/9ASFYUcl05DtFC7IwmOlBrKpL+59lxIxyAHJV/Plcnm2TjtIaesWcxio1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Jrjk2bD9tk9kCeAy+uTMw6ViY1bJxaOQ4V8fKTvC5g=;
 b=h7H0czUu8UJ5E4KQkJAXo0bFCryj4nk1x4m9aK8FY3kEh4Bgg/EMe2jxYXAm9vQd6NGin1S+5Wv+vBhkk0BlQWMuPd5BjcBNz5+sUJIFf6L66aETO6YLGB63X/kKRVy1TidcDVzw1g3e13p6zHMHsJNuHGQUopHVuJosM4YMNZ4XyQQdEkw3w5ol1VX8peAD2qbEWJnziyRykdk3g4bqE/5Gh+OlsVV4pXCqYiytQfcB3CCwJWLvxEO4O6pU/gX19A/45dOGq7hc1maR+ze2TXgjeEHTwOszIdAGQgBqYruiFCk0rhuE5ypTvPI9t0xEsu4Ntoo3SytA2+A3rHy1lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Jrjk2bD9tk9kCeAy+uTMw6ViY1bJxaOQ4V8fKTvC5g=;
 b=GnYmXktCw71WPaAb+o4DHejMpZVUcdXnETdW0z0AVaPTbkdyObpivwmNBhVEZJARBc+bs9ljn5JKdjeAv5quCQC8zdSV8WGKWz2rRffqNCHzkksYPx3dNhouvXZ2O4t4X+A3boYQISpytEqtGVFBk8A2rbxk47hsX8b/x0lQ+i0=
Received: from MW4P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::29)
 by IA1PR12MB8224.namprd12.prod.outlook.com (2603:10b6:208:3f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 10:32:21 +0000
Received: from CO1NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::db) by MW4P223CA0024.outlook.office365.com
 (2603:10b6:303:80::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27 via Frontend
 Transport; Fri, 14 Jul 2023 10:32:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT071.mail.protection.outlook.com (10.13.175.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.26 via Frontend Transport; Fri, 14 Jul 2023 10:32:20 +0000
Received: from ETHANOL.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 14 Jul
 2023 05:32:18 -0500
From: sguttula <Suresh.Guttula@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Leo Liu
 <leo.liu@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: Enabling FW workaround through shared memory
 for VCN 4
Date: Fri, 14 Jul 2023 16:01:58 +0530
Message-ID: <20230714103158.3179748-1-Suresh.Guttula@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT071:EE_|IA1PR12MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 035b7d2e-92a7-4338-5dc1-08db84559aeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p3HUWF3DiMrXofQuvAhiKdl+eKfhm/2I04S/0u6Ea3Tf2jqcJQhGwVsc6fS8IkqlkduZ1TBbifZ9XhxzqJ1AEa1NN/93z6N8oKwqLyuPDx/3NxbO59OiStnkybJUlp349BGGTDBvczBpdgPapu5zyMZMF34C7hJreBqnx7ILYEQclA7LeZBZJ+uDWt9FEqJXIWMCCyhv7Uqdmh30A6+wz2EzpUivOnaebuV52MvGG1EchCUOI1v7SDPjrCLp06veRwCJ2dcHo5lWYOBRTJUtiaqkM6UBHdrMEAzyidUttsTabLuMTxh42e4vURTOOHCP87aRNM02gHGYXMX2NgSm5uc0FWDS9sYikvGhpgtq9qWKCUWjinnjA7EUJZT5arx9AAWBv8VsOctyE1NxVEaxWa/ZYOixN9y366dQ2df9gh8nxF9/xgux4Euh5YrXFViUm8YP3dMoBTm5PA/3ceJXzKBegoPi5ZmNPSbbY5sMWV6SzI3AUEROBEau8mhKMGKvieiVVYpfEE0OTJmQ4042YXHLprvrkSzB/WyZ0jE+7yhTrfX/6hDP2mDz86m8WlT4uEwFBSAYyouhlZA+ihlxYadvbJdIZQGVqYoaQElf8rD2jjuhy/B0T8+y/MQorJ4fDHl4FpXeqkXlg6MUW9UwI/iDcGjKuubrNxSMcljMyiXTKmWkfDEofbTbRg1kphJ50j1DZXY0OqmjaDu0W6ImiRjgUHADRs37JYp0KaufDZdXKRZACrx6lYTTi9rBs2prNmZylYRH/8emgJvsl2CUSyzw7aQQifaIf2gdqIeW5KU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(450100002)(70586007)(70206006)(4326008)(6636002)(41300700001)(2906002)(316002)(478600001)(5660300002)(8936002)(8676002)(54906003)(110136005)(36860700001)(6666004)(7696005)(40460700003)(26005)(40480700001)(186003)(336012)(36756003)(426003)(83380400001)(16526019)(47076005)(1076003)(81166007)(356005)(82740400003)(82310400005)(2616005)(86362001)(43062005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 10:32:20.7697 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 035b7d2e-92a7-4338-5dc1-08db84559aeb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8224
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 sguttula <Suresh.Guttula@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch will enable VCN FW workaround using
DRM KEY INJECT WORKAROUND method,
which is helping in fixing the secure playback.

Signed-off-by: sguttula <Suresh.Guttula@amd.com>
---

Changes in v2:
-updated commit message as per veera's feedback
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h | 9 +++++++++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c   | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
index 1f1d7dc94f90..a3eed90b6af0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
@@ -161,6 +161,7 @@
 	} while (0)
 
 #define AMDGPU_FW_SHARED_FLAG_0_UNIFIED_QUEUE (1 << 2)
+#define AMDGPU_FW_SHARED_FLAG_0_DRM_KEY_INJECT (1 << 4)
 #define AMDGPU_VCN_FW_SHARED_FLAG_0_RB	(1 << 6)
 #define AMDGPU_VCN_MULTI_QUEUE_FLAG	(1 << 8)
 #define AMDGPU_VCN_SW_RING_FLAG		(1 << 9)
@@ -180,6 +181,8 @@
 #define AMDGPU_VCN_SMU_DPM_INTERFACE_DGPU (0)
 #define AMDGPU_VCN_SMU_DPM_INTERFACE_APU (1)
 
+#define AMDGPU_DRM_KEY_INJECT_WORKAROUND_VCNFW_ASD_HANDSHAKING 2
+
 enum fw_queue_mode {
 	FW_QUEUE_RING_RESET = 1,
 	FW_QUEUE_DPG_HOLD_OFF = 2,
@@ -343,6 +346,11 @@ struct amdgpu_fw_shared_rb_setup {
 	uint32_t  reserved[6];
 };
 
+struct amdgpu_fw_shared_drm_key_wa {
+	uint8_t  method;
+	uint8_t  reserved[3];
+};
+
 struct amdgpu_vcn4_fw_shared {
 	uint32_t present_flag_0;
 	uint8_t pad[12];
@@ -352,6 +360,7 @@ struct amdgpu_vcn4_fw_shared {
 	uint8_t pad2[20];
 	struct amdgpu_fw_shared_rb_setup rb_setup;
 	struct amdgpu_fw_shared_smu_interface_info smu_dpm_interface;
+	struct amdgpu_fw_shared_drm_key_wa drm_key_wa;
 };
 
 struct amdgpu_vcn_fwlog {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index d199f87febd1..9f32c9f73941 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -169,6 +169,10 @@ static int vcn_v4_0_sw_init(void *handle)
 		fw_shared->smu_dpm_interface.smu_interface_type = (adev->flags & AMD_IS_APU) ?
 			AMDGPU_VCN_SMU_DPM_INTERFACE_APU : AMDGPU_VCN_SMU_DPM_INTERFACE_DGPU;
 
+		fw_shared->present_flag_0 |= AMDGPU_FW_SHARED_FLAG_0_DRM_KEY_INJECT;
+		fw_shared->drm_key_wa.method =
+			AMDGPU_DRM_KEY_INJECT_WORKAROUND_VCNFW_ASD_HANDSHAKING;
+
 		if (amdgpu_sriov_vf(adev))
 			fw_shared->present_flag_0 |= cpu_to_le32(AMDGPU_VCN_VF_RB_SETUP_FLAG);
 
-- 
2.25.1

