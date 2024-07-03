Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3898926A10
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 23:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F54110E9BF;
	Wed,  3 Jul 2024 21:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U/LV9ift";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4ABF10E95F;
 Wed,  3 Jul 2024 21:13:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4ylROQ9ulbwbSTHuIb2qAuNJGtvS7McTbEkPjTp7YrU5WDSz5x67PhWIdLqWsxp2ybkr+fNRq5tSadfdYpvXvzw5omvu3y8I1j9VlrzoZebGKjwjOgLR7RgXMrX84+dEqRkm9G9dzA0EbmTobjg4As2I9O4RKH6namaMl67hD5GSkHDjFUQzFOfmTOBX47qHUoUxSg+l+Jm0ZZlxWh0X5wcqfif+mw2VrBxe09heiazTljLwfT57Ltee2V1d2qjhWeSBJxEuHFQeHXelo3zPK21i0w9HDs5uc4hJ7Od+6miYBp9tLb3p1xlEIy+lyuJUi/z7XORRym7kiMnop2iXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FsPK86FzidmfoVc9GMLvkBJU3r8jqKknke7mYMtGos=;
 b=c1RFx+RcRRGusOVySCwOH6J/0m67i7oir9Kk95L8fU2AemvveIMi3mLwbHKembDY0dIQRF+jY1h4pZdUYRzYpzHCjjgVX1AbCu76knCzoig7glH4X9JUFHKXnKpcmrlhFaszuIvc1SOWpWD+r92ErBEHNSwhTiG2a1KGAgZ3P6MMpNsYlM0oAZ1y/ZUhBzWn9RTiYgk9QqqNy7CkjHXV4+61wNDJxojRLkeucZatZfjhBSJUlyKwn73u07BjSU+GWsolzEhYx0nqU55d/XcMztc3sM89HvPixH6M5jvDqNB28g2Z9+RjzpX4dyq0sD2y6eK+tmHnipWpa7eghICGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FsPK86FzidmfoVc9GMLvkBJU3r8jqKknke7mYMtGos=;
 b=U/LV9iftADhQ30P9ZIttunnXAnlNV8pX2bERNZxIz76kLBID1kVaWLgtoLDoCXF7+sCFYTwVuM9/aa4Li4rR5n2A6WSW7INBS9gKtnt65BaS8hwuTAp4vdQj2G4pZZ8xlqlE3HUHz2xVJC3kHUWA+Q7uJtKg+I3CK9XIviGzkr4=
Received: from CH2PR14CA0033.namprd14.prod.outlook.com (2603:10b6:610:56::13)
 by DM4PR12MB6181.namprd12.prod.outlook.com (2603:10b6:8:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Wed, 3 Jul
 2024 21:13:33 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::c1) by CH2PR14CA0033.outlook.office365.com
 (2603:10b6:610:56::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25 via Frontend
 Transport; Wed, 3 Jul 2024 21:13:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Wed, 3 Jul 2024 21:13:33 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Jul
 2024 16:13:31 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, radeon drm-next-6.11
Date: Wed, 3 Jul 2024 17:13:13 -0400
Message-ID: <20240703211314.2041893-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|DM4PR12MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: ee3a92f0-c57d-4353-5f69-08dc9ba4fef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TU9VdFNEQ01BTlVFZEFxZ2crU2F2RlJ4WGdjZ3lmQjRlLzYxK2VUOHZ2VlBh?=
 =?utf-8?B?L25IVExEZ0kxM0kwdGZBZkpiVHJONnpkdzBuVkd6OWRXU3VSUmJLeXRnb2dL?=
 =?utf-8?B?Qm94VWVTb3VRQlpyeEpkVHFXejd6dGJqak8yeFE1amxTc2NEb2tQVGQzMC9q?=
 =?utf-8?B?WUhBczdxTUY3cEk2ZExuOEVWTUdIdDl4dFZPamxQTnltZC9VRzlHNTEydElx?=
 =?utf-8?B?ZFFENkUwVWFIUXVVMzlaYjJadHhFcFZKeXpiRnRybGsxcFJGL052NDRPTTNv?=
 =?utf-8?B?V2dtOW9sODFCbHNDbGxDVDZCdmJQemtqUkFKbEVMYUU0d0xaYTNZQU9xZnBN?=
 =?utf-8?B?enhleWlheC9OdlNmQUlNUDlVSEtvckErYjEwZGJ1WHMraUs5NnpkS0svU3dG?=
 =?utf-8?B?dzV1eXNQQkQ0ZzFPVGxJclVWSmwxMXBLRUFuMnNmeGFGQlJNRUZUeUVyc2hZ?=
 =?utf-8?B?dFNGM0dpdnAzNURMdkt6MmFJTkpxMkFieGFrUXoxOXdhVTAvc2NsVVdtd1Zp?=
 =?utf-8?B?Wk5DY1lqdENFRitSYmFUNXRRSHlocm9hZ0M2RkREUHcwUmJFa0VNRXpzZThq?=
 =?utf-8?B?NzZkeHhMalpSNHJscURYSGZROXVnYUU4RzV5d1ViWmpKalZHemQ5Tm5ud3ZI?=
 =?utf-8?B?ZnlvOXRQNHpLY1FOdE8yTTFoRWpRZ1UwYmlqU1RCdC92QjZsYTNySnBNa1NL?=
 =?utf-8?B?WEkrdnp5cHRJelJqV2hiRW9GN1BvTGVtRzdGVEcxbFRLV2RtQUs2cnNZeWxl?=
 =?utf-8?B?MGR4VDVuK1cyaDVNc3phMmUrRk0yZUZTbHVGYUhoMEFmNHJma0djcmVwMkMy?=
 =?utf-8?B?ajBOUWZDRWlQc0EyZWo5bUJnR05XSUdJM1hLUHlwK0VMZzNXb1A4UksrTEdP?=
 =?utf-8?B?SVJTTmdpMlZySk9OM2ZNMlMvYm5FMEQ4cmVBS1pSMDFUZE5Xbk13QWdyaGlZ?=
 =?utf-8?B?SEFFcmpEWXFya0Rxd1Z0T1llbGcyNzBQVTlqVW4zREVQV20wMDZsQkJYa1Yz?=
 =?utf-8?B?VGptTTJpZEdaZnR5aDMyeGVTYlY3NmdzQkpuUjlLWllpbFVUZWtuNndDM0gx?=
 =?utf-8?B?bUJ3cWVISjQvQ2lJM1V3WnZQVSt4dDZqbGpuRVo5bVNwRWhrOEYzc0VoZFg3?=
 =?utf-8?B?cDFuSkFyWURhYitlQXpIZy9YQnNYSG9MS05VdEoxRVFqYWhhYnc5OTgvVXpp?=
 =?utf-8?B?UklpSVNJNnZ4LzZaNDZsbExMekRzM2RQdlZwMFBPZml2M2FIcTVFb3RaTHZN?=
 =?utf-8?B?RmlMY0tBVXQveTBYaWkrbGN6R0NFMWt4TVJuVDUvY003RU5LWDBncEpFdFVo?=
 =?utf-8?B?K0ZhdnAzTHFIekhHdlV1S2FEbXFHbnlDSjNJYkZ2SFF0NFpiVGVIYW5UODA2?=
 =?utf-8?B?ajE0Y1FHMFZUNUY4ODFUcUZ5VWFUN1ZLMUtUQ082RTVnandqaE9mRVl3djIw?=
 =?utf-8?B?VTRmek9XbmdjN0NCYjhNYXJmYmN3aU43OXVoanptdTJlUks1TzJSNCtxWTl6?=
 =?utf-8?B?V3ZtN0lUcTNrYWpjeE9qZE9NeEdzeVUvcFFtSjlYeWxRUmhtRGZOVFdDVUw4?=
 =?utf-8?B?MkF6NElQck5nZThlMlZOR3Rld2N6dHJya2cxMkZlSDFWWDJYMzMyMVk3U28y?=
 =?utf-8?B?VFJrN3J6WXVLU0o1Nis2R3dJZ3VycGJnUy9JR0Y4WklRZ0xJemV2VGtVMzBx?=
 =?utf-8?B?UmxqdCtZOFlldytOazhMVGFaZGJCOHoyR3FwUElJUndrVVJ1ZGx2SnpMUW1E?=
 =?utf-8?B?czk4L0lRUUJmTzZQcU1ybUY2b0FVNUxZenBlZ242MkRKZ25ZYWs3SE5DZkJo?=
 =?utf-8?B?MnZqL3p3UmRXaWJKRXdUeExpYVRRNVVnLzFyT0pIM1FvblgvaTlNV1ZjY28y?=
 =?utf-8?Q?VAk0fJPQO/Qrs?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 21:13:33.2938 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3a92f0-c57d-4353-5f69-08dc9ba4fef0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6181
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

More new stuff for 6.11.  There will be a few additional patches next
week for new IPs that were added in this cycle just to get them tied off,
but this should be it for general changes.

The following changes since commit 15eb8573ad72a97b8f70e3c88b9bef6ddc861f77:

  drm/amd: Don't initialize ISP hardware without FW (2024-06-27 17:34:40 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.11-2024-07-03

for you to fetch changes up to 4ed6a3689caba239e6df18c60af9489001f481c3:

  drm/amdgpu/atomfirmware: silence UBSAN warning (2024-07-02 18:07:31 -0400)

----------------------------------------------------------------
amd-drm-next-6.11-2024-07-03:

amdgpu:
- Use vmalloc for dc_state
- Replay fixes
- Freesync fixes
- DCN 4.0.1 fixes
- DML fixes
- DCC updates
- Misc code cleanups and bug fixes
- 8K display fixes
- DCN 3.5 fixes
- Restructure DIO code
- DML1 fixes
- DML2 fixes
- GFX11 fix
- GFX12 updates
- GFX12 modifiers fixes
- RAS fixes
- IP dump fixes
- Add some updated IP version checks
_ Silence UBSAN warning

radeon:
- GPUVM fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amd/display: use vmalloc for struct dc_state
      drm/amdgpu/atomfirmware: silence UBSAN warning

Alex Hung (3):
      drm/amd/display: Fix possible overflow in integer multiplication
      drm/amd/display: Check denominator pbn_div before used
      drm/amd/display: Check denominator crb_pipes before used

Alvin Lee (1):
      drm/amd/display: Account for cursor prefetch BW in DML1 mode support

Anthony Koo (1):
      drm/amd/display: Add replay state entry to replay_state

Aric Cyr (1):
      drm/amd/display: 3.2.291

Bhuvanachandra Pinninti (1):
      drm/amd/display: Move dio files into dio folder

Dillon Varone (1):
      drm/amd/display: Cleanup dce_get_dp_ref_freq_khz

Fangzhi Zuo (2):
      drm/amd/display: Fix dmub timeout after fams2 enabled
      drm/amd/display: Update efficiency bandwidth for dcn351

George Shen (2):
      drm/amd/display: Fix divide by zero in CURSOR_DST_X_OFFSET calculation
      drm/amd/display: Add ASIC cap to limit DCC surface width

Hawking Zhang (2):
      drm/amdgpu: Correct register used to clear fault status
      drm/amdgpu: Fix hbm stack id in boot error report

Jiapeng Chong (5):
      drm/amd/display: Fix unsigned comparison with less than zero
      drm/amd/display: Fix warning comparing pointer to 0
      drm/amd/display: Fix warning comparing pointer to 0
      drm/amd/display: Fix warning comparing pointer to 0
      drm/amd/display: Fix warning comparing pointer to 0

Joshua Aberback (1):
      drm/amd/display: Remove unnecessary error message

Li Ma (1):
      drm/amd/pm: smu v14.0.4 reuse smu v14.0.0 dpmtable

Lijo Lazar (1):
      drm/amdkfd: Use device based logging for errors

Marek Olšák (13):
      drm/amdgpu: check for LINEAR_ALIGNED correctly in check_tiling_flags_gfx6
      drm/amdgpu/gfx11: remove superfluous cache flags
      drm/amdgpu/gfx12: remove superfluous cache flags
      drm/amdgpu/gfx12: remove GDS leftovers
      drm/amdgpu: remove AMD_FMT_MOD_GFX12_DCC_MAX_COMPRESSED_BLOCK_* definitions
      drm/amdgpu/display: handle gfx12 in dm_check_cursor_fb
      drm/amdgpu: don't use amdgpu_lookup_format_info on gfx12
      drm/amdgpu: handle gfx12 in amdgpu_display_verify_sizes
      drm/amdgpu/display: handle gfx12 in amdgpu_dm_plane_format_mod_supported
      drm/amdgpu/display: set plane attributes for gfx12 correctly
      drm/amdgpu/display: add all gfx12 modifiers
      drm/amdgpu: add amdgpu_framebuffer::gfx12_dcc
      drm/amdgpu: rewrite convert_tiling_flags_to_modifier_gfx12

Nevenko Stupar (1):
      drm/amd/display: Adjust cursor visibility between MPC slices

Nicholas Kazlauskas (1):
      drm/amd/display: Add debug option for disabling SLDO optimizations

Paul Hsieh (1):
      drm/amd/display: un-block 8k with single dimm

Pierre-Eric Pelloux-Prayer (1):
      drm/radeon: check bo_va->bo is non-NULL before using it

Roman Li (1):
      drm/amd/display: Fix array-index-out-of-bounds in dml2/FCLKChangeSupport

Ryan Seto (1):
      drm/amd/display: Add available bandwidth calculation for audio

Sherry Wang (1):
      drm/amd/display: Skip unnecessary abm disable

Sung Joon Kim (1):
      drm/amd/display: Choose HUBP unbounded request based on DML output

Sunil Khatri (2):
      drm/amdgpu: fix out of bounds access in gfx10 during ip dump
      drm/amdgpu: fix out of bounds access in gfx11 during ip dump

Teeger (1):
      drm/amd/display: Revert Add workaround to restrict max frac urgent for DPM0

Tim Huang (21):
      drm/amdgpu: initialize GC IP v11.5.2
      drm/amdgpu: add GFXHUB IP v11.5.2 support
      drm/amdgpu: add tmz support for GC IP v11.5.2
      drm/amdgpu: add GC IP v11.5.2 soc21 support
      drm/amdgpu: add GC IP v11.5.2 to GC 11.5.0 family
      drm/amdkfd: add KFD support for GC IP v11.5.2
      drm/amdgpu: add firmware for GC IP v11.5.2
      drm/amdgpu: add SDMA IP v6.1.2 discovery support
      drm/amdkfd: add KFD support for SDMA IP v6.1.2
      drm/amdgpu: add firmware for SDMA IP v6.1.2
      drm/amdgpu: add NBIO IP v7.11.3 discovery support
      drm/amdgpu: Add NBIO IP v7.11.3 support
      drm/amdgpu: add VPE IP v6.1.3 support
      drm/amdgpu: add VPE IP v6.1.3 discovery support
      drm/amdgpu: add firmware for VPE IP v6.1.3
      drm/amdgpu: add PSP IP v14.0.4 support
      drm/amdgpu: add PSP IP v14.0.4 discovery support
      drm/amd/pm: add SMU IP v14.0.4 support
      drm/amdgpu: add SMU IP v14.0.4 discovery support
      drm/amdgpu: enable mode2 reset for SMU IP v14.0.4
      drm/amdgpu: add firmware for PSP IP v14.0.4

Tom Chung (3):
      drm/amd/display: Reset freesync config before update new state
      drm/amd/display: Add refresh rate range check
      drm/amd/display: Fix refresh rate range for some panel

Wenjing Liu (1):
      drm/amd/display: fix a crash when clock source is reference for non otg master pipe

Xi (Alex) Liu (1):
      drm/amd/display: replace CRTC disable function call

 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  11 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  94 +++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  20 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  22 -----
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   3 +
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  28 ++++++
 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.c              |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   7 ++
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |  21 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |  63 +++++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  24 +++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  63 +++++++++++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 108 +++++++++++++++------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c  |   2 +-
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |   2 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |   2 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   4 +-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  38 ++++----
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   8 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   6 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   4 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |   5 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |   8 +-
 .../gpu/drm/amd/display/dc/dce/dce_panel_cntl.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |   1 -
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |   1 -
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |   2 -
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |   2 +-
 drivers/gpu/drm/amd/display/dc/dio/Makefile        |  36 +++++++
 .../dc/{ => dio}/dcn10/dcn10_link_encoder.c        |   0
 .../dc/{ => dio}/dcn10/dcn10_link_encoder.h        |   0
 .../dc/{ => dio}/dcn10/dcn10_stream_encoder.c      |   0
 .../dc/{ => dio}/dcn10/dcn10_stream_encoder.h      |   0
 .../dc/{ => dio}/dcn20/dcn20_link_encoder.c        |   0
 .../dc/{ => dio}/dcn20/dcn20_link_encoder.h        |   0
 .../dc/{ => dio}/dcn20/dcn20_stream_encoder.c      |   0
 .../dc/{ => dio}/dcn20/dcn20_stream_encoder.h      |   0
 .../dc/{ => dio}/dcn30/dcn30_dio_link_encoder.c    |   0
 .../dc/{ => dio}/dcn30/dcn30_dio_link_encoder.h    |   0
 .../dc/{ => dio}/dcn30/dcn30_dio_stream_encoder.c  |   0
 .../dc/{ => dio}/dcn30/dcn30_dio_stream_encoder.h  |   0
 .../dc/{ => dio}/dcn31/dcn31_dio_link_encoder.c    |   0
 .../dc/{ => dio}/dcn31/dcn31_dio_link_encoder.h    |   0
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   2 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   3 +
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |  22 +++--
 .../dml2/dml21/src/dml2_core/dml2_core_factory.c   |   2 +-
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c   |   2 +-
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c  |   2 +-
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c  |   2 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   1 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |  14 +--
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |  15 ---
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |   2 -
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |   6 ++
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |  15 ++-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  62 +++++++++++-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |   6 ++
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  47 +++++++--
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |   1 +
 .../dc/link/protocols/link_edp_panel_control.c     |   2 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |  22 -----
 .../display/dc/resource/dcn315/dcn315_resource.c   |   2 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   2 -
 .../display/dc/resource/dcn401/dcn401_resource.c   |   3 +
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |   8 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   1 +
 .../drm/amd/display/modules/freesync/freesync.c    |   2 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   1 +
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |  20 ++--
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  30 +++---
 drivers/gpu/drm/radeon/radeon_gem.c                |   2 +-
 include/uapi/drm/drm_fourcc.h                      |   5 +-
 94 files changed, 624 insertions(+), 318 deletions(-)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn10/dcn10_link_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn10/dcn10_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn10/dcn10_stream_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn10/dcn10_stream_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn20/dcn20_link_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn20/dcn20_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn20/dcn20_stream_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn20/dcn20_stream_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn30/dcn30_dio_link_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn30/dcn30_dio_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn30/dcn30_dio_stream_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn30/dcn30_dio_stream_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn31/dcn31_dio_link_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn31/dcn31_dio_link_encoder.h (100%)
