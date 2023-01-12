Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D715266686B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 02:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3E910E2D7;
	Thu, 12 Jan 2023 01:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A0010E0D8;
 Thu, 12 Jan 2023 01:32:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1VnR8WaPHN9aFT4hCaeP3TGdvVjO4waSLVk5PeoqYDKNlnuaIbrvY8t2phn/lD/oVjkmM1dst1zhHmZKWqJR4PGL+/gdKYf5oD5KBJ4jrilJibkZsPuGL4lxWJFoH0eoPUe6zH3gYbMmEYTc19jjtvsbrsR9KpmIHT2HaNUGMW/ySDTgAbVa/j5kxlpz7xu+IXfQ070W52OpngEU3LDniq2oUOjqcg5HvVrbppkNzCxOmkV7EvP717Xw4pOBU28R+D3MEUeqHds3HGR1yWG5W7ze4B7tUzIx4EnSCE1ZAcc0HwBerM2CrAl/aicjEn6rk+kkcTPd3Dbu/IQoM5z/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/j00fQtzXuLQAONZ4rgjqYke3MyY/Lo8pQQmCtSztg=;
 b=Gg371b8Y5RFj7T4rJKKoDfgxj4JwIljT5etHcKOvJZSbGPWQkI+oxSslCHR7+D7sSU5cMAzO/ClBfGZDB996XoHtLn+s6tjLqG5T3X1aPM3jIohrv1K+xVWDjEgyjM/Qf4PyxFwa1F7pypAMSNl/0iHrdlG7eDg37KkjS2lWPzOL+QPL38EKhmUQZS5PgjNeBRu23H2HHGimnU1hb2pHXsnl+W0I7nIk0oHC6YAI2TsOfb7M5eyqCyF3Pg96MDWPu3AnK41WiTfelVYYIG7wQX5sXzO1OMfSYBgz0t9BSxthyToDK1FE28RR8d67zf7SYCrq0RoJG7Gc8S/OwOCdrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/j00fQtzXuLQAONZ4rgjqYke3MyY/Lo8pQQmCtSztg=;
 b=hZcG0zNz5O5PPAdOZW4VenaxqMWm/5CtAPZ3AdqawJFu6p3zo/SSyi1AvYOgrCAFgOGADaYslq/6eJfNGS7zplUFkPKA/Q9CF/ATg4YlxfttE3c0cqTophythl8JRiohCIT4cIlvVrDnG8Ley+Iau94rt0FE4CjAuNylIRI88L0=
Received: from MW4PR04CA0165.namprd04.prod.outlook.com (2603:10b6:303:85::20)
 by MN0PR12MB6197.namprd12.prod.outlook.com (2603:10b6:208:3c6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 01:32:26 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::bb) by MW4PR04CA0165.outlook.office365.com
 (2603:10b6:303:85::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 01:32:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Thu, 12 Jan 2023 01:32:25 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 19:32:24 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/6] Enable KFD to use render node BO mappings
Date: Wed, 11 Jan 2023 20:31:51 -0500
Message-ID: <20230112013157.750568-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT063:EE_|MN0PR12MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e4ff54-48f4-4260-de48-08daf43cdc5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VdOLcesm7gpJDP7mA+h/0Ln6WU488UvsAUZ8PmHVtaOS9t3vzU6WHuodgLC2DaGXpcgS5tPI7M2iBKl4veu/EJFy0YTrqfEAeT5/2Jx1GqBhN6IEvAMhjeQJtXfMnM2k7HX1PRr+5T2DOw6HtorXCxY/UbrI13w1rKzOicU8/6xexdTxxXVnD1iG6zLRQIf23s5e0Gd4a2Cz66lTavqql3oMNObKtVcUAIXIRyCLgVOz/oOoVXlwD0/8dW4I2T3Fz+vLizELr8OB+jnRH1YkBXxQWHeba+LN6mIsif2v3YDJes4ZZ6OBroHU0XNJ+D86oJzN9UGbP4E+strnA/XiDbxlruj4x1hdWhGn9xI9RP6ssBqNQSKL1aFGyVUgHe4/0E5LsNqutd5w3TwK9UHs6uy1YL3+3g2aAZWyM2IlZ91ia8iTzdl4w7pyakzBXP0s0mSvNiNg4+xjUXNnjdUEGfqwFac5asGB4wkL3bh8QeWNevXkWiZ1++/7a9VSgvvVgGYo38bCwLpXoI1x62ZD3XubU+zz/hV/tEZlsO05xLN2/z+P/ZbPg5Ig0h140OtyQUms8xpCnjha8GiemZDz/oog3XBaP4XuTa3RevatJcVePJgaIA+nZf3B2UgGmbjzInjObJQhKfDgepmA3k6HvdoJmVYL6BEPHbymVNNygcQiJo6k2hyb17j7N9qPN5aZ7O7M+jm8zhjHmd30ekz83WdZGZm8jFHOz3SzYaAcoCqlqhMzfXi3NkIGAH87dz02/79BtLkFbkGV6YKzSi0Q1w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(110136005)(66899015)(2906002)(54906003)(4326008)(336012)(5660300002)(40460700003)(36860700001)(426003)(47076005)(86362001)(36756003)(8936002)(41300700001)(8676002)(70206006)(40480700001)(70586007)(82740400003)(356005)(316002)(81166007)(450100002)(82310400005)(966005)(83380400001)(7696005)(16526019)(2616005)(6666004)(26005)(478600001)(1076003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 01:32:25.6579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e4ff54-48f4-4260-de48-08daf43cdc5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6197
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
Cc: xiaogang.chen@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rebased on latest amd-staging-drm-next. This is meant to be the final
review of this series, assuming no more issues are found.

This patch series enables KFD to interoperate more closely with DRM render
nodes. ROCm user mode already uses DRM render nodes to create its GPU VM
contexts and to CPU-map its GEM buffer objects. This patch series adds an
API to let KFD export its BOs as DMABufs, so they can be imported into
the DRM render nodes. This enables more flexible virtual memory mappings
using DRM_IOCTL_AMDGPU_GEM_VA.

Patches 1 and 2 deal with the exporting and importing of DMABufs.

The remaining patches let KFD validate and update GPUVM mappings managed
through render nodes.

The user mode side of this patch series can be seen in libhsakmt and
KFDTest where we improve integration with libdrm (initializing
amdgpu_device instances) to enable DMABuf imports into the render nodes
representing KFD GPU VM contexts. KFDTest is modified to test evictions
and validations of BOs mapped through amdgpu_bo_va_op:
https://github.com/fxkamd/ROCT-Thunk-Interface/commits/fxkamd/dmabuf

As a consequence, applications using Mesa and ROCm in the same process on
the same GPU will now share a single render node FD and GPUVM address
space.

The DMABuf export API will also be used later for upstream IPC and RDMA
implementations.

Felix Kuehling (6):
  drm/amdgpu: Generalize KFD dmabuf import
  drm/amdkfd: Implement DMA buf fd export from KFD
  drm/amdkfd: Improve amdgpu_vm_handle_moved
  drm/amdgpu: Attach eviction fence on alloc
  drm/amdgpu: update mappings not managed by KFD
  drm/amdgpu: Do bo_va ref counting for KFD BOs

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   2 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 196 ++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  55 +++++
 include/uapi/linux/kfd_ioctl.h                |  14 +-
 8 files changed, 219 insertions(+), 77 deletions(-)

-- 
2.34.1

