Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83741C5F06A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B9310E25F;
	Fri, 14 Nov 2025 19:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rdIg7f1k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010061.outbound.protection.outlook.com [52.101.85.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F74910E25F;
 Fri, 14 Nov 2025 19:26:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVvqqXyifHue/Ynw5Y3Vfo/X0mS9Wh1yc3GDzohO9G2Xaritcb4F3nKHS1yYLCjgwD8sPvi/V9+94HCGp9imxPP60dNrr0FurvENnWGr8Drc3EAIOIkrNXyJtlGCpiTxXztAsI6NN/kUYav0BzCujMOsYWmKUiURVWcgnjM7JPGqgLGCN6q1yCetIytMczGCHKscPzkor/wbMv/5M24Lo//1m6w37IKyFJ3KahlWd9/72HrwL15HD9LqSLKmYv2xfYIt+DgNERvtdhLNlVUMekuD+8v7IgpJTdr0e8lV8oLJYoiy07k44Ol54ktUoMXACXR5+QXpxX1gzL5DqiS7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5+Jw11Zoys+Fb0NwP7BGT5wkxcvp2Er6SII+WYX3Eo=;
 b=jaHrNNgedvp/fy41rRaLnUh16UUMaSZi0dDK9wU/Qc/HFbmyctfhkbgUfzvR5FfjPkKTtpjDsmU72vBJI19cBmoOyiGKUhD4gsq2jAh1p7kKF0gMQiTE4tUoVdhfpMzQRSlxPfMZfDVIV1a3hEbVn6+VmrN7M7eftiN18rmAAQbNVHduS59WDxIaE7ynb+9aw//2ygYNx9r7aFlQ9cqS4Buw9myjd95BUeQ19zAKDtVnuaT6IUwcxYWKslzBaOUrCB0s/Sa6cQ1Qvd9L4U9+AcsO9WrKIBPaLB3VPWIv0ww9G/B4I+s9amExPDfLlcT2sUDnbMEnJSzgM8ZeiT1GEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5+Jw11Zoys+Fb0NwP7BGT5wkxcvp2Er6SII+WYX3Eo=;
 b=rdIg7f1k4Ly9aoJdnBM1olXxbHWrtkm2v4DWyPhGAjsOeJsoTCOS0xalDldF91e1iVEnnh/sOKvOrXGgSmezwhe7sy+OGay4w9NJNoiRpqudp6A9exEfP6y1E5cB+t48shycrGMTJa/+HU1qW8gnkoAvmvF6UOGKkq2RQgSUn3A=
Received: from SJ0PR05CA0190.namprd05.prod.outlook.com (2603:10b6:a03:330::15)
 by DM4PR12MB7696.namprd12.prod.outlook.com (2603:10b6:8:100::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 19:26:23 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:330:cafe::c) by SJ0PR05CA0190.outlook.office365.com
 (2603:10b6:a03:330::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Fri,
 14 Nov 2025 19:26:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 19:26:22 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 11:26:18 -0800
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.19
Date: Fri, 14 Nov 2025 14:25:53 -0500
Message-ID: <20251114192553.442621-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|DM4PR12MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf8681e-76e5-46ff-df6c-08de23b3b233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTlyYzBwTGhHZFFFQUlsOXVIOEFodzF0K1JOVERPWFZuWVhBczZvbEVDd2xM?=
 =?utf-8?B?aTd3WTZ0Q3h4WkJtclBRT2Ywd2hZSXFocGkxblhoZUViOXpFeU8reHZTUHVT?=
 =?utf-8?B?c3BycUdqUDgySDhUcFJlSjlXM1NXMTJzWWgzSy9DWHBkYVRtZ1ZZUCtSZ09n?=
 =?utf-8?B?K1kvazdLM1Y0QUplTGtmZ2gxQjl1K28zV3AzUTUxTnJXc2ZRY01XcGpXeHRY?=
 =?utf-8?B?b0d2bHJrRHJJcVRsZTVjY1B4a2g0TEJLaDZWa0xiSU15ejUraE1lY1JVSjdF?=
 =?utf-8?B?cjM2V21EaVh5d3gyZGZzdTBlZGtxOG5QVmxUMWkxVW5pWUU3OVMrMXNRQUVu?=
 =?utf-8?B?QmpjNkRGNnVnalR1eThRbVNGQ0RQdzNCZW50V2lBNGxBNGVyRlUvMFNrTngz?=
 =?utf-8?B?RFJCVlFOeWo3MUF1T3BVSko4eVRJdGM5OXNBM0dLeEI3QWNycmdtUGppemt6?=
 =?utf-8?B?VHhqZGRWaWZsWGVLSXk5c3c0UTdTSUN3VzJWaG8wcTloQjJGSURLV2xBcDdS?=
 =?utf-8?B?dTdFenZhRkZFaFBWaGNjeFJTYUdzZnBTaEtESW5IRzZIWkJrcWpqRGF4bXdX?=
 =?utf-8?B?bFUvclJHTXhOZXliNy9ZU0pZeGFyN3JBY2hwQWRSKzRhR0FHOU5kR3BvTlls?=
 =?utf-8?B?RVhYWHF1KzZYL3RRU1k2R3JGMUM1U0ZtbVJuNitoNzQ5VGdkOHZkM1p3Smo5?=
 =?utf-8?B?MzhhcVZzL0xsZDlaZzhiRE40VjE3SnV2OEN2MCtnWFo1eDNFK0p1RG1yQit6?=
 =?utf-8?B?bXM2RmJONWZTdnYwSWpubDlXdnNlazhGQnhKcWVwOGVRN09PajVaN0g0eGw0?=
 =?utf-8?B?MXEwNGN1NitOdjRyYVc3U3hPdjk5M3ZYalFMQjY3Vy8yc1crclRGaWg4dTRz?=
 =?utf-8?B?SC9wQWVXSGpHRUdhS1Z2VitHZ3ZkelZBbEZPWm90dW5UU01ETmRBOVQyc3M1?=
 =?utf-8?B?NXZVRUR3VjB2eVJaWHhxZEwwSk1zUGh0N0p1MFVjN3Q0VXJ3dUxXdDhLd01N?=
 =?utf-8?B?SEJUYmt4cTZrQkFEOFFVRU1naml6VmlPU2w3NXhneFVEN1VrSVAzK3RySmVJ?=
 =?utf-8?B?U1h0YzM2ajRNdkFXdjUwcU05aDZSNWJJYmtodGxSYm9MVTBWb01RWWlxQy9a?=
 =?utf-8?B?ZEdudWRhekMyNzJzelhXVzMwMEZ2SGNXQXJkQk5iR3NlUVNzV21pM2J5ZURQ?=
 =?utf-8?B?VlVxa1hOZC9WZGczc2JqUEVLVGlYakpFbU93ekVPTE1KSXpVS1g2SmRzY25B?=
 =?utf-8?B?eGdlQ3V1MWlsQ0o1b3VQWGYwR0tTTXoySThNNFhKRTQ0MitaU3FRbFhVREZB?=
 =?utf-8?B?enlGeTRkL1ZZQkhuWVB4ZE81dCtnbkVxL1JRbTBZcDlRNFRvQXozNjBML2Ey?=
 =?utf-8?B?QWU4ZTdkWEUrTG5ZbU5McWZwZithQVd0YktIRklZcWZzTUlqenM3Ly9hcDc5?=
 =?utf-8?B?UElMQ1JKRUNBajdKOEw2Yjd6RVo2VlpoZjgrbG02dDc3WUZEVkhYK1loZit0?=
 =?utf-8?B?WlJpbzFabS9Pb0h4cmI1SFFxSzNKOVA2OUxKcXkzMFcwNGMvVUFHTkJLcG9o?=
 =?utf-8?B?blFEeGQ0ckpOOTVQcWZYdGFqaWN4dzNvbVBkN21aZ3E0U3dQc0ZiL000T1VY?=
 =?utf-8?B?SFgwZHRUNkxEMU0zdFJDVitMYzlDdlpkVkNzL3JjQ05pVzFrVk9ZTnV2anBX?=
 =?utf-8?B?YU1WSXBXY003aEQwUnZ5bjlmMDJiaklhejRycW9kOXBIeWQ0RkY4WU9JeC9E?=
 =?utf-8?B?amROVzUrWUJEUEd6WFBSL25GQldWMGN5c0lXOU1PMDVUdURtbi92Yjk0VHl6?=
 =?utf-8?B?a2pxaGZGNTdFZnpVWnpZekZKNEZ2S29MQ2tVblVqZ2tjb3M3YUJ5WXFQN0F6?=
 =?utf-8?B?MzFWVnRFKzFQN0I4Y1liWElWdGRqVzdrVEFJb0ZYYVNzZHVmWGo0aURKRDlZ?=
 =?utf-8?B?MTF1Mm9Pa2VQc3JGZHptSm1Fc01xczVsbDNITU9oUUNodkVwcE1hU21icm0z?=
 =?utf-8?B?L3djT3d3UjRwai83dWN6bGVibnMzQ1hxVytNY2RTcVVpMDhrUXVCZXBKUFVm?=
 =?utf-8?Q?hZiazI?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:26:22.7716 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf8681e-76e5-46ff-df6c-08de23b3b233
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7696
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

Updates for 6.19.

The following changes since commit 2a084f4ad727244768b919455aa9dc1c04630487:

  Merge tag 'amd-drm-next-6.19-2025-11-07' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-11-11 15:35:49 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.19-2025-11-14

for you to fetch changes up to ccd3b4c7c37fbbd3e5244d3c54ca24ae0a37810d:

  drm/amdgpu: Use amdgpu by default on SI dedicated GPUs (v2) (2025-11-14 11:28:29 -0500)

----------------------------------------------------------------
amd-drm-next-6.19-2025-11-14:

amdgpu:
- RAS updates
- GC12 DCC P2P fix
- Documentation fixes
- Power limit code cleanup
- Userq updates
- VRR fix
- SMART OLED support
- DSC refactor for DCN 3.5
- Replay updates
- DC clockgating updates
- HDCP refactor
- ISP fix
- SMU 13.0.12 updates
- JPEG 5.0.1 fix
- VCE1 support
- Enable DC by default on SI
- Refactor CIK and SI enablement
- Enable amdgpu by default for CI dGPUs
- XGMI fixes
- SR-IOV fixes
- Memory allocation critical path fixes
- Enable amdgpu by default on SI dGPUs

amdkfd:
- Relax checks on save area overallocations
- Fix GPU mappings after prefetch

radeon:
- Refactor CIK and SI enablement

----------------------------------------------------------------
Ahmad Rehman (1):
      drm/amdkfd: Fixing the clang format

Alvin Lee (1):
      drm/amd/display: Only initialize LSDMA if it is supported in DMU

Asad Kamal (6):
      drm/amd/pm: Add NULL check for power limit
      drm/amd/pm: Update pmfw headers for smu_v13_0_12
      drm/amd/pm: Add ppt1 support for smu_v13_0_12
      drm/amd/pm: Expose ppt1 limit for gc_v9_5_0
      drm/amd/pm: Enable ppt1 caps for smu_v13_0_12
      drm/amd/pm: Remove power2_average node

Christian König (2):
      drm/amdgpu: avoid memory allocation in the critical code path v3
      drm/amdgpu: use GFP_ATOMIC instead of NOWAIT in the critical path

Chuntao Tso (1):
      drm/amd/display: To support Replay frame skip mode

Dillon Varone (1):
      drm/amd/display: Fix index bug for fill latency

Dominik Kaszewski (2):
      drm/amd/display: Change lock descriptor values
      drm/amd/display: Revert in_transfer_func_change to MED

Gangliang Xie (1):
      drm/amd/pm: remove unnecessary prints for smu busy

George Shen (1):
      drm/amd/display: Add interface to capture power feature status for debug logging

Harish Kasiviswanathan (1):
      drm/amdkfd: Fix GPU mappings for APU after prefetch

Ian Chen (1):
      drm/amd/display: Add new SMART POWER OLED interfaces

Ivan Lipski (1):
      drm/amd/display: Allow VRR params change if unsynced with the stream

Jesse.Zhang (2):
      drm/amdgpu: fix lock warning in amdgpu_userq_fence_driver_process
      drm/amdgpu: resume MES scheduling after user queue hang detection and recovery

Jiapeng Chong (1):
      drm/amdgpu/userqueue: Remove duplicate amdgpu_reset.h header

Jonathan Kim (1):
      drm/amdkfd: relax checks for over allocation of save area

Leo Chen (1):
      drm/amd/display: dynamically clock gate before and after prefetch

Lijo Lazar (2):
      drm/amdgpu: Check if AID is active before access
      drm/amdgpu: Avoid xgmi register access

Mario Limonciello (AMD) (1):
      drm/amd: Clarify that amdgpu.audio only works for non-DC

Mohit Bawa (1):
      drm/amd/display: refactor DSC cap calculation for dcn35

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: jump to the correct label on failure

Sathishkumar S (1):
      drm/amdgpu/jpeg: Add parse_cs for JPEG5_0_1

Srinivasan Shanmugam (2):
      drm/amd/display: Fix annotations for connector poll/detect parameters
      drm/amd/display: Add kdoc params/returns in dc/link detection helpers

Sultan Alsawaf (1):
      drm/amd/amdgpu: Ensure isp_kernel_buffer_alloc() creates a new BO

Taimur Hassan (2):
      drm/amd/display: [FW Promotion] Release 0.1.35.0
      drm/amd/display: Promote DC to 3.2.358

Tao Zhou (5):
      drm/amdgpu: load RAS bad page from PMFW in page retirement
      drm/amdgpu: get RAS bad page address from MCA address
      drm/amdgpu: try for more times if RAS bad page number is not updated
      drm/amdgpu: add RAS bad page threshold handling for PMFW manages eeprom
      drm/amdgpu: optimize timeout implemention in ras_eeprom_update_record_num

Timur Kristóf (18):
      drm/amdgpu/gmc6: Place gart at low address range
      drm/amdgpu/gart: Add helper to bind VRAM pages (v2)
      drm/amdgpu: Use DC by default on SI dGPUs
      drm/amdgpu/ttm: Use GART helper to map VRAM pages (v2)
      drm/amdgpu/vce: Move firmware load to amdgpu_vce_early_init
      drm/amdgpu/vce: Clear VCPU BO, don't unmap/unreserve (v4)
      drm/amdgpu/vce1: Clean up register definitions
      drm/amdgpu/vce1: Load VCE1 firmware
      drm/amdgpu/vce1: Implement VCE1 IP block (v2)
      drm/amdgpu/vce1: Ensure VCPU BO is in lower 32-bit address space (v3)
      drm/amd/pm/si: Hook up VCE1 to SI DPM
      drm/amdgpu/vce1: Enable VCE1 on Tahiti, Pitcairn, Cape Verde GPUs
      drm/amdgpu/vce1: Workaround PLL timeout on FirePro W9000
      drm/radeon: Refactor how SI and CIK support is determined
      drm/amdgpu: Refactor how SI and CIK support is determined
      drm/amdgpu: Use amdgpu by default on CIK dedicated GPUs
      drm/amdgpu: Use amdgpu by default on CIK dedicated GPUs
      drm/amdgpu: Use amdgpu by default on SI dedicated GPUs (v2)

Vitaly Prosyak (1):
      drm/amdgpu: disable peer-to-peer access for DCC-enabled GC12 VRAM surfaces

Wenjing Liu (2):
      drm/amd/display: add macros to simplify code
      drm/amd/display: Refactor HDCP Status Log Format

Will Aitken (3):
      drm/amdgpu: Refactor sriov xgmi topology filling to common code
      drm/amdgpu: Update headers for sriov xgmi ext peer link support feature flag
      drm/amdgpu: Enable xgmi extended peer links for sriov guest

YiPeng Chai (3):
      drm/amdgpu: Synchronize sriov host to add block_mmsch bit field
      drm/amdgpu: Add lock to serialize sriov command execution
      drm/amdgpu: Fix the issue of missing ras message on sriov host

 drivers/gpu/drm/amd/amdgpu/Kconfig                 |  24 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  15 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 162 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |  36 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |  58 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  72 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            | 147 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            | 174 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   7 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  37 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |   6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |   7 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |  17 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |  22 +-
 drivers/gpu/drm/amd/amdgpu/sid.h                   |  40 -
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c              | 839 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.h              |  32 +
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |   5 +
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |   5 +
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |   5 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  22 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |   2 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  30 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 242 ++++--
 drivers/gpu/drm/amd/display/dc/dc.h                |  28 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   3 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   6 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |   7 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.h   |   5 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   2 +-
 .../gpu/drm/amd/display/dc/dsc/dcn35/dcn35_dsc.c   |  31 +-
 .../drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c |   7 +-
 .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c |  52 +-
 .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.h |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   2 +
 drivers/gpu/drm/amd/display/dc/inc/link_service.h  |   4 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |  23 +
 .../dc/link/protocols/link_edp_panel_control.c     |  17 +-
 .../dc/link/protocols/link_edp_panel_control.h     |   4 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  10 +-
 .../drm/amd/display/modules/freesync/freesync.c    |  11 +
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.c    | 124 +--
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h | 126 ++--
 .../drm/amd/display/modules/power/power_helpers.c  |  30 +
 .../drm/amd/display/modules/power/power_helpers.h  |   5 +
 .../gpu/drm/amd/include/asic_reg/vce/vce_1_0_d.h   |   5 +
 .../drm/amd/include/asic_reg/vce/vce_1_0_sh_mask.h |  10 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  15 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  18 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   5 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_pmfw.h   |   7 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_ppsmc.h  |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |  10 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  83 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |   4 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  10 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |  81 +-
 79 files changed, 2152 insertions(+), 742 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vce_v1_0.h
