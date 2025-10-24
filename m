Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F6AC0798C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 19:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDD710E21D;
	Fri, 24 Oct 2025 17:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XTLPODOG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012059.outbound.protection.outlook.com [52.101.53.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E300A10E21C;
 Fri, 24 Oct 2025 17:53:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrpAGi1ehTMeiu1wyNj6spdUlxZOuf4nzWoRcaz5dVCzLPmQF4zYtjW6kbRDocmouUifh05DeQkbCFlWmMD32juh7RhBTuuBdDjerL5LjWcrx7dhYKdoZLoBnUtw81QmLo3NiKP5VGlvQDVW4sA9e2YKdwX1w7v08+zMf6ix01xf8yVoiQ1hLn0+rZZUe25zXYYIrBZTZQX0hBdlPDsdjxIqoUsvvB5npdzWAAEU4pTrLn2545b/JSt7pmH7T/mfoCdv8wyunwjIZpXBYqyGtrQsH8vNWG9ajW+IUQGVrTFXqKZhTAmFMqOycXjd0ujlPW2Nf428kItFbzVpUz5BZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKsLuWFeAlJhCYNvCYNKaOBKIXD6F/Y4DpS8AQm88GI=;
 b=dojl6bEC/l0e1ljM/NgDguWb5h1Duf1T9X2awjlVg1URu/2XvfC1K99yqHwubtt8fpMz6hLDT9hIZu26Z/GuHyzQtQch97wPhXn9qa2BC6F9liCQNgiwGwAAPWga0HhMtLH2Nfz5KWcxv8TCm5ip3Hb8Ahk2hoIvL9UiupnC64zxZ2MWomB/VBR0s9B5xjVgqHNq0yVUL4hY9qAEXeDMIEoS8f9TYJ4y8OIpR1HdC7aQLCW/j9GMpadxlVrHtyu6WdTG4OfLBUVLacKbPB9VNh05Nj6M9UD3LWiroYQgEfyX1xLrQY2/IMiGhhxX3CODtmVv32JC5WgWJS6tAD/AEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKsLuWFeAlJhCYNvCYNKaOBKIXD6F/Y4DpS8AQm88GI=;
 b=XTLPODOGYiWbOl3IgQodJCnWVZ/CcDG6xlzKnvT+b/Q46hBrwUR9qzwv8S4s8mH9DOB7fkNFsOx/A7z1LVRU+Ll64T4YBGKwGHW7m7WvDYexV/iHyo8yeMS25mSowLx1Cize/7mERi00AS3E4NJLKsuGe8pNrv5xzHD1LLBViOU=
Received: from BLAPR05CA0036.namprd05.prod.outlook.com (2603:10b6:208:335::17)
 by PH7PR12MB7163.namprd12.prod.outlook.com (2603:10b6:510:202::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 17:53:12 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:335:cafe::33) by BLAPR05CA0036.outlook.office365.com
 (2603:10b6:208:335::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.5 via Frontend Transport; Fri,
 24 Oct 2025 17:53:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 17:53:11 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 10:53:07 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-next-6.19
Date: Fri, 24 Oct 2025 13:52:48 -0400
Message-ID: <20251024175249.58099-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|PH7PR12MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: 5020f814-91bb-42c4-280e-08de132632cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVA1WDRwZ2V4UE5veXpwTVZjcDg2Z05rSHRUNzNNOU44d3p3anNpQTBTL21D?=
 =?utf-8?B?Z2tLTXNGbERML2M2WGdibFh2L3k5MmZnQkRSdVBIaXZTd09JWGZvUERtNXdR?=
 =?utf-8?B?Z0ZCNUZ6dHYrWVcvVkQ0elhMRUM2UW92UWtuVkpvVzFwdXAyaFdUcTB1RllZ?=
 =?utf-8?B?azJQdkFnYUp2bVd3bnVCU3EyL09QMEJyT0JweVFGdU1TYW56cHVIR1J6ZFZE?=
 =?utf-8?B?Rnl4MHV3SzlTOWNLdWZZY2Vlbk5vRzNuejF0NFJpUXM5c2hIbWJsQ1Mzb1E3?=
 =?utf-8?B?WlM2MlNMRGRzSVgwdUxGb1BwRmRBWEc2b242OUFSYmk3YUwxc0svakFqeU4x?=
 =?utf-8?B?OFRnTEwwSWdlZ2lSZm5IZGZoT083bnJ3WmxWbThrbi9PUFNNbGRNVFhHc09R?=
 =?utf-8?B?NmI3ZXVId0hDMUpkTUtzRzNXUlpnMC9leEptNk0vczBGR2hQclZ4WnoyaC9E?=
 =?utf-8?B?S2lGQmRxcGlUczF0SUZNTXR4TlhvancxUklLYmxMRXVrU1R4ZjVyT21nY1BU?=
 =?utf-8?B?Y3hHRU9nTVZwcWlkMFEvYXA1Nmk2WnhxdTBDdnFDZU9hdFdaYTVxL25OTUpR?=
 =?utf-8?B?Sk42Z211Z2hLMFkyaWpRanhwWEszeHRJSERIcEdoZU5iUnFCWWtXeWlacUdi?=
 =?utf-8?B?WkNNcyttOUxJeENpTU1zQldSem9zRW8rbGZKMFRlQlBlc2E1YUF3SW5zejNu?=
 =?utf-8?B?a3E5a1haVnl2MjlHTEJ6OFlKY1crS0xMVnBUU1RzbkZJcytpb0VMZ0Y4VHhw?=
 =?utf-8?B?VnQ2b08zaU1oaGlhRzF5V1ZOYmNQUElMc1kxZDZUS2JWQmV0T1FoTEtMREND?=
 =?utf-8?B?ZjVETzd6R2U2NDM2cUk3eTdNWFVZVTFIVmtpL0g0R0tmSmdvR1h1a0NicXFU?=
 =?utf-8?B?NHZUZnJTNWFDdGYySGJENUJpSzdadCs4VnNqekswNCsrb1BBZ2xybWFyTVda?=
 =?utf-8?B?dGxQTDhId0l5NUV2ODJUa2FxdWpwVlBPcWYxUWtsaXE5UklWQnZ5NWNtV0dO?=
 =?utf-8?B?cFNRM3RsRkFwZ0hzZ2RLYjJKakZoQVM5eXUzaVNLb0t1RUJaSUFoUUF6MlJ5?=
 =?utf-8?B?VXJHMkM2YitFa3E1TmRuZ01pdEVycWp0THllQjczcGk1ZlFoRDFUZGRqaC9Y?=
 =?utf-8?B?K3FGK2dEM1BXOHZEQjNlU2xNMk5abHR5UmwyVTlUaDFxbHFTY090UDZOQnd6?=
 =?utf-8?B?Tnkrb2dIZUx6NXhWcDk3U0VNbUpCdUx2Y0dyemM0MVEwWTBBRS81SkNnUy95?=
 =?utf-8?B?SFZsOUJIN1RtRUI0ajc1T1Nta0pSelJLVU1sczZYQkpZaHZmNE92blordHhs?=
 =?utf-8?B?VEdxS214dzdsdFk3NUo4YW92dlpaVFVrd3ZUQk5SYXczT2xkMktTQWxNSk53?=
 =?utf-8?B?UWplTERrRDdlWkJZbE9ORkxPcVRqOGpZZ2FoL2oxV0lwUy9teE9CK25XNUxm?=
 =?utf-8?B?UVdpL2Y2WDlFdnduOXg5bkZyQVloM1BLaWdQQmQ5VnJ5UUpxRG9jRVY0ZjVW?=
 =?utf-8?B?bnhuMzhIY29saWlFM3N1YjRNMnhXcWRZY01NRkl0Z2gvOERscEdzWnVjNzdX?=
 =?utf-8?B?Q0hjZHNybm9KN1M2MUkzcytLR0dBUm1WTUUveXJwS2E5RW1nSm16eFR1YW9K?=
 =?utf-8?B?TXpCVk1hYjBmWStCR0tidEI3eTltNW0rNG9xcFh1RHpHM2hBQVptN3lYM2JI?=
 =?utf-8?B?dEVHeVhESlRDcEtZc0JRdkdiSUE2WVM2dVJhRVRKTlhhQlcyVUlOMUNSZ1Mx?=
 =?utf-8?B?b2ljWWRkL3NWWXNlQTczVWR1UmRnNGxiQndPSmVPRHhMWjFhU0g3ZzVrSWNp?=
 =?utf-8?B?a0RuTVc2VjFSRGw4WGpEK0RoYVpoM1E3ZVo2aHFHNklpeEgzN3BiaE9lOFFn?=
 =?utf-8?B?SWlNc1pNZ01UYS9Hc3Y2a0hVVTBkbjlEalZqZFZoaWUvU2NLS0VCV0I0WlFD?=
 =?utf-8?B?Y2RmcUVSZ3ZCWHV1U0RGbUlmclFXajY3azR1UnFNNnFDWFhJTkU1NkhxdURZ?=
 =?utf-8?B?VStPRUppQmtYcUxDRlhaN3Yrb3B0aW9BMEpzNkppeThCZVRuNWFJNkFEVGlp?=
 =?utf-8?Q?Hgd+hn?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 17:53:11.4857 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5020f814-91bb-42c4-280e-08de132632cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7163
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

New stuff for 6.19.

The following changes since commit 079ae5118e1f0dcf5b1ab68ffdb5760b06ed79a2:

  drm/amdkfd: fix suspend/resume all calls in mes based eviction path (2025-10-13 14:14:28 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.19-2025-10-24

for you to fetch changes up to 883687c30736c1b4d36c8cc6153bca5c2c76a5d8:

  drm/amdgpu: Remove unused members in amdgpu_mman (2025-10-20 18:28:22 -0400)

----------------------------------------------------------------
amd-drm-next-6.19-2025-10-24:

amdgpu:
- HMM cleanup
- Add new RAS framework
- DML2.1 updates
- YCbCr420 fixes
- DC FP fixes
- DMUB fixes
- LTTPR fixes
- DTBCLK fixes
- DMU cursor offload handling
- Userq validation improvements
- Misc code cleanups
- Unify shutdown callback handling
- Suspend improvements
- Power limit code cleanup
- Fence cleanup
- IP Discovery cleanup
- SR-IOV fixes
- AUX backlight fixes
- DCN 3.5 fixes
- HDMI compliance fixes
- DCN 4.0.1 cursor updates
- DCN interrupt fix
- DC KMS full update improvements
- Add additional HDCP traces
- DCN 3.2 fixes
- DP MST fixes
- Add support for new SR-IOV mailbox interface

----------------------------------------------------------------
Adi Gollamudi (1):
      drm/amd/display: fix typo in display_mode_core_structs.h

Alex Deucher (3):
      drm/amdgpu/mes: adjust the VMID masks
      drm/amdgpu/userq: drop VCN and VPE doorbell handling
      drm/amdgpu: clean up and unify hw fence handling

Alex Hung (1):
      drm/amd/display: Remove comparing uint32_t to zero

Alvin Lee (3):
      drm/amd/display: Remove unused field in DML
      drm/amd/display: Update DCN401 path for cursor offload
      drm/amd/display: Update spacing in struct

Alysa Liu (1):
      drm/amdgpu: Fix vram_usage underflow

Aurabindo Pillai (3):
      drm/amd/display: Add sink/link debug logs
      drm/amd/display: use GFP_NOWAIT for allocation in interrupt handler
      drm/amd/display: Fix GFP_ATOMIC abuse

Austin Zheng (1):
      drm/amd/display: DML2.1 Reintegration

Charlene Liu (3):
      drm/amd/display: add dispclk ramping to dcn35.
      drm/amd/display: add dccg dfs mask def
      drm/amd/display: increase max link count and fix link->enc NULL pointer access

Christian König (1):
      drm/amdgpu: reduce queue timeout to 2 seconds v2

Clay King (1):
      drm/amd/display: Remove inaccessible URL

Cruise Hung (1):
      drm/amd/display: Control BW allocation in FW side

Dominik Kaszewski (2):
      drm/amd/display: Remove dc state from check_update
      drm/amd/display: Fix performance regression from full updates

Ellen Pan (6):
      drm/amdgpu: Updated naming of SRIOV critical region offsets/sizes with _V1 suffix
      drm/amdgpu: Add SRIOV crit_region_version support
      drm/amdgpu: Introduce SRIOV critical regions v2 during VF init
      drm/amdgpu: Reuse fw_vram_usage_* for dynamic critical region in SRIOV
      drm/amdgpu: Add logic for VF ipd and VF bios to init from dynamic crit_region offsets
      drm/amdgpu: Add logic for VF data exchange region to init from dynamic crit_region offsets

Fangzhi Zuo (1):
      drm/amd/display: Prevent Gating DTBCLK before It Is Properly Latched

Harry VanZyllDeJong (1):
      drm/amd/display: fix duplicate aux command with AMD aux backlight

Ilya Bakoulin (2):
      drm/amd/display: add new block sequence-building/executing functions
      drm/amd/display: Fix misc. checkpatch issues

Ilya Zlobintsev (1):
      drm/amd/pm: Avoid writing nulls into `pp_od_clk_voltage`

Ivan Lipski (1):
      drm/amd/display: Consolidate two DML2 FP guards

Jonathan Kim (1):
      drm/amdgpu: update remove after reset flag for MES remove queue

Lewis Huang (1):
      drm/amd/display: Change clean dsc blocks condition in accelerated mode

Lijo Lazar (8):
      drm/amdgpu: Remove redundant return value
      drm/amdgpu: Skip SDMA suspend during mode-2 reset
      drm/amdgpu: Reorganize sysfs ini/fini calls
      drm/amdgpu: Add amdgpu_discovery_info
      drm/amdgpu: Move reset-on-init sequence earlier
      drm/amd/pm: Grant interface access after full init
      drm/amdgpu: Reserve discovery TMR only if needed
      drm/amdgpu: Remove unused members in amdgpu_mman

Mario Limonciello (14):
      drm/amd: Adjust whitespace for vangogh_ppt
      drm/amd: Remove some unncessary header includes
      drm/amd: Unify shutdown() callback behavior
      drm/amd: Stop exporting amdgpu_device_ip_suspend() outside amdgpu_device
      drm/amd: Remove comment about handling errors in amdgpu_device_ip_suspend_phase1()
      drm/amd: Don't always set IP block HW status to false
      drm/amd: Pass IP suspend errors up to callers
      drm/amd: Fix error handling with multiple userq IDRs
      drm/amd: Pass userq suspend failures up to caller
      drm/amd: Stop overloading power limit with limit type
      drm/amd: Remove second call to set_power_limit()
      drm/amd: Save and restore all limit types
      drm/amd: Drop calls to restore power limit and clock from smu_resume()
      drm/amd: Add a helper to tell whether an IP block HW is enabled

Meenakshikumar Somasundaram (3):
      drm/amd/display: Fix NULL pointer dereference
      drm/amd/display: Check disable_fec flag before enabling fec.
      drm/amd/display: write segment pointer with mot enabled for mst

Nicholas Carbones (1):
      drm/amd/display: Set DCN32 to use update planes and stream version 3

Nicholas Kazlauskas (4):
      drm/amd/display: Support possibly NULL link for should_use_dmub_lock
      drm/amd/display: Rename should_use_dmub_lock to reflect inbox1 usage
      drm/amd/display: Rename FAMS2 global control lock to DMUB HW control lock
      drm/amd/display: Driver implementation for cursor offloading to DMU

Ovidiu Bunea (1):
      drm/amd/display: Move all DCCG RCG into HWSS root_clock_control

Peichen Huang (2):
      drm/amd/display: lttpr cap should be nrd cap in bw_alloc mode
      drm/amd/display: not skip hpd irq for bw alloc mode

Pierre-Eric Pelloux-Prayer (2):
      drm/amdgpu: make non-NULL out fence mandatory
      drm/amdgpu: remove gart_window_lock usage from gmc v12

Prike Liang (6):
      drm/amdgpu/userq: extend userq state
      drm/amdgpu: add userq object va track helpers
      drm/amdgpu: track the userq bo va for its obj management
      drm/amdgpu: keeping waiting userq fence infinitely
      drm/amdgpu: validate the queue va for resuming the queue
      drm/amdgpu: validate userq va for GEM unmap

Relja Vojvodic (2):
      drm/amd/display: Correct slice width calculation for YCbCr420
      drm/amd/display: Rework HDMI data channel reads

Samson Tam (1):
      drm/amd/display: Add debug option to override EASF scaler taps

Sunil Khatri (5):
      drm/amdgpu: use user provided hmm_range buffer in amdgpu_ttm_tt_get_user_pages
      drm/amdgpu: clean up amdgpu hmm range functions
      drm/amdgpu: update the functions to use amdgpu version of hmm
      drm/amdgpu/userqueue: validate userptrs for userqueues
      drm/amdgpu: add the kernel docs for alloc/free/valid range

Taimur Hassan (7):
      drm/amd/display: [FW Promotion] Release 0.1.29.0
      drm/amd/display: Promote DC to 3.2.352
      drm/amd/display: [FW Promotion] Release 0.1.30.0
      drm/amd/display: Promote DC to 3.2.353
      drm/amd/display: [FW Promotion] Release 0.1.31.0
      drm/amd/display: Promote DC to 3.2.354
      drm/amd/display: Promote DC to 3.2.355

Tao Zhou (1):
      drm/amdgpu: check save count before RAS bad page saving

Tiezhu Yang (1):
      drm/amd: Fix set but not used warnings

Tvrtko Ursulin (1):
      drm/amdgpu: Use memset32 for IB padding

Victor Zhao (2):
      drm/amdgpu: Add kiq hdp flush callbacks
      drm/amdgpu: use GPU_HDP_FLUSH for sriov

Wenjing Liu (2):
      drm/amd/display: update perfmon measurement interfaces
      drm/amd/display: add additional hdcp traces

YiPeng Chai (44):
      drm/amd/ras: Add ras aca parser v1.0
      drm/amd/ras: Add aca common ras functions
      drm/amd/ras: Add mp1 v13_0 ras functions
      drm/amd/ras: Add mp1 common ras functions
      drm/amd/ras: Add nbio v7_9 ras functions
      drm/amd/ras: Add nbio common ras functions
      drm/amd/ras: Add umc v12_0 ras functions
      drm/amd/ras: Add umc common ras functions
      drm/amd/ras: Add gfx v9_0 ras functions
      drm/amd/ras: Add gfx common ras functions
      drm/amd/ras: Add eeprom ras functions
      drm/amd/ras: Add psp v13_0 ras functions
      drm/amd/ras: Add psp ras common functions
      drm/amd/ras: Add ras ioctl command handler
      drm/amd/ras: Add thread to handle ras events
      drm/amd/ras: Use ring buffer to record ras ecc data
      drm/amd/ras: Add cper conversion function
      drm/amd/ras: Add rascore unified interface function
      drm/amd/ras: Add files to ras core Makefile
      drm/amd/ras: Add amdgpu nbio v7_9 configuration function
      drm/amd/ras: Add amdgpu mp1 v13_0 configuration function
      drm/amd/ras: Add amdgpu eeprom i2c configuration function
      drm/amd/ras: Amdgpu handle ras ioctl command
      drm/amd/ras: Add amdgpu ras system functions
      drm/amd/ras: Amdgpu preprocesses ras interrupts
      drm/amd/ras: Add amdgpu ras management function.
      drm/amd/ras: Add files to amdgpu ras manager makefile
      drm/amd/ras: Add unified ras module top-level makefile
      drm/amd/pm: export a function amdgpu_smu_ras_send_msg to allow send msg directly
      drm/amdgpu: Add ras module files into amdgpu
      drm/amdgpu: Intercept ras interrupts to ras module
      drm/amdgpu: Improve ras fatal error handling function
      drm/amdgpu: add ras module rma check
      drm/amdgpu: Avoid loading bad pages into legacy ras
      drm/amdgpu: Add poison consumption sequence numbers for gfx and sdma
      drm/amdgpu: Avoid hive seqno increment in legacy ras
      drm/amdgpu: Add ras module eeprom safety watermark check
      drm/amdgpu: Add ras module ip block to amdgpu discovery
      drm/amdgpu: Enable ras module
      drm/amd/ras: Update ras command context structure name
      drm/amd/ras: Update function and remove redundant code
      drm/amdgpu: ras module supports error injection
      drm/amdgpu: query bad page info of ras module
      drm/amdgpu: query block error count of ras module

Yihan Zhu (1):
      drm/amd/display: fix dppclk rcg poweron check

 drivers/gpu/drm/amd/amdgpu/Makefile                |    8 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   15 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |   34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  248 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  244 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |   12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  143 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   71 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |   78 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.h            |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  238 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   93 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  283 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  341 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   21 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |   86 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   19 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |    2 -
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |   16 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    4 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |    4 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   23 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |    7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    1 -
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h           |    1 -
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   16 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   79 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    8 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   12 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  179 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  | 3186 ++++++++++++++++++--
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   48 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    7 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  108 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   36 +
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |    2 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    1 +
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c |    2 +-
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |   25 +-
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.h |    8 +
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.c       |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |    6 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |   29 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.h  |   10 +-
 .../display/dc/dml2/display_mode_core_structs.h    |    2 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |    2 -
 .../dc/dml2/dml21/inc/dml_top_dchub_registers.h    |    1 -
 .../dc/dml2/dml21/inc/dml_top_display_cfg_types.h  |   11 +
 .../dml2/dml21/inc/dml_top_soc_parameter_types.h   |    7 +-
 .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |   13 +
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   55 +-
 .../dml2/dml21/src/dml2_core/dml2_core_factory.c   |    2 +
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |   10 +-
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  459 +--
 .../dml21/src/inc/dml2_internal_shared_types.h     |   36 +-
 .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.c   |   19 +-
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |   20 +-
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |   42 +-
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dsc.h           |    1 +
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c |    1 +
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c |   69 +-
 .../gpu/drm/amd/display/dc/hubp/dcn21/dcn21_hubp.c |    2 -
 .../gpu/drm/amd/display/dc/hubp/dcn32/dcn32_hubp.c |   70 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   11 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |    5 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |    5 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |    3 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |    1 +
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |    1 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  144 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |    8 +
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |    6 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  | 1408 ++++++++-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |  104 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |   28 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h | 1433 ++++++++-
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |   36 +
 .../drm/amd/display/dc/inc/hw/cursor_reg_cache.h   |   28 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   36 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |    1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |    2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |    8 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |    7 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    4 +
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |    2 +
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |    3 -
 .../drm/amd/display/dc/link/protocols/link_ddc.c   |    3 +-
 .../display/dc/link/protocols/link_dp_capability.c |   48 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |   24 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |    4 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   29 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |   30 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c       |   15 +
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl_types.h |    1 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    7 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  311 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |    1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   22 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    |    6 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |    2 +-
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |   13 +-
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |   19 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.h    |    6 +
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |   14 +
 drivers/gpu/drm/amd/include/amd_shared.h           |    1 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    2 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |    3 +-
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |    3 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    3 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    6 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    2 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   70 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   14 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   15 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   23 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |    7 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |    7 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |    5 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |    5 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   26 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    7 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |    5 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |    5 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |    7 +-
 drivers/gpu/drm/amd/ras/Makefile                   |   34 +
 drivers/gpu/drm/amd/ras/ras_mgr/Makefile           |   33 +
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_cmd.c   |  285 ++
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_cmd.h   |   54 +
 .../drm/amd/ras/ras_mgr/amdgpu_ras_eeprom_i2c.c    |  181 ++
 .../drm/amd/ras/ras_mgr/amdgpu_ras_eeprom_i2c.h    |   27 +
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c   |  611 ++++
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h   |   78 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c |   94 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.h |   30 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_nbio_v7_9.c |  125 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_nbio_v7_9.h |   30 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.c   |  126 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.h   |   37 +
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_sys.c   |  273 ++
 drivers/gpu/drm/amd/ras/ras_mgr/ras_sys.h          |  110 +
 drivers/gpu/drm/amd/ras/rascore/Makefile           |   44 +
 drivers/gpu/drm/amd/ras/rascore/ras.h              |  368 +++
 drivers/gpu/drm/amd/ras/rascore/ras_aca.c          |  672 +++++
 drivers/gpu/drm/amd/ras/rascore/ras_aca.h          |  164 +
 drivers/gpu/drm/amd/ras/rascore/ras_aca_v1_0.c     |  379 +++
 drivers/gpu/drm/amd/ras/rascore/ras_aca_v1_0.h     |   71 +
 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c          |  522 ++++
 drivers/gpu/drm/amd/ras/rascore/ras_cmd.h          |  426 +++
 drivers/gpu/drm/amd/ras/rascore/ras_core.c         |  603 ++++
 drivers/gpu/drm/amd/ras/rascore/ras_cper.c         |  310 ++
 drivers/gpu/drm/amd/ras/rascore/ras_cper.h         |  304 ++
 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c       | 1339 ++++++++
 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.h       |  197 ++
 drivers/gpu/drm/amd/ras/rascore/ras_gfx.c          |   70 +
 drivers/gpu/drm/amd/ras/rascore/ras_gfx.h          |   43 +
 drivers/gpu/drm/amd/ras/rascore/ras_gfx_v9_0.c     |  426 +++
 drivers/gpu/drm/amd/ras/rascore/ras_gfx_v9_0.h     |  259 ++
 drivers/gpu/drm/amd/ras/rascore/ras_log_ring.c     |  310 ++
 drivers/gpu/drm/amd/ras/rascore/ras_log_ring.h     |   93 +
 drivers/gpu/drm/amd/ras/rascore/ras_mp1.c          |   81 +
 drivers/gpu/drm/amd/ras/rascore/ras_mp1.h          |   50 +
 drivers/gpu/drm/amd/ras/rascore/ras_mp1_v13_0.c    |  105 +
 drivers/gpu/drm/amd/ras/rascore/ras_mp1_v13_0.h    |   30 +
 drivers/gpu/drm/amd/ras/rascore/ras_nbio.c         |   95 +
 drivers/gpu/drm/amd/ras/rascore/ras_nbio.h         |   46 +
 drivers/gpu/drm/amd/ras/rascore/ras_nbio_v7_9.c    |  123 +
 drivers/gpu/drm/amd/ras/rascore/ras_nbio_v7_9.h    |   31 +
 drivers/gpu/drm/amd/ras/rascore/ras_process.c      |  315 ++
 drivers/gpu/drm/amd/ras/rascore/ras_process.h      |   53 +
 drivers/gpu/drm/amd/ras/rascore/ras_psp.c          |  750 +++++
 drivers/gpu/drm/amd/ras/rascore/ras_psp.h          |  145 +
 drivers/gpu/drm/amd/ras/rascore/ras_psp_v13_0.c    |   46 +
 drivers/gpu/drm/amd/ras/rascore/ras_psp_v13_0.h    |   31 +
 drivers/gpu/drm/amd/ras/rascore/ras_ta_if.h        |  231 ++
 drivers/gpu/drm/amd/ras/rascore/ras_umc.c          |  706 +++++
 drivers/gpu/drm/amd/ras/rascore/ras_umc.h          |  166 +
 drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.c    |  511 ++++
 drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.h    |  314 ++
 215 files changed, 21949 insertions(+), 1627 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/ras/Makefile
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/Makefile
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_cmd.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_cmd.h
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_eeprom_i2c.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_eeprom_i2c.h
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.h
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_nbio_v7_9.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_nbio_v7_9.h
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.h
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_sys.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/ras_sys.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_aca.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_aca.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_aca_v1_0.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_aca_v1_0.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_cmd.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_core.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_cper.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_cper.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_gfx.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_gfx.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_gfx_v9_0.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_gfx_v9_0.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_log_ring.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_log_ring.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_mp1.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_mp1.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_mp1_v13_0.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_mp1_v13_0.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_nbio.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_nbio.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_nbio_v7_9.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_nbio_v7_9.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_process.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_process.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_psp.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_psp.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_psp_v13_0.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_psp_v13_0.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_ta_if.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_umc.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_umc.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.h
