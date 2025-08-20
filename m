Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F382AB2E5C7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 21:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837E710E284;
	Wed, 20 Aug 2025 19:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DrIZfNMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E6410E7DB;
 Wed, 20 Aug 2025 19:46:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hq/oS3nNagSLJtxmGXSWoegKpPP6rhS0yZjGZMuEx51FyOFECyjPU687mh8u+bJyvfkBrItDceGp6Nc4al477ZElBEqFSnk1We4JwKfPiGv3oHdotDS3PoWATLfC/QpIWiS8K0HbQSENsW3Fge7wSRr3EWykPkv3kPltx9CBjWj6it5o5/NxYwEp56qYFWuoDcgFvmD5LuQ3U6cayRHqrc5O5kMZs64IpX0kkCVnsoNicasJONej2g0ExQLFhrRZYzJ/C0faydGDwC27mXhl1dU2hTjzTTmMYn9ulGQ4fE+VcYpBnz88yYoZXUvVaqWzQ79ryyCgJ/kHhV25o1yK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96IRkq5noLiCeztQg+UcjT5UJ20ivGw6HtrYlTCPHhM=;
 b=OhAx50rrRQvSyI+A5gQ6s6Yfbqh5mxn+dnAlOODZkUewHd7Q8ZsNCEGVZrkjVnjO2mwMihp3DXyZwdxOk+kdpkdHC5XIAMrM4fl4Z0G43RHIJo45GmA200RhS2Wa/9HQFgCk1kDqVmrlhw+tWkhExej+2pUxURuxcRo9mX5kBUm0BHAkdznSVlCU2i2EBbh9JCb7d3ItzvJKqsqLyXDfL5HwM8ynBA07sd6MZPSpctc7OhHDvmwWxnvFzrOWK8g8gNX5sCcAy6l7FBIFMCCykdCEpjeDbP2ZsxpsRm8nj4R8JbHWipbVax44jzfdSh9r5QMsnT1zGs/q8801+DIRVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96IRkq5noLiCeztQg+UcjT5UJ20ivGw6HtrYlTCPHhM=;
 b=DrIZfNMADYHPSVnuqILCVooQbKYX4XS5qWY8tIoSOZ20EwEiqYWJNPuJVr3u6otPh7x6E66MarawB0s07pK4PfBXenuF86XotxQhhEeKv7mrKhG8VdUznhfuDSTNr8fo1g2yp5BBwAI3fQFy06eCJgCsOjYU88bIhm3dA3tfE08=
Received: from DM5PR08CA0025.namprd08.prod.outlook.com (2603:10b6:4:60::14) by
 PH7PR12MB7987.namprd12.prod.outlook.com (2603:10b6:510:27c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 19:46:52 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:4:60:cafe::c1) by DM5PR08CA0025.outlook.office365.com
 (2603:10b6:4:60::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 19:46:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 19:46:50 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 14:46:49 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.17
Date: Wed, 20 Aug 2025 15:46:36 -0400
Message-ID: <20250820194636.101975-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|PH7PR12MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ec88b5-ed70-4654-f3cc-08dde0224e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnJ3cGtaTUZRei9aTmpMYkNsRVFXVDNzQnVPek9XbVBpUHBKQkZpUXFwaHk2?=
 =?utf-8?B?ZGsxZnc2U3JMWWFuZm1EYldzVTYwcUZ0Z3dYL2dDUUdyeVgyTWVjYU5uOURj?=
 =?utf-8?B?eEFTSjBaY3BEdzZUTkdncHZjOUZPaWlBZEZ4WGd2Q0NtUWZUSkxhUzNCUjl2?=
 =?utf-8?B?WnpCRVc3UzVzd2ZSZyt4WWhXL1MzRE81UWhYTHNqb1RJWWQwUzY2aWxJcUsz?=
 =?utf-8?B?WDJMdWhGUkR5Qjh6YWwyMW0weFZnNDUyQXptQXhTNENmemxxUWlPcjNtb0ZF?=
 =?utf-8?B?b204ZDBJTnV6Ynppem5NNGQzY0g2NFFTczJ2Vk94WW5qUzM1b2VjYmFjOVpB?=
 =?utf-8?B?TmJvditodVVYOEFHN1BjYkc2WmgyRFlPREV1bUpvOWxVMm5jaEIyZE91NzVV?=
 =?utf-8?B?bjR0WWhLWkFPSXNsYmlhWTJYTmNRNTc1eHlvcG5WYmg0UFBmdHM0N0VLZ0JH?=
 =?utf-8?B?azlndzAzQm01OWY5ZnBRTVdGUjN4Vldnd0c5dlFWSWNRYzZiaUY5Z25LMVdJ?=
 =?utf-8?B?bEN5V0dXRlVlMk1qWnFrcFBZTnpGNTRmK25rS3JXZ3JtbVNWK1N3UzNjck9p?=
 =?utf-8?B?WHpJRVVmVU9FUUJHTng0Z1FwaEZod3pGc0IwaDVIZGtpMm1ERWRMUEFuNDY0?=
 =?utf-8?B?WGFsV0xnNjdYUzAxa3pmUElFQmpqU21wVkltSG5VcFVxbDY0R2ZJL0cvSUlU?=
 =?utf-8?B?K2wvRTNCYVVkaXo2ZTEwRUROdThwSS8xZjNNQkVlVzBhWnc5ZG9wMmxRSG5L?=
 =?utf-8?B?ZDRDMjFmdDdLYytRZThCU3U4UWVMNnRRdzdMam9FOTl1R2dmbGJ1K3IxNjZo?=
 =?utf-8?B?Y0VlaVVIdFNyMWIyNk1FbVJDWFNQaVJTUkxrT0JYd0JrUHRlRVNzZmlQd0I1?=
 =?utf-8?B?K1VoWWkrMlkwcytoaUgvWmxnbHV3REZ2RjFZd1liY2pteDVPR0pUaEtvcTJ4?=
 =?utf-8?B?QWdybThxM1k5eGlkakw4bm5aaVkzWW1XLytFVmlPM2RJaG9hUmpIaG11djhB?=
 =?utf-8?B?NTdGL0QxQjAxb2lKK0NyZDNRWDNBSFVxZm5OUWc0WmppR1BtUWkzU1lBUWtX?=
 =?utf-8?B?WEJjQmg3Z0VaTTdCbDZ4bnFKdVlRZTlpd1JXalI5WmJrU0xReVdnU0hIUmtv?=
 =?utf-8?B?NmRLdndJUkxIUTlzb25Vd1N6cGh4MzVRTzBLN2NrOWpyV3FDbSs2dW1XN3Qx?=
 =?utf-8?B?VlNEdUoxSHpzSW51SGpDYmZ2SytWWGpCdXl6d3pYMDZZb3V0YWZycklvNGN1?=
 =?utf-8?B?K05jOWhFN20xNmZ6eUpmNkUxa3F1R2x2eEhQeEFnK3RsME5CYk01amZ6OEtF?=
 =?utf-8?B?eTB0SWhpYktIVTBFbFFCMmFPWkdmWXVkUzFQY0FwM1VhZFFuMGxPL3V6Sm83?=
 =?utf-8?B?c0ZLQ1NFeHhXbk8wbG4xdkxjZ09EU3ZidkwydDlYWTFlNXdhVEZ4dFFITG9W?=
 =?utf-8?B?Zi9QUGFBYkdvOXpLbkgyYlpkc1Vuc3l5NHFjSjBWTE0vN05FTUNNNFcxZnZq?=
 =?utf-8?B?WXBPb2RjTC9KRHgwUDdGN1NjK095djN3dndONGpPa1pkZ3JtOCtRZnZsaHhD?=
 =?utf-8?B?am5ZQXBmdlM1alZPWkNpSWFZR2VwdmxDWEl5TjJmZUZlbFduZFBVMmpkV3VI?=
 =?utf-8?B?cUdWL2ZSUG9hbGsrVVo3d1ZtTDBISXcwYTR3d3pML2xmRE5SYzlHZ0R2Z2s0?=
 =?utf-8?B?aVVHZjFsVnlBSHY0M3NkUkI3c2hlcVdVckJNWXZXYzk5Q1ZWbDFocHBtM0Fo?=
 =?utf-8?B?Zld6ZkZuV2JQRTA5eVJSd1B0Z1E3T2wvN1lYZlUwTTlKaHdPZHFSV2JIWlRh?=
 =?utf-8?B?NXVtOWsyblFsRVIvbWpGZFJrZ2hxbXN0cG9QcFoyV05KUFpudEczc0VETm5J?=
 =?utf-8?B?UjlJelhiVDVQY0RneEtzSlNkMmZuaGoyNTFicmN2V3hHeWRhdktYVDZZN3U2?=
 =?utf-8?B?ZHp0NElzSklYVXFEalhPNE82VFZwVGFadTNSMnNEV0hYSWRpa0krSkt4ZWY0?=
 =?utf-8?B?TVJxTWJCTFpnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 19:46:50.1861 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ec88b5-ed70-4654-f3cc-08dde0224e3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7987
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

Fixes for 6.17.

The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.17-2025-08-20

for you to fetch changes up to 297a4833a68aac3316eb808b4123eb016ef242d7:

  drm/amd/display: Fix DP audio DTO1 clock source on DCE 6. (2025-08-18 18:00:56 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.17-2025-08-20:

amdgpu:
- Replay fixes
- SMU14 fix
- Null check DC fixes
- DCE6 DC fixes
- Misc DC fixes

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/swm14: Update power limit logic

Chenyuan Yang (1):
      drm/amd/display: Add null pointer check in mod_hdcp_hdcp1_create_session()

Gabe Teeger (1):
      drm/amd/display: Revert Add HPO encoder support to Replay

Mario Limonciello (1):
      drm/amd/display: Avoid a NULL pointer dereference

Timur Kristóf (8):
      drm/amd/display: Don't overclock DCE 6 by 15%
      drm/amd/display: Adjust DCE 8-10 clock, don't overclock by 15%
      drm/amd/display: Find first CRTC and its line time in dce110_fill_display_configs
      drm/amd/display: Fill display clock and vblank time in dce110_fill_display_configs
      drm/amd/display: Don't warn when missing DCE encoder caps
      drm/amd/display: Don't print errors for nonexistent connectors
      drm/amd/display: Fix fractional fb divider in set_pixel_clock_v3
      drm/amd/display: Fix DP audio DTO1 clock source on DCE 6.

Tom Chung (1):
      drm/amd/display: Fix Xorg desktop unresponsive on Replay panel

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  3 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 19 ++++++++++
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |  5 +--
 .../gpu/drm/amd/display/dc/bios/command_table.c    |  2 +-
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    | 14 +++----
 .../amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c | 40 +++++++++++---------
 .../amd/display/dc/clk_mgr/dce60/dce60_clk_mgr.c   | 31 +++++-----------
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 15 +++++++-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |  8 ++--
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   | 43 ++--------------------
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.h   |  2 +-
 .../dc/link/protocols/link_edp_panel_control.c     |  2 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    | 20 ----------
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |  3 ++
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   | 30 ++++++++++++---
 15 files changed, 112 insertions(+), 125 deletions(-)
