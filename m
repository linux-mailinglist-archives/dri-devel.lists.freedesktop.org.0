Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCD2A4A03D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 18:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF9C10ED18;
	Fri, 28 Feb 2025 17:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C0OMK/hp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D30510ED18;
 Fri, 28 Feb 2025 17:24:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+O0q99Vd1F0i/ajxn8IVkjO2trfc1C8YpQLumfai6sP6xukOkYXzB5a1441ueaPL7bUpdKVwPoyeM/DTZyncbQwSZS1RGiyOgH7PSyezLRA1CwywFHPcneAuHt+d5TxZF6rw6XD469XRllaHFTBvgG3P0TEO0ouIqxkreE+Qbt07Ki9BNySVG1FxuwG+vJzADFN/ruNjaZyOFkRGJ28V4vr3FvfSHgGWyHcSPzitI6+maczSSN+DSgwGWzJrl7AcxLQK+3szeZE9FHEdA1ivhpJUYG8YL8NXhUhP0RskMKI5+38nCR15fafy1ym80j4U0KQ1PH0XEWr8tmZMmSScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptpA5PA+8L3MkWj7WccsrWDxDTRADwMzWUTsxuJl2M4=;
 b=Ut1Z5ROPcjKD3TDpZGApPLqqoCe1uMysvFDh+4CA44JYFI9FzFJyHHPFdIluvt1fJN2PIgR7+2HFWgnZdNuAOpLSBSLM9SxMR06Huaa73Lys6tKWqdlL+QEiWRBYCXdOBITd61UUZsEA0y8m041Pzwybqy6pgITaLQtxrJGzYmpI1/CSyWSTwemg9iltibFTIIwn1edrSvQ1sGiq2cna4aP8iSJongQ93rSAVzJIHYH0Gpv+R8rtyAWx4H5rBVu4uWMdrRfJ8FZn8eeVkuGPHWfNcErbLM6iWYdIKJ4yLTVxejZU/sbVD/KF/9vMwe5iD1iR+F65GMXWAjyRaa7NOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptpA5PA+8L3MkWj7WccsrWDxDTRADwMzWUTsxuJl2M4=;
 b=C0OMK/hpQ5R/BQXqPvCvqKRNp/GOQEVfCBaPOTtlxURxWDpywTGi0kWWfqtP/z3/MHB4fSCeduri1oMq9wnrMjHWLhiH+v6op8g3cxkMYw6QuBYKGVgTTcNrEFubBVErHzAdjEkR0ZMrJLHv0TwB+HyL+eL5PAJ7Q/M9an6/JUY=
Received: from SJ0PR03CA0016.namprd03.prod.outlook.com (2603:10b6:a03:33a::21)
 by MN0PR12MB5764.namprd12.prod.outlook.com (2603:10b6:208:377::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 17:24:15 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::7c) by SJ0PR03CA0016.outlook.office365.com
 (2603:10b6:a03:33a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.21 via Frontend Transport; Fri,
 28 Feb 2025 17:24:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Fri, 28 Feb 2025 17:24:14 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Feb
 2025 11:24:12 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.15
Date: Fri, 28 Feb 2025 12:24:00 -0500
Message-ID: <20250228172400.2038876-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|MN0PR12MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f3f602-029a-4bd3-76b2-08dd581cb933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVJmSlRjOGQ0ZjJIVlRaZ3hkSDVKWmhtY2ljL0NPK2pmRWhEaXNtRUQ3dXMw?=
 =?utf-8?B?dzJldlpYYTFZNHAxQnRMMzdSSmRBQ1FVMi9DSXFMNDdiY2JwUEFXbno1cFZ1?=
 =?utf-8?B?YnI5T3JBN3NCVWE1TUExSnpweWdnUzJZbEdwaXE5RUlXcE9wU01pUFdmWkJP?=
 =?utf-8?B?TGVvTnAzc0IwNFgvUFUwbk42aUpaNThOQ2J1Ylh2STR2WENqNEVDY2hUeWwz?=
 =?utf-8?B?Tng2OHV2dWUrVnc0RXZJUVU5KzB1UWpocEFhQXFzZjNLU2FXd0RBVStSMk1a?=
 =?utf-8?B?Yk1PcHZvdnJBbW5YUTFrVXJvT1JvTUhjbUtrMTYyT1ZtU2gydUUvc3NxYlZ6?=
 =?utf-8?B?TWx1ZDhGOG1uaWJzMUtBZElycDNzaCtKRHB3bUpFOW0yUkJvN1hydXFuYndU?=
 =?utf-8?B?dUY4bEtiTzdzVndiOG94ZTdDd0hZL1h2RGdxaEVYSngrL0hDdkJJNlhmaEtB?=
 =?utf-8?B?Vml5N0VLSHRQYUlFelNxR1lSTlNzUzRudytGQitOenJzTVR5NGRRbFdhZG54?=
 =?utf-8?B?OVFTZHpKU3RwNUFHekNYcUYxUzR1aGpOV1IzOTQ4Y29MOWJ0a3FUd2szcXNZ?=
 =?utf-8?B?SnJIRUZxdWlzcEhEWERYalloZ1ErTnZ6TEordEg4YWZIMndNRlhKbDJ0c2lh?=
 =?utf-8?B?L0pHUDFJTzVUb0tYYlVMNHdncFE4ZGhRU0lYQzkydU9qNk5KNy9kM242RmdJ?=
 =?utf-8?B?MDA2dHViZm1RbFlFSzM3alRrdi93c2t2VmNPRWs3RlVTWWkrVFpmNm4zZlNv?=
 =?utf-8?B?S0dTY05tb1AzUm80ZnpFU0FBbDBsSnU0WTR0RVRGNEFQZDVmakE0V1VRcGV1?=
 =?utf-8?B?TW5sc1RiQTBLZGUxNGY5Y1lWd2hRQkh2RmdCaWFkeXZBSis1aVJHQkFTWXZ4?=
 =?utf-8?B?bEdaMGtnd3VlQVN3N0hlRTFjMjZsLzhNZ0pPNXpDZ0VHY1QvRlpraVM5RU4v?=
 =?utf-8?B?TjVLZlo5OHN2Ynprd0hSTVRzNUVEN1poWVpwNjlLOUFlMzhTaTlCQWkxaTdx?=
 =?utf-8?B?czFkenIyWDY4OGhJdEtTV04vN2JCUWdHMGUveHNRajhnclB1M2VsOVJaSm5Y?=
 =?utf-8?B?SnBUUnYzVDFxZUl5NWJEcTlTZDhLK1BFdWNaR3JvbGFOVDQrK01Gai9OYjUy?=
 =?utf-8?B?MDc2Mk9PVmNrc3ZlUDdKY3NTTW5vQXBON0tjUHR4QTVYVThLczJOTGZrM2Q0?=
 =?utf-8?B?OTFJVjlTZ01ld1BYQkpJNXV0Q0FtQ1dKdS9ob2JxOHBkTExJalJMbTF4UHJt?=
 =?utf-8?B?Z2FJdXdUaVkxc1NKQ2lKb0VCVnhvbHB3NHdLaE1wMHJZUFRGN3FLM0RCbDRp?=
 =?utf-8?B?bWU0RkpQbHlqc2JYWHpwVys1OXVscVA1MTBaQnFMcFpyZm9scHZSWXIzcjds?=
 =?utf-8?B?RGM5V284Sm5LSGdtREd1VlFIUXNyL0hoQUR0YVl1VFRyOWxmdzdMTzIxWU1P?=
 =?utf-8?B?SG9FTHRuR3NoQTFJRWJ3MEh6UTEreVVMR2Ezemh6TUh0QW4rbytkYUUrVlRJ?=
 =?utf-8?B?NUdGdUwreGR2VmhESUpMcHM0TmJzRDBaYmZKZnNOaW42Z1I3Ykt1cE9TVDNY?=
 =?utf-8?B?Tyt4ejBQNVFNUmc2Q0JjTVp6ZHp1VjVlcVJKakhZWkF3TEh0T0JSanNEbTR0?=
 =?utf-8?B?OXFKdUNoV2VabmNJc1A1ZFZFQUgrTVU4TDFHTkRNRDlzSnMwakhQRU9WdEpM?=
 =?utf-8?B?QlhaWEloelUxQ2w1QXZ3bFhWV3cyRFVuVXNrZ3JWaXlQNkZ1Z2d5SW9lNDlQ?=
 =?utf-8?B?RGlnbVNnZWlRN3hzTFBsblF5MmZReWt5YitjdjhKdUZia2dONElPYzU1MW1p?=
 =?utf-8?B?Lzk1WkUxaXE0RFVucXBjNXZ3aWx0a3JrRkJoRkxmV0Y3N25naXhTMGRrcXR0?=
 =?utf-8?B?V251VHJ6UER0VlFPZEI0blhkb0IzOC95b1EwV0RxdE1CTjVBcVVGWEJnNFpO?=
 =?utf-8?Q?jKdnwWBscIU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 17:24:14.4245 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f3f602-029a-4bd3-76b2-08dd581cb933
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5764
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

Updates for 6.15.

The following changes since commit 3521276ad14fe47ce1c4382749f3c95762629375:

  drm/amdgpu: update the handle ptr in get_clockgating_state (2025-02-19 15:19:05 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.15-2025-02-28

for you to fetch changes up to 7d83c129a8d7df23334d4a35bca9090a26b0a118:

  drm/amdgpu: Fix parameter annotation in vcn_v5_0_0_is_idle (2025-02-27 16:50:05 -0500)

----------------------------------------------------------------
amd-drm-next-6.15-2025-02-28:

amdgpu:
- Prevent KFD from being evicted when a exported BO is released
- Finish ip block transition for IP blocks
- Suspend and resume dpm fixes for SI/CIK
- Initial SDMA engine reset support for SDMA 4.4.2
- Documentation updates
- JPEG fixes
- SMU 13.0.12 updates
- Fix for runtime PM on DELL G5 SE
- MAINTAINERS updates
- JPEG 5.0.1 reset support
- DC EDID reading i2c fix
- PSR fixes
- Cursor fixes
- eDP fixes
- HPD interrupt handling fixes
- XGMI cleanups
- RAS CPER updates
- VCN instance cleanup
- MES cleanups
- SMU 14.x updates

amdkfd:
- MQD fixes
- Enable cooperative launch on GC 12
- Fix queue size minimum clamping
- Drop old pasid handling now that we've unified with amdgpu
- GPU reset fixes

----------------------------------------------------------------
Alex Deucher (50):
      drm/amdgpu: disable BAR resize on Dell G5 SE
      MAINTAINERS: update amdgpu maintainers list
      drm/amdgpu/mes: keep enforce isolation up to date
      drm/amdgpu/vcn2.5: fix VCN stop logic
      drm/amdgpu/vcn3.0: split code along instances
      drm/amdgpu/vcn4.0: split code along instances
      drm/amdgpu/vcn4.0.3: split code along instances
      drm/amdgpu/vcn4.0.5: split code along instances
      drm/amdgpu/vcn5.0.0: split code along instances
      drm/amdgpu/vcn5.0.1: split code along instances
      drm/amdgpu/vcn: switch work handler to be per instance
      drm/amdgpu/vcn: make powergating status per instance
      drm/amdgpu/vcn: move more instanced data to vcn_instance
      drm/amdgpu/vcn: switch vcn helpers to be instance based
      drm/amdgpu/vcn3.0: convert internal functions to use vcn_inst
      drm/amdgpu/vcn1.0: convert internal functions to use vcn_inst
      drm/amdgpu/vcn2.0: convert internal functions to use vcn_inst
      drm/amdgpu/vcn2.5: convert internal functions to use vcn_inst
      drm/amdgpu/vcn4.0: convert internal functions to use vcn_inst
      drm/amdgpu/vcn4.0.3: convert internal functions to use vcn_inst
      drm/amdgpu/vcn4.0.5: convert internal functions to use vcn_inst
      drm/amdgpu/vcn5.0.0: convert internal functions to use vcn_inst
      drm/amdgpu/vcn5.0.1: convert internal functions to use vcn_inst
      drm/amdgpu/vcn: adjust pause_dpg_mode function signature
      drm/amdgpu/vcn: add new per instance callback for powergating
      drm/amdgpu/vcn1.0: add set_pg_state callback
      drm/amdgpu/vcn2.0: add set_pg_state callback
      drm/amdgpu/vcn2.5: add set_pg_state callback
      drm/amdgpu/vcn3.0: add set_pg_state callback
      drm/amdgpu/vcn4.0: add set_pg_state callback
      drm/amdgpu/vcn4.0.3: add set_pg_state callback
      drm/amdgpu/vcn4.0.5: add set_pg_state callback
      drm/amdgpu/vcn5.0.0: add set_pg_state callback
      drm/amdgpu/vcn5.0.1: add set_pg_state callback
      drm/amdgpu/vcn: use per instance callbacks for idle work handler
      drm/amdgpu/vcn: add a generic helper for set_power_gating_state
      drm/amdgpu/vcn1.0: use generic set_power_gating_state helper
      drm/amdgpu/vcn2.0: use generic set_power_gating_state helper
      drm/amdgpu/vcn2.5: use generic set_power_gating_state helper
      drm/amdgpu/vcn3.0: use generic set_power_gating_state helper
      drm/amdgpu/vcn4.0: use generic set_power_gating_state helper
      drm/amdgpu/vcn4.0.3: use generic set_power_gating_state helper
      drm/amdgpu/vcn4.0.5: use generic set_power_gating_state helper
      drm/amdgpu/vcn5.0.0: use generic set_power_gating_state helper
      drm/amdgpu/vcn5.0.1: use generic set_power_gating_state helper
      drm/amdgpu/vcn: optimize firmware storage
      drm/amdgpu/vcn: use dev_info() for firmware information
      drm/amdgpu/mes12: drop amdgpu_mes_suspend()/amdgpu_mes_resume() calls
      drm/amdgpu/mes11: drop amdgpu_mes_suspend()/amdgpu_mes_resume() calls
      Documentation/gpu: remove duplicate entries in different glossaries

Alex Hung (1):
      drm/amd/display: update incorrect cursor buffer size

André Almeida (3):
      drm/amdgpu: Log the creation of a coredump file
      drm/amdgpu: Log after a successful ring reset
      drm/amdgpu: Create a debug option to disable ring reset

Asad Kamal (7):
      drm/amd/pm: Update pmfw headers for smu_v13_0_12
      drm/amd/pm: Add GetStaticMetricTable message
      drm/amd/pm: Fetch static metrics table
      drm/amd/pm: Fetch fru product info for smu_v13_0_12
      drm/amd/pm: Use separate metrics table for smu_v13_0_12
      drm/amd/pm: Get metrics table version for smu_v13_0_12
      drm/amd/amdgpu: Add support for xgmi_v6_4_1

Assadian, Navid (1):
      drm/amd/display: Fix mismatch type comparison

Aurabindo Pillai (3):
      drm/amd/display: fix an indent issue in DML21
      MAINTAINERS: Update AMDGPU DML maintainers info
      drm/amd/display: Temporarily disable hostvm on DCN31

Benjamin Chan (1):
      drm/amdgpu: Add amdisp pinctrl MFD resource

Charlene Liu (1):
      drm/amd/display: fix dcn4x init failed

Christian König (1):
      drm/amdgpu: remove all KFD fences from the BO on release

Colin Ian King (2):
      drm/amd/display: Fix spelling mistake "oustanding" -> "outstanding"
      drm/amdgpu: Fix spelling mistake "initiailize" -> "initialize" and grammar

David Yat Sin (2):
      drm/amdkfd: Preserve cp_hqd_pq_control on update_mqd
      drm/amdkfd: clamp queue size to minimum

Dr. David Alan Gilbert (2):
      drm/amdgpu: Remove unused nbif_v6_3_1_sriov_funcs
      drm/amd/display: Remove unused optc3_fpu_set_vrr_m_const

Jesse.zhang@amd.com (10):
      drm/amdgpu/kfd: Add shared SDMA reset functionality with callback support
      drm/amdgpu/sdma: Refactor SDMA reset functionality and add callback support
      drm/amdgpu: Introduce conditional user queue suspension for SDMA resets
      drm/amdgpu: Introduce cached_rptr and is_guilty callback in amdgpu_ring
      drm/amdgpu/sdma: Introduce is_guilty callbacks for sdma GFX and PAGE rings
      drm/amdgpu: Improve SDMA reset logic with guilty queue tracking
      drm/amdgpu: Add reset function pointer for SDMA v4.4.2 page ring
      drm/amd/pm: add support for checking SDMA reset capability
      drm/amdgpu: Update amdgpu_job_timedout to check if the ring is guilty
      drm/amdgpu: update SDMA sysfs reset mask in late_init

Jonathan Kim (2):
      drm/amdkfd: enable cooperative launch on gfx12
      drm/amdgpu: simplify xgmi peer info calls

Kenneth Feng (2):
      drm/amd/pm: disable gfxoff on the specific sku
      drm/amd/pm: add fan abnormal detection

Krunoslav Kovac (1):
      drm/amd/display: Remove unused header

Le Ma (1):
      drm/amdgpu: add sdma page queue irq processing for sdma442

Lijo Lazar (4):
      drm/amdgpu: Remove redundant logic in GC v9.4.3
      drm/amdgpu: Fix logic to fetch supported NPS modes
      drm/amdgpu: Move xgmi definitions to xgmi header
      drm/amdgpu: Add xgmi speed/width related info

Likun Gao (1):
      drm/amdgpu: correct the name of mes_pipe structure

Luan Arcanjo (1):
      drm/amd/display/dc: Refactor remove duplications

Ma Ke (1):
      drm/amd/display: Fix null check for pipe_ctx->plane_state in resource_build_scaling_params

Mangesh Gadre (1):
      drm/amd/pm: handling of set performance level

Melissa Wen (1):
      drm/amd/display: restore edid reading from a given i2c adapter

Michael Strauss (1):
      drm/amd/display: Update FIXED_VS Link Rate Toggle Workaround Usage

Mike Katsnelson (1):
      drm/amd/display: stop DML2 from removing pipes based on planes

Navid Assadian (2):
      drm/amd/display: Add opp recout adjustment
      drm/amd/display: Add SPL namespace

Nicholas Kazlauskas (2):
      drm/amd/display: Apply DCN35 DML2 state policy for DCN36 too
      drm/amd/display: Increase halt timeout for DMCUB to 1s

Patel, Swapnil (1):
      drm/amd/display: Refactor DCN4x and related code

Peichen Huang (1):
      drm/amd/display: replace dio encoder access

Philip Yang (5):
      drm/amdkfd: Remove kfd_process_hw_exception worker
      drm/amdkfd: KFD release_work possible circular locking
      drm/amdkfd: Fix mode1 reset crash issue
      drm/amdkfd: Fix pqm_destroy_queue race with GPU reset
      drm/amdkfd: debugfs hang_hws skip GPU with MES

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: init return value in amdgpu_ttm_clear_buffer

Pratap Nirujogi (1):
      drm/amdgpu: Replace DRM_ERROR() with drm_err()

Rafal Ostrowski (1):
      drm/amd/display: ACPI Re-timer Programming

Rodrigo Siqueira (3):
      Documentation/gpu: Add acronyms for some firmware components
      MAINTAINERS: Change my role from Maintainer to Reviewer
      mailmap: Add entry for Rodrigo Siqueira

Roman Li (1):
      drm/amd/display: Fix HPD after gpu reset

Samson Tam (3):
      drm/amd/display: Fix mismatch type comparison in custom_float
      drm/amd/display: fix check for identity ratio
      drm/amd/display: Fix unit test failure

Sathishkumar S (4):
      drm/amdgpu: Do not poweroff UVDJ in JPEG4_0_3
      drm/amdgpu: Per-instance init func for JPEG5_0_1
      drm/amdgpu: Add core reset registers for JPEG5_0_1
      drm/amdgpu: Add ring reset callback for JPEG5_0_1

Srinivasan Shanmugam (4):
      drm/amdgpu: Fix correct parameter desc for VCN idle check functions
      drm/amdkfd: Fix Circular Locking Dependency in 'svm_range_cpu_invalidate_pagetables'
      drm/amdgpu: Fix parameter annotations for VCN clock gating functions
      drm/amdgpu: Fix parameter annotation in vcn_v5_0_0_is_idle

Sunil Khatri (1):
      drm/amdgpu: update the handle ptr in is_idle

Taimur Hassan (2):
      drm/amd/display: [FW Promotion] Release 0.0.255.0
      drm/amd/display: Promote DAL to 3.2.322

Tao Zhou (1):
      drm/amdgpu: increase AMDGPU_MAX_RINGS

Tom Chung (2):
      drm/amd/display: Revert "Disable PSR-SU on some OLED panel"
      drm/amd/display: Disable PSR-SU on eDP panels

Xiang Liu (5):
      drm/amdgpu: Check if CPER enabled when generating CPER
      drm/amdgpu: Set CPER enabled flag after ring initiailized
      drm/amdgpu: Disable fru_id field in CPER section
      drm/amdgpu: Report generic instead of unknown boot time errors
      drm/amdgpu: Decode deferred error type in aca bank parser

Xiaogang Chen (1):
      drm/amdkfd: remove kfd_pasid.c from amdgpu driver build

Yihan Zhu (1):
      drm/amd/display: handle max_downscale_src_width fail check

Yilin Chen (1):
      drm/amd/display: add a quirk to enable eDP0 on DP1

chr[] (1):
      amdgpu/pm/legacy: fix suspend/resume issues

ganglxie (3):
      drm/amdgpu: Save nps to eeprom
      drm/amdgpu: Refine bad page adding
      drm/amdgpu: Change page/record number calculation based on nps

 .mailmap                                           |   2 +
 Documentation/gpu/amdgpu/amdgpu-glossary.rst       |  45 +-
 Documentation/gpu/amdgpu/display/dc-glossary.rst   |   6 -
 MAINTAINERS                                        |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  42 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  52 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |   9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 249 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           | 121 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |  14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            | 464 +++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  47 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           | 106 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |  70 ++-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |   2 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |   4 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                 |   4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  28 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   7 +-
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |   2 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |   2 +-
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |   2 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c            |  57 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            |  54 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.h            |   5 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  16 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |   6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           | 206 ++++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.h           | 128 ++--
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  32 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  32 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c           |  46 --
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h           |   1 -
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           | 177 +++++-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |   2 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |   6 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |   6 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   2 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   2 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |   2 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              | 201 +++---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              | 221 +++----
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              | 264 ++++----
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              | 675 +++++++++++----------
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              | 671 ++++++++++----------
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            | 609 ++++++++++---------
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            | 659 ++++++++++----------
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            | 598 +++++++++---------
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            | 505 +++++++--------
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |   2 +-
 drivers/gpu/drm/amd/amdkfd/Makefile                |   1 -
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  10 +
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  27 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  11 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  26 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |   1 -
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |   5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |   5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pasid.c             |  46 --
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  33 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  18 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  95 ++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |  14 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  23 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |  56 +-
 .../drm/amd/display/dc/bios/command_table_helper.c | 104 ++++
 .../drm/amd/display/dc/bios/command_table_helper.h |   8 +
 .../amd/display/dc/bios/command_table_helper2.c    |   3 +-
 .../dc/bios/dce110/command_table_helper_dce110.c   | 104 ----
 .../dc/bios/dce112/command_table_helper2_dce112.c  | 106 +---
 .../dc/bios/dce112/command_table_helper_dce112.c   | 104 ----
 .../dc/bios/dce60/command_table_helper_dce60.c     | 104 ----
 .../dc/bios/dce80/command_table_helper_dce80.c     | 104 ----
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   4 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   8 +
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.h |  94 +--
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |   2 +-
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.h   |   5 +-
 .../dc/dio/dcn401/dcn401_dio_stream_encoder.c      |   2 +-
 .../dc/dio/dcn401/dcn401_dio_stream_encoder.h      |   5 +
 drivers/gpu/drm/amd/display/dc/dm_services.h       |   7 +
 drivers/gpu/drm/amd/display/dc/dm_services_types.h |  26 +
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |  76 ---
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h   |   3 -
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c   |   5 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   6 +-
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |   2 +-
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |  26 -
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   1 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   3 +-
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |  11 +-
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h | 148 ++---
 .../dc/hpo/dcn31/dcn31_hpo_dp_link_encoder.c       |  10 +-
 .../dc/hpo/dcn31/dcn31_hpo_dp_link_encoder.h       |   6 +
 .../dc/hpo/dcn32/dcn32_hpo_dp_link_encoder.h       |   3 +
 .../gpu/drm/amd/display/dc/hwss/dce/dce_hwseq.h    |   1 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   5 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   5 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   5 +
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |  66 +-
 .../link/hwss/link_hwss_dio_fixed_vs_pe_retimer.c  |   5 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dpia.c  |  20 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  15 +-
 .../display/dc/link/protocols/link_dp_capability.c |  33 +-
 .../display/dc/link/protocols/link_dp_capability.h |   1 +
 .../amd/display/dc/link/protocols/link_dp_phy.c    |  16 +-
 .../amd/display/dc/link/protocols/link_dp_phy.h    |   3 +-
 .../display/dc/link/protocols/link_dp_training.c   |  20 +-
 .../display/dc/link/protocols/link_dp_training.h   |   2 +
 .../dc/link/protocols/link_dp_training_128b_132b.c |   4 +-
 .../dc/link/protocols/link_dp_training_128b_132b.h |   1 +
 .../dc/link/protocols/link_dp_training_8b_10b.c    |   5 +-
 .../dc/link/protocols/link_dp_training_8b_10b.h    |   3 +-
 .../dc/link/protocols/link_dp_training_auxless.c   |   1 +
 .../dc/link/protocols/link_dp_training_dpia.c      |   1 +
 .../link_dp_training_fixed_vs_pe_retimer.c         |   3 +-
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h |  31 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h | 221 ++++---
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   5 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |   2 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   5 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c       |  71 ++-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h       |  16 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl_types.h |  12 +-
 .../gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c   |   2 +-
 .../gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.h   |   4 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  76 +++
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |  15 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   2 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |   2 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  28 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   1 +
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |  27 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     |   8 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  28 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  32 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   5 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_pmfw.h   | 147 ++++-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_ppsmc.h  | 143 +++++
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  11 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   5 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  | 384 ++++++++++++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  64 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |  16 +
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |  52 ++
 include/uapi/linux/kfd_ioctl.h                     |   2 +
 223 files changed, 5780 insertions(+), 4243 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_pasid.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_ppsmc.h
