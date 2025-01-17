Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F7EA15436
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD6710EB3D;
	Fri, 17 Jan 2025 16:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pZ6s2ueX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D8710E259;
 Fri, 17 Jan 2025 16:25:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lz5+trvqO3axjmWIwxxByb3OQQgr9YfEuzxYPNlcJNnS+MzAvq0YDgeVjpaTTN6ixcCebTDLQMsd5Eqmmwi4hgRrn35pswVrIWDbsAb39U/7IzH/N1sQW2qEHrZ1e/oqHiZyqBwNd9/4G5rkHCrFPPUx3fFYl3Sq1gcTbTPpYjSc3wSSw9ChzJ9myTE08rT0FDlFwxCj8iDJAOvDbgVNw1sb7FyIfGbyK6Wgsyt5DfAtkYweazP4Ffvs3lis7U7cHSEGYAUtX2A1/zVttAiK0jjiHz9UfXv52wxQMNp8uwvxJSNrkO1OxyjJ5onFh0f3jTQf9WrMtEzmp+9MucmkzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWf+/25k8sgPJocVh0M+t6yOPxhzT9h05D1lHuq0nTs=;
 b=bGebItr7a42VpQTWSTo3Jcm3I68MOrZELQmkBLzo67yQdliiaYRKcM1VSxjGvSul2TckMSNmnUTGCckcCdCd1AExzpagZEjUCsdR5dxlw9x4g+JRq4sU2kSbI5Dev+YLImkE/+CWPQStUfYxlIszMQetUX/ntr7i9yRXqdyc2hGoODzcUFd1E6HiKRITswrKONbuewB709Id8DWSEJF7u29Y0/M6RI731YtX0f3R1w5/LAGd3hCewNJYVnOzSW3MQM9jCwb1h9inW4ffuH0a6glt6n/so1BAZ+XWur0GyTYIYuOqT2MxXJ57/S7elNNQtbVzYYln+9FVrSobDh82fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWf+/25k8sgPJocVh0M+t6yOPxhzT9h05D1lHuq0nTs=;
 b=pZ6s2ueX1XH1f3pivcTELseNpjhsQQx4T21mctFM5/kcumMB+jdcRMWnKCU+k3n2acAJqR+VeoAjPmMm1fxzCOL3edzBWkeqXKjlpLKOvZMVRizLQLCntdR1D7Wo473npN+c8ytF78MqWyzKd4jwXEllZ9lWvfXlwU0aK5MlNNM=
Received: from MW4PR04CA0049.namprd04.prod.outlook.com (2603:10b6:303:6a::24)
 by PH0PR12MB5680.namprd12.prod.outlook.com (2603:10b6:510:146::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 16:25:56 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:303:6a:cafe::c4) by MW4PR04CA0049.outlook.office365.com
 (2603:10b6:303:6a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.16 via Frontend Transport; Fri,
 17 Jan 2025 16:25:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Fri, 17 Jan 2025 16:25:52 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 17 Jan
 2025 10:25:50 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.14
Date: Fri, 17 Jan 2025 11:25:36 -0500
Message-ID: <20250117162537.2702962-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|PH0PR12MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: 899457d6-f818-4ace-e476-08dd37139c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTlDS3dtMXg1b1UrcnI1RzlDNjhMMHQ4M1ZVMGFleG85T3VNUWlLUHhOK0tp?=
 =?utf-8?B?ZSttU2c0QWltTVRic3U0eXBiUE5kM01LS0I0bGNNcmZta2IxRU5LVDZjZVc3?=
 =?utf-8?B?bG5hRFYxcUZweWViMmNUc3JhOEYwbjdFSU80akdEdlRkZWY2WUVHRmRzdndv?=
 =?utf-8?B?ZGFNRTR5NDgyc2cvbDA4QU9uekRaMTA4UHQ1UGFKYnBmVVBtclZEQUErbnln?=
 =?utf-8?B?TDYwNU9iWWFVcThGYkJ2MU13VlBuZHROeXVEcDYwR3lRa3E5TFJveHZ2RTRq?=
 =?utf-8?B?Vi9aMzFoNEtwSFMwdHZiY1JxaGZWV1F6SGxXa1IzaDNQSGFnRlovS0FNZTF5?=
 =?utf-8?B?c2M1QVp5cTZXYkczbWhTc2RNd0NYVGdMZHllZ2pMVlR4cGZiSUlZZnlXNVl2?=
 =?utf-8?B?bE5jVFlLLzQvVVZlSmxQRXpOa0RkSzJnTlZzejFJZ1dZL05mZUpub3QzWk43?=
 =?utf-8?B?MmtHaGZJazNXMHR0ZnNCY3VvQmFUbnNkWUI1eG1HUm54MkVMYkJFLzRmZzQ5?=
 =?utf-8?B?RFZHRlVyZll3eWdUOGJzd3BVdEJIdnR5R1JLYVB6TmxkVVR3ZzM4Y2dsY1RI?=
 =?utf-8?B?TFFwTEtYMys2UFVkb1Bnb0FlVHV2Qk5yVEtyOGhvR1VrYVFpM0kxTTlZRFRh?=
 =?utf-8?B?eThyUW1LT3VmenltM2NVc2NmNjJCTEh6b0hyekx4dnNhQjljdkdzaFU1ZE5J?=
 =?utf-8?B?MjhtS08xMmFGSkd3MXRUcGdMR3dvaW9kL0Z5NnFCaEZ0aEpuR25mZWRESDAx?=
 =?utf-8?B?RGVCQTZjaG1HaHJRUmtYQzh0YzNBNVdILzlUMWgzN0ZZZzhKREYvM2RVa3Vv?=
 =?utf-8?B?QmhTUUlVdjdnekhOZU5MKzNsZnVabFBJZElWakl4bDFqNVMxbGFNWXRCYksw?=
 =?utf-8?B?UERyS2xoQmRmMGdnT2laUTlDeUJHVWl6NnFrUGlTRUFTY0xFekF4VGtPNHps?=
 =?utf-8?B?WnkrRnlhTUdFM1BZRmtEZThFLy9zTFNpZUMzL1pQeUhobmV4R1Rwb3E4amJL?=
 =?utf-8?B?NGR0STgxWGk0S2p1b0xwMVdyNCtpd3JFRmo5QkFndWRNTHRRTEFTbEo0a0FR?=
 =?utf-8?B?VHdUQ3BxZkJoUjM2bG1TN0xpcS90SWlRVmVkbTRCdXJsaGQ4QVVoc09ONUh0?=
 =?utf-8?B?R1grQTA4R0VaQXROSmNvN3FqTVN5UmF4SVpkeWs0cTlPam90ZHBBK0M3Sk9s?=
 =?utf-8?B?aFlSc1kza3lHQjViQm9aOElyWDZrM0dIbko2MnZxSHQwVGlRbTB6WS9IVjNz?=
 =?utf-8?B?bFNPUW5CQ0tuWGNPNUVsclRFQ2NDR0N2dDZiNjNhSGk5OGRwNlNFdGxHUGtL?=
 =?utf-8?B?bENXK2RZOUZLekthRm0zOUJJSVFGOGYxblN5ck1QWnpra3hRTUladW5rZmxi?=
 =?utf-8?B?WTBmWkJTcDE0WnNINVAwR1JwSkdoUmVKWkU1dzVUNzU3QXVXK0RzN0pLYUVC?=
 =?utf-8?B?UmJDcFoxRlRPNDhnZEFTbWhGbGlibXRicjM5U1pMNkt3T2UzVUlvOEQxWDJJ?=
 =?utf-8?B?MHhoRFo3RVN1NDFqQTlDZTlWNktPZDBITDUvNExpams4UXpOeFpteGxWUWQ5?=
 =?utf-8?B?ak40RjRHSXVOcjl1dUhwSmtlVDRESjNkUTYrQkxWeHpsNHFVdU9uR1RYQ0R5?=
 =?utf-8?B?cUxwSnJFeCtvczg4UVVwTWx1cTZsanZWSVd1QWd6T3F4dklFWFFCUkJseWhw?=
 =?utf-8?B?RlBLbjA5UUM1SE43enlGRDZ2RGY2Z1NyNmhNbnNXaUJJYlIzRVFHM3BGWjc2?=
 =?utf-8?B?N2RlNjZCVm9CUkNKejZJRTNVM1pSZnBrSEF4L3RkTC91NnpYd0RSV1FaTkJt?=
 =?utf-8?B?SVNYMEhWMGtKV1Y3bGFCRkdHVUprSUQwNndoZzdXOWdoa2ZKOUhHSFRkeWcy?=
 =?utf-8?B?cHJYTElzVHZ6RHd5dXZ1emlvMEVIWUxSZG9vT1ZFNXd4ZUhzUzdkdlVRT0Rj?=
 =?utf-8?Q?+t8mpOfTpEU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 16:25:52.3728 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 899457d6-f818-4ace-e476-08dd37139c74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5680
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

The following changes since commit 24c61d553302ee49e9c21dd251275ba8c36dcfe4:

  Merge tag 'drm-msm-next-2025-01-07' of gitlab.freedesktop.org:drm/msm into drm-next (2025-01-13 11:14:07 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.14-2025-01-17

for you to fetch changes up to 97e5c9e4139087a67c2469488360a6d6afdd4b69:

  drm/amd/display: fix CEC DC_DEBUG_MASK documentation (2025-01-16 16:23:22 -0500)

----------------------------------------------------------------
amd-drm-next-6.14-2025-01-17:

amdgpu:
- Enforce isolation fixes
- GFX 12 fix
- Use drm scheduler API helper rather than open coding it
- Mark some debugging parameters as unsafe
- PSP 14.x fix
- Add cleaner shader support for gfx12
- Add subvp debugging flag
- SDMA 4.4.x fix
- Clarify some kernel log messages
- clang fix
- PCIe lane reporting fix
- Documentation fix

amdkfd:
- Mark some debugging parameters as unsafe
- Fix partial migration handling
- Trap handler updates

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: cache gpu pcie link width
      drm/amdgpu: fix the PCIe lanes reporting in the INFO IOCTL
      drm/amd/display: fix CEC DC_DEBUG_MASK documentation

Aurabindo Pillai (1):
      drm/amd: Add debug option to disable subvp

Christian König (2):
      drm/amdgpu: mark a bunch of module parameters unsafe
      drm/amdgpu: always sync the GFX pipe on ctx switch

Emily Deng (1):
      drm/amdkfd: Fix partial migrate issue

Gui Chengming (1):
      drm/amdgpu: fix fw attestation for MP0_14_0_{2/3}

Jay Cornwall (2):
      drm/amdkfd: Sync trap handler binary with source
      drm/amdkfd: Clear MODE.VSKIP in gfx9 trap handler

Kenneth Feng (1):
      drm/amdgpu: disable gfxoff with the compute workload on gfx12

Kent Russell (1):
      drm/amdgpu: Mark debug KFD module params as unsafe

Lijo Lazar (2):
      drm/amdgpu: Add handler for SDMA context empty
      drm/amdgpu: Refine ip detection log message

Srinivasan Shanmugam (2):
      drm/amdgpu: Fix Circular Locking Dependency in AMDGPU GFX Isolation
      drm/amdgpu/gfx12: Add Cleaner Shader Support for GFX12.0 GPUs

Tvrtko Ursulin (1):
      drm/amdgpu: Use DRM scheduler API in amdgpu_xcp_release_sched

Tzung-Bi Shih (1):
      drm/amd/display: mark static functions noinline_for_stack

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  156 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |    8 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   22 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 2391 ++++++++++----------
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm  |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   22 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    3 +
 .../drm/amd/display/dc/dml2/display_mode_core.c    |   12 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   12 +-
 drivers/gpu/drm/amd/include/amd_pcie.h             |   18 +
 drivers/gpu/drm/amd/include/amd_shared.h           |    7 +-
 19 files changed, 1446 insertions(+), 1280 deletions(-)
