Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43A9CB7135
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 20:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8382310E155;
	Thu, 11 Dec 2025 19:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4qldqaBD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010012.outbound.protection.outlook.com [52.101.61.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E9710E155;
 Thu, 11 Dec 2025 19:56:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbgKA8rDf2iNDaPdZAvzlvP7VCL83g2Tc0Wl9QCPqXdFXN7l2ovbe/Gu2Hh8rwcmxcGs1Ag6FduZqPR5Ja3/EN352bwHfXJbOn5rCUskatRRWCKliJCmoHxSP+4JdtmlEba6YQZ+CRsCijZlOGL5HwSm8PWTAB85LtJ88qGTX6GQ29l752UlHfQC9MrMvndesGzAgTB56TGyg4wlaRDOfTMNdfRw2L8e1fGXZBIKIt99dqmZ1JW1Ri+f/3eVhyIEkIQNaUAZm+7CfKbsWf1JHEwu+D8igqvwN8ndoeb6WV71l1JHErTMAVhP97Xvp4xCNMS2ZTAWRjaLA7bu5S3F5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwWxu+vUaisMmI2WP8AM8TfFOPjplrGuuFOG18dMe5A=;
 b=Dzdn7f3k+OHFROT3rXC+jkr0L9rnEWLmZ0WVFwOfFh57FXEo2zS8w3YFnyej5Ci2z+7V89XviFboyr0K7MVaUa7rrse55aUD/86qxgbm98+qLZPGrtccmD3I8DrzXtAnAaBdEaeHNofjAuIzdjrvyHMwgQyV6H33bFRHdeiNfgMKxKL/xGJ6upNmwdHellAlVMBu9TbkIPElaU6Qqn0snMnrmJ+8I/DEEOpyOhsqmor8e6zokdV7vI+wqAR3C3fYPtbfN1J/i43GLO/vc19UzXkBfOHvQrimOaCk/l/XMsHqS5JgWjxZhQdDNBB0z7H1KMcNOHJv5uYFo1AFMgccvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwWxu+vUaisMmI2WP8AM8TfFOPjplrGuuFOG18dMe5A=;
 b=4qldqaBDn4zJwqhcK/aESIEaS/FdDm2Yw8Ur9L4yZPl06MDMzA/4ITt8fhqU39PWyZCHmxl5YFONV9vmSyhIz12GGyy5VKxCUgONoaPHkTuudK4gpKZNgazGqth3veYiCCs/stt0G4rySE5kN1DhIlcrwABjyeY874Y4kkcv/v0=
Received: from PH8PR02CA0024.namprd02.prod.outlook.com (2603:10b6:510:2d0::16)
 by LV0PR12MB999092.namprd12.prod.outlook.com (2603:10b6:408:32e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 19:56:22 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:510:2d0:cafe::fb) by PH8PR02CA0024.outlook.office365.com
 (2603:10b6:510:2d0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Thu,
 11 Dec 2025 19:56:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 19:56:21 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 13:56:20 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.19
Date: Thu, 11 Dec 2025 14:56:00 -0500
Message-ID: <20251211195600.1641924-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|LV0PR12MB999092:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e4586f6-add5-4f54-c695-08de38ef5b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rpkjZEjZnrY4yNjIiOamdgS5dSG1LIbwO6dfejYrcMXAayCoLqi+MCk95NxQ?=
 =?us-ascii?Q?ZMzss8agZchD9fxghq/pqkYx5dFAbdQrmgZiNTK1wfgZXavl072nM1rbDH1b?=
 =?us-ascii?Q?YqJ09UFaw2BI6QPjJyjExCYY9aYudSZd9NDRd4O3a2Sng4vZ5ePBBzKQ6ue6?=
 =?us-ascii?Q?RPTmw0hhWHucCXi1ktwwkdSfpxDc73b+rWR21RA9AATonsKcC5P2qLzSym7D?=
 =?us-ascii?Q?JLg6Ui5cFeMNhehkacwEOYcfkidG69n15tkSoI+VE7Dd08qWw2UvA5EIUjOI?=
 =?us-ascii?Q?UG5nnFEflde2hhP4qAp5s1DYet9FzP0oiqUTYpQQBus/sOr1pKJ+9b9zd+e0?=
 =?us-ascii?Q?LAgub2H3paLqMjwoYPcFURlQ4q1ZMJhuA5X1x28P/tnpFQCkxWrtvpk8AVd5?=
 =?us-ascii?Q?3qmKDjTfqhyKkudPTtAOCpheRsLr3GT+frO51pChyxK/iZPPkAEyCYaRYT0x?=
 =?us-ascii?Q?Dhnk1KUbRywdn4Sus88qKnXTP9ktK3lccN0mjscHzHKhxiLjOUa5G6lvQBko?=
 =?us-ascii?Q?WBY9t0TZKoJx3YMAdpJ4Qrnr94FYWmPvtnUhdbOT+7gH/dNh1x+7Dg20t4EK?=
 =?us-ascii?Q?xaE9Nh24iOFAmXwwpd0vZCMdywjC/sCXVPeaOougQq6l+Hr9IM9j/aomhBWi?=
 =?us-ascii?Q?EjA0M+3y/XSr8ACkNrCoGm7MbfccCD3TbNyUW31/aU75uDLMuorJSTDTyscs?=
 =?us-ascii?Q?rtjVYt7WCqDb34KYDe+V7pRssKWzlxgDAbBaG5tipZ5xy2J6783tgJBl99qW?=
 =?us-ascii?Q?mGm4V28Vs0yJiZRBuiB7+5rAenGoVG5YDIlheTAKIsWsTgKqcWvfG4dDq0A9?=
 =?us-ascii?Q?7FykFgqVaSV/iyr3S7zlwmOILEDQKO0YQiQOHFFksgPdLQ9YP2hjWj0XrYsj?=
 =?us-ascii?Q?oZKAUMXsa5fmmeywMXSOMREEMnLXAFsJBG7GQAqsueDOary9oWF6DajNiRRh?=
 =?us-ascii?Q?epz6C7rvbSgA5BMBH3kCYQZhh7rJdoHLyokZQaF0sa6ViOpplSWNAilU44m3?=
 =?us-ascii?Q?nRcwNXKSFGkq6TvkFKpc6bGSsnBtGmRRHcPP4ZZvuGcCN5vc+OyBqniBqZPi?=
 =?us-ascii?Q?9dBAJTmR/MKpULXHFnyn7lzR5zhmuzNSWdy0ewR+X1PCOImYM56/sLyBSlzV?=
 =?us-ascii?Q?YtvMhhdNz3jksuQIvgGysOB/yPY5ahgLuJQI0oW7QfY/d1n5FaM2oB0+Z1vi?=
 =?us-ascii?Q?CYWyt41zCFA+e1+eCKWJMsqzyJDnTxYGpn97sPYjruWxYOblOSh1rbEeytod?=
 =?us-ascii?Q?0BUzQ+mWC63wnUyoH9Vf8aCZ6EzCosSHYLkvqc+k76ojMz4PVwcg6wzwvAyA?=
 =?us-ascii?Q?Nx4fd6oI57I8WoxamLlcbad4K7Pgp5+qCR/O0Kjt/ISp4s3sAfSceNchill5?=
 =?us-ascii?Q?FsMe1RajLPXL+7D07WeRJLjjLteTC6mN74zpIujdzTlm1R/6+36igJloEyZQ?=
 =?us-ascii?Q?SjCoSG/IavvE+ypqCA7GBmUAILlfe0f05xR4D+B5pkx888Tz0wbZ9eCIJu3M?=
 =?us-ascii?Q?9feOsEHFuON9Zr/Z85cFTSkpM2kN1QGWGYm8?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 19:56:21.3995 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4586f6-add5-4f54-c695-08de38ef5b64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999092
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

Hi Dave, Simona,

Fixes for 6.19.

The following changes since commit c7685d11108acb387e44e3d81194d0d8959eaa44:

  Merge tag 'topic/drm-intel-plane-color-pipeline-2025-12-04' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2025-12-05 10:27:57 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.19-2025-12-11

for you to fetch changes up to 72e24456a54fe04710d89626cc5a88703e2f6202:

  Revert "drm/amd/display: Fix pbn to kbps Conversion" (2025-12-10 18:06:16 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.19-2025-12-11:

amdgpu:
- SI fix
- DC reduce stack usage
- HDMI fixes
- VCN 4.0.5 fix
- DP MST fix
- DC memory allocation fix

amdkfd:
- SVM fix
- Trap handler fix
- VGPR fixes for GC 11.5

----------------------------------------------------------------
Alex Deucher (2):
      drm/amd/display: Use GFP_ATOMIC in dc_create_plane_state()
      drm/amdgpu: don't attach the tlb fence for SI

Alex Hung (1):
      drm/amd/display: Refactor dml_core_mode_support to reduce stack frame

Ivan Lipski (1):
      drm/amd/display: Improve HDMI info retrieval

Jay Cornwall (1):
      drm/amdkfd: Trap handler support for expert scheduling mode

Jonathan Kim (1):
      drm/amdkfd: bump minimum vgpr size for gfx1151

Mario Limonciello (2):
      drm/amdkfd: Export the cwsr_size and ctl_stack_size to userspace
      Revert "drm/amd/display: Fix pbn to kbps Conversion"

Mario Limonciello (AMD) (1):
      drm/amd: Fix unbind/rebind for VCN 4.0.5

Rosen Penev (1):
      drm/amd/display: shrink struct members

Xiaogang Chen (1):
      drm/amdkfd: Use huge page size to check split svm range alignment

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   2 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |  62 ++++++----
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm |  37 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  46 ++++---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   4 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   3 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   8 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  59 +++++----
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |   2 +-
 .../drm/amd/display/dc/dml2_0/display_mode_core.c  | 134 +++++++++++----------
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   3 -
 drivers/gpu/drm/amd/display/include/audio_types.h  |  12 +-
 14 files changed, 239 insertions(+), 138 deletions(-)
