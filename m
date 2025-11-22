Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83816C7C007
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 01:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5FF10E91D;
	Sat, 22 Nov 2025 00:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XilVeMLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010025.outbound.protection.outlook.com [52.101.46.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E0C10E0AC;
 Sat, 22 Nov 2025 00:20:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbTGxJbqCq7C4zEicrX9oa+6egD3fAfTvVwRlbK75UYg63PAZm4M1t454Th7vbndxtpYr69niTPLX5VhZcHwmrcEAKlrXIKzWqEStcNz7rghmIAWzDAm7BEzg2OuHKn3CYNX0AiOw6jKYRn/ijoIaO8d4YuvxlFJeMvX1Q/5y7T/0wd+KcJATVoenCtY2hO62sVBz5q5n35Gxpr5bN0c7/hd00+mvZXy+ZIRDXA/AutuzNtJgn4AR9OlsXuyANEJ8K8q1+hu+ZAoO/cjDoS5GmG4NfEbgykQT2gn8XwzlFfxzYNIzJhFborkCVk8n+7/3fjCCs/ofiliX+b3ogLo+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVmRWFChrYm58ohHiMvyXVbTdBXZTuvYh8Ilqs+8jPI=;
 b=iC3LaJ3sQpKIT8x5BTH92iLcOZmNvUJ/bCagoFmkC68b1Tu4aNb4SC8BMUH9ifva+Ab1DAczRGCaeqCbtzSQ8OEb9CfklyZirXA+wxfVeqQavKXCvCTAH/9kFQzsEJj37+CO8Gdo/VLzWZNkBIAVGOEPq+l8BwxRzv1gkjNxJ0pYAVQ+OCg88P6MC31MN0KZmzZc7j0ENm445wzCv10tcp3g65McykTCOfvZ80wh/AKkpsKOP7McD6qwy/cFkmtc25IzMyXZFcj7Vijf2yM6sJT5lhDsYyL6w7pYaSziVgyjDDdU7AEv6Ryg5w0Eb+9ks771SoVqPSr9i9+zB1lqKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVmRWFChrYm58ohHiMvyXVbTdBXZTuvYh8Ilqs+8jPI=;
 b=XilVeMLYihhJvBckuUslfZNg5kJLkYJNMd+oMj2h3GFLWvp1UdxhFMOtaJe83EYQMDGURlyc1yhms6Sp+P1KvU1gmzUHiNm1oLSj5BB9POKBh5QlBDm4UH1x+QzGaCIPN2nEI9GoXALQT+TYP+U7K/QZANvOLTUEZemdsXnIFEU=
Received: from BN9PR03CA0134.namprd03.prod.outlook.com (2603:10b6:408:fe::19)
 by MW4PR12MB7430.namprd12.prod.outlook.com (2603:10b6:303:224::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Sat, 22 Nov
 2025 00:20:22 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:fe:cafe::11) by BN9PR03CA0134.outlook.office365.com
 (2603:10b6:408:fe::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Sat,
 22 Nov 2025 00:20:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Sat, 22 Nov 2025 00:20:21 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 21 Nov
 2025 16:20:20 -0800
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, radeon drm-next-6.19
Date: Fri, 21 Nov 2025 19:19:56 -0500
Message-ID: <20251122001957.5688-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|MW4PR12MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: 17e2d0ba-4403-44ac-73de-08de295cec9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akFUSmxkYzNzOGVTRHhNa0JzV3pubGFuRUlzTW9Ic2NqTjlmaHJ2Sy93ekdl?=
 =?utf-8?B?ZXl6ZHE2TnlqYW53cEVtMGsxb0FlUlljUUdVNis5NFFXdWFURkdBT1kvY0xJ?=
 =?utf-8?B?Tm9PV2s5NldyUW5tUkF0eHRRR0hCS2pwSEtlcmhNSzQ5NHlYRGU1YUpNejVI?=
 =?utf-8?B?cFJlaWpKOXBxdjJxbEg0L24wSUdmY2JZMk9HdUR0MzdXSW9XOHVFc0YyREFN?=
 =?utf-8?B?TjhLemVhL2xrR1FIcm9ia2FDWW5kMnpkdG02NTFra01ueEt5Zit3eU9KaVNT?=
 =?utf-8?B?U1J0b0Q4UzNwTGJIMTVmSWFtWEpaZWxyNEI3d2tUclJZVk9YODlpS0pMK3Y0?=
 =?utf-8?B?c2NpMVB6bXVWU1FGdzhLbXBCbkxyYTRTNit4aHhGbzZEN0FrN0VwZkdaaXJr?=
 =?utf-8?B?Q2J1dzBsa2VNYmtzemtPbHlKZGtPeEwvei9qUzQ2emxNb0N6djFUQWN2azha?=
 =?utf-8?B?M0gzNUpkV3o4MGl3a2pwOGpPV29heXlkV0xEUWZML3U2V0dGb0pBVkgyOHdV?=
 =?utf-8?B?Njlzb05wS2dTVXQ2VlFIKzN6SUUrZEJRcGFpSkw5aVFjZUxGajZBTjFHdHRJ?=
 =?utf-8?B?VG1Lc29ZRWdYSGR2MVBjMFAybkh0c2RLRzEvTllzWVlvY21uYk5vblczQlBH?=
 =?utf-8?B?RU1TKzVwRG9MZFNKYTNqb0hKUzhhNHh6NVB3am85SVdXbnlWU1lwOTlkeXFw?=
 =?utf-8?B?OVBZM1ZKdnV4VVF1L2lzYkVnR3lpM01PM3FycVRDMmp3VHVpSkZtRE5SeFRH?=
 =?utf-8?B?SllTb2FtZnVrd2tkTDgwbjZKRDlOdy9XcHQvb0RxcmFiKzdwVUs0QXJJUHZO?=
 =?utf-8?B?c1JMdDlMYW1McDFQRFRTajBZNktZaHpwSGw3aWswK0xpYmF1V05tSWs4am1J?=
 =?utf-8?B?VmlhN09GbzlMalgwMEZvMllkSG13dVl6NU11bEl2emtVZW11RHZ4U0pDd0NF?=
 =?utf-8?B?WDNLdWNCVm02YTRUQ0ppaUdRK1pQMVhQNzc2cjRxUXI5RTVCbEtBd1l3UzBT?=
 =?utf-8?B?ZEJZRjYzWkZ2M2hRMXRyUVBxSW4zU1lnUHhoRW5vdk9uRU90T3d1a2pDcy96?=
 =?utf-8?B?S2VhRXBpcXlRMTNGdmo4U0M4RjRRQ1EwZ2x0MUZ1eU9oQzUrVW80VTU0TWZX?=
 =?utf-8?B?eGtBSnBUSSt3NFh6MVFkR1NjRnR5Z0wwc2YzUnNBQ1JuMlE5WEwxR05pcUt0?=
 =?utf-8?B?QXdrVHMwWW9kajNXL3hxUjUxRGhxTWd6SHlVQjd1aWJxcWNUSXM2WWtlUG9i?=
 =?utf-8?B?K2pvRTgrS0JlZndzMFcrVDU4YnVhbUZrZTg1MHd3RE5ZU21ZRE9BelhrUjIy?=
 =?utf-8?B?TUxPQkJTMFV1VTZJWmtsODM4OHRURWZIdCs2dys2VWRkY01mcWc1ZVFiRm5n?=
 =?utf-8?B?NXIwOFkxQUt1RUNWV2FoZXBwcTBsZll6M2psWEVqekkvSVUrZXFGZHhxYWlD?=
 =?utf-8?B?d2xnS0Zjb1dBNjFJeVlCdTh6WEYwSUR4MWZLSEEwUXB2bmdFRmFzTW9vcjdu?=
 =?utf-8?B?ZXJqbklvbHRPenBrSGhKK3N4dEFocElTdVF4VEFmZFVuSkt3TXhMVXZKakpR?=
 =?utf-8?B?dG5DOTZhbndxMkZ0WjdUbEVsUlVTVTRhSU5EVjRzcFNFc0hZOG5QMjFFdXNB?=
 =?utf-8?B?Zm4xTWo4TjAyczZ5OWlhald2dk8vajJ2V2dKK2UvTTFic0tVQWtiT2Z4VGJl?=
 =?utf-8?B?VE56a0I1NmpkdVNjVjhWNnBiWXZKZnRQUUdyVG51U2RsK0ZlZnE3aGU0YTZX?=
 =?utf-8?B?Sm12TW50dmsyTXhFVDh0WkJiYlVuUnpkYUR5Nk16akRtMGIvWXU1ZlBwbHpW?=
 =?utf-8?B?OG1JdUFjQ2JEWm80MEJrYmdmNTh1UnM4Wko4aDRYV25YemRCaS90NVhXbHky?=
 =?utf-8?B?YzJHRTBuNW1wekEzRzFleXgzS1RmdjlrdXIrMWtCVjVDdmdvalRZWTdoSXhI?=
 =?utf-8?B?NWVCeEYxL0tCeGY3c0RETzJ5VHY2N1ZsaHk4R1BjL05qaFFkSVRTVDBibmJF?=
 =?utf-8?Q?2uvQUKVjPbPNhGJ7x7D7nFNK8kOc+Y=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 00:20:21.6230 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e2d0ba-4403-44ac-73de-08de295cec9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7430
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

Fixes for 6.19.  The tree still contains the ABM KMS property.  Let me
know how you want to proceed with that.  I can send a follow up PR with that
reverted if needed.

The following changes since commit f3a1d69f9b388271986f4efe1fd775df15b443c1:

  Merge tag 'amd-drm-next-6.19-2025-11-14' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-11-18 07:01:26 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.19-2025-11-21

for you to fetch changes up to ee9b603ad43f9870eb75184f9fb0a84f8c3cc852:

  drm/amdgpu: Add sriov vf check for VCN per queue reset support. (2025-11-19 17:34:16 -0500)

----------------------------------------------------------------
amd-drm-next-6.19-2025-11-21:

amdgpu:
- DC state dumping fixes
- Panel replay improvements
- Seamless boot fixes
- EDID fetching improvements
- HDMI HPD filtering fix
- Misc display fixes
- Audio fix
- DP MST fix
- RAS fix
- Documentation fixes
- DC analog cleanups
- VPE fix
- GC 11 fix
- PRT fix
- MMIO remap fix
- SR-IOV fix

radeon:
- Fence deadlock fix

----------------------------------------------------------------
Charlene Liu (2):
      drm/amd/display: Add null pointer check in link_dpms
      drm/amd/display: Check DCCG_AUDIO_DTO2 register mask exist

Fangzhi Zuo (1):
      drm/amd/display: Fix pbn to kbps Conversion

George Shen (1):
      drm/amd/display: Add interface to capture expected HW state from SW state

Ivan Lipski (2):
      drm/amd/display: Add an HPD filter for HDMI
      drm/amd/display: Clear the CUR_ENABLE register on DCN20 on DPP5

Jack Chang (3):
      drm/amd/display: Add panel replay capability detection
      drm/amd/display: Add panel replay enablement option and logic
      drm/amd/display: Get panel replay capability from DPCD

Lijo Lazar (1):
      drm/amdgpu: Unregister mce notifier

Mario Limonciello (1):
      drm/amd: Skip power ungate during suspend for VPE

Mario Limonciello (AMD) (2):
      drm/amd/display: Move sleep into each retry for retrieve_link_cap()
      drm/amd/display: Increase DPCD read retries

Nicholas Carbones (1):
      drm/amd/display: Add pipe topology history to dc

Paul Hsieh (1):
      drm/amd/display: Re-check seamless boot can be enabled or not

Randy Dunlap (1):
      drm/amd/display: dc_hw_sequencer.c: remove kernel-doc comments

Robert McClinton (1):
      drm/radeon: delete radeon_fence_process in is_signaled, no deadlock

Shikang Fan (1):
      drm/amdgpu: Add sriov vf check for VCN per queue reset support.

Srinivasan Shanmugam (1):
      drm/amdgpu/ttm: Fix crash when handling MMIO_REMAP in PDE flags

Taimur Hassan (2):
      drm/amd/display: Ignore Coverity false positive
      drm/amd/display: Promote DC to 3.2.359

Timur Kristóf (5):
      drm/amd/display: Fix warning for analog stream encoders
      drm/amd/display: Cleanup uses of the analog flag
      drm/amd/display: Cleanup early return in construct_phy
      drm/amd/display: Move analog check to dce110_hwseq
      drm/amdgpu/vm: Check PRT uAPI flag instead of PTE flag

Yifan Zha (1):
      drm/amdgpu: Skip emit de meta data on gfx11 with rs64 enabled

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |   4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 153 +++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   6 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  59 +--
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 570 +++++++++++++++++++++
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |  80 +--
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  76 ++-
 drivers/gpu/drm/amd/display/dc/dc.h                | 490 +++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  36 ++
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   9 +
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |   3 +-
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |  13 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   6 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   8 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |  26 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   2 -
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   9 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |  15 +-
 .../display/dc/link/protocols/link_dp_capability.c |  16 +-
 .../dc/link/protocols/link_edp_panel_control.c     | 126 ++++-
 .../display/dc/resource/dcn401/dcn401_resource.h   |   3 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   1 +
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |  16 +
 .../drm/amd/display/modules/power/power_helpers.c  |   3 +
 drivers/gpu/drm/radeon/radeon_fence.c              |   7 -
 32 files changed, 1657 insertions(+), 125 deletions(-)
