Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916999A1339
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 22:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B24710E216;
	Wed, 16 Oct 2024 20:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2KIL8o13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E27210E191;
 Wed, 16 Oct 2024 20:05:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQ+cr8xGWj80CbTPTbJlN3RN9E2tUE/96CQDu2BOXCR9wJsVCruEaerJ822bVXVPghFdatYltnzdtuYPOIvkE4la7+q6jBBs7mrclsNDCRr/axduW98+Y51yThMl+wnvpF97NbmOkno+CWxWHaBdRy2lGwYci7Lm0wzf35t1vLQtR5c9zoVSHWf44Jw0ahsWJAWqNInBEAxaUgz9hca4JF9vHPyFE1IOxjH/wF375z/ry0QY/bpCefEwd9UDxVYKYCgZzBt+bJxU/Ey2VFcv1X9SjQ8kPmRmhNTLGjhzgD8K74BAqiLlgu4AD0Y7u5aLi91q/rhp877XQHun7KSGvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYEkXGC2vZhi6tQPkSvObmwujCKP9yIfOys1GmNai0g=;
 b=TZTkHUp0kp6fNDkwtWxRovHq8dDOiBllZnfiNrD2WTxcZ35MmcbtfomvBpeCsbkNdLd2CTkmqQkZIfcPEZyrqjKbSgrYQtc/GzjbiFu/fLHFfZFmANA8NDtFz2s0NMTdAvQT2yJHLmadI7JXEIv96X3RlkXmd3cNMTrhxVy7tlzgPeuLYVeEasCzquepa9AqwVaY7dEtewT4ga5cQOg6Qi3mGhcX/m4f36MJ3cDRHsQgk+gczSIdCy0lJzLeHRiyd+cTi5H14Xkxs1oZXFk548ZZpJt436mwNplyi57E2PfmfDyvR1DpLMbs0tclbr3LrannuVXeMXrTu/d7MUtiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYEkXGC2vZhi6tQPkSvObmwujCKP9yIfOys1GmNai0g=;
 b=2KIL8o13NR2NQ1Px39NpNQMyEF6x7xLw5e1Wc7/g9GZf/V7hs0kQpH/yOsDf8cEkXpVwgg6caULXFpVoFN/FbEThir+t07RZJYKptwzoRz7P7ECPRIaIzy2PloumlkGQyi+DLQcFwTOx5cHDhbFl8hyT9a1WDEbhSjSy5UzuIYM=
Received: from BN9P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::8)
 by SA1PR12MB6679.namprd12.prod.outlook.com (2603:10b6:806:252::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 20:05:29 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:10c:cafe::a1) by BN9P222CA0003.outlook.office365.com
 (2603:10b6:408:10c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26 via Frontend
 Transport; Wed, 16 Oct 2024 20:05:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.1 via Frontend Transport; Wed, 16 Oct 2024 20:05:28 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Oct
 2024 15:05:27 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-fixes-6.12
Date: Wed, 16 Oct 2024 16:05:13 -0400
Message-ID: <20241016200514.3520286-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|SA1PR12MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: e0b1955f-c99e-4fad-9253-08dcee1de1b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0xFd2RNK0pDOVJvd1k5NFNkQXdyRENYNjRDRUR1TWhtVmFzeVlDYXhxMW1L?=
 =?utf-8?B?NVRUdUpGREZISm9QVmJpT1F3Z0kydzVmN1dnalh5NUtlVzdXcUdqU3dRQXFY?=
 =?utf-8?B?K3E2d05jenFOM3M5ZTNlZWovdHI1NGZ6SFNFMy9IOFpidVZzc0ZaOXFvMXpq?=
 =?utf-8?B?aitrQm9vZUJ6a2dpMHZ0dGVlUmdjeXBWYk0zWXZibHBXS29BMHNTc1NoaXps?=
 =?utf-8?B?c0d6SFdNS0dsTytVeHBhbTdmSnJpYm90R3F0MlVVWXJTZHUwMWY1UzdBMGhj?=
 =?utf-8?B?dmJYekJETmI3bVFTL3hWRUxsWVZvdExMdGRGVzdxZStTRGxRNDBPZ0NVYTg5?=
 =?utf-8?B?VStYVEMybCt4WW91Q2dVdlhlenRDUDZyZCtYQlNxKzY1UHEvajV3MHMvanBY?=
 =?utf-8?B?Z3NGQWNDaWxvY1E2Skh1YXFOSExMbHN5NzUzTFNYQ2xVaWg3Q1J4RWJ5aEtZ?=
 =?utf-8?B?L2x4azhualg0M3FNRU8vR3NwUndoUXRtSWlyZ0JnZjY5Ukwyc2krcEI3R3RT?=
 =?utf-8?B?VE1XblY1b1d3N0E4eXZ4ZkJYZ25KNzU0U0Q1dmczSnR0L2RWUXVaNnJER0xs?=
 =?utf-8?B?YjV0c3dtSWVmQklwV0ptZnZ1Z2Nma25jMHkzYS9sVGpCMkU5aXBQNFZ3UU5V?=
 =?utf-8?B?Qk1Vb0l1aUR0ZDhZbDN2by9CN00yTDkvRFBaMEZoZU1jRUFnTEwxdUVyVld0?=
 =?utf-8?B?T1lyUG9jU2NDOUNCZmw1TGZNNVFjeWpVYnJRY0hxdldrL2Y4emg2QXdxRVVk?=
 =?utf-8?B?TTl2bCt6SWw3TGNXVHh6TXZ2M2p4UkRxcUc3eGhDTGpuUUx5ekpMQXZnOHF2?=
 =?utf-8?B?VmpJTzUzZXZsS3RnMlVmMUZqM2wyMm9LNitzeUtTTjRUaUl2OUk5dVVWdXZo?=
 =?utf-8?B?dklPQldIZXBwZTRveEpmN0hhdFJ6aE5kY1gyUkUxNnYzV281TlRMT3FRTDR2?=
 =?utf-8?B?bzF1YjQvYS9BbTBOckZJM0JvMThQN0tXSlBHK1d2cTlJUU8xL3JVV2poUXYx?=
 =?utf-8?B?MnQvZ2xrNHRseWk2VnlDZDg4VGxFbERDZ3IxMk5kSGUzd2RNTHRnQ0J5SGtS?=
 =?utf-8?B?T0RSZW5oZ0tyVW9FOTBzOVlVeUFwL3lIZFhiTW9QNVhZZittdWNLVzd0dmhB?=
 =?utf-8?B?QkJBYUh1aURUVTZqKzZkZHc5UkNqNHIrRVN1UGY1SXJOQ0hkNmZqeVNuZXNL?=
 =?utf-8?B?OXNpREFodW0ycTJOWXI5Ti9MTVJzN0dIVkhscUc5cVFEZ2Fkck9QWW1mUVZa?=
 =?utf-8?B?WnJaMzQrcTNveFpLUWtKM1I5bnNYQVRCclorbFplNXJKUU5vb0lVSTNDRmYy?=
 =?utf-8?B?RnRiUUxuTTFicTgwM2RaU2s5ZWlzc0NYdnQyLzV5djV2M0NXRkdIM0gzOFNK?=
 =?utf-8?B?ZU4raXNxVmVaUGhkVHlOS00raHhwL1BsSndDcWZPOXJ1UFFpNHd3K2hsWE03?=
 =?utf-8?B?TWxnNTJ2SkFMYmMrOWVISVk2Rit3T1o3THNsK3N1dEtqU09lSEErNGI3VnBN?=
 =?utf-8?B?NDFqZE4yMFJRQmFQTDlIWWYyWGpOZnh0dnVHY2R0RjBwdlJHbHNjeXhoMlkx?=
 =?utf-8?B?QS9yb2xoZjJGRml0emdXOCtFK21LNys4NThlZ1pVNGdvL1g2amR2MEJLRklE?=
 =?utf-8?B?V0s3NnJNQUl2MWtNUFZNK2ljMUNuWnhDRGx5L1liWlZGbDRCa3JFVjNVOU9G?=
 =?utf-8?B?R1VXY0F5b0piZjAySy92c1h1V1NianhpU21WaUJrZDlGVWU0T01xR0ovK1N1?=
 =?utf-8?B?TVFwanRBa3JYTDF1TjlMcnNDY25XOGNYYW9pMGF0UjdWa1UyR0oyb0xDSllD?=
 =?utf-8?Q?A3hebKsNJOSBsxoAXSwxeBH8jT2b/dfcXrsV4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 20:05:28.7116 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b1955f-c99e-4fad-9253-08dcee1de1b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6679
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

Fixes for 6.12.

The following changes since commit 8e929cb546ee42c9a61d24fae60605e9e3192354:

  Linux 6.12-rc3 (2024-10-13 14:33:32 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.12-2024-10-16

for you to fetch changes up to ec1aab7816b06c32f42935e34ce3a3040c778afb:

  drm/amdgpu/swsmu: default to fullscreen 3D profile for dGPUs (2024-10-16 15:51:10 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.12-2024-10-16:

amdgpu:
- SR-IOV fix
- CS chunk handling fix
- MES fixes
- SMU13 fixes

amdkfd:
- VRAM usage reporting fix

radeon:
- Fix possible_clones handling

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: enable enforce_isolation sysfs node on VFs
      drm/amdgpu/smu13: always apply the powersave optimization
      drm/amdgpu/swsmu: Only force workload setup on init
      drm/amdgpu/swsmu: default to fullscreen 3D profile for dGPUs

Michael Chen (1):
      drm/amdgpu/mes: fix issue of writing to the same log buffer from 2 MES pipes

Mohammed Anees (1):
      drm/amdgpu: prevent BO_HANDLES error from being overwritten

Philip Yang (1):
      drm/amdkfd: Accounting pdd vram_usage for svm

Srinivasan Shanmugam (1):
      drm/amd/amdgpu: Fix double unlock in amdgpu_mes_add_ring

Ville Syrjälä (1):
      drm/radeon: Fix encoder->possible_clones

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            | 11 ++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  5 +++--
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  6 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 26 ++++++++++++++++++++++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 12 ++++++----
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 22 +++++++++---------
 drivers/gpu/drm/radeon/radeon_encoders.c           |  2 +-
 11 files changed, 61 insertions(+), 35 deletions(-)
