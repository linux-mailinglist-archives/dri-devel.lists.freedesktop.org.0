Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB46BD38778
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 21:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F4610E923;
	Fri, 16 Jan 2026 20:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QXmyI3Ry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013040.outbound.protection.outlook.com
 [40.107.201.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFF510E062;
 Fri, 16 Jan 2026 20:26:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flljpGPbPUQtn0KpxwD5ZrZ1GJEh3nKX0DiM11+BbXC+2VzxOi5Cdh6SZ75PCRjKfdZWUSSp5KPMV2dxjDeLaBW/tyffBPI9e+LkTJLHKHi71uYhYzIbv17wbEoWNpr71PUeQmNxRvKymoPrzMakPIie6E8SkSAOqTVZU0ZnVKX4beDCMcfm86xwv5lp+hTDJv4baC8F/+NVCsGDKYVb7Kk1kMsR8tZ56O+L9LFH/jrUG2iAY7kVMXP/MhVjsO69J2/SAwU1p0whljGUaSVo3/pJWA33RjNNK8d2uYe3nwsYvU0I88aHmDObGrzsOEyvcIPKgWmia0aWwrGMU0QOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjSuUQ2tIUnZM8G4oZdQRzduobCVMtEj23IZJAczfGo=;
 b=N9RCt4St+2SMILuVNmQRWekHTzaBaYAD+iwgWKB1Citr/WdjtXZL9Zf4odeVgjVQSZD+SZKvgUl71Jlb/Pb7BzNLrSoQedHNIOrr9OKI+lEeMRsbvtWzchRY8D7MAQnNQqjo88cL4YHB9oSMJPvJ6Hlxjnc4uU6XwPyHlw6HN+FT2E9EG8YMuCZREv2ggpcK5zvoYWnTemerXvmabpMPdzq7CBxIalfVdTv/o9zaRwaMH6rCCzFAuJPgCeyh5WGKdbjDHbPQ/ycQLjIHCXutM8C/ZcRiO//YltvVaR5rNJ7bssoH/0AG3pFY8ymkHJm9F33MeGMloE7Uc+rGEt2FRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjSuUQ2tIUnZM8G4oZdQRzduobCVMtEj23IZJAczfGo=;
 b=QXmyI3Ry5Yg6m0LQFEJ5x4jATBv2NDNOtFpc8vH/yRNY+H6OVJ8waB060/gOZE4gMOcZWkbLaRLfsBkpYKKqcRcKSXNmAwE+U0JUd6Tt+beaMDqjA1DShk4peARlJpKWViR6sFcPH0oSXe0R81v9kRciwyV5VhQpLx7smRXFT8o=
Received: from BLAPR05CA0023.namprd05.prod.outlook.com (2603:10b6:208:36e::25)
 by SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9aa) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 20:26:23 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::3c) by BLAPR05CA0023.outlook.office365.com
 (2603:10b6:208:36e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.5 via Frontend Transport; Fri,
 16 Jan 2026 20:26:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 20:26:23 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 16 Jan
 2026 14:26:22 -0600
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 16 Jan 2026 14:26:22 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.20
Date: Fri, 16 Jan 2026 15:26:07 -0500
Message-ID: <20260116202609.23107-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: 1441e898-b051-4a60-ced1-08de553d842d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0RyT3IrQitOU0RnMXZyMXZlbk5waWYvTXk2S3p0bHNEVXhNMmc5dGlyeEdv?=
 =?utf-8?B?WEZxVDdIOFVicGY2YmwxOGpsWlo1OWlMQzcwYk5GUEk1VTNlZE1KVGI3SlhT?=
 =?utf-8?B?TTVyQnQ4MktMem1TWm5xZkpXNnBidXREbU9GSkxvMC8za1RzODR4L3JlOXBs?=
 =?utf-8?B?aFNOMVJOZTVmbG9MYzlXaGZBdDJlSEx0ZnBNYW11dmZjNXNyS1lzNUJ6VEtH?=
 =?utf-8?B?a2hjOHF6V3duWE05dE1uN0lZS3FjZGdhRk5kalcvenJkcXdna29kTkF0cWhL?=
 =?utf-8?B?WFBjN1NWaDYvc1hzMjdOQU5sQWgvRjdqbTBseHNWc096Uyt3cFpBYmRjeVUr?=
 =?utf-8?B?MDJtcm4vM0pLcTdMZnN1MGppOElaQ0JhcERyR2RjeEtBMGwxZlNEZVU4Z3Jr?=
 =?utf-8?B?RHdlSmNobUlOVFA1RDY4d3BuNFZYemZ2MjFlOW80S3FSMVhwWWJmRmdsbkpi?=
 =?utf-8?B?alFCditmQU9ET1VGSGZNUEVKOHg0dWlIV21aNGR1byt1OGFaVlBmQ2JiU2R2?=
 =?utf-8?B?ekQ5Z1NrTUJhSEVUcWlES1VFMkVkeFBOdmhRM0swNVRhM3hXelMyaTkvMVlu?=
 =?utf-8?B?L1Z0Kzc5RkZTTGNiQ1A1Sjh3WG90WHE1Y0VRQ3ZwaVJYUFAyd2pjcUp2clJZ?=
 =?utf-8?B?U091bEd2Nm41eGN0RVd1M0ZzU1ZuWFdiMVpTZHNMUDEyNWJlMmRmeE5jL1dV?=
 =?utf-8?B?dGZlZGk2TllXUDVkMGQ3WFNIcVArNWNBQnNRQklsT0FaT1J5T1R1cThvK1d3?=
 =?utf-8?B?UW9BOThVZWoxcTg4KzlwUG5KZWhIQmU0KzhHNEhDNFoweWtIV2twTnhBVDR5?=
 =?utf-8?B?SmZxdlZmL2tCdzUzTTZoMHBpM3Nua3Q1bVdFNlBtVzBmYTJnRWh2bnlPN2Iz?=
 =?utf-8?B?cmFRTWhiZE0rd2NzY0NyTXNmMUorWm1qV0NHNSs3aXhXZ2RLY3lWTXBkOE1W?=
 =?utf-8?B?bzlydzU2bHhrZWJDUXdFeGg2MXpRZlVsVXlPelhGVEVLaDhsdmtWeGlKMHFN?=
 =?utf-8?B?a01WMmk3c05HaUJid0E4MlgxeFdRTit2WG5qV3hCWTBWZE91WHVhTSsyMzZ0?=
 =?utf-8?B?aUFUVUJSVkZNcXBqc1duWnhxNWNGY0ttYVozTnlCTTBTcldoeEtEK2JsRUta?=
 =?utf-8?B?QjVucDFWYVlQM0kwdk16em92TTV4L01Nc3pnSmF0K2RPcEMzMHJnd3oyMDBq?=
 =?utf-8?B?OEFBdVV2WnVGWG1GZjFJcjc1ZTdkZU5nU0JlRGY5THFIT2s2THMzbXZIeW5Q?=
 =?utf-8?B?YmVoWmpLL0ZSNHFMTDJmUjJIR2x6eTRBNEhMVHI0RTBobzYwY0MzOWpwcE54?=
 =?utf-8?B?d0dlNjcxdlBXWGR2MC8zMUlaWUhCNTlaZ0ZmcTk4TzN6Y3BtZSsrUVV5L1pp?=
 =?utf-8?B?cFlyQVQzK0xHVHVEeWlUOTdxRXU5VHlqc0FlSVFienkvWkNObWQ3Qzdwd25k?=
 =?utf-8?B?QW1OMUxjMk9SSStmcnJPT0h3ODcvdTgxT2lLMTIvZXV1RUxyc20vS3NLcCtK?=
 =?utf-8?B?TEJsQWVRQ1BpQVpGeVlMcTlaUHRvdTVUWnFYV29DNmZNTDdUYkFLSlFRSW5V?=
 =?utf-8?B?QUdzMElkSm9CMndJMTJ0WDBoVTBGYmtMUjMxMEdTaFNqNkFyU283Y29ZRUho?=
 =?utf-8?B?RjBtQ3VGbmlLRDRkbk54QlhNSys5c3BuTGNWK1hXZHN6S1YzNjVjZFM5aG1O?=
 =?utf-8?B?a1JiMkNjUkl4R0VLaHh3bHE3cy9LNXhidmNYSGJXQnZkdUdhalI2dVVjeWtF?=
 =?utf-8?B?R2hMbkk3Q3cxWmpteStJU2xpT0lHT24xZyt1bW53ZndKMW5ub09tT0Q2dDNW?=
 =?utf-8?B?RUF1MXAydEZEYWlNOEV6U2dqQlZFK2ZyQmd3WU1seERUclFtQnhiNDhhVlJK?=
 =?utf-8?B?TCt6NGFBM3pGWU1EUVlMb0czbXdueGU5UG42ZDRKRWZ6c3VnY0hRZHhvOFpm?=
 =?utf-8?B?V09ma1ltRmNnVzZPejlMWktFbFZQU05Za25NOFA0MXhpWWZKQUNBemJJR2Vy?=
 =?utf-8?B?dXF5WEFPOVorcW1PS2c2VzMwUzRCbkZVUnhIR05pZlRVS3kyUlpSajJBMWYz?=
 =?utf-8?B?V01UdDRndStMbjV4ZkpSRVZ1SlhTLzI2T0RIenY1SXpjaGorSUlHSDdWZFAr?=
 =?utf-8?B?UW1Mci9SMGpPd0JUUFlYOXhiTTArT1M2dC92eTlqdEE2czM1SjVZR0QzUDd0?=
 =?utf-8?B?M2c9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 20:26:23.1713 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1441e898-b051-4a60-ced1-08de553d842d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C
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

Updates for 6.20.

The following changes since commit 38a0f4cf8c6147fd10baa206ab349f8ff724e391:

  Revert duplicate "drm/amdgpu: disable peer-to-peer access for DCC-enabled GC12 VRAM surfaces" (2026-01-08 15:18:13 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.20-2026-01-16

for you to fetch changes up to 6a681cd9034587fe3550868bacfbd639d1c6891f:

  drm/amd/display: Add an hdmi_hpd_debounce_delay_ms module (2026-01-14 14:28:59 -0500)

----------------------------------------------------------------
amd-drm-next-6.20-2026-01-16:

amdgpu:
- SR-IOV fixes
- Rework SMU mailbox handling
- Drop MMIO_REMAP domain
- UserQ fixes
- MES cleanups
- Panel Replay updates
- HDMI fixes
- Backlight fixes
- SMU 14.x fixes
- SMU 15 updates

amdkfd:
- Fix a memory leak
- Fixes for systems with non-4K pages
- LDS/Scratch cleanup
- MES process eviction fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: make sure userqs are enabled in userq IOCTLs

Aurabindo Pillai (2):
      drm/amd/display: switch to drm_dbg_kms() from DRM_DEBUG_KMS
      drm/amd/display: switch to drm_dbg_ macros instead of DRM_DEBUG_ variants

Ausef Yousof (1):
      drm/amd/display: correct clip x assignment in cursor programming

Christian König (1):
      drm/amdgpu: Drop MMIO_REMAP domain bit and keep it Internal

Christophe JAILLET (1):
      drm/amdgpu: Slightly simplify base_addr_show()

Cruise Hung (1):
      drm/amd/display: Always update divider settings for DP tunnel

Derek Lai (1):
      drm/amd/display: revert "write default Vesa Aux backlight control in dmub"

Dmytro Laktyushkin (1):
      drm/amd/display: only power down dig on phy endpoints

Donet Tom (3):
      drm/amdkfd: Relax size checking during queue buffer get
      drm/amdkfd: Fix SVM map/unmap address conversion for non-4k page sizes
      drm/amdkfd: Fix GART PTE for non-4K pagesize in svm_migrate_gart_map()

Haoxiang Li (1):
      drm/amdkfd: fix a memory leak in device_queue_manager_init()

Harish Kasiviswanathan (1):
      drm/amdkfd: No need to suspend whole MES to evict process

Ivan Lipski (1):
      drm/amd/display: Add an hdmi_hpd_debounce_delay_ms module

Jack Chang (2):
      drm/amd/display: DPCD for Selective Update
      drm/amd/display: PR error HPD_IRQ handling

Joshua Aberback (1):
      drm/amd/display: Re-implement minimal transition deferral

Lang Yu (2):
      drm/amdgpu/mes: Simplify hqd mask initialization
      drm/amdkfd: Switch to using GC VERSION to decide LDS/Scratch base

Leo Chen (1):
      drm/amd/display: Add global fgcg function prototype to DCCG

Lijo Lazar (26):
      drm/amd/pm: Add smu message control block
      drm/amd/pm: Add message control for SMUv11
      drm/amd/pm: Add message control for SMUv12
      drm/amd/pm: Add message control for SMUv13
      drm/amd/pm: Add message control for SMUv14
      drm/amd/pm: Add message control for SMUv15
      drm/amd/pm: Use message control in messaging
      drm/amd/pm: Add async message call support
      drm/amd/pm: Replace without wait with async calls
      drm/amd/pm: Remove unused legacy message functions
      drm/amd/pm: Drop legacy message fields from SMUv11
      drm/amd/pm: Drop legacy message fields from SMUv12
      drm/amd/pm: Drop legacy message fields from SMUv13
      drm/amd/pm: Drop legacy message fields from SMUv14
      drm/amd/pm: Drop legacy message fields from SMUv15
      drm/amd/pm: Drop legacy message related fields
      drm/amd/pm: Drop unused ppt callback from SMUv11
      drm/amd/pm: Drop unused ppt callback from SMUv12
      drm/amd/pm: Drop unused ppt callback from SMUv13
      drm/amd/pm: Drop unused ppt callback from SMUv14
      drm/amd/pm: Drop unused ppt callback from SMUv15
      drm/amd/pm: Drop unused ppt callback definitions
      drm/amd/pm: Add debug message callback
      drm/amd/pm: Use message control for debug mailbox
      drm/amd/pm: Use emit clock levels in SMU v15.0.0
      drm/amd/pm: Deprecate print_clk_levels callback

Mario Limonciello (1):
      drm/amd/display: Bump the HDMI clock to 340MHz

Mario Limonciello (AMD) (1):
      drm/amd/display: Show link name in PSR status message

Nicholas Kazlauskas (2):
      drm/amd/display: Adjust PHY FSM transition to TX_EN-to-PLL_ON for TMDS on DCN35
      drm/amd/display: Add pwait status to DMCUB debug logging

Peichen Huang (3):
      drm/amd/display: move panel replay out from edp
      drm/amd/display: init code for external panel replay
      drm/amd/display: Add replay_events in replay settings

Philip Yang (1):
      drm/amdkfd: Add domain parameter to alloc kernel BO

Prike Liang (2):
      drm/amdgpu: validate the flush_gpu_tlb_pasid()
      Revert "drm/amdgpu: don't attach the tlb fence for SI"

Ray Wu (1):
      drm/amd/display: disable replay when crc source is enabled

Robin Chen (1):
      drm/amd/display: Remove unused DMUB replay commands

Srinivasan Shanmugam (2):
      drm/amdgpu: Refactor amdgpu_gem_va_ioctl for Handling Last Fence Update and Timeline Management v7
      drm/amdgpu/userq: Fix fence reference leak on queue teardown v2

Taimur Hassan (2):
      drm/amd/display: [FW Promotion] Release 0.1.42.0
      drm/amd/display: Promote DC to 3.2.365

Vivek Das Mohapatra (1):
      drm/amd/display: Initialise backlight level values from hw

Xiaogang Chen (2):
      drm/amdgpu: Use correct address to setup gart page table for vram access
      drm/amdkfd: kfd driver supports hot unplug/replug amdgpu devices

Yang Wang (2):
      drm/amd/pm: fix issue of missing '*' on pp_dpm_xxx nodes
      drm/amd/pm: fix smu overdrive data type wrong issue on smu 14.0.2

YuBiao Wang (1):
      drm/amdgpu: Skip loading SDMA_RS64 in VF

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  76 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  65 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  77 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  89 ++-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  36 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |  29 +
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |  14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  14 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  29 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  22 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  91 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   6 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  25 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |   9 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  49 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |   9 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   1 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  34 +-
 drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h     |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   6 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   3 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |  13 -
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   6 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  52 ++
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |   3 +
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |   2 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   1 +
 drivers/gpu/drm/amd/display/dc/inc/link_service.h  |  12 +-
 drivers/gpu/drm/amd/display/dc/link/Makefile       |   2 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |   7 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   6 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   8 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |  19 +-
 .../display/dc/link/protocols/link_dp_capability.c |  49 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |  43 ++
 .../dc/link/protocols/link_dp_panel_replay.c       | 343 ++++++++++
 .../dc/link/protocols/link_dp_panel_replay.h       |  38 ++
 .../dc/link/protocols/link_edp_panel_control.c     | 297 +--------
 .../dc/link/protocols/link_edp_panel_control.h     |  10 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |  11 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  54 +-
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |  30 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   2 -
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      | 120 ++--
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v12_0.h       |   3 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |   6 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v15_0.h       |   2 -
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   5 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   5 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  27 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  18 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  21 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  18 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |  17 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  29 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  32 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  27 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |  24 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |  23 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  32 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   3 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |  12 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  23 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  34 +-
 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c     |  12 +-
 .../gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_0_ppt.c   |  56 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             | 731 ++++++++++++---------
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |  22 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |   2 -
 include/uapi/drm/amdgpu_drm.h                      |   6 +-
 101 files changed, 1951 insertions(+), 1239 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_panel_replay.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_panel_replay.h
