Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ABE85352D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 16:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0683D10E7D5;
	Tue, 13 Feb 2024 15:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="biCTxmX6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3FC10E7F8;
 Tue, 13 Feb 2024 15:52:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VY6zrQUIqbKIbKSZQhhgqU2E93u4GKXtdQaWsAy8N5ZIH82PJLv2znPJxOTwd8RgtNBQrYjnYb/RcSLI5r8zs/fEPIQkN0hIBaaG+1lR9T6hvuABNCCxMgMz5it0RQhKFJkgCKZW1w7YRWaY7NAoxDiGWHN+jZQMjBKiGlhRUunVXsByTHNpRIKaPQ9S/3Y5IGWK/OT7hyjS9nPsga7u/P8fmhObXTR05+h9AVTqj2OIFhwUH5w9EMunP3J13I7vnIw01+CRxQIHgR7PFIZ3/8LZaeBCsnxQWrkwsV87TrPNmQ1IDiqjj4sjouSOD72pW+hTZ3hnftMIXDJvsYRcKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7jFe7sbDFC8g+iVL+61kDWJcJ94dzZAgNLl3+StFfc=;
 b=Z/pJ/nGFWicGjbToBny7zVqIHry+Nwq8RgwttQF6w7UniQLY8+Ac+0qOEsS8vRLzQEYmcCa9uFjdGp2+9d0zBxrrZ/RoCOrmy+NxHWcenlQClhauuIw1ICbm7Zc8B+CTP17FD2+4taPCuzRui9i+eMStOrnPbofMJD13IdRi0sHjDnPNQ3nDChGtgcXTlozQXtP83Mtgo92fymfbivBz6FI0OGnjgFmGpdxMI9Zm1SIpp6Ed+ElRlaEVbKOr+pHw3nl5m37Uz2GObipwNmXsnvIpCtUHjzJDl4hNLgKUu3fMXKA9n5t2vSuO+02F5+/20AExq0TxFmHAluGXzwBQVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7jFe7sbDFC8g+iVL+61kDWJcJ94dzZAgNLl3+StFfc=;
 b=biCTxmX6krTy7y4eaKLxQU24rpW5f0c2Yv1FNLGJsjbLgzARMjnV1mi4ISP6GuZ0TevWcY384bJ2aVLDl5RxqIqBxnhB7+sV4y0E+gw3Hb/sSgSrPk+291R8Z7qcuBU2KvR5Y6xptGc4mzDTiRocmzPlHZohJ0nmiUNAG7/O3kU=
Received: from DM6PR12CA0018.namprd12.prod.outlook.com (2603:10b6:5:1c0::31)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 15:52:14 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:5:1c0:cafe::f2) by DM6PR12CA0018.outlook.office365.com
 (2603:10b6:5:1c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Tue, 13 Feb 2024 15:52:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 15:52:13 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 09:52:10 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Steven Rostedt <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v2 0/6] dma-fence, drm, amdgpu new trace events
Date: Tue, 13 Feb 2024 16:50:25 +0100
Message-ID: <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|MN2PR12MB4061:EE_
X-MS-Office365-Filtering-Correlation-Id: f41fd065-f2aa-495a-b99a-08dc2cabbf31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FlxAWIne639omW37PPXrAw+8wPOWdEwfJTXP+iEWRr6gPuZ/Silzt+ZfwO341BVrdfzP3j4qRTu+ajRhUSwbXojlfJ10WkxrZu/p1IBaAD7sLAmxY3NyJP5KmawN27VlPWnxGNZarvv3VFSxrRjcwd5JCg66RL+VqAtI8uTCgzgTSCXwOtCg30IkYoVG5QXQA94yzkTBm5saHUl5M2u1aLqk/MK9kQdnIYmCmozUPkNECsbPfTLd0e+NWVCHymMx3jSZoyRA4gMjh+hSfOTNICDj9UnXLcn1IVuO4zk95kGUKRwt11JR6gmpSm6o4saJpwJNTbsbz3v9fV9fPyyE8bXbYHj0DnAMrkSwJF9bYHEHSIjIqqJHnTorY/IDDl5LrAWSj1HrfnrQM4XPgaxukz7aGCyP2EhdGS9dNcuVEij6+8xOFyEBZsQLDCsWBrzfaVGTKvsBDLgyNnEc8fvafxGQ6oC7LBSF9fzBSDa7FvM+Z4VskBP1bnXUe08YhmS2yY2vOx3u9V4AGmS6v6Gz52WUH4NbmORIAYOryt+KaZk1So8gtLb+V74ielJk9eX9SxAq9x82Eh/SeUnImrRtf/Za83wmkbJcMlIcFcsyZq1ZFx9TsYzH6DUShh8FAc3mQ9Zr8uoblMzeGybC046e3f5OEAyMEEr8OE6cmPx/ZpI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799012)(40470700004)(46966006)(36840700001)(2906002)(478600001)(41300700001)(83380400001)(966005)(1076003)(4326008)(70586007)(8676002)(70206006)(16526019)(5660300002)(8936002)(26005)(336012)(36756003)(426003)(921011)(81166007)(356005)(110136005)(2616005)(6666004)(7696005)(316002)(82740400003)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 15:52:13.7723 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f41fd065-f2aa-495a-b99a-08dc2cabbf31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061
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

This series adds new events to make it easier for tools
like gpuvis or umr to graph the GPUs, kernel and applications
activity.

UMR patches using these events can be found here:
https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37

V1:
https://patchwork.kernel.org/project/linux-media/patch/20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com/

Changes from V1:
* uses trace_dma_fence_sync_to from dma-fence-chain.c
* new amdgpu events
* new drm plane commit event

Pierre-Eric Pelloux-Prayer (6):
  tracing, dma-buf: add a trace_dma_fence_sync_to event
  dma-buf/fence-chain: use trace_dma_fence_sync_to
  amdgpu: use trace_dma_fence_sync_to in amdgpu_fence_sync
  drm/amdgpu: add BO clear event
  drm/amdgpu: add a amdgpu_cs_ioctl2 event
  drm: add drm_mode_atomic_commit event

 drivers/dma-buf/dma-fence-chain.c             |  4 +++
 drivers/dma-buf/dma-fence.c                   |  1 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  8 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        | 16 +++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |  8 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      | 11 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h      |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     | 28 +++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |  4 +--
 drivers/gpu/drm/drm_atomic_uapi.c             | 19 +++++++++++
 drivers/gpu/drm/drm_trace.h                   | 28 +++++++++++++--
 include/trace/events/dma_fence.h              | 34 +++++++++++++++++++
 14 files changed, 144 insertions(+), 26 deletions(-)

-- 
2.40.1

