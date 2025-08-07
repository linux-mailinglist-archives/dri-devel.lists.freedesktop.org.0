Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECDBB1D8DA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 15:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AEC10E846;
	Thu,  7 Aug 2025 13:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DBQ+NcAs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D1610E842;
 Thu,  7 Aug 2025 13:20:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOXKocS2oB+Z4eUGdvrWsQKRz8zSr7BKaAjsXDNfNOgsIoCpA04Ipa2X7zdftMo7aj7so9wwL5UoCDEt2DhPxUJCIl0mCvZOSofTUrc09oWitiiJEQjHyfg73Gl4G/FsMkMk/w3eBvSjLG4+hT5y3BZTg9GIedyD53ZINEnnCFNDgUNB8lGSTkfqBnw9+vK7VRDoH/ZynYjdBYRdMpeBsZyaYOvw6oKQKbUzIa1J5rnq+ELv6OvU3XRGJhyf4Xt0j2ZTlUjTWBlYxtQzs5G+aIR3DhnT23VTz9DYKO0IXda4IJ7DKv1an6crzKUIzGXvXGvEsmSsp1GmSt8ZVckllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmYxk7a6yqSrw2C86A4HmkKjggKC2dmCou2rIyRjIKc=;
 b=WVEzlMNOGVLmYWNPNXWzzg1ac9oyhi5KcE19qm5HK3i6Vi90eenUKiFFplAo8ymxjS7RE4cUQrxeL/b/TeHU3z2E+n56yB7tkZU2BAI9Yc88jf2Pk3oEDtqINkz+l7kLNTxmtPganlXLoRfW0TQFIiIqxtPwI+ASnQp19GZxaxZd73KbowUh43wkx8utWwcOpnlDZ6X4TeCplp5xSpkUPYOKMKMCJpzEwHFoNaCKtbqqNA6NeV92zumiUCjZIElNxxyClTVxx6KlDQzAaoWbWJj9uR0s4OaOkZo6Rs3OcnXeJHL4XJ7mG8RU/Rctt6/SCemU7g4pnN2kwWMSHGjL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmYxk7a6yqSrw2C86A4HmkKjggKC2dmCou2rIyRjIKc=;
 b=DBQ+NcAsorte3k9FEWHpj/V/nMoFEQM+ACeV/VSOuNKsyHG2YPuzNQWiug3yYQxYD6FA+AJpW4zY67AJoqvt38qvtIXF5wOqtY0BxsyNsuWF7XGILc1trudug/vQ2N0DSN0R04L/VMO7X2ebotufhWuEHt0RxUhgq0pN8qnL008=
Received: from CH5PR04CA0014.namprd04.prod.outlook.com (2603:10b6:610:1f4::26)
 by DS7PR12MB6336.namprd12.prod.outlook.com (2603:10b6:8:93::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.14; Thu, 7 Aug 2025 13:20:48 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::f5) by CH5PR04CA0014.outlook.office365.com
 (2603:10b6:610:1f4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.16 via Frontend Transport; Thu,
 7 Aug 2025 13:20:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Thu, 7 Aug 2025 13:20:47 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 08:20:46 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.17
Date: Thu, 7 Aug 2025 09:20:29 -0400
Message-ID: <20250807132030.1168068-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|DS7PR12MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: 753f8f78-e012-433e-38bc-08ddd5b538cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVh6WVRtV2xUdzFvYUIvcEVIV0lJNFVXRDhXR2RCVHB2KytxNTZCS2pHUjR5?=
 =?utf-8?B?czlVajQ4dHZqYnhUdXNMK3I2WUQ2emdPRnRWT1Z6U05nWTFiNmV3UTJ2Z0FL?=
 =?utf-8?B?aEE5RWpYb3M5N3pjREJaRFJ4L0NjMVNGcTZVckVFVWQ0R29FNkN5dWtrQisx?=
 =?utf-8?B?cGQ0Rk91UFJzL3RGdDBoWTlVRm13TFluU2NTQ2tSYWxMamxqamJxVlRkTE5k?=
 =?utf-8?B?aE9iL1hRaUd3SDh5NTNIM0dXNDJIa2o0bnpmMjBTbFQ1QWkwS0RKOWN3cFR4?=
 =?utf-8?B?eDMrVklJNSswVThiUUVxZEljZnNFZi9IeWxpbEhqUFM1NDIyL3dZODFIaVEy?=
 =?utf-8?B?amg1YWo2NEtTc0oyK1NrR1dHc0xyaUk2bzRzUExjL0FMK2Nvck1WVFNBZHRW?=
 =?utf-8?B?OWZlYUwxV2IwRjBBWVQ0RXhJNXIwbFM0TWF5c3Rmei8wNGFlR2c2K1RCUXVJ?=
 =?utf-8?B?NUUwZU5sU0JiSDRrZjZCVE1DOVdUbHh4V05aMXpMR1lNdVpTU21sQjgzZHgx?=
 =?utf-8?B?RHNkMkovcml6LzM0Rjh5bHYzenpDWXNUVkdJMkxEM2pJMzc0YmxyM1JFM1A0?=
 =?utf-8?B?YkxLUFpSYkpaaDVFT252L3NQb2tXd3lnSnMySm52R1JDdXBxVlpzQXdONjZX?=
 =?utf-8?B?azJtU3NZNE56dmlsNjZKUEtaaXdsaHRFc00wekVoZjFISVc4YVp6emU5bUl2?=
 =?utf-8?B?Z3hRZUNHaW13eGpCSWppYUs3bTNOb2U0cWFuUTVDTnJLMEZWTUZXNEhyUXJ4?=
 =?utf-8?B?UUxDUWtTSFJtSklKV0ErVnVjRlNjNmI3Sk1hVG5SR2V1M05yb1hvdXBRN1ps?=
 =?utf-8?B?VEtONkJMdzdSdWV3U09sbGJaTUN2TkRnU1hORkl5ZWRjQ01tdnZZS2xzU3c1?=
 =?utf-8?B?WHdDSFdPeWhLUG1XeWJNVnNNSDlRNTNDdUkxQWJQcVd3MWpVVG1LbEQ0WWl3?=
 =?utf-8?B?ZnZNck1tblluUlNzRHRWZ3FzSGEremp3L2NVeDYyclZaMnlJSENQNHA3aTk2?=
 =?utf-8?B?dytnSytlTVFHT1MrcmVEaUxQWkNkaVZKcTkvdklEVm9pOXVOMVo1ZU1RQThp?=
 =?utf-8?B?eDZ5cTFrbEdGSk9SdDNkZnpsTlFrYUdLY3FSbEFsYTczZDhQYmo0V3dHUG9a?=
 =?utf-8?B?YmdaV3o0OTkxTmVZRzg2QVV2b0R1akpYZytWRHBrMjRYS0JEc1BqQ0prL2ph?=
 =?utf-8?B?dFVTaUthaDZ0bzZpMWFkODB0UEpJRmVhOVlOTjEwcHdYb1ZtNkRJRCtoVENB?=
 =?utf-8?B?eHBFZTlHV24yNEEvTzR1N1ZpZHV2eGJCb0szYzhtMzBoNU16YmZPYUdacjNz?=
 =?utf-8?B?ZEFVNmZ1N3kxSEVlR1VmaitYMlZBMzNYYzZ1VnE1MmJUUUhtcXJ4ZTlrYnNW?=
 =?utf-8?B?ZmtEeWsyWklkTTRabE5qeFJ3LzJPQTgwMnlwUWpibklxOFk0d0tOMzQ1ZFox?=
 =?utf-8?B?eTFISldsOVdqbi9RYkhGUVVTaTg1OXZDaytLSnl2MEV2SG5PVG5EZUN1SlM3?=
 =?utf-8?B?dXNKbDBhUWxjeUxrMjF3MHBPam1jc0VNMEV5TkpRVjVmTGxKTFQ5d1RadWlw?=
 =?utf-8?B?cDg0bk5iL0lkM3hSRWhtcFNGYmpyaS9Uek9NTVluck8wWmZsaEsxNUpEZWN1?=
 =?utf-8?B?T01CdzRIYzhuM3pqRjlLMDlGRGJLT1pSUGZvU0dBcjd4RWd5VG5hdmMxWFB1?=
 =?utf-8?B?dVI1WjlvUjg3SmdxbjVpWTFTUzFpeHcwOU8xcUl4NXgxUmhNdWFWNUpxOUx5?=
 =?utf-8?B?OUlLYlpaMG13ZkI4YlNWbEJ6TWYxdXNkSjQ0T0dtNE5nbVRHWVNvS1pDZXN5?=
 =?utf-8?B?K3ZmYmxiVVhkOThWSmpvemRHbE1pWXJLYUhmMUwxSVc2eU9ZOHlqeXhrM01E?=
 =?utf-8?B?ZzU2RjRla0hIUlU1K1FuZEFUWHpjWmExVFRiLzNsS21Edk84MVNINzlWSThU?=
 =?utf-8?B?VUVueGJsekhSNW8xbnVmRU1OQmNyRU9kVHIvakh2TG94ck4wRlV0REF6c0ZG?=
 =?utf-8?B?c0FBTDh2YTBBPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 13:20:47.4612 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 753f8f78-e012-433e-38bc-08ddd5b538cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6336
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

The following changes since commit 6531a2cf07ef156956840853692755cc7e1621b7:

  Merge tag 'drm-xe-next-fixes-2025-07-31' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2025-08-01 07:09:16 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.17-2025-08-07

for you to fetch changes up to 81699fe81b0be287fb28b6210324db48e8458d9f:

  drm/amdgpu: add missing vram lost check for LEGACY RESET (2025-08-06 16:54:25 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.17-2025-08-07:

amdgpu:
- GC 9.5.0 fixes
- SMU fix
- DCE 6 DC fixes
- mmhub client ID fixes
- VRR fix
- Backlight fix
- UserQ fix
- Legacy reset fix
- Misc fixes

amdkfd:
- CRIU fix
- Debugfs fix

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: update mmhub 3.0.1 client id mappings
      drm/amdgpu: update mmhub 3.3 client id mappings
      drm/amdgpu/discovery: fix fw based ip discovery
      drm/amdgpu: add missing vram lost check for LEGACY RESET

Amber Lin (1):
      drm/amdkfd: Destroy KFD debugfs after destroy KFD wq

David Yat Sin (1):
      drm/amdkfd: Fix checkpoint-restore on multi-xcc

Jesse.Zhang (1):
      drm/amdgpu: Update SDMA firmware version check for user queue support

Lijo Lazar (3):
      drm/amdgpu: Update supported modes for GC v9.5.0
      drm/amdgpu: Update external revid for GC v9.5.0
      drm/amdgpu: Add NULL check for asic_funcs

Mario Limonciello (3):
      drm/amd: Restore cached power limit during resume
      drm/amd: Restore cached manual clock settings during resume
      drm/amd/display: Revert "drm/amd/display: Fix AMDGPU_MAX_BL_LEVEL value"

Michel Dänzer (1):
      drm/amd/display: Add primary plane to commits for correct VRR handling

Siyang Liu (1):
      drm/amd/display: fix a Null pointer dereference vulnerability

Timur Kristóf (2):
      drm/amd/display: Don't overwrite dce60_clk_mgr
      drm/amd/display: Fix DCE 6.0 and 6.4 PLL programming.

Xaver Hugl (1):
      amdgpu/amdgpu_discovery: increase timeout limit for IFWI init

YuanShang (1):
      drm/amdgpu: Retain job->vm in amdgpu_job_prepare_job

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  76 ++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   7 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c          |  57 ++++++-----
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c            | 105 ++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   2 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_module.c            |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |  61 ++++++++++--
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  20 +++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   8 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   9 ++
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |   1 -
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |   5 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  19 ++--
 .../amd/display/dc/resource/dce60/dce60_resource.c |  34 ++++---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  16 ++++
 20 files changed, 321 insertions(+), 119 deletions(-)
