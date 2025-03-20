Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5118EA6AFA2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 22:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4890C10E6D2;
	Thu, 20 Mar 2025 21:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3NTOPyO6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2077.outbound.protection.outlook.com [40.107.96.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D0610E6D2;
 Thu, 20 Mar 2025 21:08:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1QVrOkbOQO0wsso9HTBB9S5ZdMxt4sr3749DIbzQgfEq25arbE9LSzu9exeTy1oTsKQXnrKRZNzNnMquiy+Iz5YjlgbkoZDs+v9CTZbd5zHlQlAOJvtnc32B/nz6xheSfkYzqrP4eD4yrH1X/XXES5aO3Hu1cCtsh03+XZuFhvUOb3rTAnwOfkaLq68UcA4TNVzQh6bgPJtCvqBDXD/5nqEZH6tjug76pAy3IvAVxTpiclJecZLjhfnNcxWtbQ6HETqi8YCbe5UqYP7oK64GyoE2/WQDb0puV7A7hGKXca6b8SLuxuuYsqRca7/uSRH2cplrle7f9VvWOeyMNvmqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQRm3dc4RBeFLyq/WSQbn4hJ5bUhGxpA7Cs8LCAu600=;
 b=KhYOz7WVoaVsN+HVZwjNXE6kfaoemVheREwizSvKENh2h5BxgjJZbtXZtTc+Rwc7rYa/7W1i6K7xGqzSg7OR+yLsfJCyNixUEDN7qBdr7Wx99NYbyUOgE551/FSyWbgy+7OtgE5wNyM+2qaDNGAit2Fq5LfmfuNED7ZK3jf9XxsSlJ+NYNXK76pYDa7fOTSRbUJSFoL1gWQXvWiTuUpFVMIdU0FEnWpraZ6+dcTT3lAp1RbOQonT9XPhJZYaUR83fS/dCVs/El14AEdQioUj9Mxfiu1BYnA6CL0jwcnH/4/fVSutsN+0AfW9qZcA7l+PXBXwB+jwXuUgJHqfJaXvoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQRm3dc4RBeFLyq/WSQbn4hJ5bUhGxpA7Cs8LCAu600=;
 b=3NTOPyO6OylDPZtHmAy4xkuSmFslDA0Vg1kdLRb0t+08gSnLa0fuoDLK9VvKRyVwEFpDFSy9aiA2j5e4ocBLvN57ZxeRqfgocb/TDsipPuhaLlLlHjsQ8mmmiC2q1WELG3CIuI6WCYzAiFuCii2i8MN1CrXjK6A3BOl6UHfzlmk=
Received: from CH0P221CA0047.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::28)
 by BL3PR12MB6643.namprd12.prod.outlook.com (2603:10b6:208:38f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 21:08:18 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::a9) by CH0P221CA0047.outlook.office365.com
 (2603:10b6:610:11d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Thu,
 20 Mar 2025 21:08:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 21:08:17 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 16:08:14 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-fixes-6.14
Date: Thu, 20 Mar 2025 17:08:00 -0400
Message-ID: <20250320210800.1358992-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|BL3PR12MB6643:EE_
X-MS-Office365-Filtering-Correlation-Id: 6272bb5f-58f2-4c2a-c415-08dd67f355f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDJSQVBLWnRsT0NLaW1DZHhLZUQ3cW53bmwrTWZQOW5jYWZ5ZlVCeU1PL0xD?=
 =?utf-8?B?TGVaaTJKTjFKL0t0SDYyRDUwdFZCekF3V2p5SktGSHhGY2ladTU0RmhuOUN5?=
 =?utf-8?B?OVVCZFlYUTM2eEc5TVVFY1RxMmlPbjhhT0x3NlAxdVpkTXdNbjFjWEc2T3dI?=
 =?utf-8?B?N3g2aVZMMEFyeUxHU2ZuaUQ0d0F5Tm5VSXFrNmFORXlRaTJqVE15L1p4TWxM?=
 =?utf-8?B?V3Z1aWRRTU52ZlA1b2xza3dxaVppNUY5MXA1eEc2SGViVFlmcjNCeWtPZnlI?=
 =?utf-8?B?Y1FKYUlsdndET1c4MG9YVitYWjJMZDBnNnpRenNPZ2lFWGVJSGtIWDRJNnhR?=
 =?utf-8?B?WXBQelB6QUtGQ2lJZHZScTFDWTFDZjBTYjBqQy8rejRwVkhGUm9QL3AwelVW?=
 =?utf-8?B?bjl6WjNFbmNZTmcxWEYvQmFtTzFIR1BMWVVwR0szWWNKU1FJTG5xVXFYZ2lK?=
 =?utf-8?B?NE5UYTNabzIvUGlCMGpTQjRBRHkwY2R3bWpSODBGMllmdHNZZjM1NDY2MWFL?=
 =?utf-8?B?RS9PcU5scExEbSt1NkdGM1pISHQzWXJFS241WXBuRGVDMGdiWFh3QTJxcEpG?=
 =?utf-8?B?aStHaStoR1czcFdoWEpzSERXVnFXQmNWUW4xem83QzF1Y2drQ0UyeVlLa005?=
 =?utf-8?B?SnRwbGhMRjhmSjFVZElzZ1UxODhhV2ZsalVnUGZaTjA0TDZxWnBJR1hDc2Qw?=
 =?utf-8?B?cnpTcForUVVndjlGNlh3aWJTdHp0VGpmTXh0b0dHUFVPTHV0TFNTckhWZnRD?=
 =?utf-8?B?KzZkWnJHY0J2OVhLQUVNbkxraExRQ05kMWhxSEpEYis3aHZ5djNLZ091Q2pn?=
 =?utf-8?B?dkRIa2hEa2VQc1J2N245SVFFVFYvRzBUek1EQnFOeFNraTk5b3REenFYU3Zy?=
 =?utf-8?B?eG0yVm1ZWjZiOTlKQzN5aWVyZC93QUUzbUd6R2FWbTFSRFJ4MGNBemM0RG5Q?=
 =?utf-8?B?eitOKzRIcWtabzIzenRnQWNiTXlFN2ZnaEU4ZURMbXdWNmpKYy95R3lOOFpw?=
 =?utf-8?B?MmxIMFR1eEZDaEVLdXBaK3E5YTNHYVRjOUVMNWVzOGJ1Q2tlTUFPeEFVcm42?=
 =?utf-8?B?QU8ySkwrbkRVeXZST012WEFocENnckN3cUVJanVCV3dGZGh6dFRiVmRnMGN5?=
 =?utf-8?B?dXREV214Y09wSzQ2UEVHTkxEY1dvbzVhSEpOYzRFb1FzbWxaTnpnb1dPcC80?=
 =?utf-8?B?MUgvOVRVQlNabDFBenNCT3lmQVY1TW0vR0pXdG1oaDEyTVNmVEtudHZRamtn?=
 =?utf-8?B?U0JYcWdNVjRKNHU5YjR4bjZBcHNjTEpQZzJScTgwRytVbkNPdVRVQTR3Sncw?=
 =?utf-8?B?YWNzWEZZdUwrNUtqL2NLYjI1NHNrWnQ1elZsKzlOd1VkQXBibWdXZk9ZUEhT?=
 =?utf-8?B?cVRGTGlEV1B6VVhCbkt4MjRyc20xL3lkcXhLMHBwS0pwcVY1UG9sNk93bTcw?=
 =?utf-8?B?V2YzbWJuRW5lVXZDRXNJTmx4cytxbEU1TGIxK0MrRHh5d2xIK0xLc1h2bklU?=
 =?utf-8?B?Q1JrWjhoSlhKaFlFKzRwOU5CMURuTFhKN241YU5JcWd6eEk3cUlyOWN6cFRP?=
 =?utf-8?B?aU9CWTFzc3UwdEgvMWxOd080MWRLdVJvUjVpUm1INTRCS3NKRFJOUVVHMWdi?=
 =?utf-8?B?YVBvMm83MVBaaStaR2Q2clJCSWg5Q2hHZndhWmtDVElERFB4bWRaRndUZ3dp?=
 =?utf-8?B?Rm9hYUdPU244NGFhMWlnZWZPSVZFRDNsL1N5WGZJY2dneXl4UlB0M2svSVps?=
 =?utf-8?B?UWwyRnZkTEp3SHpQd015YzBvWmN0REQ0Y20yYUxxcjJqU1AyZFBEOCtNOXJH?=
 =?utf-8?B?NmhrM3BCU1FMSEpiYUtKWUR6dFA3SGgzMlNGdFJibXBwb2ZEZnQwWmNwYWtH?=
 =?utf-8?B?cktOZ0U0TGRXRUFkWm04Q1d4czNjZ09FSU0yWEsxVE0yaUdaclB5bVdDbFB2?=
 =?utf-8?Q?BnQwoH2SKDc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 21:08:17.2515 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6272bb5f-58f2-4c2a-c415-08dd67f355f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6643
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

Fixes for 6.14.

The following changes since commit 6cc30748e17ea2a64051ceaf83a8372484e597f1:

  drm/amdgpu: NULL-check BO's backing store when determining GFX12 PTE flags (2025-03-12 14:59:21 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.14-2025-03-20

for you to fetch changes up to d9d4cb224e4140f51847642aa5a4a5c3eb998af0:

  drm/amdgpu/pm: Handle SCLK offset correctly in overdrive for smu 14.0.2 (2025-03-18 16:34:06 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.14-2025-03-20:

amdgpu:
- Fix video caps limits on several asics
- SMU 14.x fixes
- GC 12 fixes
- eDP fixes
- DMUB fix

amdkfd:
- GC 12 trap handler fix
- GC 7/8 queue validation fix

radeon:
- VCE IB parsing fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/pm: wire up hwmon fan speed for smu 14.0.2

David Belanger (1):
      drm/amdgpu: Restore uncached behaviour on GFX12

David Rosca (3):
      drm/amdgpu: Fix MPEG2, MPEG4 and VC1 video caps max size
      drm/amdgpu: Fix JPEG video caps max size for navi1x and raven
      drm/amdgpu: Remove JPEG from vega and carrizo video caps

Harish Kasiviswanathan (1):
      drm/amd/pm: add unique_id for gfx12

Jay Cornwall (1):
      drm/amdkfd: Fix instruction hazard in gfx12 trap handler

Lo-an Chen (1):
      drm/amd/display: Fix incorrect fw_state address in dmub_srv

Mario Limonciello (1):
      drm/amd/display: Use HW lock mgr for PSR1 when only one eDP

Nikita Zhandarovich (1):
      drm/radeon: fix uninitialized size issue in radeon_vce_cs_parse()

Philip Yang (1):
      drm/amdkfd: Fix user queue validation on Gfx7/8

Tomasz Pakuła (1):
      drm/amdgpu/pm: Handle SCLK offset correctly in overdrive for smu 14.0.2

Wentao Liang (1):
      drm/amdgpu/gfx12: correct cleanup of 'me' field with gfx_v12_0_me_fini()

Yilin Chen (1):
      drm/amd/display: Fix message for support_edp0_on_dp1

 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |  22 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  20 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  21 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |  43 +-
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 677 +++++++++++----------
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm |  82 +--
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   8 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |  11 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   2 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  94 +--
 drivers/gpu/drm/radeon/radeon_vce.c                |   2 +-
 15 files changed, 526 insertions(+), 474 deletions(-)
