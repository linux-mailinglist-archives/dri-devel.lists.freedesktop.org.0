Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D8A9E7FA0
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 11:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5412210E2EF;
	Sat,  7 Dec 2024 10:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YuZrRdDw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CD010E2EF
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 10:53:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0ySH/xYkkF4lPN3bgTVsYZ/pjYLaN59aqVfBy34DJt1UJSAoe8lZpePXZAyZP3ZLtJIYACtJUgLf8Fd/SjiMjS4f4Cdw2+FQQ910r7hW2Mt1JAyYUyk3T+UI8HXxCfxMcddWP9wow/NpfGHPSXjIhG7IfEcTp16U4TpVL2vnnEsyP2AJH5ifTJSDloLYdzJ5mRWwC2ZE7xe2Xw4TLCLp6mWdW9fU19CcMXiUfgd23fykpya5J60X+y6lGkjcsKDXe0S+UGXIUDgdNajOWiEV3/KzA3JmpMkV9rNdd7+uInd0yLOckylnhr4Nc+nOytaKLTIm2I965pHpas5qoHoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZkFtwcnYM2i/536XZMFv1NpvRLzNT6/8HZOgNw9APU=;
 b=IYYvzvc5qsR9GbQ0hGPfhNvHnebbOO5yTGBEPN1VZOqoGS8Nxw21XxNAmaVy+BqHlA6qnRCyMe9DD0z0cPEZaPrryUtEXUkdQKc9F6XFQDuVrWMSjcEuiZ0ykCxuN7oFd8au6/JPasHHzVXmzD8+NqNUzqyLBa7ZgBE9jshWQlwatA6jQIYYy/PYcq8t53Xijkx5vAOXR8w+EsSTAFDBARV+43DTHIvhGsXt5/WE8EvQUcERDuvuwhZCeJ7zJi2hgzpf2IKrb24sgdsNYiySnnbGoiATWBjgcssBQua9RHnhbgwQ556/ZX4RZGb7jgcA36C2v5sij/JiQWeJhPU+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZkFtwcnYM2i/536XZMFv1NpvRLzNT6/8HZOgNw9APU=;
 b=YuZrRdDw32Gd5l4UpvOeTbHLgD56QTO10INg3o3T+Ac2L8srAH9J9EgJYQKOSpetZbPfpsvwu5jfTVlQ6KyyK+2knrpfzwW/ggvR0tKcfKrhGeIWpIg6foCzqs5e/Qv+tPzCRsfAdLUqXGZFCnMiYhUmv2kSdzfqdIBxPFJ1d9c=
Received: from CH0P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::6)
 by CH3PR12MB7572.namprd12.prod.outlook.com (2603:10b6:610:144::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Sat, 7 Dec
 2024 10:53:45 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::4) by CH0P223CA0030.outlook.office365.com
 (2603:10b6:610:116::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Sat,
 7 Dec 2024 10:53:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Sat, 7 Dec 2024 10:53:44 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 7 Dec
 2024 04:53:39 -0600
From: Julia Zhang <julia.zhang@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 <dri-devel@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>, Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Daniel Vetter
 <daniel@ffwll.ch>, Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui
 <ray.huang@amd.com>, Penny Zheng <penny.zheng@amd.com>, Zhu Lingshan
 <Lingshan.Zhu@amd.com>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Julia Zhang
 <julia.zhang@amd.com>
Subject: [PATCH 3/3] drm/virtio: Implement device_attach
Date: Sat, 7 Dec 2024 18:50:26 +0800
Message-ID: <20241207105023.542399-4-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241207105023.542399-1-julia.zhang@amd.com>
References: <20241207105023.542399-1-julia.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|CH3PR12MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d46a6a5-b8b5-453d-7fe6-08dd16ad6bca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2wKtCKDtVexDsiIbKn+FuNmPsOgS/VWMc7nExyLAuNnJpD3SY7ed/9JncehJ?=
 =?us-ascii?Q?6IdZKDAdUrpX5RYeoDxcH44yYhMIdXsiZsfmxyhgZ11iAPX7+xhOsID0fRHW?=
 =?us-ascii?Q?hJyqKRHEvmGrHuacbZSDD6kPJV8vSDstb5R/E+TpelwgR5KfiDJflDiln8aC?=
 =?us-ascii?Q?vqFtEMxKjsQNX+bd6DaeMySzF8SMQQ/mcHJCeKcgDxx0aUH/5GNUWA+cOzw8?=
 =?us-ascii?Q?hBD5uZ3sWgPI1+xfXp5/US5etcK8wmltdyCo3lO/VyhK87kDdjhQbsLXHSzW?=
 =?us-ascii?Q?Q45utifk9uwOZijqvhPX7WIUqjERhzRif9sUKveJCdYi8SHHz+hFtjfVSyn8?=
 =?us-ascii?Q?FZATHaOzMrOggUqP2cu0QIxQD3WHlDu97C3+G1cR6wKHrjaxNXebycCF+BM9?=
 =?us-ascii?Q?WLv8WjqU5R6C6efWVntpdZ4xg9VwVMdXmR3XA8Rcm7bF8Hwij1Be2k8rrN7W?=
 =?us-ascii?Q?l58ZUjsZZLcBIuc+JO3TxEWvozHQFRn7BuEhLHjyViAqcqcdfIaq3VcVifS3?=
 =?us-ascii?Q?udlMf3ddm/jedtiQE8GlqPzL9d5A1rpphCCe/0KqaJF6u8RUGuwbBwT7B7Q9?=
 =?us-ascii?Q?bG6LjM6tPZCIyc4ySjyrRLvtFN1fgB5bln+0xo2eXjKheNlRPgvijXYO2QIm?=
 =?us-ascii?Q?EqALGPzaGXJ1HwkuDVobUDAOiVhP+HfeNX7C2TSPPNYasyke4PeSH4YPziRr?=
 =?us-ascii?Q?8qud9WGAH3znX9fna8cgh7kv0oS88jTLVhDxMhGN2bRTZbqkM8LoRM2vgXNd?=
 =?us-ascii?Q?XSaNPsg9fgMN7szZKLvCWS7+EMzAofbz6IRxgnAz+btmRldbEM9AnkCVbrWa?=
 =?us-ascii?Q?96pb+BrqDkL4uArbTtyunSHZS8tg/XAaasIi/W0wzpfuHVlO1+7SvEr2e8c3?=
 =?us-ascii?Q?ZmgNqslEmEYHVR6zxDJU1mgef2fk09dxj3iKKkLVWlq7ZGFYZ8tK9z6Xcexr?=
 =?us-ascii?Q?1I8v9VPBEGBtKBbPDsdOp/z7L6Zd3G0mKbJqRXtB9Qxc/URS3l3p3w3MlPY2?=
 =?us-ascii?Q?bdLWA8XfrEIqe3OZk2giSz4QReRDYCr+wPU8d8fZoDFrJ2xSg+0G/AqWxRpj?=
 =?us-ascii?Q?krPIlJSWhsnjCcd3mXcDOnvcD7B5jg4OmGFjemxk7gV9I5DYQ/yZivTlTb+M?=
 =?us-ascii?Q?JP+yIGEWc1KM5R3dBN+Qz6o4cRJKfWoai9oFov5JkMzWlpuaxjkH6Bmkas6O?=
 =?us-ascii?Q?uJdoVV9oAVDvsl/4Gg2X7Xk3f8gysiLhHO0+xzyIbMdfGPRow8Y/J+bfGzAN?=
 =?us-ascii?Q?+/3f4+y8eKBqx8/YiAOhZQD9ncEf5gab0SVypE8wdn2fQYebptIu3li5xaXF?=
 =?us-ascii?Q?lVNQI6ImNixFGnwoBYhc0P4QPCPBSYtKqiyms6kaamKIxZUcuAwYxe+ap1bP?=
 =?us-ascii?Q?+5tF5C3lZsCcWnQKkHUIGhdW2V8qFh6zJ5Rg7gy9WrQLAFAW6hc17QrVXe1Z?=
 =?us-ascii?Q?jQYEyBNF6aJiyaPrhy3TesM1ApUIpwKfaf6htWdFE4hAcItYfuKM5Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 10:53:44.9127 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d46a6a5-b8b5-453d-7fe6-08dd16ad6bca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7572
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

As vram objects may be imported by other gpu drivers, peer2peer flag
should be checked in dma_buf_ops->attach(). This reimplement virtio gpu
dma_buf_ops->attach by adding a device_attach() function for virtio gpu.
This function will get pci_p2pdma_distance and check attach->peer2peer
before calling drm_gem_map_attach().

Signed-off-by: Julia Zhang <julia.zhang@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_prime.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 4960620eba02..4f6bce79e10e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -116,6 +116,18 @@ static int virtgpu_get_p2pdma_distance(struct dma_buf *dma_buf,
 	return 0;
 }
 
+static int virtgpu_gem_device_attach(struct dma_buf *dma_buf,
+				     struct dma_buf_attachment *attach)
+{
+	int ret = virtgpu_get_p2pdma_distance(dma_buf, attach);
+	if (ret)
+		return ret;
+	if (!attach->peer2peer)
+		return -EBUSY;
+
+	return drm_gem_map_attach(dma_buf, attach);
+}
+
 static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
 	.ops = {
 		.cache_sgt_mapping = true,
@@ -128,7 +140,7 @@ static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
 		.vmap = drm_gem_dmabuf_vmap,
 		.vunmap = drm_gem_dmabuf_vunmap,
 	},
-	.device_attach = drm_gem_map_attach,
+	.device_attach = virtgpu_gem_device_attach,
 	.get_uuid = virtgpu_virtio_get_uuid,
 };
 
-- 
2.34.1

