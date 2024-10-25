Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385059B03ED
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 15:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE9010EAC2;
	Fri, 25 Oct 2024 13:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aG6GlOsK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A988D10EAC2;
 Fri, 25 Oct 2024 13:23:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaKyV8qI7LhCis8NLTRKM8rubsz7a1I7iKqqUccEJtIWreH4t3U/hIneFV+DaXB/rnKk+tohZjHx0ai5ZGV5Mnb4noz4/MaX7b1SIZnZD0hOY+X0uells1dbg9yUfFEMYO8DqeLhJJtOHa4Uhp/qDPY/MHmDpf3Ay+YQWztE//QNxkzDBt2eKupZCi8Tdwr8kzM70/nMlYeMORlvjqngsN2vfbi346vUEgViXHiG42BJj8qElfnm925YhRE5eA+3N8PLMFJO6MJuLBvHQV04Gc/W+DyFRyRf5mycoPlDEJf8KsKP3lcq702ZGfX/qrFxZXjxwjlkTZIvAR149ez47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGSQ7K+7751KGGw5M5E8LMa8EzITvHIOzoF42uoTTys=;
 b=RvBdCijVk67lUFRu1fqo7pJ3cuir37wMG2xs86GVR2FdfS5eCcE5kpMFXnNVVgMvNKV5u/iYrAKRWkHT3ZGlnPI49CS5aHDv95PaLCinr+xjM1B6hn+BXrhkmeqBLP8SoS43hvZ4rm4vjlaI1Xx+lwWlo5EWOg/MDpoOVV7y+G+EQkXgVO9D+YZSSVonY2/GAeo/r9SZqk7n8pQgrshp9T0TJUf0F0REGATChn+IbGSyNp6zXg2Hg72A7ljfdQQ4SOvDWoTvlaJIeHXlTd/vwT9LbzKKjvANkWB6qEyMIeOxeTpHuB2ldbFb2Qmvhb1ebpja8Fmp0WmPQ4qHuJS9XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGSQ7K+7751KGGw5M5E8LMa8EzITvHIOzoF42uoTTys=;
 b=aG6GlOsKwBEGU5fMdMWk118oNzaTvb9+AcPE9Rhew+EeL7OMW0JyNw4tH11dbRU7+QluVQJvjyMGu0RSMJyUUXL9aUS5T90cpr5RzxJiTBWE5mrdIO7galZfdOPNDd4K5Pd2c3sZsjAzy5+IZqqt864f+deCAfFNqBXD3k9FbE8=
Received: from BN9PR03CA0875.namprd03.prod.outlook.com (2603:10b6:408:13c::10)
 by PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.22; Fri, 25 Oct
 2024 13:23:50 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:13c:cafe::ae) by BN9PR03CA0875.outlook.office365.com
 (2603:10b6:408:13c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Fri, 25 Oct 2024 13:23:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 13:23:50 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 08:23:48 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon, documentation drm-next-6.13
Date: Fri, 25 Oct 2024 09:23:35 -0400
Message-ID: <20241025132336.2416913-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|PH7PR12MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: f6259ef8-f5a0-4814-159f-08dcf4f84381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTdHNGR2bkJYdHVPdGYyNjQ0OGlGV1QzSXM2WjJYV2ZJSmlGTnY3MlZCdzFW?=
 =?utf-8?B?YmNrdkJmUy94dVBacUVBaEtKSi9LZ3lLK1k2T3h4dkdKNUt4akhtSlFScW4r?=
 =?utf-8?B?c2JjY0Y5dWZSQnZwU2cxRmd3RzI3WUwzeDFGQnAyVHYwcmhpSEZOcG92M21C?=
 =?utf-8?B?Q0pwRmwvSDQ2aWliNUIwNThablNzMGNRaFk4cFhYMXNVb3ZnaDJtYVptUTB2?=
 =?utf-8?B?TmdZemN2TFkvR25GdjNHTEI5cHdZOVVuR2hBcDRjbUFhR1YyVmJhaEUrTnBT?=
 =?utf-8?B?cTN5OWFQcFptS3hrM0R1OUsxc292Z2FRbFJVS1Nrd3R1Q2xOSDd1dlJvbFN2?=
 =?utf-8?B?S3JZbjlWa2FXWmlDc0I1WktGaWJ2RGFvNUgvajFXTld6Nk15ZkFxcTZxSHFY?=
 =?utf-8?B?bW1NZ2N2MFFMbDNxTWx4MlJCWTVJK1VqVVlJT3RFVmtWdlZSYXZraWRrWXRr?=
 =?utf-8?B?NGx4b0hBWnBSVldwT0tNR0Y5d3dWbUtQREMvQmxONjJMTWRvRG4yMmlEUnUx?=
 =?utf-8?B?T3lRbE5jb2hZbzBTQzhySEd6dnRIWG1zVllTTGRjcVJWMG9PaXlyeVA0NWQ5?=
 =?utf-8?B?cmF0SWZZS09kZkltZjhLSXA3S3FUMGRrN21LcGt0Y0NuMWNDb2ppdElzQjFB?=
 =?utf-8?B?bDduTk9uMjA1RElMRkd0QjI2aWptcXN3ekxiTk8ybVlFL2xhcFRpbmdqRGVI?=
 =?utf-8?B?YlFjaEJ2ck8wK2g3R21sTFl3Q050Y2xuU3JOekZVMzdYSUF1NEVGdndoblcr?=
 =?utf-8?B?OFlvbHpyZEFkeDNRY3NqS1JEQWFic010YWI1cGszaG1YSkFFamt3NENxTS9C?=
 =?utf-8?B?QVFMTm1semdiOWgybFk5NFZHMy9CYUFucm5iK0JwVmRWYmpkQ1VUbW1QZGRM?=
 =?utf-8?B?bmtINThKaEdGRmJia1R0ZHU2dDNTZ044TVRNVEF5NysxTzVuc3V1aldxVnpn?=
 =?utf-8?B?QWhuR1FzakFmWHJwSmRGeGdzS1liMVRUL1ZuOElic3E0MWJQTU5EalVrbWpC?=
 =?utf-8?B?WlkwRWV6NTl4ZVVhajd3d0xFN2Y5QXRta1haTkVpTTNaYUFNSWM5NE91blBO?=
 =?utf-8?B?ZzYrTWY2TzliNG4rTWxCTW8vTG1JYlNsaTA1SFdITHdjbVg3OWF1Yk1ueVN1?=
 =?utf-8?B?RmZwSGRvVXlqUHlma1YyOElVUk1SelVYQ0lDSXQ0SVVIaFBVNHNrWDY0c2N2?=
 =?utf-8?B?ODFNcE5yRzhzTDFOUzN6REpCdHBXMEYrb21qODBTa1YvV2xUTnYzYU50UEZ1?=
 =?utf-8?B?MGdmRElqbStiQWJWTU1lL0crSWpDbWxoY2FhR0pHQXArQm1KWDdVMzkyL0cv?=
 =?utf-8?B?UmQ2TnNxQTNBM08vT2RBUlhKVURGNHNuNDJpMHBLanJXb0d2TTRYZkZHc2JR?=
 =?utf-8?B?OG1wMFV1SENUb3ZyWGRqZXBjb2I5OEVVbDM0b2V0aTU5QU1JanpmQlI1NFZG?=
 =?utf-8?B?WW14bnNsNVV6VWFnM0hHV2pHVmw1ZTc5V203NlRCQVBqWTFlN2tVTi9XOGgx?=
 =?utf-8?B?a3NOT2g5WVNBTzdMcU5ieVBMU2hWWXlDcUl5QkpCWUt2YmVhU2hRWisrNkxV?=
 =?utf-8?B?R01jbmozcHdkQ05aSFhvMU9QQVloUHpTOE5aNlA4UTh2SjF5K05iS2dkeVVL?=
 =?utf-8?B?Zk5Ec1pvSGM1SHNlaEgvYlJXL1YvU2RSV3d0MStPM0dwNExOcUZTY0llUmpx?=
 =?utf-8?B?UFNCZXAxQWlmZnF5YmhNVVkvQmhyY3hWUGJEMVFVaGQ2UkxId3g1M0t1MHJY?=
 =?utf-8?B?K3JTMG14eVdieWR0U1I2WlAyazBTQ2wybFU4anZqTEU0SjY1Y1VDeUVHQnVK?=
 =?utf-8?Q?8DdvvYqk3su6IIVpDJluzZ11g3vntzJwbGB84=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 13:23:50.0742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6259ef8-f5a0-4814-159f-08dcf4f84381
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8056
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

New stuff for 6.13.

The following changes since commit d7d2688bf4ea58734d73e18edcbf4684b1496d30:

  drm/amd/pm: update workload mask after the setting (2024-09-26 17:05:10 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.13-2024-10-25

for you to fetch changes up to dac64cb3e029e9ae9ca251798bcb9cdb118d68d5:

  drm/amdgpu: Fix amdgpu_ip_block_hw_fini() (2024-10-24 18:07:10 -0400)

----------------------------------------------------------------
amd-drm-next-6.13-2024-10-25:

amdgpu:
- SDMA queue reset support
- SMU 13.0.6 updates
- Add debugfs interface to help limit jpeg queue scheduling for testing
- JPEG 4.0.3 updates
- Initial runtime repartitioning support
- GFX9 fixes
- Misc code cleanups
- Rework IP structures to better handle multiple instances of an IP
- DML updates
- DSC fixes
- HDR fixes
- Brightness control updates
- Runtime pm cleanup
- DMCUB fixes
- DCN 3.5 updates
- Struct drm_edid cleanup
- Fetch EDID from _DDC if available
- Ring noop optimizations
- MES logging fixes
- 3DLUT fixes
- DCN 4.x fixes
- SMU 13.x fixes
- Fixes for set_soft_freq_range()
- ACPI fixes
- SMU 14.x updates
- PSR-SU fixes
- fdinfo cleanup
- DCN documentation updates

amdkfd:
- Misc code cleanups
- Increase event FIFO size
- Copy wave state fixes for SDMA

radeon:
- Fix possible overflow in packet3 check
- Late init connector fix
- Always set GEM function pointer

Documentation:
- Update drm-memory documentation

----------------------------------------------------------------
Alex Deucher (13):
      drm/amdgpu/gfx9: set additional bits on CP halt
      drm/amdgpu/gfx9: Explicitly halt CP before init
      drm/amdgpu: partially revert powerplay `__counted_by` changes
      drm/amd/display: disable SG displays on cyan skillfish
      drm/amdgpu: enable enforce_isolation sysfs node on VFs
      drm/amdgpu/smu13: always apply the powersave optimization
      drm/amdgpu/swsmu: Only force workload setup on init
      drm/amdgpu/swsmu: default to fullscreen 3D profile for dGPUs
      drm/amdgpu/swsmu: add automatic parameter to set_soft_freq_range
      drm/amdgpu/discovery: add ISP discovery entries for old APUs
      Revert "drm/amdgpu/gfx9: put queue resets behind a debug option"
      Revert "drm/amdkfd: SMI report dropped event count"
      drm/amdgpu: handle default profile on on devices without fullscreen 3D

Alex Hung (11):
      drm/amd/display: Add HDR workaround for specific eDP
      drm/amd/display: Remove always-false branches
      drm/amd/display: Eliminate recursive header inclusion
      drm/amd/display: Removed unused assignments and variables
      drm/amd/display: Remove unnecessary assignments
      drm/amd/display: Remove redundant assignments
      drm/amd/display: Check returns from drm_dp_dpcd_write
      drm/amd/display: Check status from dpcd_get_tunneling_device_data
      drm/amd/display: Remove useless assignments
      drm/amd/display: print messages when programming shaper/3dlut fails
      drm/amd/display: Check returned status from core_link_read_dpcd

Alvin Lee (1):
      drm/amd/display: Wait for all pending cleared before full update

Andrew Kreimer (1):
      drm/amdgpu: fix typos

Aric Cyr (5):
      drm/amd/display: 3.2.302
      drm/amd/display: 3.2.303
      drm/amd/display: 3.2.304
      drm/amd/display: 3.2.305
      drm/amd/display: 3.2.306

Asad Kamal (7):
      drm/amd/amdgpu: Add helper to get ip block valid
      drm/amd/pm: Use same metric table for APU
      drm/amd/pm: Add gpu_metrics_v1_6
      drm/amd/pm: Use metrics 1_6
      drm/amdgpu: Add supported partition mode node
      drm/amd/pm: Update SMUv13.0.6 PMFW headers
      drm/amd/pm: Fill pcie recov cntr to metrics 1.6

Aurabindo Pillai (4):
      drm/amd/display: fix a memleak issue when driver is removed
      drm/amd/display: temp w/a for dGPU to enter idle optimizations
      drm/amd/display: Reuse subvp enable check for DCN401
      drm/amd/display: temp w/a for DP Link Layer compliance

Austin Zheng (9):
      drm/amd/display: Set Pipe Unlock Order Outside of HWSEQ
      drm/amd/display: Update Interface to Check UCLK DPM
      drm/amd/display: Wait For DET Update Should Use Current State
      drm/amd/display: Unify blank_phantom and blank_pixel_data
      drm/amd/display: Flip All Planes Under OTG Master When Flip Immediate
      drm/amd/display: Revert commit Update Interface to Check UCLK DPM
      drm/amd/display: Allow Latency Increase For Last Strategy
      drm/amd/display: Move Link Encoder Assignment Out Of dc_global_validate
      drm/amd/display: Update Interface to Check UCLK DPM

Bhuvanachandra Pinninti (1):
      drm/amd/display: To change dcn301_init.h guard.

Charlene Liu (3):
      drm/amd/display: avoid set dispclk to 0
      drm/amd/display: correct register Clock Gater incorrectly disabled
      drm/amd/display: update sr_exit latency for z8

Christian König (1):
      drm/radeon: always set GEM function pointer

Colin Ian King (2):
      drm/amdgpu: Fix spelling mistake "initializtion" -> "initialization"
      drm/amd/display: Fix spelling mistake "tunndeling" -> "tunneling"

Dan Carpenter (2):
      drm/amdgpu: Fix off by one in current_memory_partition_show()
      drm/amdgpu: Fix amdgpu_ip_block_hw_fini()

Dillon Varone (4):
      drm/amd/display: Configure DTBCLK_P with OPTC only for dcn401
      drm/amd/display: Remove programming outstanding updates for dcn35
      drm/amd/display: resolve correct MALL size for dcn401
      drm/amd/display: Recalculate SubVP Phantom VBlank End in dml21

Dr. David Alan Gilbert (7):
      drm/amd/display: Remove unused function bios_get_vga_enabled_displays
      drm/amdgpu: Remove unused amdgpu_device_ip_is_idle
      drm/amdgpu: Remove unused amdgpu_atpx functions
      drm/amdgpu: Remove unused amdgpu_gmc_vram_cpu_pa
      drm/amdgpu: Remove unused amdgpu_gfx_bit_to_me_queue
      drm/amdgpu: Remove unused amdgpu_i2c functions
      drm/amd/powerplay: Delete unused function and maths library

Fangzhi Zuo (4):
      drm/amd/display: Restore Optimized pbn Value if Failed to Disable DSC
      drm/amd/display: Fix incorrect DSC recompute trigger
      drm/amd/display: Skip Invalid Streams from DSC Policy
      drm/amd/display: Add a Precise Delay Routine

Feifei Xu (2):
      drm/amdgpu: Add psp command CONFIG_SQ_PERFMON
      drm/amdkfd:Add kfd function to config sq perfmon

Frank Min (2):
      drm/amdgpu: fix random data corruption for sdma 7
      drm/amdgpu: fix typo for sdma6 constant fill packet

Fudongwang (2):
      drm/amd/display: skip disable CRTC in seemless bootup case
      drm/amd/display: force TBT4 dock dsc on

Hamza Mahfooz (2):
      drm/amd/display: change the panel power savings level without a modeset
      drm/amd/display: fix hibernate entry for DCN35+

Hawking Zhang (1):
      drm/amd/pm: Do not support swSMU if SMU IP is disabled

Igor Artemiev (1):
      drm/radeon/r600_cs: Fix possible int overflow in r600_packet3_check()

Ilya Bakoulin (2):
      drm/amd/display: Fix cursor visual confirm update
      drm/amd/display: Add 3DLUT FL HW bug workaround

Jane Jian (1):
      drm/amdgpu: Remove unneeded write in JPEG v4.0.3

Jiadong Zhu (7):
      drm/amdgpu/mes11: update mes_reset_queue function to support sdma queue
      drm/amdgpu/sdma6: split out per instance resume function
      drm/amdgpu/sdma6: implement ring reset callback for sdma6
      drm/amdgpu/sdma5: split out per instance resume function
      drm/amdgpu/sdma5: implement ring reset callback for sdma5
      drm/amdgpu/sdma5.2: split out per instance resume function
      drm/amdgpu/sdma5.2: implement ring reset callback for sdma5.2

JinZe.Xu (1):
      drm/amd/display: Noitfy DMCUB of D0/D3 state in hardware init

Jonathan Kim (1):
      drm/amdkfd: sever xgmi io link if host driver has disable sharing

Joshua Aberback (2):
      drm/amd/display: Clip rect size changes should be full updates
      drm/amd/display: Clear pipe pointers on pipe reset

Josip Pavic (1):
      drm/amd/display: Clear update flags after update has been applied

Julia Lawall (1):
      drm/amd/display: Reorganize kerneldoc parameter names

Kaitlyn Tse (2):
      drm/amd/display: Initialize replay_config var
      drm/amd/display: Initialize new backlight_level_params structure

Kenneth Feng (3):
      drm/amd/pm: update the driver-fw interface file for smu v14.0.2/3
      drm/amd/pm: update overdrive function on smu v14.0.2/3
      drm/amd/pm: update deep sleep status on smu v14.0.2/3

Kent Russell (1):
      amdgpu: Don't print L2 status if there's nothing to print

Lang Yu (3):
      drm/amdkfd: Remove an unused parameter in queue creation
      drm/amdkfd: Fix an eviction fence leak
      drm/amdgpu: refine error handling in amdgpu_ttm_tt_pin_userptr

Leo (Hanghong) Ma (1):
      drm/amd/display: Fix Coverity change for visual confirm

Leo Chen (2):
      drm/amd/display: Full exit out of IPS2 when all allow signals have been cleared
      drm/amd/display: Adding array index check to prevent memory corruption

Leo Li (2):
      Revert "drm/amd/display: change the panel power savings level without a modeset"
      drm/amd/display: Enable idle workqueue for more IPS modes

Lijo Lazar (28):
      drm/amdgpu: Fix JPEG v4.0.3 register write
      drm/amdgpu: Add init levels
      drm/amdgpu: Use init level for pending_reset flag
      drm/amdgpu: Separate reinitialization after reset
      drm/amd: Add helper to get partition config modes
      drm/amdgpu: Add callback get xcp resource info
      drm/amdgpu: Add reset on init handler for XGMI
      drm/amdgpu: Add helper to initialize badpage info
      drm/amdgpu: Refactor XGMI reset on init handling
      drm/amdgpu: Drop delayed reset work handler
      drm/amdgpu: Support reset-on-init on select SOCs
      drm/amdgpu: Add interface for TOS reload cases
      drm/amdgpu: Add PSP reload case to reset-on-init
      drm/amdgpu: Add sysfs nodes to get xcp details
      drm/amdgpu: Add option to refresh NPS data
      drm/amdgpu: Fix logic to determine TOS reload
      drm/amdgpu: Add gmc interface to request NPS mode
      drm/amdgpu: Add sysfs interfaces for NPS mode
      drm/amdgpu: Place NPS mode request on unload
      drm/amdgpu: Check gmc requirement for reset on init
      drm/amdgpu: Add NPS switch support for GC 9.4.3
      drm/amdgpu: Fetch NPS mode for GCv9.4.3 VFs
      drm/amdgpu: Show current compute partition on VF
      drm/amdgpu: Wait for reset on init completion
      drm/amdgpu: Zero-initialize mqd backup memory
      drm/amdgpu: Use SPX as default in partition config
      drm/amdgpu: Save VCN shared memory with init reset
      drm/amdgpu: Fix the logic for NPS request failure

Liu Xi (Alex) (1):
      drm/amd/display: add more support for UHBR10 eDP

Mario Limonciello (4):
      drm/amd: Taint the kernel when enabling overdrive
      drm/amd/display: Fetch the EDID from _DDC if available for eDP
      drm/amd: Guard against bad data for ATIF ACPI method
      drm/amd/display: Disable PSR-SU on Parade 08-01 TCON too

Melissa Wen (5):
      drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
      drm/amd/display: switch to setting physical address directly
      drm/amd/display: always call connector_update when parsing freesync_caps
      drm/amd/display: remove redundant freesync parser for DP
      drm/amd/display: add missing tracepoint event in DM atomic_commit_tail

Michael Chen (1):
      drm/amdgpu/mes: fix issue of writing to the same log buffer from 2 MES pipes

Michael Strauss (1):
      drm/amd/display: Block UHBR Based On USB-C PD Cable ID

Mohammed Anees (1):
      drm/amdgpu: prevent BO_HANDLES error from being overwritten

Muyuan Yang (2):
      drm/amd/display: Change Brightness Control Priority
      drm/amd/display: Introduce New ABC Framework for Brightness Control

Ovidiu Bunea (1):
      drm/amd/display: Add IPS residency capture helpers to dc_dmub_srv

Paul Hsieh (1):
      drm/amd/display: Add logs to record register read/write

Peterson (1):
      drm/amd/display: Fix low black values by increasing error

Philip Yang (5):
      drm/amdkfd: Output migrate end event if migrate failed
      drm/amdkfd: Increase SMI event fifo size
      drm/amdkfd: Copy wave state only for compute queue
      drm/amdkfd: SMI report dropped event count
      drm/amdkfd: Accounting pdd vram_usage for svm

Pierre-Eric Pelloux-Prayer (5):
      drm/amd/pm: remove dump_pptable functions
      drm/amd/pm: fix rpm refcount handling on error
      drm/amd/pm: use pm_runtime_resume_and_get
      drm/amd/pm: don't update runpm last_usage on debugfs getter
      drm/amd/pm: use pm_runtime_get_if_active for debugfs getters

Prike Liang (2):
      drm/amdgpu: update suspend status for aborting from deeper suspend
      drm/amdgpu: Dereference the ATCS ACPI buffer

Rajneesh Bhardwaj (1):
      drm/amdgpu: Add PSP interface for NPS switch

Robin Chen (1):
      drm/amd/display: Read Sink emission rate capability

Rodrigo Siqueira (2):
      Documentation/gpu: Document how to narrow down display issues
      Documentation/gpu/amdgpu: Add programming model for DCN

Rohit Chavan (1):
      drm/amd/display: Fix unnecessary cast warnings from checkpatch

Roman Li (3):
      drm/amd/display: Align static screen idle worker with IPX mode
      drm/amd/display: Increase idle worker HPD detection time
      drm/amd/display: Add check for headless for idle optimization

Ryan Seto (1):
      drm/amd/display: Adjust PHY FSM transition to TX_EN-to-PLL_ON for TMDS

Samson Tam (5):
      drm/amd/display: disable adaptive scaler and sharpener when integer scaling is enabled
      drm/amd/display: fix static analysis warnings
      drm/amd/display: add sharpening policy to plane state
      drm/amd/display: disable dynamic ODM when sharpness is enabled
      drm/amd/display: update fullscreen status to SPL

Sathishkumar S (1):
      drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs

Shunlu Zhang (1):
      drm/amd/display: Change dc_surface_update cm2_params to const

Sridevi Arvindekar (1):
      drm/amd/display: Assign socclk in dml

Srinivasan Shanmugam (16):
      drm/amd/display: Fix out-of-bounds access in 'dcn21_link_encoder_create'
      drm/amdkfd: Fix kdoc entry for 'get_wave_count()' function parameters
      drm/amdgpu/gfx9: Add Cleaner Shader Deinitialization in gfx_v9_0 Module
      drm/amdgpu/gfx10: Implement cleaner shader support for GFX10 hardware
      drm/amdgpu/gfx11: Implement cleaner shader support for GFX11 hardware
      drm/amdgpu/gfx12: Implement cleaner shader support for GFX12 hardware
      drm/amdgpu/gfx11: Apply Isolation Enforcement to GFX & Compute rings
      drm/amdgpu/gfx10: Apply Isolation Enforcement to GFX & Compute rings
      drm/amdgpu/gfx12: Apply Isolation Enforcement to GFX & Compute rings
      drm/amd/display: Add hpd_source index out-of-bounds check for dcn3x link encoder creation
      drm/amd/amdgpu: Fix double unlock in amdgpu_mes_add_ring
      drm/amd/display: Ensure HPD source index is valid for dcn20/dcn201 link encoders
      drm/amd/display: Add hpd_source index check for DCE60/80/100/110/112/120 link encoders
      drm/amd/display: Add hpd_source index check for dcn10 link encoder setup
      drm/amd/display: Add hpd_source index check for dcn401 link encoder setup
      drm/amdgpu/gfx9: Add cleaner shader for GFX9.4.2

Sung Lee (1):
      drm/amd/display: Clean up triple buffer enablement code

Sunil Khatri (45):
      drm/amdgpu: add amdgpu_device reference in ip block
      drm/amdgpu: update the handle ptr in dump_ip_state
      drm/amdgpu: update the handle ptr in print_ip_state
      drm/amdgpu: update the handle ptr in early_init
      drm/amdgpu: update the handle ptr in late_init
      drm/amdgpu: update the handle ptr in sw_init
      drm/amdgpu: update the handle ptr in sw_fini
      drm/amdgpu: update the handle ptr in early_fini
      drm/amdgpu: remove the dummy fn acp_early_init
      drm/amdgpu: update the handle ptr in late_fini
      drm/amdgpu: update the handle ptr in prepare_suspend
      drm/amdgpu: update the handle ptr in check_soft_reset
      drm/amdgpu: update the handle ptr in pre_soft_reset
      drm/amdgpu: update the handle ptr in soft_reset
      drm/amdgpu: update the handle ptr in post_soft_reset
      drm/amdgpu: update the handle ptr in wait_for_idle
      drm/amdgpu: update the handle ptr in suspend
      drm/amdgpu: update the handle ptr in resume
      drm/amdgpu: update the handle ptr in hw_init
      drm/amdgpu: update the handle ptr in hw_fini
      drm/amdgpu: fix html doc generation warning
      drm/amdgpu: change the comment from handle to ip_block
      drm/amdgpu: move error log from ring write to commit
      drm/amdgpu: no need to log error in multi ring write
      drm/amdgpu: fix dm_suspend/resume arguments to ip_block
      drm/amdgpu: optimize insert_nop using multi dwords
      drm/amdgpu: optimize fn gfx_v9_4_3_ring_insert_nop
      drm/amdgpu: optimize fn gfx_v9_ring_insert_nop
      drm/amdgpu: optimize fn gfx_v10_ring_insert_nop
      drm/amdgpu: optimize fn gfx_v11_ring_insert_nop
      drm/amdgpu: optimize fn gfx_v12_ring_insert_nop
      drm/amdgpu: validate sw_init before function call
      drm/amdgpu: clean the dummy sw_init functions
      drm/amdgpu: validate sw_fini before function call
      drm/amdgpu: clean the dummy sw_fini functions
      drm/amdgpu: validate hw_fini before function call
      drm/amdgpu: validate suspend before function call
      drm/amdgpu: validate resume before function call
      drm/amdgpu: validate wait_for_idle before function call
      drm/amdgpu: clean the dummy resume functions
      drm/amdgpu: clean the dummy suspend functions
      drm/amdgpu: clean the dummy wait_for_idle functions
      drm/amdgpu: clean the dummy soft_reset functions
      drm/amdgpu: Clean the functions pointer set as NULL
      drm/amdgpu: clean unused functions of uvd/vcn/vce

Taimur Hassan (2):
      drm/amd/display: [FW Promotion] Release 0.0.236.0
      drm/amd/display: Add DMUB debug offset

Tim Huang (1):
      drm/amdgpu: check return for setting engine dram timings

Tom Chung (1):
      drm/amd/display: Fix system hang while resume with TBT monitor

Tvrtko Ursulin (5):
      Documentation/gpu: Document the situation with unqualified drm-memory-
      drm/amdgpu: Drop unused fence argument from amdgpu_vmid_grab_used
      drm/amdgpu: Use drm_print_memory_stats helper from fdinfo
      drm/amdgpu: Drop impossible condition from amdgpu_job_prepare_job
      drm/amdgpu: Remove the while loop from amdgpu_job_prepare_job

Victor Lu (1):
      drm/amdgpu: clear RB_OVERFLOW bit when enabling interrupts for vega20_ih

Victor Zhao (2):
      drm/amdkfd: fix the hang caused by the write reorder to fence_addr
      drm/amdkfd: remove extra use of volatile

Ville Syrjälä (1):
      drm/radeon: Fix encoder->possible_clones

Vitaliy Shevtsov (1):
      drm/amd/display: fix typos in several function pointer checks

WangYuli (1):
      drm/amdgpu: Fix typo "acccess" and improve the comment style here

Wu Hoi Pok (1):
      drm/radeon: add late_register for connector

Xiaogang Chen (1):
      drm/amdkfd: Not restore userptr buffer if kfd process has been removed

YiPeng Chai (2):
      amd/amdgpu: Reduce unnecessary repetitive GPU resets
      drm/amdgpu: Reduce redundant gpu resets on nbio v7.4

Yihan Zhu (3):
      drm/amd/display: update DML2 policy EnhancedPrefetchScheduleAccelerationFinal DCN35
      drm/amd/display: calculate final viewport before TAP optimization
      drm/amd/display: w/a to program DISPCLK_R_GATE_DISABLE DCN35

YuanShang (1):
      drm/amdgpu: Flush tlb by VM_INVALIDATION packet in sdma_v5_2

Zhongwei (2):
      drm/amd/display: Monitor patch to call blank_stream() before otg off
      drm/amd/display: Fix garbage or black screen when resetting otg

Zhu Lingshan (1):
      drm/amdgpu: init saw registers for mmhub v1.0

po-tchen (1):
      drm/amd/display: Display lost signal on playing video

 .../gpu/amdgpu/display/dc-arch-overview.svg        |  731 +++++++++++
 Documentation/gpu/amdgpu/display/dc-components.svg |  732 +++++++++++
 Documentation/gpu/amdgpu/display/dc-debug.rst      |  187 +++
 Documentation/gpu/amdgpu/display/dcn-blocks.rst    |    2 +
 Documentation/gpu/amdgpu/display/dcn-overview.rst  |    2 +
 Documentation/gpu/amdgpu/display/index.rst         |    1 +
 .../gpu/amdgpu/display/programming-model-dcn.rst   |  162 +++
 Documentation/gpu/drm-usage-stats.rst              |   25 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |   27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |   55 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   15 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h       |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c   |   12 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  507 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   70 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   88 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |   48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   96 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  214 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |   23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c            |   25 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.h            |    4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c            |   61 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |   73 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   96 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |   35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  111 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   83 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |  150 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    5 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |   38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |   34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |  243 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |   33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  140 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |    9 +
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |  113 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |   47 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |   45 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |   47 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                 |   45 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   49 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   45 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   43 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   45 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  102 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  117 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   82 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   47 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   50 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   61 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  104 +-
 .../gpu/drm/amd/amdgpu/gfx_v9_0_cleaner_shader.h   |   44 +-
 .../drm/amd/amdgpu/gfx_v9_4_2_cleaner_shader.asm   |  153 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   79 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   50 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   50 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   50 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   72 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   49 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   79 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  136 ++-
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |   45 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |   41 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |   41 +-
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |   41 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |   18 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.h             |    6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   59 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   66 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |   59 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   59 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   87 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   59 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |   59 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   84 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   57 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |   49 +
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |   41 +-
 drivers/gpu/drm/amd/amdgpu/navi10_sdma_pkt_open.h  |   64 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   12 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   52 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |   20 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   25 +
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |   45 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |   55 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   50 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   50 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  388 +++---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  417 ++++---
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  321 ++---
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |   61 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |   52 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |   46 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |   47 +-
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |   32 +-
 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c          |   22 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   69 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   52 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |   50 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |   63 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |   52 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |   52 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |   59 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |   73 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |  311 +----
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |   56 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |   66 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |  308 +----
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   70 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   65 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   70 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   65 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   67 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   67 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   67 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |   67 +-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |   41 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   66 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |   52 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    3 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   11 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |   11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h        |    3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   33 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  325 +++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    7 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |    3 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   48 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  123 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   66 +-
 .../drm/amd/display/dc/bios/bios_parser_helper.c   |    7 -
 .../drm/amd/display/dc/bios/bios_parser_helper.h   |    1 -
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |    6 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  255 ++--
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   26 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   57 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   11 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   15 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   87 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   39 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    7 +-
 drivers/gpu/drm/amd/display/dc/dc_plane.h          |    1 -
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |    5 +-
 drivers/gpu/drm/amd/display/dc/dc_state.h          |    1 -
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    3 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    8 +
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |   84 --
 .../gpu/drm/amd/display/dc/dce60/dce60_resource.c  |    2 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c |   25 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c |   25 +-
 .../dc/dio/dcn314/dcn314_dio_stream_encoder.c      |   10 +
 .../amd/display/dc/dml/dcn20/display_mode_vba_20.c |    3 -
 .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |    3 -
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |    4 -
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |    4 -
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |    3 -
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |    4 -
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   12 -
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |    4 -
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |    3 -
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |    4 -
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |    3 -
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |    4 -
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |    3 -
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |    4 +-
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c  |    3 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |    1 +
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |    6 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c   |    1 +
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.c  |    1 +
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |    1 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c  |    1 -
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |    2 -
 .../gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp.h   |    1 +
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.h   |    1 +
 .../gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c   |   16 +-
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c |    1 -
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |    7 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.h  |    3 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |    1 -
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   41 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |    7 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.h    |    3 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   35 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.h    |    2 +
 .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |    3 +-
 .../drm/amd/display/dc/hwss/dcn301/dcn301_init.c   |    1 +
 .../drm/amd/display/dc/hwss/dcn301/dcn301_init.h   |    4 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |    5 +
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |   22 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |   63 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.h    |    5 -
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |    2 +-
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |    1 -
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |    1 -
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  285 ++++-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |   15 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |    9 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   13 +-
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |    1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    4 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    6 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   12 +
 .../display/dc/link/protocols/link_dp_capability.c |   45 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |    7 +
 .../display/dc/link/protocols/link_dp_training.c   |   13 +-
 .../link_dp_training_fixed_vs_pe_retimer.c         |    1 -
 .../dc/link/protocols/link_edp_panel_control.c     |   54 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |    9 +
 .../gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.h |    7 +-
 .../gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c |   45 +
 .../gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.h |   13 +-
 .../drm/amd/display/dc/optc/dcn301/dcn301_optc.c   |    3 +
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.h |    9 +-
 .../drm/amd/display/dc/optc/dcn314/dcn314_optc.h   |    9 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |   16 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h |    7 +-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.h |    6 +-
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |   35 +-
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.h   |    6 +-
 .../display/dc/resource/dce100/dce100_resource.c   |    2 +-
 .../display/dc/resource/dce110/dce110_resource.c   |    2 +-
 .../display/dc/resource/dce112/dce112_resource.c   |    2 +-
 .../display/dc/resource/dce120/dce120_resource.c   |    2 +-
 .../amd/display/dc/resource/dce80/dce80_resource.c |    2 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |    2 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |    2 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |    2 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |    2 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |    2 +-
 .../display/dc/resource/dcn301/dcn301_resource.c   |    2 +-
 .../display/dc/resource/dcn302/dcn302_resource.c   |    2 +-
 .../display/dc/resource/dcn303/dcn303_resource.c   |    2 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |    2 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |    2 +-
 .../display/dc/resource/dcn315/dcn315_resource.c   |    8 +-
 .../display/dc/resource/dcn316/dcn316_resource.c   |    2 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |    6 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |    3 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |    2 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |    2 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |    3 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   51 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |    5 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |   18 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h  |    6 +-
 drivers/gpu/drm/amd/display/dc/spl/spl_debug.h     |   33 +-
 .../gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c    |   32 +-
 .../gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h    |   17 +-
 drivers/gpu/drm/amd/display/dc/spl/spl_os_types.h  |    3 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    8 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  165 ++-
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |   19 +-
 drivers/gpu/drm/amd/display/include/logger_types.h |    4 +-
 .../drm/amd/display/modules/freesync/freesync.c    |   17 +-
 .../drm/amd/display/modules/power/power_helpers.c  |    2 +
 drivers/gpu/drm/amd/include/amd_shared.h           |   43 +-
 .../amd/include/asic_reg/mmhub/mmhub_1_0_offset.h  |   23 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  103 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  335 ++----
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |   48 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |   50 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   53 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c    |  428 -------
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h    |    2 -
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h |  561 ---------
 .../pm/powerplay/hwmgr/vega20_processpptables.c    |  574 ---------
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |   26 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   74 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    8 +-
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0.h   |  132 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v12_0.h       |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |    4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  433 -------
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    2 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 1271 +-------------------
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   28 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   19 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   14 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   15 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   34 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   39 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |   22 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  209 ++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   17 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   36 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   33 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   83 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |    3 +
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |    1 -
 drivers/gpu/drm/radeon/atombios_dp.c               |    9 +-
 drivers/gpu/drm/radeon/r600_cs.c                   |    2 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |   17 +
 drivers/gpu/drm/radeon/radeon_encoders.c           |    2 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |    3 -
 drivers/gpu/drm/radeon/radeon_object.c             |    1 +
 include/uapi/linux/kfd_ioctl.h                     |    7 +-
 335 files changed, 9359 insertions(+), 8894 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/display/dc-arch-overview.svg
 create mode 100644 Documentation/gpu/amdgpu/display/dc-components.svg
 create mode 100644 Documentation/gpu/amdgpu/display/programming-model-dcn.rst
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2_cleaner_shader.asm
 delete mode 100644 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h
