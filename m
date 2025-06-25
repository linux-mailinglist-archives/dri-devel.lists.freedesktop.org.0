Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740C1AE87C0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 17:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8A910E75F;
	Wed, 25 Jun 2025 15:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EnwobGzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C3E10E75F;
 Wed, 25 Jun 2025 15:17:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDZ/K04uxo2LVfMe6VyXEO4n36XaiqO2otd44kNyw4021HH7HAgFZ5PLY2FtXjuL+TcDjs+b+DvdCXnuFleHpG1sbyOGRrqrUvUiZfxkKgauvWLTHF1H7CUQP7H82e+cPR5aTfzafepg3KU/TD8j1Jxq2EbcELBq28kS7WBKeREkuLOuNGCM3MoDb/Jj97ZTNz+3yCOvnzPfIJfG8MKY3h7zFnuJ4Tma/P2JvR23ol9RgX/89Qxm1o99A/MellsnjiZSCbrhYQPxIh49aozo1voTshQ/F/F6rQha6nTad1oeSdf/XQjoU1SclDNzEUQj/BX0ZuiRjrJWVm1MgUudOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blWWtKfazpF0+41LEHcfOqdC/ACVxI50eadIRjD9n+Q=;
 b=ktqNOmjexk2st6JOiiNHlV2ovETuhfpQB5ZQiNDpzw8IMXvkzCjap8gM0pR64OOmikf274Ks301LC9ms3bIzqjb+cygOL92tr62aQrOmAqrKwm696ozswJWJGbfJiYiQnA83CCJRCsiZ5fewvn48lrQRpzwgtoA0PBWWH5MHblHbYljbZc7m7A1OIKyvT7l+REZc4DWR9Wc8CrR7kuGCQdv/TNpCa5j31cl7jNPUDpIi//pPkh6LS1ZWPlECL14ZoLq1klro0/CtDz6nGYJ706vW90ACsdnpEGyCe7yFr7gn7xYog1DzvqZzwlCy4NijFDxiYKVnou97wB2nrLzygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blWWtKfazpF0+41LEHcfOqdC/ACVxI50eadIRjD9n+Q=;
 b=EnwobGztiGwtW7UrE/SJ7HuNqncIQge9wVtEX/vyUm8LwVrHJbWy+HAfe2EheuY81e/DE5Ea1CW/2BvN0m7fuwL8hlOj5pIZ+FqsttWLG0Jp8wzvGdbPbXa3AqMHTbfmXtaayn6MjVDqHleq0kHtEAEQzag/VJPw3Tdf4fPV3ac=
Received: from SN1PR12CA0053.namprd12.prod.outlook.com (2603:10b6:802:20::24)
 by SJ2PR12MB8808.namprd12.prod.outlook.com (2603:10b6:a03:4d0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 15:17:49 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:802:20:cafe::2c) by SN1PR12CA0053.outlook.office365.com
 (2603:10b6:802:20::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Wed,
 25 Jun 2025 15:17:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 15:17:49 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 10:17:47 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.16
Date: Wed, 25 Jun 2025 11:17:33 -0400
Message-ID: <20250625151734.11537-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|SJ2PR12MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: 28887e83-2531-4447-d777-08ddb3fb7236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TO4K5thGfowzVc1RuTGwbyhCRPoKc7qNoL7EtYhB+w0FiUkoawxpQI67xC82?=
 =?us-ascii?Q?OGcDAQMeR4rkbMPgMwOeq+nGbaVrtXD1QoJOTC6+3bCRwjINkEyKHDIgOL0p?=
 =?us-ascii?Q?pSuWe+bTw+AY+zVBVhaqvFgEkgWIA1ocxqwHCF0fp8KFBXc+u4owIeSTy3Ik?=
 =?us-ascii?Q?/YaN7X7fb3t4ReUQv115L0FfpAVnV9UUECQyUJ30ixy8HTtVwXnVjey5dgIJ?=
 =?us-ascii?Q?35WTeQNU93qdEWUEHnD6TnGLGUmLUFyY268F/pO+xpZICGmdZWr0Y7Bh42PJ?=
 =?us-ascii?Q?77eAKjm1JGvisiMkka4tj61ZGrH8r4Ain3vouL9nL8cwIvJxi1LJ2hFg5xPK?=
 =?us-ascii?Q?0j8eRyBiH6P9rdg12ZhR+l5/CxijwpWPyCmFuLT8AZNdavGunDVXoFqAAHH9?=
 =?us-ascii?Q?y2LD5XqVSY0BRV2kLX0Hmt92zk5I9jgZhhYtRH7Ym9WXAN7xxxg1tuiBEMSe?=
 =?us-ascii?Q?0/t26u6cB9qM8Yl/VEURuo3LRxI5ZHZRwqF5UKkM5ywJKOTZ5KKYsKQNXqy5?=
 =?us-ascii?Q?3XR4VbqgvCSOSQrNCqf2tHq7amzgOccZPe5lm5gcGaoQk1t/LuzjB06Qyibm?=
 =?us-ascii?Q?4omZz5cPy6TjzyTDdVix9jQofZYkcPKDg0qNHRcuxGYdILh7iWm1gW8pG3oa?=
 =?us-ascii?Q?t7efJNwWAeMRR32eTKuSayYO62o9KF8VpwjXYkEfAbALWuklqwaf0nx5UWXf?=
 =?us-ascii?Q?8mGAAETlczK0FPmdzJB+Kp5C/QFqV4GqueARSnT7zW/zsHHPXMbEm++51q8k?=
 =?us-ascii?Q?KGS9BUSQbdg1eq0Yd6qN5miz7GgZBxmpb/nsKoN3a3CQpJNEPCnEE3hUUC3w?=
 =?us-ascii?Q?DzSDqkvtVi578TrTEPZo4xF8TdUgPPmMMDPaHZjzJePU0sbUQR4oQRUeoEB3?=
 =?us-ascii?Q?XS5vPiXOrbsyn6jjeQkB6cAI7JUmjSiSkvoO6ok4MaxijQyXzyYNdIlb/igh?=
 =?us-ascii?Q?HZmoijGp4wwNI+iPrUwjBf+sieHO7Dt8f6c6nt9igSQ4VVv86pyHu4QVCH94?=
 =?us-ascii?Q?z6F3isJYnyJVK84UUuA5BEmig8CrQyUcCrjDkkf6pSjcVQ+FkgHlSFMLdZJ0?=
 =?us-ascii?Q?G1q4sIDs4BTfGpMXwcFIO436zvf8nhGyxng49gPLu/SvcV1ccKNrZniwbGO8?=
 =?us-ascii?Q?04ll6RlvGqgxVl7egdPcNOKqFFlygpxhch9mys7YtAouB6HH+BBzJ+tlE2bF?=
 =?us-ascii?Q?gUQC/tT5bzuyfPDZ7stLgfApZLXQfBe2M6wsaAQMWQ/zhZvHW3Q0LCUlCfws?=
 =?us-ascii?Q?WFBSqdUCgUm+biFcGSifin3s3mjnxbl0yYHdAHMZ1MomPC9AZaG0AuUR1Dr1?=
 =?us-ascii?Q?0B4IlEF3e3lPQRhCMiAJrG0f02qg59Dy7B/R7ijgu2soCRSaXVhw9e6ZoQAE?=
 =?us-ascii?Q?mLCSKcFOW/q3Ar9OOSiG3YU8J3bIwJgvipT8ksTc603eTplReQyWQeiz5mcg?=
 =?us-ascii?Q?kDb2TR9CIGE0JvlqkUGTmKH5T6xtfpTLvmjiYZiGg6zN8RrJBWCLrQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:17:49.0194 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28887e83-2531-4447-d777-08ddb3fb7236
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8808
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

Fixes for 6.16.

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.16-2025-25-25

for you to fetch changes up to 6847b3b6e84ef37451c074e6a8db3fbd250c8dbf:

  drm/amd/display: Add sanity checks for drm_edid_raw() (2025-06-24 10:39:24 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.16-2025-25-25:

amdgpu:
- Cleaner shader support for additional GFX9 GPUs
- MES firmware compatibility fixes
- Discovery error reporting fixes
- SDMA6/7 userq fixes
- Backlight fix
- EDID sanity check

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu/mes: add compatibility checks for set_hw_resource_1
      drm/amdgpu/sdma6: add ucode version checks for userq support
      drm/amdgpu/sdma7: add ucode version checks for userq support

Mario Limonciello (2):
      drm/amd: Adjust output for discovery error handling
      drm/amd/display: Fix AMDGPU_MAX_BL_LEVEL value

Srinivasan Shanmugam (1):
      drm/amdgpu/gfx9: Add Cleaner Shader Support for GFX9.x GPUs

Takashi Iwai (1):
      drm/amd/display: Add sanity checks for drm_edid_raw()

 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 28 ++++++++++------------
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 19 +++++++++++++++
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             | 10 ++++----
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  3 ++-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             | 19 ++++++++++++---
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             | 12 +++++++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 10 ++++----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  4 ++++
 8 files changed, 74 insertions(+), 31 deletions(-)
