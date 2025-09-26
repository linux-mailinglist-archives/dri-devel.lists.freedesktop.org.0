Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67869BA441F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 16:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A8410E316;
	Fri, 26 Sep 2025 14:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tQLxhFhz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012056.outbound.protection.outlook.com [52.101.48.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8303710EA82;
 Fri, 26 Sep 2025 14:39:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kypDRSweT8rNY0cPIA70npc87R1l5uOHxTkJv6SLXJFzt2SpC5uPK3awRSJr/77I7KMn71GA8RrHAE6BiuPyEAkEWAWIFdwUXKd40agji3ljhj6M6eGxcwM3kRTCOX7G/1Lv3fL62HZBEpN/JdI7w+RyBxc3nYX1xWXQ1QQJ/WkLAcswmG4NVzURN5dcetPdBJtFJhBzB1F5OXKroOaYswvPAVM2bzuaL9RIZwC+3QlZzPeG+I/xvOQENfR2DavGHRwUtljmJm1CX0Z9ehuua97dnpd4N/Gx5fTS3QCs/rPjhaFhRTPUigIsUKZKRTbMobSeuvQzOls5ISzWaDmFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K01SJkIAmWQO2IjREM8iqYuagSX2x0qqopwjZVNjztI=;
 b=HjnKgxpgmWumloqFOwrc23qbmAqyh2WZwMIn8jvNlhp0/++HUi1UTMbudcTzIfALvn2DqTpatGfQWu7iyktgEqvRg7IkaGhQJsOUg9aLKffRw6nUH8Cvfbv4zcx0Lqbs/fo0OspkO0wHsWFGLgbErjgC7eSTTnjuJohI+h4Fop2G1KrnJ0BcRcNv0l8SrW54FHMxjcPXQbiu8ptL2f9I6qRDhBFsKRAOFfteIpxYSv89YHYolJ7gLyCLkuyYggY/owpfqXPRhS+ld/JvMR45bu3krkWuvI69Ycob0pCnvABt66N2EVHSYeGnnoMvH17TLPpImCK3n4gMQ3jDjRSDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K01SJkIAmWQO2IjREM8iqYuagSX2x0qqopwjZVNjztI=;
 b=tQLxhFhztXA1mu8/EJxUfsM5bEl0BXlhIkcIfEP0B3SjvXX0u8hXcFZH6bOPVOos//9ZtV+7GqyvuYkGhoifhWxHsf5t/q5XuR5ryCQyDykRn1tfbftjKHcpP37aW5FhG0714ebqUAi53/tlkvwVz18FngDtXPY26k0nDH7rjKo=
Received: from PH3PEPF00004099.namprd05.prod.outlook.com (2603:10b6:518:1::45)
 by BN7PPF862C85B20.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 26 Sep
 2025 14:39:35 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2a01:111:f403:f912::4) by PH3PEPF00004099.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.15 via Frontend Transport; Fri,
 26 Sep 2025 14:39:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Fri, 26 Sep 2025 14:39:34 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 26 Sep
 2025 07:39:32 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.18
Date: Fri, 26 Sep 2025 10:39:18 -0400
Message-ID: <20250926143918.2030854-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|BN7PPF862C85B20:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d63ab8-1cb5-4dca-ddf6-08ddfd0a82bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlFEY1RCWFoxbXd5K2NKMTZweDhpWk5QYnJEdjNTSlJwNzF1SXErNnJESVZB?=
 =?utf-8?B?T1JYbUdzMjg5TlJUQVZuTnFtVGxKSjhRTVNrOVcvOXovQmxQWE9ubFp5R2Rt?=
 =?utf-8?B?M0RoOFlNRmtEZTNDKy9RRlFXVnNnTFRxK25QWTliQzIxalprUFVqN0hhemFp?=
 =?utf-8?B?aXZ0Vnc0RXhiTkdienVSSzRSL0IwWTRDMzhyY1lGTmNoTTRyUVBDTHBTQ2Jw?=
 =?utf-8?B?ZUxIRGRzV05zbzZ2WThmT0hxa1VkejNPNytEaXIxT0YzbDdKa3RNdTZwazlQ?=
 =?utf-8?B?SkZ6Nkt5ZVNGeXhhekJNOGszaEVzL2Vyd0NOYnlLUFpXODBBU3I3dzhXWXJs?=
 =?utf-8?B?THZ6Q1lWRnNIclA2ZUlwTDdwR21aQ2RobCs3NVhtMEROVFJaK3RLOFY1cmN6?=
 =?utf-8?B?b0piM1Juc2hoWXNqL0tBLzVCWmxyMHRwT0FmS3ZCaW9NY0lwTklSMGNBT21o?=
 =?utf-8?B?SWpseGRFRUxrbmNORmJleVlYV0EzNEZudTE2L0pZVXpYWmpCZ2FMTVJpU2tn?=
 =?utf-8?B?S3J6djlyVndvWkJEZHl4dDdwaEdKSE5BUXlIdTJsa3Q1YkpWWHZrcFVlQWFa?=
 =?utf-8?B?TjlEd3NhbWpLRWNzR3lSMlo0T0Z1d3hlUTRCeVB6amVtdTBwZjVhZzNia1hK?=
 =?utf-8?B?TnZEZUE4WTlPd2Q3dGxwb0lyVDd4N3VaOXplWm16Um02ekdOU1ZvOVhxWWho?=
 =?utf-8?B?SmRXamRVOXBnK2NIZGlCZXRsT1JrK2x1NHpDWlJLamJCa2tYcGFKc3VNdjh0?=
 =?utf-8?B?dGhKN2grOWFqcmQvOEJ0cG84V2xFS0dZd0g3YnFWRzVWb2wxVmd6aTZSdlh4?=
 =?utf-8?B?UkhDZmxDMFhsVkYvY3BkUVpmc0tHYTJJS2Y0dm5WZWE1Si9tVkh2dzh1bm4w?=
 =?utf-8?B?S2ZQRmxwelNXUUlXM1VHZFcwZmJkTFI0TVdVenBxQmtyR3JHZXdabjhOTGpY?=
 =?utf-8?B?NzNTcDNHM09uR2VLWDFUdnp4OStpTkVhdHE0UDVleWJ6UkJXMEkvektzZ25H?=
 =?utf-8?B?TTM1Q1N5R2pHZ0hud0tuNkhTbmYyMllZYnZkajZhaHpBK2I0WDNpaU5mejUx?=
 =?utf-8?B?ODFNYzVqeHVpRGUzMVV4NDJxb2M1TDhURzdWbEwvKzFHSEFwc21Hb1U2ZFlj?=
 =?utf-8?B?S1N3S2drNmZWTVdpeGZQalZJclhqY1dVdkVpTDcrcFJxT3NpZHo1aGVxZHdt?=
 =?utf-8?B?Rmhwc2J1bTVUeXArTnpMT1hMUHdRWkdhOU9HdGxybW9DYjFIOGNVK2dQakpY?=
 =?utf-8?B?TUxUYndWWW9yaDY5cEV6SFNsSGZzYU84eUpYR2lkYjNjc05Bc1V6MUo4RVlm?=
 =?utf-8?B?TG1XL3B4NlJWLzRUVkNvUGdMQjFJUDI0VWVhZ0UzOUh0SnZkNVpJclFNM1B0?=
 =?utf-8?B?NTVCNVFDZU8wT3Q2TGFiRHphYkJFdkp1MDlkVzVrTEQ3WXFEVnZRRmZUd2o5?=
 =?utf-8?B?bnozNHJNUGk0KzNnS3lBV3JzOCtxbWJ1YmVYUEErSml2WXVveSs1S3A2ZnhX?=
 =?utf-8?B?T1phdFV4MmtnZG1qcnhtUjhEUlVPbzY2M29yeHlEOURSL2VjM09sb3lsa1hU?=
 =?utf-8?B?d2diRDJHSGF6TzcxYml2RWJ3ekxqTUI0UW5IYTQwWGlCUVExUGdTVDhlUnk4?=
 =?utf-8?B?NFJiOStUT1hUYWdrZlJLNndvTFBSSmt5S0hqb2JkYUtoSEE2b2pXemM0dk5Y?=
 =?utf-8?B?bVJvY1o4RkxLUmRwaG5oaUxPZ0VySTBvZE5DTWhOcEJGVzdndXNBSkVLc2VZ?=
 =?utf-8?B?MGlKTHVIRlhwenJwNTdqUTVJeVEvUWFrVlFyZzM0em8xMlEwVUZ4K0RFRVRh?=
 =?utf-8?B?MHVzZ2tFMW9qQWxrRGNsaHVzMmluMU5PU3FDcjJoM2ZWbXRLUFVmclhDc1BG?=
 =?utf-8?B?NWcxSXBMSzVrbkxwSDFpd2pBUE9GWjlWd2FzaEY2RjFjYys1WVRBNXhCVDE3?=
 =?utf-8?B?Y0k1L1V3VDFWMUNNVjN5R2NpTi92Y21rMHFsM0JIM2ZQNHczb1k3Z1MyRnZ0?=
 =?utf-8?Q?6fmoYv2knIR5nnIkBEMtgtJc4D9u3g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 14:39:34.0580 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d63ab8-1cb5-4dca-ddf6-08ddfd0a82bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF862C85B20
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

Fixes for 6.18.

The following changes since commit 342f141ba9f4c9e39de342d047a5245e8f4cda19:

  Merge tag 'amd-drm-next-6.18-2025-09-19' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-09-22 08:45:51 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.18-2025-09-26

for you to fetch changes up to df2ba5709416ac6ce8dab1d141fc246b79549e78:

  drm/amd: Add name to modes from amdgpu_connector_add_common_modes() (2025-09-25 15:54:22 -0400)

----------------------------------------------------------------
amd-drm-next-6.18-2025-09-26:

amdgpu:
- Misc fixes
- Misc cleanups
- SMU 13.x fixes
- MES fix
- VCN 5.0.1 reset fixes
- DCN 3.2 watermark fixes
- AVI infoframe fixes
- PSR fix
- Brightness fixes
- DCN 3.1.4 fixes
- DCN 3.1+ DTM fixes
- DCN powergating fixes
- DMUB fixes
- DCN/SMU cleanup
- DCN stutter fixes
- DCN 3.5 fixes
- GAMMA_LUT fixes
- Add UserQ documentation
- GC 9.4 reset fixes
- Enforce isolation cleanups
- UserQ fixes
- DC/non-DC common modes cleanup
- DCE6-10 fixes

amdkfd:
- Fix a race in sw_fini
- Switch partition fix

----------------------------------------------------------------
Alex Deucher (2):
      Documentation: add initial documenation for user queues
      drm/amdgpu: update MODULE_PARM_DESC for freesync_video

Allen Li (1):
      drm/amd/display: Add fast sync field in ultra sleep more for DMUB

Alvin Lee (1):
      drm/amd/display: Use mpc.preblend flag to indicate preblend

Charlene Liu (3):
      drm/amd/display: Insert dccg log for easy debug
      drm/amd/display: Correct sw cache timing to ensure dispclk ramping
      drm/amd/display: Revert "correct sw cache timing to ensure dispclk ramping"

Christian König (2):
      drm/amdgpu: remove leftover from enforcing isolation by VMID
      drm/amdgpu: revert "rework reserved VMID handling" v2

Dillon Varone (6):
      drm/amd/display: Disable stutter when programming watermarks on dcn32
      drm/amd/display: Add missing post flip calls
      drm/amd/display: Isolate dcn401 SMU functions
      drm/amd/display: Refactor SMU tracing
      drm/amd/display: Set wm_pending when disable stutter w/a used
      drm/amd/display: Remove wm_optimized_required

Ivan Lipski (1):
      drm/amd/display: Enable DTM v3 on dGPUs with DCN 3.1+

Jesse.Zhang (6):
      drm/amdgpu: Refactor VCN v5.0.1 HW init into separate instance function
      drm/amdgpu: Add ring reset support for VCN v5.0.1
      drm/amdgpu: Move VCN reset mask setup to late_init for VCN 5.0.1
      drm/amd/pm: Add VCN reset message support for SMU v13.0.12
      drm/amdgpu: Add fallback to pipe reset if KCQ ring reset fails
      drm/amdgpu: Fix fence signaling race condition in userqueue

Karthi Kandasamy (1):
      drm/amd/display: Add AVI infoframe copy in copy_stream_update_to_stream

Kuan-Wei Chiu (1):
      drm/amd/display: Optimize remove_duplicates() from O(N^2) to O(N)

Leo Li (1):
      drm/amd/display: Init DCN35 clocks from pre-os HW values

Lijo Lazar (1):
      drm/amdgpu: Fix vbios build number parsing logic

Lo-an Chen (1):
      drm/amd/display: Init dispclk from bootup clock for DCN314

Mario Limonciello (7):
      drm/amdgpu: Enable MES lr_compute_wa by default
      drm/amd/display: Handle interpolation for first data point
      drm/amd/display: Only enable common modes for eDP and LVDS
      drm/amd: Drop unnecessary check in amdgpu_connector_add_common_modes()
      drm/amd: Use dynamic array size declaration for amdgpu_connector_add_common_modes()
      drm/amd: Drop some common modes from amdgpu_connector_add_common_modes()
      drm/amd: Add name to modes from amdgpu_connector_add_common_modes()

Melissa Wen (3):
      drm/amd/display: update color on atomic commit time
      drm/amd/display: change dc stream color settings only in atomic commit
      drm/amd/display: remove output_tf_change flag

Paul Hsieh (1):
      drm/amd/display: Add monitor patch to read psr cap again

Prike Liang (1):
      drm/amdgpu/userq: assign an error code for invalid userq va

Rahul Kumar (1):
      drm/amdgpu: Use kmalloc_array() instead of kmalloc()

Sonny Jiang (1):
      drm/amdgpu: Update amdgpu_vcn5_fw_shared for vcn_5_0_1

Sridevi Arvindekar (1):
      drm/amd/display: Fix for test crash due to power gating

Sunil Khatri (2):
      drm/amdgpu: use hmm_pfns instead of array of pages
      drm/amdgpu: remove the redeclaration of variable i

Taimur Hassan (2):
      drm/amd/display: [FW Promotion] Release 0.1.28.0
      drm/amd/display: Promote DC to 3.2.351

Timur Kristóf (3):
      drm/amd/display: Reject modes with too high pixel clock on DCE6-10
      drm/amd/display: Share dce100_validate_bandwidth with DCE6-8
      drm/amd/display: Share dce100_validate_global with DCE6-8

Yang Wang (1):
      drm/amd/pm: place the smu 13.0.0 pptable header into the correct folder

YiPeng Chai (1):
      drm/amd/ras: Add rascore status definition

Yifan Zhang (2):
      amd/amdkfd: resolve a race in amdgpu_amdkfd_device_fini_sw
      amd/amdkfd: enhance kfd process check in switch partition

 Documentation/gpu/amdgpu/index.rst                 |   1 +
 Documentation/gpu/amdgpu/userq.rst                 | 203 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |   4 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |  41 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  31 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |  66 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   2 +-
 drivers/gpu/drm/amd/amdgpu/atom.c                  |   7 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  12 ++
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   6 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   5 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |  78 ++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  20 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  55 +++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |  88 ++++++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   8 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  12 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_services.c |   4 +-
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |   3 +
 .../amd/display/dc/clk_mgr/dce60/dce60_clk_mgr.c   |   5 +
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c       |   2 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c | 142 +++++++++++++-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h |   5 +
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c       |   5 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   | 121 +++++++++++-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  26 +--
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.c     | 130 ++++++++++++-
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.h     |  10 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  12 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   6 +
 drivers/gpu/drm/amd/display/dc/dc.h                |   5 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   3 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   1 +
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |  24 ++-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |   1 +
 drivers/gpu/drm/amd/display/dc/dm_services.h       |  11 +-
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c     |  21 ++-
 .../drm/amd/display/dc/hubbub/dcn32/dcn32_hubbub.c |  38 +++-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  17 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  14 +-
 .../dc/link/protocols/link_edp_panel_control.c     |  14 ++
 .../display/dc/resource/dce100/dce100_resource.c   |  25 ++-
 .../display/dc/resource/dce100/dce100_resource.h   |   9 +
 .../amd/display/dc/resource/dce60/dce60_resource.c |  69 +------
 .../amd/display/dc/resource/dce80/dce80_resource.c |  60 +-----
 .../display/dc/resource/dcn314/dcn314_resource.c   |   1 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   1 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |   3 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   6 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |   3 +-
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |   3 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_ppsmc.h  |   3 +-
 .../amd/pm/{ => swsmu}/inc/smu_v13_0_0_pptable.h   |   0
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |   1 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   3 +
 drivers/gpu/drm/amd/ras/rascore/Makefile           |   0
 drivers/gpu/drm/amd/ras/rascore/ras_core_status.h  |  37 ++++
 79 files changed, 1195 insertions(+), 392 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/userq.rst
 rename drivers/gpu/drm/amd/pm/{ => swsmu}/inc/smu_v13_0_0_pptable.h (100%)
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/Makefile
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_core_status.h
