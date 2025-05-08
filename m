Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96C8AB03C7
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 21:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6D010E21C;
	Thu,  8 May 2025 19:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1HGFrFrr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F58E10E972;
 Thu,  8 May 2025 19:41:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbvAbl7LGFJyHyJ2TPoxHCVxdqHsojEFwyUltz5OjGnr0wg4PigBXQRRx8P2s8wsSyJyItbW2F6RQfKA6Bu7IHsagdrI4OXDZrXadOvDX/zvL6DcVn39pVQEPtan6BvSeKqiOaeQQtSzCmfKxTHTVP53Opir67PqTud3gpj8kCKEx/xiDKMdojB+J7fdH1HTPgop/sG6mmiiuc95xvhwoBL8Exwh8872YlEC1ibwKUXGp1McMaJ6bFzHKV392HD8H2E6CBoKcmEfWNZ0WWdxlVeKk50QY+iLdSgfoennfPJdwyNUM9NCLxaEFowtxAPamxnrE/esL9GkE8iqjV4hhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYcBo3NMDV5HjpvotO4H1C1GTkAsOBNIUepbNddapys=;
 b=Bxs+N19+B9wfwfthve8SCTDy5+4xUf0Nf57/m1O7YvHTFp2foXHVhMpw3zsYx/0BaxTxYaKANwDDvO53AjHEkR0CsqWshxYKkYvf9UkIKzjl5/XpfOPrNFJLMF5PkCKBY9JE2BStHEq011fmXDPgEQenZIBSsZkt+naLaGI0rM0NJtTNw8eWLQ4tjjBN7cMc8KbZ86tTgaQkCT3J21PsIo26S4NYkBFlcf+rRXS0ZtOKDJzQDkM2rj5QT9Waw1UQwym2hLv14qFQW6ckMknG/xMeVdEgQJ8zXciXygz4AZ91nqYQWInPuhsHgfTPZ9HOhR/9FUWCweqVQaiRCiPj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYcBo3NMDV5HjpvotO4H1C1GTkAsOBNIUepbNddapys=;
 b=1HGFrFrr6Q4TUvrcdHo171zBX4Zqi2ic9d3d+Xm7UH/QY0CSxDrd8du56u2oZUqoFmqq+1hleWa/w6HLF211czJqO/JISgru+JsBdgJHaCzcmApn2Wa4dYDSu/M3012fkOzVdcG4Z9H5aQUxYnzqgaFgfQfGOMm8o/QCFjc/3ao=
Received: from SN4PR0501CA0124.namprd05.prod.outlook.com
 (2603:10b6:803:42::41) by SJ2PR12MB8737.namprd12.prod.outlook.com
 (2603:10b6:a03:545::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 19:41:23 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:803:42:cafe::94) by SN4PR0501CA0124.outlook.office365.com
 (2603:10b6:803:42::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18 via Frontend Transport; Thu,
 8 May 2025 19:41:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 19:41:21 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 14:41:20 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.15
Date: Thu, 8 May 2025 15:41:02 -0400
Message-ID: <20250508194102.3242372-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|SJ2PR12MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a98b633-24f3-4056-23ca-08dd8e684f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Yd2z2D9thbelKTa48KXH1YnesJ3EQxawKUsw4F7lcaeISi5uoke5TfMeVbrS?=
 =?us-ascii?Q?86MT1f8IT0SUmFuMfBfE2v7ZvSsUWwvd2FtQEKFYD0WB+IUWb5MGMiqolqO2?=
 =?us-ascii?Q?5PjpO0U+C7f1JqK9nsDC0Gglg1BbF9ZSCkvViiTd6VnZnqfvIAAfB0mAupTh?=
 =?us-ascii?Q?3WO34zqhHxSBuB2DEZFsPVRIaBMJfgVHIOBk+XldV2l/Dv3N4GrSZAz6S54L?=
 =?us-ascii?Q?fAi/BhNZNQEMDvSX1MGypkF7NiF7DY0JK0+JOMR54zNL0K5CsqgpDw3rVQfp?=
 =?us-ascii?Q?1QzCyeSaL/u02w7mYlgBWnDvhNE5gYEyP9xWUqh4zUNmXjNtxhwnJE5gebOn?=
 =?us-ascii?Q?u7pyGhPSn8GAt5voo4/1k66JcDKo9ejiMGscxlu+U8Xu8SAfVDm5S2k69LtA?=
 =?us-ascii?Q?KMfiYdLwsaJrupEAt7AdZPYqpaA0XGq2HRW0Z5TlZm+Wqc+2cMUuTHwv0eop?=
 =?us-ascii?Q?SxY8XHcSIjpGDLQzeLaOPvqGXt7xSA81zhFOPBKWw1xcmQtCt8Pbspu1WqZe?=
 =?us-ascii?Q?OHL+TvNf02Mn/kKVVpdPnv4ArP6MZBHuouMI0uGhoz36mSwNnBxPTSf6q7lS?=
 =?us-ascii?Q?9W1jFVmjiWoRs3kFA8YMiRUv5bFn1leO0+hRkyfiGxz3ESmfK1/zdlL4//gr?=
 =?us-ascii?Q?hdHQBKwqoTRkkaNdAyqPBZavSKg7PX851vPLeWdTdB8FGJuifX5zs2cg5oBX?=
 =?us-ascii?Q?GhhKRjX8o5ZnxonXfBnrtLS1RaRDZnF03MZLX1sFkFhu9YU5Z5T6mW1bG7kJ?=
 =?us-ascii?Q?E17r9z4rFU9654uNCyT84WQ75xzJrkSYnvEiOqrpMQCAAc3oyAGSQiKpl2Jz?=
 =?us-ascii?Q?Cw5/OeDfLzQfj3UNU/KiE3SZl+PopSRI+/bf5slL7qxhpN2IDM9v/NiA+Uxm?=
 =?us-ascii?Q?tS5Xd1FQipr4noq588169DWMDIM10HU/luVeUlsMhbAkwUMbQ9z5eIOF9WSA?=
 =?us-ascii?Q?jRtTAGnZuPQdpynEIYJbyVIJwWeHywVscf6XqV1aHLaZ4/p/a65IWfCEBIFv?=
 =?us-ascii?Q?7uauKVqFLvzf3EiLDwSo0FTx4fEoWQUM6izEKsMyk1gK+iizxscm0Ldo6010?=
 =?us-ascii?Q?1spLCRFNrBBFFYWW/2vfPpr4F6KRpTkq1ZoIPMP95Uc66oZ/SslJxVUzmYK7?=
 =?us-ascii?Q?evIwfM/wHXzcgdN41avSscrnnyyCs0aPWii2U1PA8DFSqTkMUlC3lDmIlhly?=
 =?us-ascii?Q?T/8GA1qyDQWzZnP8iV3Yc7GngMCdJcCGyPlFeMrCguiiYLj8aoWJ9qHxnM8O?=
 =?us-ascii?Q?SLHVrcX296G3A6MdjBpfEuObSGbdJkU5aEWzY+OWNsC7ecI/N8Sr1RDpwe49?=
 =?us-ascii?Q?LPEhw0zK07rTPb5DysJcprlix6rgAB5QXfpc7OAuF3ftM1f+2RwkPHZVZkWZ?=
 =?us-ascii?Q?N+knEFsMSphSLkZSo4e3GKgfM4Lpk53rmRaZFYxsY2Y2B7wzH0ne24fa+OsP?=
 =?us-ascii?Q?239/rsXUSq8L63dCShPKZQd0YhilBA5FXNWl4nfJqdNtawe+mUUZPA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 19:41:21.5640 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a98b633-24f3-4056-23ca-08dd8e684f67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737
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

Fixes for 6.15.

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.15-2025-05-08

for you to fetch changes up to 5a11a2767731139bf87e667331aa2209e33a1d19:

  drm/amdgpu/hdp7: use memcfg register to post the write for HDP flush (2025-05-08 11:48:12 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.15-2025-05-08:

amdgpu:
- DC FP fixes
- Freesync fix
- DMUB AUX fixes
- VCN fix
- Hibernation fixes
- HDP fixes

----------------------------------------------------------------
Alex Deucher (7):
      Revert "drm/amd: Stop evicting resources on APUs in suspend"
      drm/amdgpu: fix pm notifier handling
      drm/amdgpu/hdp4: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp5: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp5.2: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp6: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp7: use memcfg register to post the write for HDP flush

Alex Hung (1):
      drm/amd/display: Remove unnecessary DC_FP_START/DC_FP_END

Aurabindo Pillai (1):
      drm/amd/display: more liberal vmin/vmax update for freesync

Austin Zheng (1):
      drm/amd/display: Call FP Protect Before Mode Programming/Mode Support

Roman Li (1):
      drm/amd/display: Fix invalid context error in dml helper

Ruijing Dong (1):
      drm/amdgpu/vcn: using separate VCN1_AON_SOC offset

Wayne Lin (5):
      drm/amd/display: Shift DMUB AUX reply command if necessary
      drm/amd/display: Fix the checking condition in dmub aux handling
      drm/amd/display: Remove incorrect checking in dmub aux handler
      drm/amd/display: Copy AUX read reply data whenever length > 0
      drm/amd/display: Fix wrong handling for AUX_DEFER case

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           | 18 -----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 29 +++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 10 +-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  1 -
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |  7 ++++-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |  7 ++++-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.c              | 12 +++++++-
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |  7 ++++-
 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c              |  7 ++++-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  4 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 36 ++++++++++------------
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 28 ++++++++++++++---
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |  8 ++---
 .../amd/display/dc/dml2/dml2_translation_helper.c  | 14 +++------
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |  6 ----
 22 files changed, 103 insertions(+), 101 deletions(-)
