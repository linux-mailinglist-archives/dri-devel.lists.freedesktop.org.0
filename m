Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331E89F6ECB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 21:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CEC10E444;
	Wed, 18 Dec 2024 20:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mzqe682d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D793C10E344;
 Wed, 18 Dec 2024 20:18:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPLI0eIss6xq/wDvAKIt1iJYBbq+ChgZuyJqvPI4jhmYUdEZtrvUBhhSCUcXJPdptxk0pkO7SRWcRGijMrwGAeJa67o+2jMV16Dk8zX0z240NfTCpLPlslhBmPBerZZBO0w5FYdJcxrmKSdQkDFRKuEoNKCDZF4xQ0itJQgHZzwMySzMvsMiCSeGYsMe35BdeQdm5D4fDezzTWAqrXfBAoGP2/14V1qa5vFMG297auxHQ6WEU4vu8M6mqZTaJEj/AVQ9PxYz97lCujuOAdl1A9/dKVaMc4ikSPggDKbXC5av65yWOnge8F3LRLJRT4UIX2BBU5CepMbT9c0Ou1cTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+XRb3BmmcaLKx3uq1AnpEEnAiWeJxMsN15ZrHpGGOw=;
 b=iAeaDiKsoaXzWHJ4BvSud+kq9AldRLP6u41uoLjdywHKy7WN5l//mnAwYkUrxvvwr/w2dpCor+sizkyKO8GHRdbjk438GTZ9GtMi9DdrllHfYMNWfejZHQdU0FAou3B8v3KFsNc7O2jNi6zgEgFMkKMtsFlEY58E8YbtnEdGtAYuV/GJn1MAR7/dOHX2ls2deUFubcGB+1RoJ4vvAHKO2XaRQwT9Uo99syXlcaj1Wfp+QenLvUkqJvLFaOQr4DwzswSD/l9glfyvB/kQNziJlfbcyPw1B0aOZ8lIpDsZMnr+qcJWawcbdXZMzljnNZuReT/3rJN4W5AXTD88L92WbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+XRb3BmmcaLKx3uq1AnpEEnAiWeJxMsN15ZrHpGGOw=;
 b=mzqe682dgBPsPqig4Z1/U1wqo7Xd/R7S6YwS5JJ5WQL53DwPKrWtDbEPILomDBSsur9yV5G9xci46qsnXB68l6X7eNRWO3JADP/7MGqCGnsvDE//BmeLFtbt7c0JUGg9zTqNArRXhBZHuxIxfNz18SpDFMkP81qpMT8bNb2eP1A=
Received: from MN2PR06CA0019.namprd06.prod.outlook.com (2603:10b6:208:23d::24)
 by DM4PR12MB5988.namprd12.prod.outlook.com (2603:10b6:8:6b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 20:18:15 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::3d) by MN2PR06CA0019.outlook.office365.com
 (2603:10b6:208:23d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Wed,
 18 Dec 2024 20:18:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 20:18:15 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 14:18:14 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.14
Date: Wed, 18 Dec 2024 15:17:58 -0500
Message-ID: <20241218201758.2580723-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|DM4PR12MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b09a6c4-fe7d-43a6-9aed-08dd1fa11abe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0wwUS9EalcydC9pOGdMR2pUWWFDQSs2bHlTR2tPWVpmdEhacGROY0hOQVEy?=
 =?utf-8?B?UVR6alRyeWs1dUtCdWlPQWtaYXBwUVRLNk1lMVhGcVBUY1BoNVdENWF0amkv?=
 =?utf-8?B?TW5EemFpMFFVZmttVU9haUFPdGRYNFdzS0I2QnVGUjFsUjlLbEdSWU1yWTNJ?=
 =?utf-8?B?MERNR3pGR2ZnaUU4N2Fld3lEV0Jqd0M0WEdveVBIbTZ3K3NKczVLMFB5aG9Q?=
 =?utf-8?B?Y2dKQkFXb0tta1NMeVFJT0MyaXRSeVBuTG0yK2I5azh4OGxWS2lLREVuMG1s?=
 =?utf-8?B?SUNLd1JzVFZENlljdDhrZ2hsUXVyZGZFZXRWazJyazE2L0ZkWFRNb0pZMDZr?=
 =?utf-8?B?bVJTRU9wQ3JMeGdPck9FcmtCN3RPckV6RmxseXFPOHpsMURqZzdZVHpRMyty?=
 =?utf-8?B?TUx0UDIweVFtSElGcTJoYVJMd0FYUXg0M0hEVGlxV3BxK2loRk9ody9pcjFm?=
 =?utf-8?B?SjVkbUlWWElRc2I3UjdkY0hReUVyaytUTEtpODhBMlFvZUxLZ3pkdnZKZmxp?=
 =?utf-8?B?L0NzdG5zSXBBdEsySElJRGpjUk5vZ3F6OUJkTXdIUHR2SEprZkZrY0F0Nzl0?=
 =?utf-8?B?RFVpbkVOc1JBTXRXSU9xR0dxcnd0YVBFK1Y3Y05pbExWY3UzUml4U29EZmw4?=
 =?utf-8?B?Unk3cXJUNmJwVVRDaS9jRVhKV3BPWERHSWQ4djZzM2FUN2NsOURLYVlmUU9X?=
 =?utf-8?B?QWtoRlRrYUhkQWtYR3NPVmU0Vzd4bXRpcWtVb091Tm0zZHhWMmtNM1VPWXE5?=
 =?utf-8?B?bHZSMkUvN0JmK0drZnlaVDk3Zm1DYkQwT1E4c3hQVXFCL1dqYU1VZ1pBS3h1?=
 =?utf-8?B?Q0had0NHek9SM2FZckp0SDVBN0c2dW9Ud0dWeWlPWUdHWTNJRmhBU2dNN1gz?=
 =?utf-8?B?UDNWMzNMd2xGSXFPSndlelZtQ3M2RS94ZGtQQXcremIzbEg3UU9RMW1ScW1a?=
 =?utf-8?B?ZU1VaktIcHF5dytaOGFTaUNVTVpXaC9vZk9Mank2V1RXczlEMU1wa0FCbFNL?=
 =?utf-8?B?S25nZzU4UDcxU3lBekYzaEcwbWs2bENJSFVSWERudCtGWmI5eDdOTVdpQ0dL?=
 =?utf-8?B?ZCtXQlI1cmdSb2w5YVJMR1d5aWsyNnovYU1WeUlXcmpETWtNMUppY2xodm5i?=
 =?utf-8?B?WEpvVG1yekE1emtzazF4Q3VrTzc3b3EwdGZhcjBwKzlWZmFpV01QV09rNUg3?=
 =?utf-8?B?QTdRVmpRSS9LRTRJcUZoaXA4Z0E1SGlyR3QyNk80cjBTU0RVTlI2M2hqcWF6?=
 =?utf-8?B?Z0M5VWF1YzQ4YU1yNlNzUEYyV0RoNHdVVGlvYVM1T1REUitua2Z5UXdSclJh?=
 =?utf-8?B?V0lPMGxtSkMyOERiZ3F5NS9ZaGJDY2xzSUZrelMzTHBlbUpQb09YNDVNZHlH?=
 =?utf-8?B?cU5xWjdHUGVHZ3JLM2NkOU1UbHp4S2FqbzdlWDJuN0crRHRMZGFMek9EeFBB?=
 =?utf-8?B?TjNNb1hON1BOUUVtRUlMMXhYOGhzdHBTK290WmtidXVWOHFYSFZYT2RGTWlt?=
 =?utf-8?B?TjlXNVNiZHdlek9pRDFDZjR5THRGcm5iR1pDcXh2bjBwUllTUEVhN3NzcmZx?=
 =?utf-8?B?YjhiY1ZnOWNxZ0xkRUJyVGtMeU16Z3Q5L2RtRzlHa1YxYVNpak80aklaQXdq?=
 =?utf-8?B?M05SSHRKdlE3VlB6eG03UVhqNkg1a0JZbXdnYjRmNHc3S2NPOVNBWmhKNFZX?=
 =?utf-8?B?L1dhM202ZjFhNDFUVVpJZ052WExSVzhwVkQwNlZyUlhwT2NhQWRLWnVPOXlX?=
 =?utf-8?B?ZGxiOFAxY1VmYkd0dmI4ZXQ3RmZsU2gwdFl6ajJMaVl4QVlSNE1lRXIxZTll?=
 =?utf-8?B?UVZqMkJWZG9iMTVmOFIxMFAwYkNyUzR0ZG5EaUVad0tGOTZFcC9MeG1IUHdD?=
 =?utf-8?B?Z0Q1S1dFd2g2MnRHKzU2dERkT0Fub252VGJGTUE4WEFBR2VFc1o3bnNnTWpI?=
 =?utf-8?Q?xUS6Lo0YTLQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 20:18:15.4592 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b09a6c4-fe7d-43a6-9aed-08dd1fa11abe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5988
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

New stuff for 6.14.

The following changes since commit 438b39ac74e2a9dc0a5c9d653b7d8066877e86b1:

  drm/amdkfd: pause autosuspend when creating pdd (2024-12-10 10:26:18 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.14-2024-12-18

for you to fetch changes up to 695c2c745e5dff201b75da8a1d237ce403600d04:

  drm/amdgpu: Handle NULL bo->tbo.resource (again) in amdgpu_vm_bo_update (2024-12-18 12:39:08 -0500)

----------------------------------------------------------------
amd-drm-next-6.14-2024-12-18:

amdgpu:
- RAS updates
- ISP updates
- SDMA queue reset support
- Rework DPM powergating interfaces
- Documentation updates and cleanups
- Panel replay fixes
- DCN 3.5 updates
- DP tunneling fixes
- Use a pm notifier to more gracefully handle VRAM eviction on suspend or hibernate
- Add debugfs interfaces for forcing scheduling to specific engine instances
- GG 9.5 updates
- IH 4.4 updates
- Make missing optional firmware less noisy
- PSP 13.x updates
- SMU 13.x updates
- VCN 5.x updates
- JPEG 5.x updates
- Misc cleanups
- GC 12.x updates
- DRM panic support
- DC FAMS updates
- DSC fixes
- job handling fixes

amdkfd:
- GG 9.5 updates
- Logging improvements
- Misc cleanups
- Various Optimizations

----------------------------------------------------------------
Alex Deucher (17):
      drm/amdgpu: update irq sec header for jpeg 5.0.0
      drm/amdgpu: update irq sec header for vcn 5.0.0
      drm/amdgpu: add ip_dump support for vcn 5.0.1
      drm/amdgpu: add sysfs reset mask for vcn 5.0.1
      drm/amdgpu/jpeg4.0.3: use num_jpeg_inst for SR-IOV
      drm/amdgpu/jpeg5.0.1: use num_jpeg_inst for SR-IOV
      drm/amdgpu: add generic display panic helper code
      drm/amd/display: add clear_tiling hubp callbacks
      drm/amd/display: add clear_tiling mi callbacks
      drm/amd/display/dc: add helper for panic updates
      drm/amd/display: add non-DC drm_panic support
      drm/amdgpu/nbio7.7: fix IP version check
      drm/amdgpu/nbio7.0: fix IP version check
      drm/amdgpu/nbio7.11: fix IP version check
      drm/amdgpu/mmhub4.1: fix IP version check
      drm/amdgpu/gfx12: fix IP version check
      drm/amdgpu/smu14.0.2: fix IP version check

Alex Hung (1):
      drm/amd/display: Fix uninitialized variables in amdgpu_dm_debugfs

Alex Sierra (5):
      drm/amd: define gc ip version local variable
      drm/amdgpu: Set proper MTYPE for GC 9.5.0
      drm/amd: update mtype flags for gfx 9.5.0
      drm/amdkfd: add gc 9.5.0 support on kfd
      drm/amdgpu: add ih cam support for IH 4.4.4

Alvin Lee (1):
      drm/amd/display: Update FAMS2 config cmd

Andrew Martin (3):
      drm/amdkfd: Uninitialized pointer read
      drm/amdkfd: Failed to check various return code
      drm/amdgpu: Failed to check various return code

Aric Cyr (4):
      drm/amd/display: 3.2.311
      drm/amd/display: 3.2.312
      drm/amd/display: 3.2.313
      drm/amd/display: 3.2.314

Asad Kamal (3):
      drm/amd/pm: Add smu_v13_0_12 support
      drm/amd/pm: Add mode2 support for SMU v13.0.12
      drm/amdgpu: Fetch refclock for SMU v13.0.12

Aurabindo Pillai (1):
      drm/amd: Update atomfirmware: add new retimer definition

Ausef Yousof (2):
      drm/amd/display: Populate chroma prefetch parameters, DET buffer fix
      drm/amd/display: Overwriting dualDPP UBF values before usage

Austin Zheng (2):
      drm/amd/display: DML21 Update Prefetch Calculations
      drm/amd/display: DML21 Reintegration For Various Fixes

Bokun Zhang (1):
      drm/amdgpu/vcn: reset fw_shared under SRIOV

Boyuan Zhang (8):
      drm/amd/pm: power up or down vcn by instance
      drm/amd/pm: add inst to smu_dpm_set_vcn_enable
      drm/amd/pm: add inst to set_powergating_by_smu
      drm/amd/pm: add inst to dpm_set_powergating_by_smu
      drm/amdgpu: add inst to amdgpu_dpm_enable_vcn
      drm/amdgpu: pass ip_block in set_powergating_state
      drm/amdgpu: pass ip_block in set_clockgating_state
      drm/amdgpu: move per inst variables to amdgpu_vcn_inst

Candice Li (5):
      drm/amdgpu: Add psp v14_0_3 ras support
      drm/amdgpu: Add umc v8_14_0 ip headers
      drm/amdgpu: Add umc v8_14 ras functions
      drm/amdgpu: Support nbif v6_3_1 fatal error handling
      drm/amdgpu: Enable psp v14_0_3 RAS support for non-SRIOV configurations.

Charlene Liu (3):
      drm/amd/display: correct dcn351 dpm clk table based on pmfw_drv_if
      drm/amd/display: update dcn351 used clock offset
      drm/amd/display: init dc_power_state

Chris Park (2):
      drm/amd/display: Update color space, bias and scale programming sequence
      drm/amd/display: Block Invalid TMDS operation

Christian König (3):
      drm/amdgpu: fix amdgpu_coredump
      drm/amdgpu: set the VM pointer to NULL in amdgpu_job_prepare
      drm/amdgpu: partially revert "reduce reset time"

Christophe JAILLET (1):
      drm/amd/pm: Fix an error handling path in vega10_enable_se_edc_force_stall_config()

Cruise (1):
      drm/amd/display: Adjust DPCD read for DP tunneling

Dennis Chan (1):
      drm/amd/display: Revised for Replay Pseudo vblank control

Dheeraj Reddy Jonnalagadda (1):
      drm/amdgpu: simplify return statement in amdgpu_ras_eeprom_init

Dillon Varone (3):
      drm/amd/display: Add support for FAMS2+ interface versions
      drm/amd/display: Add new message for DF throttling optimization on dcn401
      drm/amd/display: Re-validate streams on commit_streams

Dr. David Alan Gilbert (5):
      drm/amd/display: Remove unused enable_surface_flip_reporting
      drm/amd/display: Remove unused dwb3_set_host_read_rate_control
      drm/amd/display: Remove unused dc_stream_warmup_writeback
      drm/amd/display: Remove unused mmhubbub_warmup field
      drm/amd/display: Remove unused dcn_find_dcfclk_suits_all

Fangzhi Zuo (1):
      drm/amd/display: Fix Mode Cutoff in DSC Passthrough to DP2.1 Monitor

Gabe Teeger (1):
      Revert "drm/amd/display: Revised for Replay Pseudo vblank"

George Shen (1):
      drm/amd/display: Disable MPC rate control on ODM pipe update

Harry VanZyllDeJong (2):
      drm/amd/display: populate VABC support in DMCUB
      drm/amd/display: Fix brightness adjustment on MiniLED

Hawking Zhang (5):
      drm/amdgpu: Apply gc v9_5_0 golden settings
      drm/amdgpu: Add psp v13_0_12 firmware specifiers
      drm/amdgpu: Load spdm_drv for psp v13_0_12
      drm/amdgpu: Enable RAS for psp v13_0_12
      drm/amdgpu: Init mmhub v1_8_1 ras func

Ivan Stepchenko (1):
      drm/amdgpu: Fix potential NULL pointer dereference in atomctrl_get_smc_sclk_range_table

Jesse.zhang@amd.com (7):
      drm/amdgpu/sdma7: Implement resume function for each instance
      drm/amdgpu/sdma7: implement queue reset callback for sdma7
      drm/amdgpu/mes12: Implement reset sdmav7 queue function by mmio
      drm/amdgpu/mes12: Implement reset gfx/compute queue function by mmio
      drm/amdgpu/sdma7: Add queue reset sysfs for sdmav7
      drm/amdgpu/gfx12: clean up kcq reset code
      drm/amdgpu/gfx11: clean up kcq reset code

Jiadong Zhu (3):
      drm/amd/pm: update smu_v13_0_6 smu header
      drm/amd/pm: implement dpm sdma reset function
      drm/amdgpu/sdma4.4.2: implement ring reset callback for sdma4.4.2

Jiapeng Chong (1):
      drm/amd/display: use swap() in update_phy_id_mapping()

Jinzhou Su (2):
      drm/amdgpu: Add secure display v2 command
      drm/amdgpu: return error when eeprom checksum failed

Jocelyn Falempe (1):
      drm/amd/display: add DC drm_panic support

Joshua Aberback (1):
      drm/amd/display: Refactor dcn31_panel_construct to avoid assert

Karol Przybylski (1):
      drm/amdgpu: Fix potential integer overflow in scheduler mask calculations

Karthi Kandasamy (1):
      drm/amd/display: expose DCN401 HUBP functions

Lancelot SIX (3):
      drm/amdkfd: update buffer_{store,load}_* modifiers for gfx940
      drm/amdkfd: Adjust CWSR trap handler for gfx950
      drm/amdkfd: Handle save/restore of lds allocated in 1280B blocks

Le Ma (5):
      drm/amdgpu/gfx: add gfx950 microcode
      drm/amdgpu: add initial support for gfx950
      drm/amdkfd: update the cwsr area size for gfx950
      drm/amdgpu: add initial support for sdma444
      drm/amdgpu: add psp 13_0_12 version support

Leo Li (2):
      drm/amd/display: Make DMCUB tracebuffer debugfs chronological
      drm/amdgpu: rename register headers to dcn_2_0_1

Lijo Lazar (7):
      drm/amdgpu: Prefer RAS recovery for scheduler hang
      drm/amdgpu: Simplify cleanup check for FRU sysfs
      drm/amdgpu: Remove gfxoff usage
      drm/amdgpu: Increase FRU File Id buffer size
      drm/amd/pm: Revert state if force level fails
      drm/amdgpu: Avoid VF for RAS recovery source check
      drm/amdgpu: Use dbg level for VBIOS check messages

Mario Limonciello (6):
      drm/amd: Invert APU check for amdgpu_device_evict_resources()
      drm/amd: Add Suspend/Hibernate notification callback support
      drm/amd: Add the capability to mark certain firmware as "required"
      drm/amd: Show an info message about optional firmware missing
      drm/amd: Update strapping for NBIO 2.5.0
      drm/amd: Require CONFIG_HOTPLUG_PCI_PCIE for BOCO

Meera Patel (1):
      drm/amd/display: initialize uninitialized variable

Michel Dänzer (1):
      drm/amdgpu: Handle NULL bo->tbo.resource (again) in amdgpu_vm_bo_update

Mirsad Todorovac (1):
      drm/admgpu: replace kmalloc() and memcpy() with kmemdup()

Nicholas Kazlauskas (4):
      drm/amd/display: Add disable_ips_in_dpms_off flag for IPS
      drm/amd/display: Don't allow IPS2 in D0 for RCG Dynamic
      Revert "drm/amd/display: Don't allow IPS2 in D0 for RCG Dynamic"
      drm/amd/display: Apply (some) policy for DML2 formulation on DCN35/DCN351

Peterson (2):
      drm/amd/display: Check that hw cursor is not required when falling back to subvp sw cursor
      drm/amd/display: Use resource_build_scaling_params for dcn20

Philip Yang (6):
      drm/amdgpu: Don't enable sdma 4.4.5 CTXEMPTY interrupt
      drm/amdkfd: KFD interrupt access ih_fifo data in-place
      drm/amdgpu: Optimize gfx v9 GPU page fault handling
      drm/amdkfd: Queue interrupt work to different CPU
      drm/amdkfd: Improve signal event slow path
      drm/amdgpu: Show warning message if IH ring overflow

Pierre-Eric Pelloux-Prayer (3):
      drm/amdgpu: don't access invalid sched
      drm/amdgpu: drop the amdgpu_device argument from amdgpu_ib_free
      drm/amdgpu: remove useless init from amdgpu_job_alloc

Pratap Nirujogi (1):
      drm/amd/amdgpu: Add support for isp buffers

Prike Liang (2):
      drm/amdgpu: reduce the mmio writes in kiq setting
      drm/amdgpu: Avoid to release the FW twice in the validated error

Randy Dunlap (1):
      drm/amdgpu: device: fix spellos and punctuation

Rodrigo Siqueira (1):
      Revert "drm/amd/display: Fix green screen issue after suspend"

Samson Tam (4):
      drm/amd/display: Enable EASF based on luma taps only
      drm/amd/display: Add support for custom recout_width in SPL
      drm/amd/display: fix v tap calculation for non-adaptive scaling in SPL
      drm/amd/display: clean up SPL code

Sathishkumar S (5):
      drm/amdgpu: Add amdgpu_vcn_sched_mask debugfs
      drm/amdgpu: add irq source ids for VCN5_0/JPEG5_0
      drm/amdgpu: update macro for maximum jpeg rings
      drm/amdgpu: Add JPEG5_0_1 support
      drm/amdgpu: enable JPEG5_0_1 ip block

Shikang Fan (1):
      drm/amdgpu: Check fence emitted count to identify bad jobs

Shiwu Zhang (1):
      drm/amdgpu: Enable xgmi for gfx v9_5_0

Shunlu Zhang (1):
      drm/amd/display: delete legacy code

Sonny Jiang (4):
      drm/amdgpu: Add VCN_5_0_1 firmware
      drm/amdgpu: Add VCN_5_0_1 codec query
      drm/amdgpu: Add VCN_5_0_1 support
      drm/amdgpu: Enable VCN_5_0_1 IP block

Srinivasan Shanmugam (5):
      drm/amd/amdgpu: Add missing kdoc 'inst' parameter in 'smu_dpm_set_power_gate' function
      drm/amd/amdgpu/vcn: Fix kdoc entries for VCN clock/power gating functions
      drm/amd/amdgpu: Add Descriptions to Process Isolation and Cleaner Shader Sysfs Functions
      drm/amd/amdgpu: Add Annotations to Process Isolation functions
      drm/amd/display: Fix NULL pointer dereference in dmub_tracebuffer_show

Sunil Khatri (2):
      drm/amdgpu: Update the variable name to dma_buf
      drm/amdgpu: add "restore" missing variable comment

Taimur Hassan (1):
      drm/amd/display: [FW Promotion] Release 0.0.246.0

Tao Zhou (21):
      drm/amdgpu: simplify RAS page retirement in one memory row
      drm/amdgpu: remove redundant RAS error address coversion code
      drm/amdgpu: store PA with column bits cleared for RAS bad page
      drm/amdgpu: make convert_ras_err_addr visible outside UMC block
      drm/amdgpu: reduce memory usage for umc_lookup_bad_pages_in_a_row
      drm/amdgpu: add return value for convert_ras_err_addr
      drm/amdgpu: add TA_RAS_INV_NODE value
      drm/amdgpu: add flag to indicate the type of RAS eeprom record
      drm/amdgpu: do RAS MCA2PA conversion in device init phase
      drm/amdgpu: store only one RAS bad page record for all pages in one row
      drm/amdgpu: retire RAS bad pages in different NPS modes
      drm/amdgpu: add function to find all memory pages in one physical row
      drm/amdgpu: support to find RAS bad pages via old TA
      drm/amdgpu: save UMC global channel index to eeprom
      drm/amdgpu: add a flag to indicate UMC channel index version
      drm/amdgpu: add interface to get die id from memory address
      drm/amdgpu: parse legacy RAS bad page mixed with new data in various NPS modes
      drm/amdgpu: remove is_mca_add for ras_add_bad_pages
      drm/amdgpu: set UMC PA per NPS mode when PA is 0
      drm/amdgpu: split ras_eeprom_init into init and check functions
      drm/amdgpu: correct the calculation of RAS bad page

Wayne Lin (3):
      drm/amd/display: Adjust dc_stream_forward_crc_window to accept assignment of phy_id
      drm/amd/display: Fix phy id mapping issue for secure display
      drm/amd/display: Adjust secure_display_context data structure

Xiaogang Chen (1):
      drm/amdkfd: Differentiate logging message for driver oversubscription

Yang Wang (3):
      drm/amdgpu: move common ACA ipid defines into amdgpu_aca.h
      drm/amdgpu: add ACA support for vcn v4.0.3
      drm/amdgpu: add ACA support for jpeg v4.0.3

Zhongwei (1):
      drm/amd/display: remove clearance code of force_ffu_mode flag in dmub_psr_copy_settings()

 drivers/gpu/drm/amd/amdgpu/Makefile                |    8 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |   26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  125 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   80 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h        |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.h     |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   90 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h             |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c            |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  101 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  332 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   77 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |   21 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   81 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   31 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  113 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |   11 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |    4 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |    4 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |   10 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                 |    4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   31 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   31 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   31 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   30 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   29 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   42 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   39 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.h             |    2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   14 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   16 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   34 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   28 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |   14 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   48 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   24 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |    7 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |    9 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |    9 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   59 +-
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |    8 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |    8 +-
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |    8 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/imu_v12_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |   14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  104 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |   20 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |  708 +++++++++++
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.h           |   29 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  136 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c          |    2 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |   11 +-
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c           |   81 ++
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c             |   11 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |    6 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   12 +
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |   10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   14 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  116 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |  299 +++--
 drivers/gpu/drm/amd/amdgpu/si.c                    |    4 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |   10 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |    4 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   34 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    8 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |   27 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |    3 +
 drivers/gpu/drm/amd/amdgpu/ta_secureDisplay_if.h   |   24 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |  267 ++--
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |   17 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_14.c             |  160 +++
 drivers/gpu/drm/amd/amdgpu/umc_v8_14.h             |   51 +
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |    8 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |   17 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |   17 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |    8 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |   12 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |    6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   25 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   24 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   33 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   34 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   40 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  121 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   34 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |   79 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.h            |    5 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            | 1118 +++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.h            |   29 +
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |   11 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   12 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    6 +-
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |  491 ++++++++
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm  |   58 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h             |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  135 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    3 +
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |    3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   11 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |    2 +
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c         |   64 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   13 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |   41 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    5 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   13 +-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |   10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   22 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    5 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   38 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    8 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  321 ++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |   25 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   37 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   52 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |    3 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |    2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    5 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |    4 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn351_clk_mgr.c  |  140 +++
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  225 +++-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.h   |    4 +
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.h   |   41 +-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |   46 +
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.h |    1 +
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.c     |   23 +
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.h     |    3 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   21 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   11 -
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |   53 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    8 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   37 +-
 drivers/gpu/drm/amd/display/dc/dc_plane.h          |    3 +
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |   17 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    5 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |    3 +
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c |   34 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |    3 +-
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |   34 +-
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |  132 --
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |    1 +
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |   15 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    |   41 +-
 .../display/dc/dml2/display_mode_core_structs.h    |  109 +-
 .../drm/amd/display/dc/dml2/display_mode_util.c    |    6 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |   16 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.c    |   80 +-
 .../dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h |    3 +-
 .../dc/dml2/dml21/inc/dml_top_display_cfg_types.h  |   52 +-
 .../dml2/dml21/inc/dml_top_soc_parameter_types.h   |    2 +
 .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |   77 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c   |   42 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     | 1301 +++++++++++++-------
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.h     |    2 +-
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |  129 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.c  |  223 +++-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.h  |    6 +-
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c   |   49 +-
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  394 +++---
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h  |    7 +
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c  |    1 -
 .../dml2/dml21/src/dml2_top/dml2_top_interfaces.c  |   51 +
 .../dc/dml2/dml21/src/dml2_top/dml2_top_legacy.c   |    4 +
 .../dc/dml2/dml21/src/dml2_top/dml2_top_legacy.h   |    9 +
 .../dml21/src/dml2_top/dml2_top_optimization.c     |  307 -----
 .../dml21/src/dml2_top/dml2_top_optimization.h     |   33 -
 .../dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c    | 1177 ++++++++++++++++++
 .../{dml_top_mcache.h => dml2_top_soc15.h}         |   20 +-
 .../dc/dml2/dml21/src/dml2_top/dml_top_mcache.c    |  549 ---------
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.c |    5 +
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.h |   46 +-
 .../dml21/src/inc/dml2_internal_shared_types.h     |   60 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   54 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   35 +-
 .../amd/display/dc/dml2/dml_display_rq_dlg_calc.c  |   12 -
 .../gpu/drm/amd/display/dc/dwb/dcn30/dcn30_dwb.c   |   13 -
 .../gpu/drm/amd/display/dc/dwb/dcn30/dcn30_dwb.h   |    1 -
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c |   15 +
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.h |    2 +
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c |   15 +
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h |    2 +
 .../drm/amd/display/dc/hubp/dcn201/dcn201_hubp.c   |    1 +
 .../gpu/drm/amd/display/dc/hubp/dcn21/dcn21_hubp.c |    1 +
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c |   17 +
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.h |    2 +
 .../gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c |    1 +
 .../gpu/drm/amd/display/dc/hubp/dcn32/dcn32_hubp.c |    3 +-
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c |    1 +
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |   35 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h   |   25 +
 .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |    1 -
 .../drm/amd/display/dc/hwss/dcn301/dcn301_init.c   |    1 -
 .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |    3 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |   12 +
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |    3 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |    1 +
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |    1 -
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   12 +
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |    1 -
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |    1 -
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |    5 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |    1 -
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |    4 -
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    6 +-
 drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h     |    4 -
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |   59 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |    1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |    2 +
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |    4 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |    4 +
 .../display/dc/link/protocols/link_dp_capability.c |   21 +-
 .../gpu/drm/amd/display/dc/mpc/dcn30/dcn30_mpc.c   |   18 +
 .../gpu/drm/amd/display/dc/mpc/dcn30/dcn30_mpc.h   |    7 +
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |    4 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   57 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |    4 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |    4 +
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |  116 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h  |   16 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    3 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  154 ++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    4 -
 drivers/gpu/drm/amd/include/amd_shared.h           |    4 +-
 .../dcn/{dcn_2_0_3_offset.h => dcn_2_0_1_offset.h} |    4 +-
 .../{dcn_2_0_3_sh_mask.h => dcn_2_0_1_sh_mask.h}   |    4 +-
 .../amd/include/asic_reg/umc/umc_8_14_0_offset.h   |   29 +
 .../amd/include/asic_reg/umc/umc_8_14_0_sh_mask.h  |   37 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |   17 +-
 .../drm/amd/include/ivsrcid/vcn/irqsrcs_vcn_5_0.h  |   47 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    4 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  108 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    4 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |    8 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |    7 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |    8 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c    |    2 +
 .../drm/amd/pm/powerplay/hwmgr/vega10_powertune.c  |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   86 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    8 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    3 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   20 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   19 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   26 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   38 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |    2 +-
 307 files changed, 10497 insertions(+), 3722 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umc_v8_14.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umc_v8_14.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn351_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_interfaces.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_legacy.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_legacy.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.c
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c
 rename drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/{dml_top_mcache.h => dml2_top_soc15.h} (58%)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c
 rename drivers/gpu/drm/amd/include/asic_reg/dcn/{dcn_2_0_3_offset.h => dcn_2_0_1_offset.h} (99%)
 rename drivers/gpu/drm/amd/include/asic_reg/dcn/{dcn_2_0_3_sh_mask.h => dcn_2_0_1_sh_mask.h} (99%)
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_14_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_14_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/ivsrcid/vcn/irqsrcs_vcn_5_0.h
