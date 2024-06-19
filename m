Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A787C90F907
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 00:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C65110E26C;
	Wed, 19 Jun 2024 22:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZaTu8FM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060.outbound.protection.outlook.com [40.107.95.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E571710E26C;
 Wed, 19 Jun 2024 22:32:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z31GeN9AoL0JjdK6F6g3qvQNpjBA3/o7fXVTU5C9NEQ/4bqlQgFgJXhKDZpDp3Q8e+3mhM4Mv7W2SmMnLATNNOR/sIW0c+zr0EwZLkuItEGKIgKSDI2KLkdxoODQ9yGBdNC0isu5TFgOkzOQtDrxycsejsOd5pGC0q3mfp8RienanpHBTz7YyXNtlok6/WxopxI5Tyaf3gO/mEcmrGuCXBGsbGmATVnb3WW1HToMd2zMl8n4OhAKtEgDFQQsrvoUy3nsLDBS2R7Y4/XQvAcuZ8ekofGKX35ixPV7P9Efh0jA4eCmVJiIYJAhohvDkJHvvTUcDDHXnXUdv+L6eFwSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qul9OBlO98TUPNnN94Ut/zGY298+Im7p5X+P/h65UKI=;
 b=iWmLAeOlDLwhaw8TgkF66Amg6kCl5o3OrFY2DDazgFwZwbKbQz7QHP/SxnN7cirbS+rPStvAs3Zpf2M+q4bf/iO6bovRnoFwG8QX/Sr//hIzFk3cV88J6Zemv5ekjY6i/er00Ah6YzNUAE6L5l55JlKu1/C2kwjayrJGyk6xjFU0sig5fcodATcKfm4eloF4M7raZVFjkyJpnodadioWtL+0IIzQMdWPAkF6bFsSBUgj+i2tIILcF2D3lexw3KbX8ewUqKtHtMJtCe3T2Q9vW+RoxxCXl1L7dPrZrdnfGm6cz5Erb9/zccYnXcpIYeMapzk4fv55wk7eEi7E8wxEqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qul9OBlO98TUPNnN94Ut/zGY298+Im7p5X+P/h65UKI=;
 b=ZaTu8FM/vX3lV589+T/scLUtCjkT4PxQvLdiDqMpzKX4RML5Z9NwHWtJguE3YVMk48BlYbfCAfQe+7NlRjf7P0bWDDA6dFbnApyCSoGyI61aSoaf8IOBsyU3/9i9lWSF1ArW595WMmnnKTccIaidjykyJPYxbc1DZIDq1A0cuBM=
Received: from MW4P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::26)
 by BY5PR12MB4226.namprd12.prod.outlook.com (2603:10b6:a03:203::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Wed, 19 Jun
 2024 22:32:49 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:115:cafe::92) by MW4P220CA0021.outlook.office365.com
 (2603:10b6:303:115::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33 via Frontend
 Transport; Wed, 19 Jun 2024 22:32:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7719.0 via Frontend Transport; Wed, 19 Jun 2024 22:32:48 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Jun
 2024 17:32:47 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.10
Date: Wed, 19 Jun 2024 18:32:31 -0400
Message-ID: <20240619223233.3116457-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|BY5PR12MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: c7291efc-b18d-4393-4e91-08dc90afbfbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|1800799021|82310400023|36860700010|376011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFkvSno4V1ZPVStwbzcwOFhyVHUxOFAxOW5MbHMxN1pLOGFtYlFmaUh0WHZs?=
 =?utf-8?B?TWFZbVJFbXpMQUJJRzNselZ4ZEkyZHAweEV4cjRJSEQvRTVDdG1UaE1ZZXpE?=
 =?utf-8?B?ODlaWlVWVXpJUTVBMU81bDlkeVdaM1VqLzJicEdxMDlsZmdic3dDSFRlT1NH?=
 =?utf-8?B?SWlYMGFTL1VOd2UrZG9hNDNJbWg2YUVZd0hGc1ZhbExlWE5IaGxBdGpEUnpZ?=
 =?utf-8?B?a2RvKzJ2RXBxRmM4bEdlajl6T0ZPa0RBYm1hM2tuMUczQThTQ2FMaG9ZUkQ0?=
 =?utf-8?B?eTFqbVd2d0pKOXh4c0dzZDVPRW9sbkMvaWZ3VHJrUUJLWlFXRWRBOTR0L3Rk?=
 =?utf-8?B?WENIVUZaemtUcktwWWJRUXdpYXZORUFsRXAyOGwvVGJuYXFRd0hVSDNML2RD?=
 =?utf-8?B?WjJCVElnbU1NQjl2T3lhdWV0SlFrcThjOGY3a3dLaG9ycjFLUWoxMUZQaE8w?=
 =?utf-8?B?YVNlUGptdUttb2VTUExMZ2NEbnNDY1l3ZVZXVnBXUlBUNmFPOEhvYVB2SUFw?=
 =?utf-8?B?c2J5UHR4a3RCYU1pY2hpdXQxdnNPbWk0ZkZPN1JHc2FrTEoxa2gwRlUxaEc4?=
 =?utf-8?B?dDFaR1RnMXBScWZweVNsU0dSQzVJeDRoOTRlNTdJOFBDdVNNOW9VdU9qSzhh?=
 =?utf-8?B?RVhTNXJOcmUwWmg2VDYvWjV2Zy9TL1RJaW94b014VnNjQm85am5DcUhmQlJk?=
 =?utf-8?B?VXVHc2xHYXlweWtWMTZoTXZocUt5SjMxL0kzZUhtWXpqNzlIQ3paZjhKYXls?=
 =?utf-8?B?VlEyendEL0xLMkFUN1hERDhDVC9wRy9uR1FtOFg2RWw0dUFiWWgyTWUxd1g2?=
 =?utf-8?B?cmtxS1cxcVhXRFJvTDRtOXlNbUQ4aUZKdGh3SWpLUmw3MzhEZDhTMjZWY2hY?=
 =?utf-8?B?eDBvbEZkV0tYT3V0L2tsd0FjNzZVTEdrZ1c2UmxUUTFMeTJlZXc4eksvdCti?=
 =?utf-8?B?WEk0WEpvdHBvaTN4RlBkaTU5TStiMFRrQVFuaXAxVnNaTit4UjFpRksxOUhL?=
 =?utf-8?B?K1R5bUpXU2lDQTNGem5LUFNEeTR1dnZCNlh3ZzVrK2xabzBXaVZpQTNhNkw3?=
 =?utf-8?B?SkUxUERMdkZmMUFWbUE3a0lPcHI1R1B6UFh2TU5lblRnaXQxN05JRlBYYXdI?=
 =?utf-8?B?dnJNRzg3ZGZQd09KNFFwWVFaalBoRDllVjRteXVUc1FsaURYWkV4VTdxK1dR?=
 =?utf-8?B?TlpzVkRnOXVFV2dKZTc1V1ZTcFUzS3RFK29XMUxxY0hPR2s2U2JvQXg0SG5M?=
 =?utf-8?B?MzhwVzhUUkh0aHlGb3I5Qm0yUEszd2JJOHVJd1FHYTRQYkpZUHZDWlQ5TUZU?=
 =?utf-8?B?WmlqUk5QbTc1QVlaMjZJUXlvaGthd0Y3MjlRRlNlWDJKaTJVRlVIVVlOdTZx?=
 =?utf-8?B?MVhGYm12blZFb1ZZVHF5SE5LeldhQ0pPc0o3ckNpUUwxdWhFRTVIR1RNb2Nt?=
 =?utf-8?B?cUwwWkE5ZmxGMzJtZm0xYm1kM3FFNis3WTgrdGxZTE9HWXk2TGJpTTBjMnJi?=
 =?utf-8?B?MGVRUE5tcW5ES2xmcGRzeFdCOXllUHEzL1pWUzhnOWxSNEUydGdlWkhxcmRC?=
 =?utf-8?B?RnpPNGVDU3pEc3I5TG9aaVRpR1pKNzNNYnB2QjNaQk9zc3JLL0xtZFJYQTBY?=
 =?utf-8?B?bFlZZWFuRStFYWR6LzFlOXRWaXVSTEMvWUM5cFZLVUpzMGlHamMzSWFLeEEz?=
 =?utf-8?B?SExDWTMrRWJIU0pYdmY4VGp1QzREai9tVGlEMllER1hIODRNSGQ3bzE3L00z?=
 =?utf-8?B?QTd4dUxjSHlEVjJJWHhUNjcreFNETVJUYkZPWXphQ1dMWG5DOE5iS1BhRVpU?=
 =?utf-8?Q?fGi4Vtyis2+sa9iWiEkIqJE58xPVqmo5SXSPU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(1800799021)(82310400023)(36860700010)(376011); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 22:32:48.8802 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7291efc-b18d-4393-4e91-08dc90afbfbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4226
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

Fixes for 6.10.  Two weeks worth.

The following changes since commit 6ba59ff4227927d3a8530fc2973b80e94b54d58f:

  Linux 6.10-rc4 (2024-06-16 13:40:16 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.10-2024-06-19

for you to fetch changes up to ed5a4484f074aa2bfb1dad99ff3628ea8da4acdc:

  drm/amdgpu: init TA fw for psp v14 (2024-06-19 18:25:58 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.10-2024-06-19:

amdgpu:
- Fix display idle optimization race
- Fix GPUVM TLB flush locking scope
- IPS fix
- GFX 9.4.3 harvesting fix
- Runtime pm fix for shared buffers
- DCN 3.5.x fixes
- USB4 fix
- RISC-V clang fix
- Silence UBSAN warnings
- MES11 fix
- PSP 14.0.x fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/radeon: fix UBSAN warning in kv_dpm.c
      drm/amdgpu: fix UBSAN warning in kv_dpm.c

Christian König (2):
      drm/amdgpu: revert "take runtime pm reference when we attach a buffer" v2
      drm/amdgpu: cleanup MES11 command submission

Daniel Miess (1):
      drm/amd/display: Change dram_clock_latency to 34us for dcn351

Hamza Mahfooz (1):
      drm/amd/display: prevent register access while in IPS

Harish Kasiviswanathan (1):
      drm/amdgpu: Indicate CU havest info to CP

Likun Gao (1):
      drm/amdgpu: init TA fw for psp v14

Michael Strauss (1):
      drm/amd/display: Attempt to avoid empty TUs when endpoint is DPIA

Nathan Chancellor (1):
      drm/amd/display: Disable CONFIG_DRM_AMD_DC_FP for RISC-V with clang

Paul Hsieh (1):
      drm/amd/display: change dram_clock_latency to 34us for dcn35

Roman Li (1):
      drm/amd/display: Remove redundant idle optimization check

Yunxiang Li (1):
      drm/amdgpu: fix locking scope when flushing tlb

 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        | 34 ----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            | 66 ++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          | 15 -----
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            | 15 ++++-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             | 76 ++++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |  5 ++
 drivers/gpu/drm/amd/display/Kconfig                |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 13 +++-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  2 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |  2 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 72 ++++++++++++++++++++
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |  2 +
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |  2 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |  2 +
 drivers/gpu/drm/radeon/sumo_dpm.c                  |  2 +
 16 files changed, 192 insertions(+), 120 deletions(-)
