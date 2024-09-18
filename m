Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B483697C16F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 23:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946CF10E648;
	Wed, 18 Sep 2024 21:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o1wqGbZT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D30510E646;
 Wed, 18 Sep 2024 21:39:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7osqSpCwp2bL4nD7J10Frfm/KI0HQydCo/STJQD3F3+oJUnPtiJu7aabJ5YLUebEM9zF8glrQ5CB6BeoHl4P/ZXwV9q5HIo6jWoj365W2aPjAbZxNIWYEe9bpXOdht9ZjJczIku6aLddOtDESd9QjIIyy+OtM8QSLdB4Hrvop7V3A5NvXsuTXQbCH0cS5w97lMfR1E7m5PnHvj2VXdM2iA9P5MnzPwyJxksPhfPvawMzQhRtB43g/jqwMM5lk3GYO5uiUGU6Yg8rK/w2v7IZXrJHx/IcMfo527XN5WX+cbfI6FPtc9sjfJCKKY2/1voELAmvZMYPu4q1qeW8ZLUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ngJmRhHzpwwge3wfzsziS/nzHI21vOdpGghaeANMuQ=;
 b=pjtUBbC8xJH/ik9/wRbJqfxqsXJ5z1VLhTW6wL1Ye5aPqkw0AVOLq+tvZsNeDlyNyUXsvTK2Mfyvt0VMdnxXmMGmvHBz0/hZR7a7NJ68wI5waWcD5WpPJxMCd2XMZhr7elFiddGpYfl6e7sVhEyaUSE/Eel1TpC8XNZIHTtcy1/yNCiX/Hd6Pt5aXILHmtacrc3ReTEYbTPuxQaeAcJqYTo/iJdDgg8ib7xCcSg+GFZw360Tv+hsif00Hbmdc9BkcDaIElQby75oHPcQDn2nqrj39PZHLNdsfgNxGGVQq8IpsfIT33ScmGtgDd1MLB2yXJ5AOX/CCF4Sswcb7Q62UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ngJmRhHzpwwge3wfzsziS/nzHI21vOdpGghaeANMuQ=;
 b=o1wqGbZTd0BkMznHnGWKFERu338bA4Zblh3wbaYPA5o8N4uMJhSMM2uK3jaqA5tLPcEnGUiiWuurNa1JQIW8q+BBHNhrk4s7AXEt/trIuUVMmyHZ6e3hfOoZXMAKMKzpmiud4ukfQNTrLDXgNaaRi8jFhVvt6soB+7/1gYjPRIs=
Received: from SN6PR01CA0031.prod.exchangelabs.com (2603:10b6:805:b6::44) by
 SA0PR12MB7463.namprd12.prod.outlook.com (2603:10b6:806:24b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 21:39:11 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:805:b6:cafe::a0) by SN6PR01CA0031.outlook.office365.com
 (2603:10b6:805:b6::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Wed, 18 Sep 2024 21:39:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 21:39:10 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 16:39:09 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Hung <alex.hung@amd.com>, Alexander Deucher
 <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
CC: <kernel-dev@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH v7 00/10] drm/amd/display: Use drm_edid for more code
Date: Wed, 18 Sep 2024 16:38:35 -0500
Message-ID: <20240918213845.158293-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|SA0PR12MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: ee191818-feef-4f9e-bdb9-08dcd82a5504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dZ0Z3BczbxcGH4XYAZLLaSe2pgSDtCuST73UosPen+k53ecY0B+p3aiY6W9U?=
 =?us-ascii?Q?Xq0gRkMhFdbiXnwpvbJUZq8iC1ucTZhGeAIk3s7wBz789Hx011HTqI3Cd5A4?=
 =?us-ascii?Q?og8kt7cp/FZhhtQbXBOuDPHa59UxxOMut/ShMXAe7foWjK9iPR+wt2lXSD+q?=
 =?us-ascii?Q?r3kLBfqdM7GzOncGaknS5+2Z2r2fvxeIfnvmEQiSlQnd+cRn5GRYjvQCeEhq?=
 =?us-ascii?Q?ZkKfx96BFx6ZFgcoiiJr3u53Q1R5U1zqlAJINDN5dsU22VU5M7QfBPXD12QV?=
 =?us-ascii?Q?jHB0i8g6VeUoIXNcnU3dSeDhaYkwBWs780bgaCr87cjgwE/h7U5f2mYfESPJ?=
 =?us-ascii?Q?6qDNbyWHJWZuB4kJQJ5NRWOe66iRVgNIQ6PuFUom03jt7pbRniWXDCxx7Nht?=
 =?us-ascii?Q?xX2/aJiStobpAPp8z1UGAfhblVfOYGK160u1sbLrNABCCto0AiN6e17Vu2ow?=
 =?us-ascii?Q?qWCgBWvBZF5csAqpolLa81Ao44wxmJZHk5Gkc2AcyCiEYNf7S2j9BEIeWUUz?=
 =?us-ascii?Q?eG5/WSt2deGxBTfyhnoKTTqVLQiYblLERg0MvQE//PEDP9MX2uBGz8ryOc5x?=
 =?us-ascii?Q?mSyb/DJ1CNpKJzAULjl5vtWsib7rOdiYe5xbOXfZu9ftKz8XoIP0CWLFrYDP?=
 =?us-ascii?Q?BEsdeDRQS+7ZO7I/M+AecWhv+3SJmHzfYB3IW3E5zyfgqqgSgQMUX3Oa5HMc?=
 =?us-ascii?Q?aIfrrtbXVGiDCY1qK0LbLXY8YfAP04d6pfj+RgehywBRz0VoTxe/+/XBuqIf?=
 =?us-ascii?Q?wPaH0knkfYqAnrFMrOyyeVV7PxL9AGtmcnsYts1uq0Wlz2bncsND1tiwlBEr?=
 =?us-ascii?Q?f/1+9tr/U0l9P4I8tzmrRzLD1Pppg21wGgAVPYG6+M+BY8RmSIifONOYiNVx?=
 =?us-ascii?Q?pYSF92MkybuJciQY0Pw36251o2EWritsm8bvZrsJBBFtmSMLeldIjpuCF2De?=
 =?us-ascii?Q?NODMB+Zfyt1oiVvKHDJ8IZCX6rsmchmu4SIQOVz01hDf5i0RPTx9oxj6C16A?=
 =?us-ascii?Q?8P9+fMr3TQ9ip9m3tc2xpBZ3USNJZXzWQPAcXU1O58uV9SndImcSZAROKqim?=
 =?us-ascii?Q?vf+POvfPw8si8xVdWGwhImcaef2ePOrfOVgicTD1pkFNOgh67u16bLrklMjD?=
 =?us-ascii?Q?kESh+xsA0mgWwezC0CYb1os/EW/7cpF/lSpdSKCLUc4dxfCU3CEbhUMKMqLQ?=
 =?us-ascii?Q?quvQXAnJtZ3uvLypuFXOQAdVwpwQd7ioyWjSV84Hv4fxxk41zQ+1uw2YYXxF?=
 =?us-ascii?Q?KbPyVQtOToS0RNMvzR7w6BlrN6e99RrF2aMC8MBz3GEqE+7kxaTumG3NpGMu?=
 =?us-ascii?Q?MGqCTG40uIfws7x94v3Enr471vLGqk/i0CeuHLO/HcNjTWxwbTSVDrvllW9z?=
 =?us-ascii?Q?fmedEdKqXY137qUA1+0uEq86gtphOlukcBGTqS+8e6r4G0ukh86yybD7k1GM?=
 =?us-ascii?Q?aRl5sJDf8S4gJwSx+t7wAk7MVqonl/hH?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:39:10.5430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee191818-feef-4f9e-bdb9-08dcd82a5504
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7463
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

This is the successor of Melissa's v5 series that was posted [1] as well
as my series that was posted [2].

Melissa's patches are mostly unmodified from v5, but the series has been
rebase on the new 6.10 based amd-staging-drm-next.

As were both touching similar code for fetching the EDID, I've merged the
pertinent parts of my series into this one in allowing the connector to
fetch the EDID from _DDC if available for eDP as well.

There are still some remaining uses of drm_edid_raw() but they touch pure
DC code, so a wrapper or macro will probably be needed to convert them.
This can be for follow ups later on.

Link: https://lore.kernel.org/amd-gfx/20240807203207.2830-1-mwen@igalia.com/ [1]
Link: https://lore.kernel.org/dri-devel/20240214215756.6530-1-mario.limonciello@amd.com/ [2]

v7:
 * Rebase on amd-staging-drm-next which is now 6.10 based
 * Fix the two LKP robot reported issues

Mario Limonciello (1):
  drm/amd/display: Fetch the EDID from _DDC if available for eDP

Melissa Wen (9):
  drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
  drm/amd/display: switch to setting physical address directly
  drm/amd/display: always call connector_update when parsing
    freesync_caps
  drm/amd/display: remove redundant freesync parser for DP
  drm/amd/display: use drm_edid_product_id for parsing EDID product info
  drm/amd/display: parse display name from drm_eld
  drm/amd/display: get SAD from drm_eld when parsing EDID caps
  drm/amd/display: get SADB from drm_eld when parsing EDID caps
  drm/amd/display: remove dc_edid handler from
    dm_helpers_parse_edid_caps

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 200 ++++++------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 172 +++++++++------
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  34 +--
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   1 -
 .../drm/amd/display/dc/link/link_detection.c  |   6 +-
 drivers/gpu/drm/amd/include/amd_shared.h      |   5 +
 7 files changed, 200 insertions(+), 222 deletions(-)


base-commit: 0569603f945225067d963c8ba4fda31d967ab584
-- 
2.34.1

