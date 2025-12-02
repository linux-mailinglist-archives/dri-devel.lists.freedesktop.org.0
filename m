Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D4C9D223
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 23:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE3110E2B6;
	Tue,  2 Dec 2025 22:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n7MeINST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013029.outbound.protection.outlook.com
 [40.93.196.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4C210E064;
 Tue,  2 Dec 2025 22:01:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sgjk2GrYNZokuL/FlDscwYgBn72ZNv/6c4fQUnOlW4hREwkarq3kyW9+I3SEzzkiYxAmW55nMbIPfvKbpfSo2bA67+Bd5lZ0dgNIPLNzerNv99vmgUakqSW9bk04YEtsFtqEgU9688Wd4YnruEB2EkUUhDv4eMf/nBoT+WxvG1q0O3x531NW4+KGWAmiCoxWflm0/nuAE2/CbcGYhgdCEN8iZcjRO6yyV+SsrXz9JsbrhnFEJtMCRv0r32t+7H5ipm/d3Mc07/Pq94uhnktg+Cs5LW4P4RLGp4Bh620GgpwI4vk4WsKIXofzvZVD38J26BfOqUlbM9UmKlBgo3Zx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95yl6za5iKKzaD7mYTbZubg79pV0gIHDOy9B+BgPv1o=;
 b=VtuQUglyQORxVBD/lVqEJMJeRsVbrhu3Vnh7vodLKfWgi3loskBa+t1bH+bVFu1Z22gENG7rGv7jb/IzaH6hRvwjW18eJCBTFjNX1sZ2VXcSnCW/i96TPwmh9db43101hTsZrY2PTMjOnF37+oDf3FVgr5LV6FJrxZsz0CTXz2utVq2XgayoALvUbdM4cyLd4KF2IUiJR5IyZLYPr6xxdDwQGGG4zMr/M078u4eRkZk6sJLmuFvvpjJ/HrE67mATg6A6ROm5wnIndBLE69slMlwSWEE7ECi4WzkHrHYOexJA/BC7IkFZL87gb1VgSeC6cZ8LmVofYSm6IYOjqcPXyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95yl6za5iKKzaD7mYTbZubg79pV0gIHDOy9B+BgPv1o=;
 b=n7MeINST68ySOoKSPrp1lSuolbUgOV/BVDR0k8dHG48H4NSpUvnfrNzsbs6hEv31Cb1mi525M0xZjykYJHKVtSn/qWykU+MSKwhJjLCg9oTYcMSkOGZTULa4/HSkRj/EZry+lrIs4KQ+B43RwcQQkOvLWYNeY/GgbqgxMcbPMoo=
Received: from BN0PR04CA0040.namprd04.prod.outlook.com (2603:10b6:408:e8::15)
 by MN0PR12MB5931.namprd12.prod.outlook.com (2603:10b6:208:37e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 22:01:23 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:e8:cafe::70) by BN0PR04CA0040.outlook.office365.com
 (2603:10b6:408:e8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 22:01:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 22:01:23 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Dec
 2025 16:01:22 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.19
Date: Tue, 2 Dec 2025 17:01:00 -0500
Message-ID: <20251202220101.2039347-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|MN0PR12MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: ed12338a-1820-48d4-5449-08de31ee554d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1d3VFk5VE1jMzFpcnljWTdJejlSNm9yMy9Iblk5bmJydWdDbFM5SzIxS1J1?=
 =?utf-8?B?UE94a0V4Tk1aNkZ1QW9UQUhQL2RwdmJkVFVjcXB2aVFSYnA5MlJmY0FMNFU5?=
 =?utf-8?B?dGFOUEtROEg3VWNoWG54dWhjTkl4Ym9GM2pPaUNGdVR4WDlabWFsWnowTXR4?=
 =?utf-8?B?dWFSK3ZkdHVnT21LMm9RNHA0ZXA5eXpadEc0Um44ODVlMkJYVDFLemc0TVhM?=
 =?utf-8?B?Z3pTZnVvd0tuZmdzenl4Qi9KYSt4MU9CKzhTK1JrUGtsRjlxd2NDSk9vTCtE?=
 =?utf-8?B?dFNaeUhWUGlPZWhPVWY0NDdBWFBFM1NLeVgrNWExK3NPVmZZUDd1bUVXZStL?=
 =?utf-8?B?Z0ViQ25KT1B6M1ZMK2FpUmNsSUdkdlJQYXRVeDFoSDVST2t6eU5ESXFuVXhl?=
 =?utf-8?B?QlZLT0xsb1B2RE1NRWMzYkoxM01yem53OFpvcEI4Y2phTUlCdWhqN0pNRVVj?=
 =?utf-8?B?SVo0Y2dTUjI4QW5qdGl0ZEpLZHlTQkJ3UHFualA1UzhvTUlQNFovek0wOU9n?=
 =?utf-8?B?b2wva2dxR2N1QXgwdDNsN2NJL2xMekxvT0NrYnFqS09sekc0UnBFOFNJbC9D?=
 =?utf-8?B?aTA2UGx5QlUxTmdGZTh3ZXdFSU1LUFVEUjEzWUd2eEVxMzhzRzkyYVJIbjZp?=
 =?utf-8?B?blkrU1F3RjlTSElYenBDdmdJWDI4VlptQnV2ZWFjK2FRYnlsdFVyKzA1Wk9H?=
 =?utf-8?B?ZEhBS04wUGRVU0NOVmJyMG9MYXdmY21XSVpGTTNPeFdPYmRMdnpHYlFQYnBa?=
 =?utf-8?B?eWFLSTRGQXZHb3RiM08zYWRoLzZta1A0YS9zdGlkUVFkZGJ6NzFaUW9wd283?=
 =?utf-8?B?MDRid2N1d3Z4TDAxYTFrRVc0UkVvRFVxSnY1elcrZTRaaHdmSm83M3IwZkVs?=
 =?utf-8?B?Tml6Qm1UVnlPRGYzODBsTkVqZ1ZqOXpVVmJvcXNVaVNkaTFWWGllQXR5NUh0?=
 =?utf-8?B?REd3V2xVcHpQUElTUlJoOG50K01aaGgrams4OFVoV2ZpRGwwN3FTSjM2V2ZV?=
 =?utf-8?B?Q0YzZTExSy9JVlVkY3lNcXhXaGg3U0p5d2FmZjRHaXN0M2ZMbGxBSENLdS9z?=
 =?utf-8?B?R3NhV0hnNzdKRE84S0MvQmFNNkNjQkQvY0sxOU42dVpXcmZ5WmFyblhlVjYw?=
 =?utf-8?B?RmtvVk53UklTRHk4QWlXeGNTT2RkdjBuWGdnVENYL3A3TExCa3YzRGdzQkhP?=
 =?utf-8?B?V1lYTjdWdkVsQ25teU1zUVlqai8xZVZYaXFLQk0rWlNTZUJFa09xWm1LeUYy?=
 =?utf-8?B?L3VnR0xKZzlPWnArYWwvWk9BZ3k3UDRZMWh1aFkyUWpzZ2NkM3RBc2x3WmRy?=
 =?utf-8?B?dm5MaWxlTTNqMEJ5aThCa2hZbEtGaVBweFNPa0VXdFlRcHpxRTQ2NktmMURK?=
 =?utf-8?B?SmpjZ3YyZEw0L09mVGVHKzM5Njh5cnZ0ZUY0ZzVra2hoSkRFU2hJclNTbUVk?=
 =?utf-8?B?bGlRQzl2dDk2d0krWXVZWVg4dWtrTHRVWitJVmgzVEtOdVpwdXBpLzJ0ZGFq?=
 =?utf-8?B?TEp2a3RlcEJIQi9wVVVrUnpZSm5aVFVET2VVNk9JY29HSUJ0NFFTYzNaTFly?=
 =?utf-8?B?VWluSFNYd3hudEdEMGYyWUdWMVNieVlSa0NWZ0pLNzJmTGVMOHV3Qk0vcytY?=
 =?utf-8?B?VVY3UW5KTmt6Q0wrOW9CRksvcCtScWh3OTUwQ0NDc0g5c1NoY1hBcWZLd3gr?=
 =?utf-8?B?QkdOUnZ6MW85am5qbmVsaU0yMkxtUUZPTFArUExPRG1TNjRLMDFsKzAzR25M?=
 =?utf-8?B?OXpvb3FkblZKNG1OQ3hJTk1TQ0xJTjlQQkk4ZkRwNUZDRmREbHB1Yy9idU5L?=
 =?utf-8?B?TWgxS0tac0xlVkE0MVF0bytFVThuT2FOZGYvMUNJeHFkaFpZTmhEVGFjSkVy?=
 =?utf-8?B?YlZFd2k4NDhoREJVNTZjL2ZqTk9TRjRSVGFnUTBmcWNONEtBUHZCdkplQjdm?=
 =?utf-8?B?aTlmOG1yOGQxVkpiSWRTM1dDclZrek9UVTAvU042LzhRQTV3U3JhUVpCU080?=
 =?utf-8?B?WlNOMkZZQ3A5QVRBWFlvcnFFRkJUWHZiOU5mMUVLMkY5OE5EM09ZUVNzVUJX?=
 =?utf-8?Q?ED78nZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 22:01:23.5905 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed12338a-1820-48d4-5449-08de31ee554d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5931
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

The following changes since commit ee9b603ad43f9870eb75184f9fb0a84f8c3cc852:

  drm/amdgpu: Add sriov vf check for VCN per queue reset support. (2025-11-19 17:34:16 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.19-2025-12-02

for you to fetch changes up to 3925683515e93844be204381d2d5a1df5de34f31:

  Revert "drm/amd: Skip power ungate during suspend for VPE" (2025-12-02 11:02:07 -0500)

----------------------------------------------------------------
amd-drm-next-6.19-2025-12-02:

amdgpu:
- Unified MES fix
- SMU 11 unbalanced irq fix
- Fix for driver reloading on APUs
- pp_table sysfs fix
- Fix memory leak in fence handling
- HDMI fix
- DC cursor fixes
- eDP panel parsing fix
- Brightness fix
- DC analog fixes
- EDID retry fixes
- UserQ fixes
- RAS fixes
- IP discovery fix
- Add missing locking in amdgpu_ttm_access_memory_sdma()
- Smart Power OLED fix
- PRT and page fault fixes for GC 6-8
- VMID reservation fix
- ACP platform device fix
- Add missing vm fault handling for GC 11-12
- VPE fix

amdkfd:
- Partitioning fix

----------------------------------------------------------------
Aditya Gollamudi (1):
      drm/amd/display: fix typo in display_mode_core_structs.h

Alex Deucher (5):
      Revert "drm/amd/display: Move setup_stream_attribute"
      drm/amdgpu: fix cyan_skillfish2 gpu info fw handling
      drm/amdgpu/gmc11: add amdgpu_vm_handle_fault() handling
      drm/amdgpu/gmc12: add amdgpu_vm_handle_fault() handling
      drm/amdgpu: use common defines for HUB faults

Alex Hung (1):
      drm/amd/display: Check NULL before accessing

Brady Norander (1):
      drm/amdgpu: use static ids for ACP platform devs

Dan Carpenter (1):
      drm/amd/display: Fix logical vs bitwise bug in get_embedded_panel_info_v2_1()

Eric Huang (1):
      drm/amdkfd: assign AID to uuid in topology for SPX mode

Ian Chen (1):
      drm/amd/display: fix Smart Power OLED not working after S4

Ivan Lipski (2):
      drm/amd/display: Check ATOM_DEVICE_CRT2_SUPPORT in dc_load_detection
      drm/amd/display: Move RGB-type check for audio sync to DCE HW sequence

Mario Limonciello (AMD) (3):
      drm/amd/display: Don't change brightness for disabled connectors
      drm/amd/display: Increase EDID read retries
      Revert "drm/amd: Skip power ungate during suspend for VPE"

Michael Chen (1):
      drm/amd/amdgpu: reserve vm invalidation engine for uni_mes

Natalie Vock (1):
      drm/amdgpu: Forward VMID reservation errors

Nicholas Kazlauskas (1):
      drm/amd/display: Add cursor offload abort to the new HWSS path

Pierre-Eric Pelloux-Prayer (3):
      drm/amdgpu: clear job on failure in amdgpu_job_alloc(_with_ib)
      drm/amdgpu: free job fences on failure in amdgpu_job_alloc_with_ib
      drm/amdgpu: add missing lock to amdgpu_ttm_access_memory_sdma

Prike Liang (1):
      drm/amdgpu: attach tlb fence to the PTs update

Rodrigo Siqueira (2):
      drm/amdgpu: Fix GFX hang on SteamDeck when amdgpu is reloaded
      Revert "drm/amd: fix gfx hang on renoir in IGT reload test"

Srinivasan Shanmugam (3):
      drm/amd/display: Fix dereference-before-check for dc_link
      drm/amdgpu: Fix CPER ring debugfs read buffer overflow risk
      drm/amdgpu/sdma6: Update SDMA 6.0.3 FW version to include UMQ protected-fence fix

Timur Kristóf (10):
      drm/amdgpu/si_ih: Enable soft IRQ handler ring
      drm/amdgpu/cik_ih: Enable soft IRQ handler ring
      drm/amdgpu/iceland_ih: Enable soft IRQ handler ring
      drm/amdgpu/tonga_ih: Enable soft IRQ handler ring
      drm/amdgpu/cz_ih: Enable soft IRQ handler ring
      drm/amdgpu/gmc6: Don't print MC client as it's unknown
      drm/amdgpu/gmc6: Cache VM fault info
      drm/amdgpu/gmc6: Delegate VM faults to soft IRQ handler ring
      drm/amdgpu/gmc7: Delegate VM faults to soft IRQ handler ring
      drm/amdgpu/gmc8: Delegate VM faults to soft IRQ handler ring

Yang Wang (2):
      drm/amd/pm: fix amdgpu_irq enabled counter unbalanced on smu v11.0
      drm/amd/pm: adjust the visibility of pp_table sysfs node

 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            | 10 ++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 19 ++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |  5 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  4 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  5 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  5 ++--
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                | 12 +++++++++
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                 | 10 ++++++++
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  6 +++--
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             | 29 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             | 29 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              | 20 ++++++++++-----
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |  6 +++++
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |  6 +++++
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  6 +++--
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            | 10 ++++++++
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 | 12 +++++++++
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  4 ---
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              | 10 ++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  4 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 24 ++++++++++++++----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  8 +++---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |  2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  8 +++---
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  6 +++++
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  | 24 ++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    | 11 +++++---
 .../display/dc/dml2_0/display_mode_core_structs.h  |  2 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  4 ++-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  2 --
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  4 +--
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h | 13 ++++++++++
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  6 +++--
 .../display/dc/virtual/virtual_stream_encoder.c    |  7 ------
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                | 12 ++++++---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 | 11 +++++++-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |  5 +++-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  9 ++++---
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  7 +++++-
 42 files changed, 320 insertions(+), 64 deletions(-)
