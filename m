Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8299BB02603
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 22:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BC310EAB0;
	Fri, 11 Jul 2025 20:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LdbcZ1/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD6310EAB0;
 Fri, 11 Jul 2025 20:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIdl2ZGMeJZKRx6mqLYU4E94+UZox9u133UcP4ap5H7RJa8+nN0PgEnJIBLc0oqOWP3qE5c2LmNPqjT92J59ycCkRXXs2hNhRSoamF1Du3+0OV6eQg5W1zaIH4YzOXAWL90oDTPkWBmjqEwhNGBv8qbKK5zcIcba/TiIW8v6PKQLxoW+E/ifB+jTMJzteo6jFVhttZ92zxx8OxgiZByhQih1oKFk2ukg46RNwO6C2fktNZLcUpVcMIwV1YpTi3yFDYFerfEQuFymxkiyYfJQ8vcuyU8wf+boJ3ibikmdPLkC+mhJk74xNd8u22TdD8wBRCCGfat3/b+P1Dg8MXeE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMskUAzUXFHUxfaJTuqqC99unS+BgXqWMG1euUbnUyo=;
 b=b4ZcsD1gteKn3S2FjvaC8g58iaT+RBfxfB/Zgvb1FjG3ncFdOh2xtcZ5bWEWeliiq1ZQuL38em8QJrHye0L9OGbiRWwk/+ewOHyK+bLZk2EbNORmrIQES3SkarQ1laWwi89tvN8I5uRL4RNKO0z/oAoj7nxEHS/r1QNFvk1NL9sSI+/cEve84tNl9I6CxwbJa+E3MBqgJp4hUq3ns98Q5R0thkGdZY8/uz1GPRsuiB2NI1Ha2hlxT6el4SEMXU8Usw/7OmfCEdYdTI85Lj9xWXd+G6Vuvo7gt0z5kV7BlsXStLSSgSyYmG4bu0Dbamp079+i9hymfWkFYjlUcgcmOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMskUAzUXFHUxfaJTuqqC99unS+BgXqWMG1euUbnUyo=;
 b=LdbcZ1/6Pvm53fq6Sgk1Q/EpaprYX7PRWsk1KaAURFP1sjak8FKNVPhmSbo26aUKKUoA/8yRlReVwFboU7bNRQeKApK6sSGHJK0h+u6G0kvCdWsz/JyDfSTtp6K+WK1r8UjZgIxhqy0BJbRHqAXnGHXieYKus2MLj6mnSCCbqlo=
Received: from DM6PR01CA0002.prod.exchangelabs.com (2603:10b6:5:296::7) by
 PH8PR12MB6721.namprd12.prod.outlook.com (2603:10b6:510:1cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.27; Fri, 11 Jul
 2025 20:56:12 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:5:296:cafe::43) by DM6PR01CA0002.outlook.office365.com
 (2603:10b6:5:296::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.25 via Frontend Transport; Fri,
 11 Jul 2025 20:56:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 20:56:11 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 15:56:02 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.17
Date: Fri, 11 Jul 2025 16:55:48 -0400
Message-ID: <20250711205548.21052-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|PH8PR12MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: 678ee088-b039-415b-eef7-08ddc0bd5dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MJ1PSGPo3296dHrd9o/AlhU8s1oez6GEtoifgnUIr4DtoL0he/WKTIs5Ujrm?=
 =?us-ascii?Q?zSfEdxIdXVHUBCqcpeUTemBqOOJDvz6kiNqndQP3Enq1HTYBOG+PGKReFu3N?=
 =?us-ascii?Q?8WOHCki3kqAFKbOzDzSbziqi+DpiqVt0teTJNgNWnInJJcyQRkIS4YPW647E?=
 =?us-ascii?Q?9iedc9+asvVluWLupkaGXQBAcSkdHRRnCTklMqWOCvhKuSyagMFAXdgo7oFl?=
 =?us-ascii?Q?FCJc1CFzbervok1NO2s/YokX8/tqzWcKS6aUB+mz8vNtYAXRWhNkobkG7GvQ?=
 =?us-ascii?Q?x35lAiNuyz4kozKEYQ41HjxbgcTrPk1mmKdmpDMoeO/mT4E6QWiYplyrfOAJ?=
 =?us-ascii?Q?sbHsBFuCBN78ln/MgyP4yhrZo1jAMw3jyhSYb8js1X/IL52frVavoWngttTl?=
 =?us-ascii?Q?hl3+cuqTDIrB1lWzaMtXlAzkyYnbHG7+5N04xGh+8n68DzGqqdhQYdcWRAPM?=
 =?us-ascii?Q?vFBcjCB40F5Z6BbR0ud926xb5hkG2osDupMROVbgo7TZk4BRJtzF1C/ZIKy3?=
 =?us-ascii?Q?4kFIpg2Z2X+RuyHMrKsoMQYkPhlm1N+EHNr62o8mxtxuJOPqEFk+/GGbp9Fw?=
 =?us-ascii?Q?c8kdY46K0pyVBom1Gsx03kZxqz/JcXuySH216QwTkoQzaKq4hgh4J5KpkXeO?=
 =?us-ascii?Q?ZlDIWupHvLNMhiFiKKepivY6q9tpDNG1g5uNH8BDUy5l2jeFy8y5ybs7t07F?=
 =?us-ascii?Q?gQM8TmMM7evO2EyZsslR5HrliO+CPt76D1GTAIRV46bu27Xy3wrwFxsIuCCE?=
 =?us-ascii?Q?7gbw9iBEbu+OCurhu02O3bVQaWuTzFST1+iNJKX2uPUfrfza2j+7dVSJtgn+?=
 =?us-ascii?Q?ci0+hmBjdL1kzb3Yy9sDmxLnXGc0igNFG81/tp2xsbS8ZjnpCsWnJoJFd1SP?=
 =?us-ascii?Q?psGL2W2QqvVHiOCtxGAEOr+zaBIvFuQcOxIzkcup4VFMLlcR8jQPtv+Hv9Xh?=
 =?us-ascii?Q?B7cWfR8I1kgE31Ubu99SAzk6BEChDe7dCzupWIiLy1VDWtA+t6Er5XRf/ykl?=
 =?us-ascii?Q?+VLokUdx2Xp+6BK2KX2cb1of68/7e9t9e4AYxhffirK3b47VSGan56o2nNaB?=
 =?us-ascii?Q?uBJARIIoLBzG6kSxMCCC2Tbs5oF3oYopupgKg0XmFOaBKzM1ipE39KNy8mGd?=
 =?us-ascii?Q?PvbSFISTfTWP6OPGY2O95H8RYTJgZkugcVRoZHP32dNap4T6g1QSbtEqcdB+?=
 =?us-ascii?Q?lX67H8FXrYwmmej+ecyEZRbN0pxTmlFgs023OQwk8W7w0snj40WXhNkEiZsw?=
 =?us-ascii?Q?Rj4r6pXC4VR1A8weSHzRnoBiDJLuPOMi943Z8O8LKhMR/USLOcCLsN3ZQ/Jr?=
 =?us-ascii?Q?mRGLZeHxvS4RFsxO2ORJi8OUuP+w2PI6YrXFcn3Jf3yCfFL85ic8GZBjDoTM?=
 =?us-ascii?Q?3PgY8hS3I2hB79RLY+y4A++RylIhZNC/ll7XP7H5VWYi71xwcZ5NDoGaeKty?=
 =?us-ascii?Q?+8ugb3TKC7o7vnZS2E8DxwHCmPyksJuk50bXoJYc4tqQxTnCZGkioQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 20:56:11.2628 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 678ee088-b039-415b-eef7-08ddc0bd5dea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6721
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

A few more bits for 6.17.

The following changes since commit 17d081ef84a6f3c2a1867cc753d7c8459a34d829:

  Merge tag 'drm-misc-next-2025-07-03' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2025-07-04 11:54:31 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.17-2025-07-11

for you to fetch changes up to a886d26f2c8f9e3f3c1869ae368d09c75daac553:

  drm/amdgpu: fix use-after-free in amdgpu_userq_suspend+0x51a/0x5a0 (2025-07-07 13:50:42 -0400)

----------------------------------------------------------------
amd-drm-next-6.17-2025-07-11:

amdgpu:
- Clean up function signatures
- GC 10 KGQ reset fix
- SDMA reset cleanups
- Misc fixes
- LVDS fixes
- UserQ fix

amdkfd:
- Reset fix

----------------------------------------------------------------
Alex Deucher (5):
      drm/amdgpu/gfx10: fix KGQ reset sequence
      drm/amdgpu/sdma: consolidate engine reset handling
      drm/amdgpu/sdma: allow caller to handle kernel rings in engine reset
      drm/amd/display: Disable common modes for LVDS
      drm/amd/display: Use scaling for non-native resolutions on LVDS

Fedor Pchelkin (1):
      drm/amd/pm/powerplay/hwmgr/smu_helper: fix order of mask and value

Lijo Lazar (3):
      drm/amdgpu: Pass adev pointer to functions
      drm/amdgpu: Add a noverbose flag to psp_wait_for
      drm/amdkfd: Avoid queue reset if disabled

Vitaly Prosyak (2):
      Revert "drm/amdgpu: fix slab-use-after-free in amdgpu_userq_mgr_fini"
      drm/amdgpu: fix use-after-free in amdgpu_userq_suspend+0x51a/0x5a0

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                | 24 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  8 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 65 ++++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 31 ++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  7 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 13 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |  7 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           | 43 ++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             | 20 +++++--
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |  4 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             | 35 ++++++------
 drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.c           | 10 ++--
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             | 20 +++----
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             | 41 +++++++-------
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c           | 22 ++++----
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             | 55 +++++++++---------
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              | 41 +++++++-------
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           | 19 +------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  8 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  8 +--
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  | 11 +++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  6 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c    |  2 +-
 26 files changed, 270 insertions(+), 239 deletions(-)
