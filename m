Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKz+A7uaqGkGwAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:48:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D89207B84
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D641010EAA9;
	Wed,  4 Mar 2026 20:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YVg7oETf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011016.outbound.protection.outlook.com [52.101.62.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC20610EAA7;
 Wed,  4 Mar 2026 20:48:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNCAzaz+5HPyC8QwxJouH0KxveLpH+zSiWc1VqGDlwMfdZbm8fXeUlnHAtQQH8nxSxk8z8T1+dBeHx50gx/05Y3AwpkTrZUJpoPQfS5U8OFmKyXaSdZOyo8UR0buYctWcWlQjULagb2trX8liOR30Gw5Gpd5QlcU2D/kJCU+JV1sKq1qiZd9kPVJwYtCwyCVDA9G8W69FHR4CGdbVag70oKV1BFDzegmi4ZKEnzC0AKHoptOEKepUpTLFOp72l3YJirpx/TFVuKa6XLwhMRSHmuAy+v5XY1ZmUIBNX3gCuX7cib2ptEtzSpFrXGtfOW6Qxygt97j06L8nT65mqrA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtsGaXDKhBkygaqjsW2Gbgt+Hw9+giaz3QDh1tLDepM=;
 b=mVHRJD5mvgHpnEJMJAUS4RnONr27i2QrSaDRBFMHvv8GDNVeETsk0vhumt62bUqXnB8qmuFYSD9t68RbYMOV4V3JdcavgDK3+yw3Nq6V/O20/mV5edCfZ0D266jvRDLu0jWFpPTc5gFJZqZr97zVip7sC/h2l3MXjV4a+beg/Jjk81NtMZGmr0CuN2uZi/xVS5TGmiUl4cJlaj/9s4f2IEFO/EzjVn7EPkgQvNqvGBhr9hfzIScNtCdR65NX7Vs3Y6KWI7jb5mvRwLPagf2Net/uKKJ57e5nQkWW7JW7Ogk4lXmPq7n1eSDe8KTVpG83mjVWP2ULBqD77742ZAWzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtsGaXDKhBkygaqjsW2Gbgt+Hw9+giaz3QDh1tLDepM=;
 b=YVg7oETf7a6rGTkzHwN0D1j1RPLHKqm0ZAZsDJQMIHcN7ogsrkaNyXBvC7Pti1q7C9l72pUrQsC4iNh+PqgCiljQF23vUqWSg724rJJEtThDCS/J8aLd6ihht7sXOT+xN6V87hYeRHNr1FTPLTk79Aie3EP98GU/SI04//WWrSc=
Received: from CH0PR03CA0343.namprd03.prod.outlook.com (2603:10b6:610:11a::14)
 by PH7PR12MB7453.namprd12.prod.outlook.com (2603:10b6:510:20a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 20:48:47 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::bc) by CH0PR03CA0343.outlook.office365.com
 (2603:10b6:610:11a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Wed,
 4 Mar 2026 20:48:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 20:48:46 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 14:48:46 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 14:48:46 -0600
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Mar 2026 14:48:45 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-7.0
Date: Wed, 4 Mar 2026 15:48:37 -0500
Message-ID: <20260304204837.1937266-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|PH7PR12MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e738cf5-8e08-4ec1-a267-08de7a2f6e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: nlUzD/rUA16gQwaofSS/7L0mjkJ81W/FMQTKxjqONe/1g6VSjdCSCUNhV0Ac/WDik4vpPYE8Hi5jvYvwtAC3c0wWeguQnVBXkxEixIOVpepmqWnbydWVLD1t+GL8lcgMiyf3TAcAPHHQ0wC5Yfbe+CvtXqHN8b3NhS2xqhKRfcu0FaL/FmYjjccEHfzIfXri4ho5HPYGXyOAJUbWaCYH5Mu4AcFyTHj1QN2NI7fFfpSfFJxqt8dfF4ipsuL+pmBnQcgzzV+begQWY75UaC5mm0FeuDxxvPB+nuctU4t7BwfWnEiC0alm3MmF/vOAUbZBpEjo1jk/aX+DsNNvcSIyiuRI+s91zsR3hbrWUtMPa2BN3voXuNN2KB0f+dHnSV/pD1J/0mjUYEB5VRSlh7N4EprmmqkHUx/QV4xnjNPHEVgVUV1HDhnfU8g1BFI8c5prao16vcmLZyZE9AB87pQpdQ+1E4h8rC1gQl18dS2WSmXDvW7HiM09H9AwV1Oesv9ZJF46f3pDu86VxrM5wkpDFhZ3mTR8N5HxZ8v6J0Q14iJWM3JWu/swzSYaHc3c93AiGWH1mXrymkNcwXLZyPVvij/thLvasUT9T6WI+5XNOd/7MxXduxycsiY2TDzFFXURfwGVGY7HSckAtdkX60zlDUIRrohh9Z2V5g+kEaEwXCFCvQDN3VH8PF46Qv4/XovgPbJt2VbpG5NSk6yv0NsKg9mCWvhoPdhOpI9ppUscnfQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kGqUm0BNYUAMd7yuYSttWqyqA3+l3UlZgK7JgF6S8/2Lj+xQvSy3W5LBWk12qRReOlNhXHsShrX6fqws1kpdru6ZtDm7U5rQsfUnfFv2NUg4iHgqNI+vNDA3oRJ51c5qUnjhtoj8UVNfDxbgJyHxz1wWFpKVRFqGCUAhxnzjv92GjvRTLPCWg/k539Z1cDbev5VAyvsLroLen73nLcMEnXZbp1PetXr6/Zkn4LasMxZ85kinvWZluFzonhilFhMZdry02lRO+sRueQopxpW9HEwzGcX2KkAR1GtfcZcv/IaKkTLTEo959BFDJVpboEGphpJbotvFFNY2dyDBVMp3uwTciqtiphsMBqrcK/isFPcM2w61Cbd7qnPzOAKHr0X1h5Y9gJZWAzjwP8t746hN0noVM9veif8fT3r6m/w9kFnjxhnoC9cYcbS3wmnOoo/d
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 20:48:46.6912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e738cf5-8e08-4ec1-a267-08de7a2f6e66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7453
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
X-Rspamd-Queue-Id: B1D89207B84
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Hi Dave, Simona,

Fixes for 7.0.

The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-7.0-2026-03-04

for you to fetch changes up to 65b5c326ce4103620c977b8dcb1699bdac4da143:

  drm/amdgpu/userq: refcount userqueues to avoid any race conditions (2026-03-04 13:15:00 -0500)

----------------------------------------------------------------
amd-drm-fixes-7.0-2026-03-04:

amdgpu:
- LUT fixes
- VCN5 fix
- Dispclk fix
- SMU 13.x fix
- Fix race in VM acquire
- PSP 15.x fix
- UserQ fix

----------------------------------------------------------------
Alex Hung (2):
      drm/amd/display: Use mpc.preblend flag to indicate 3D LUT
      drm/amd/display: Enable DEGAMMA and reject COLOR_PIPELINE+DEGAMMA_LUT

Alysa Liu (1):
      drm/amdgpu: Fix use-after-free race in VM acquire

Dillon Varone (1):
      drm/amd/display: Fallback to boot snapshot for dispclk

Sunil Khatri (1):
      drm/amdgpu/userq: refcount userqueues to avoid any race conditions

Tvrtko Ursulin (1):
      drm/amdgpu/userq: Consolidate wait ioctl exit path

Yang Wang (1):
      drm/amd/pm: remove invalid gpu_metrics.energy_accumulator on smu v13.0.x

sguttula (2):
      drm/amdgpu: Enable DPG support for VCN5
      drm/amdgpu/psp: Use Indirect access address for GFX to PSP mailbox

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          | 116 ++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |  42 +++-----
 drivers/gpu/drm/amd/amdgpu/psp_v15_0.c             |  20 ++--
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |   6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c  |   3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  16 +--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   8 ++
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   6 +-
 .../drm/amd/include/asic_reg/mp/mp_15_0_0_offset.h |  18 ++++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   3 +-
 14 files changed, 172 insertions(+), 88 deletions(-)
