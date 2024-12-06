Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF14A9E788B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 20:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F421210F183;
	Fri,  6 Dec 2024 19:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OqjiATbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEFA10F180;
 Fri,  6 Dec 2024 19:05:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N87EoQIiOVeMhW/9CpX9zvYlZDM2Joltd2Y6FSa9/2ov19OPu7ZmL5+cekSWUhL414wTlhIr/+wE650P5+akYoSeAbEkueR+cP1j9AU6W9aWhTkY19Jpjqnc0ueo3LmnD9/quNWrcR5p1CPlMxlge0k8OmV0RD9heYZ5/G0dL0m+rbDIeo7QAFIcCL6ykjO6ZeFo0Q/krZMIhJz+f66Ci8ak+OcSGXC1l2h0qDZ+T9s1ibldMQcLk4jnw6dYQRIMErPwquoIw6nOlvvvKKIN/Irb0FtZDS0cxasW/DjpswuTWKkrzCpDyWuYl9khQo6hmrZ3/GWiMzZ6PdhjnoF+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYT/S+1E9ntcGGTE8yZLQcv7pRKMYdJ1Ttsvm3WfjPs=;
 b=XWUFyIzCG0Cxi/1vj8YGvsmtDSGCxa678Dbb238xT2YEF5i6Fp4JMpIyEjnLacbVsGNwQYpVrlG2P7WNJYEIGONy45fZJalAPZsqJC5kxYueyuYtitZ1fg7ePE9EeIMhKxOpiwzHPz+xx5QWrPTx1MLBJRkKioXnk/RXjapVNzmSmwvcSSHWnz6ABHDcF119T/U5ijK0bKrBvbxaKIh1MymBrUffZJGqW2O4vmNTduAk6v1ltxoGBHtrMcu/0Pd2kQBDc9GF53VQGX/3QiyhayB3ltXMQLY4EOOy+nUWtGboRNr3D7vqpe0O5UWLscF7DGbgT90lQhAm2S2aVtBuiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYT/S+1E9ntcGGTE8yZLQcv7pRKMYdJ1Ttsvm3WfjPs=;
 b=OqjiATbT/MXRXhn+zoezEtEmW5Iv/UjIxJgIgqbh1xq1y4sbDqOwKN/+fQce3X7AfQeUXGJnBr5mjumYpXJkfg3QCaDWA32uwdmW790+3EiuYjdfZG6Xdk9LPEbQkJC5pEf0KeiGr3AqHjBIagxTZ4qg2HH8fvFuJBaCi/lLT+o=
Received: from BY5PR04CA0020.namprd04.prod.outlook.com (2603:10b6:a03:1d0::30)
 by CYYPR12MB8856.namprd12.prod.outlook.com (2603:10b6:930:c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Fri, 6 Dec
 2024 19:05:08 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::f2) by BY5PR04CA0020.outlook.office365.com
 (2603:10b6:a03:1d0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.10 via Frontend Transport; Fri,
 6 Dec 2024 19:05:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 19:05:07 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 13:05:06 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.13
Date: Fri, 6 Dec 2024 14:04:52 -0500
Message-ID: <20241206190452.2571042-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|CYYPR12MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 010abc07-ea8d-42f2-6ea8-08dd1628e69d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anFVZzdvSXVpZjJCeEhYVmFpWW9jMWVXWkoweWFpQmY5akJrRWVZcnRoSk8y?=
 =?utf-8?B?S1orQmtmKytnZW9lalE0blR0aEdaOGxCME8zL3dQSFR1ODNxd2pBNnFaKzd3?=
 =?utf-8?B?WUlZWmdFS3ZhRGNqVXg1eEtQNklOWDEzQU9hUGVMMXpweEpLV0pWQUFUV1Jl?=
 =?utf-8?B?eDdpREh2a09wMzFSQkFjd1NPSGNHWCttOUJzM0JoYlphSG5vcU1UdVJicEhV?=
 =?utf-8?B?WDYxMjVnSXdDRVI1d1BaaUROUnBHRWxXb1lOOG5LR0pISmZoaXdkcjNBaWl6?=
 =?utf-8?B?dzdQQ3RkNkJjd1A3UTNBTG5SeGcrYzVzLzZWMnVnMTVLYU5pSDVoeHhZS3Yv?=
 =?utf-8?B?TnJ2NkwrUjFObUJYUE1samJDb3A2Skt6SnhqRFd2RkpsV0tDTG1ValV0NEJE?=
 =?utf-8?B?cXhoYWNDVHFKbVA4dFZCYXk1SytTaWQzQTRNUnc5QlI5OHFiNjhwclZ4K3Ra?=
 =?utf-8?B?dmZQdm5WNU5MNVlVcnc1c1U2YjNmT3ZpVEl1M1R5UDl0ckZyT21lZXlGNTZI?=
 =?utf-8?B?Qm5HQ3FWc0h6Uy9LQURtMk90V3pmN3VuZFVRaWlvQjZKUXZnNU5rVzIzREEw?=
 =?utf-8?B?NU1nNE10ZGFYL3MyTlA5bFVESTBWNUgycWpBNkEzSVhYZTdsM1JqanFtVTIy?=
 =?utf-8?B?YjE2cVRoR3hJV1Z3MnFLNVh0MmxSRlZGREFCeTFmU25HOFZWNDJUblBEdUtT?=
 =?utf-8?B?QXZ3MUYvYlV0THV3RkFaWXFZN3p3ZDB6aXI3MmU5dzBpdkt1YmloUys0bTln?=
 =?utf-8?B?aW9xZm84NUs0cVVJUnVEZUhXTHhJcURveDNaU2VsQ3V3WVVLY0lYd1NPYk9j?=
 =?utf-8?B?dm40YjFaRlBCdjRKNEVURW5xUGZBT1VDV2ExMG02UkFxZytwMk5ZRkVwT1hV?=
 =?utf-8?B?cXRYcU5IRk9qSU84Qi85c05icWxFR0RMZURWSEo4ZW52Szd2SVVseWR2QWR5?=
 =?utf-8?B?TjR6NEZVa2E5SmF3V2xoM2pnRFNOZkJJWnl3Y2xDOElDZlVnRnVEbkFHdzJt?=
 =?utf-8?B?WExrYmNnUHZxNG5hSi90dXlSeWk2SnJ2VFY4V01NUjZtUGxlWHB0RnBGVmlI?=
 =?utf-8?B?MGdpQ09maEJYRS9sS0Y4UEt2K2NpY2VMTklWZGpHa3F5d0M4cXAvN3RFdEt0?=
 =?utf-8?B?QVdLOWJ2UTNOTVg4SStCRFI3b0I0a0V5MVVtZCtBY2hKa0RUK2xOdjk4Sk9n?=
 =?utf-8?B?YzJ5SjBiNFlGOEd5UG51VzBBL0MyNXZRRzlvbVpvWXBJQVZlQkw0cHNGRTZi?=
 =?utf-8?B?ZFNqU0tseXFrUUVFNkkxVVFSaTRxUmhDd2hNbWwyTjg1VUhKQmI0UTY3bExG?=
 =?utf-8?B?aEVsalozVU1ldGFHSVR6bFZaakt3elJMZFdPU3pQNEJEYzhUVlNmTUVFRHVM?=
 =?utf-8?B?WG1iZnhLaVNqMG92T0hZeHpPa3ZEcjhNV2hGTHdoS0FOWW5UamNIQ01YZmxK?=
 =?utf-8?B?eU5aRnBTSVdubEh6OFFtbFg2MHV3NmVadUNXa2g3cWJTRlRJbnd3cnN0Ymk5?=
 =?utf-8?B?T2g2eHhvZ1JCMTZnd2Z4NmRubnYwWTNYeG16TFFURzZVclphZXBvZmZGK3RW?=
 =?utf-8?B?VVNSelUxYTZITnd4L0tickd3ZU9LRkVUVDIwVFVjT0RYcDJjL3o3NHZUZXdi?=
 =?utf-8?B?ZUpZcHNtaXJHZU1CaUZ5NnlRbEJQY2VyTENWY2RXRHdvdXpQSlY1YjZPZnY2?=
 =?utf-8?B?OHYzOTc4cm9JMVhWbVpLWWt6djdmcCtvMGhxNUk4R1JNakRPTkFKdThIVDNi?=
 =?utf-8?B?SFNRcHArNDl6eEdFYXFZaEpmN29TbUx6WkF5cm9NeDB4R0luMHZ1eThZUnBT?=
 =?utf-8?B?cHp6SnpYNlNhdXZhOU5Fb0dlR1NYZW1vakdPeWplWXZZR1VJTHpub1A4T0dH?=
 =?utf-8?Q?wyRlBsyFGw+zj?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 19:05:07.8496 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 010abc07-ea8d-42f2-6ea8-08dd1628e69d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8856
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

Resending as this didn't seem to make it out to the mailing list when I first
sent it.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.13-2024-12-04

for you to fetch changes up to 73dae652dcac776296890da215ee7dec357a1032:

  drm/amdgpu: rework resume handling for display (v2) (2024-12-03 18:19:23 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.13-2024-12-04:

amdgpu:
- Jpeg work handler fix for VCN 1.0
- HDP flush fixes
- ACPI EDID sanity check
- OLED panel backlight fix
- DC YCbCr fix
- DC Detile buffer size debugging
- DC prefetch calculation fix
- DC VTotal handling fix
- DC HBlank fix
- ISP fix
- SR-IOV fix
- Workload profile fixes
- DCN 4.0.1 resume fix

amdkfd:
- GC 12.x fix
- GC 9.4.x fix

----------------------------------------------------------------
Alex Deucher (9):
      drm/amdgpu/jpeg1.0: fix idle work handler
      drm/amdgpu/hdp4.0: do a posting read when flushing HDP
      drm/amdgpu/hdp5.0: do a posting read when flushing HDP
      drm/amdgpu/hdp5.2: do a posting read when flushing HDP
      drm/amdgpu/hdp6.0: do a posting read when flushing HDP
      drm/amdgpu/hdp7.0: do a posting read when flushing HDP
      Revert "drm/amd/pm: correct the workload setting"
      drm/amd/pm: fix and simplify workload handling
      drm/amdgpu: rework resume handling for display (v2)

Chris Park (1):
      drm/amd/display: Add hblank borrowing support

David Yat Sin (1):
      drm/amdkfd: hard-code cacheline for gc943,gc944

Dillon Varone (1):
      drm/amd/display: Limit VTotal range to max hw cap minus fp

Lo-an Chen (1):
      drm/amd/display: Correct prefetch calculation

Mario Limonciello (2):
      drm/amd: Sanity check the ACPI EDID
      drm/amd/display: Fix programming backlight on OLED panels

Peterson Guo (1):
      drm/amd/display: Add a left edge pixel if in YCbCr422 or YCbCr420 and odm

Pratap Nirujogi (1):
      drm/amdgpu: Fix ISP hw init issue

Sreekant Somasekharan (1):
      drm/amdkfd: add MEC version that supports no PCIe atomics for GFX12

Sung Lee (1):
      drm/amd/display: Add option to retrieve detile buffer size

Yiqing Yao (1):
      drm/amdgpu: fix sriov reinit late orders

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  90 ++++++++---
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |  12 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |   7 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   6 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   3 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  13 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  18 +++
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  42 ++++-
 drivers/gpu/drm/amd/display/dc/dc.h                |   4 +
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |   2 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    |   1 +
 .../dc/dml2/dml21/dml21_translation_helper.c       |  48 +++++-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |   3 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   7 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   3 +
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   3 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |  23 +++
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |   1 +
 .../display/dc/resource/dcn302/dcn302_resource.c   |   1 +
 .../display/dc/resource/dcn303/dcn303_resource.c   |   1 +
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |   7 +
 .../amd/display/dc/resource/dcn31/dcn31_resource.h |   3 +
 .../display/dc/resource/dcn314/dcn314_resource.c   |   1 +
 .../display/dc/resource/dcn315/dcn315_resource.c   |   1 +
 .../display/dc/resource/dcn316/dcn316_resource.c   |   1 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   2 +
 .../display/dc/resource/dcn321/dcn321_resource.c   |   1 +
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   2 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |   2 +
 .../display/dc/resource/dcn401/dcn401_resource.c   |   1 +
 .../drm/amd/display/modules/freesync/freesync.c    |  13 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   6 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 169 +++++++++++---------
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  17 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  | 167 +++++++++++---------
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    | 170 ++++++++++++--------
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 171 ++++++++++++--------
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  41 ++---
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  43 ++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 175 +++++++++++----------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 139 +++++++++-------
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   | 165 +++++++++++--------
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  33 +++-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   6 +-
 49 files changed, 1031 insertions(+), 615 deletions(-)
