Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B61FE82C80F
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jan 2024 00:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEDE10EBAF;
	Fri, 12 Jan 2024 23:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4702310E948
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 23:42:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEYDkfQgr8vBqkYm7YIf4ssOT0qTiSD79DsW9mKIswie0z678UaKDICO+uiavMfXZ8jVqAMPh+m9khyJ6Lif7LZkalCLLR1z4Aj1t6Rsep78RIA+4KUTKo284echImLJjWm3ysUj4LU2nKL5qOjVC20CDcphCXCneCdp6TXSfZYkin4yG06tK0bRjj41Whrjq88PYyxGwSI4y5Rg0zf0d/TYguiKduY7EflxjRYzPp4/JFSdwfexz6gu56iFDsws5vTZB1PfABeSsV+3z1EyELf3yQRJV4XHMUunreK0rXbxTuLdl5OeZ4KvX3ttdJMegueRUzhBj0OUDaZcloXpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg+Zk3e57igtWoKUrG6gPGLeLH/HPz2+uaOq6mcbCBI=;
 b=fKcAQUVwXESvwiew41tD3NdLpUQdjXXOG/5ARwjg1f716PCJ+zUkoNikE3Hn1mFbVqFJr9J4WoPvA4ateo18WeQv3CBsb6PJf0EMDjwI9TNc8qiu9po23FaXjYeszOlL2KjoWyoc+zLp3bYQw0f4DEFBVMcA+lDRLm0tzk56VPJQveXE0VWtX3LRYLdjvso2joS16QwUZI8Cukmwauhs0gAMSFaLUrKu7ef6tJGyL43rrjM41soOEuOGC0ooyUSTtKmiO7jQkLNYWf+u20COL4VTHSM5RtjHSWrvdqmlOtdg7cgISiAWbMN7R5NVouKZoGc7U2IdFLWjpyPQj7eyNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bg+Zk3e57igtWoKUrG6gPGLeLH/HPz2+uaOq6mcbCBI=;
 b=ytAZj844/i7fRUjRiF1fmu0dO14q11Y5185TtzRh/EHyXeERDcC2Ve8bHE9J+d2+9EAX+WtqNvTPQsbDCF3gj/VALSJBHwFU89cav8XEs2ENL+mbfBeJacpPvXNVJfu+iUNYForz8JDnSgn/m050AXNENVu5tLlv1lIC4UMWfXw=
Received: from PH0PR07CA0005.namprd07.prod.outlook.com (2603:10b6:510:5::10)
 by SA1PR12MB7412.namprd12.prod.outlook.com (2603:10b6:806:2b2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 23:42:26 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::30) by PH0PR07CA0005.outlook.office365.com
 (2603:10b6:510:5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 23:42:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.13 via Frontend Transport; Fri, 12 Jan 2024 23:42:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 17:42:25 -0600
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Fri, 12 Jan 2024 17:42:24 -0600
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <michal.simek@amd.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] drm: xlnx: zynqmp_dpsub: Fix timing for live mode
Date: Fri, 12 Jan 2024 15:42:20 -0800
Message-ID: <20240112234222.913138-3-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
References: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SA1PR12MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d14618e-ded3-4b21-6ced-08dc13c821ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +fOhuPIURfBxMhb0cjJ9U+6MplzO+tFGgyHPHzjY33retSHPz1eac/0NakXpwI5sHWz96k+BpFoJeyHUfvCAPUygbBZ4mThgxc8TMv/JEnJltpDMke2B1naRjlFqN5uFLav2x9nCVm3MNBEbKwWgF/e/1v0NNBwZI31bhPyc3n3deaRsgRaLskDas5FCTGCv1OQ+urO/v7YaD8FTzosHKE8jGFUkTz+XNLSNET8U9KoSuO6MG74lCekf/3z0yh8qkwau3+CN2lp2//XOPRiVZ/yg9PbC+83JBiK6EkP/b/7jLsVIGsP2CnLtP6xjajkqKg9Z9gdzop6GENgslCIU/levXhhdep9HzsELc+wBvnBRlMgWZVTU5T/bj/l4x6fnLtRUT2B4w/k+jFWwzcXoXowPTjgepMtuJbbs4nEKiG1nvAHKkgvifbjcNqdi7XZy6TKcQL2pbxXE50DpEaX+ZgOu9wqbPWxWg6kjlVV1tvIbyDRKPc50UUKbsSLCv6dU+TQXv2zsGTMr0xRVog+4faKvzYnnqf6lTwJIlLdBPGVLghJSvNiXN0hqC1iIPRPiC0RkhdIpii7REsPBpiRJrdGah9bEsMmmhaEra8G8OFniSkEKOQaZuR/sQD4s4K0adX7mu22NApOJULJzp4R+XDwkLROWihiqAb8dytegpnf3OL6PpCpOYaGkBUM4SkGaHpqWAm5Zq2B5Peu18nRhp+omVgmni9w3j8/IX/tP518PqcjCQcywtu5mFnBRm+dNvmprFqTG0KMCBds7mx24wTlT3GDrpNjxMgiDsK0X1myZ8lTTS6vzZOpIT1/LF3/b7aeFhYPmXWFYcPvIgGlW+mnObTLSBaJfufMEB1Ogy46cU+FlPTYkz+N1qygZ3uKh
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(186009)(451199024)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(82740400003)(5660300002)(40460700003)(40480700001)(70206006)(44832011)(70586007)(110136005)(2906002)(316002)(81166007)(8676002)(86362001)(8936002)(4744005)(356005)(478600001)(47076005)(36756003)(6666004)(2616005)(1076003)(26005)(426003)(336012)(83380400001)(41300700001)(921011)(36860700001)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 23:42:26.0706 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d14618e-ded3-4b21-6ced-08dc13c821ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7412
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expect external video timing in live video input mode, program
DPSUB accordingly.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 407bc07cec69..8a39b3accce5 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1166,7 +1166,7 @@ void zynqmp_disp_enable(struct zynqmp_disp *disp)
 	/* Choose clock source based on the DT clock handle. */
 	zynqmp_disp_avbuf_set_clocks_sources(disp, disp->dpsub->vid_clk_from_ps,
 					     disp->dpsub->aud_clk_from_ps,
-					     true);
+					     disp->dpsub->vid_clk_from_ps);
 	zynqmp_disp_avbuf_enable_channels(disp);
 	zynqmp_disp_avbuf_enable_audio(disp);
 
-- 
2.25.1

