Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834AD8B8B78
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 15:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233FD10F00B;
	Wed,  1 May 2024 13:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5FGVdjS2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156F910F00B;
 Wed,  1 May 2024 13:51:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EF/V3czpT8oOrRZkHCG8ZM9QtSab/SsiN+GOZKOMSqw2I+4q5cshLG/eMtf6j7fNyyDKoMXI4dU4frAJ1j3QrF+pnwr1czaUquzcWAlaCZHaBVuBfsXLkCj3YM7mAggTYj3viTg6HlnZm9q1szNRe5vk94pt6vN6Zf74pi0SQd1BP6J2YHEM4DMspaCsQRdYUA+nWnKcx0qW5eFkOhgOFPFRjJFH3tHo2lXpr2RLA/AVlQ7gCmG+n6HaErFD1ZC4u/8lv9oRZcIcrGaGx9QOIA+i/BrRvECuw6aAdsVBTWtWwCLCmlq7zBBMVhR32CESk4ATqqfoS+cUnLXg/xq9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LFXO4ugKWQhqoYEvIWuuOR2q1iDjEokYJjveVOG31o=;
 b=PiJEx91coEU8iZW0D+F4ZrXmyUTW7GIKxplyaJJZPo4UkeM4z7JgSGjt/DHiMlkovpPmIT2bW4Fj2trHIyeHokYMA1c+j6ciG5sbJcSfJ9mmENSHjoS90rC1BfdS49Z7ogiuMpd6H/o05H8u4yFxqEKghbTxygOcCwiyyX+GP57/p3hQpAnIt7icyGWio6rwmDX4jmEriQhlDps49H4LGgAVkGsJxbxTdOjsgbeGUBgR+42I/4d+wVg122TtukpLd/L1TDe5yHVgKvWKVEYyaBL12vRnVhgxiEBMTo/CIMR8z9QFYjEmkh1+p8/0Fu9l4xyBqi2Di19Umh6kL6nS7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LFXO4ugKWQhqoYEvIWuuOR2q1iDjEokYJjveVOG31o=;
 b=5FGVdjS2SycC9iK4y6OgKpOFGcMfmAz9llclM4eiOljQR79L0wwAa8+14nO78WQIQl2E4p/6hq4PRG+kSnz7xErRWXVUzJzV7VXHvjAXwHd9kj2c49wcXIO3Fev+IAIeAWJHXDWama4Ko2o1IsyebHBDAFqO0AEdbe0wLSn6jyQ=
Received: from CH5PR03CA0005.namprd03.prod.outlook.com (2603:10b6:610:1f1::24)
 by DS0PR12MB8766.namprd12.prod.outlook.com (2603:10b6:8:14e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Wed, 1 May
 2024 13:51:16 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:1f1:cafe::4d) by CH5PR03CA0005.outlook.office365.com
 (2603:10b6:610:1f1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29 via Frontend
 Transport; Wed, 1 May 2024 13:51:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Wed, 1 May 2024 13:51:16 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 1 May
 2024 08:51:15 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.9
Date: Wed, 1 May 2024 09:50:53 -0400
Message-ID: <20240501135054.1919108-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|DS0PR12MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: de682751-0253-4da7-186a-08dc69e5c5b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|82310400014|1800799015|36860700004; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWpNL2d1OFg1TUFhUExtb3ZabHVsc1JUMENvSGw2ZStRc2dlZTV6Y0NpVVMz?=
 =?utf-8?B?OEJsU1VRcDQxOHJ4NG5samloMUJlWlRuRmwreldMR2ZJenVpVGQweExnYjZm?=
 =?utf-8?B?NHdDQ1ZxV2VtdGNaT3g3NUlVNjYvWllYdGd4SS8vcHJiQ1lSWnlHRXlGN3pQ?=
 =?utf-8?B?MWU3QmRkcXZPbmdxVVRqWHBva3FDZzRnaUNkYmxnWU1JWXpwQ2crbzdiazJ2?=
 =?utf-8?B?MXRRV0ZtS1JrSXJMUURmRHNCdzhBd3pibzYyME80VFBJaStub0UvR0xsd2Jp?=
 =?utf-8?B?TEhyaDVZVkR6U1BNNUE3Q3g0L2tyaFJaR3E0VVBZanAvanRqb3dDRWt4ODJ0?=
 =?utf-8?B?WXdWYzVYMGxNcVlwOGF3SHdqa3JIKzFZS2g5TjZ0TGk4NW5QaVNac0t4WHBs?=
 =?utf-8?B?VUpVaTBlVnhSVTYyOVhrSThFckFmNWlOZDBUUTBMTllYcHdYMXM3Vld4N0RW?=
 =?utf-8?B?dm1TNnFZTXY0dmxMQ1lrQjJ2N1NRdzVwZTdxY2UzZDhnWUNmS05BNVBscmpI?=
 =?utf-8?B?aHZMQzVJRGdZTW9hRXZkTjEzZGppemZTSHhzZ0NqNE1QNUg1UWxrcm9ycUg0?=
 =?utf-8?B?RGRTUlpuRWxOSlhkTlVLNWJScXhqclowOWNJU3J1RU9QVmhsTVhnZ2pBZjBR?=
 =?utf-8?B?K0V1cnA5UGFXN3E0TnVENXlwK3NpYUxHcWNjeUEzeUFjQnpyc3ozelRlc2hN?=
 =?utf-8?B?WnNQWEVtRGpkai9LTU5EQW50aTdjNXBaMlZDb0MvVGtCUUVLeTlsaVh5Rm4v?=
 =?utf-8?B?a25McHY1RW9UMFNJeVBFeHpEdFJHczhkeWlNcUsvOUxvREZuSDFjTm1ZOUxz?=
 =?utf-8?B?R2Rqb1VpZEt5ejF0NjZza2VGMWJ5RGNwTUhDZVFHVGNkeUV3OWJ0YWRXL2Qw?=
 =?utf-8?B?bUI1RWVRVXJJaFlRY3lIdDF0Y3IvSUkwdjFNL3ZzTDdLV042UHVzSThoVjVi?=
 =?utf-8?B?TW9CVzVzMFgrdzNEMm9NeGFiaURibytKNnh1a1kvckRiT2VmUWpYdCtIY2VH?=
 =?utf-8?B?cDVwMm1CVzArZm92ODlNczRtbnpMTHVna1psYkVHUWJSYTZVWndBYVFsV3g4?=
 =?utf-8?B?RVJsT2pHOUJlbHdEYW5HaFBOWWxjbHR4VlpSOGlHOVNDd2lKaHBDWnRJakJ5?=
 =?utf-8?B?WXBxaHFOa2NsOGNJNkxFcG0vdkNiZEtCT3F6RGV1TlRrMUkwWjFjMlIybHVE?=
 =?utf-8?B?OHBONDd2OFRtenNJRWVwSkY4T2RVZC9Ya3hhaDlLN0dVMUlZcEtGbmd6NmRP?=
 =?utf-8?B?T1I1VjdneU55SUd1eFJBNzdWRHdwS04vUFJEQWE1ZGk3ZnBDM05TWSsyZVU4?=
 =?utf-8?B?b2dMYWhEaE51Vm1adjdKYmx4YnBsLzNqbE5SditrMHFvM0orRi9ITHVUWVMr?=
 =?utf-8?B?SVhnYjlwWDBKemU3S0VBMzRxcXlUaHRZakI3R1FFQkpSeWZoMm9FdXJCQnFD?=
 =?utf-8?B?L21QL2JQNnMrTTYrN2JyNWNqZ2NESmg0a2RpNXJCK1lMcDJkblRYNHpwRWUv?=
 =?utf-8?B?bjlGbSs1SEpNTllDK21TVTdTTHVETVZRcXhlOUk2eXZnd3UxaVVMcEJBdHBZ?=
 =?utf-8?B?NzhBd3R4bmNMQ0lQb3VER2J6REF6R1BXSTZSZ3FGQnkrUjZSRTlKYTA5eDhj?=
 =?utf-8?B?TlV0M3ZvTHY0YjIySzIvc0xFL0thOCtXblc4NTBmZUphR00vRzcxZUgwREV5?=
 =?utf-8?B?UGdXSnB4b2Y4NndNTFBCN3JZOFAraTlrUEcwUEpML2FkYUxrTVY5M2djTDhK?=
 =?utf-8?Q?2LlhenCu6SdwTHV9CGe2cITo0xM2JPikO3ExP2D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 13:51:16.4287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de682751-0253-4da7-186a-08dc69e5c5b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8766
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

Fixes for 6.9.

The following changes since commit e67572cd2204894179d89bd7b984072f19313b03:

  Linux 6.9-rc6 (2024-04-28 13:47:24 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.9-2024-05-01

for you to fetch changes up to ab72d5945d8190f3b9ae16dafcf67655b458bf0e:

  drm/amd/display: Disable panel replay by default for now (2024-05-01 09:41:17 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.9-2024-05-01:

amdgpu:
- Fix VRAM memory accounting
- DCN 3.1 fixes
- DCN 2.0 fix
- DCN 3.1.5 fix
- DCN 3.5 fix
- DCN 3.2.1 fix
- DP fixes
- Seamless boot fix
- Fix call order in amdgpu_ttm_move()
- Fix doorbell regression
- Disable panel replay temporarily

amdkfd:
- Flush wq before creating kfd process

----------------------------------------------------------------
Christian König (1):
      drm/amdgpu: once more fix the call oder in amdgpu_ttm_move() v2

Gabe Teeger (1):
      drm/amd/display: Atom Integrated System Info v2_2 for DCN35

George Shen (1):
      drm/amd/display: Handle Y carry-over in VCP X.Y calculation

Hersen Wu (1):
      drm/amd/display: Fix incorrect DSC instance for MST

Lancelot SIX (1):
      drm/amdkfd: Flush the process wq before creating a kfd_process

Leo Ma (1):
      drm/amd/display: Fix DC mode screen flickering on DCN321

Mario Limonciello (1):
      drm/amd/display: Disable panel replay by default for now

Meenakshikumar Somasundaram (1):
      drm/amd/display: Allocate zero bw after bw alloc enable

Mukul Joshi (1):
      drm/amdgpu: Fix VRAM memory accounting

Rodrigo Siqueira (2):
      drm/amd/display: Ensure that dmcub support flag is set for DCN20
      drm/amd/display: Add VCO speed parameter for DCN31 FPU

Shashank Sharma (1):
      drm/amdgpu: fix doorbell regression

Sung Joon Kim (1):
      drm/amd/display: Disable seamless boot on 128b/132b encoding

Swapnil Patel (1):
      drm/amd/display: Add dtbclk access to dcn315

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         | 14 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            | 50 ++++++++++++----------
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  8 ++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 21 +++++----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 48 +++++++++++++++------
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  1 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |  8 ++++
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   | 15 +++++--
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  3 ++
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.c   |  6 +++
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |  2 +
 .../display/dc/link/protocols/link_dp_dpia_bw.c    | 10 ++++-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |  1 +
 15 files changed, 138 insertions(+), 55 deletions(-)
