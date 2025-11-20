Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D254AC756C7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 17:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A923E10E789;
	Thu, 20 Nov 2025 16:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JVGUKwJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011048.outbound.protection.outlook.com [52.101.52.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B7210E788;
 Thu, 20 Nov 2025 16:41:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K50mh3EuRQXJo0Ts0JmB7ghWk8iwXS3NQLnxdI3+rfDW1PKtv7prQMfBcq9R5iqefZcjf6IQ9eMPGbqR0od8Iw1ac2zhJec1xWJAWH8pbw9O9TTrxd0SIRRSqkvn4otU2et9atkk8Uov0UBU3x+xRcVOIh8I3Tfdfcx94+icD7+58eJ3XsTVvSn2tL2BSiNk55WNNjyPp2en+AfZd85d3ruZzOzzBDCV9Ri1cCgIrEs51fMmhIzYILhRI2x7iPJqKseR2WKbYPIbhU1M/jp+WV6u64SFL5I2FAkQaalf6rnTjhMowsyMXIAO0x/C3lJ4hMWpriIC3mWLFow1J8FCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItD8GeGAljCttgGpGWrcUxB3eRd1Kar/WoAEZt78dcU=;
 b=ML2jksCT1UPOt5YFnx4x8epk9jYCH24F7bj20K9Oxht9Dz0oGggneB4AtLcs8pubnQjeqyXlZWpD8aq7pCkFHkNbuTO6PXbFoyr3InIAD4dUaY+HjQjfhqWGKO54nqPL4KPkc2XKA6KPcPfCbfXi9X3ucHx5LUMNoKzhkdcNRo6oXqi+aW4a8wVIeLrnJOsdwsLG/aD1uPaSWQ7cyown2omx3+ZDqh/wsKu/husnpKcYPJDwCwOpsMb85pYwkoBuMzeaGJ4jN29oB0GyqEJOPQ+uICpkv+vWCfUEFz3ZC2QswaigtdmMfK3AsYRLa22cptWgBLX0xNVFPpDaJVmBrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItD8GeGAljCttgGpGWrcUxB3eRd1Kar/WoAEZt78dcU=;
 b=JVGUKwJgLJGes/Q3Q2Qe7y0e/0Wix+OkAEp/PLkMgstGhZ0FysRJG9Z4BmvXTYQXdhl/19cZcBgLMBGknASJzXgjagQRAYikRAPKzepHI06bS4DemYSssLfXuxIbgHO7M8/V96WFn3Pb5PJkyjhQMfqFO9vE2jmxO3LYCAckntw=
Received: from DS7P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::10) by
 SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 16:41:32 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::8d) by DS7P222CA0030.outlook.office365.com
 (2603:10b6:8:2e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 16:41:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 16:41:29 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 08:41:27 -0800
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, radeon drm-fixes-6.18
Date: Thu, 20 Nov 2025 11:41:09 -0500
Message-ID: <20251120164110.1077973-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|SA1PR12MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe32bcb-0421-4d47-e032-08de2853a7c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkdvSWRkMFNMcWJ1SE05Y3VxRmZ4K2xLbHJaeGxOVHAxOXN5Ukp0SW1saGtl?=
 =?utf-8?B?REhNU0lHa0wyNXFjZ1dwNGlKcVFRS0xyc1RoSlBiclVnaGFlYkVpWmZPZ21v?=
 =?utf-8?B?dnVtdDhBQjdlM1lqTUNSd0FLQ3E4YXFydDhwNWZqNTM5L2JacTZBdmcyR09x?=
 =?utf-8?B?aU96aDhsMSs4YXRqZjZ5OU42akpkU2JVV1N4VzJnRFNqMzJWWG1DLzFNZk5S?=
 =?utf-8?B?ZVBmdVBqYUF4RlhGU0ZnZXNFYThIZU1UU1ZEOVY3c050TzZ5dDFtbjJ3SDJl?=
 =?utf-8?B?b1RITnU5dDZUU2ZTOFpBbWdwTy96S1psWFlEaWJiMTZYRWI0eVNrdHRCdTc3?=
 =?utf-8?B?cUx0OWorVy9MaVIzVytCMW5iYjM0RmFsdmpQb1dLUTBJOEVyZVk1TFNGZ29V?=
 =?utf-8?B?NmdST2RUUUNnem0vcDRBQitLS0NRSUpjWFY5MW1HYkFBbHcvTWt4d3JGbitN?=
 =?utf-8?B?VUhOQXVjT2hFRUdBZlVCUHcxclc3clhCREdrUjFYRFZWV2xEejBtaWxHSGUy?=
 =?utf-8?B?Q1ZaditYMWF3RkNuUkJZR2dENThZdklXZ3J6ZE9IcWo2cnVPRlAxanY4WU9l?=
 =?utf-8?B?R2prb0lRWno4ZGdJdE00WHg4VlhhUEM0WXpkcGtxa3BoV29uRkZxK2xKNHNI?=
 =?utf-8?B?Z0VSdmNqOWRsSmpNbGVpN1JJeGZ1SDVZd0NIMDBVYXdDV3VweUR6dUtmaEhT?=
 =?utf-8?B?S1AyV2xLWXZDc051bWRLc3JtalE5NSt6VENsc0FIODRxYWRUQmlMNVdnbWpT?=
 =?utf-8?B?akhWSDluOGI4eSt1ZVo4YXU3dnltM3h4VlF2OWNBWWNUajZsR3pudU9ZbnlI?=
 =?utf-8?B?dEpiNy9EYmdZbzNHdkdaeVV1bk1kOCtwQlZXcmFvMC9mNlI1NDJOWXJLOUJX?=
 =?utf-8?B?dmp4akh5VEVvN0FPWkM3ZWhJQVpGcklGMmhOWTBPMnJ1WjJQT2JNNUhOZGRz?=
 =?utf-8?B?bDUvR2hwOGlPT3gyYnhpb0pncXRNbk1oZjgrU3NwdmdhY3ZXTElUTkQvZkJO?=
 =?utf-8?B?a0NJOFp6VFFCQ2xnWGl1U083YmpZb0g3Y2pJek00bTJmUlJSQ1I2bHZrYjJr?=
 =?utf-8?B?Mit1bUtQMTRTckZBeXVyT3g3TGgyVHNYUHdnSDd2Rjk0QzV3elQrWkFnRlE2?=
 =?utf-8?B?NDVIdWczMFJFQ0hsRVQ2T0hCYURNNVRpcmt3Y09YWlFoY1hLdjBweU9pNVdI?=
 =?utf-8?B?MWdMcUVCb2x4YnZ4TE1XSE9GK0NYQkRjNjdjU2hqWmJiZDN4M3BtbldvTWFj?=
 =?utf-8?B?UW5aZ0V2R0ZCS3cyYlVEdEZVdWVHWmVVWlB1RTlNcGNtVXhONkN6eUFUSGdV?=
 =?utf-8?B?c2NRMzhaRnFBTTFVdVVPWWtLZUswZ3pWVTdTVDBQQ3F0STBmQ1Jaa29ubE1F?=
 =?utf-8?B?K3NrMDUrMGN0OVBiS3djeEY4RzRqenVMbGtkckFxdyt5eURzSEViUUdoeHBs?=
 =?utf-8?B?V3Yxd0xOd1ZhUzg4M2EyblNsak81VEZ3eUtqdGhmbjlTZnJzeE52eDBTRGk5?=
 =?utf-8?B?anoxUUZYNi9LRU9EdFdKQjJiblVIT0F3YmU4NUlSb2lqenVRNTVRS0tJMmxY?=
 =?utf-8?B?dWVnbGhadnArcFdMaktoNWNuQmp0OUluVXNBNmNoWVBuUjc2UUhBYmw2TkQz?=
 =?utf-8?B?dDczOGNhOWE4dHAzWUY2VlIxUnFGaVZVK2V3MW5jcldmSVhxWFZBMmp0TFlN?=
 =?utf-8?B?U1FZNjF5Tk96U0ZSb05SRGFvRWlRMUNRdUsyT3B1MkJ5eGVLY1ZuME9QRlVl?=
 =?utf-8?B?NXFiTXgwY0YxUnl0YWFyOGtjT2FicmFxcmw1VlZWZy9aVThiV2RBZVFmWE43?=
 =?utf-8?B?K2o0cDlUR09lWnFnN0s0ZmtPMEE5TTFPOTVFc2pLb2NZZityMmZtVkxCN0Jm?=
 =?utf-8?B?eGRqeVVOdzg5VWxKaitILzltQ2tmN0pCU0ZkcHYzd0Fpam1YLzlROWpLcGhh?=
 =?utf-8?B?MTFSMzBqQk14a2RZUDUyWXA0VFlRSW9JdW5kN09PaVlEdlRnblNJaVBTd1Rk?=
 =?utf-8?Q?Z3ATGk50bm3nATgN/eIinxH+c5FAHc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 16:41:29.4762 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe32bcb-0421-4d47-e032-08de2853a7c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8697
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

The following changes since commit 6a23ae0a96a600d1d12557add110e0bb6e32730c:

  Linux 6.18-rc6 (2025-11-16 14:25:38 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.18-2025-11-20

for you to fetch changes up to c156c7f27ecdb7b89dbbeaaa1f40d9fadc3c1680:

  drm/amdgpu: Add sriov vf check for VCN per queue reset support. (2025-11-19 18:08:37 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.18-2025-11-20:

amdgpu:
- DTBCLK gating fix
- EDID fetching retry improvements
- HDMI HPD debounce filtering
- DCN 2.0 cursor fix
- DP MST PBN fix
- VPE fix
- GC 11 fix
- PRT fix
- MMIO remap page fix
- SR-IOV fix

radeon:
- Fence deadlock fix

----------------------------------------------------------------
Fangzhi Zuo (2):
      drm/amd/display: Prevent Gating DTBCLK before It Is Properly Latched
      drm/amd/display: Fix pbn to kbps Conversion

Ivan Lipski (2):
      drm/amd/display: Add an HPD filter for HDMI
      drm/amd/display: Clear the CUR_ENABLE register on DCN20 on DPP5

Mario Limonciello (1):
      drm/amd: Skip power ungate during suspend for VPE

Mario Limonciello (AMD) (2):
      drm/amd/display: Move sleep into each retry for retrieve_link_cap()
      drm/amd/display: Increase DPCD read retries

Robert McClinton (1):
      drm/radeon: delete radeon_fence_process in is_signaled, no deadlock

Shikang Fan (1):
      drm/amdgpu: Add sriov vf check for VCN per queue reset support.

Srinivasan Shanmugam (1):
      drm/amdgpu/ttm: Fix crash when handling MMIO_REMAP in PDE flags

Timur Kristóf (1):
      drm/amdgpu/vm: Check PRT uAPI flag instead of PTE flag

Yifan Zha (1):
      drm/amdgpu: Skip emit de meta data on gfx11 with rs64 enabled

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |   4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 138 +++++++++++++++++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   6 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  59 ++++-----
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   4 +-
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |   2 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   8 ++
 .../display/dc/link/protocols/link_dp_capability.c |  11 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |   7 --
 14 files changed, 196 insertions(+), 58 deletions(-)
