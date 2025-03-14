Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B6DA61714
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 18:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8290410EA18;
	Fri, 14 Mar 2025 17:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a2kGnv75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF61210EA18;
 Fri, 14 Mar 2025 17:06:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHKu9us+FrQcyMOUHI216pIukV9ACuiSUKq1xUMkadK2T6VO8PLTcUT1uih6TveCBmmSjRcJ654p2olW58DRrbR+BkTYW4fXXUf5DjzBcMnceJJ+zc2P1rufOMARnl1UA3kIpduGlIYspUq+gMczriLzcxg5w9ylLfCtq0XZX9vd2uw3tBCx8RNw+cjVEMomd+SrBMlR66v6YU0TNpP2RnbZkhBj8Sn4k9GntR4DiK2a9J8kooEMPAfKktewqev8FVOEaR11UNTUEfFfZ/luUzF0k5/7gZTMCkPXoVlzYWkCtLR7g8v+vHQaDnXhmmcNIFtUnXk19l4EW6+Y7a9rDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1C4vwop8EsEWoPibDqL0b/al3nKInWgFboWqC6tOZk=;
 b=SibKYbkwFTr2mE1F8RQDkngioFLj8H1cogw4Gwac3/0KAgpzHj+65q1QnCfEFF35gBT3Js09EK7kWeMGbwuQbeCeXXzV8t3EVyavMmjBf4pGZnWjacmOYzzgwm/S1cF3MUi3O5buxmflygysVozbZMbLSEC8W/vroypXfof5nHMsvjtw57XoZsfq66Ooz960smnGN4IDHo2db1yYa9vmiEvzWnypLjWYYzXek8g7SAb91Fhb68m9C/RbXeT4lmEFuKxiulGCEqvgfeOs5CSdzFPfC0kSOgrkuSq5g9XgPN+5Ktk/LYmz9qkSh6BRYdgJj8hurYuMwiptWv7bfq4pMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1C4vwop8EsEWoPibDqL0b/al3nKInWgFboWqC6tOZk=;
 b=a2kGnv75uPIbkD21d/F18CSABmBnzoDCHJ2btJWQgzTXtaQNN/bdHIRe2mI/m62w299shLeuJERDm7uWuYGS6i4X9Kru5VGf91hS/TiXVL5XLVBDgxtw4o0gfp2Y0qSjREkV2dPFse2Z0TSkdYCiPO1V3K65atRWyZ8vc5Sr2SE=
Received: from MN2PR11CA0013.namprd11.prod.outlook.com (2603:10b6:208:23b::18)
 by CYXPR12MB9425.namprd12.prod.outlook.com (2603:10b6:930:dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 17:06:34 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::98) by MN2PR11CA0013.outlook.office365.com
 (2603:10b6:208:23b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.26 via Frontend Transport; Fri,
 14 Mar 2025 17:06:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 14 Mar 2025 17:06:34 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Mar
 2025 12:06:30 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.15
Date: Fri, 14 Mar 2025 13:06:16 -0400
Message-ID: <20250314170618.3142042-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|CYXPR12MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4524c8-d854-49f4-ccd0-08dd631a9308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUd0OWgyd09TZk5WQUlXRUh4WG9md3dRZW8yaVpienNOYkJnYWplT2VjNmlp?=
 =?utf-8?B?dUVFU1NERTg3RUhoY1FrVWd1SnFJUHp5Szg1R3JKbHpRY0txTWdjNVBlaU9B?=
 =?utf-8?B?VUwzTy85dWMvQStKeGhmUFpqUERUNmswZ2Rrd2tiRGdNdXVXNTNRaXEvUGhM?=
 =?utf-8?B?aG9wR0l1L1QrMW9rbzVqbm1qeHJRSVVMV0hZNThMTGZXQ2I5ci9lNlpLWlVD?=
 =?utf-8?B?bFRBK0REZUl5ZGFHSjhKdU02UkVmZG13OWlGakhmSFV6VnNHSHNxTUtRQ2Y4?=
 =?utf-8?B?K1dhL250cUlwbzVQbEFtblVCNk1xWUJtTUNBQ2VDU1Fjb2xwZFZ6NUo5V0F6?=
 =?utf-8?B?UXByVWFPOU0zZENRYW5ZcDBUdG9udm80YUpvSU5EMW9SRmwvTUZqOXZGemFv?=
 =?utf-8?B?TGJCckNhL3lVbzhzWEVBZEdxdTNVeWVpYW5Pb2FWYWtrd0ZHYXRnME5GV0l2?=
 =?utf-8?B?a1BzZTF2SlhLeTVkVWZLa1dTQ216WE1wbVRoaTNYVE1wRC92NzhwYlFrY1Ni?=
 =?utf-8?B?ellTbTZwUGhuL1RpWmhHQ2NFbVdUQWJ1VWg3ckxjYWx4Rnk3UDVjSEtiZkdV?=
 =?utf-8?B?UUs0R1lHWHl4N3lRSHZIOXluNE5kNCtlZnZxSWdZSHRkM3liY0lUWklQYzdS?=
 =?utf-8?B?enN0YkJXOGkzVVhqLy9PbHgrTEhwcFRzNnJQbmtIRk8zTys5MlU0MVhLL0F4?=
 =?utf-8?B?RXZ1ZDV0ckNOYXdPOEpGT3hRQnNFNXg2RjdKUTROOFFtbm9GTC9LNzhsT2Fa?=
 =?utf-8?B?K3l4Ylk1U0lRVCtsMURQczN5R1U1b05LL3ZXS0Z0Nm52OEUrUU15QU5mSGNi?=
 =?utf-8?B?bzdHd1grTDRoUkVjYkdqQmdiU2R6K0FUWThGTnl1YjAvbm5aQlc3KytpbFVx?=
 =?utf-8?B?OCtid0Jxc2ROeGY3bUhlKy9OQUVqL1hhYk00OVk3dTg4dE1oRURLMzhKMlZj?=
 =?utf-8?B?eEVxSTA5V1lySmI4bGxZTDQ2S2xpalRwM05KTUhlblJCMEVHbUc3S3Rzempk?=
 =?utf-8?B?OE1DWHNaeW5XN0xSUUh2MTdMaXFiWDA1bVdzbVBPU0NtRitJUjAxQ2RlK0Rh?=
 =?utf-8?B?RHAzQ05jMjNUalg3dHJ1djFtMFVzS0RTRFVOYjZvVHRvQWF5MHJSYXl4TTls?=
 =?utf-8?B?MkYxek5QMlA1VUNmOVc4d3czRFlZKzBVdk1HQ3FNVUJFWkJuWXI3bmkrdUZK?=
 =?utf-8?B?ekpXdm9IUDZhaXFMWGhxZFR2TkFGRm96SmM2a2kwWjhMalJMbkh6WUNnbXVj?=
 =?utf-8?B?WGhXeGNJYy90anJmMkRzcE1WQ0RYZUdNdldhZi9GQnFvM3p1K2liVmxMdXZN?=
 =?utf-8?B?WjJMVU9vSGpURlJ6RG43MC80VHgrOS85SHY4NEJJMzBodHpKK3B1bW1pelAx?=
 =?utf-8?B?REl5czRMLzNhTmNGb1hONTdQZGw1WEgyeWtyQ0lnVDNJU011c09vK2hERHZK?=
 =?utf-8?B?eFgwYlVFaUtjQnozaGtBS1owZmY3Q20zR3UxR2ZGekVYd25GR1dYT2JmOEFX?=
 =?utf-8?B?dHZUeTNUS2FSSUk4V3NvRzNRc1EzRkhKK2V2aHVndnJISW13Q0JwbnNFTmZX?=
 =?utf-8?B?cld3QzBMdjNuTEkwOWpOMVFsV0tncytqZUh0eUZHdzhRK1lwbWVacWtmVkR1?=
 =?utf-8?B?U2oyMFpvOGxJZjROcCtxa1psbU1KcnBubTN5V1Bld2ozaXVNS2NtbWhybEJ2?=
 =?utf-8?B?WTVFN3NTYTNSdEFXU1B2T0szWXpZd01oTm1YUjhoUlpvdkRrb210UE5OMk9O?=
 =?utf-8?B?MUI4bXRKYXduZ0Z6K0RuY08wVmtXY3RnczJ2WUdhVG5IdlJ5aUgyMWo5Yloz?=
 =?utf-8?B?eWdZYWRjQlhFVjlJa3BpMlloZldNS0lVM0hzYWNBL0pGTXhGS2Vvd2R6VDN1?=
 =?utf-8?B?d09XRjVZd3UvaEs0Ui9RMXA3cCtDVDRxZ0FVZzZFcWlkZTU5QlptR3EwbzNW?=
 =?utf-8?Q?GH2KBXm2oXQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 17:06:34.3293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4524c8-d854-49f4-ccd0-08dd631a9308
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9425
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

Updates for 6.15.

The following changes since commit 236f475d29f8e585a72fb6fac7f8bb4dc4b162b7:

  Merge tag 'amd-drm-next-6.15-2025-03-07' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-03-10 09:04:52 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.15-2025-03-14

for you to fetch changes up to eb6cdfb807d038d9b9986b5c87188f28a4071eae:

  drm/amdgpu: Restore uncached behaviour on GFX12 (2025-03-13 23:18:02 -0400)

----------------------------------------------------------------
amd-drm-next-6.15-2025-03-14:

amdgpu:
- GC 12.x DCC fixes
- VCN 2.5 fix
- Replay/PSR fixes
- HPD fixes
- DMUB fixes
- Backlight fixes
- DM suspend/resume cleanup
- Misc DC fixes
- HDCP UAF fix
- Misc code cleanups
- VCE 2.x fix
- Wedged event support
- GC 12.x PTE fixes
- Misc multimedia cap fixes
- Enable unique id support for GC 12.x
- XGMI code cleanup
- GC 11.x and 12.x MQD cleanups
- SMU 13.x updates
- SMU 14.x fan speed reporting
- Enable VCN activity reporting for additional chips
- SR-IOV fixes
- RAS fixes
- MES fixes

amdkfd:
- Dequeue wait count API cleanups
- Queue eviction cleanup fixes
- Retry fault fixes
- Dequeue retry timeout adjustments
- GC 12.x trap handler fixes
- GC 9.5.x updates

radeon:
- VCE command parser fix

----------------------------------------------------------------
Alex Deucher (11):
      drm/amdgpu/vcn: fix idle work handler for VCN 2.5
      drm/amdgpu/vce2: fix ip block reference
      drm/amdgpu/gfx11: don't read registers in mqd init
      drm/amdgpu/gfx12: don't read registers in mqd init
      drm/amdgpu/pm: wire up hwmon fan speed for smu 14.0.2
      drm/amdgpu/pm: add VCN activity for renoir
      drm/amdgpu/pm: add VCN activity for SMU 13.0.0/7
      drm/amdgpu/pm: add VCN activity for SMU 14.0.2
      drm/amdgpu/pm: enable vcn busy sysfs for additional GC 11.x
      drm/amdgpu/pm: enable vcn busy sysfs for GC 12.x
      drm/amdgpu/pm: enable vcn busy sysfs for GC 9.3.0

Alex Hung (2):
      drm/amd/display: Assign normalized_pix_clk when color depth = 14
      drm/amd/display: Remove incorrect macro guard

Alexandre Demers (3):
      drm/amdgpu: prepare DCE6 uniformisation with DCE8 and DCE10
      drm/amdgpu: fix SI's GB_ADDR_CONFIG_GOLDEN values and wire up sid.h in GFX6
      drm/amdgpu: finish wiring up sid.h in DCE6

Amber Lin (1):
      drm/amdkfd: Correct F8_MODE for gfx950

André Almeida (1):
      drm/amdgpu: Trigger a wedged event for ring reset

Asad Kamal (1):
      drm/amd/pm: Update feature list for smu_v13_0_12

Charlene Liu (2):
      drm/amd/display: assume VBIOS supports DSC as default
      drm/amd/display: remove minimum Dispclk and apply oem panel timing.

Dan Carpenter (2):
      drm/amdgpu/gfx: delete stray tabs
      drm/amdkfd: delete stray tab in kfd_dbg_set_mes_debug_mode()

Danny Wang (1):
      drm/amd/display: Do not enable replay when vtotal update is pending.

David Belanger (1):
      drm/amdgpu: Restore uncached behaviour on GFX12

David Rosca (4):
      drm/amdgpu: Fix MPEG2, MPEG4 and VC1 video caps max size
      drm/amdgpu: Fix JPEG video caps max size for navi1x and raven
      drm/amdgpu: Remove JPEG from vega and carrizo video caps
      drm/amdgpu: Update SRIOV video codec caps

Dillon Varone (1):
      drm/amd/display: Add Support for reg inbox0 for host->DMUB CMDs

Emily Deng (3):
      drm/amdgpu: Fix the race condition for draining retry fault
      drm/amdgpu: Add amdgpu_sriov_multi_vf_mode function
      drm/amdgpu: set CP_HQD_PQ_DOORBELL_CONTROL.DOORBELL_MODE to 1 for sriov multiple vf.

Ethan Carter Edwards (4):
      drm/amd/display: change kzalloc to kcalloc in dcn30_validate_bandwidth()
      drm/amd/display: change kzalloc to kcalloc in dcn31_validate_bandwidth()
      drm/amd/display: change kzalloc to kcalloc in dcn314_validate_bandwidth()
      drm/amd/display: change kzalloc to kcalloc in dml1_validate()

George Shen (1):
      drm/amd/display: Implement PCON regulated autonomous mode handling

Harish Kasiviswanathan (3):
      drm/amdkfd: Add pm_config_dequeue_wait_counts API
      drm/amd/pm: add unique_id for gfx12
      drm/amdgpu: Reduce dequeue retry timeout for gfx9 family

Jay Cornwall (1):
      drm/amdkfd: Fix instruction hazard in gfx12 trap handler

Joshua Aberback (1):
      drm/amd/display: Add more debug data to dmub_srv

Leo Li (1):
      drm/amd/display: Disable unneeded hpd interrupts during dm_init

Leo Zeng (1):
      drm/amd/display: Fix visual confirm color not updating

Leon Huang (1):
      drm/amd/display: Fix incorrect DPCD configs while Replay/PSR switch

Lijo Lazar (2):
      drm/amdgpu: Remove unsupported xgmi versions
      drm/amdgpu: Calculate IP specific xgmi bandwidth

Marek Olšák (1):
      drm/amd/display: allow 256B DCC max compressed block sizes on gfx12

Mario Limonciello (6):
      drm/amd/display: fix default brightness
      drm/amd/display: Restore correct backlight brightness after a GPU reset
      drm/amd/display: Add and use new dm_prepare_suspend() callback
      drm/amd/display: Fix slab-use-after-free on hdcp_work
      drm/amd/display: Add scoped mutexes for amdgpu_dm_dhcp
      drm/amd/display: Drop unnecessary ret variable for enable_assr()

Natalie Vock (1):
      drm/amdgpu: NULL-check BO's backing store when determining GFX12 PTE flags

Nikita Zhandarovich (1):
      drm/radeon: fix uninitialized size issue in radeon_vce_cs_parse()

Peichen Huang (1):
      drm/amd/display: not abort link train when bw is low

Ryan Seto (1):
      drm/amd/display: Prevent VStartup Overflow

Shaoyun Liu (1):
      drm/amd/amdgpu: Fix MES init sequence

Taimur Hassan (1):
      drm/amd/display: Promote DAL to 3.2.324

Thadeu Lima de Souza Cascardo (1):
      drm/amd/display: avoid NPD when ASIC does not support DMUB

Wentao Liang (1):
      drm/amdgpu/gfx12: correct cleanup of 'me' field with gfx_v12_0_me_fini()

Xiang Liu (1):
      drm/amdgpu: Enable ACA by default for psp v13_0_6/v13_0_14

Yifan Zha (1):
      drm/amd/amdkfd: Evict all queues even HWS remove queue failed

Zhikai Zhai (1):
      drm/amd/display: calculate the remain segments for all pipes

Zhongwei Zhang (1):
      drm/amd/display: Correct timing_adjust_pending flag setting.

ganglxie (1):
      drm/amdgpu: Save PA of bad pages for old asics

 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |  28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h |   5 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |  28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |  73 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  47 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  50 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |  15 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |  37 --
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |  21 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  59 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  43 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  36 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |  68 +--
 drivers/gpu/drm/amd/amdgpu/si_enums.h              |  12 -
 drivers/gpu/drm/amd/amdgpu/sid.h                   | 369 +----------
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  21 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  10 +-
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              | 120 +++-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |  43 +-
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 677 +++++++++++----------
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm |  82 +--
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |  12 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  53 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |  11 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |  27 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |  26 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |  76 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |  28 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  39 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  37 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  43 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |  64 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   2 -
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |   2 -
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  10 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |  24 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   7 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       | 272 +++++----
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   4 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  27 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   1 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |   3 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |   4 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |  19 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   2 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  17 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   7 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   8 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |   4 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   3 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  10 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   6 +
 .../display/dc/link/protocols/link_dp_capability.c |  55 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |   1 +
 .../display/dc/link/protocols/link_dp_training.c   |   5 +-
 .../dc/link/protocols/link_edp_panel_control.c     |  25 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |   3 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |   3 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |   3 +-
 .../display/dc/resource/dcn315/dcn315_resource.c   |  42 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   3 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h       |   3 -
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        | 143 +++--
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  49 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |  85 +--
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h  |   2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |  93 +--
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |   2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |  98 +--
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h  |   2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |  93 +--
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.h  |   2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c | 218 ++++---
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.h |   6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    | 308 +++++++---
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |   5 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  29 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   6 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  10 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |   5 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  10 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  45 ++
 drivers/gpu/drm/radeon/radeon_vce.c                |   2 +-
 109 files changed, 2315 insertions(+), 1853 deletions(-)
