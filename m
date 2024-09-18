Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB8197C0C3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 22:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D591710E639;
	Wed, 18 Sep 2024 20:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yv2yAlQa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F025610E636;
 Wed, 18 Sep 2024 20:33:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HODY1ZxALq+OA/rp9y7zOfi58Oi0eNCgQw/p3o6mLTulRhjfyCDSL5BmE6sH82OJVZz5AhtAIfIFpjyGPR7z8Qd37GPsx9RwHF+l0zjwm50vV56yE47UJl74L/3btcFTVPJm7tBedLOd+kQNnKj2qNm33yUIHg9xAxKUjp6BQCnwoRXjG0qkgizuKQvNAkWFkUv6bgniAL9UCYCw1bOUgJ8vnZUAo32j5dJX7j5P86uV5xIIQKQS3Az0EM4V3ds9uWntArwQt5CJifd0CGKLfXfBezdzkKR5M85Ki/bx27wXiUrYXL98DTHiz5IAvzVBQu/JMdHBSE3izornGGIqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bu0apa650kX1EXy2kixhq+B/0NFiQp2m5Wps19wdVI0=;
 b=uoWsL57aypmRU88v2M4Hf2hpaCaZWKLw58YrD8AJMsTLnOUQSBHDj+T8BxrytXac8690B4FIU2FF82+VFXAVqQbcMRiFlpWBFTpH6A7XtWUffJnSpZ+R8gf8aT9uZ2oteCf/H8jSWMIKJNynEa3x0nDh28FdvEe35YaT8PTH7WDGMaelBktquknKoyGMLchkGb4ozd6/6ez0ZcaqF9rCndRQNCCYSiNvZLDZcWpqO0TJZQZhnryvZQvZmA5Fb9q4fmXuNYklj4w6wUGgEwx/uBHoQmwIsIXbtmEUfT86bRtiA+j5DuA9uMgwAoL0OyRv4w0Tl/UHchrDjGW8SvS2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bu0apa650kX1EXy2kixhq+B/0NFiQp2m5Wps19wdVI0=;
 b=yv2yAlQaD6uCBW26q2rHw2KBP8Mp5ZNrc87Lp05U5TeDBTgDR1ZRCrVtp4Gzd5GtAVNTo021qvfi107QUFGxPA0Z9MBXzpWrlBRdxhcJ4PdAi5Y7/+xm5PzNhgFwitwcj6T8RZhaC/i0FEmUS/4KXTg/OiC47XjSM4uBL7PNibM=
Received: from PH7P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::20)
 by BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Wed, 18 Sep
 2024 20:33:23 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:510:338:cafe::65) by PH7P223CA0019.outlook.office365.com
 (2603:10b6:510:338::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 20:33:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 20:33:23 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 15:33:22 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.12
Date: Wed, 18 Sep 2024 16:33:08 -0400
Message-ID: <20240918203308.1474500-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|BL1PR12MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: 71bebc60-670b-4b87-adc0-08dcd821242f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1RXQnJJdHlKazRDZDVpMWZOY1plMWNNUGJxK2c1N3o4REttSnN5ZUs5YUow?=
 =?utf-8?B?ZUJ4T0NuMGxTU0hBN0ZkSTVlN0ZmbTY0dGprNHdnRnBjOXR2YjAvbkYxeWh5?=
 =?utf-8?B?QnRDc3ZBUDVPOFRTSDNRRDJhNDlrSHA2aTgyNHhqOERLaWJlcXpzNlNaMnBs?=
 =?utf-8?B?bmhxcWFlZVNYOWIwSkZYcWRSTGJ3SU9uRGNwVFh6L3B4WERFMTJSbEpsTmQ2?=
 =?utf-8?B?R2ZaVUFwVWVDTm56V0JFeUwwYzJpMy94Ky85SnVmaDgrSGM4Ny9lSmRIU1N0?=
 =?utf-8?B?clpZY2NLL2hSaTNyYnhkT1lycGROS2piQzREWXpLSkZzd3Y1TCtvZGg3SzVU?=
 =?utf-8?B?MExZMzcxNVdqay8vSk9mSEVYNkhlQU1MWVNET01XSVNHSEhQMzM2SlhGb0py?=
 =?utf-8?B?OUk4SHhnaUV3T003cGg1UExqT3ZYaG9JYkZkaHM3bVZYelc1b3B4RlBtUUY4?=
 =?utf-8?B?d0RQTFpnbkdyY05HY2YzcWNITVhsZDlJWVc4TXNobHBLM0VpczkvdGdkb2sw?=
 =?utf-8?B?N2lLVlR3Ti9MT0RIaC92TkhLamkyUG9iUElqRnJ1UkNWSFFETFNTbkZnTFV1?=
 =?utf-8?B?SW1vYzRESTNrTHJnVnpsendFaGxpeHNBZUx2TkR1RUZvaTB0aGZ5NWljTWVx?=
 =?utf-8?B?cnEydkFXOWg1c3UvOWdidDZacVJGQnlHTUphTUE4REl2bURVTCsxQjdMdmhU?=
 =?utf-8?B?cUpQNzVCanNMSmNyOXZxeWRhTTZSN2VaVDNhZWZYb1Z4aEluWEk0bVY4UDZV?=
 =?utf-8?B?U3hBc1NuVjNNbnBzcHU5cjNXOTVyRERtZDU5c0hrVTY5N2JPdmpvMktOQ3lK?=
 =?utf-8?B?ZUtoTkZVWkhLN1libTlCQm9iWm5BdGkrT1lZdks1NzZlVVhvQUdZTGpSbWx3?=
 =?utf-8?B?bWZjc0hITS81Wm43VlpuN1FZc0RIMlVveG9IVThObGlhWFdxTHRkM2hJRFox?=
 =?utf-8?B?Vzgyb2ZvUTlKMURSdmtDRjB2RFV0MVdzQjFYM0F6dmhFU29nSVhadmxDMXI5?=
 =?utf-8?B?M214K0VsMTN5S1lJclFRL2RjSWVJeUpyV2J1WmJXVC9OQUMyNU5Md3pJYmY1?=
 =?utf-8?B?cnBhakxkSG85RzIwdVlsV21RR2tsbDRuL3NpZ2prREdHWmtVeW4xSnNUOTAr?=
 =?utf-8?B?anNuOTI4eTYrQlFFT2Q3ZkJ1U2xNT2JMbVlBZFVoTFdGS0RsdWgrWm83QnJO?=
 =?utf-8?B?LzNkQ3VyYVM0bk9nVWhab2JRbGJ0REtHUWsvQlI3WS9PY1o0emxsR0Y0Q243?=
 =?utf-8?B?MzExK2tzNkwxeWIvSU8wMVI4d0c2SlFzcndIaWZ2b3BMYmwyc082K0JhUjY0?=
 =?utf-8?B?REhUVytEZVdZSkIvOGM1RHkrL3JISVVRYkxwdjd0VE9DN05OZHJReG0zTnpB?=
 =?utf-8?B?eEFvQzZzYmF0U2NtSmdOSGh2bGtDUjY4K1Y2dHk4aEZSRHE0ckp3ZDVqbjY2?=
 =?utf-8?B?aS95ZDVkZHA2d001Q3BqbXplNzZsWEhNNWVEVFYzam82SDE5UkhmNXpXRHBG?=
 =?utf-8?B?UXJ3V3VHbmpDYVVsQWJxeHc3N2dWQzE4eDNnZ1dUaWhWbzRTL0wvUzFSZC94?=
 =?utf-8?B?bnowcUNGeXRYTzQ2UHdERXJuSkZFMjkzUFdoUyt6SFpUa0VpQUVHcjZMT2Rw?=
 =?utf-8?B?UlVxMG5EV0NUWElyRzA0dUdva0Z5a1l5ckxzbmVUaDlid3BiYm5ocmVpNmFC?=
 =?utf-8?B?WnpoTHJVNFhoalNZNENod00wSUFQL1ROOG1ZQVNtZnRid0NrK2U1OXRZQ1F6?=
 =?utf-8?B?M0xzR1k1TjNuUitHNXZpd2ZjRDhwR3dqdTd1amhBcGRsMFNLNm11bTRPTjR2?=
 =?utf-8?B?V1Z2eURJYXJwcGhPV1ljV1hUT3hLRlVTb2QzY2RyMmlwRnRxUlFZRXpLdUFt?=
 =?utf-8?B?U3VyaUViTzJJdVlSbklPcHU3S20xWVFPQkhqUXA3dWZDQ1E9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 20:33:23.1611 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71bebc60-670b-4b87-adc0-08dcd821242f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5732
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

Fixes for 6.12.

The following changes since commit ae2c6d8b3b88c176dff92028941a4023f1b4cb91:

  Merge tag 'drm-xe-next-fixes-2024-09-12' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-09-17 14:53:34 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.12-2024-09-18

for you to fetch changes up to 84f76408abe989809de19d02e476b044fd985adc:

  drm/amdgpu/mes12: reduce timeout (2024-09-18 16:15:13 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.12-2024-09-18:

amdgpu:
- SMU 13.0.x fixes
- GFX 9.4.3 fixes
- GC 12.x fixes
- GPUVM fixes
- PSP 13.0.x fixes
- DPCD handling fixes
- DCN 3.5 fixes
- DSC fixes
- DCN 4.0.1 fixes
- Backlight fixes
- VBIOS fetching fix
- Documentation fix
- GEM fix
- MES fixes
- Misc small fixes and cleanups

amdkfd:
- Fix queue info cleanup
- GFX10 interrupt cleanup

----------------------------------------------------------------
Alex Deucher (8):
      drm/amdgpu/gfx9.4.3: drop extra wrapper
      drm/amdgpu: fix spelling in amd_shared.h
      drm/amdgpu/gfx9.4.3: set additional bits on MEC halt
      drm/amdgpu/gfx9.4.3: Explicitly halt MEC before init
      drm/amdgpu/bios: split vbios fetching between APU and dGPU
      drm/amdgpu: clean up vbios fetching code
      drm/amdgpu/mes11: reduce timeout
      drm/amdgpu/mes12: reduce timeout

Alex Hung (2):
      drm/amd/display: Check null pointer before dereferencing se
      drm/amd/display: Remove always-false branches

Andrew Kreimer (1):
      drm/amdgpu: Fix a typo

Aric Cyr (2):
      drm/amd/display: 3.2.300
      drm/amd/display: 3.2.301

Asad Kamal (2):
      drm/amd/pm: Update SMUv13.0.6 PMFW headers
      drm/amdgpu: Fix get each xcp macro

Aurabindo Pillai (1):
      drm/amd/display: Fix underflow when setting underscan on DCN401

Bob Zhou (1):
      drm/amdgpu: Fix missing check pcie_p2p module param

Charlene Liu (2):
      drm/amd/display: Use full update for swizzle mode change
      drm/amd/display: Clear cached watermark after resume

Christian König (4):
      drm/amdgpu: nuke the VM PD/PT shadow handling
      drm/amdgpu: explicitely set the AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS flag
      drm/amdgpu: remove amdgpu_pin_restricted()
      drm/amdgpu: use GEM references instead of TTMs v2

Daniel Sa (1):
      drm/amd/display: Emulate Display Hotplug Hang

David Belanger (1):
      drm/amdgpu: Fix selfring initialization sequence on soc24

Dillon Varone (1):
      drm/amd/display: Block timing sync for different output formats in pmo

Frank Min (1):
      drm/amdgpu: update golden regs for gfx12

Jack Xiao (1):
      drm/amdgpu/mes12: switch SET_SHADER_DEBUGGER pkt to mes schq pipe

Jesse Zhang (1):
      drm/amdkfd: clean up code for interrupt v10

Kent Russell (2):
      drm/amdkfd: Move queue fs deletion after destroy check
      drm/amdgpu: Retry i2c transfer once if it fails on SMU13.0.6

Le Ma (2):
      drm/amdgpu: add psp funcs callback to check if aux fw is needed
      drm/amdgpu: load sos binary properly on the basis of pmfw version

Leo Ma (1):
      drm/amd/display: Add HDMI DSC native YCbCr422 support

Lijo Lazar (1):
      drm/amdgpu: Fix XCP instance mask calculation

Mario Limonciello (2):
      drm/amd/display: Validate backlight caps are sane
      drm/amd/display: Allow backlight to go below `AMDGPU_DM_DEFAULT_MIN_BACKLIGHT`

Martin Tsai (1):
      drm/amd/display: Clean up dsc blocks in accelerated mode

Nicholas Kazlauskas (1):
      drm/amd/display: Block dynamic IPS2 on DCN35 for incompatible FW versions

Peichen Huang (1):
      drm/amd/display: Restructure dpia link training

Relja Vojvodic (1):
      drm/amd/display: Add fullscreen only sharpening policy

Robin Chen (1):
      drm/amd/display: Round calculated vtotal

Roman Li (2):
      drm/amd/display: Add dmub hpd sense callback
      drm/amd/display: Update IPS default mode for DCN35/DCN351

Ryan Seto (1):
      drm/amd/display: Implement new DPCD register handling

Samson Tam (2):
      drm/amd/display: Use SDR white level to calculate matrix coefficients
      drm/amd/display: Add debug options to change sharpen policies

Srinivasan Shanmugam (1):
      drm/amd/display: Fix kdoc entry for 'tps' in 'dc_process_dmub_dpia_set_tps_notification'

Sung Joon Kim (1):
      drm/amd/display: Disable SYMCLK32_LE root clock gating

Tao Zhou (1):
      drm/amdgpu: disable GPU RAS bad page feature for specific ASIC

Tim Huang (1):
      drm/amdgpu: ensure the connector is not null before using it

Tobias Jakobi (1):
      drm/amd/display: handle nulled pipe context in DCE110's set_drr()

Yan Zhen (2):
      drm/amdgpu: fix typo in the comment
      drm/amd/display: fix typo in the comment

Yihan Zhu (1):
      drm/amd/display: Enable DML2 override_det_buffer_size_kbytes

Zhikai Zhai (1):
      drm/amd/display: Skip to enable dsc if it has been off

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |  63 +++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  89 +-------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         | 132 ++-------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |  23 ----
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  31 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  17 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |  56 +--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |  19 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |  32 ++---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  14 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  20 ++--
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  13 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  17 +++
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |  23 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |  15 ---
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  86 +++++++++++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |   1 +
 drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |   9 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   6 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  41 ++++++-
 drivers/gpu/drm/amd/display/dc/dc.h                |  14 ++-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  12 ++
 drivers/gpu/drm/amd/display/dc/dc_dsc.h            |   4 +-
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |  14 +--
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |   3 -
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |   3 -
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   9 --
 .../drm/amd/display/dc/dml2/display_mode_core.c    |   6 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |   4 +-
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |   8 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  15 +--
 .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c |   1 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  71 +++++++++--
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  14 +++
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  13 ++
 .../drm/amd/display/dc/link/hwss/link_hwss_dpia.c  |  31 ++++-
 .../gpu/drm/amd/display/dc/link/link_validation.c  |   7 ++
 .../display/dc/link/protocols/link_dp_capability.c |   5 +
 .../display/dc/link/protocols/link_dp_training.c   |  80 +++++++++++--
 .../display/dc/link/protocols/link_dp_training.h   |  16 ++-
 .../dc/link/protocols/link_dp_training_8b_10b.c    |  21 ++--
 .../dc/link/protocols/link_dp_training_dpia.c      |  64 +++++-----
 .../dc/link/protocols/link_dp_training_dpia.h      |  19 +++
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   1 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |   3 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |  54 ++++++---
 .../drm/amd/display/dc/spl/dc_spl_isharp_filters.c |  85 ++++++++++++-
 .../drm/amd/display/dc/spl/dc_spl_isharp_filters.h |   9 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h  |  15 ++-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  25 +++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   1 +
 .../drm/amd/display/modules/freesync/freesync.c    |   2 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |   2 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   6 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   8 +-
 84 files changed, 846 insertions(+), 594 deletions(-)
