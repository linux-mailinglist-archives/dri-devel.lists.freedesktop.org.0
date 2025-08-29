Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD9EB3C2D8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 21:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6083910EC32;
	Fri, 29 Aug 2025 19:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sKf3Jx9Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AA610E1E9;
 Fri, 29 Aug 2025 19:09:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMvNQIo3YY3ksY7DDrAliADshOvq3DjrMKpzIx3XvrIz6+pmjAIqcWNo+JtONPFEsWXiu4J9gg/obUGSdi1I9krzTR9fPNHPOVM1Wgjw7TAWcFNkenzw4p3Gkxr8Iw31pGZdF3hRdIPc2JWnIIq2oF85N7bSenCBqXmyQjOP/Rc9SQHs3fYGFWs6yUzS3I5TkwwSx1bCch9rj7qS2vh/Ibqih61ODI4qnEi1BLkLLnxQpP7Uku5h/alIa/FEQ9iqu5uwUYRaFjOellwVoA7SqV2SW7fg4Orz7ohti2koqcWVqT6NGTnGVfsH3CEtRr5rSaLTUdraOg4JnJ/KSgklWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8Ov9NPo2ukbzmhiulBztQlUXrfLjHfP/1jhZhaE0Jk=;
 b=NNiS9iYVlVzV8l37iAUZ7diFJGfYk9jgE8CxL4Y8DMN3no2BfuIQXGqzzV9g4U1CXOBFdMU4TJvdBnVLkr2Sbu5koSLQOjpu8/Up4KpByMO+963ZjOvS+UnL5eoYCy5i+8e7md4n0Ir3xMHh6Gt+Pw3RmKvIyuGkf/sTfBOaDslacrLeM2UUKd8RFyBJ5zREZqVaLcYAFNDyypUYy2Z80fFzodVpl8Twcm8+vdXqhN9V+D7s86q/5u5A/qXylLYorm0AWePV4r9FhAXx8cQRFidvI5yjBKH3W2uDEigQpf1Q6jR8BenCaJVYFYqgJwRPAf8+yGoBbqenFWutwH+TmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8Ov9NPo2ukbzmhiulBztQlUXrfLjHfP/1jhZhaE0Jk=;
 b=sKf3Jx9YW9HOzRDbuUbF6VouzfJi/HQp0KteFdwKYq1FDK/NXSdPGEU6sdfH78VF1GjnGf6bgsQV3vsPFcEqA9Rej5xqyFWlIBwWsGsLgOkrzZ5dfNZvk6gqm73pq7f5JqoynKes2N2OE7GPWHi3egOS0lEgyhon0oHWLPRW/nQ=
Received: from MW4PR04CA0067.namprd04.prod.outlook.com (2603:10b6:303:6b::12)
 by DM6PR12MB4042.namprd12.prod.outlook.com (2603:10b6:5:215::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Fri, 29 Aug
 2025 19:09:05 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::da) by MW4PR04CA0067.outlook.office365.com
 (2603:10b6:303:6b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Fri,
 29 Aug 2025 19:09:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Fri, 29 Aug 2025 19:09:04 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Aug
 2025 14:09:02 -0500
Received: from tr4.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 29 Aug
 2025 12:09:01 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.18
Date: Fri, 29 Aug 2025 15:08:48 -0400
Message-ID: <20250829190848.1921648-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|DM6PR12MB4042:EE_
X-MS-Office365-Filtering-Correlation-Id: ec44facc-d570-4207-9b1f-08dde72f8549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzZsRTJpNXBXaEFWU0lIOHpSU25FSzRUTi90a1h1L00wUnJidklBN0dPcVpD?=
 =?utf-8?B?SHpoM291NWx0U3JlZkpDYlYwdmJNQ0xMQTBSQVRYL1JlSmVKK1JGMHQwV0M0?=
 =?utf-8?B?M2xIY2dESk42eGovTDkzNEtJa1lGV0NFWUNnOXNQYUloa3ZtTXpzcDFkN2xD?=
 =?utf-8?B?cFJOSEd0Zis1UVNvaHRMWmRLc3dXUkVLaG1aNE00Z3l4R3BSaHpiYlJQRkxq?=
 =?utf-8?B?V2xXMjhKUnhpMWpkSTlEdkRUU2hnRzZxOVd6S2RCbGFaUDBsdTFHZWNGR3hL?=
 =?utf-8?B?dnBoWjVtb2VFVkNjdHNJUEp4THNmL0xXVC9DNVNEaWlET3VSNEdsK3hDc3JE?=
 =?utf-8?B?UGF5VFpyNllSSzNTQmRBVnZIRkxjUlp4eXdlM1RBbTh4WlBHU2xvc21TeGF4?=
 =?utf-8?B?Y1U4aU96UmcrQTZTR1VMRkZNTzc0ZWRmakZDbkRpVUFNalZ0dTRPclV2Skp2?=
 =?utf-8?B?czlnZWh0QWt3SE5HU0RHaTlXVkl1VkVHUWFUdlU5LzFVMzQrV1FiQnAzNldJ?=
 =?utf-8?B?Q2tseTN5MElMSEZsU0UxeDdxb3ZmNndILzlKM2lLZWVrRjFDUkc0c0NqdmNG?=
 =?utf-8?B?OWtsZHhhL2UwN29ZanFORkFDeUhheDNsMys0ZHhHN0hWbUhHNVVPZjZSaFRo?=
 =?utf-8?B?WFJyNWV1NTd4Umd6UHhPNm9vZDFadFJXK0pVZ2MyWXJxcnh3MmxWRjNNQWU1?=
 =?utf-8?B?S0ZoVnpOSnA0aXduK3NVNXJGYkJXeVVOK1gxaG1FQ1FHUER5MDJVZnJEdW5h?=
 =?utf-8?B?UGhzeTc1Mk5vcC9pYmRuZjVyMmFuVFpiL2JoaWFSVUxLOTJmeUNaUzhYYjFp?=
 =?utf-8?B?YWU5UGJSQ3hPUERzSC8rMDYvbmRHQndVcDlUVDY5VUhCR1BLVWRBRXdXcFB0?=
 =?utf-8?B?RWh0U1dhaHZLb1ZuZUs0UFlZSGVWZU5JZ1FrQ01qOENoQ2d5VHRsZGt0WjZW?=
 =?utf-8?B?MmhmUVVEL1FMcko3Vy9aTy9ZT0JGenFLbjdCTlRBZm41Ym14WWpreVJ0K2kz?=
 =?utf-8?B?UHlMWXdPaXRsVXhnci9nVnNzemNQY0VmVjhOSjVkaXk2WHZRbTlSWFFKdEtL?=
 =?utf-8?B?Wllta2RMWGlYeDllNzVBMFk3eEdBK2taaC8vWjk5MzVVNjluSU5jc1M2MzJO?=
 =?utf-8?B?amRaTTMrMklJek53aDlpUkZKQkRxOGNsYzh1QXYzcEJkRVNsQStJamZLL3Jx?=
 =?utf-8?B?dGZxU2RpVU1PNjRTOGU0ZEhOWjc1QmpOSmxYOStrYS9YM3MyNnovRmVLWEFm?=
 =?utf-8?B?VCsvZ2diNCthRGNmaWlTelpGODcreHBlb3JSWTViOVE5SFQxSjZXcGFpa2R4?=
 =?utf-8?B?WUE1dEFMdjBhNG5oR01zM2Rpc2UwbmlTMG1QeWhyUS8wWExhNnlLUkRuckhp?=
 =?utf-8?B?UWhsQ05KTkI5UHltL3VhUE94OU1HQ0V3bXBxR08xcHNvS09xTHEvSjVRZ3FD?=
 =?utf-8?B?RnB1S0pmUzM3c3JmRUtheHNwYjBMeUEzaWQ1a2pyVjJkSEJoVDBaVHRCZmdZ?=
 =?utf-8?B?UHhmdnZQWi9BQWJ1ZVdFM2ZVYmlCekEwYTZuZTZFeC9penhkbysrUG45Zmwz?=
 =?utf-8?B?N2JIZHhmVHBXazIzbzFaOGFkVms4eHJiZ0xEd29qSXFONE1tYy8wVE1RajhD?=
 =?utf-8?B?N256N3A4d2hwaG1xREUxdzN2NUxvRDlvNkJaalZ2Tkh3cURocERMTC9TOEZh?=
 =?utf-8?B?QVhaL2dGb25UeERqd1VwYUJVWmZpeTZxTzdhYzkzNHBGdnYxU0lDWE40akRa?=
 =?utf-8?B?b2gvN3lpRnorZFVPM3VyMkRPQkdNL1NXSWliYk5EanJ4WTlOU2VtUmV1SDc2?=
 =?utf-8?B?T0cxSzlDZSt4clhZNGtVZTI2d2RrajR1YmRhejd2TWNuSDE3WWtESExTd0w3?=
 =?utf-8?B?ZnlVNWRRNFd1Sm9ESTRJbXk4RHZ6dlA5MlAySkNvQVFPcDNqdkFNV2gzTy9o?=
 =?utf-8?B?UGd1UmVsTTN4SkJQbHE4R3M1Wkl2SmdZUi9JMFVvNFMrMkR3bDNqcXlSVGtB?=
 =?utf-8?B?WjlWNVZVSUdBPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 19:09:04.0785 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec44facc-d570-4207-9b1f-08dde72f8549
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4042
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

New stuff for 6.18.

The following changes since commit a0b34e4c8663b13e45c78267b4de3004b1a72490:

  drm/amdgpu: update mmhub 4.1.0 client id mappings (2025-07-28 16:39:49 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.18-2025-08-29

for you to fetch changes up to 585b2f685c56c5095cc22c7202bf74d8e9a73cdd:

  drm/amdgpu: Respect max pixel clock for HDMI and DVI-D (v2) (2025-08-29 10:23:09 -0400)

----------------------------------------------------------------
amd-drm-next-6.18-2025-08-29:

amdgpu:
- Replay fixes
- RAS updates
- VCN SRAM load fixes
- EDID read fixes
- eDP ALPM support
- AUX fixes
- Documenation updates
- Rework how PTE flags are generated
- DCE6 fixes
- VCN devcoredump cleanup
- MMHUB client id fixes
- SR-IOV fixes
- VRR fixes
- VCN 5.0.1 RAS support
- Backlight fixes
- UserQ fixes
- Misc code cleanups
- SMU 13.0.12 updates
- Expanded PCIe DPC support
- Expanded VCN reset support
- SMU 13.0.x Updates
- VPE per queue reset support
- Cusor rotation fix
- DSC fixes
- GC 12 MES TLB invalidation update
- Cursor fixes
- Non-DC TMDS clock validation fix

amdkfd:
- debugfs fixes
- Misc code cleanups
- Page migration fixes
- Partition fixes
- SVM fixes

radeon:
- Misc code cleanups

----------------------------------------------------------------
Alex Deucher (17):
      Documentation: update APU and dGPU tables with MP0/1 info
      Documentation: add RDNA4 dGPUs
      drm/amdgpu: update mmhub 3.0.1 client id mappings
      drm/amdgpu: update mmhub 3.3 client id mappings
      drm/amd/display: add more cyan skillfish devices
      drm/amdgpu/discovery: fix fw based ip discovery
      drm/amdgpu: add missing vram lost check for LEGACY RESET
      drm/amdgpu/swm14: Update power limit logic
      drm/amdgpu/gfx11: set MQD as appriopriate for queue types
      drm/amdgpu/gfx12: set MQD as appriopriate for queue types
      drm/amdgpu/vcn: drop extra cancel_delayed_work_sync()
      drm/amdgpu/vpe: add ring reset support
      Revert "drm/amdgpu: fix incorrect vm flags to map bo"
      drm/amdgpu/vpe: cancel delayed work in hw_fini
      drm/amdgpu/userq: fix error handling of invalid doorbell
      drm/amdgpu/mes11: make MES_MISC_OP_CHANGE_CONFIG failure non-fatal
      drm/amdgpu: drop hw access in non-DC audio fini

Alexandre Demers (2):
      Documentation: Remove VCE support from OLAND's features
      drm/radeon: fix typos

Alvin Lee (1):
      drm/amd/display: Add comma to last entry of enum for consistency

Amber Lin (3):
      drm/amdgpu: Add chain runlists support to GC9.4.2
      drm/amdkfd: Destroy KFD debugfs after destroy KFD wq
      drm/amdkfd: Tie UNMAP_LATENCY to queue_preemption

Arnd Bergmann (1):
      drm/amdgpu: fix link error for !PM_SLEEP

Asad Kamal (6):
      drm/amd/pm: Add dpm interface for temp metrics
      drm/amd/pm: Add smu interface for temp metrics
      drm/amd/pm: Update pmfw header for smu_v13_0_12
      drm/amd/pm: Fetch and fill temperature metrics
      drm/amd/pm: Add temperature metrics sysfs entry
      drm/amd/pm: Enable temperature metrics caps

Aurabindo Pillai (4):
      drm/amd/display: fix condition for setting timing_adjust_pending
      drm/amd/display: fix dmub access race condition
      drm/amd/display: more liberal vmin/vmax update for freesync
      drm/amd/display: Fix vupdate_offload_work doc

Ausef Yousof (1):
      drm/amd/display: track dpia support

Austin Zheng (2):
      drm/amd/display: Setup Second Stutter Watermark Implementation
      drm/amd/display: Add Component To Handle Bounding Box Values and IP Caps

Brahmajit Das (2):
      drm/radeon/r600_cs: clean up of dead code in r600_cs
      drm/amd/display: clean-up dead code in dml2_mall_phantom

Ce Sun (7):
      drm/amdgpu: Avoid rma causes GPU duplicate reset
      drm/amdgpu: Effective health check before reset
      drm/amdgpu: Correct the counts of nr_banks and nr_errors
      drm/amdgpu: Add a mutex lock to protect poison injection
      drm/amdgpu: Correct the loss of aca bank reg info
      drm/amdgpu: Add support for dpc to a series of products
      drm/amdgpu: Add support for dpc to the product

Chenglei Xie (1):
      drm/amdgpu: refactor bad_page_work for corner case handling

Chenyuan Yang (1):
      drm/amd/display: Add null pointer check in mod_hdcp_hdcp1_create_session()

Chiang, Richard (1):
      drm/amd/display: Remove update_planes_and_stream_v1 sequence

Christian König (1):
      drm/amdgpu: rework how PTE flags are generated v3

Clay King (6):
      drm/amd/display: ensure committing streams is seamless
      drm/amd/display: Delete unused functions
      drm/amd/display: Multiplication result converted to larger type
      drm/amd/display: Incorrect 'not' operator usage
      drm/amd/display: Array offset used before range check
      drm/amd/display: incorrect conditions for failing dto calculations

Cruise Hung (3):
      drm/amd/display: Remove check DPIA HPD status for BW Allocation
      drm/amd/display: Add debug option to control BW Allocation mode
      drm/amd/display: Reserve instance index notified by DMUB

Cryolitia PukNgae (1):
      drm/amdgpu: fix incorrect comment format

Danny Wang (1):
      drm/amd/display: Reset apply_eamless_boot_optimization when dpms_off

David (Ming Qiang) Wu (3):
      drm/amdgpu/vcn: remove unused code in vcn_v1_0.c
      drm/amdgpu/vcn: remove unused code in vcn_v4_0.c
      drm/amdgpu/vcn: add instance number to VCN version message

David Yat Sin (1):
      drm/amdkfd: Fix checkpoint-restore on multi-xcc

Dillon Varone (1):
      drm/amd/display: Consider sink max slice width limitation for dsc

Duncan Ma (2):
      drm/amd/display: Add eDP AUXless ALPM
      drm/amd/display: Adjust AUX-less ALPM setting

Eric Huang (2):
      drm/amdkfd: set uuid for each partition in topology
      drm/amdkfd: fix vram allocation failure for a special case

Ethan Carter Edwards (3):
      drm/amdgpu/gfx10: remove redundant repeated nested 0 check
      drm/amdgpu/gfx9: remove redundant repeated nested 0 check
      drm/amdgpu/gfx9.4.3: remove redundant repeated nested 0 check

Fangzhi Zuo (2):
      drm/amd/display: Avoid Read Remote DPCD Many Times
      drm/amd/display: Skip Check Runtime Link Setting for Specific Branch Device

Frank Min (1):
      drm/amdgpu: Add PSP fw version check for fw reserve GFX command

Gabe Teeger (1):
      drm/amd/display: Revert Add HPO encoder support to Replay

Geoffrey McRae (1):
      drm/amdkfd: return -ENOTTY for unsupported IOCTLs

Hawking Zhang (1):
      drm/amdgpu: Allocate psp fw private buffer in vram

Heng Zhou (1):
      drm/amdgpu: fix nullptr err of vm_handle_moved

Ivan Lipski (2):
      drm/amd/display: Support HW cursor 180 rot for any number of pipe splits
      drm/amd/display: Clear the CUR_ENABLE register on DCN314 w/out DPP PG

Jack Xiao (2):
      drm/amdgpu: fix incorrect vm flags to map bo
      Reapply "drm/amdgpu: fix incorrect vm flags to map bo"

James Zhu (2):
      drm/amdkfd: remove unused code
      drm/amdkfd: return migration pages from copy function

Jesse.Zhang (8):
      drm/amdgpu: Update SDMA firmware version check for user queue support
      drm/amd/pm: Add VCN reset support check capability
      drm/amd/pm: Add VCN reset support for SMU v13.0.6
      drm/amd/vcn: Add late_init callback for VCN v4.0.3 reset handling
      drm/amd/pm: Update SMU v13.0.6 PPT caps initialization
      drm/amdgpu: fix shift-out-of-bounds in amdgpu_debugfs_jpeg_sched_mask_set
      drm/amdgpu: update firmware version checks for user queue support
      drm/amdgpu/sdma: bump firmware version checks for user queue support

Jingwen Zhu (2):
      drm/amd/display: Add a config flag for limited_pll_vco
      drm/amd/display: limited pll vco w/a v2

Karthi Kandasamy (2):
      drm/amd/display: Add DC EDID read policy struct
      drm/amd/display: Add control flags to force PSR / replay

Kathara Sasikumar (1):
      Documentation/gpu/amdgpu: Fix duplicate word in driver-core.rst

Kavithesh A.S (1):
      drm/amd/display: Document num_rmcm_3dluts in mpc_color_caps

Kent Russell (1):
      drm/amdkfd: Handle lack of READ permissions in SVM mapping

Liao Yuanhong (4):
      drm/amd/display: Remove redundant semicolons
      drm/amd/display: Use swap() to simplify code
      drm/amdgpu/fence: Remove redundant 0 value initialization
      drm/amd/display: Remove redundant header files

Lijo Lazar (26):
      drm/amdgpu: Update supported modes for GC v9.5.0
      drm/amdgpu: Update external revid for GC v9.5.0
      drm/amdgpu: Add NULL check for asic_funcs
      drm/amd/pm: Use cached metrics data on aldebaran
      drm/amd/pm: Use cached metrics data on arcturus
      drm/amd/pm: Allow static metrics table query in VF
      drm/amdgpu: Add wrapper function for dpc state
      drm/amd/pm: Make static table support conditional
      drm/amdgpu: Wait for bootloader after PSPv11 reset
      drm/amdgpu: Set dpc status appropriately
      drm/amd/pm: Add priority messages for SMU v13.0.6
      drm/amdgpu: Log reset source during recovery
      drm/amdgpu/vcn: Fix double-free of vcn dump buffer
      drm/amdgpu: Prevent hardware access in dpc state
      drm/amdgpu: Add helpers to set/get unique ids
      drm/amd/pm: Add unique ids for SMUv13.0.6 SOCs
      drm/amd/pm: Remove cache logic from SMUv13.0.12
      drm/amd/pm: Add cache logic for temperature metric
      drm/amd/pm: Add caching to SMUv13.0.12 temp metric
      drm/amd/pm: Add unique ids for SMUv13.0.12 SOCs
      drm/amdgpu: Assign unique id to compute partition
      drm/amdgpu: Save and restore switch state
      drm/amdgpu: Add description for partition commands
      drm/amd/pm: Free SMUv13.0.6 resources on failure
      drm/amdgpu: Check vcn state before profile switch
      drm/amd/pm: Make use of __free for cleanup

Liu01 Tong (1):
      drm/amdgpu: fix task hang from failed job submission during process kill

Lohita Mudimela (1):
      drm/amd/display: Refactor DPP enum for backwards compatibility

Mangesh Gadre (4):
      drm/amdgpu: Initialize jpeg v5_0_1 ras function
      drm/amdgpu: Initialize vcn v5_0_1 ras function
      drm/amdgpu: Avoid jpeg v5.0.1 poison irq call trace on sriov guest
      drm/amdgpu: Avoid vcn v5.0.1 poison irq call trace on sriov guest

Mario Limonciello (15):
      drm/amd/display: Drop unnecessary 'rc' variable in amdgpu_dm_backlight_get_level()
      drm/amd/display: Add missing SPDX license identifier
      drm/amd/display: Drop unused include
      drm/amd/display: Remove unnecessary whitespace
      drm/amd/display: Remove unnecessary includes
      drm/amd/display: Rename dcn31 string shown to user
      drm/amd: Restore cached power limit during resume
      drm/amd: Restore cached manual clock settings during resume
      drm/amd: Use drm_*() macros instead of DRM_*() for amdgpu_cs
      drm/amd/display: Revert "drm/amd/display: Fix AMDGPU_MAX_BL_LEVEL value"
      drm/amd/display: Optimize amdgpu_dm_atomic_commit_tail()
      drm/amd/display: Attach privacy screen to DRM connector
      drm/amd/display: Avoid a NULL pointer dereference
      drm/amd: Re-enable common modes for eDP and LVDS
      drm/amd/display: Optimize custom brightness curve interpolation

Meng Li (1):
      drm/amd/amdgpu: Release xcp drm memory after unplug

Michael Strauss (3):
      drm/amd/display: Move setup_stream_attribute
      drm/amd/display: Increase AUX Intra-Hop Done Max Wait Duration
      drm/amd/display: Cache streams targeting link when performing LT automation

Michel Dänzer (1):
      drm/amd/display: Add primary plane to commits for correct VRR handling

Muhammad Ahmed (1):
      drm/amd/display: Adding interface to log hw state when underflow happens

Nicholas Carbones (1):
      drm/amd/display: DC v3.2.347

Ostrowski Rafal (1):
      drm/amd/display: Update tiled to tiled copy command

Ovidiu Bunea (2):
      drm/amd/display: Revert "Add a config flag for limited_pll_vco"
      drm/amd/display: Fix dmub_cmd header alignment

Paul Hsieh (1):
      drm/amd/display: update dpp/disp clock from smu clock table

Perry Yuan (1):
      drm/amdgpu: Fix build error when CONFIG_SUSPEND is disabled

Qianfeng Rong (3):
      drm/amd/display: Use boolean context for pointer null checks
      drm/radeon: Use vmalloc_array and vcalloc to simplify code
      drm/amd/display: use max() to improve code

Qiang Liu (1):
      drm/amdgpu: remove duplicated argument wptr_va

Rafal Ostrowski (2):
      drm/amd/display: Add LSDMA Linear Sub Window Copy support
      drm/amd/display: Align LSDMA commands fields

Rakuram Eswaran (1):
      docs: gpu: amdgpu: Fix spelling in amdgpu documentation

Ray Wu (1):
      drm/amd/display: Add Replay residency in debugfs

Relja Vojvodic (2):
      drm/amd/display: Allow for sharing of some link and audio link functions
      drm/amd/display: Increase minimum clock for TMDS 420 with pipe splitting

Reza Amini (2):
      drm/amd/display: Fixing hubp programming of 3dlut fast load
      drm/amd/display: Decrease stack size in logging path

Rodrigo Siqueira (1):
      drm/amdgpu/vcn: Remove unnecessary check

Ryan Seto (1):
      drm/amd/display: Toggle for Disable Force Pstate Allow on Disable

Sathishkumar S (12):
      drm/amdgpu: Check vcn sram load return value
      drm/amdgpu: Fix unintended error log in VCN5_0_0
      drm/amdgpu/vcn: Add regdump helper functions
      drm/amdgpu/vcn: Register dump cleanup in VCN5
      drm/amdgpu/vcn: Register dump cleanup in VCN4_0_0
      drm/amdgpu/vcn: Register dump cleanup in VCN4_0_5
      drm/amdgpu/vcn: Register dump cleanup in VCN4_0_3
      drm/amdgpu/vcn: Register dump cleanup in VCN3_0
      drm/amdgpu/vcn: Register dump cleanup in VCN2_0_0
      drm/amdgpu/vcn: Register dump cleanup in VCN2_5
      drm/amdgpu/jpeg: Hold pg_lock before jpeg poweroff
      drm/amdgpu/vcn: Hold pg_lock before vcn power off

Shaoyun Liu (2):
      drm/amd/include : Update MES v12 API header(INV_TLBS)
      drm/amd/amdgpu : Use the MES INV_TLBS API for tlb invalidation on gfx12

Siyang Liu (1):
      drm/amd/display: fix a Null pointer dereference vulnerability

Srinivasan Shanmugam (4):
      drm/amd/display: Reduce Stack Usage by moving 'audio_output' into 'stream_res' v4
      drm/amdgpu: Fix kdoc style in amdgpu_fence.c
      drm/amd/display: Add NULL check for stream before dereference in 'dm_vupdate_high_irq'
      drm/amd/display: Add NULL pointer checks in dc_stream cursor attribute functions

Stanley.Yang (2):
      drm/amdgpu: Fix vcn v5.0.1 poison irq call trace
      drm/amdgpu: Add new error code for VCN/JPEG new chain

Sunday Clement (1):
      drm/amdkfd: Allow device error to be logged

Taimur Hassan (13):
      drm/amd/display: [FW Promotion] Release 0.1.18.0
      drm/amd/display: Promote DAL to 3.2.341
      drm/amd/display: [FW Promotion] Release 0.1.19.0
      drm/amd/display: Promote DAL to 3.2.342
      drm/amd/display: Promote DAL to 3.2.343
      drm/amd/display: Promote DC to 3.2.344
      drm/amd/display: [FW Promotion] Release 0.1.22.0
      drm/amd/display: Promote DC to 3.2.345
      drm/amd/display: [FW Promotion] Release 0.1.23.0
      drm/amd/display: Promote DC to 3.2.346
      drm/amd/display: [FW Promotion] Release 0.1.24.0
      drm/amd/display: [FW Promotion] Release 0.1.25.0
      drm/amd/display: Promote DC to 3.2.348

Tao Zhou (2):
      drm/amdgpu: add range check for RAS bad page address
      drm/amdgpu: adjust the update of RAS bad page number

Timur Kristóf (11):
      drm/amd/display: Don't overwrite dce60_clk_mgr
      drm/amd/display: Fix DCE 6.0 and 6.4 PLL programming.
      drm/amd/display: Don't overclock DCE 6 by 15%
      drm/amd/display: Adjust DCE 8-10 clock, don't overclock by 15%
      drm/amd/display: Find first CRTC and its line time in dce110_fill_display_configs
      drm/amd/display: Fill display clock and vblank time in dce110_fill_display_configs
      drm/amd/display: Don't warn when missing DCE encoder caps
      drm/amd/display: Don't print errors for nonexistent connectors
      drm/amd/display: Fix fractional fb divider in set_pixel_clock_v3
      drm/amd/display: Fix DP audio DTO1 clock source on DCE 6.
      drm/amdgpu: Respect max pixel clock for HDMI and DVI-D (v2)

Tom Chung (1):
      drm/amd/display: Fix Xorg desktop unresponsive on Replay panel

TungYu Lu (1):
      drm/amd/display: Wait until OTG enable state is cleared

Vitaly Prosyak (1):
      drm/amdgpu: add to custom amdgpu_drm_release drm_dev_enter/exit

Xaver Hugl (1):
      amdgpu/amdgpu_discovery: increase timeout limit for IFWI init

Xiang Liu (6):
      drm/amdgpu: Update IPID value for bad page threshold CPER
      drm/amdgpu: Skip poison aca bank from UE channel
      drm/amdgpu: Fix jpeg v4.0.3 poison irq call trace on sriov guest
      drm/amdgpu: Fix vcn v4.0.3 poison irq call trace on sriov guest
      drm/amdgpu: Generate BP threshold exceed CPER once threshold exceeded
      drm/amdgpu: Notify pmfw bad page threshold exceeded

Xichao Zhao (3):
      drm/radeon: replace min/max nesting with clamp()
      drm/amd/display: Clean up coding style
      drm/amd/display: replace min/max nesting with clamp()

Yang Wang (2):
      drm/amd/amdgpu: disable hwmon power1_cap* for gfx 11.0.3 on vf mode
      drm/amd/amdgpu: unified amdgpu ip block name

Yann Dirson (2):
      Documentation/amdgpu: fix 'in the amdgfx' formulation
      drm/amdgpu: fix module parameter description

YiPeng Chai (5):
      drm/amdgpu: query the allocated vram address block info
      drm/amdgpu: add command to check address validity
      drm/amdgpu: support ras critical address check
      drm/amdgpu: add critical address check for bad page retirement
      drm/amdgpu: fix vram reservation issue

Yifan Zhang (1):
      drm/amdgpu: remove redundant AMDGPU_HAS_VRAM

Yihan Zhu (1):
      drm/amd/display: wait for otg update pending latch before clock optimization

YuanShang (1):
      drm/amdgpu: Retain job->vm in amdgpu_job_prepare_job

Yugansh Mittal (1):
      drm/amdgpu: atomfirmware.h: fix multiple spelling mistakes

Yunshui Jiang (1):
      drm/amdgpu: use kmalloc_array() instead of kmalloc()

Yunxiang Li (1):
      drm/amdgpu: skip mgpu fan boost for multi-vf

 .../gpu/amdgpu/amd-hardware-list-info.rst          |   4 +-
 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |  34 +-
 Documentation/gpu/amdgpu/debugfs.rst               |   4 +-
 Documentation/gpu/amdgpu/dgpu-asic-info-table.csv  |  58 ++--
 Documentation/gpu/amdgpu/display/dc-glossary.rst   |   2 +-
 .../gpu/amdgpu/display/display-contributing.rst    |   4 +-
 .../gpu/amdgpu/display/programming-model-dcn.rst   |   2 +-
 Documentation/gpu/amdgpu/driver-core.rst           |   2 +-
 Documentation/gpu/amdgpu/process-isolation.rst     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |  53 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |  57 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 266 ++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  76 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   7 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |  10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 333 +++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |  28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |  12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c          |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            | 180 ++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |  31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  41 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h       |  17 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |  21 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   5 -
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   5 -
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   5 -
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   5 -
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  24 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  14 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  23 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |  12 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  24 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  57 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  57 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |  63 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |  10 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  61 ++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |  25 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  42 +++
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c          |  57 ++--
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c            | 105 +++++-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |  32 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |  35 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |  19 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   3 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   2 -
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  89 +----
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              | 120 +------
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  89 +----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  91 +----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            | 114 ++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  92 +----
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  96 +-----
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.h            |   5 -
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |  74 +++-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  15 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  73 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_module.c            |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |  61 +++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   9 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  20 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  36 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   2 +
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c        |  56 ++-
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.h        |   1 +
 drivers/gpu/drm/amd/display/Makefile               |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 319 ++++++++++-------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  18 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  28 ++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  35 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h  |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h |   1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.h  |   1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_irq_params.h   |   1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  50 ++-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |   1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |   1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |   1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.h   |   1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_services.c |   1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h    |   1 +
 drivers/gpu/drm/amd/display/dc/Makefile            |   1 +
 drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c |   2 +-
 drivers/gpu/drm/amd/display/dc/basics/vector.c     |   6 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |   5 +-
 .../gpu/drm/amd/display/dc/bios/command_table.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |   1 -
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |  19 +-
 .../amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c |  40 ++-
 .../amd/display/dc/clk_mgr/dce60/dce60_clk_mgr.c   |  31 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |  16 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |   7 +-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |   6 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 207 ++++--------
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   2 +
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |   7 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   8 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c      |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   8 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  87 ++++-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  66 +++-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |  36 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  16 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  18 +
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_sw.c    |   2 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |   8 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |  56 +--
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.h   |   2 +-
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |   2 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |   2 +-
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |   2 +-
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |  24 +-
 .../gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c |   2 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |   2 +-
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   4 +-
 .../display/dc/dml/dcn32/display_rq_dlg_calc_32.c  |   1 -
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |   2 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       | 376 +--------------------
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |   2 +-
 .../dc/dml2/dml21/inc/dml_top_dchub_registers.h    |   2 +
 .../dml2/dml21/inc/dml_top_soc_parameter_types.h   |   2 +
 .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |   2 +
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  28 +-
 .../dml2/dml21/src/dml2_core/dml2_core_factory.c   |   2 +-
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |  12 +
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c   |   2 +-
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c  |   2 +-
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c  |   2 +-
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |   6 +-
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |   6 +-
 .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.c   |   9 +
 .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.h   |   2 +
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |   1 +
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h |  10 +
 .../amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c    |  36 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   5 +
 .../drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.c |  31 ++
 .../drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.h |   6 +
 .../drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c |   2 +
 .../drm/amd/display/dc/hubbub/dcn32/dcn32_hubbub.c |   2 +
 .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c |   2 +
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |   2 +
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.h |   9 +-
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h |   1 +
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c |  26 ++
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.h |   8 +-
 .../gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c |  15 +
 .../gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.h |   6 +-
 .../gpu/drm/amd/display/dc/hubp/dcn32/dcn32_hubp.c |   3 +
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c |   3 +
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |  41 +++
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h   |   8 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  39 +--
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.h  |   7 +
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    | 136 ++++----
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   2 +
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |  48 +++
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.h    |   5 +
 .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |   1 +
 .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |   1 +
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |  72 ++++
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.h  |   2 +
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |   2 +
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |   1 +
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |   1 +
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |   1 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  38 ++-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |   1 +
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   4 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   8 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |   3 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |  21 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |  26 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |   1 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |   5 +-
 .../drm/amd/display/dc/inc/soc_and_ip_translator.h |  24 ++
 .../amd/display/dc/link/accessories/link_dp_cts.c  |  30 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   3 -
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   2 +
 .../gpu/drm/amd/display/dc/link/link_validation.c  |   6 +-
 .../display/dc/link/protocols/link_dp_capability.c |  45 ++-
 .../display/dc/link/protocols/link_dp_capability.h |   6 +
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |  65 ++--
 .../display/dc/link/protocols/link_dp_training.c   |   9 +-
 .../dc/link/protocols/link_edp_panel_control.c     |  14 +-
 .../amd/display/dc/mmhubbub/dcn20/dcn20_mmhubbub.c |   2 +-
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c |   8 -
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h |   5 -
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h |   1 +
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |  18 +
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |   5 +
 .../display/dc/resource/dce112/dce112_resource.c   |  12 +-
 .../display/dc/resource/dce120/dce120_resource.c   |   6 +-
 .../amd/display/dc/resource/dce60/dce60_resource.c |  34 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |   2 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |   5 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.h |   3 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |   3 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   1 +
 .../display/dc/resource/dcn401/dcn401_resource.h   |   3 +-
 .../amd/display/dc/soc_and_ip_translator/Makefile  |  19 ++
 .../dcn401/dcn401_soc_and_ip_translator.c          | 304 +++++++++++++++++
 .../dcn401/dcn401_soc_and_ip_translator.h          |  22 ++
 .../dcn42/dcn42_soc_and_ip_translator.c            |  27 ++
 .../dcn42/dcn42_soc_and_ip_translator.h            |  16 +
 .../soc_and_ip_translator/soc_and_ip_translator.c  |  37 ++
 .../display/dc/virtual/virtual_stream_encoder.c    |   7 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   4 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    | 193 +++++++++--
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |   1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   7 +-
 .../gpu/drm/amd/display/dmub/src/dmub_srv_stat.c   |   8 +-
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |   5 +
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |   3 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |  30 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  81 +++++
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |  30 ++
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  79 ++++-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 | 153 ++++++++-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   5 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  74 ++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      | 108 ++++++
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_pmfw.h   |  74 +++-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_ppsmc.h  |   6 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  | 305 ++++++++++++++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 151 ++++++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |   6 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  30 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  14 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |  26 ++
 drivers/gpu/drm/radeon/r600_cs.c                   |   4 +-
 drivers/gpu/drm/radeon/radeon_device.c             |   4 +-
 drivers/gpu/drm/radeon/radeon_display.c            |   4 +-
 drivers/gpu/drm/radeon/radeon_gart.c               |   8 +-
 drivers/gpu/drm/radeon/radeon_test.c               |   4 +-
 drivers/gpu/drm/radeon/radeon_vce.c                |   6 +-
 293 files changed, 5233 insertions(+), 2558 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/soc_and_ip_translator.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/dcn401/dcn401_soc_and_ip_translator.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/dcn401/dcn401_soc_and_ip_translator.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/dcn42/dcn42_soc_and_ip_translator.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/dcn42/dcn42_soc_and_ip_translator.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/soc_and_ip_translator.c
