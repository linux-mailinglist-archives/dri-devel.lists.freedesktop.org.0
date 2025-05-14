Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADF0AB74C2
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 20:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B78210E067;
	Wed, 14 May 2025 18:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wqjMD7KT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634C110E067;
 Wed, 14 May 2025 18:51:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1HpPxtDGyL5LJnKYMEjOcdSuwZRUUuglHz37hSZtu4U6x4+gt7W/4xnGiCLCQdFwFpebpY8zKQ01FCTd68XnFF2BhW+pZNcYgT1Z8w4C+hGJ4K2t6O231zwc8U7aNl882u0DnxVI2Gwgi0b1luP8qC9EjUKEEzxASPseY8lQvGZpSvl4rIvJfGgfOx4KpiMqRxTnE3V6SFfN04k+OhCWr0vAmA9FnmK+UBctx0DocBdH1OEOlDhH341NUzC+RDzA1ytaeietU8un5k78iDODQ7bzYZzgn55qN+JbaWYC3tbs93PQ1rNwBgnYx19Lli6p1FgKjTbJ9mtfJgu0NPUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lY4h+inLOWceSNpngDI2E0hCR4m5g1A9dQFA4LIkOfU=;
 b=B9hWmTji7IMeQZLMpWYXDNKhosQ469LL1F/ygsQgGnijFhWC8BWV7hWhsS8aDny9nd2InpLFY5Ulm5c4euUkfiZsALccxTMJNmxEV5aNWMlkv31KxBY+SjJ0HWSRnFrErQ9d5VJgUVtiw177pX/7W2eHFn3WjtPEPkWzC2/ezFNs9yf8Xmy/IPvtLqm2zqaYtZMJNAXke6AAkjv38kxr+73p2aq9nb8qIstPRG4VqDg6leHMtUJDzRSofOAyHQB9rVr2yi+siTFS1pS8ec/75/E5yRbHpP+IG58G89/mXyhVAJtb7nnGvFC90j3a4nkCsGRtMydwmvBs16A5f6wh3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lY4h+inLOWceSNpngDI2E0hCR4m5g1A9dQFA4LIkOfU=;
 b=wqjMD7KTHhx8g4mVkFQw5O4Ew1dFbumeg0itRRXoGl5OgKBipD9P9Wtv3H8Kjh5eDRWMyx7kTpEKCtqp/d64xjqK1BvGek4ApDr/L/+NyU73xKak63xRSSlCS+wxDtGoz5x+rAoZPw1Ap5fpFvou+vePSPRa8HNsNNL1eDPOjlw=
Received: from PH8PR05CA0006.namprd05.prod.outlook.com (2603:10b6:510:2cc::6)
 by DM4PR12MB7525.namprd12.prod.outlook.com (2603:10b6:8:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 18:51:36 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::cb) by PH8PR05CA0006.outlook.office365.com
 (2603:10b6:510:2cc::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.15 via Frontend Transport; Wed,
 14 May 2025 18:51:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 14 May 2025 18:51:35 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 May
 2025 13:51:34 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.15
Date: Wed, 14 May 2025 14:51:17 -0400
Message-ID: <20250514185117.758496-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|DM4PR12MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b237301-ae71-45d3-ee42-08dd93185a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I7MEcXzZ7bsz5Nr3wcz0EGFsDYNF6jrCSg+1QV3VcONWdJA/fpx7phCYlAJT?=
 =?us-ascii?Q?nE1dXnVbllIU6TjjnY1JXMzZ8Wr8IfENYrsJWrEcaAdAEZBNmgkt0ycCsn2P?=
 =?us-ascii?Q?eOZBlC2ISCtkoEsHLFB/PL85wrfAKtK2nwYn39DHuTYx9snGIl4fFqK0QHyN?=
 =?us-ascii?Q?IpIcoFDDgTC0VYLQB04rvYG5gG85nJeopHfBoVgcRoCTvodWNEXSz4g3WWJa?=
 =?us-ascii?Q?cUtLgadZhG6jibajNKgiBQbA+5Zw4tL1vg2vG/TF9HZ9IhXxJ8iq78cV93s0?=
 =?us-ascii?Q?rlNanIPONuWrxAa4ifyl8s60iJ+0PunEwWkSfos2aFaJSp9yH7B7xtv8d4Nn?=
 =?us-ascii?Q?LFutRKfm+okxaJjFRAE+LqelbhlPmkbZGMptZJXflxqeC3AQwExkD0ryn986?=
 =?us-ascii?Q?crilTPc1opbBzkGyelZxZl4Xnxj/7HXPGYKTmLximMM9alGx0SHVpzlTicx6?=
 =?us-ascii?Q?3V0c56iYlqzDDH8wgUNAijPaRl9oOZrTSo1jBNvI/6UWLe7HtaHGFttIhOx1?=
 =?us-ascii?Q?iTrqNNhvAxU6R+CjZ9hADZryNXCCNOjsmyeM6cVuA9+a3Iv/UC0LVpKMIKRH?=
 =?us-ascii?Q?TBToB0970tvAohT1jkfJK+nK575YiWOczJ6FOkZVFDnWNLUXE8UB9DFap4M7?=
 =?us-ascii?Q?RxyWJa3QaIEZCWUaGGkYC+WIbYrr+Lq2sI1Ga7PQwjxuXMtYhyD4Ll+pHYuU?=
 =?us-ascii?Q?uuT/5NwLUU9CChxkSiGhOUc4Ij2lTflDpiIxbMNG2Jp+k9kAuU40EZl3Oz5j?=
 =?us-ascii?Q?nn+H2TvAkVzGumhi4P7muv8JzKCtWQWIe8BXn2uVue3P7qrWbFZOOL0S+fhO?=
 =?us-ascii?Q?0Wui+A91qRKi2pDhB2ua991R2hqwg1XL4h9i9o2wLxSTbqhEngTskka6fBIP?=
 =?us-ascii?Q?3giWcHA5+/aMaveZFIjPc5+6DhIps0wPIhu5adTOsXZ7e1O6nklCq/N7IYDz?=
 =?us-ascii?Q?toaUTcahfIjX5/hceoAjOjACbd3WFfvNHUUNS2gARNr4bQxg9X1N9AinuLb/?=
 =?us-ascii?Q?xYZAL5PhzqCMr6JkcqTH9pA+bNpkhax1e9BY8hmlGrpFhrpTNj1ITOLy+/hz?=
 =?us-ascii?Q?JMAP2m+cWH13QtJ6dBVTu6OIUvj9btBkTFf42rDXWWnb4ibZQB8Rulm7EPfW?=
 =?us-ascii?Q?ICJvejioraVe2UZYkA7ttBr26xzEJbiflnz8s7RjADNj3E0VAXIrcatMJj0C?=
 =?us-ascii?Q?Owf//JVWSRGw7dS++/ZAuqwgA1OUvTYCRv6bRsyasEGvOyWtcQJ23Cja5W8m?=
 =?us-ascii?Q?Qn54Q2GqYRx7/+UTJamnP2GRt3Z5YHz+ELn4UcXhuOK9neS8jHEzejHmyHc/?=
 =?us-ascii?Q?XI0RpFjGnMBsvQ3b7G+BSLobkt9UKMAYadshfyS7Q3uUFaMsP8l4Jp/rzTeL?=
 =?us-ascii?Q?x5cz5Tk0ajBvfn6lA70/09Krnku2LSoN6M3PiOE7im3ztEV3XsLNhoDJ8rT5?=
 =?us-ascii?Q?WWK9GDPJEO0Aq4qLLwaaRYKVpYtxMtPS?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 18:51:35.7652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b237301-ae71-45d3-ee42-08dd93185a34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7525
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

Fixes for 6.15.

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.15-2025-05-14

for you to fetch changes up to ee7360fc27d6045510f8fe459b5649b2af27811a:

  drm/amdgpu: read back register after written for VCN v4.0.5 (2025-05-14 11:51:31 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.15-2025-05-14:

amdgpu:
- Fix CSA unmap
- Fix MALL size reporting on GFX11.5
- AUX fix
- DCN 3.5 fix
- VRR fix
- DP MST fix
- DML 2.1 fixes
- Silence DP AUX spam
- DCN 4.0.1 cursor fix
- VCN 4.0.5 fix

----------------------------------------------------------------
Aurabindo Pillai (1):
      drm/amd/display: check stream id dml21 wrapper to get plane_id

David (Ming Qiang) Wu (1):
      drm/amdgpu: read back register after written for VCN v4.0.5

Gabe Teeger (1):
      Revert: "drm/amd/display: Enable urgent latency adjustment on DCN35"

George Shen (1):
      drm/amd/display: fix link_set_dpms_off multi-display MST corner case

John Olender (1):
      drm/amd/display: Defer BW-optimization-blocked DRR adjustments

Melissa Wen (2):
      drm/amd/display: Fix null check of pipe_ctx->plane_state for update_dchubp_dpp
      Revert "drm/amd/display: Hardware cursor changes color when switched to software cursor"

Philip Yang (1):
      drm/amdgpu: csa unmap use uninterruptible lock

Tim Huang (1):
      drm/amdgpu: fix incorrect MALL size for GFX1151

Wayne Lin (2):
      drm/amd/display: Correct the reply value when AUX write incomplete
      drm/amd/display: Avoid flooding unnecessary info messages

 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c              |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c               | 12 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c              |  8 ++++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  5 ++++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  | 16 +++++++++++-----
 drivers/gpu/drm/amd/display/dc/core/dc.c             | 10 +++++++---
 drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c |  4 ++--
 .../display/dc/dml2/dml21/dml21_translation_helper.c | 20 +++++++++++---------
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c    |  5 +++--
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c    |  6 +++---
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c      | 13 +++++++++++--
 11 files changed, 73 insertions(+), 28 deletions(-)
