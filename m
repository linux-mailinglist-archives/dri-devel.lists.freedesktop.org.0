Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5256072A05D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 18:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1291E10E14A;
	Fri,  9 Jun 2023 16:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD94E10E14A;
 Fri,  9 Jun 2023 16:42:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCn74W6oTKafdFplYyGGITWTFjy0y1+XVil81GgOgqC//ayfgsve7Brl0x5TxdAltVuRutslcq/ccx2XKSJPHyAKqtjq4npceBx32Ph8t/Zh8cBDmIHm5MwqcWjucf8Bx8RzO6qezwT5YopnoBhAnbATy5PA6M4QL0fEKJ3beE4mehtKdtFi0M4P7BMrRH8ixURpr9DSDf96WwgoWU1n0tPyOGPbzCLPlvGHIg5ygVNtfpHYVPSnBzErr8ecomjKTymVU91bDRZVfhXnnRY+QBkXQf6FKHS2gP4FhwrPehWZdNtym3cY/Upxxot79d0YLjPPbjUp0EyGbynQTzbWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHPtUkjWi081Krft7qmVvihs5tNcNkdVbKJftJWFc3Y=;
 b=NIFmxNtSCbP0CqZgWENemn2dghXIEb0ukPYruINW8c+ueUKn1Hg77FYZTEvSjt5wKS+aqxWsxCebcqMH1zRtFvGjJ8U+TMx4NgE1KqPOVrcuZ6haZvTIRPd2xK35f+q5Dxbjh4Jy2lY8mpJChpv17/9Rj4XS+m3O+Bygv/TiWN/FgbRZrjvy25zif4oWfifh2g425vubRpQ263OLxxJFnm3ImJT415R1RuIZodlyKBpPfl+y1WALgJjDDWYw9eRP/mjrrfbX1W5uckPMf2j/bEQDA4+k2eqTRRq3MFOdYilWNVPcE04AgjWUD9+FIKsH+g6d05qUStbbm0n/vtTGSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHPtUkjWi081Krft7qmVvihs5tNcNkdVbKJftJWFc3Y=;
 b=NSrrP+qz16Ep0C2ej2gIC+3YpQPO3QIasFkEnVki3jM3YiDMtgZHZGvf3zLahWgA9d1O/zG5bvJy/F0CUmpTgSB19+gnvPkzkf4Z/MT4vNnsrrneoyL1JP/rYcZixvwuGjIGs8FZKOkcTpUaZpiB9ZNv9TVzesv9lt8M3Ievnos=
Received: from CY5PR19CA0106.namprd19.prod.outlook.com (2603:10b6:930:83::29)
 by SA1PR12MB7039.namprd12.prod.outlook.com (2603:10b6:806:24e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 16:42:22 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:930:83:cafe::12) by CY5PR19CA0106.outlook.office365.com
 (2603:10b6:930:83::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.27 via Frontend
 Transport; Fri, 9 Jun 2023 16:42:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Fri, 9 Jun 2023 16:42:22 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Jun
 2023 11:42:20 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: enable W=1 for amdgpu
Date: Fri, 9 Jun 2023 12:42:06 -0400
Message-ID: <20230609164207.430377-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|SA1PR12MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be8b222-a1c3-4be0-02c6-08db69087f6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zBVnWriaQhsvc9gfoINUaNvc2Eond8NvJSZSNkcBvJS9iUx0C5z1dxQcIl/tJ5uD0IZ1lC4+3ZCumVAjghmN+u+SX/UL4tKauTx73Bsy4HgxmQfw2j8WzzTNXbHDibipJPzCrPNMkAd4o3M3bcEvMvxefF2Ng3D+loo8yC0Akd/Qge9vylk+dYNkES4FduPpyGJtE4KFOmbOTwcjGaGkiWCjs2ywhkvxebXhPThquLdXa6Q0LRs9S/Ee8ybZmnIpGFlTnjc05UC9jKHpG0uvBUgQFxVrO112QAtnJfbL7b48olsxQa7k+jEdOqykZ1k2kp4NN4D34AdnGWskaT9n9AjpAe05wtNSONxjClV92qoiPYYrHrY7ewFI3avJ7iLthfH1ABWRx+7t4q6xeGTf66D6SR9dqn7Ioks0+YdTalw1JzTcKAl1PFFQAwwSKkPUMMbc3Iy/ks1s/TuJQp8wvKsr1cohDTXmepMinDLxm+zALRHTaUNdGK4CvIU2OoVzXfStIaNjiT/OfYhy2yuBpu3ZKWEmvg/HvHVidnNlSjtM8ysh5ThLHJuVx0H3fW9ko16ZZcJoQrsQNLo8uljcx7urJjtoILPNPoWGsyym5y5L4vWkL7uT8yKzzRs8q0KQE0KSgvYi7xy1l3G5JPCxQMm3hTg0r5dmf+N7QDxR/9BvpDRo9Yb+WX4WEHzMH/iaIxVZ9XuDw/KffG3zuHrxtgMOZb4DpdC+NXuTWKzFT6UHmJjOmfHsyozAcpgtIPkmPoU/uIiTMNpmNyudREl8yJbQ58y+1sF4VaSojigkbU8HJ5zjewTaBZC4OqxTfKWL
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(46966006)(40470700004)(36840700001)(2906002)(336012)(82310400005)(40460700003)(6666004)(16526019)(26005)(1076003)(47076005)(83380400001)(40480700001)(36860700001)(426003)(2616005)(86362001)(186003)(36756003)(356005)(82740400003)(81166007)(44832011)(54906003)(5660300002)(316002)(41300700001)(478600001)(4326008)(8936002)(70586007)(6916009)(8676002)(70206006)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 16:42:22.0599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be8b222-a1c3-4be0-02c6-08db69087f6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7039
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
Cc: Lijo Lazar <lijo.lazar@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, Le Ma <le.ma@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have a clean build with W=1 as of
commit 12a15dd589ac ("drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Move
SYNAPTICS_DEVICE_ID into CONFIG_DRM_AMD_DC_DCN ifdef"). So, let's enable
these checks unconditionally for the entire module to catch these errors
during development.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 86b833085f19..8d16f280b695 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -40,7 +40,18 @@ ccflags-y := -I$(FULL_AMD_PATH)/include/asic_reg \
 	-I$(FULL_AMD_PATH)/amdkfd
 
 subdir-ccflags-y := -Wextra
-subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
+subdir-ccflags-y += -Wunused
+subdir-ccflags-y += -Wmissing-prototypes
+subdir-ccflags-y += -Wmissing-declarations
+subdir-ccflags-y += -Wmissing-include-dirs
+subdir-ccflags-y += -Wold-style-definition
+subdir-ccflags-y += -Wmissing-format-attribute
+# Need this to avoid recursive variable evaluation issues
+cond-flags := $(call cc-option, -Wunused-but-set-variable) \
+	$(call cc-option, -Wunused-const-variable) \
+	$(call cc-option, -Wstringop-truncation) \
+	$(call cc-option, -Wpacked-not-aligned)
+subdir-ccflags-y += $(cond-flags)
 subdir-ccflags-y += -Wno-unused-parameter
 subdir-ccflags-y += -Wno-type-limits
 subdir-ccflags-y += -Wno-sign-compare
-- 
2.40.1

