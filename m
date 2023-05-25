Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5B0711122
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 18:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D876710E6C8;
	Thu, 25 May 2023 16:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383BF10E48E;
 Thu, 25 May 2023 16:39:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f95IRCxZOHYeOl1gTOojry7wq+3MxbAk9QjKsamLImHtFvU2Z7UhtjjelG5WWRCytCPwWQMv73Wf/BHfvxkgliPEfXiFsvClrx0IEHk6KyYDPYaX3VD3PgoAo9CHEDkBt94OBH7V6Wkpa+8k/PXwvv3RThMEYSx+2pa1Jch57NjRHzFlxhdMGCdiq1Gl+ozVw7sfBVV+GHbFdWHR4SmxvUZGP4oKiF3nBeVauu8ugVP5TmoMdtbSqk4M8yEPeZu2BW0qJAOL61OLrNqQNCOvlml0CUhcuTB5cGYLhZ7LA/z0l6YNLmQ9diHWQK81Fq/SLFfg+WeLA42qV77dY+RscQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhhN/R8Ita8LChAfEREBXYsgPdfxULOlAQGoDpdFfOc=;
 b=ay02YBfPAb1HJt0FJraoURUj81SrF0UzBEoTkGsU+JSSDDSX+i+LwwZVP1dro8swP2PDwf8tWxkKbMXkNhXWsbbKMURE4nbvrLvy0foqvpUY2lfbxF5T4po1RcZHkj2PX2EVbfayEOjMa1QszEMh5o2AsTXbccyY9P+lsfYUB+qHdUVl800maCORxn5acy+daLyTUhaEkjByA1V5FWLRH2UZtK1/nJgEc199a3B3cGfKURqlUaa2o9OttnWW2BlfAhZS5F8SUVnHk3zfrC12dvzQ4H1/IzbaBw1nNjqESnB7I5gXSwQ2U+YaKlrN1PWFcKJsQ2/hVXWig6VcPB+FoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhhN/R8Ita8LChAfEREBXYsgPdfxULOlAQGoDpdFfOc=;
 b=5U865sFmZCc4os7aztbhNA3GPxgk6mvpPUgnuvIVAZ16B1BoBX50Z9ri4moCw6sPg1qU+7UR6Kg054asLfFgtsOh14OoCCVffQyhITKJsJbfqXhwQ5Mv/3wotN+dteAvxa8Kvtvct4o7l2CEd6pERcuCIYTi3ItRPyb2ydYoFWU=
Received: from MW2PR16CA0035.namprd16.prod.outlook.com (2603:10b6:907::48) by
 CH3PR12MB8879.namprd12.prod.outlook.com (2603:10b6:610:171::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Thu, 25 May
 2023 16:39:34 +0000
Received: from CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::be) by MW2PR16CA0035.outlook.office365.com
 (2603:10b6:907::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16 via Frontend
 Transport; Thu, 25 May 2023 16:39:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT094.mail.protection.outlook.com (10.13.174.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 16:39:33 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 11:39:31 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: introduce DRM_AMDGPU_WERROR
Date: Thu, 25 May 2023 12:38:26 -0400
Message-ID: <20230525163827.548058-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT094:EE_|CH3PR12MB8879:EE_
X-MS-Office365-Filtering-Correlation-Id: da65f617-1cd4-4d9e-ce97-08db5d3e9f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HD6tqzE9fNulyjpXMCkI+2VRQx4rl346061rokF63l8oNKt36nSbPZ10ZdSjIza34zPAq3E+2BNJAATX4cuGpw2df1dXAtGXDWI06y/g7fJ88zgRyhbWOz0wp65Z1iltkkcm0T7mvZ4AZNvgzDnbtRHfa+A7Soi55dBDYyENqDbMkiFuPWtjpDiaql6224lrBIJN7pN/ioNcSo0Q0Dm5Ieq3ZxQ1ethuhE1ABmYDxuYuJ/mQSrDe5jLOig0bDAW6JR3KRRSNWaSaeudfOKqvO+J+TS7yA75Eet7Nuhnxneu1pcl1NuVLbn6El5vWpVLRSwMMdffCp4ai/3f1tIqOSux+s6Mn4yu3xbv3n67ny4Rae6xddmOTH292m8dg4IPIMFYfWvprew+J8nYNdlEbWtizwCqM1TBSGu/R+WXTV7dJ6hkpFOOjCI2t/7rGdlKsS5nD/KpOgUXHrk0bh05rE6MOTmSJgAGKxoUMNzYRAqVl/PWtLLd3aIEj5zjACflRgAKY5Tj2s8Mdey8IYpHY0luudxtfHW87rU1i8TnIxGhKlvKq4zWdSlu/bTCEFIGQP2juvmu4vdzTpGa07LbO4IKl1iCSCxL0T3qy4yyasqj/ae3KGxPbGftPApR7bOvPNHKbuU+EtmrruEyU/KiIzUjHtbyR1pj/jQVSvDmeHdfem1Fncr8i8HjHb7OZ3IXQMRPP6dEwxp5hl1h8JOVwHmUWCGmLo1yRmcBUdbDr6uMoyflVUZEKahlbZpmFdCMtp/Pq+3m0aLASOZUJqi1H6m5frGIWnEqpLPzMPD/7WUjwT/MvMZfht9yLCrcSZrKs
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(44832011)(41300700001)(316002)(82740400003)(26005)(1076003)(6666004)(40480700001)(81166007)(356005)(8676002)(36756003)(5660300002)(8936002)(40460700003)(86362001)(478600001)(82310400005)(2616005)(36860700001)(54906003)(83380400001)(426003)(336012)(47076005)(2906002)(186003)(16526019)(70206006)(70586007)(6916009)(4326008)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 16:39:33.9488 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da65f617-1cd4-4d9e-ce97-08db5d3e9f0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8879
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
Cc: Peter Foley <pefoley2@pefoley.com>, Tao Zhou <tao.zhou1@amd.com>,
 dri-devel@lists.freedesktop.org, YiPeng Chai <YiPeng.Chai@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Le Ma <le.ma@amd.com>, James Zhu <James.Zhu@amd.com>,
 Yang Wang <KevinYang.Wang@amd.com>, Kenny Ho <kenny.ho@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>,
 Alex Deucher <alexander.deucher@amd.com>, Candice Li <candice.li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to do -Werror builds on our CI. However, non-amdgpu breakages
have prevented us from doing so thus far. Also, there are a number of
additional checks that we should enable, that the community cares about
and are hidden behind -Wextra. So, define DRM_AMDGPU_WERROR to only
enable -Werror for the amdgpu kernel module and enable -Wextra while
disabling all of the checks that are too noisy.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Kenny Ho <kenny.ho@amd.com>
Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig  | 10 ++++++++++
 drivers/gpu/drm/amd/amdgpu/Makefile |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 07135ffa6d24..334511f331e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -66,6 +66,16 @@ config DRM_AMDGPU_USERPTR
 	  This option selects CONFIG_HMM and CONFIG_HMM_MIRROR if it
 	  isn't already selected to enabled full userptr support.
 
+config DRM_AMDGPU_WERROR
+	bool "Force the compiler to throw an error instead of a warning when compiling"
+	depends on DRM_AMDGPU
+	depends on EXPERT
+	depends on !COMPILE_TEST
+	default n
+	help
+	  Add -Werror to the build flags for amdgpu.ko.
+	  Only enable this if you are warning code for amdgpu.ko.
+
 source "drivers/gpu/drm/amd/acp/Kconfig"
 source "drivers/gpu/drm/amd/display/Kconfig"
 source "drivers/gpu/drm/amd/amdkfd/Kconfig"
diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 74a9aa6fe18c..7ee68b1bbfed 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -39,6 +39,15 @@ ccflags-y := -I$(FULL_AMD_PATH)/include/asic_reg \
 	-I$(FULL_AMD_DISPLAY_PATH)/amdgpu_dm \
 	-I$(FULL_AMD_PATH)/amdkfd
 
+subdir-ccflags-y := -Wextra
+subdir-ccflags-y += -Wunused-but-set-variable
+subdir-ccflags-y += -Wno-unused-parameter
+subdir-ccflags-y += -Wno-type-limits
+subdir-ccflags-y += -Wno-sign-compare
+subdir-ccflags-y += -Wno-missing-field-initializers
+subdir-ccflags-y += -Wno-override-init
+subdir-ccflags-$(CONFIG_DRM_AMDGPU_WERROR) += -Werror
+
 amdgpu-y := amdgpu_drv.o
 
 # add KMS driver
-- 
2.40.1

