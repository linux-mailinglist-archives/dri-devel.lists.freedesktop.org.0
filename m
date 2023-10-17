Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36707CCEEF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 23:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E5F10E32B;
	Tue, 17 Oct 2023 21:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326D210E32E;
 Tue, 17 Oct 2023 21:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bf4OxQw9uuCvMHx0/BxAN4i5tekn0DzT4hV4N8O1+fBqRD0sRITkMnGDe1qIi7lAG+B+qdfBdLWsmZ5FhHokW+YWSln/QzJcOyXCceZ4GMgWMiW86zZF+UF4CyQbbZRY9rN5URmFAl74iuPd0pT+xLKoiS09ZxoNnvIvUQinmwNTDYlVAWe8+Wh1OGIdZqAsuA4xWdV4HaJ+2ccpVzRIDkDMUrM2EiHi9qv+F9Ey7RpHIcFyz5N/5EjyLWrrQgDRxlvSrHRBwjGv70A6BuGZC+fIMHghHsgfizrj7ZnWl/hlEbQCNpnqO5+IeAg2G0iOlMgMztRtdpN+QvQkjfcHqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDi/X+AMMDMHm0D4yN8wjlygvip4mrBlHLWE51+EoRY=;
 b=gSlEelMEx4vqYmGV30SvlTxOoQysYmlAw81iAo6+jJckFSVOm8Hk+ebrKzXEkZYQ5Eega7S7lZjcBF5YsPzYQ8L2I0GpHY3VeqR/lnDrmuz22qHvjTs6tcdy93JkjW2tQp6ya/qQEdygDyASgEWBYjm9sp6bmJd4vDjGvFm4KU3CX53OMtj5kasFAgnf3ixaXi+VZ8U5uxYMOWVCsVJjn2J0exSVwJZzO7zjnf5am4OGZ4nmETGEjGO9PK6ibTpa2yB7jNXNBOp4kt4dhf3vn76dBuHw81n7xGfCIjIxjrOOiQM24jcd+kWmhMgP1QkmQa41uAH8Qp50UEwY2kxgQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDi/X+AMMDMHm0D4yN8wjlygvip4mrBlHLWE51+EoRY=;
 b=ZGiHw1WF+SQv1IL43j8n6Urm88faSho+nJM6ydj2z4X/aWCIyc7E4bhSFlNRN5BOZv4q8Ttub7ypSD0qonNyiTjQaRHy37qiEwXb+Kbef3S0StWEHcaPPoJVKBpf+Rt7RJ9ECjdyHYGym0y9NpokVxJK7EGXYw7NM/EWVvNPY2A=
Received: from BL0PR02CA0006.namprd02.prod.outlook.com (2603:10b6:207:3c::19)
 by CY8PR12MB7585.namprd12.prod.outlook.com (2603:10b6:930:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 21:14:21 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::32) by BL0PR02CA0006.outlook.office365.com
 (2603:10b6:207:3c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Tue, 17 Oct 2023 21:14:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 17 Oct 2023 21:14:20 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 17 Oct
 2023 16:14:19 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 00/11] Enable integration of KFD with DRM GEM_VA ioctl
Date: Tue, 17 Oct 2023 17:13:26 -0400
Message-ID: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|CY8PR12MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a4c182-a312-45a3-b49f-08dbcf5607de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TIop8iLTLIXtuFAkLm5OAV1WgIFGtHjLDDO4cmoOgabWeIoSvXIwTB6cVKvZjHwkttlcEsXv4Ca+E4WNOzQ0wHXi0N48Y+ub8HEz2V5aHx/CAR033Wq1LJRHRFcTaUQqXNeSBfMfYvN7vNitoVux0mvcSaBhIk3K+6BfelxvApebKbiJS61ZHli7QLEr27u8vAiR6lVt7VFyk9r/5aAK7IfrxJdLRMvBh1Ylhjd2SZ1QqOrFCVD2upVHaR6V46KqDjVv5SQyRJ6I1ouOQ2/eDIR3Da8/cz5koE47LHNj8F6i4LYZSxsPP8xOdMVoTlwXTKE1SmYny3njC1G11dmVeHz4v5td1rQAAFivff7zU+v329R1bU/+CdUokgvSd1ZAY6G89d0maihusBdLDw7f2xiZ+hoPBlULJqLM823bFhyPDF+RajcLukS7I05sqmBC7sVCW1F/h33V+ccZp4iiVrv6m++anJQB9c+q3kEmAhGIy8VMKqBn9vpo8XZIrXmRlBzjeG9k/ROu+uoh0Hu/4Z+395lS1dQdtrM9JZZMYkPNAf7O7kkpnCEy2H6AcY+g0ND1qQloMZQTgBOaHCyilLEALq+WHefjpPPj4aig9nb48aug1gxiby6jwJdfgJk1ajgVRNeXb1BRD27wXZCI/eaHATaDyGo7VfZTLxdcqo7WU/rC5bqnA/w3FbYSFsN5NOTJiGXk2UYbMvFe6Czw8DbXx5shUzgj6LTClanLP/0dwUMdcAxGSJT3YevA/Ytp/rcJBRPFYiXKi04msEDPWw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(82310400011)(36840700001)(46966006)(40470700004)(16526019)(336012)(426003)(6666004)(7696005)(478600001)(47076005)(36860700001)(110136005)(70586007)(70206006)(316002)(2616005)(36756003)(1076003)(83380400001)(26005)(54906003)(450100002)(41300700001)(5660300002)(82740400003)(356005)(81166007)(40460700003)(4326008)(8936002)(8676002)(2906002)(40480700001)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 21:14:20.8761 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a4c182-a312-45a3-b49f-08dbcf5607de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7585
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
Cc: Xiaogang.Chen@amd.com, Ramesh.Errabolu@amd.com, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series enables better integration of KFD memory management with
the DRM GEM ioctl API. It allow managing virtual address mappings in
compute VMs with the GEM_VA ioctl after importing DMABufs exported from
KFD into libdrm.

This will enable more flexible virtual address management for ROCm user
mode, better interoperability between compute and graphics, as well as
sharing of memory between processes using DMABufs.

Felix Kuehling (11):
  drm/amdgpu: Fix possible null pointer dereference
  drm/amdgpu: Reserve fences for VM update
  drm/amdkfd: Improve amdgpu_vm_handle_moved
  drm/amdgpu: Attach eviction fence on alloc
  drm/amdgpu: update mappings not managed by KFD
  drm/amdkfd: Move TLB flushing logic into amdgpu
  drm/amdgpu: New VM state for evicted user BOs
  drm/amdgpu: Auto-validate DMABuf imports in compute VMs
  drm/amdkfd: Export DMABufs from KFD using GEM handles
  drm/amdkfd: Import DMABufs for interop through DRM
  drm/amdkfd: Bump KFD ioctl version

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |  40 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  22 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 207 ++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  26 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 198 ++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  17 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  19 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  31 ---
 include/uapi/linux/kfd_ioctl.h                |   3 +-
 12 files changed, 424 insertions(+), 182 deletions(-)

-- 
2.34.1

