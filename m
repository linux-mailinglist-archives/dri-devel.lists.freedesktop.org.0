Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C156304A5
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 00:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCD510E81A;
	Fri, 18 Nov 2022 23:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821CE10E82A;
 Fri, 18 Nov 2022 23:44:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kfu7DQmotzfr+jFM81PgqdCboAW9IAI77kdaONvTajE3rWoMOblUxf1qBerNYsqUiNst3PLEhkNZVP2tFjpXetaQrebYwS3fBTumEUBlWEkFm9EW6YY8AY1zW9FTC9uArRM0YPnXC2MK78swnTZx/AvESLdATQ6GFUijhV3GJHsJuyKWYycSsJFIE65ZPdxkurf9Vd/4J4KFDsGDGagJsWI1RkXzrNnJAgbXWbwX9DPXgol7gyCccy3i/Yd/fwPJyDzlUYCv4kGK4wknpvDW9EmTX9AZMBu39J2VJhLIOkBsW7kczsDGd6qG18kJf3nVTrfYBMlp6T0YSSLxZo3STA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjHxIJsM/sjygUqksT+pIQH+inf4IbedsfM7PT/tDIQ=;
 b=Z6xtkuZYFpqpwja3ZkZ40eZFAuJ4gd5v0UcZjEeGlXeHQc1e7N88AbvDmIXuIRN5eDxSbU2GmQ5ihGe3G2vCaXfoAL9jwbxOM1rJkwU2Erxc40MMfyT0EzdAAjKHps179BZwdzX9/TJjNYm5FFioVRzdkLPt5Qkt3Fo2+7Lcnp5MHoXyhs+03AN6nsfxYNTRXxhrd4EtiWhXl7+KT4TXezFBR6jZtThrPed3bXTEPwBvwZuVT44rUhK9oJDs2tG5NXZ17zoaLZXKIKVAt3zrWIo2M6jH/X9PZz7lzhPq8ePdMRD8OvSbPF9bxcl0QWpVEOre5Y/i+3NKRSSmR0uh4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjHxIJsM/sjygUqksT+pIQH+inf4IbedsfM7PT/tDIQ=;
 b=gM+Hq4tQMTjUxNaGngP7q1FUqaCvt83dTuKa0O2+2VG9Ib4u//9t8ilQTt3duG+HriU1MQs9zY+MCqh9vAA7ehITNoRszdb2wCTjAsRFYEiiuc2Tgno7epJKe2UiSO4OX74jxzPqWUiU1Kd2YaMbs4a6fQ/8IKS/QWznw1cg90c=
Received: from DM6PR03CA0062.namprd03.prod.outlook.com (2603:10b6:5:100::39)
 by SA0PR12MB4494.namprd12.prod.outlook.com (2603:10b6:806:94::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 23:44:35 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::37) by DM6PR03CA0062.outlook.office365.com
 (2603:10b6:5:100::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 23:44:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 23:44:35 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 17:44:35 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/6] Enable KFD to use render node BO mappings
Date: Fri, 18 Nov 2022 18:44:16 -0500
Message-ID: <20221118234422.1468806-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|SA0PR12MB4494:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e7dc025-a780-4194-4caf-08dac9bed98c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zTCmHMDDWJ8pBkI8tUkZEMwZMvZoLgS8aYMBexVG0pqYRn5bdux0lrbERxV4KPKQXn8yKN/YJs9MC75WZk/TesJu7LnFzPYN4HloWCvLbghuAOqpCzBOVu/RL1HHV6W5k4SzJTK3IlDlvwz9uSIYR1h9DVfk5YR4fkbeOEwfyaktshH+/vlKjBPrhF93+R5d8K/cJpVxI1g/xCiAGK/IiBOaIcqnzhQ0k9jDrl1aEdKk8c9QeM46lytKNto4S0AdRrlz+LIFeDgWdnRSHAA8qLKLQfn17S+Ee5XNXHso7Xv0pAJLsfyADzN8HLOLZ7r+P8CfCTXGDxrdsHN1CQmSsjEYVUWhxoGYPnHrn+fjQCdJMdRa7RknSqn5IteT1dTB9h/nI62vIwnt+m3l+wElZPksJ0r1Z3CTrvZLooecHyjT8SvLf5D+gcAU3QPR7TTbCsaFUql6U8J81367qSEJdQllgzHjTsEgrZuXIOfM5ki+Ytuagas/VGTx2bfwBSs5rujpO4ZNoLWTaUdw/0wtSqMnqzAqrK40/Pv126879OuFQ3DPZ0XI0VZkyafABPgwWAkJOXtvK0rPgqVFEoPqEjpbMXJlOdGb3FrLhqUZvQujoiXRm9PybQr3iVgqXSRKylEqmOQS4DKOK10F268yaUlTAiJjt30sZHMEIwBDQqGZmI2JDNl8CToGlvtUluPUTXTH2bERmMKt0BCD/1GH3zWUJbJJkOP5FuGtVzk5Oy8gEduX1rvQtnv1DlpjJwQv7Rq0vXH+oH+ahGXlcnoLQQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199015)(40470700004)(36840700001)(46966006)(450100002)(6666004)(70206006)(83380400001)(70586007)(2906002)(81166007)(8676002)(356005)(40460700003)(26005)(2616005)(86362001)(40480700001)(41300700001)(336012)(82310400005)(36756003)(47076005)(426003)(16526019)(316002)(8936002)(5660300002)(7696005)(1076003)(186003)(110136005)(966005)(36860700001)(82740400003)(66899015)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 23:44:35.6385 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7dc025-a780-4194-4caf-08dac9bed98c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4494
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
implementation.

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
2.32.0

