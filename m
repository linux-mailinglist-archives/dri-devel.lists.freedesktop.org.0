Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088D4D0053D
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 23:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AB710E65E;
	Wed,  7 Jan 2026 22:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Lt2EnnOk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013059.outbound.protection.outlook.com
 [40.93.201.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8678D10E65D;
 Wed,  7 Jan 2026 22:33:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaQUG544pP/WdhDUB1S92YPzkxWRhU5iAyGhKrZNcesScaChX5x2Pt1S/PG9xXN0fNeEz84I7s7P3OacazsPoGJhq36uUV9zj0BKfL0GnkzAG6izAj1w2vfqiBOWAzH/iEQM6nlIrqgwncOL5eTYMd9EtZhg6Q49jwOLGeBcLp8cHeOQh5ijxcWa0+DFRfz3fzsm15W0ZBWnkrDY/aJI6a3533ZtzdVm++4tASVUT4dbpaihUVgog8PB+2TZuoNT1dRnPkFf4xbnqapONPepUIJ5k7K/awrkLPTak4VHWsd6dQ7r1eJDMrQDWzor+HJVhtPF/B1SmNyxc+fzQjqxSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eRRtLJtRGVTetIth15OfpjAsFhevj7qj4j101LB4IQ=;
 b=Jn3xtcRec0/a2JMy4iouuoe3HFKD1gc1siAzG3TcPF1ymgMyYMvjR9Wpd0UTxHAIKbPQRC5vazB/N5lgV6OK/jiAQj7SHn90cL43TqPARkrWVh2BxMIrOZ/TwNxx43PbobzhvrEJNYHqRYgw3kClfFIGG6yDS2qXgxtL+wYji82dWPdJdQwyuosJg3ZDKv8tg3r0VvpkbSffZl6v4mpUe4Vjpqw8ZLVBQasUMCdqSJJENBkSeEeVKU8mcLIXhvxv2lgISzLS76ItvY2LBpxbXZNJ9x/dz/Eay649mR1TnRCpQoW7OzYxkfBWcwc0DqwUONYNyakw9TPNyI5xNuHwVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eRRtLJtRGVTetIth15OfpjAsFhevj7qj4j101LB4IQ=;
 b=Lt2EnnOkjpuT9yzwQR0YLSDD7/EstD+lwYqV/JAFoTuoai+eShL7C5Y5tOxPDRli2rRO+1sf+xBHohR+RXbJbsTpbflcSRtWEtudfens+ICq88HRYljkmvuNrqmjdkT3dI4OecI4VgDhSpMaNJfe12kAj7MCNyB/Pb3k8HNxbBk=
Received: from BYAPR11CA0064.namprd11.prod.outlook.com (2603:10b6:a03:80::41)
 by DS5PPF18A985A10.namprd12.prod.outlook.com (2603:10b6:f:fc00::645)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 22:33:25 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:80:cafe::3d) by BYAPR11CA0064.outlook.office365.com
 (2603:10b6:a03:80::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 22:33:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 22:33:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 7 Jan
 2026 16:33:23 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Jan
 2026 16:33:23 -0600
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 7 Jan 2026 14:33:22 -0800
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, radeon drm-fixes-6.19
Date: Wed, 7 Jan 2026 17:33:14 -0500
Message-ID: <20260107223315.16095-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: alexander.deucher@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|DS5PPF18A985A10:EE_
X-MS-Office365-Filtering-Correlation-Id: 21118a31-27f3-445c-5428-08de4e3cc50e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|30052699003|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3hSQUdWaTlNSXZ4ckF5Ti9lQXdWTENDa3lJSkRqZ2RzUE9xV1N3TUNPakdY?=
 =?utf-8?B?cWVXSlBscWNGUktyRWp1TWNWeFB3UHZGVnZzWC9Fa2RoaEpJMGZUMlp6c2Vu?=
 =?utf-8?B?U2Mvb0svV0xZOEYxeVR3bE1QNzNPK2gzSVFlL2l6VjJkOEVRU1haOTlKNUZU?=
 =?utf-8?B?TVBUUXQzL3hXVlRaU09Mb1NaN243U3FUa3ZhTVdlM0lvUnRrZjJpek9IVFQx?=
 =?utf-8?B?cFFiQVpSdVdCZHBvbmhFVWVJNGZ3OE4vUmo1STM1Q2s4d3BjckZsTGhhekk2?=
 =?utf-8?B?SDJxN2s2RGhNaVkzSi9SeWtsNVMyS1NxQXR4U0lMczNOVXd1bCtISVpIdTlG?=
 =?utf-8?B?Zm9odzM1eUgvKzVwRGNjUWxlSW9UcXdsQWo4bmU0Qkp0STJrYkdWTlo2eUs2?=
 =?utf-8?B?Vi9Kc2ZPZVJ0Z2Q5SGQ5QUp3WGxERHU2T2ZTYmYxVWkreUNSY3BzTXFmRlRv?=
 =?utf-8?B?c0xMQis5Mmh2VDl3bFYyMFZLYU9wa0hPUjQrSGx0Z1pLalUrcXhEZkpWOHp3?=
 =?utf-8?B?T3J4L2VpRURPVWhmd2x2cEFjWkdMTTNBc2dEOVVQVW5qNHZDRjE3TjNjVzJY?=
 =?utf-8?B?dUFpRUJLKzdNMXl2U3BvYTF3WWJlZmV3Ymp3Um5YRlB5ZnN0N3AwV2FzdFNV?=
 =?utf-8?B?WGluc3hwSkhUZEY1c3ZBK0l4ZkQwa010ZHQrU0Q5emh6VjE4bmEvTTVBWVN6?=
 =?utf-8?B?Z3E3emJxQnhJNlpFVGdmNkRya0ZBeklGU3g2azl1R1FCNk02dXlva3dvbENn?=
 =?utf-8?B?TEluYldOTStZRVpHNnJqVWlMSHRPZWtQUXF1L0dTTkJZOWFCWmlHdFZkR08x?=
 =?utf-8?B?QTltWEEvblRHMlpZSklETDJTZUZNalZtZGVFYXliOFZnVjdGMmVCTkorRCsy?=
 =?utf-8?B?Sm5yNGs3UEJFZk9aVkdIUU02MTNLNExacEFpUENQYUJtNEJhY3pjMWJkSHg4?=
 =?utf-8?B?KzFqY3RBVEFaWE0ycVNCYUFEc2hQQmUyQkdndloyYU1IU2JVbHNjREsyVitx?=
 =?utf-8?B?dkQ4bWllL3UxeS80UGdiRFM1amVMdkxsaG5EbFY0UlVuRjl6ekxRUjEvV2g4?=
 =?utf-8?B?Y3Bma2Z5NHhYRStaSDVLTkR3SGRjbGRNbTBPU3ZrMjd6ZzJYazE1UmYrbXpl?=
 =?utf-8?B?MzFkeUtZc1NETDVuUVYrc3l2NStTOHJXMTJVRHhVMGowc044Qi9hcHpVMmFo?=
 =?utf-8?B?dGlSMHZSaytYbGRmb1lRS25rbnBWRHFjd1pqYWMweHFRVDBKRldJeGRNSzNE?=
 =?utf-8?B?SHllU3hBTm9nQm0vN2FGb3FiSU43cTlBUGljd25Da3c3dnpsSU0vNEFyekd3?=
 =?utf-8?B?QWVQT0NFRy91czJSYkpCOC83RzdYSkdvUTVEQUE5RVdwVWZnL0lyUkRKYVJt?=
 =?utf-8?B?SkovSVRIdGduVEJNVEc5aHdCMnphNHBzSkZ5NmtwM3FITTlnUWU3Mktqdk1G?=
 =?utf-8?B?MUd5blFTMy95bFRYclNqMVQ3SGlWd0F5U2kydE5xZDZvOUh1QmF4VHArdVBt?=
 =?utf-8?B?U2dvV2RNcEw3WUUvVmFLTmRWS3EwZDNRTTh5VERuMVVvT0krYW1aU2p1eXVR?=
 =?utf-8?B?dTUrejA4S0FId0F4aE10TUlybkYvRzFiajY3YllQeHZxQ2VQVVhJRnI5RFAw?=
 =?utf-8?B?eWRmMCtUUk9NSEVIRzJSRXkwYzM0NWZ3cjR3TkdMNkNhRC9mcUdSUDJ3VWhj?=
 =?utf-8?B?TjJGZElsMFA2Z1JTU0pwUHFYUEhkaEtXSE9SN1V6a0xxOU5sMTJtTHpoN05C?=
 =?utf-8?B?Q0p4U3BqVHFwVGdLU2VvNVRJYUZoZmlSOFlXV3ZsanBpTkFzaUh2ellsbGlv?=
 =?utf-8?B?dnpSN0htNUFpcC9YbEZXN0VXUWlaQkVGMk1FWU5WcmFSeFZHTXpMZms0Y3po?=
 =?utf-8?B?L1dDNG5SVVRrRFlWTTV4aUVPdXhKWVJUaFJhVzN4VnhPbVdHM2VrdE81MU5n?=
 =?utf-8?B?eHBKdTNLZnJhMnJORDhwaERPNUpHNHhBcXNsMUdBSU9lM3VkMUxPYjZUTVRY?=
 =?utf-8?B?Zm8ycElpcXEwVE90RjlNQ3VBR01seUtQMzRjdG5FMHZuSnh5RGYyTjcrclNU?=
 =?utf-8?Q?mjvBHc?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(30052699003)(1800799024)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 22:33:24.2876 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21118a31-27f3-445c-5428-08de4e3cc50e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF18A985A10
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

Happy New Year!  Fixes for 6.19.

The following changes since commit c4f2ae53863de2b5d125c3cdc9ff12668868a74a:

  Merge tag 'drm-rust-fixes-2025-12-29' of https://gitlab.freedesktop.org/drm/rust/kernel into drm-fixes (2026-01-05 14:45:33 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.19-2026-01-06

for you to fetch changes up to 6b2989ac5e8c496c1814d7961bee6f2d05382b3e:

  Reapply "Revert "drm/amd: Skip power ungate during suspend for VPE"" (2026-01-07 17:24:16 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.19-2026-01-06:

amdgpu:
- Clang fixes
- Navi1x PCIe DPM fixes
- Ring reset fixes
- ISP suspend fix
- Analog DC fixes
- VPE fixes
- Mode1 reset fix

radeon:
- Variable sized array fix

----------------------------------------------------------------
Alan Liu (1):
      drm/amdgpu: Fix query for VPE block_type and ip_count

Alex Deucher (3):
      drm/radeon: Remove __counted_by from ClockInfoArray.clockInfo[]
      drm/amdgpu: don't reemit ring contents more than once
      drm/amdgpu: always backup and reemit fences

Alex Hung (1):
      drm/amd/display: Check NULL before calling dac_load_detection

Mario Limonciello (AMD) (1):
      Reapply "Revert "drm/amd: Skip power ungate during suspend for VPE""

Nathan Chancellor (3):
      drm/amd/display: Apply e4479aecf658 to dml
      drm/amd/display: Reduce number of arguments of dcn30's CalculatePrefetchSchedule()
      drm/amd/display: Reduce number of arguments of dcn30's CalculateWatermarksAndDRAMSpeedChangeSupport()

Perry Yuan (1):
      drm/amd/pm: Disable MMIO access during SMU Mode 1 reset

Pratap Nirujogi (1):
      drm/amd/amdgpu: Fix SMU warning during isp suspend-resume

Timur Kristóf (2):
      drm/amd/display: Correct color depth for SelectCRTC_Source
      drm/amd/display: Add missing encoder setup to DACnEncoderControl

Yang Wang (2):
      drm/amd/pm: fix wrong pcie parameter on navi1x
      drm/amd/pm: force send pcie parmater on navi1x

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c            |  24 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   7 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            |  41 ++
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |   4 +-
 .../gpu/drm/amd/display/dc/bios/command_table.c    |  44 +-
 .../gpu/drm/amd/display/dc/bios/command_table.h    |   4 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   6 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c | 545 ++++++---------------
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  28 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   6 +-
 .../drm/amd/display/include/bios_parser_types.h    |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  33 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   7 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   9 +-
 drivers/gpu/drm/radeon/pptable.h                   |   2 +-
 19 files changed, 332 insertions(+), 480 deletions(-)
