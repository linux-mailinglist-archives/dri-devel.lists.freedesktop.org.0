Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B76832470
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 06:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63C610E91C;
	Fri, 19 Jan 2024 05:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBAC10E85C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 05:54:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRujc5Ftm1prXFrjjEaAM5Xu3R9YTG1IZZZyqJybV6JyUJDuRJzaKS4oHhjIo889YAtBDGieyV3fwOouhsAhmSdMOsJNt+2P/BxblszI15sJkajd7AiS/gaeYfLbaiyT+5iYvsQRZkQEh7lOVj4KzmabMq7gGhBQV2aVRUgn7NUaVYAd+8iAqPt1IpAyd1trXq8DhlF7kNILy+4xN2s74FRN08ayDSP8fDuwHrg4pT6gLs1Qfb+yq3aGhbv3SZvQ8KOPJD50qhPwnmkfn7ZaeYSDdBggSLc7s8pJqNUhb0ogMvfxkM/UgDepMDAE7abAHyWbgc1dAXoPoxS57Lu6mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEhKkNPNY/gcwq9DcVM5e7tty+lzGg1BCdl7549XHR0=;
 b=dmNckWunBq2ZLPWWBV8mhyrV3uBEP+A0kflnNJ9NS8EJgACIiaB+8LAsc1Vo7SShRkKqUFSauFULKC0JKrndiXpacxJ7tNBlz50tCohv2B611LMc6ZzbuDurdA9liVTQ+xYukLVw3cxqc6J+/iPHglWjB6zQvIWOcStL5hU3N3PlJUDdcOrSkfx1AWnvl/2Iv6jqHNDNABuzHKa6BpH3DtO4alr65usfONHB/wU68ti+KDPUplMbp8HgBXxwQVfHsJK7Wqrj5mUxbOmCBK1TOwrg+cmK0NpPwiX3uVAwRsiewPqOA7KaFSzUv2F9dKV1IOPAq48xjjSg8AK/bh91uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEhKkNPNY/gcwq9DcVM5e7tty+lzGg1BCdl7549XHR0=;
 b=kUjKusND7c8L7n1WHTqDEtqRyZkx+nU/wC4Ko4OfeRbfrNCIsVS4khPFA8XqKRtxW0Bc6vsm8VvqGPSFdiKPjzG6LaIgkCdT2alThqXdzr4+1vDZNMirWP6tcMXiDt6Z7RiUtqBNtSlkHMocFer1BYiUrGXQButClLc6K5ARJXg=
Received: from DS7PR05CA0043.namprd05.prod.outlook.com (2603:10b6:8:2f::22) by
 DM6PR12MB4563.namprd12.prod.outlook.com (2603:10b6:5:28e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.26; Fri, 19 Jan 2024 05:54:50 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:8:2f:cafe::d8) by DS7PR05CA0043.outlook.office365.com
 (2603:10b6:8:2f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.8 via Frontend
 Transport; Fri, 19 Jan 2024 05:54:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 19 Jan 2024 05:54:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 23:54:49 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 23:54:38 -0600
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Thu, 18 Jan 2024 23:54:37 -0600
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <michal.simek@amd.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/4] Fixing live video input in ZynqMP DPSUB
Date: Thu, 18 Jan 2024 21:54:33 -0800
Message-ID: <20240119055437.2549149-1-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|DM6PR12MB4563:EE_
X-MS-Office365-Filtering-Correlation-Id: 2166c234-51f4-4422-48e0-08dc18b3263c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EW2SGMcmjW1fN2wyTIuLX8t1q6N7kALkF53ZVHaaBJHtoAavYKOmycG3BlUom/52VE6bq1NlHl9dKG/ihWk9/kARoHst8FvALjp92Yetvwxss+zlNi1DZgkjemuJdonQZLa6/3Y3couzDSBmwa804dNm+0um8Ht+k4h3Ae+2wBDbxu388nY3M+t028T/pDZBOF2cRqq2fQ+Qlad9dB2yW1qMcKq6b36DYyBPUBe0Rpy50vJ4TTPUyuNG+Bk28WfpJGzKFwryuTW6MInmdLcHwOHHLtZhRepOv+qYvRcf8T712MBCCgD0TVjIIWd9JUtAU3ONc9zIJjdDqnpZ4PPYKkpq5Qq+PgIr5E7rgS0NMmdvkfA72vj52tptOikVjuzwmyUHBNXCjHndN6A9Gp8eEcFfLfuZE5NYkYKeVaqAHlChAKM+v6x96dvppwW9EJmmlFzTjjp6tWDlmzFgecm+cWQmX243xC/UR0rQ4quAT0fq/myVsro5quaLSG0rSGRB3ppPQc9NhvFQv6FvgSbTzW3CVCpDtR+wmHGboB/Ga2xv9Vv6sGLpyHAZ9B3QBzdo0pGiCDGyqPk53b1NBrZWS7KBz7xMbgrzCJ4SEVfCjfcksPY7VtRO0DXfgJfBIH9LjINDkEoc/SSS4HyAYlCiHpJXCGnkGZRmLrop8i+YhOF0xl7JhkzrXIZrFwnIoQyTaBZ1CfczDEL81o7VPGGRLAzp/imwoGQbr6CLL2QLgdzV0NkIu0zKbIuBQ2UYfT9iIRvvrWncYRKBW0YmiINJ8BkUObq+ELdAIXJlPxnuIX3nVUPdQtWS7CnOCrfl1aGU/12EcCAZQVsV+8Vqe7YXL8fuF4oiPaxz7yWZHEFkqINE22jAZ2Z1NOX6TFAwON7w
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(82310400011)(451199024)(186009)(64100799003)(46966006)(36840700001)(40470700004)(921011)(40480700001)(40460700003)(966005)(83380400001)(2616005)(1076003)(426003)(336012)(8676002)(8936002)(5660300002)(47076005)(316002)(110136005)(6666004)(70206006)(70586007)(478600001)(44832011)(26005)(356005)(81166007)(82740400003)(2906002)(41300700001)(86362001)(36756003)(36860700001)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 05:54:49.8684 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2166c234-51f4-4422-48e0-08dc18b3263c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4563
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

Patches 1/4,2/4,3/4 are minor fixes.

DPSUB requires input live video format to be configured.
Patch 4/4: The DP Subsystem requires the input live video format to be
configured. In this patch, we are assuming that the CRTC's bus format is
fixed (typical for FPGA CRTC) and comes from the device tree. This is a
proposed solution, as there is no API to query CRTC output bus format
or negotiate it in any other way.

Changes in v2:
- Address reviewers' comments:
  - More elaborate and consistent comments / commit messages
  - Fix includes' order
  - Replace of_property_read_u32_index() with of_property_read_u32()

Link to v1: https://lore.kernel.org/all/20240112234222.913138-1-anatoliy.klymenko@amd.com/

Anatoliy Klymenko (4):
  drm: xlnx: zynqmp_dpsub: Make drm bridge discoverable
  drm: xlnx: zynqmp_dpsub: Fix timing for live mode
  drm: xlnx: zynqmp_dpsub: Filter interrupts against mask
  drm: xlnx: zynqmp_dpsub: Set live video in format

 drivers/gpu/drm/xlnx/zynqmp_disp.c      | 111 +++++++++++++++++++++---
 drivers/gpu/drm/xlnx/zynqmp_disp.h      |   3 +-
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |   8 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c        |  15 +++-
 drivers/gpu/drm/xlnx/zynqmp_kms.c       |   2 +-
 5 files changed, 119 insertions(+), 20 deletions(-)

-- 
2.25.1

