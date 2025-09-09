Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC0B5025B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 18:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7789610E7B5;
	Tue,  9 Sep 2025 16:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="j/5ft6V8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C2710E7B3;
 Tue,  9 Sep 2025 16:20:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pX660Og8nVG+r5IErfndCbyf4FULgwAK+bFKVbmCe2d8TygMyMslcpTUSYGG4tn8uQd00ENGDPqC7ZjNZkFdgKpASgDIbxiz+y4V0CL8F534PoQAvLvm6toTQvrjcRQ37DTcS++4bB1O7S+7Q+mAx3xHU2r8ybef9w+q+RtaGAn+pS5eWTrv5c1v0Yy5iXCSZPlU/YKisnK1iw4YK8b8U4DcyAhlQv/eha0d1iWecKREu/zqBicXcR6dNt5WbOU0VoH3SZWLm6I0dMicjrbRFzH1sMkX+7yoQAg96xKSZm4rMVqwNP6PziFcLe2a7A2bkSfFUezrFmkKz4nDOBKN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjgezYsxpo1RlcIPuM9Wou3lJzD63JsfAgViVDZqpYg=;
 b=n8jXcqfJmQGHyRwEJrm7c1ELd/3x7yFUgCJnd+RyahGuKwoQAwX/IZK7Q9pGQEYWvy7LhE69Qa2pSJwEnybHDfS7llJedIfI5pStIvTskxz+Wy0yBiujhWnqHDuG4XIm79nC9EtFSj10yrrIC+mkflX9wZUmmS7M/cLkcTM4QudMJX4ZJ5LQtVIG37a1ewGLg6Tv2sZEcz6iRGelzAvPczOFFUTVXlnmSZO27X2iTDrx8fhZp/gQQXynquqgGibsD5KmViLiQVHNxdd1dIwldWJ7+HGpYq9Lffy5fiCF/+l+ycY2pJO8+Um7J1YGnEhH+XY8L5Rn5MYT/NXX2okObQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjgezYsxpo1RlcIPuM9Wou3lJzD63JsfAgViVDZqpYg=;
 b=j/5ft6V8PPgbhabe3pCxXlSSt08h1ZB56Lpx5bXN+QKOSswJCH4bx58tbiFHJlsBt96X3O9QMmnN1t64oLHUOZYE1ev5MVnewrMk3efkkSO+4B7ZnxYho5FxRRu+25xWdBolm3y1Qh3a7/YWyRMxgNir9wJdBkPzgn8UKuTi46s=
Received: from CH2PR05CA0039.namprd05.prod.outlook.com (2603:10b6:610:38::16)
 by SA5PPFB9BA66B77.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8df) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 16:19:56 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:38:cafe::28) by CH2PR05CA0039.outlook.office365.com
 (2603:10b6:610:38::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.14 via Frontend Transport; Tue,
 9 Sep 2025 16:19:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.0 via Frontend Transport; Tue, 9 Sep 2025 16:19:55 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Sep
 2025 09:19:54 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon, UAPI drm-next-6.18
Date: Tue, 9 Sep 2025 12:19:28 -0400
Message-ID: <20250909161928.942785-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|SA5PPFB9BA66B77:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ccedee-6325-48bf-3440-08ddefbcb69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFV6bHc5UUFxenZSWGNnaXphV0VUZDk4VFhiUXZJdnNYMkFlS2pZS0hMV0Vq?=
 =?utf-8?B?TXR2ZGgwUHhwazIyekdCVXF6R05ITlM1T0ZGZDdxb2s1TElub2hmRi8yVmZm?=
 =?utf-8?B?ekI5OGVHMERjaFBPSE1hU2NjYU1EeGNYci9qV2lRYklNSVgybWhlNFQ0dm56?=
 =?utf-8?B?Z3Mwd0hPV2Z1dVkySmhzNGJTby95TDMyZ0xxa2tkRlE2SXJDNTFRNTVHR3JG?=
 =?utf-8?B?ZVA2OTVkZW4wV2t6VndMWVVCbWRuTE1vVjdmbktuVmdISk9PMWZxQWM2N0Vt?=
 =?utf-8?B?V1VCWHljVU9OclFOTEliZFNnZU5yM3JSdHRQVUxBaEl4VXFqTmFVZ0N4WHYz?=
 =?utf-8?B?eU5JM21NUkpEOUNWYURuY1VlN1dSVzdwMmt1Qy9uVzFzdlVDNURIdXhTL0Zj?=
 =?utf-8?B?eGo4b3pUa1YrSzA4WDZTSHhXZS8xZGlGUWhrWnZaa2lUTzJDM3FFVDdzUUNV?=
 =?utf-8?B?Qm9PZ2dad3NRRzAwTjByMWVMaXN0cG9UZlZQVjlZVXFUWlkwZmpvOHNJd1VW?=
 =?utf-8?B?SFRoWGR0VjRoMXFoSE1CMWc2M3ZFMUorTldGeDVlQ3ZIZ014Q2JmNmRyYTJ5?=
 =?utf-8?B?RzJ1UFVrQVFBT3hvQ1lyRmR0aGMvNW94YzlGR3N2TjR3TWdEY1dHd0h3a2pv?=
 =?utf-8?B?YmpuUklsWTd0ZkNpODc1Wkg2M2RvR1R2SExmUGhhSDNwakZzLytWOEREQUFC?=
 =?utf-8?B?aXJOUHJLSGZ6WGNPNncvVDdJQy9SbnJXT29qUk9iNFQxNXB6RFVTUWtSaXIx?=
 =?utf-8?B?d0R3aktjc0hjU3QwRjNWUGVEMUx5d1BYL0lRRUhLdXgrbXcxd1o3TEZqN3JN?=
 =?utf-8?B?L25mUXJNaXpqNGdkVGxaZk15a0J3SjdZNFAxS29hazdDdkQ5SXV5K09EdUNs?=
 =?utf-8?B?TWxtMGRnL0NLekZvMCtTdVRjemcwNEg1L1dJUUl3RThCUXdSQ1pYc2ZwbGov?=
 =?utf-8?B?RDUxY2F5MHpObGhjc1FvNEtya3B0Ky9WVzBma1FJL1llaGRFOGxBUTA3cjVB?=
 =?utf-8?B?NlBNWWhTNnRNdkJDM1BhU042TmdxKzE0WWJLTXlob3Y3TkFzSTZuaEFNVzJi?=
 =?utf-8?B?SldnYVlMY0Q1UzhDRDJ1MDY0K1hCMWR2WTRZV2IzOUc1cmt0dTR3Q3pRQlNn?=
 =?utf-8?B?VjZyYnNVSWdFUUE0Yk0rVE5LTVJnZUk3Z0ZtM0g0TENwSS9sMEFHZy9lOGtV?=
 =?utf-8?B?T0Q1a2VucDR3R0FSMDdNU1dPamljWFcvbTI3QXpHTmNTZGczMVFkNlFveTFz?=
 =?utf-8?B?Z3FIYnhyd0o4b2dWSXdManlDekFhYTVJUXNUMkN0S1VOVEd0TTBaM2gwM1FY?=
 =?utf-8?B?QVRhSGxlUEFFWFFTN3FzakROcVc4SW53ei9DOHhwZUtqbmw3NlNUbDF2YW94?=
 =?utf-8?B?R1FzUzZmU2wyeFI0b2wrM2s1N2hzZ3VJbTQ3Z1dRNkUzUG4wMFdLZUcyUE90?=
 =?utf-8?B?Z1REMlROSWhmbldPdzRMclZCZitiNWNUbkdidVh1aTl4ZEJUQ2kvT09hZWgr?=
 =?utf-8?B?N1NycHN2ZmFhMGJXMTlmaHpvYlhhdXpYamNqWlZNY0ludEJRZEVaclVGbGlu?=
 =?utf-8?B?WTQySXA3b2VZSDcyYkY2bmxzVjBwTkQ1NFF4VTE0ZlFTQWsyUmt6QXIyMnNz?=
 =?utf-8?B?bHQ0MnUvUlFtWm1acGhRU0FHY0ZucnlZRWRzUlQyak5Tdk41QUlUKy9nb0NC?=
 =?utf-8?B?K010YkgxbGV3djBLQ2tiNU1ZbG4rMytTZzV6a3BsUTZYMTNvYWdwQmJlRFha?=
 =?utf-8?B?d0ozckdoY1RKb2tEREhQamtOY1dnZmUrSy82cU00L3RJUVQ0ME1pS3dqZ0p4?=
 =?utf-8?B?cE9tYmxWMjA3MEJYMUVlNW5NNTBTQnNrWU05Zk8wS3IwRTdlU1F1ZlMzSmIy?=
 =?utf-8?B?NHNubFdxVVI0L0JJUmQxMVlBbFV4aEhtZk9uMWpUMXdCekEwYkNjRlRwRVd3?=
 =?utf-8?Q?Sbvis/fHsxE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 16:19:55.2637 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ccedee-6325-48bf-3440-08ddefbcb69e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB9BA66B77
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

More updates for 6.18.

The following changes since commit 4bf83dd6e3b3b2a131e357f035b17edaee6f6766:

  Merge tag 'drm-intel-gt-next-2025-09-01' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2025-09-02 11:23:39 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.18-2025-09-09

for you to fetch changes up to 2fd653b9bb5aacec5d4c421ab290905898fe85a2:

  drm/amd/display: Drop dm_prepare_suspend() and dm_complete() (2025-09-05 17:38:42 -0400)

----------------------------------------------------------------
amd-drm-next-6.18-2025-09-09:

amdgpu:
- Add CRIU support for gem objects
- SI UVD fix
- SI DPM fixes
- Misc code cleanups
- RAS updates
- GPUVM debugfs fixes
- Cyan Skillfish updates
- UserQ updates
- OEM i2c fix
- SMU 13.0.x updates
- DPCD probe quirk fix
- Make vbios build number available in sysfs
- HDCP updates
- Brightness curve fixes
- eDP updates
- Vblank fixes
- DCN 3.5 PG fix
- PBN calcution fix

amdkfd:
- Add CRIU support for gem objects
- Flexible array fix
- P2P topology fix
- APU memlimit fixes
- Misc code cleanups

UAPI:
- Add CRIU support for gem objects
  Proposed userspace: https://github.com/checkpoint-restore/criu/pull/2613

radeon:
- Use dev_warn_once() in CS parsers

----------------------------------------------------------------
Alex Deucher (8):
      drm/amd: add more cyan skillfish PCI ids
      drm/amdgpu: add user queue reset source
      drm/amdgpu/userq: add force completion helpers
      drm/amdgpu: add ip offset support for cyan skillfish
      drm/amdgpu: add support for cyan skillfish without IP discovery
      drm/amdgpu: add support for cyan skillfish gpu_info
      drm/amdgpu: don't enable SMU on cyan skillfish
      drm/radeon: use dev_warn_once() in CS parsers

Allen Li (1):
      drm/amd/display: Read DPCD to obtain eDP capability information.

Ausef Yousof (1):
      drm/amd/display: dont wait for pipe update during medupdate/highirq

Colin Ian King (2):
      drm/amd/amdgpu: Fix missing error return on kzalloc failure
      drm/amd/amdgpu: Fix a less than zero check on a uint32_t struct field

Cruise Hung (1):
      drm/amd/display: Add link index in AUX and dpms

Dan Carpenter (1):
      drm/amdgpu: Fix error codes if copy_to_user() fails

David Francis (4):
      drm/amdgpu: Allow more flags to be set on gem create.
      drm/amdgpu: Add ioctl to get all gem handles for a process
      drm/amdgpu: Add mapping info option for GEM_OP ioctl
      drm/amdgpu: Allow kfd CRIU with no buffer objects

Eric Huang (1):
      drm/amdkfd: fix p2p links bug in topology

Fangzhi Zuo (2):
      drm/amd/display: Disable DPCD Probe Quirk
      drm/amd/display: Fix pbn_div Calculation Error

Geoffrey McRae (1):
      drm/amd/display: remove oem i2c adapter on finish

Gustavo A. R. Silva (1):
      drm/amdgpu/amdkfd: Avoid a couple hundred -Wflex-array-member-not-at-end warnings

Jesse.Zhang (6):
      drm/amdgpu: Add preempt and restore callbacks to userq funcs
      drm/amd/amdgpu: Implement MES suspend/resume gang functionality for v12
      drm/amdgpu/mes: add front end for detect and reset hung queue
      drm/amdgpu/mes11: implement detect and reset callback
      drm/amdgpu/mes12: implement detect and reset callback
      drm/amdgpu/userq: add a detect and reset callback

Liao Yuanhong (14):
      drm/amdgpu/amdgpu_cper: Remove redundant ternary operators
      drm/amdgpu/gfx: Remove redundant ternary operators
      drm/amdgpu/gmc: Remove redundant ternary operators
      drm/amdgpu/ih: Remove redundant ternary operators
      drm/amdgpu/jpeg: Remove redundant ternary operators
      drm/amdgpu/vcn: Remove redundant ternary operators
      drm/amd/display: Remove redundant ternary operators
      amdgpu/pm/legacy: remove redundant ternary operators
      drm/amd/pm/powerplay/hwmgr/ppatomctrl: Remove redundant ternary operators
      drm/amd/pm/powerplay/smumgr: remove redundant ternary operators
      drm/radeon/atom: Remove redundant ternary operators
      drm/radeon/dpm: Remove redundant ternary operators
      drm/radeon/radeon_legacy_encoders: Remove redundant ternary operators
      drm/radeon/pm: Remove redundant ternary operators

Lijo Lazar (2):
      drm/amd/pm: Add caching for SystemMetrics table
      drm/amdgpu: Add vbios build number interface

Mario Limonciello (1):
      drm/amd/display: Indicate when custom brightness curves are in use

Mario Limonciello (AMD) (1):
      drm/amd/display: Drop dm_prepare_suspend() and dm_complete()

Oleh Kuzhylnyi (1):
      drm/amd/display: Add HDCP policy control

Ovidiu Bunea (1):
      drm/amd/display: Correct sequences and delays for DCN35 PG & RCG

Qianfeng Rong (3):
      drm/radeon/ci_dpm: Use int type to store negative error codes
      drm/amdkfd: Fix error code sign for EINVAL in svm_ioctl()
      drm/amd/pm: use int type to store negative error codes

Roman Li (1):
      drm/amd/display: Refine error message for vblank init failure

Srinivasan Shanmugam (2):
      drm/amdgpu: Fix function header names in amdgpu_connectors.c
      drm/amdgpu: Correct misnamed function in amdgpu_gem.c

Sunil Khatri (3):
      drm/amdgpu: add more information in debugfs to pagetable dump
      drm/amdgpu: fix the formating for debugfs print
      drm/amdgpu: print root PD address in PDE format instead of GPU

Taimur Hassan (1):
      drm/amd/display: Promote DC to 3.2.349

Timur Kristóf (10):
      drm/amdgpu: Power up UVD 3 for FW validation (v2)
      drm/amd/pm: Disable ULV even if unsupported (v3)
      drm/amd/pm: Increase SMC timeout on SI and warn (v3)
      drm/amd/pm: Fix si_upload_smc_data (v3)
      drm/amd/pm: Adjust si_upload_smc_data register programming (v3)
      drm/amd/pm: Treat zero vblank time as too short in si_dpm (v3)
      drm/amd/pm: Disable MCLK switching with non-DC at 120 Hz+ (v2)
      drm/amd/pm: Disable SCLK switching on Oland with high pixel clocks (v3)
      drm/amd/pm: Remove wm_low and wm_high fields from amdgpu_crtc (v2)
      drm/amd/pm: Print VCE clocks too in si_dpm (v3)

Wenjing Liu (1):
      drm/amd/display: Update dchubbub.h for hubbub perfmon support

Xiang Liu (1):
      drm/amdgpu: Correct info field of bad page threshold exceed CPER

Yang Wang (1):
      drm/amd/pm: refine amdgpu pm sysfs node error code

Yifan Zhang (1):
      amd/amdkfd: correct mem limit calculation for small APUs

 drivers/gpu/drm/amd/amdgpu/Makefile                |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |  33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            | 179 ++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h            |  16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  65 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |  21 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |  42 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h    |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   5 +
 drivers/gpu/drm/amd/amdgpu/atom.c                  |  22 +
 drivers/gpu/drm/amd/amdgpu/atom.h                  |   2 +
 .../gpu/drm/amd/amdgpu/cyan_skillfish_reg_init.c   |  56 +++
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   1 -
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |   3 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |   3 +-
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |   3 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |  49 ++
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  31 ++
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  69 ++-
 drivers/gpu/drm/amd/amdgpu/nv.h                    |   1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |  29 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  43 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   2 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  14 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   1 +
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |  74 +--
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |  17 +-
 .../amd/display/dc/dio/dcn10/dcn10_link_encoder.c  |   2 +-
 .../dc/dio/dcn35/dcn35_dio_stream_encoder.c        |   2 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   2 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 115 +----
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |   3 -
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |   3 -
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |  22 +
 drivers/gpu/drm/amd/display/dc/inc/hw/pg_cntl.h    |   1 +
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |   3 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   9 +-
 .../display/dc/link/protocols/link_dp_capability.c |   6 +
 .../drm/amd/display/dc/pg/dcn35/dcn35_pg_cntl.c    |  78 +--
 .../drm/amd/display/modules/freesync/freesync.c    |   4 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    |   5 +-
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |   1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c       |   7 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   5 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     |   3 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  93 ++--
 drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c         |  26 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c    |   4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |   2 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c  |   5 +-
 .../drm/amd/pm/powerplay/smumgr/iceland_smumgr.c   |   5 +-
 .../drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c |   5 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c  |   2 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   1 +
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |  43 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   4 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |   1 +
 drivers/gpu/drm/radeon/atombios_encoders.c         |   2 +-
 drivers/gpu/drm/radeon/ci_dpm.c                    |  14 +-
 drivers/gpu/drm/radeon/evergreen_cs.c              | 523 +++++++++++----------
 drivers/gpu/drm/radeon/ni_dpm.c                    |   2 +-
 drivers/gpu/drm/radeon/r100.c                      | 215 ++++-----
 drivers/gpu/drm/radeon/r200.c                      |  34 +-
 drivers/gpu/drm/radeon/r300.c                      |  66 +--
 drivers/gpu/drm/radeon/r600_cs.c                   | 445 +++++++++---------
 drivers/gpu/drm/radeon/radeon_cs.c                 |   2 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |  20 +-
 drivers/gpu/drm/radeon/radeon_pm.c                 |   3 +-
 include/uapi/drm/amdgpu_drm.h                      |  55 ++-
 106 files changed, 1810 insertions(+), 1027 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/cyan_skillfish_reg_init.c
