Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7C9A3FBC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 15:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8669910E927;
	Fri, 18 Oct 2024 13:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uISQxq02";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1707E892C1;
 Fri, 18 Oct 2024 13:33:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbo9BWsWL2/7EOxrIKY0mBjtzplDD8kU5+kr3Xb9vhUzJUh7IXNBd+4Mfsk1DkU38W0whX+YISRkPagGulNyPoIeQRAy8Y4c9zgiNPKTGgtvMfTTXY3iXKcIlik20nPik2y1zjXddsR7t3fv/tI/Jgea50HG/kiP+Dn60UHUByllgy+OPM2gSPySYBuisk0CjExIseWIHiBAehb4/egY8mM7mvelu7BqQgmb2dqnHpfCUTL+z0eDtCxWHlbN0c/9Bg4rzmDGCJ+jFRW2MikBbyu04yqz19INo9O6o8Tot74HiNJcdrXS98M0OIoXzpdsr6VdWTn5JdxL7mQcCSUdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X40RNs+sb3zYHuE3CBItAD2LHtNwft0TyXkc2fr4+Ps=;
 b=wbFv8k7jlMJhBxHsfKD1iejSPdzT5vy+ayirM6zb9c8XuLtYIsIqay+owo4dZ9ATHLdMHeiGlSRg+zz+T2SgEhzk8CVsS9G69vUV6qG7/Oab0e3DGXRSiO385jvS9SZBkgl4bqQuIS/kGi6XKiy6NlpiI3ao/C9j2nyksALnnrHG2xHkZ8Ln6TOt4REF7jTsjggUFc6wdhYjhS/k7duWM1u6I5JlWNJ7miYMHnVDAdZXkOi+j3nCzb35S4dReTNfOOOky1d1ThnvJwnvTuBa3zCMmvwuTBaVjGYt4qncolG51jZVxcuc74cV04WmNPf9V4p5kx2b6nQpKQetah9NuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X40RNs+sb3zYHuE3CBItAD2LHtNwft0TyXkc2fr4+Ps=;
 b=uISQxq02yvyvUkDw9o6H9PWsoFhx/CZQbehcS/NVDp7ykBxq08WInd2Vs2ryqgNgdj60nhvV471Orh9/od7AzpH/yx/eAfzZ6LcgDKlSjr9KCNDD+JSv9WrCXUUBFPAQbmYC5wJhla46Rshb5uFztlmSx5IR12s/IUY8ZNVDwnk=
Received: from BN9P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::15)
 by PH7PR12MB8425.namprd12.prod.outlook.com (2603:10b6:510:240::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Fri, 18 Oct
 2024 13:33:47 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::22) by BN9P220CA0010.outlook.office365.com
 (2603:10b6:408:13e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23 via Frontend
 Transport; Fri, 18 Oct 2024 13:33:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 13:33:47 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 08:33:45 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>, Yunxiang Li <Yunxiang.Li@amd.com>
Subject: [PATCH v5 0/4] rework bo mem stats tracking
Date: Fri, 18 Oct 2024 09:33:04 -0400
Message-ID: <20241018133308.889-1-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|PH7PR12MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a9b4c8c-6ca5-4848-82e5-08dcef797ea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SZjQAYClH2tu2FW6x8DiNyNNeMqdglnN9S3VCBiZwKo/UFHzlUIG8ibMZ23x?=
 =?us-ascii?Q?jptZDpSlR20SWGkyNKUhxL+fM4Qo4gM4fXFNfznm7+lGbt2BGuMquCZy/vGo?=
 =?us-ascii?Q?pNayL7XLaXIFcJlEQJjSf43dmY6VJoce0WDl9gB1arTcua3TFauOq7BsDLFz?=
 =?us-ascii?Q?sN2Mtsc5qC2lFjONLR1Bknn7rDaj4PsrXa1VxIIhc1u2FnCQiWgKf7YVrdFv?=
 =?us-ascii?Q?Vv9Zkbosl9MY4HxKsLO7BrtjM5rYg4LJLUvB3U1piCF7aVN2G7wtJHg6PEO0?=
 =?us-ascii?Q?M/gfdFqrpAjp9YpvylzwUa6P/iF2LTRpKJrYDYbkUd7wSH5vC/LiTEbeyI86?=
 =?us-ascii?Q?NeVB6aKhvKGUJixthK/tz9UYL791GzQMbBmuBDuMCR9TS5XZrnshG3lqtj1E?=
 =?us-ascii?Q?KxK3ZyxmHjDPIvlXlhrPk9tX0u+z3tA+QnXtu8SObCjnxq4qLGPRTBrQB31W?=
 =?us-ascii?Q?nn2C/K+4aFHcxAZFq4qLeri/68HMhNhvpKWsvItox1eQG67k8MYQkZvhRdfo?=
 =?us-ascii?Q?kyw2i1gTLstWZQxfrAEwblYBk53pv6VTxjLR1s7W4FZ+RtwKbDkJRdtN6+fJ?=
 =?us-ascii?Q?N1yK+Svv9nFiZg0n54G60yiSjtP0HEw5bSIO0O58NXtH/U3RT225NAa9Y3o8?=
 =?us-ascii?Q?9j4CHK0nhhXoGmYCrEWrphHRIgbbjv8hqUHNbv/1/h/SZbmVN1H3aGDeTq14?=
 =?us-ascii?Q?b0HitovrxJHXRrY33hMCf/IvpUMCeX/D3ffHm+HGt5tcKkfcKSd88qIdKLjO?=
 =?us-ascii?Q?rLTTpRm5wdh/j48xE3JxGS4myZfS28vFihyCN1I5n6k/Fmb2rU0csPA3JmJ1?=
 =?us-ascii?Q?MzwfL0In8CWNvhBIrUMlDuPEDKKKHM4aZ8nqE/IjQfvlotPKoI0h1UppXIj6?=
 =?us-ascii?Q?irFPJXQ2wb68xCJ8iT/fPoXe0VNhCsB7DiR/mdlgi/eCjrPCe1pdzSnh+nsj?=
 =?us-ascii?Q?JdCZQGDqeXb/9+Sx4Bl3uzIKMQxqGIs6EyQrBzaESOZhgizs4r4Xc/ngJESc?=
 =?us-ascii?Q?NU4i4fuBpJEL1y5HnC7v+t9x4Wnzdz7Xlo6rfLKUhFvGbSthZ7xT38iep1x3?=
 =?us-ascii?Q?Eqh51BAH9H04XRKYLQxFHMIvktFEsDSjGgkeq9jlyJriOg++gHGr/zoz9Osj?=
 =?us-ascii?Q?GeKqjy5kYGiWCeAPFb/d0BW82dv8O6lfwmNfSVQbD06Fq5MqEaKKA4oxQhPx?=
 =?us-ascii?Q?M7KlLpioemIZDmTCWANlTbWZXoQ/+DdlteFyP/0hiLd0GUjDPSuuPdCr/t7r?=
 =?us-ascii?Q?SlQhA+u0eHy6MMSN4/hPUIB7MEWYlKce6T5hCGvYMSOFZ2+C4YtgqH/mFGHh?=
 =?us-ascii?Q?KcTOxMyPWp3W1GZryh1BMSMcvwt13n2w6WvFLAeXsCeq5NSNpDbzka9Z2lub?=
 =?us-ascii?Q?aq6e9A47VIA7kgT3klglunfVZc3czBRShP2/E2SaM7tZXTFhtA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 13:33:47.3869 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9b4c8c-6ca5-4848-82e5-08dcef797ea3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8425
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

Right now every time the fdinfo is read, we go through the vm lists and
lock all the BOs to calcuate the statistics. This causes a lot of lock
contention when the VM is actively used. It gets worse if there is a lot
of shared BOs or if there's a lot of submissions. We have seen
submissions lock-up for seconds due to fdinfo for some workload.
Therefore, rework the implementation to track the BOs as they get moved
around.

Also the visible memory stat is removed to simplify implementation, it's
unclear how useful this stat is since kernel map/unmap BOs whenever it
wants to and on a modern system all of VRAM can be mapped if needed.

v5: rebase on top of the drm_print_memory_stats refactor

Yunxiang Li (4):
  drm/amdgpu: remove unused function parameter
  drm/amdgpu: make drm-memory-* report resident memory
  drm/amdgpu: stop tracking visible memory stats
  drm/amdgpu: track bo memory stats at runtime

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c  |  24 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  94 +--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  14 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 208 +++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  27 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   |   1 +
 drivers/gpu/drm/drm_file.c                  |   8 +
 include/drm/drm_file.h                      |   1 +
 11 files changed, 241 insertions(+), 159 deletions(-)

-- 
2.34.1

