Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F1C7536EE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 11:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DDA10E83E;
	Fri, 14 Jul 2023 09:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B06710E83E;
 Fri, 14 Jul 2023 09:46:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iErvVQ+Qt2MzvUmJuPa9kZt/9qINxrlVfecIde8+U8h3lFnyANrp/ppINlal5rsJytKHxGjIYxVwrdeAD/bRVlSSXATpPt6UUHHsn0vFarafxNcqokBJUYZgjBPAGj+qUj5f47/d5uDKq3JlGRRDUPW5RaeWK+XSsQu3wr7IBKsI4H1koVmb8jVrO1MULkY/gIAuyJZQJESQQ6xiXm2gu4rzJZJbWsLdZ+ZHjy7FdY9vjuUymtNi+z1e9XhCPPEV2qPLLwTSl60oaWJIyfYaPheZNkPvbz9z26nbsHMN79FFJ+W/Ucsoe+O9LklwPPx/JVncxuMRCyy/zpwDocMu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sy4rCfwXx1VErzuzsU5LTq0QQPC9yl7/6DY9sfnTPPA=;
 b=GMFRLnEnlI6Kr1YJGz0bT4qJKbt2/WZ4XD39SDT/WL3x+Xu4jEJ0eGwxP8Q5A7M/Yck3xY2F9OoIrnWrp+yeifuI2K+WddW2aLHy3uUokw7BAarPjgDkhEhuNUTG6n+VAOGFs8meqJcGiZUrEujP5kP7l0JYuVuhN+R0FtPP3zdH/vtMYiaIvP1NXtRsbOuUbWe1th2+Bfhstlcy4LCFdZ7qcsVK0roycwBt7cakLWNJbbV6Rztnb6tEUQPFzRmL5ZoUXQ5N5lSZrOn2Mdrz/G4uojzz3AeaAvpIBUcAR7gbe44cmtdoCpjTjpFXJXK2BWn2NWkvKTiBadZINqz/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sy4rCfwXx1VErzuzsU5LTq0QQPC9yl7/6DY9sfnTPPA=;
 b=1pt0cnIAmwbh9cFN4tuxjXkTAnlKNzWkh3NqiM4jm/KWS7F0Bud2s60TJScFC6Iugx8c1j9ND1OK/X94j3uvL6p7cogYtds+c8/YrG21tMDPFappBpilkmVuKPW8qfylnxRlNWPupQ5vkO+oXON2QyK0cAsRU7aLjlIEFm+H9aA=
Received: from BN0PR08CA0019.namprd08.prod.outlook.com (2603:10b6:408:142::12)
 by MW3PR12MB4570.namprd12.prod.outlook.com (2603:10b6:303:5f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Fri, 14 Jul
 2023 09:46:39 +0000
Received: from BN8NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::c9) by BN0PR08CA0019.outlook.office365.com
 (2603:10b6:408:142::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27 via Frontend
 Transport; Fri, 14 Jul 2023 09:46:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT103.mail.protection.outlook.com (10.13.176.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.28 via Frontend Transport; Fri, 14 Jul 2023 09:46:39 +0000
Received: from ETHANOL.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 14 Jul
 2023 04:46:37 -0500
From: sguttula <Suresh.Guttula@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Leo Liu
 <leo.liu@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: Add FW shared flag for DRM KEY INJECT
Date: Fri, 14 Jul 2023 15:16:17 +0530
Message-ID: <20230714094617.3178269-1-Suresh.Guttula@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT103:EE_|MW3PR12MB4570:EE_
X-MS-Office365-Filtering-Correlation-Id: e00c33c5-497d-4665-f857-08db844f38da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +LcyItRUJRXL/C7kTDQxjLqvfgTmmD3UknJgVo6Me3cwsddCmmUMHQAVS+keNjZ7y49lh5yCJyONw10ZwnHjZkgWaQeYYcuFSnn6wWUlsLvEpitJR8JTaQTJZsYiKsZPBPjNLxuOMh1Xvp2PYjdjSBCLf2uHfXQc3j7stsGcHRfWRdri1HRwMtfm9wyD4SzWuc4hyd9wMaAmZBoShXPXvmJgg8bR3yDTUoEHE9rQ+tSVNT3bmsrs4Hu5e/Cq3f4faKFhxTNS07NLWmlBbTttjrUsBGgjSn2axJyvDOJefAbFOrV0vf9gb+5auI5uUziDzE/JHcTT1lSAPw2RFu8UgHodyT3Ad55GUbvMed3Y568TokmPDYByUtqG+ghsAatK2lFfmW0oAQqH4ZvDNVnXrXFizr70WjFyjm+Vv9SM+CqqOEoer89pHRr08lZHwRx66x+I3tr0g6bkuUgylbSsL0aliBvflPGSm0dIhst8cz15oFR++Fr/ZIvpsVElUTPDtGfMp/bhGh9CIGiCQ8UDhS3tlW79Vrm9y4F9JSwUEAvRkVPI6B4j2qS34MfzpMxOn7E7HjyO4jyruhJHl3wOq8mAz/qfjbqiwPaXCafZJZUxun+AIAcSAh34b/iM4EA8lmxTObQHz04EX40i0u4xe7Spl9cSa6Ejl5Zt3F+qyvRS+ZGnv4fRqlVl5k3SmmkiQZiryeNjZTU+PWDMRypshnzdXcr0XnlZX3ndRleHNXDBKrtWrtg2owhaPxkLe8jtFfP/YmjjlDZ3hMP2J2RLcUteW8xKejJgGkEYxiCNytU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(36860700001)(47076005)(2616005)(426003)(336012)(86362001)(36756003)(82310400005)(356005)(82740400003)(81166007)(2906002)(40480700001)(316002)(41300700001)(6636002)(4326008)(7696005)(5660300002)(8936002)(8676002)(478600001)(6666004)(110136005)(70206006)(70586007)(54906003)(450100002)(186003)(16526019)(1076003)(26005)(43062005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 09:46:39.3745 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e00c33c5-497d-4665-f857-08db844f38da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4570
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

This patch will fix the secure playback corruption due
to HW bug on VCN4.

Signed-off-by: sguttula <Suresh.Guttula@amd.com>
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

