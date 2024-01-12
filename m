Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E8582C809
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jan 2024 00:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3762910EB95;
	Fri, 12 Jan 2024 23:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2077.outbound.protection.outlook.com [40.107.100.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E29710EB95
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 23:42:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+rQU08PVQ0BJiFNh12goKX6lDxHDKiFj5d7RdhskFJ6A+5eptdFRBwGUUQnobf3ZZywHlpRW3zLJvqyxHYFfz4IXsNX/px2JIQZ+qAoNXHu4DFxdJwqAAHKiPs2jrKj44ahfrhKYTqceS+c8qPSHKQhS76DdZEz1LleZcLZnCO2igsKSOFJxGpg9LCjpRibpIAf64uiD7/q5GqmnLlESCF0xpYNgGf49wsaunTF+RhMEMWgjNpWybfHbofvN3IFeoYhQf6N8vwA90zb8M6nKqnB9nu8sxC77gmEq1IZIkJD592y0HyuFYyuHqgjlg5/UPZckV6EJRZ17qGae5MCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWf/8uBjRlPqQznobCoVW/pEu//iw895Li+y2SCJaCQ=;
 b=b83LKT5IdRtOXLLqRhw8m4AndmpOjCcajSHvhG/5kILloiasnbAvCTpJvATN/7YU/J2L1U1U4gcxJnVM4Ow8FTSscqzwb0/IqhPSiLqWLG3FGsCxztQuLpkv/zWObrkCmCkNCr9jNWiIfesb6wV4aLqCJZkC2qgQau5QU5BymXn0hj7CP+EcmRUenaiHEwx0UCdw5UjcH0/KfPJy2s2BBSN8ns+QKEGgrleSKpHQI5Bjo01V8OCZvWswATALBtEmdaQOo4BYvlv9QruXcrbqMoq8Q7QEoyMKIrbCOVK4pSqUM3FkTT6YUnYAD5sH87jc/aA63faJF+PSpKDIz7gOPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWf/8uBjRlPqQznobCoVW/pEu//iw895Li+y2SCJaCQ=;
 b=Ou+EdePnONuTMLVxve8j6+pJa9JBBXsVVHF0CO2NMGTExY8YnSF5Q+7s2zCk6FueBNL4uOdeIhsSjdWH3Qjnp72wHhy+QPnDMJ7pMLAxTby4GDvj+rjkTH5k/R63rsthCiRJ7AL5h1Z3h2LIS5kObIUIcJ+PvP18j+DxR9FQDCg=
Received: from SN6PR16CA0048.namprd16.prod.outlook.com (2603:10b6:805:ca::25)
 by SJ1PR12MB6362.namprd12.prod.outlook.com (2603:10b6:a03:454::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Fri, 12 Jan
 2024 23:42:24 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:805:ca:cafe::e1) by SN6PR16CA0048.outlook.office365.com
 (2603:10b6:805:ca::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19 via Frontend
 Transport; Fri, 12 Jan 2024 23:42:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 23:42:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 17:42:23 -0600
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Fri, 12 Jan 2024 17:42:22 -0600
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <michal.simek@amd.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/4] Fixing live video input in ZynqMP DPSUB
Date: Fri, 12 Jan 2024 15:42:18 -0800
Message-ID: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|SJ1PR12MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9f8137-7455-459d-f957-08dc13c82099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BBkfDItSvDPknROhMRLKDdLBSs1SSqRqo3QMYmZGlHhzt3xoALNQauiSisaQptXoQk5shIg3Pyb9m5nOpOJ2GA/XagSZr77xafJSi3ebKZmQsjZB1tPsL7YyhcpqIaJInBRnj617UwI1nqBJLtYBDosy/yQmBw6WbBeC6fKS3FSzxSR8PSHoH2G7UgwCBZENQ+E5B29875aADWNjBfLns+YroIEchLnW4DHlIa0v48GTI4Oo7ya+7obLpWgb1owUDS3rV+Ixsq60nMn7+QAzzWrCAQ5stX2K7BVNBPdEQpJmRdIx7eZQvFWC2/U6vAuMDnS/LlIQBUma5fHLKKvHaNc8kKxq7UtDeI+cN08KMTmEpRh5K/lRACKil1YOooLbju3ZW2wuF29r0IJWBdO+ngqp7d9hLBUsFoDZhObD8zLL3x91lUtCF0lWO6glsq1qgpqm5r4pIWzcDmyD2QH+3yvUJHMcB6M+unnAndffdTjs9JKP2D8EuRC2Dpuwr6VjB5sPKy9IOWv3F4mx7H811kBD7iDCMEjEClvH0VVNLXRsPpviwxDaf42SCui+cU7K3RugE0Tbs+He2yjfzGHVLBc9EOXvd1dpoCjKP57eB2pAiB1TqfP4Ct+8zaJHsSuxopUXYlZQ/5xjXdw0OZQrSGb6R4CmVK5geB7QC71oXA2p8jTobTN4Mz535swnC5Efs0lyOayElYPjj0wxhH2ia5I4qpDlQmbOx+8sdMV297scM8+pYszfn6JpDpzKfCIMzlJyqHFx1o/+fIR7J/DwcqSbj+OWsvTec0cmrLCj0Fp6fIBYqkZsMl3/r6rExFuUOzjzFoYYZcZrFGdHdWJUQw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(82310400011)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(47076005)(83380400001)(86362001)(81166007)(356005)(921011)(36756003)(5660300002)(36860700001)(8676002)(82740400003)(2616005)(336012)(26005)(1076003)(426003)(70206006)(478600001)(6666004)(316002)(44832011)(70586007)(110136005)(4744005)(2906002)(41300700001)(8936002)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 23:42:24.0491 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9f8137-7455-459d-f957-08dc13c82099
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6362
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

Patches 1/4,2/4,3/4 are minor fixes.

DPSUB requires input live video format to be configured.
Patch 4/4: The DP Subsystem requires the input live video format to be
configured. In this patch we are assuming that the CRTC's bus format is fixed
and comes from the device tree. This is a proposed solution, as there are no api
to query CRTC output bus format.

Is this a good approach to go with?

Anatoliy Klymenko (4):
  drm: xlnx: zynqmp_dpsub: Make drm bridge discoverable
  drm: xlnx: zynqmp_dpsub: Fix timing for live mode
  drm: xlnx: zynqmp_dpsub: Don't generate vblank in live mode
  drm: xlnx: zynqmp_dpsub: Set live video in format

 drivers/gpu/drm/xlnx/zynqmp_disp.c      | 111 +++++++++++++++++++++---
 drivers/gpu/drm/xlnx/zynqmp_disp.h      |   3 +-
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |   8 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c        |  14 ++-
 drivers/gpu/drm/xlnx/zynqmp_kms.c       |   2 +-
 5 files changed, 118 insertions(+), 20 deletions(-)

-- 
2.25.1

