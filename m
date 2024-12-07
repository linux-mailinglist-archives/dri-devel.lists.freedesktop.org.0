Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA799E7F9D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 11:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E8C10E2ED;
	Sat,  7 Dec 2024 10:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YeLBTl+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3F610E2E9
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 10:53:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3SgNuJloh2w7NsWi+dU6TBIPFnYbNUmssk0veB2tuuBEkL3QffELJL3sOfFuiS0rSLjirXmOcaE49zHPPJ/dtQaDcyaSxEXCYben+ToimaSCVicZ8aUHnAuGo1k6CW3hv2Ggdsk0Fqn/z797tOtPAzlFNgYkp1XAJc0duTodzG1YBrwdMyB/hSNb6o4A6gPnPGsc8nfk9LgQwrHA2cZST1vnFHjs1ZytPCeDj1uVGgh/RzmMhCLXkIdUFQHDY7NmG5a4O3B+H3+NP42Fe+3A18bd5tTfZvbMCuhA2MNs/5+pGUAxUSdCUZycfZUnVKOnTvyiRfb4H62HCct3XHHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cr/hCklb5oOa6uHklyD3rH+9Dy9jZjPa3XjRYdjDB4=;
 b=fUjCbtjZaPJRPX9eT7y2fM/rx5dj0rps+kBlBJ/QU3U43IgAb4KcI/5BeAETol4E5JvJeKZxTxKFmnsR379W+WSQ/V7yaqofpRWNL1eK7Xct94nmN2sFKYCgiyg7nGBA2F6aqaCFBSwDB2NMcCCmMKywJJE37J3jawfj5YrsfcKKwKXET7lAVUyaUdAbgSH5AnwtiggwR+gLZys6XtmcERdXEUCWImAqVwZ3bOPkpSL4bPAmCWAaO2fS021XsycAviUs4FVmFfflRcJOVAiCBrsuU+mkAvsqMWPvb693IwHRLMTGvxttof83WbxS8iGuadjyXplhsLPQsU/ukmZhbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cr/hCklb5oOa6uHklyD3rH+9Dy9jZjPa3XjRYdjDB4=;
 b=YeLBTl+N+bwMF6SyPsYGEBI2UVB8ERc5fw12gv/RbKlEtro4JhTra08+C09GSej+yv00egzNcYvnYJZmwTRoRtO+hCwfGIJEr7hy/v7nfwwvOmtIrAZGbqyXmHi3ZC0HP4KW5iObolh1+52RRxaYBpeE9K1f1RpFMHsXFaWPuPo=
Received: from CH0PR03CA0393.namprd03.prod.outlook.com (2603:10b6:610:11b::21)
 by CY5PR12MB6060.namprd12.prod.outlook.com (2603:10b6:930:2f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.24; Sat, 7 Dec
 2024 10:53:20 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::c8) by CH0PR03CA0393.outlook.office365.com
 (2603:10b6:610:11b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Sat,
 7 Dec 2024 10:53:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Sat, 7 Dec 2024 10:53:19 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 7 Dec
 2024 04:53:14 -0600
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
Subject: [PATCH 2/3] virtgpu: get p2pdma_distance
Date: Sat, 7 Dec 2024 18:50:24 +0800
Message-ID: <20241207105023.542399-3-julia.zhang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|CY5PR12MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: 384bd968-5a51-4c15-8272-08dd16ad5cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xl0uOfUoHWJiimtLuJyJGWveCUw234A8KbbNeuLTEzB07oxaVkIS40rRHKOS?=
 =?us-ascii?Q?1lhOFoKgM6XR80EOvSzB6Cx0J2BV5qhVSXdE13cjNsHyJctIh1O/jV2kUQcR?=
 =?us-ascii?Q?CpRxoGyTrqnrl2AjUhNX5hYwBdPtJrzbHZQyqAGjvUTN/2GQtFp5htF4pFBm?=
 =?us-ascii?Q?zIdnNTDLgEcWye22apRsMK/gjWoma/WppMd8d7oNqoV0QyRRT1cvJZJPAHFf?=
 =?us-ascii?Q?P1jYxDXQPxnTVTWEnRpcGOQluwvKKKID43byi7CBK0sCs04SuOczhJVCqUbr?=
 =?us-ascii?Q?QiZninOOlZljjQ8gtpAE37jJJSy7hQtf81Ay+b+tWSzQH5YLIXavWnBnH5pW?=
 =?us-ascii?Q?KWSOOTJ3mE1n1rhTFvJclxZggULyi7o0sFBrzduY9HqOtw1jYExmTSWPH/D2?=
 =?us-ascii?Q?vxgvwQDAyMe3ebEcAuVFOfVJcjz5tKO3ASCHMLm9CupV/l3kURyaPpZL4W6A?=
 =?us-ascii?Q?ey1pbYWhRum6xqBuUrhzugsoed6UEFtr5RtLZuqpkXCtmg326/e1hJypOqbB?=
 =?us-ascii?Q?7Q2+Hx0X6jJ9cS9SVFglh/IxVbNrZQl37qr3ZkoAqBkhz68trGf84graU2xf?=
 =?us-ascii?Q?Vnif/NhovgNj8GMRaKkySqQ5+Dv6XKPfPK9VGlNdERaSuGDNte/gGkXdD0lI?=
 =?us-ascii?Q?e7QhqfA43YHK3ptr5y+ngnRh+oL+MCYZ1li/fRwFSZ+BXheLjh4u02a+0WZh?=
 =?us-ascii?Q?njSPKzZkgNf8ZE8omplAW9Hyu2tNPqnW8olGeHKXFj60KtSZO3eX9NJd042m?=
 =?us-ascii?Q?KuT8Pw02U+LSPFGMrlurYh/nzwFzv2FbHOYWnp2v2ExD27tuC0GVyWzItFrU?=
 =?us-ascii?Q?+aQwwrlLabshqPMYzvCTneUZwYesovQPh0rj980PCU9oTbtzVB0i8Ni4RZWD?=
 =?us-ascii?Q?WjZgdyRi+QspIRacXtZUjntdzs175B2McHdcijbMFW5tgQkIhkEZaxtolzl0?=
 =?us-ascii?Q?RP20Q+10s2jOqRX5UrfweHnAzU/W+b4S6p0c1TvP2kcV5MqKN4C7TfTeLIJH?=
 =?us-ascii?Q?ye/kiAkAjNolFe3oa+CiENI7tOdN8rzn9wl1fYaa1MZVTfZBatvFvPTzXdKM?=
 =?us-ascii?Q?cJEWwAOPnc35fkjNUIIEeJFU0DswXsqVlwTIJkFVZZhNPxYYDsIcsnFd6lMw?=
 =?us-ascii?Q?H2UJyH6ubNs9w9l9p/sqEUDTkj4A6LmN+gHRMjBXEWflzbtw4dau6FJLLNoY?=
 =?us-ascii?Q?miN4fHsjjGHJ52kevmx7KJzhqIbN0ROI6fXvo6Mf/nWSOu4ZDRpvR75MfqWP?=
 =?us-ascii?Q?YA6hZdoFZcjiDPeQ5O56tyctUENqQt7okMlJGaGWeatN29FGlsxyKyPRo525?=
 =?us-ascii?Q?flc7ksflnKziJA6/Kw+nSwlj9pudlt/S51VBJnn7IBWhMX/HvD/CR928+lwW?=
 =?us-ascii?Q?OasFCuerAYeYp1VUEpVO1FR25yTwYF/hGpAT0KCN/+2oBXemafti61EI2Fe+?=
 =?us-ascii?Q?FcphdFQJK2LAzCsu+a+NlzO5OZ80D1/g34h5ReOzitZ96cdR20Pqig=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 10:53:19.8740 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 384bd968-5a51-4c15-8272-08dd16ad5cdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6060
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

virtgpu driver need to get the p2pdma_distance to decide if virtio
iGPU buffer can be imported by passthrough dGPU, which is the main
step implement dGPU prime feature.

To get the p2pdma_distance, this create a new virtgpu ioctl to send
command of getting p2pdma_distance and pci notations of two pci devices
from guest to host. Host will handle ioctl to calculate p2pdma_distance
for this two pci devices on the host with pci notations sent from guest
virtgpu driver.

Signed-off-by: Julia Zhang <julia.zhang@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 17 +++++++++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 45 ++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 53 ++++++++++++++++++++++++++
 include/uapi/linux/virtio_gpu.h        | 19 +++++++++
 4 files changed, 134 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 64c236169db8..1bbe510c8410 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -87,6 +87,18 @@ struct virtio_gpu_object_params {
 	uint64_t blob_id;
 };
 
+struct virtio_gpu_pci_notation {
+        uint32_t bus;
+        uint32_t slot;
+        uint32_t func;
+};
+
+struct virtio_gpu_p2pdma_distance {
+        atomic_t p2pdma_state;
+        uint32_t distance;
+};
+
+
 struct virtio_gpu_object {
 	struct drm_gem_shmem_object base;
 	uint32_t hw_res_handle;
@@ -488,4 +500,9 @@ void virtio_gpu_vram_unmap_dma_buf(struct device *dev,
 int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file);
 
+int virtio_gpu_cmd_p2pdma_distance(struct virtio_gpu_device *vgdev,
+                                   struct virtio_gpu_pci_notation *provider_params,
+                                   struct virtio_gpu_pci_notation *client_params,
+                                   struct virtio_gpu_p2pdma_distance *p2pdma_dist);
+
 #endif
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 44425f20d91a..4960620eba02 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -23,6 +23,8 @@
  */
 
 #include <drm/drm_prime.h>
+#include <linux/pci.h>
+#include <linux/pci-p2pdma.h>
 #include <linux/virtio_dma_buf.h>
 
 #include "virtgpu_drv.h"
@@ -71,6 +73,49 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 	drm_gem_unmap_dma_buf(attach, sgt, dir);
 }
 
+static int virtgpu_get_p2pdma_distance(struct dma_buf *dma_buf,
+				       struct dma_buf_attachment *attach)
+{
+	struct drm_gem_object *obj = attach->dmabuf->priv;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct drm_device *dev = obj->dev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	struct pci_dev *pci_client;
+	struct virtio_gpu_pci_notation provider_params = {0};
+	struct virtio_gpu_pci_notation client_params = {0};
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_p2pdma_distance p2pdma_dist = {0};
+	int ret = 0;
+
+	attach->peer2peer = false;
+	if (pci_p2pdma_distance(pdev, attach->dev, false) < 0)
+		return 0;
+
+	provider_params.bus = pdev->bus->number;
+	provider_params.slot = PCI_SLOT(pdev->devfn);
+	provider_params.func = PCI_FUNC(pdev->devfn);
+	pci_client = to_pci_dev(attach->dev);
+	client_params.bus = pci_client->bus->number;
+	client_params.slot = PCI_SLOT(pci_client->devfn);
+	client_params.func = PCI_FUNC(pci_client->devfn);
+	ret = virtio_gpu_cmd_p2pdma_distance(vgdev, &provider_params, &client_params, &p2pdma_dist);
+	if (ret)
+		return ret;
+
+	ret = wait_event_timeout(vgdev->resp_wq,
+				 atomic_read(&p2pdma_dist.p2pdma_state),
+				 5 * HZ);
+	if (!ret)
+		return -EBUSY;
+
+	smp_rmb();
+
+	if (p2pdma_dist.distance >= 0)
+		attach->peer2peer = true;
+
+	return 0;
+}
+
 static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
 	.ops = {
 		.cache_sgt_mapping = true,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 0d3d0d09f39b..69c33df61b88 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1197,6 +1197,28 @@ static void virtio_gpu_cmd_resource_map_cb(struct virtio_gpu_device *vgdev,
 	wake_up_all(&vgdev->resp_wq);
 }
 
+static void virtio_gpu_cmd_p2pdma_distance_cb(struct virtio_gpu_device *vgdev,
+                                              struct virtio_gpu_vbuffer *vbuf)
+{
+	struct virtio_gpu_resp_distance *resp =
+		(struct virtio_gpu_resp_distance *)vbuf->resp_buf;
+	struct virtio_gpu_p2pdma_distance *p2pdma_dist = vbuf->resp_cb_data;
+
+	vbuf->resp_cb_data = NULL;
+
+	if (resp->hdr.type != VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE) {
+		atomic_set(&p2pdma_dist->p2pdma_state, 0);
+		goto out;
+	}
+
+	p2pdma_dist->distance = le32_to_cpu(resp->distance);
+	smp_wmb();
+	atomic_set(&p2pdma_dist->p2pdma_state, 1);
+
+out:
+	wake_up_all(&vgdev->resp_wq);
+}
+
 int virtio_gpu_cmd_map(struct virtio_gpu_device *vgdev,
 		       struct virtio_gpu_object_array *objs, uint64_t offset)
 {
@@ -1223,6 +1245,37 @@ int virtio_gpu_cmd_map(struct virtio_gpu_device *vgdev,
 	return 0;
 }
 
+int virtio_gpu_cmd_p2pdma_distance(struct virtio_gpu_device *vgdev,
+                                   struct virtio_gpu_pci_notation *provider_params,
+                                   struct virtio_gpu_pci_notation *client_params,
+                                   struct virtio_gpu_p2pdma_distance *p2pdma_dist)
+{
+	struct virtio_gpu_device_p2pdma_distance *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+	struct virtio_gpu_resp_distance *resp_buf;
+
+	resp_buf = kzalloc(sizeof(*resp_buf), GFP_KERNEL);
+	if (!resp_buf)
+		return -ENOMEM;
+
+	cmd_p = virtio_gpu_alloc_cmd_resp
+		(vgdev, virtio_gpu_cmd_p2pdma_distance_cb, &vbuf, sizeof(*cmd_p),
+		 sizeof(struct virtio_gpu_resp_distance), resp_buf);
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_P2PDMA_DISTANCE);
+	cmd_p->provider_bus = cpu_to_le32(provider_params->bus);
+	cmd_p->provider_slot = cpu_to_le32(provider_params->slot);
+	cmd_p->provider_func = cpu_to_le32(provider_params->func);
+	cmd_p->client_bus = cpu_to_le32(client_params->bus);
+	cmd_p->client_slot = cpu_to_le32(client_params->slot);
+	cmd_p->client_func = cpu_to_le32(client_params->func);
+	vbuf->resp_cb_data = p2pdma_dist;
+
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	return 0;
+}
+
 void virtio_gpu_cmd_unmap(struct virtio_gpu_device *vgdev,
 			  struct virtio_gpu_object *bo)
 {
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index bf2c9cabd207..18313cffaa62 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -95,6 +95,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_SUBMIT_3D,
 	VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
 	VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
+	VIRTIO_GPU_CMD_P2PDMA_DISTANCE,
 
 	/* cursor commands */
 	VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
@@ -108,6 +109,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_OK_EDID,
 	VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
 	VIRTIO_GPU_RESP_OK_MAP_INFO,
+	VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE,
 
 	/* error responses */
 	VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -429,6 +431,23 @@ struct virtio_gpu_set_scanout_blob {
 	__le32 offsets[4];
 };
 
+/* VIRTIO_GPU_CMD_P2PDMA_DISTANCE */
+struct virtio_gpu_device_p2pdma_distance {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le32 provider_bus;
+	__le32 provider_slot;
+	__le32 provider_func;
+	__le32 client_bus;
+	__le32 client_slot;
+	__le32 client_func;
+};
+
+/* VIRTIO_GPU_RESP_DISTANCE */
+struct virtio_gpu_resp_distance {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le32 distance;
+};
+
 /* VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB */
 struct virtio_gpu_resource_map_blob {
 	struct virtio_gpu_ctrl_hdr hdr;
-- 
2.34.1

