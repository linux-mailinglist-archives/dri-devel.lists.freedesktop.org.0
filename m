Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610109F6F08
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 21:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6DA10E36F;
	Wed, 18 Dec 2024 20:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rDoS1PpI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7147310E36F;
 Wed, 18 Dec 2024 20:46:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STlyWtsH6Odn/EAuOvqu+ICDkXLVmt4a/0/nBJONsDj29mtvLI04XBS6Jp4/GEc0E/Z0/3vVWZ5SEZumJIrEF6QNkz/Z1JkzAW4A3z/fkAAzu+VbWknhD/ZwrSyqJFEjEzNh5WSRyht/xK6MEXa7PUsq55i5XVAljZLlU9/oiWrjOzS5FKzYIKzOVVCuwukPBvVAjjHXaJhffVmqIzKSKNHrUYS27EpZCdcdh/LLDyKhiXmXpwbzIuigpIEgUcog9tok1KeZiWhnh3IxNbnreiNtsddEGPNoO98qbOLMM+9yXHg+B/wTx2ikPooG8XA02JClyQGmbiCAICFW0x5mZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzJHwiTbzWfJ6hArs9aR7XfvWlmre+CscE04cqC4nBg=;
 b=d+/1VfYcV81RmMn3LpiWKY2kpjXUAja1haLqSI/CR4k0jnMIT05DbCYcSNxs4gT7dFH/5fEQOWjcGq1kf/bcb8xQfm20j9nIk6fmaU825lgGDf8FZdiNZdXcNQm7udn8Hg8FB0QQj8RaIwEYxDDQKtUwRUo9zTogKdf+rn7KABIt2Nu8X43d7qMmmheVpPPX+BDQqf2x9zhiFdZm6W7n108RaJMkjy6Vk19j8qdSmptEa9N3du8wT2hcFck5N3BClf+wiJ3c4fB5jO3cU4Uphp0SbYCZrFGM+QTveGR/jbMlNmakpgRPDW67v6CHdDcBt1BwttRfvJQn6Y6UoreI9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzJHwiTbzWfJ6hArs9aR7XfvWlmre+CscE04cqC4nBg=;
 b=rDoS1PpIFD0Ma7kG9LZ5L8FBs0PDb15accnF2OcL+4tm5Lt/w8GqJfahLpOnLdYR0r9mg15U4n6kukrCmZ97D08DJMqJFJfiP+CQoVEksO+ssvjk1jODfXv2CIbGZZTTWk5AoAjdmTBMVDhP8r66tm4HzHjXw5TV7VQxXDpTr5o=
Received: from SA0PR11CA0022.namprd11.prod.outlook.com (2603:10b6:806:d3::27)
 by DM4PR12MB6279.namprd12.prod.outlook.com (2603:10b6:8:a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 20:46:52 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:d3:cafe::c7) by SA0PR11CA0022.outlook.office365.com
 (2603:10b6:806:d3::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Wed,
 18 Dec 2024 20:46:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 20:46:52 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 14:46:50 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.13
Date: Wed, 18 Dec 2024 15:46:36 -0500
Message-ID: <20241218204637.2966198-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|DM4PR12MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 237a31a0-2d92-4bd6-eeba-08dd1fa51a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEJxNUluK2ptTy9LcjN6QXVOT3NCeUhMS210cEZUdG1ja1Y3UGVaTGJIQlFW?=
 =?utf-8?B?Tmdlc3JoOXJJOGo0THFVeVJhWU9GWmJIQU0rcEV3VFFuSlE0bHE0UDVpWkZR?=
 =?utf-8?B?T1UwcHAxOEYwWXY1YnZFUEk5TG5iNUg5V3ZHQi8wbFpoWjNwUmpwWW9QK0t2?=
 =?utf-8?B?Z1dOOHhISFlmZlpwdTBHMyt0MGVYa2JINjVObUVoT1BGNWl4YXlVTnRhb1lH?=
 =?utf-8?B?THAwR3M5WjJxK3VoQTBwdWU1MCsrajZWSVBOdGJLSFlSa0tJc3lmb2lWdmV5?=
 =?utf-8?B?SDVoSHJZVWJVN1crNHBUV1F5aCtTT1BtYlYvNmxMc1htSVp2WEt6SHBFcVk2?=
 =?utf-8?B?Rk84eW8vZDR1Rm5ZOFlpRy9EdXp6MlQ4K0JobmUzTm13V0pIcHkzb0I1TWRL?=
 =?utf-8?B?aUpEaGJtSXZFbW5rczN3ZXVWTG12MlJvWE54c01lVmJCNkY4dDliN0lSQTkz?=
 =?utf-8?B?YnpaMUZMZ1ZKYjZ1eGJ4NW5ZV0kwejI5eWdXVVI2amN3NFFNMDhycTlCc1li?=
 =?utf-8?B?SU9ENHM0WVdHNE9UcXUzVU1DeWVJSnhXREMzOUNzQmUwaXhDelpuVW1tSWJ3?=
 =?utf-8?B?a2hkdlN2b0ExMnkxSWg5SUtQS1NpSUZYWW5ObURoNDcvYnBHaG9aMnZHS3c1?=
 =?utf-8?B?OXg0QTVjeXVHUlFPQTE3NGJrUER5ZGZBYmd3Mk83eDBoWnpxWWNqdDdTYzM5?=
 =?utf-8?B?RHM0eXpkWGJVNlJPMlRITWNxQ0xSaGhvL2U0aVZQOC83cmxUckpPbDRvdmN4?=
 =?utf-8?B?bTlsUlhjdldhNXdIUm5aYXRVUzk4UXlUYWx2TnFxR3RYRFFxNi9Lbk9RWDJW?=
 =?utf-8?B?bXgrZFhnOHlJaVJyanY2RlVtclhSTTdFT3lBL0Z6K28wK3YzVWFSLzNQaHRP?=
 =?utf-8?B?clhiaXZkZG5EeHRSUW85ODJKdjQyczdJdGh5d2lhcFhpQnN3VDJhblMyU080?=
 =?utf-8?B?Q2EzV3QvUlB5K2hKOXltVEJrQ0huaGoydWkydXJ2dzc1SmxjSjdGY25LN0FQ?=
 =?utf-8?B?bDg4bEVCYlN1VTk5MUdtVC9JRVBWNmZ5eko1U0NNb25xcEZVdGZUN0xpNEpE?=
 =?utf-8?B?bmIra1d4cytQNnM2dFkxL3JQdHRHYUVyK2p4Z1A1UUR0c2FuWTI5eDlFdmw2?=
 =?utf-8?B?VUpJdktES2d6cUFVT09YVE1hYjBSUjE5dk9OTWFvQzVDb0cwRVFFcXFYb0xN?=
 =?utf-8?B?QytZMXZpdFdSUE9BZW9yZVBhNitTeHh6V0I3QjdCZzFGYkRac2NmZ0xFaXM1?=
 =?utf-8?B?Nzh5TTJRMXd4d0RUdjJ5TXkxVEszdmNXYTgyY1hXRjVyWVgxNTRCMXZYcXZ2?=
 =?utf-8?B?SlFuaFFjdjhBdkJ6NmIzaFV3REIxNE95bmNuV2dvVmpkTUFOREhWaGhMSmN1?=
 =?utf-8?B?YUhlMXJwQ0NnQU9kbS9GeGsrYUticnhkck5hSHNWamJCck50OEdvRWljaFpy?=
 =?utf-8?B?TUJxYU40U2lMaXVYY0tyMjBmMFFlMUV2MklpUjNEU2dLb20wZUlVYjFQczFs?=
 =?utf-8?B?MDk3OWJCdnVxRnhvMTJISFplaFBOTlJIdGYzNUJtTWJJdWNuYWs4amZXMTdK?=
 =?utf-8?B?MGJ1SEFZdlZtc0cwdUYrLy96RldrWGJ3bi9DSzFpUGRrckZjVktHeWt6S3My?=
 =?utf-8?B?TG5aVkJCTEZpVE9Ob1lHYjBzU1JXN2paaUxZWTV6M0JBVmNqTEF0dncxWkxH?=
 =?utf-8?B?cVpleXlPMTBJVkZzcXVZZWJ3VG5NQVNTL0pZMXVEOEphQkZvRzlORzVVNTdj?=
 =?utf-8?B?MXl2ckJnNDdta3plMDFWS0lORG9ESERqRnVuaDJwckJhY0hxbm5DanR5ZEtL?=
 =?utf-8?B?clkxYTF4cEdQb3QvbVdkZ1FKVjdFZHRnU0l0MUVNdW1nZ1N2UldzQ1IwV1B3?=
 =?utf-8?B?bkNLck9BMnI5OFNPdHp3VEZuakVrWnJ5K3JRTXI0RDlVQmN5WHRiMlgvdHds?=
 =?utf-8?Q?G2uxlMi52p8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 20:46:52.4783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 237a31a0-2d92-4bd6-eeba-08dd1fa51a2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6279
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

Fixes for 6.13.

The following changes since commit d172ea67dbeec5c90f72752c91d202d5718e3754:

  Merge tag 'amd-drm-fixes-6.13-2024-12-11' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2024-12-13 09:43:20 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.13-2024-12-18

for you to fetch changes up to 3abb660f9e18925468685591a3702bda05faba4f:

  drm/amdgpu/nbio7.0: fix IP version check (2024-12-18 15:20:57 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.13-2024-12-18:

amdgpu:
- Disable BOCO when CONFIG_HOTPLUG_PCI_PCIE is not enabled
- scheduler job fixes
- IP version check fixes
- devcoredump fix
- GPUVM update fix
- NBIO 2.5 fix

----------------------------------------------------------------
Alex Deucher (6):
      drm/amdgpu/nbio7.7: fix IP version check
      drm/amdgpu/nbio7.11: fix IP version check
      drm/amdgpu/mmhub4.1: fix IP version check
      drm/amdgpu/gfx12: fix IP version check
      drm/amdgpu/smu14.0.2: fix IP version check
      drm/amdgpu/nbio7.0: fix IP version check

Christian König (1):
      drm/amdgpu: fix amdgpu_coredump

Mario Limonciello (2):
      drm/amd: Require CONFIG_HOTPLUG_PCI_PCIE for BOCO
      drm/amd: Update strapping for NBIO 2.5.0

Michel Dänzer (1):
      drm/amdgpu: Handle NULL bo->tbo.resource (again) in amdgpu_vm_bo_update

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: don't access invalid sched

 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c     |  5 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c           |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c              |  3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c               |  7 +++----
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c               |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c               | 11 +++++++++++
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c              |  2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c               |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c |  2 +-
 10 files changed, 25 insertions(+), 14 deletions(-)
