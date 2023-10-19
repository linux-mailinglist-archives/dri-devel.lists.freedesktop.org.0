Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C67E7D03BB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B198B10E545;
	Thu, 19 Oct 2023 21:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7860D10E542;
 Thu, 19 Oct 2023 21:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYQz5MeujiWOVF0zJqTBIqJTAx9FlhfFfiogl2LIA0l11QDonrwIePCGOBh9ARXKKH1S+tujB/eG1toLZvwMcFBByZ64lSu9I0gsFyyHzWqY1zrLEv6/rfN/ezyVzAAEsBYPyBA6AqK5Na5kM7mln+nmKOx6sAmuSro/Va+4OelWrVNW7GI3Xt/AtArO0gwhlXIrAHjv/jHX5OeVxp649bu4nufDvpXwzfpDuyrwD+xckNE/5YACnelPMjZ+Myih77oJPO1qDQPuyocaKf6iKqk0QDgBW3ut/e1Q9qF4VDs8ZJyx13YHtFLEozqqvEYKINGuEeaZdu7nWokkQDSmGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLilZR0ghwRwX3dN2z7hPDxqBvmYxPVG26jLiuH3Ito=;
 b=kZhOdr8PCNdgpB6OypxPKDV1u3kpl8rLq0ALm2lrHJlin3qKCk0N4ea+QoPZZ94a92TzxoR32xl+BviiMsLShKKJYbDaePbrIHUkjwErx14VkvBT28r54rw2pjREi9pOc3VNEBl3v9JSHx72vu/01dp/SQa+Kg586eRJgUNd6cHseAAJiVGJKNFVviFxfbdIKzIuvXc42m5zs5MBboNsU7+NA8QwllrsG5cbznQUwXP0xVjGKgjEZfeBG0s5a3Nx1Wue72eblkD+66br2Kg1seFeEYcXQcGn05jT0R4Mev9OIUuXsXtxDSRdrTcc9cnnby5hKnzbDKPe6+HO9IVOAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLilZR0ghwRwX3dN2z7hPDxqBvmYxPVG26jLiuH3Ito=;
 b=ZwRC6y0sEzzqCCEs9JosTIHaAzMIhV7s1/PRtJb4ByZfRMmQtOVRmPLQbmkwyGqi+6YP037wLyTJ0SI865Zrp06TnZV6ha0Qf6LUMngLZiICwHI8sarCxY/ke7wdMukL4o7SQWP2v8SWO43PCrNyS1+9Y4e0JYUmKiKsJQ3d2i0=
Received: from BL1PR13CA0314.namprd13.prod.outlook.com (2603:10b6:208:2c1::19)
 by DM4PR12MB5841.namprd12.prod.outlook.com (2603:10b6:8:64::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 21:21:56 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2c1:cafe::38) by BL1PR13CA0314.outlook.office365.com
 (2603:10b6:208:2c1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Thu, 19 Oct 2023 21:21:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Thu, 19 Oct 2023 21:21:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:21:52 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 19 Oct 2023 16:21:51 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v2 03/17] drm/vkms: Create separate Kconfig file for VKMS
Date: Thu, 19 Oct 2023 17:21:19 -0400
Message-ID: <20231019212133.245155-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019212133.245155-1-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|DM4PR12MB5841:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aac46b5-94f4-474a-3d14-08dbd0e96c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9T0omeq2N+GOJ1ZVMrDmZyt9qhsQkJBjjpKe+BqxZuf2k167MSYqXnjoWMSgx39ZgqsPnUSyc45/1CRoUdFK+19FWf1W1NDdVhugGlawlt1gUuJgok3i344wzVW//+TPsjVZgBnY4ejkc/GbyELLHS/GnRzrM/Wl7+rpt/qBv7XF4grat1RsQACYWYVtRTCFEDP/YoxPh4mjfN2eGufHeHo9VTpDfhpeuxfNx9pg7f1qLig/TIH2ekDzrm/6NEgzECzRu2W9dLhVjUX/8vygDYhwcdBf3lxG1wfu09zmVlhQlxiHB/4tD4lG9HvQI6ttNCDe2LNK+o6BgBsR2MhiAklTSWNAz6uVtZU6m6axGAGn28GFBwCL3Zut/XKWy4kr6nzb/fQmRsOeFx/FVzYhWFn72mR5+p9axqPU1kAPlsf2nujM/yY/3td+SU86hWGaGZ4tyJU67Cbq+NqbvbNAYAxttz/v18j7Pxu/VbAzxUkP65bYXnRWQMIoLv0kp/ok1Ra/CQCbOE34mVPoyFcpfTpbSSEKlOfNkMJwbUZriuOJW0zy8Mbxy3LQvMI7Sizq/1tNcMQz7VJ+mJqnocqvbTvw8/h8fKKJxZWBm7vdWNqOLV4slAc/RtInfPoJh1SJwRgNNwTUzH1MkvzvL/3sn8Wc6ayCdXJNaI7ibDLQkH94UnmISo2X+SLD82JeChmx8Rjqdf6Mb0FiM0cXIPAvI0E506JBf7W9THi/xi28FPUmlJ00yNnl7/paCGwIRck3RPEUCL4V6UMmHVE9XzrOeQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(64100799003)(1800799009)(186009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(83380400001)(6666004)(7696005)(478600001)(356005)(82740400003)(2616005)(26005)(81166007)(336012)(1076003)(426003)(36860700001)(40460700003)(5660300002)(41300700001)(8936002)(4326008)(70586007)(8676002)(6916009)(44832011)(47076005)(54906003)(40480700001)(70206006)(86362001)(2906002)(7416002)(36756003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 21:21:56.3187 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aac46b5-94f4-474a-3d14-08dbd0e96c29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5841
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Christopher
 Braga <quic_cbraga@quicinc.com>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This aligns with most other DRM drivers and will allow
us to add new VKMS config options without polluting
the DRM Kconfig.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Sima <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Hector Martin <marcan@marcan.st>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Sasha McIntosh <sashamcintosh@google.com>
---
 drivers/gpu/drm/Kconfig      | 14 +-------------
 drivers/gpu/drm/vkms/Kconfig | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/Kconfig

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 48ca28a2e4ff..61ebd682c9b0 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -286,19 +286,7 @@ config DRM_VGEM
 	  as used by Mesa's software renderer for enhanced performance.
 	  If M is selected the module will be called vgem.
 
-config DRM_VKMS
-	tristate "Virtual KMS (EXPERIMENTAL)"
-	depends on DRM && MMU
-	select DRM_KMS_HELPER
-	select DRM_GEM_SHMEM_HELPER
-	select CRC32
-	default n
-	help
-	  Virtual Kernel Mode-Setting (VKMS) is used for testing or for
-	  running GPU in a headless machines. Choose this option to get
-	  a VKMS.
-
-	  If M is selected the module will be called vkms.
+source "drivers/gpu/drm/vkms/Kconfig"
 
 source "drivers/gpu/drm/exynos/Kconfig"
 
diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
new file mode 100644
index 000000000000..1816562381a2
--- /dev/null
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+config DRM_VKMS
+	tristate "Virtual KMS (EXPERIMENTAL)"
+	depends on DRM && MMU
+	select DRM_KMS_HELPER
+	select DRM_GEM_SHMEM_HELPER
+	select CRC32
+	default n
+	help
+	  Virtual Kernel Mode-Setting (VKMS) is used for testing or for
+	  running GPU in a headless machines. Choose this option to get
+	  a VKMS.
+
+	  If M is selected the module will be called vkms.
-- 
2.42.0

