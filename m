Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755FBA225CD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 22:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9090410E1D5;
	Wed, 29 Jan 2025 21:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FU29nrzV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8192610E1D5;
 Wed, 29 Jan 2025 21:30:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdP0AumETsUromuB/5slUhYD+7BoB/RyzsCcggM1YKst/yy5/vMmt955C3RlTzDiVGsk8/N4lx3UskDL08WQT5X6qXSnHZmPZfhmDBYDfi1SGKhhGw6UBvX8KOWOkN5A1dRcydQPpxfV6LfftA5+6UaIESsT4Q3hLysoyoYLy9Zgfp1Ejsllhd4SENMV3QHCzE8h3yiRZ1It8zeZaiC+e9gR9V5X0Hp199NUwG4HDWyIKSxthdW+4fw1YvX2V/zYtcCq3lV40kzn6vzRsFqn5gckqIynNOrtHtIGRoJMA6fHw4dI81Ta/8SRwZ08CczYQT0sZzZqk4zmazD3AjITLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CoIRnpF2nnHny3vPMXCDWYGJ64A6yODOO06hLIBK8s=;
 b=rIZUJfRVgoG/7MegZ4LpSYFw1n0H3d75giQyO98aP9GS9v4Eglh2nawI/gdpGxUP0+VtsMzT/vQbu99D1v0nd0vtbHzebNJKLw6JQ71PsMOFjOHNxdu8ZNu4k6D+oVlM6WRclOiMV1YMM5C9vgUh1bLDW6Owd85QQycyL0NjuKQ2AOhP4htquAj7pQ51v6WdQdGSB7KXNSOnOfj2uVcXL3vEYhiqzlGACoKsnCjQKyNVmLNqHXYTpkZqAkygIrHcxAD4hPXqFC9Qlnix9AAi94h/eV8NIZmPsHDaL7FWPDQ4ViR+3H3ifUAoawHM7yKEgZdJw25+2XkGHNK8rJWlyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CoIRnpF2nnHny3vPMXCDWYGJ64A6yODOO06hLIBK8s=;
 b=FU29nrzVd19lXsT/0fpSCm9i3h8RcGfXng4xGqANTLd5BkU65gGQ+vQGfyt1zCl8FsmaTLNXVgxmlkyT8JIzwZWenrP5RbEbhOXTtW+0kQJc+n9jXtsYKUdYlP3fIaC4mIX0ImuuR/IXdr3PM3JHxoPSqi5owwtMkghyHEODqLA=
Received: from BL1P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::29)
 by LV8PR12MB9408.namprd12.prod.outlook.com (2603:10b6:408:208::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Wed, 29 Jan
 2025 21:30:53 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::50) by BL1P221CA0016.outlook.office365.com
 (2603:10b6:208:2c5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.24 via Frontend Transport; Wed,
 29 Jan 2025 21:30:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 21:30:52 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Jan
 2025 15:30:51 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.14
Date: Wed, 29 Jan 2025 16:30:37 -0500
Message-ID: <20250129213037.3966625-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|LV8PR12MB9408:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae32f66-cd3d-42ea-b235-08dd40ac3539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TijGbOwYC0V47f4Xc/i4gaelkrs/lAMhsTTEwSfvmaMNnsiY3YBQZV5gkiE3?=
 =?us-ascii?Q?jbWiPNqBeB8HNynYSHB5M9I7G2YFlCbwwOlT499a/6WidAHZ94Y2/k3G89Wx?=
 =?us-ascii?Q?P+jwVsZGuArkSoMpRW8Mti2UnQx+H059JrmVnicusv3LWCw+eybXRUb+poxY?=
 =?us-ascii?Q?U2Wt8Fr82GeiJJXj0tlBOYBw+vVQXIBBpoisHcThJYuC5EW64ns/olw7x4ow?=
 =?us-ascii?Q?rROp9WStdVEtdk9qcGAO3nQBM8X9UbHYZxWZnKq/kE1Lt4XkrmpWKT/cmi1W?=
 =?us-ascii?Q?9Ry1H4vyVOXkLL1bFJgO/6xzxrx8zYX2useaUsG7drY0h9AZrxH5XTG0c3Gc?=
 =?us-ascii?Q?KZOlwV68JzJ6/DdVQdNXFlPCuMD87SAglsv45oThXB7b6XS2m4NrJtvyurH+?=
 =?us-ascii?Q?cUBmO2stBcbFtE6jR5ZgnzqFndPBc2BY1aKLHD+mEtEQnct4z4zKnEILBsHP?=
 =?us-ascii?Q?iLhWCkp8D7zXljTE10AobCIE0cvmVAa6nctmMxTrMr20fWyarM3EfjckdwNe?=
 =?us-ascii?Q?4hliW9AWQ7XBwIddwSUzLtgMhnMsol/DMlfKKJHC/9omBnL4x5XtB/hsOExR?=
 =?us-ascii?Q?O2x0BpS1fpfv820coOuzrvrJio30ayzyLyIOndxKMZK/T3/czjWJ/asGEsDM?=
 =?us-ascii?Q?hGZ9XQBtU5ZDnC2c3SUVI67flx1wtvEkrFlgD6SowquepSmdu66gYV/uC8ve?=
 =?us-ascii?Q?xUxTXspHRHX1KtybQqxCDVZWcD6uX36NDuF0Usu9UuP0bxBOzQFruxYmC8X5?=
 =?us-ascii?Q?RJKxrx7PODaYxW8nhUK+yIh1tFEc0+IZDgVmx6loQmVCLLhv/BG9EXeGFhMx?=
 =?us-ascii?Q?BxowmoXwfqpdm1I0wA9R9K6ryay3hZrJ2h0XTiQM+aCvEkjZgAUBZCLCXHaj?=
 =?us-ascii?Q?aFnpUOkkSJENKLnzwdnmsWV8pomOa5pYtaTw/rNEv1c3JDx0tziHXv9+U5uu?=
 =?us-ascii?Q?CNrN6dcXUwWujPIAA+mktvrSPYzInGZSMVHVH+zLYQhJ8DBBlgFa2bLYZq28?=
 =?us-ascii?Q?KPhRHpKvHb64jKEyZ0f54utu/esY5dABZAlNDB8I6z3ReMnw17kIRVoR6u7B?=
 =?us-ascii?Q?gHqPV72zK0Ybu8FvBZHg0YmvIO0e7JCjsPW/MaXdKbRmRp3onNcn50rfBoM8?=
 =?us-ascii?Q?sSW5EvxhLMlZnUoOiQwr2GbrncoLygLb+kM7ZVWUjT6pIrpPRNRi5IMGte8/?=
 =?us-ascii?Q?ND6ef5afvNM7Ct7whqB7BXbqHQ5RaP+606kHeYWXkUKaUbJ6PWjBz8IDSefs?=
 =?us-ascii?Q?clrb9quyGgqlMMyQAeqMavBMNvZ6NRt6nruoR0CLkTA2pXkCBPLKZl4dFJ4Z?=
 =?us-ascii?Q?0KsfPsgt8d9clsvpzWumsxEQnVlV4KmuJ1N4ex+HvcJuoqWR3zMkdjmsAW2U?=
 =?us-ascii?Q?6dVvYI/sR8pc4gGKgNZ6EaWc70CuM3WMzyQQhe9O7DSuzvqj8EVRrLQAeh+u?=
 =?us-ascii?Q?zy4KVVK0YUE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 21:30:52.7379 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae32f66-cd3d-42ea-b235-08dd40ac3539
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9408
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

Fixes for 6.14.

The following changes since commit 64179a1416e1420a34226ab3beb5f84710953d16:

  Merge tag 'drm-misc-next-fixes-2025-01-24' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2025-01-24 17:06:06 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.14-2025-01-29

for you to fetch changes up to 7f2b5237e313e39008a85b33ca94ab503a8fdff9:

  drm/amd/display: restore invalid MSA timing check for freesync (2025-01-28 16:26:13 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.14-2025-01-29:

amdgpu:
- GC 12 fix
- Aldebaran fix
- DCN 3.5 fix
- Freesync fix

amdkfd:
- Per queue reset fix
- MES fix

----------------------------------------------------------------
Jay Cornwall (1):
      drm/amdkfd: Block per-queue reset when halt_if_hws_hang=1

Kenneth Feng (1):
      drm/amd/amdgpu: change the config of cgcg on gfx12

Lijo Lazar (1):
      drm/amd/pm: Mark MM activity as unsupported

Melissa Wen (1):
      drm/amd/display: restore invalid MSA timing check for freesync

Prike Liang (1):
      drm/amdkfd: only flush the validate MES contex

loanchen (1):
      drm/amd/display: Correct register address in dcn35

 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c                       | 11 -----------
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c        |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c       |  7 +++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c            | 12 ++++++++----
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c           |  1 -
 6 files changed, 16 insertions(+), 21 deletions(-)
