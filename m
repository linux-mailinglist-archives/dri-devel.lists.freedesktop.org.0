Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B739524D8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 23:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C228F10E0D0;
	Wed, 14 Aug 2024 21:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F3l+rRKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBC410E0D0;
 Wed, 14 Aug 2024 21:39:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHDhVM+BvR2Vv57BOmo87zGdEePvEmwqotrG1O71wqyDY0jXHD6P4HhSbJx7Ex91BIVUjeTbZ4BAiiu6eJvHZZiajqgIyW0PHVatsrGgpUdVXQ/4P71qVmBnwrT4uc2y8jejaynoL5CIjECCx44z29qfS1elhQhuXirdEbLs3LRNByf+JlgS3GitzrFmp7VFr5hKT4sWJgtMBmW69g6exDTaj9YGRkGqBSl+yyZ3G9ySCxtlM9RJOg59AMm4mK4MZHSkfqd/N4U+Wq1GgjNcK1pdk8Hza/pXMCjKAa7UDslpVzu8H/hza4SwZGLqPFar2IYRLteNlcA+DpUUBaW4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZXUqGtqvpukyhGNSRwfVmO27tMBOm2TAdKga3fY1hk=;
 b=N6dxDfzCAlM0bt0bfAtvZGy8GRBxxc14guXKmMx11mRPWbDJhzWmsKBzsiwpCmVJL17xZEiDgYN8ZLkJxdYpn5ZSfCKwV2Glpm/dKbU0sHyAM/rimBrBPuuhcFlpPSHbP9Jaop36t/DEeZwdA5DUeF9uamMjCsrYmpKl3jIiHA+W/MVHa79S6qTATtxZXOuxAP8mUUlP2aii5B86oIFLSaUdPdZ3H8+Ak8bKame92jyp+te/ACYdBiJkPqqWmy1hPP4W51/UAgTtOcIGvwrKyydsmPhOdP762aDjV9itHtb6HK6nzGJQgvB7qpUTPw7WXsANt3erw9iMfur0Foueqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZXUqGtqvpukyhGNSRwfVmO27tMBOm2TAdKga3fY1hk=;
 b=F3l+rRKcmpmRu2rHKcc+m73EIfFnS+VCDJq1rRk3GjfFZuprquDkJ4i5JsEuO+xeIuDL0feseCwTpBl70zDzYOIUEaRN37GReH/Cf+KzkvUMlDfQsICPENk23Oqbl+Ps2oTFKAeQ9sQt7Pk2BXvnojoH4+a5BQIJ731XOsIQWms=
Received: from BN0PR04CA0133.namprd04.prod.outlook.com (2603:10b6:408:ed::18)
 by PH0PR12MB7012.namprd12.prod.outlook.com (2603:10b6:510:21c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Wed, 14 Aug
 2024 21:39:00 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::87) by BN0PR04CA0133.outlook.office365.com
 (2603:10b6:408:ed::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.24 via Frontend
 Transport; Wed, 14 Aug 2024 21:39:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 21:39:00 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 16:38:59 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.11
Date: Wed, 14 Aug 2024 17:38:46 -0400
Message-ID: <20240814213846.1331827-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|PH0PR12MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6805c5-b132-4526-bb0f-08dcbca9827c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rLzW+XMpXTudttNLFuat2Qi9GNYV1S8MC6Fc5D5fRI/W07C5J4AmHZ2VUFSs?=
 =?us-ascii?Q?FNIv1iVXUxYX2IttokIT6pgMAe8PZH6fuBZrHHqG8KbVyZ7umuZEgkQXn/aQ?=
 =?us-ascii?Q?6Gft3aq23NS69qFdG29hhynmlmschA0TNpcFnf15u3kxA2R6GOD0POnWGSmD?=
 =?us-ascii?Q?/1n6RdEyLdflMVjz2lmflWucYf40cblzKgMl4BXtkDk+hM4e+1mEkl7dFqm/?=
 =?us-ascii?Q?EC6yQl5AjT/ql5VzSlxq67rNVLcNWBttHbKgeDKR/C61dsfEpDhwQZa5JJMV?=
 =?us-ascii?Q?gJSCQ/UfMWXKC1vWidmcaCbj/xB0rcnS+T4Bzti2Na6nOVAGEp3e5xDUZuf6?=
 =?us-ascii?Q?ugLCXmgyGNaXF6I2Lcqm0zy4wrWfmO7M+dgNM2HQSIwaYHAAebeSa+DU8nfG?=
 =?us-ascii?Q?1sfyiDf5fEBkIZV8TUK6Pl/ZNBwuvi/kwF6bh9rKAUNk2ThGOT9K2zCsfEv0?=
 =?us-ascii?Q?27aP/TKN/1YZYXe4ks7XlmeGQ1yPNoVlOutQJAX+Ts46b5j6DXrlQuFWtzz/?=
 =?us-ascii?Q?DUbq/sNwAFHkBrcUbwajJaQ9PNkxu4m7Aa+M8kenqilpzjbZVHUgKrO06Zkt?=
 =?us-ascii?Q?K1g7as1ioS1ry5lD8VI2Hl9m35rc8saz24GtVwEzv5UnljJMs8QUlVREIOEH?=
 =?us-ascii?Q?1xo8m2szUq9WfwIdOJF1hApxJvUmLByKQjnPyC39t6KczoBEwVzmca1/hxWl?=
 =?us-ascii?Q?mxFBvSOiUTNafKuWRXb5I2AAnk/0G+X1s6DES/pdQwK3lIdLVxg9BTHuMZql?=
 =?us-ascii?Q?8XloIUDXPgXIm2X1vpBYxEbqT1JLe6tX0xF9cJjYjlw09b1R1g2Xfvp1JC3O?=
 =?us-ascii?Q?Sopd5wfXoPJ/3jooqEyUasxZTFCXYMe1ddWx2YRnaWFf4zPxP4dYKcFPYySy?=
 =?us-ascii?Q?IYySpqO+cFJoBlsye3PZ2PONYP1W/HDdT8+KHsYzCZOS8A4hDww0nHBhwL6b?=
 =?us-ascii?Q?KCEON60uG0/Y9W9VUXzn/7UOnLUlF5TsuTzQdCEUAcWcDxACD9ADGV4nQWP/?=
 =?us-ascii?Q?FKZaeG4+DJJhetRc8JC7Ml0se10sfnfIoEzpo8FpW4Dxg5g5YDLwQMHhfUre?=
 =?us-ascii?Q?GFFcDZbNtNTtNgkWign+vYEi/O7Wfn0Hzv3bXiaL4fCaMQ3I89Jfp6VWYggV?=
 =?us-ascii?Q?HSwUtfPkAYhcTo9mxhTk0gUNt4rRRFP1S/y5VxzIx/uSbTAu5MblfY9J29g4?=
 =?us-ascii?Q?UxoX19hu5S2kgohnhSI93v2EnIdsUt7KeOyKyU6/Hsuu0Mxn9llrwEVCNy8f?=
 =?us-ascii?Q?6yGC59k6wLqWEblLampuiR9wMh6DUVKYHl8laGwKOLYsn2DZ0xdtyNfjLyok?=
 =?us-ascii?Q?50Cwe5WLjWWDeilgLsn9yZtc+R1HQX1oD6VkBY4/QiQI9KPe/6Wpd5d9wFbB?=
 =?us-ascii?Q?90riF6Txi0kX5X2WMzhCJdpMOl3W?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 21:39:00.3850 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6805c5-b132-4526-bb0f-08dcbca9827c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7012
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

Hi Dave, Sima,

Fixes for 6.11.  The MES 12 updates are relatively large, but they are for
GFX 12 which is new for 6.11.

The following changes since commit 7c626ce4bae1ac14f60076d00eafe71af30450ba:

  Linux 6.11-rc3 (2024-08-11 14:27:14 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.11-2024-08-14

for you to fetch changes up to 23acd1f344e8102f803119d0c8fc4df4628d694f:

  drm/amd/amdgpu: add HDP_SD support on gc 12.0.0/1 (2024-08-13 13:20:43 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.11-2024-08-14:

amdgpu:
- Fix MES ring buffer overflow
- DCN 3.5 fix
- DCN 3.2.1 fix
- DP MST fix
- Cursor fixes
- JPEG fixes
- Context ops validation
- MES 12 fixes
- VCN 5.0 fix
- HDP fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/jpeg2: properly set atomics vmid field
      drm/amdgpu/jpeg4: properly set atomics vmid field

Bas Nieuwenhuizen (1):
      drm/amdgpu: Actually check flags for all context ops.

David (Ming Qiang) Wu (1):
      drm/amd/amdgpu: command submission parser for JPEG

Fangzhi Zuo (1):
      drm/amd/display: Fix MST BW calculation Regression

Hamza Mahfooz (1):
      drm/amd/display: fix s2idle entry for DCN3.5+

Jack Xiao (9):
      drm/amdgpu/mes: fix mes ring buffer overflow
      drm/amdgpu/mes12: update mes_v12_api_def.h
      drm/amdgpu/mes: add multiple mes ring instances support
      drm/amdgpu/mes12: load unified mes fw on pipe0 and pipe1
      drm/amdgpu/mes12: add mes pipe switch support
      drm/amdgpu/mes12: adjust mes12 sw/hw init for multiple pipes
      drm/amdgpu/mes12: configure two pipes hardware resources
      drm/amdgpu/mes12: sw/hw fini for unified mes
      drm/amdgpu/mes12: fix suspend issue

Kenneth Feng (1):
      drm/amd/amdgpu: add HDP_SD support on gc 12.0.0/1

Loan Chen (1):
      drm/amd/display: Enable otg synchronization logic for DCN321

Melissa Wen (1):
      drm/amd/display: fix cursor offset on rotation 180

Rodrigo Siqueira (1):
      drm/amd/display: Adjust cursor position

Yinjie Yao (1):
      drm/amdgpu: Update kmd_fw_shared for VCN5

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  83 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  27 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  63 ++++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h           |   7 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  59 ++--
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             | 296 +++++++++++----------
 drivers/gpu/drm/amd/amdgpu/soc15d.h                |   6 +
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |   2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   3 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  33 ++-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |   3 +
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   4 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |   3 +
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |   7 +-
 26 files changed, 420 insertions(+), 252 deletions(-)
