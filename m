Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111A5AF040E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 21:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B9410E2DF;
	Tue,  1 Jul 2025 19:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q7IEkymW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1342F89196;
 Tue,  1 Jul 2025 19:47:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zA7vIELzohbqqQjwNSKxxbjENd5MYEhuRrIVyd57ENiCc4dxUgwrOfehLeRxUXQa4TudVrG3Kahu7vr23qFdFgJ6qvF6xiF+JQHIBupRB6mO9oemSt93/SGmDU5YZuk0j3qmkHeuRO9QmI1KVPQTRpeEs4GqoU6zj0e6c4IhIwvA6jbpefnhChw4SY/kW5DCqYcWDnNJqik6evh9SkpqugwKOKWYqELsMWsnDLVjbpBuD0L5dQZVYAz9Eu0WoUPvkZxoZtwgEUvW9wtcoHt31Bnnq0/0cFbGu+S21kcXzufqGlVIBkHqqwavUtNL8gtWqqFuVlx+LFupDf/6JyeG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxWcyrXGsteiogIVwjZnlBopWPFFqAvhywkConcwdHs=;
 b=VcHU/TuRBQWLh7Kp41pj9MGAhZhSBU/ge71k9DAQ272HYDZCAv9MiNd2PAZGekfdkoGhDlA7F/nedjOPMytcG6DfRkNDuq18ShYIwwEm3fWi57YprDPqB9TShGgJCHYQnLGcxGqUiCZuKvZLyHiYCh/tDJMKX3S+GYc+q12aQ4weNb+TGymol7PWwpIWrPJNsrBoQQXwwyJ6MNxP86zdGHOdsbt/Tb185NlZQhtItwt9I0Z9j53VDMgcsRdQz/rEED7P13avSWHxrtPbDhjWkP0Q05O0oYw02W+WHviOnWogTiiyJsoM7XsAHhLoalZxmqETNJB27SaovxhGPyMcwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxWcyrXGsteiogIVwjZnlBopWPFFqAvhywkConcwdHs=;
 b=q7IEkymWI+LcYuiqwc4HaARyqJixvTklX7vscOkgkjhR7GlZFzQ+WGFuwfs1ZIH6WqMwOCqzh+lxEI5vo8JaTifu5u0ftIsGpJIPOa+7OkTRullLHRKiQYcpgLpeaMOOIbcSWkCafUT0ziVzGY6ozaCutGU/XS2oaeFz2v1CPIo=
Received: from BL0PR02CA0130.namprd02.prod.outlook.com (2603:10b6:208:35::35)
 by CH1PR12MB9622.namprd12.prod.outlook.com (2603:10b6:610:2b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 1 Jul
 2025 19:47:21 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:35:cafe::64) by BL0PR02CA0130.outlook.office365.com
 (2603:10b6:208:35::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Tue,
 1 Jul 2025 19:47:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 19:47:21 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 14:47:20 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.17
Date: Tue, 1 Jul 2025 15:47:05 -0400
Message-ID: <20250701194707.32905-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|CH1PR12MB9622:EE_
X-MS-Office365-Filtering-Correlation-Id: 8305edf1-c811-43bc-7d15-08ddb8d81829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0o2Y2ZOOUE4R0JqMmJLd0ZPRUtTSlZsVmxiK0kyR284c05ZcXczSTNhQ0hQ?=
 =?utf-8?B?WVYrQkJVQUNoT3VYNEtuVDBtUHUvVnRhUXF4K0kwS1dKVWwxNmQ4RFY0cVdC?=
 =?utf-8?B?V3N0NjA0QmpYUSt0eHF1MFhHc0l5Zks2ZXd3T2owdmdqYnJ3S1M1UnE1Y1VK?=
 =?utf-8?B?NEkxSDBmbUJFODUydG1SSllwU3NGdEEzNVlZM0VWQkYwdjdXZXdzVVdEanhs?=
 =?utf-8?B?bTRyMHpVdDFFVHQxd0F3T2J1YlJvLzU3OWg4UEswSHd0YU56WGpPb056WlJi?=
 =?utf-8?B?VCtXYmlrUjZYSHRLUmRpUlJCb0xZdVRKTlZOcmh1SmdaY0l0eTdDUWdWbFV4?=
 =?utf-8?B?T1U5Tld4UXJRUGJwbVRac3ZZZXBoQkU4cXJiU0JBb0FERHlFZ2lHN0J2bUly?=
 =?utf-8?B?cjBVWkN0UWFYQzVuZjRyY2w5ZHdJSVN5eUpTdEIrT0tXREpaY05aUjNqd0RX?=
 =?utf-8?B?UjRWNjlhMUE5OGl2UG9TV3VPOW1KNnZXbTJ3cytaYnE4aFJlVGlNc3BhdzVN?=
 =?utf-8?B?ZDVLcllnOS9JZThjM1FUc2E5VVZsQWQxTU1jT1BZak43MWdqTXVaV2Rpb3J5?=
 =?utf-8?B?Z3c5cExzZWRKQmRHTHIreUc4cElmNnE5NHFBVXloNFgxV0RwRzF2VmZFQnZO?=
 =?utf-8?B?TDY4R3NlSjNrYXAyT2F0QWVFeVloR003VTRQYXBrNmJsblN6K1hzTzdqaHMy?=
 =?utf-8?B?Z3I1bjFyTFMzdHMwczMxa3d2dGUwTktTdzgyK0lzSk01dFdERitRcWtCQUN6?=
 =?utf-8?B?MmE4dEpWQngvQmoydnpqbmoyTEJhY0VSUkxKa1IyNXdBUVhZc0lSNTQwL1lK?=
 =?utf-8?B?MENubU1PbTBHMzlPWHNURzZwYkRpa1pld3NxSUkrbWJOMnlUT0NVQklKU1A5?=
 =?utf-8?B?aFRSQ2xHbU1sMy8rblFFVDBjb0xKaWN4WjBFQnc5dndMWEVyNkViOXkrUEhn?=
 =?utf-8?B?NU1POWhtVlJySFNjSGVkcGkvUkpTUnpEK3gyRXFCK2JEZFd0NENSeTYyU2FU?=
 =?utf-8?B?YzBNOEVrWE52ZUlaaE0yckQwZUlYZ3RZQldILzlpZ0ozMkFYSjluQ2t5Q0Jp?=
 =?utf-8?B?TzdFNENsK3V6bjE4cEJWcUhPSHNtbXdoUmJtQStvTlFiaDNhRi85c1FUaWJT?=
 =?utf-8?B?bVBFcW1FVW1DemZwbVBSbXQ0UWh3dVROT2xkTHF2YzV5RzMyWGM0T2phcFQ4?=
 =?utf-8?B?dysveTlDM2Z4UkU2UmlRYnVCTDV2aHdPcmhVZEUrdVR4VkVPb25ZSjI3Qnlm?=
 =?utf-8?B?RmJrUlYveXRhMGY2cmlQWUVzeGE5MlU0blI2L3RKRmdkM1FES2xmVG9iZUxM?=
 =?utf-8?B?YjZLUHZZSEIwWXlqRmVMZnM4bUt6THIzTjh5T1RlVEh6elJBVGV4QVI5K1JC?=
 =?utf-8?B?dFNaTTBvRTBLZnFOeXpKMnZ6OWlIVnJUVGtYN1pybGcyL2pOK3VDK2FqSkxs?=
 =?utf-8?B?dllHZytPV0JsMWtuRmFENWtCWDZ2VERYald4S2dNN1E5NTlQWFAvbFlyc0da?=
 =?utf-8?B?OERULy91RjhmbW96NEJMTjNOdWNsUW5ucE5iZU11MjdQSHcwNU5Ga0NrQVhn?=
 =?utf-8?B?b203Q2ZKRW1CRmNuMWdRTFZVeVRQUWp6N29IMjN2YXVnNDFXQnl0VzZrbkEv?=
 =?utf-8?B?aE55cHl2WDc1bXo1VnlqbmpKQWsvY3lQKzd6cUVLUDZQOEZIZTUzYXlUMkxz?=
 =?utf-8?B?Yi9MUmpmRG1EOFVPRE5sNmZEMzF6a2tucUJIRkg3ZHByeXQzcTRtcVVzUUVJ?=
 =?utf-8?B?OUFPelZSVisrU0VLZVhoWnFuZ3g2YldEek1UQWtkTmE1ZW1TcHFpMWpabWdE?=
 =?utf-8?B?Rkp4VUpEbzFWNmRBTW5WNDdydjhZQzRncWFXU0F3clBVcWJuOGw4eXVuWnla?=
 =?utf-8?B?aXNEbi9maFZNcitjdXE0Z2F3UTZ1SG50aXRieldiNDFGOTFIeDNjdWkrQjNl?=
 =?utf-8?B?UGl3bkRLaHQ2c0xsd3JaeTJHUXVENEg4S2dvU2RvdHRDaEdKem5ocU9DeVdW?=
 =?utf-8?B?UWhOUHBQVVZnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 19:47:21.3870 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8305edf1-c811-43bc-7d15-08ddb8d81829
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9622
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

New stuff for 6.17.

The following changes since commit 8b5f3a229a70d242322b78c8e13744ca00212def:

  drm/amd/display: Fix default DC and AC levels (2025-06-03 15:33:38 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.17-2025-07-01

for you to fetch changes up to 2ecdb61f76ebd3b2fd0a7a41421f9c4df206e802:

  drm/amdgpu/sdma6: add more ucode version checks for userq support (2025-06-30 12:08:00 -0400)

----------------------------------------------------------------
amd-drm-next-6.17-2025-07-01:

amdgpu:
- FAMS2 fixes
- OLED fixes
- Misc cleanups
- AUX fixes
- DMCUB updates
- SR-IOV hibernation support
- RAS updates
- DP tunneling fixes
- DML2 fixes
- Backlight improvements
- Suspend improvements
- Use scaling for non-native modes on eDP
- SDMA 4.4.x fixes
- PCIe DPM fixes
- SDMA 5.x fixes
- Cleaner shader updates for GC 9.x
- Remove fence slab
- ISP genpd support
- Parition handling rework
- SDMA FW checks for userq support
- Add missing firmware declaration
- Fix leak in amdgpu_ctx_mgr_entity_fini()
- Freesync fix
- Ring reset refactoring
- Legacy dpm verbosity changes

amdkfd:
- GWS fix
- mtype fix for ext coherent system memory
- MMU notifier fix
- gfx7/8 fix

radeon:
- CS validation support for additional GL extensions
- Bump driver version for new CS validation checks

----------------------------------------------------------------
Alex Deucher (19):
      drm/amdgpu/gfx7: drop reset_kgq
      drm/amdgpu/gfx8: drop reset_kgq
      drm/amdgpu/gfx9: drop reset_kgq
      drm/amdgpu/sdma: handle paging queues in amdgpu_sdma_reset_engine()
      drm/amdgpu: switch job hw_fence to amdgpu_fence
      drm/amdgpu/sdma5: init engine reset mutex
      drm/amdgpu/sdma5.2: init engine reset mutex
      drm/amdgpu/mes: add compatibility checks for set_hw_resource_1
      drm/amdgpu: remove fence slab
      drm/amdgpu/sdma6: add ucode version checks for userq support
      drm/amdgpu/sdma7: add ucode version checks for userq support
      drm/amdgpu/sdma5.x: suspend KFD queues in ring reset
      drm/amdkfd: add hqd_sdma_get_doorbell callbacks for gfx7/8
      drm/amdgpu: remove job parameter from amdgpu_fence_emit()
      drm/amdgpu: update ring reset function signature
      drm/amdgpu: move force completion into ring resets
      drm/amdgpu: move guilty handling into ring resets
      drm/amdgpu: move scheduler wqueue handling into callbacks
      drm/amdgpu/sdma6: add more ucode version checks for userq support

Alex Hung (4):
      drm/amd/display: Fix mpv playback corruption on weston
      drm/amd/display: Fix kernel docs for new struct members
      drm/amd/display: Check dce_hwseq before dereferencing it
      drm/amd/display: Initialize mode_select to 0

Alvin Lee (2):
      drm/amd/display: Re-order FAMS2 sub commands
      drm/amd/display: Removed unnecessary comment

André Almeida (2):
      drm/amd: Do not include <linux/export.h> when unused
      drm/amd: Include <linux/export.h> when needed

Aurabindo Pillai (1):
      drm/amd/display: DML2.1 changes

Ausef Yousof (2):
      drm/amd/display: Don't disable dtb as dto src during dpms off
      drm/amd/display: Adjust dto fix coverage

Austin Zheng (4):
      drm/amd/display: DML21 Fixes
      drm/amd/display: Deprecate Loading Bounding Box From DMUB On DCN4
      drm/amd/display: Include EQU Prefetch Bandwidth For Bandwidth Calculations
      drm/amd/display: DML21 Reintegration

Brendan Steve Leder (1):
      drm/amd/display: Add custom segmentation support

Camille Cho (1):
      drm/amd/display: Support OLED SDR with AMD ABC

Ce Sun (1):
      drm/amdgpu: Fix code style issue

Charlene Liu (2):
      drm/amd/display: Add HW change required mpc gamut remap
      drm/amd/display: add APG struct to stream_enc for future use

Christian König (1):
      drm/amdgpu: rework queue reset scheduler interaction

Colin Ian King (1):
      drm/amd: Fix spelling mistake "correctalbe" -> "correctable"

Cruise Hung (3):
      drm/amd/display: Add DPIA debug option for zero allocation patch
      drm/amd/display: Add new DP tunnel bandwidth validation
      drm/amd/display: Remove unused tunnel BW validation

Dan Carpenter (1):
      drm/amdgpu: indent an if statement

David Yat Sin (1):
      amdkfd: MTYPE_UC for ext-coherent system memory

Dillon Varone (2):
      drm/amd/display: Remove dml/dcn401 files and references
      drm/amd/display: Refactor DML2 DC power instance

Dmytro Laktyushkin (1):
      drm/amd/display: Update tmz_surface type to match register

Emily Deng (1):
      drm/amdkfd: Move the process suspend and resume out of full access

Fangzhi Zuo (1):
      drm/amd/display: Rewording Mode Validation Result

Frank Min (3):
      drm/amdgpu: Add kicker device detection
      drm/amdgpu: add kicker fws loading for gfx11/smu13/psp13
      drm/amdgpu: reclaim psp fw reservation memory region

Harold Sun (1):
      drm/amd/display: Added case for when RR equals panel's max RR using freesync

Hawking Zhang (8):
      drm/amdgpu: Convert select_sched into a common helper v3
      drm/amdgpu: Convert update_partition_sched_list into a common helper v3
      drm/amdgpu: Convert update_supported_modes into a common helper
      drm/amdgpu: Convert pre|post_partition_switch into common helpers
      drm/amdgpu: Move MAX_MEM_RANGES to amdgpu_gmc.h
      drm/amdgpu: Convert query_memory_partition into common helpers
      drm/amdgpu: Generalize is_multi_chiplet with a common helper v2
      drm/amdgpu: Convert init_mem_ranges into common helpers

Ilya Bakoulin (2):
      drm/amd/display: Add num_slices_h to set_dto_dscclk signature
      drm/amd/display: Separate set_gsl from set_gsl_source_select

Ivan Lipski (1):
      drm/amd/display: Add DPP & HUBP reset if power gate enabled on DCN314

Jay Cornwall (1):
      drm/amdkfd: Fix race in GWS queue scheduling

Jesse Zhang (4):
      drm/amdgpu: Fix SDMA engine reset with logical instance ID
      drm/amdgpu: Use logical instance ID for SDMA v4_4_2 queue operations
      drm/amdgpu: Add soft reset callback to SDMA v4.4.x
      drm/amdgpu: Fix SDMA UTC_L1 handling during start/stop sequences

Jesse.Zhang (1):
      drm/amdkfd: move SDMA queue reset capability check to node_show

Jingwen Zhu (1):
      drm/amd/display: Add disconnect case on dongle check

Jonathan Kim (1):
      drm/amdkfd: allow compute partition mode switch with cgroup exclusions

Karthi Kandasamy (2):
      drm/amd/display: prepare for new platform
      drm/amd/display: prepare for new platform

Kenneth Feng (5):
      drm/amd/pm: override pcie dpm parameters only if it is necessary
      drm/amd/pm: update pcie dpm parameters before smu feature enablement
      drm/amd/pm: move the dpm table setting back after featureenablement
      drm/amd/pm: set pcie default dpm table when updating pcie dpm parameters
      drm/amd/pm: revise the pcie dpm parameters

Kent Russell (1):
      drm/amdgpu: Include sdma_4_4_4.bin

Lijo Lazar (17):
      drm/amdgpu: Check pcie replays reporting support
      drm/amdgpu: Remove nbiov7.9 replay count reporting
      drm/amdgpu: Clear reset flags from ras context
      drm/amd/pm: Show default gfx clock levels
      drm/amdgpu: Suspend IH during mode-2 reset
      drm/amd/pm: Use pointer type for typecheck()
      drm/amdgpu: Release reset locks during failures
      drm/amd/pm: Update SMU v13.0.12 pmfw header
      drm/amd/pm: Report pldm version and board voltage
      drm/amdgpu: Extend bus status check to more cases
      drm/amdgpu: Deprecate xgmi_link_speed enum
      drm/amdgpu: Add xgmi API to set max speed/width
      drm/amd/pm: Fetch SMUv13.0.6 xgmi max speed/width
      drm/amdgpu: Add more checks to PSP mailbox
      drm/amd/pm: Fetch SMUv13.0.12 xgmi max speed/width
      drm/amdgpu: Convert from DRM_* to dev_*
      drm/amdgpu: Fix error with dev_info_once usage

Likun Gao (2):
      drm/amdgpu: make ip map init to common function
      drm/amdgpu: use common function to map ip for aqua_vanjaram

Lin.Cao (1):
      drm/amdgpu: Fix memory leak in amdgpu_ctx_mgr_entity_fini

Mario Limonciello (18):
      drm/amd/display: Drop unnecessary `amdgpu` prefix
      drm/amd/display: Only read ACPI backlight caps once
      drm/amd/display: Export full brightness range to userspace
      drm/amd: Add support for a complete pmops action
      drm/amd/display: Stop storing failures into adev->dm.cached_state
      drm/amd/display: Destroy cached state in complete() callback
      drm/amd: Allow printing VanGogh OD SCLK levels without setting dpm to manual
      drm/amd: Allow printing Renoir OD SCLK levels without setting dpm to manual
      drm/amd/display: Use scaling for non-native resolutions on eDP
      drm/amd/display: Disable common modes for eDP
      drm/amd: Adjust output for discovery error handling
      drm/amd: Add missing kdoc for amd_ip_funcs `complete` callback
      drm/amd/display: Fix AMDGPU_MAX_BL_LEVEL value
      drm/amd/display: Add a trace event for brightness programming
      drm/amd/display: Don't allow OLED to go down to fully off
      drm/amd: Decrease message level for legacy-pm, kv-dpm and si-dpm
      drm/amd: Change legacy-dpm DRM_*() macros to drm_*()
      drm/amd: Change kv-dpm DRM_*() macros to drm_*()

Michael Strauss (2):
      drm/amd/display: Get LTTPR IEEE OUI/Device ID From Closest LTTPR To Host
      drm/amd/display: Fix Link Override Sequencing When Switching Between DIO/HPO

Muhammad Ahmed (1):
      drm/amd/display: Add option to disable PHY SSC reduction on transmitter enable

Navid Assadian (1):
      drm/amd/display: Do not bypass chroma scaling in 1:1 case

Nicholas Kazlauskas (3):
      drm/amd/display: Update DMCUB loading sequence for DCN3.5
      drm/amd/display: Add more checks for DSC / HUBP ONO guarantees
      drm/amd/display: Add pwait status to DMCUB diagnostics

Oleh Kuzhylnyi (2):
      drm/amd/display: Indirect buffer transport for FAMS2 commands
      drm/amd/display: Add DML path for FAMS methods

Ostrowski Rafal (1):
      drm/amd/display: LSDMA support

Ovidiu Bunea (1):
      drm/amd/display: Add DMUB IPS command support for IPS residency tools

Patrick Lerda (3):
      drm/radeon/evergreen_cs: implement cond_exec and cond_write
      drm/radeon/evergreen_cs: lower evergreen_surface_check_linear_aligned restriction
      drm/radeon: bump version to 2.51.0

Peichen Huang (3):
      drm/amd/display: Remove dpia debug bits
      drm/amd/display: Add dc cap for dp tunneling
      drm/amd/display: add null check

Philip Yang (1):
      drm/amdkfd: Don't call mmput from MMU notifier callback

Pratap Nirujogi (4):
      drm/amd/pm: Add support to set ISP Power
      drm/amd/pm: Add support to set min ISP clocks
      drm/amd/amdgpu: Add ISP Generic PM Domain (genpd) support
      drm/amd/amdgpu: Refine isp_v4_1_1 logging

Ray Wu (1):
      drm/amd/display: Move vmalloc include to header file

Ryan Seto (2):
      drm/amd/display: Clear DPP 3DLUT Cap
      drm/amd/display: Removing Unused DPP Functions

Samson Tam (1):
      drm/amd/display: Add support for 2nd sharpening range

Samuel Zhang (4):
      drm/amdgpu: update xgmi info and vram_base_offset on resume
      drm/amdgpu: update GPU addresses for SMU and PSP
      drm/amdgpu: enable pdb0 for hibernation on SRIOV
      drm/amdgpu: fix fence fallback timer expired error

Shiwu Zhang (1):
      drm/amdgpu: Enable IFWI update support for PSPv14.0.2 and v14.0.3

Sonny Jiang (1):
      drm/amdgpu: VCN v5_0_1 to prevent FW checking RB during DPG pause

Srinivasan Shanmugam (2):
      drm/amd/display: Fix annotations for dc state functions
      drm/amdgpu/gfx9: Add Cleaner Shader Support for GFX9.x GPUs

Taimur Hassan (10):
      drm/amd/display: [FW Promotion] Release 0.1.11.0
      drm/amd/display: [FW Promotion] Release 0.1.12.0
      drm/amd/display: Promote DAL to 3.2.335
      drm/amd/display: Promote DAL to 3.2.336
      drm/amd/display: Promote DC to 3.2.337
      drm/amd/display: Promote DC to 3.2.338
      drm/amd/display: [FW Promotion] Release 0.1.16.0
      drm/amd/display: Promote DAL to 3.2.339
      drm/amd/display: [FW Promotion] Release 0.1.17.0
      drm/amd/display: Promote DAL to 3.2.340

Takashi Iwai (1):
      drm/amd/display: Add sanity checks for drm_edid_raw()

Thomas Zimmermann (2):
      drm/amdgpu: Test for imported buffers with drm_gem_is_imported()
      drm/amdgpu: Use dma_buf from GEM object instance

Vitaly Prosyak (1):
      drm/amdgpu: fix slab-use-after-free in amdgpu_userq_mgr_fini+0x70c

Wayne Lin (1):
      drm/amd/display: Avoid trying AUX transactions on disconnected ports

Weiguang Li (1):
      drm/amd/display: Remove redundant macro of refresh rate

Wen Chen (1):
      drm/amd/display: Fix 'failed to blank crtc!'

Wenjing Liu (1):
      drm/amd/display: Refactor DML21 Initialization and Configuration

Xiang Liu (2):
      drm/amdgpu: Add debug mask to disable CE logs
      drm/amdgpu: Use correct severity for BP threshold exceed event

Yan Li (3):
      drm/amd/display: replace fast_validate with enum dc_validate_mode
      drm/amd/display: apply two different methods to validate modes
      drm/amd/display: remove use_native_pstate_optimization

YiPeng Chai (1):
      drm/amdgpu: Remove useless timeout error message

Yihan Zhu (3):
      drm/amd/display: move RMCM programming
      drm/amd/display: Add RMCM debug logging
      drm/amd/display: Fix RMCM programming seq errors

ganglxie (3):
      drm/amdgpu: clear pa and mca record counter when resetting eeprom
      drm/amdgpu: refine usage of amdgpu_bad_page_threshold
      drm/amdgpu: refine ras error injection when eeprom initialization failed

 Documentation/gpu/amdgpu/debugging.rst             |  18 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |   2 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |  33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  33 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c  |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c  |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 455 +++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c   |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  89 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |  24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            | 262 ++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c             |  96 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h             |  29 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  58 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |   9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 143 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  98 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |  63 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  60 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |  20 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            | 216 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |  25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |  10 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         | 313 +------------
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  25 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  31 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  26 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |  71 ---
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |  71 ---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  78 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  13 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |   8 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              | 263 +----------
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            | 173 ++++++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |  14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |  14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |  14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |  14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |  14 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |  20 -
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |  12 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |  31 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.c           |  25 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |  18 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  27 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c           |  25 +-
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |  25 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  76 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  17 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  17 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  52 ++-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |  25 +-
 drivers/gpu/drm/amd/amdgpu/soc15.h                 |   1 -
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  13 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  13 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  13 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  13 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   1 -
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            | 123 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |   1 -
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  45 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   6 +-
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c        |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 265 +++++++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   3 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h    |  26 ++
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |   1 +
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  87 ++--
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.h |   1 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  62 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |   2 +
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  12 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |  11 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  85 +++-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       | 356 +++++++++++---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |  77 +++-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  19 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   6 +-
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |  19 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  17 +-
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |   2 +-
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.h   |   3 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   4 -
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |   6 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |  45 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h   |  12 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |   6 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h   |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |   4 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.h |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  30 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   4 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.h   |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |   4 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.h |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.c | 239 ----------
 .../gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.h |  14 -
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |  13 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    |   2 +-
 .../display/dc/dml2/display_mode_core_structs.h    |   1 +
 .../dc/dml2/dml21/dml21_translation_helper.c       | 509 ++++++++++++---------
 .../dc/dml2/dml21/dml21_translation_helper.h       |   4 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.c    |  14 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |  67 +--
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.h  |  13 +-
 .../drm/amd/display/dc/dml2/dml21/inc/dml_top.h    |   1 -
 .../dc/dml2/dml21/inc/dml_top_dchub_registers.h    |   1 +
 .../dc/dml2/dml21/inc/dml_top_display_cfg_types.h  |   2 +
 .../dml2/dml21/inc/dml_top_soc_parameter_types.h   |   5 +
 .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |  14 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  58 ++-
 .../dml21/src/dml2_core/dml2_core_shared_types.h   | 181 +++++++-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.c  |   2 +-
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c   |   3 -
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.h | 149 +++++-
 .../dml21/src/inc/dml2_internal_shared_types.h     |  10 +-
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |   2 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  20 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c | 265 ++---------
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |   6 +-
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c |   2 +-
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h |   3 +-
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |  24 -
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |   6 +-
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h |   2 +
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.h |  19 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  10 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.h  |   4 +
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  59 +++
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  30 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |  37 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.h  |   2 +
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |   2 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |   6 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  28 ++
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  | 302 +-----------
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |   8 -
 drivers/gpu/drm/amd/display/dc/inc/core_status.h   |   1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |  14 +-
 drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h     |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |   2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |  47 ++
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |   1 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |   6 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |  63 ++-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   3 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  10 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   2 +-
 .../gpu/drm/amd/display/dc/link/link_validation.c  | 124 +++--
 .../gpu/drm/amd/display/dc/link/link_validation.h  |   6 +-
 .../display/dc/link/protocols/link_dp_capability.c |  38 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |  15 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.c    | 287 ++++++------
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |  39 +-
 .../dc/link/protocols/link_edp_panel_control.c     |  21 +
 drivers/gpu/drm/amd/display/dc/mpc/Makefile        |   2 +-
 .../gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.c   |   5 +-
 .../gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.h   |   8 +
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c |  12 +-
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h |  13 +
 drivers/gpu/drm/amd/display/dc/os_types.h          |   1 +
 .../display/dc/resource/dce100/dce100_resource.c   |   2 +-
 .../display/dc/resource/dce110/dce110_resource.c   |   2 +-
 .../display/dc/resource/dce112/dce112_resource.c   |   2 +-
 .../display/dc/resource/dce112/dce112_resource.h   |   2 +-
 .../amd/display/dc/resource/dce60/dce60_resource.c |   2 +-
 .../amd/display/dc/resource/dce80/dce80_resource.c |   2 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |   4 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   8 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.h |   4 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |   8 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.h |   2 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |  22 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.h |   6 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |  57 ++-
 .../amd/display/dc/resource/dcn31/dcn31_resource.h |  10 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |  21 +-
 .../display/dc/resource/dcn314/dcn314_resource.h   |   2 +-
 .../display/dc/resource/dcn315/dcn315_resource.c   |   8 +-
 .../display/dc/resource/dcn316/dcn316_resource.c   |   8 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |  44 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |   4 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |  20 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |  17 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |  17 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |  17 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |  50 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |   2 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c       |  45 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl_types.h |   2 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |  13 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    | 331 +++++++++++++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |   5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |  21 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |   5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |  13 +-
 .../drm/amd/display/modules/freesync/freesync.c    |  10 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |   2 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   2 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  15 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |  72 +--
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     | 118 ++---
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.h     |   7 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  10 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 121 +++--
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   9 +-
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h |   1 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_pmfw.h   |  16 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   2 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  39 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  22 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  37 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  37 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  55 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 106 ++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |  38 ++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  19 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |   2 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 105 ++++-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  60 ++-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  90 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  10 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |  41 +-
 drivers/gpu/drm/radeon/evergreen_cs.c              |  98 +++-
 drivers/gpu/drm/radeon/radeon_drv.c                |   3 +-
 276 files changed, 6045 insertions(+), 3928 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.c
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.h
