Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DAB92FF88
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 19:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A3310ED72;
	Fri, 12 Jul 2024 17:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5aHIqQv7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ED110ED70;
 Fri, 12 Jul 2024 17:17:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxkcunDahhJigg8oE5d0mf20Jh2JV7XnBF0BAhJXPf6nJAPQO+iOrzNvtBxCFGUmFUlV9uW5GI14QGN0Ou9NN87U3B1Hu+/7VI8k5mLSlcjHmAtCvWBGi+404igETgPUjaoR7l53EsKBG60YOKoO6FBcLHMXE4NaHF6jJhxifITld0up7kYOM7jFz9UsOREohhfkB8QpvNtqN3U/8pHQg/ANK6a4G2y0fVWrbVx2h1anyj3urjOWSzE0Dl9sWtw4+TRJ2BSoVMta9LnlDiSvqkby8zvushCpZCVERsv76+BmuZG/Y0BUBGVgxo0gdu62/RJNtJ7B9MPKI9YUlRCxOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1S8bWomLr0k/r06Q9TGc2L3YS4iS3yJbKEICCAvi2I=;
 b=tjxIwj3S7wNMn1+4NafcBsW94Z3QpabLOnhW87YzwMxVyEmwmREotaBaTn76ptQqFqaZvjoLwibEqkMx01NwUxz9cLGRxufa1kQa2kycbuUScTA7h9YSKfuaCmoYjz0SFQRu1rXBxOENtyK+9Zr3zPj+Xq3XtH/pWd3dad0yCIRo6+Gn+XWtfv2akdPqRQWuBCHMDf1iXbRBD5A/k1MtAtR320tV0hCAgSVCj4R3lxEotzD9iheBW22WC23aLRwAsT53eaQYCu6UWTVglE4cWI+EOaDLk5Rx1yT9jP6pJXdsZEYDTcv90m4ej+hbZ+6fFLXjOtsEpMCsfeOeKBHdpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1S8bWomLr0k/r06Q9TGc2L3YS4iS3yJbKEICCAvi2I=;
 b=5aHIqQv7wEw1wN/lWQR7P6EoFXZDOUzxHfTl/2AxnLbOzUWnZob4Hhe06QhvnTcZ9iqDAsyiz7hUPLWjHyLO5gsbTIF8tsqOTQ1JawPCjzgvFKoaBcPGDK6GT9bGW9mWUflggwpbV57zrfLB5/Pm8lsPJsGYqQQ1nyw7pBexfGs=
Received: from SJ0PR05CA0107.namprd05.prod.outlook.com (2603:10b6:a03:334::22)
 by BY5PR12MB4193.namprd12.prod.outlook.com (2603:10b6:a03:20c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 17:16:58 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:334:cafe::3e) by SJ0PR05CA0107.outlook.office365.com
 (2603:10b6:a03:334::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24 via Frontend
 Transport; Fri, 12 Jul 2024 17:16:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.5 via Frontend Transport; Fri, 12 Jul 2024 17:16:57 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 12:16:56 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-next-6.11
Date: Fri, 12 Jul 2024 13:16:36 -0400
Message-ID: <20240712171637.2581787-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|BY5PR12MB4193:EE_
X-MS-Office365-Filtering-Correlation-Id: 015c79b5-3152-4031-9d9a-08dca2966fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2gvcjlIbVRsZjhESUdDd2MwQTNQMEtTSHlGdC9VeThQTWFZVGZmdEo1YUtt?=
 =?utf-8?B?eHpLZzBHQ29zdm5mT0lZbm5Ic24ydnlyZ0N3cHhzNHU1SVZ6clFob3AxdHFO?=
 =?utf-8?B?Rm5xU2xIU1RTVndUVFl2NFlqRnIzTk13VC9ZS00yTXFwZE9pT1BBdEQzejNQ?=
 =?utf-8?B?Ri9XV1l3dUpsc0VrWmduMjY2cFl6ellKbzdIbjBwT3NYcXpTcm1SaFpZbjJn?=
 =?utf-8?B?S1FFYUFOMFc0aU5taFBhS25tQmlEWjJFOWIwSHlUb0VUeWViL0ZsOFRRd1Vj?=
 =?utf-8?B?elNzVmdMNk1wb1psZkFPNmdGQlZsbytiK0ZMbXdVSCtJbzRueXEvS0dLRE9W?=
 =?utf-8?B?d3NwMTg0VERsVWlGKzV2VFBYb3VQeEdKcExKc3pic3F5ODEzekY4U2VtblVF?=
 =?utf-8?B?aGxHcFBhQyt3Vm9zd2F6ZUdNajdIN0xsUGo1SThmaEhDdExmSDd4RE5RK1lj?=
 =?utf-8?B?eFdmaDNDUmRSTkJnQlc2UVphMUxKUGwxelp0QTBwK09sODJuWGhrT2pwRDMz?=
 =?utf-8?B?a2RYSE14K0VGUDdOQ1hpQ1pFTm5GdUVaUGlwZEVsUVFXMGVhTlQvMjMzem4v?=
 =?utf-8?B?alNPUURnaXJ6WGE0Nk9JNGJhaXQ4V3k1WUFLN3NWL0ZJVE1mM05NZGh0MTNn?=
 =?utf-8?B?T3RRUVUxcDVkVmIxb3UzTWo1b042V1MyT2pVbHNleS9KcDZZYVJBV3JJTG4y?=
 =?utf-8?B?RnZmSjBWdHJHZkFPZW5VM0czSzQrdFNNSnkwVnZnNEcwbi9wajh6MFFHWHgz?=
 =?utf-8?B?SGJkT3RQZndCQy9ySjVCaXhLT2NickRHb1hodVZ1MWVKSUhXRHBJSHhvVHZV?=
 =?utf-8?B?QTNsekNIbExHdC9SMGxNNC9yVjh6RW5OTXltblY3eG1UWXppZ0J1Vkg4L0tY?=
 =?utf-8?B?cGwrZjhUbnY2Tk5tMGVsNlJDMlErbkJMRzh4ek9DT2FyZmM4WGpsWTZDcHI5?=
 =?utf-8?B?VUhqcGpLV1ZwSHNDSnVFWmFvc3ZhT0xKdmlmSUs5dGR1WmExa1VoTFA2cW9M?=
 =?utf-8?B?LzMrcS8yYlpKdUthTFRuWHc2VllaaFB0Ky9DQXZHSzMwbUJNQlRHaHpmQ3VS?=
 =?utf-8?B?Vm9rZENZeEZHeFk2WGY2Vlg2SEE4RFBPcHNjcFA0aW9mVlNicjMwNjlqdDJG?=
 =?utf-8?B?bGtPSmN2OHphN0hKdTYvaXBUWG5Ka0dKTG5XRU9pWjFIRnY0NnRrNkZKQ1FJ?=
 =?utf-8?B?N2pyaGR0bG5ndVRsdGFkRkxnZjY0SWxLbGhHSnlYdU14NDJucC9YZFM2OHk0?=
 =?utf-8?B?bW5DSTZ0QmJNWEh5U0FPQndtZEZCem9XWEFEZ29UOVpCd2kyY0xaMGtDZTR1?=
 =?utf-8?B?MCtlQTVnSVpZV1ZrT3ZUWWZTd3lRSjRqUHZDbmlUdFNNT2ZtcFFyZHB2bkRs?=
 =?utf-8?B?aUhIRW5XTXdyQnZ3WVRZQjQ4aXBoQ3dpZGo3NnJqMXdoNWJTeExxVEcxWnVY?=
 =?utf-8?B?ekYvZ0k4eldWcVVTN055QmFmTlZ6aysveXYzVzA2UGp1am0yR2c2aTJMZnB1?=
 =?utf-8?B?WHZUdm0xaEFhbDBuUktjV0VjUXBBbURsb2ZxUlU2SG9uWnkxZVpLYmhiRGFC?=
 =?utf-8?B?Q1lMTjZlNjgyelVnWkpxeUZ2T1pkdW11Wll1RmZwTkZKbXFPb3hEWUR6Ui9a?=
 =?utf-8?B?UzRrck40d1Q3UkJsNzkxQlZ6bjcwMStyekpFeWRsbmFiQzJxS0hERWZKbDN0?=
 =?utf-8?B?V1lZN0xiaVRQK2Ezc3Q4NDBUM2dPTXVrOHovNFB4UERIQ3FxY05pMzRqdlNT?=
 =?utf-8?B?L1ZTYzZGN1NZdWt2ZWZQN1VqWk1Bakk4QWNhSWZTYi9EN1E0K21mYjQ0bHd6?=
 =?utf-8?B?U2xtTktWSzVjQjJaR1Z0RUh6Y25hb1Y3aCtvZEpPMXlXUkk5clBoZDBWZkNa?=
 =?utf-8?B?dkZGTER4b3NvUndiTWJ3TWozbTZsMUk5OGtNSVpsdFMvVWc9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 17:16:57.9796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 015c79b5-3152-4031-9d9a-08dca2966fa0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4193
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

A few updates for new IPs, but mostly bug fixes.

The following changes since commit 62a05f4ae9c1fb70bc75d494c9c1c373d2c2e374:

  Merge tag 'drm-msm-next-2024-07-04' of https://gitlab.freedesktop.org/drm/msm into drm-next (2024-07-05 12:45:41 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.11-2024-07-12

for you to fetch changes up to 1cff1010bef6f325d895db0306b59dc7232ed9b7:

  drm/amdgpu/mes12: add missing opcode string (2024-07-12 11:46:46 -0400)

----------------------------------------------------------------
amd-drm-next-6.11-2024-07-12:

amdgpu:
- RAS fixes
- SMU fixes
- GC 12 updates
- SR-IOV fixes
- IH 7 updates
- DCC fixes
- GC 11.5 fixes
- DP MST fixes
- GFX 9.4.4 fixes
- SMU 14 updates
- Documentation updates
- MAINTAINERS updates
- PSR SU fix
- Misc small fixes

----------------------------------------------------------------
Alex Deucher (6):
      MAINTAINERS: update powerplay and swsmu
      MAINTAINERS: fix Xinhui's name
      drm/amdgpu/job: Replace DRM_INFO/ERROR logging
      drm/amdgpu: remove exp hw support check for gfx12
      drm/amdgpu/mes11: update opcode strings
      drm/amdgpu/mes12: add missing opcode string

Aurabindo Pillai (1):
      drm/amd/display: Allow display DCC for DCN401

Christian König (1):
      drm/amdgpu: reject gang submit on reserved VMIDs

Danijel Slivka (1):
      drm/amd/pm: Ignore initial value in smu response register

Frank Min (2):
      drm/amdgpu: update gfxhub client id for gfx12
      drm/amdgpu: restore dcc bo tilling configs while moving

Gavin Wan (1):
      drm/amd/amdgpu: fix SDMA IRQ client ID <-> req mapping.

Kent Russell (1):
      Documentation/amdgpu: Clarify MI200 and MI300 entries

Leo Li (1):
      Revert "drm/amd/display: Reset freesync config before update new state"

Li Ma (1):
      drm/amd/swsmu: enable more Pstates profile levels for SMU v14.0.0 and v14.0.1

Lijo Lazar (1):
      drm/amdgpu: Initialize VF partition mode

Saleemkhan Jamadar (1):
      drm/amdgpu: enable dpg for vcn and jpeg on GC 11_5_2

Stanley.Yang (1):
      drm/amdkfd: Use mode1 reset for GFX v9.4.4

Sunil Khatri (9):
      drm/amdgpu: add gfx12 register support in ipdump
      drm/amdgpu: add print support for gfx12 ipdump
      drm:amdgpu: enable IH ring1 for IH v7.0
      drm/amdgpu: enable redirection of irq's for IH v7.0
      drm/amdgpu: add cp queue registers for gfx12 ipdump
      drm/amdgpu: add gfx queue support for gfx12 ipdump
      drm/amdgpu: select compute ME engines dynamically
      drm/amdgpu: select compute ME engines dynamically
      drm/amdgpu: select compute ME engines dynamically

Tim Huang (1):
      drm/amd/pm: avoid to load smu firmware for APUs

Wayne Lin (1):
      drm/amd/display: Solve mst monitors blank out problem after resume

Yang Wang (5):
      drm/amdgpu: remove redundant semicolons in RAS_EVENT_LOG
      drm/amdgpu: refine amdgpu ras event id core code
      drm/amdgpu: add ras POSION_CREATION event id support
      drm/amdgpu: add ras POSION_CONSUMPTION event id support
      drm/amdgpu: add ras event state device attribute support

YiPeng Chai (3):
      drm/amdgpu: sysfs node disable query error count during gpu reset
      drm/amdgpu: flush all cached ras bad pages to eeprom
      drm/amdgpu: timely save bad pages to eeprom after gpu ras reset is completed

Yifan Zha (1):
      drm/amdgpu: Set no_hw_access when VF request full GPU fails

Zhigang Luo (1):
      drm/amdgpu: set CP_HQD_PQ_DOORBELL_CONTROL.DOORBELL_MODE to 1

 Documentation/gpu/amdgpu/dgpu-asic-info-table.csv  |   4 +-
 MAINTAINERS                                        |   4 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  15 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 225 ++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |  32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |  11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |  12 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |  50 +++-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             | 326 ++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  40 ++-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_0.c          |  22 +-
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |  26 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   3 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  20 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   4 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |  18 ++
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |  21 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   3 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  31 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   2 +
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   7 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   | 152 +++++++++-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  36 ++-
 40 files changed, 1039 insertions(+), 134 deletions(-)
