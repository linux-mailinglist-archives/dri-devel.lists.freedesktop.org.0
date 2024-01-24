Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F835839F9E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 03:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4869910F433;
	Wed, 24 Jan 2024 02:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFCD10F144
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 02:54:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrr1Z4vT0svCPL880m+ilsC80KgYaoYRmW8XIttBCzDwIgTFnogrXoskaWzXEBJy5dIWD7Bkg0RpTwk+8QIRgdwtm0DtL76PL+34Op/CKldc1o95YuWZbpd+smIOSayIAS6ud/eRTzraBW4TfX4RZZ8u+cFa/4YEFwjUzwojOBp8um6rWxuEsWeDLeHbwmMg4yj6CxI1AtOqNHx8oHgITy8254iXz15ARJLzuKO5l+lHrEG+SiZ7dhaTyN99hiUNPYWkE8fgW/ZjHIeJgzLem9YwEJFTwP7/Ezwd/XPMkC2W9WPDjIg61Kj+V4eb2t0f4o3b8dugWJTFDnroaAJ1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naQl1M1fJElFi48z7rmdpJrqK6IESMDv+QGqAZILF44=;
 b=ae8Pf0Otn2MIOFcRAgNVFwZTNPLyzr+1B/HvSEZ8VwuIGd60yqivCNWIR3ZoNtE9ysBHEt+ALlbmP/jyLSUHSscLT4w1pcPf6UJYOWpP9yz8da/7Q+mHk9fVMPKrQ5XYo3OyJ5iBJr6/bc7yYamk9lmrGZLHrLNG+MUDfVALYGm/D707TeJVPSeUyQGXIVG+WbAgEcM94c527bxp3exj2xocsy1Ff1Q/H24mX4nv86aA9eDkMNpn5Dot4oI6DIWiaey9gNNElxTLvlJpGtHWSCPNgpTZS1EwicUeem50/qPpjj/g5uxjbVSdAztgeN0l852t+jxAT+dJMxRY/eZkCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naQl1M1fJElFi48z7rmdpJrqK6IESMDv+QGqAZILF44=;
 b=25uc9CtXICY8PAnC3MctZs+K4bh3i2RQ+wzVWPcIj6KzS763HSj5NFVSbVF5dy/jCWfXr3GrqqEBwAWlh1wUZmNk0zURNhKuqVUDtXgghdK6+H5hG6Ei5WrclXonBbQL7qbVPUjkdKHh9uIYHFSu8hRz3I4ssRLKJy3jMPk8ipI=
Received: from SN7PR04CA0101.namprd04.prod.outlook.com (2603:10b6:806:122::16)
 by MW4PR12MB6849.namprd12.prod.outlook.com (2603:10b6:303:20d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.30; Wed, 24 Jan
 2024 02:54:05 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::1c) by SN7PR04CA0101.outlook.office365.com
 (2603:10b6:806:122::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Wed, 24 Jan 2024 02:54:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 24 Jan 2024 02:54:05 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 23 Jan
 2024 20:54:04 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 23 Jan
 2024 18:54:03 -0800
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Tue, 23 Jan 2024 20:54:03 -0600
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <michal.simek@amd.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/5] Fixing live video input in ZynqMP DPSUB
Date: Tue, 23 Jan 2024 18:53:57 -0800
Message-ID: <20240124025402.373620-1-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|MW4PR12MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: b12f5e21-0d49-45ef-32e7-08dc1c87ba4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hk/PElpcSKMDOloX9JlRbE+VKQsvZCYmoHBeNmIDs7HE2EswSTB3kMgx/be8s1G0r8Aes70c6ffjDEk6riXc0eFkhzYE/E9RfoXJy7xH2vLMeoPJAMZ6Q0If3qSvqWa5lBkUsBsA07cnzUQq3aVqPari0+vctqp8AkZDSneNZ6W9k4D/HHs1EAqMDObXSFSia65gpbMewOEvyE/mWJeUgP3Qn+D/8B7RBfAAxBraF39G/jLsi/mIH6U1s+UDJCeNVPDiAWt4rVTacYJf5wutiUfbOYGlcTvZj1ILUNPw+SI7nyPMK0HzBOotf7CvRpNSpWEmUtpB/rPJcSLBmt1vK1lxSBHwXsS/RfXj1kf8YtjVW48eR9WTHJRSgukmdowkep1+ilwWgLDpEr5GhSEWl0ndtboYMJdmIRrJAwbjq+YmTJEm5dMONXQA6/7Yf7giO2NXq3Kg2WFe2Qw69lUGgRpIU1Z/2akEEbabJHLU/NdfU6FvVsdB78tYqMJNLYFdex8NK2HIIQjnrRLvSZ+C9gGL0sFy889hmUk89JmxtFWQt55ZtIwSA5uVNj/3nMHVQJ9tePRb37bkU/5SeOj6fxuGNfBn/mQyslV7p98eajj9RvXMFtBEpxK9EHbkWCpu1J2hNHfLzpOCcPYCNRMn4gp42mQZByKXUXXaO1YjqDZAKxhI+rrjB8ndkRo/6LLRy4JBUGhINW/sCUc7d5zx/YjeEWPDjyP4aMqkkaGpRc8HMIQNCCp4WBJhgpmn841Wge9rEURNIJluL63J1fZVpacNji6NSBFhDz/ou72QrSLvQdhIeNhCTmFBW8wvM34LLvgqRQUR/A0KabNNRQrVArBEFHvGDkzAmzlqYH2inl36WU3OktkizrEUrQ4XnCB8DtHBV5SubZq7DW4mLmFMTA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230273577357003)(230173577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(82310400011)(46966006)(40470700004)(36840700001)(82740400003)(316002)(6666004)(921011)(8936002)(5660300002)(44832011)(86362001)(2906002)(81166007)(70586007)(41300700001)(110136005)(36756003)(356005)(70206006)(966005)(8676002)(478600001)(40460700003)(40480700001)(426003)(36860700001)(336012)(26005)(1076003)(83380400001)(2616005)(47076005)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 02:54:05.1058 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b12f5e21-0d49-45ef-32e7-08dc1c87ba4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6849
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

Add few missing pieces to support ZynqMP DPSUB live video in mode.

ZynqMP DPSUB supports 2 modes of operations in regard to video data
input.
    
In the first mode, DPSUB uses DMA engine to pull video data from memory
buffers. To support this the driver implements CRTC and DRM bridge
representing DP encoder.
    
In the second mode, DPSUB acquires video data pushed from FPGA and 
passes it downstream to DP output. This mode of operation is modeled in
the driver as a DRM bridge that should be attached to some external
CRTC.

Patches 1/5,2/5,3/5,4/5 are minor fixes.

DPSUB requires input live video format to be configured.
Patch 5/5: The DP Subsystem requires the input live video format to be
configured. In this patch, we are assuming that the CRTC's bus format is
fixed (typical for FPGA CRTC) and comes from the device tree. This is a
proposed solution, as there is no API to query CRTC output bus format
or negotiate it in any other way.

Changes in v2: 
- Address reviewers' comments:
  - More elaborate and consistent comments / commit messages
  - Fix includes' order
  - Replace of_property_read_u32_index() with of_property_read_u32()

Changes in v3:
- Split patch #3 into 3) moving status register clear immediately after
  read; 4) masking status against interrupts' mask

Link to v1: https://lore.kernel.org/all/20240112234222.913138-1-anatoliy.klymenko@amd.com/
Link to v2: https://lore.kernel.org/all/20240119055437.2549149-1-anatoliy.klymenko@amd.com/

Anatoliy Klymenko (5):
  drm: xlnx: zynqmp_dpsub: Make drm bridge discoverable
  drm: xlnx: zynqmp_dpsub: Fix timing for live mode
  drm: xlnx: zynqmp_dpsub: Clear status register ASAP
  drm: xlnx: zynqmp_dpsub: Filter interrupts against mask
  drm: xlnx: zynqmp_dpsub: Set live video in format

 drivers/gpu/drm/xlnx/zynqmp_disp.c      | 111 +++++++++++++++++++++---
 drivers/gpu/drm/xlnx/zynqmp_disp.h      |   3 +-
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |   8 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c        |  16 +++-
 drivers/gpu/drm/xlnx/zynqmp_kms.c       |   2 +-
 5 files changed, 119 insertions(+), 21 deletions(-)

-- 
2.25.1

