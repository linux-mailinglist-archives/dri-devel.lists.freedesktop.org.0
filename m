Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3842D8402CD
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 11:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BA410E545;
	Mon, 29 Jan 2024 10:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2052.outbound.protection.outlook.com [40.107.100.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EBF10E545;
 Mon, 29 Jan 2024 10:32:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9wyagglfb8v9w5vbzU0+SlBk/rxztNjGVgbFVl/BnyZGfno6E56TtBVtN4eBmgXr1jzmpxnQIj+W5cv5OpjdfXW0yiLXWmb+/Yq36q8EYLsEmgh5IT4VHJz3I5P62ak6YKdEXsN+F3ZnjDMPnmeDXgI/hnfrxDACkGNfZIM2VX4vks5Qx9AwTyt3UMfz32IU1xvBOrpB2/LVFKirC3b2KeZWyc/JzqWOnCNEyanwG7I1v5JJ2m7uJbK/n5x4Nyn6MfdosJVBfksVBr3sy/HNaSNKcEaFN254QCSTmvfFXv3BdKvt8s7wkcltymItVWaT4VOkVT6bsehx40wE7eSwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9mwCClnAJMBs1lDy69fPwQW56kKkdyFW6BbQYzn9as=;
 b=AQgPan3e8KaQNUPLDeENuVJRgNYvo41Vxk7gQMkc/Rl4R2uWFv4ld0s9lP2erCnzyfp4m3ICzPjUrBeL4pvnQiHQGaW595kPZyvOr1EmaaReAWe+rnPhrQ0fxNA/++xDXa+OxNmR12OdlO07UDopbcSA9RDWBwLwA24lyxfTSd1+bkKwYw/aq8b1MDbpZIocZkJWjPLfXz5lZMWqIRhrZiIzUNqQ3hfzJkkdF4fiUDHE50A9u0nvbEL0oIK2iJM4f85bewnDDotRC6Id5zb6aLU+KuFpvbVwIGeOEMHj71bTJtqqJ1GkzcnFbBRrX6UCamPX9vmAvr74DaaIiGZE/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=chromium.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9mwCClnAJMBs1lDy69fPwQW56kKkdyFW6BbQYzn9as=;
 b=0/Md2734ATn7c8xRphmVBEfnUJloySNUH4qVuuSOdaK49HiKZxjYVmOwkeDlwRhEMASrXKOrCpZmo9mcQqMPAnmYtCyHZOkAxjLSmNC6QJPnlMHkt1NhaOzBnDE3iS6zBGcwedI8JhN9qMXIu/KC+bMrTK3zGQpZP716wK9labI=
Received: from SJ0PR03CA0177.namprd03.prod.outlook.com (2603:10b6:a03:338::32)
 by SA1PR12MB8722.namprd12.prod.outlook.com (2603:10b6:806:373::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 10:31:58 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::8e) by SJ0PR03CA0177.outlook.office365.com
 (2603:10b6:a03:338::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32 via Frontend
 Transport; Mon, 29 Jan 2024 10:31:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 29 Jan 2024 10:31:58 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 29 Jan
 2024 04:31:53 -0600
From: Julia Zhang <julia.zhang@amd.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>
Subject: [PATCH v2 1/1] drm/virtio: Implement device_attach
Date: Mon, 29 Jan 2024 18:31:19 +0800
Message-ID: <20240129103118.3258781-1-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|SA1PR12MB8722:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f4873f-f92b-4794-ff86-08dc20b5859d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sC2T/8bEL5N4yez0Jn4Y368hXzKJK7Hbpty+ksiwLxjP5DLxgMmR0P+bLtFHzZuihpMyceM7GjK7RiFKejk42FK49BCgP7HhBo8H6DbF5BeECWqxMi+cjyKsf+qtQ0mAayeMtyfP/0oMn0uopDvbktGambZuZ5wQAmxy/e3nzsOx+jMMJ3UtDsafc/CarJE13KHfijsa3zFD/RfDMcrM2oCmYTn1ufoWDi2FYGxc7Gx/xvu2EDS9ToZQzpmlGIn2dIvytvznbyZfna4Oi8G5y2T1IV1oRtR1RKFKE4WWQQ+aodUpsQtrkOtVp8sb4UX+1NvhsTYbxYAKCmu9ciHCJ1lVHJHz6RXQKt91XtIDiRUEKqxdu8/u8tUYYkT3MvSeaiqKK4s8uhqKV6A/AsrBMT5SwA4GKxznUbtUV/tgJPuRp0kducAtN+QRGR83X+hFDMkL0ls6nCqrtTJso2iMaF7LQBlahGzea00e8qF6sgKkNf6JqYQzsl8syuMB0pNi5gq3Sk5kRSKX4fcdy0l1zQfFdq/KN6aEF4jtFhyAVzyDpMwf16D3u6+VbGXz6F3WSpFoWmOVVk7B1KzKtrs3BaVEWy5jvWG42wzKkDAPNHvXlEsYi9xUepdH0S4MD2CWDH82QLxKHWolBGNQBNIr56bB9FlbPrv/PtjTI1QVjjThLLTxFNn1KLWnCwjjWe9OmS9rno26PcuSVDkTpQpOBigz65RerQ5mPgUz+ABq+FTKrJ0yJ1GesjEvf5YXC0O99uHyRO1H+vrkWgaWIiNwTg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(26005)(16526019)(1076003)(83380400001)(336012)(426003)(6666004)(7696005)(36756003)(86362001)(82740400003)(81166007)(356005)(5660300002)(7416002)(44832011)(8676002)(41300700001)(8936002)(4326008)(36860700001)(2616005)(47076005)(70206006)(70586007)(110136005)(54906003)(2906002)(478600001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 10:31:58.1411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f4873f-f92b-4794-ff86-08dc20b5859d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8722
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Erik Faye-Lund <kusmabite@gmail.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 David Airlie <airlied@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As vram objects don't have backing pages and thus can't implement
drm_gem_object_funcs.get_sg_table callback. This removes drm dma-buf
callbacks in virtgpu_gem_map_dma_buf()/virtgpu_gem_unmap_dma_buf()
and implement virtgpu specific map/unmap/attach callbacks to support
both of shmem objects and vram objects.

Signed-off-by: Julia Zhang <julia.zhang@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_prime.c | 40 +++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 44425f20d91a..b490a5343b06 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -49,11 +49,26 @@ virtgpu_gem_map_dma_buf(struct dma_buf_attachment *attach,
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct sg_table *sgt;
+	int ret;
 
 	if (virtio_gpu_is_vram(bo))
 		return virtio_gpu_vram_map_dma_buf(bo, attach->dev, dir);
 
-	return drm_gem_map_dma_buf(attach, dir);
+	sgt = drm_prime_pages_to_sg(obj->dev,
+				    to_drm_gem_shmem_obj(obj)->pages,
+				    obj->size >> PAGE_SHIFT);
+	if (IS_ERR(sgt))
+		return sgt;
+
+	ret = dma_map_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
+	if (ret) {
+		sg_free_table(sgt);
+		kfree(sgt);
+		return ERR_PTR(ret);
+	}
+
+	return sgt;
 }
 
 static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
@@ -63,12 +78,29 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
 
+	if (!sgt)
+		return;
+
 	if (virtio_gpu_is_vram(bo)) {
 		virtio_gpu_vram_unmap_dma_buf(attach->dev, sgt, dir);
-		return;
+	} else {
+		dma_unmap_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
+		sg_free_table(sgt);
+		kfree(sgt);
 	}
+}
+
+static int virtgpu_gem_device_attach(struct dma_buf *dma_buf,
+				     struct dma_buf_attachment *attach)
+{
+	struct drm_gem_object *obj = attach->dmabuf->priv;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	int ret = 0;
+
+	if (!virtio_gpu_is_vram(bo) && obj->funcs->pin)
+		ret = obj->funcs->pin(obj);
 
-	drm_gem_unmap_dma_buf(attach, sgt, dir);
+	return ret;
 }
 
 static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
@@ -83,7 +115,7 @@ static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
 		.vmap = drm_gem_dmabuf_vmap,
 		.vunmap = drm_gem_dmabuf_vunmap,
 	},
-	.device_attach = drm_gem_map_attach,
+	.device_attach = virtgpu_gem_device_attach,
 	.get_uuid = virtgpu_virtio_get_uuid,
 };
 
-- 
2.34.1

