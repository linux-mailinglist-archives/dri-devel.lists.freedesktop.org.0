Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9F48296B7
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 10:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB56A10E5A3;
	Wed, 10 Jan 2024 09:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94A610E59F;
 Wed, 10 Jan 2024 09:57:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtQ0q+HWZGVTJaiGC9gtlWz5o1U4FPY+Wy9gXAyDCtGWfc9AB4TBh013KXntOlKf7AHuYEgD27I2dxcphgp5FBmZR8US3h1+FT8B3aTxaybJVcgeA0QNOrDgHOtV4LF7Inxn8yiHNPlkgX4bTTZiqus5F19+PoenrnC7JAvsAw5+MXnMRT2QxrAdUuOxDPM+k1VoeeSkcbVKhHHoRCOT6X9j9A9PjS1YtR52rtfRQvB65gkvGsaZRD+iQrL8iVwS44MKJ2sY9miWVdPyqwjf6JhU++fKKojP4o351M1jLYtgAinSiov8gNPNYwGmzVjiD8e+TwwO5/JSCpITPZg2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXMnVkdAg8WfloOGPFMB6DzaP0QH3hdEz7mtCAjvdY4=;
 b=P4iCt+aIxhG33XgVkQaBxc7k/ROw+hyNMJHDdisHv5g7Fv5loc2z+ce/0SOpUrfkXiFBEAgkdy2Kk2nGcIdKCeItrPrOa80xAZAC7zOeq2dcNBmDCV7Vq6nxA6iff4FqF/d6tpN61bxr7DlQZvgDyNpSda1GdgE5RfcLSS+b8W96qaWAWNl+bE1E5/R1boKSgN+A8Ah9Nm9Yi8pQHVbc4o9uLcM/5KpKo1svIFd748poeJxdLGi7WPpzfTawqZc8PfJI1MgZZfLyspPWBfoPwr22t2hKnKOSsLDZyZR7oSkDP6T8ogxc/PaaDcddDDJ6UXzo9rbmKHsZUiqzs/4Y2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=chromium.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXMnVkdAg8WfloOGPFMB6DzaP0QH3hdEz7mtCAjvdY4=;
 b=uEg2izlF7gy/rWa911JuR9Rbmnfm1PLlWfq0XmTzlBhRzpYe2NMkc9GNm6W52b+DfDt++ErUXC1q7Le4qc3R2kMbtCluYSt+KMAUHfVktIYac7tYliVd/Q7VGle2H3mm9aUvuXklWB5y1wR7G+FACn3SkochNtlrvOqwKPQYNOs=
Received: from SJ0PR03CA0175.namprd03.prod.outlook.com (2603:10b6:a03:338::30)
 by DM6PR12MB4960.namprd12.prod.outlook.com (2603:10b6:5:1bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 09:57:28 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:338:cafe::75) by SJ0PR03CA0175.outlook.office365.com
 (2603:10b6:a03:338::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18 via Frontend
 Transport; Wed, 10 Jan 2024 09:57:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Wed, 10 Jan 2024 09:57:27 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 10 Jan
 2024 03:57:22 -0600
From: Julia Zhang <julia.zhang@amd.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>
Subject: [PATCH 1/1] drm/virtio: Implement device_attach
Date: Wed, 10 Jan 2024 17:56:28 +0800
Message-ID: <20240110095627.227454-2-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110095627.227454-1-julia.zhang@amd.com>
References: <20240110095627.227454-1-julia.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|DM6PR12MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: af03c550-8888-41a2-c12c-08dc11c28d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YssyQKpVwJpAwj2yvE1Ex6tcd69/iELwXcTclJC0sQCk6F8vwVecAv9WWunkBq1OgwBddCdiqw1J8y3Qx8VtLy7encAtuhrXdloxiRulOrlKxBtwGsl39Xj1HmhnG4FSaCPeusop0kYSU0kGdAWtKo5CCrHLkzeDIznkeaXkNWt7VFtRObEdOQMdabP6E/72OtUd/wy7EHEixH3p1cA/9yNxLS0p+MxVfJmOqI4FZNJkxlftQSx1x/DlvzSsD4sOYgjPFvOOg2GqTohBFUzcKq0Jjnovv66yRspk/lVeaovnBj+rBl5ZIiVhkGSNstH4PNM9R/5BJuUm2JUVmr24vLEsDFdOh1fR7JQxkQGmUw5T40k4AOyliawAlyUlvVe+JRcgrEnTSvQPmAicil3gDNp0THCsd/j3iaiSajdw4RyPK/lbnoncN2JDHi1v5TBUTCbKTqWYFTLqgF40/zuqHAzZWcQQZ+U7MHYMX5rGbh549HDDj2Zk4LLXCcCaA6PCuXhQQNYtbtXKo48in7HtSkUpbngxK4iq4tr9NDI/UCPNw9Gr9vZZ3Ph/odM2X5TjsLQthUzeTbA1hcAS0+k3cvkwZeXdPp9kDiLuhQjxhca6uUYaXZw0ET7Oi3U2b9kyUUulmLVRaQBysqLn/VKncP+Nr/rK/XL7sQ5FOiC13XjBvErsgFxj0wX7MfP9vi6in0o8bIYiMaNQ5xAVUW+dsoForjgexaD/NN470YIArBtT9uSdwRlXDVbd9at9AY8jMCS1e4SbJxGugDNwIziksA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(82310400011)(186009)(46966006)(36840700001)(40470700004)(47076005)(356005)(5660300002)(7416002)(2906002)(81166007)(41300700001)(36756003)(86362001)(82740400003)(40480700001)(36860700001)(40460700003)(8936002)(8676002)(4326008)(478600001)(7696005)(83380400001)(70206006)(110136005)(316002)(54906003)(70586007)(16526019)(336012)(426003)(1076003)(26005)(44832011)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 09:57:27.3059 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af03c550-8888-41a2-c12c-08dc11c28d76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4960
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
 Honglei Huang <honglei1.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_gem_map_attach() requires drm_gem_object_funcs.get_sg_table to be
implemented, or else return ENOSYS. Virtio has no get_sg_table
implemented for vram object. To fix this, add a new device_attach to
call drm_gem_map_attach() for shmem object and return 0 for vram object
instead of calling drm_gem_map_attach for both of these two kinds of
object.

Signed-off-by: Julia Zhang <julia.zhang@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_prime.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 44425f20d91a..f0b0ff6f3813 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -71,6 +71,18 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 	drm_gem_unmap_dma_buf(attach, sgt, dir);
 }
 
+static int virtgpu_gem_device_attach(struct dma_buf *dma_buf,
+				     struct dma_buf_attachment *attach)
+{
+	struct drm_gem_object *obj = attach->dmabuf->priv;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+
+	if (virtio_gpu_is_vram(bo))
+		return 0;
+
+	return drm_gem_map_attach(dma_buf, attach);
+}
+
 static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
 	.ops = {
 		.cache_sgt_mapping = true,
@@ -83,7 +95,7 @@ static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
 		.vmap = drm_gem_dmabuf_vmap,
 		.vunmap = drm_gem_dmabuf_vunmap,
 	},
-	.device_attach = drm_gem_map_attach,
+	.device_attach = virtgpu_gem_device_attach,
 	.get_uuid = virtgpu_virtio_get_uuid,
 };
 
-- 
2.34.1

