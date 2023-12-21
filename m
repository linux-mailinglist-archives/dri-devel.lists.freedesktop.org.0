Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0981881B305
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 11:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F55E10E678;
	Thu, 21 Dec 2023 10:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AA310E669;
 Thu, 21 Dec 2023 10:01:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuDqK+SXElLsi1tkQRexUgnsGRaO7TXf8/yJSn5VvX9Kcf6cBMoP6C9Ssjox6C5CoBx14Op5Udp3leVijcLWTjJu64oyCQDOCN3g1NLrBp+92nLFwKoS4WMRXghuDZ0wWcbsR2BriWfWfHfYcdc32Fkn5Qsq2itrjMYzH9AUkMDgY3IA7U28cBoFpQ9RN0DCi8LScXOKUYaoC782PSh+1zyPDoJ+jwQVEZiT2mn55tkaDm/dr4iC+m0S61V7lm3OEN/K/BXnZr1Uf60JiyOqYgrk/r9SFkynOpp6CtY9Ja00rF7fjTBELArY/SH4NVPYCAMiYRD221GfVRfAUQXGaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHNcwTZj0hcfTUOw9plfr4Kg0xXKcc2wqMwIiqAMTQ8=;
 b=fpHGGI25sUnzQEzpYYw1A4GDb6KWx1llEViYsfp7FXGLxJE/RcqpOAHkEhlymfkryEXkWpzi9hRgrPTx0ee/rlYi1pHhH+KumQ+o+xBKEeRCBUKC4TTAEO1KtViMT82C7lhMa+d1eSjdvdwpjHNNGvKKz/OQRO2fYYhOdR0A2xydBbZtgGRoNFDVIem46Q+niSN9vMSQHzChnG+TsqjnbqkWUqBOXZ9ogDKjgH6eNehSHDBsprNAqHj3IU4BNxG5Ab2QwBVOEHoH2voKBe99uX01UoqzT8PXvszKFf4GMNBlv5gqNEKxxTeLrnZn6mNENHHJJ7Fvvg7aJ50V77TakQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=chromium.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHNcwTZj0hcfTUOw9plfr4Kg0xXKcc2wqMwIiqAMTQ8=;
 b=vpuHieIlH5hQbb+JXnjFcECEHgey7//cjl2gSP5bfBZDEO189Nx+MyyTvjmSsPcJfYdcYUD15JNizLJeJ4qUPMWDthxC/90doxQduSBWeeFiGp2ofXzvU5L/shkv+tr+wzReBK1KCaovbYdVedk107+fnQ1sB/uRWqV12F1DwOE=
Received: from SJ0PR03CA0131.namprd03.prod.outlook.com (2603:10b6:a03:33c::16)
 by SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Thu, 21 Dec
 2023 10:01:13 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::80) by SJ0PR03CA0131.outlook.office365.com
 (2603:10b6:a03:33c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21 via Frontend
 Transport; Thu, 21 Dec 2023 10:01:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Thu, 21 Dec 2023 10:01:13 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 04:00:50 -0600
From: Julia Zhang <julia.zhang@amd.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>
Subject: [PATCH 1/1] drm/virtio: Implement RESOURCE_GET_LAYOUT ioctl
Date: Thu, 21 Dec 2023 18:00:16 +0800
Message-ID: <20231221100016.4022353-2-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221100016.4022353-1-julia.zhang@amd.com>
References: <20231221100016.4022353-1-julia.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|SA0PR12MB4382:EE_
X-MS-Office365-Filtering-Correlation-Id: 75d78449-e3af-47a9-2e5f-08dc020bc3c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YfQyJp1i9LR1mJEG56UZ7a2yV9LP7zjtwY2btcaiCSRDNevWyJsp/Zh98FuRd6uoHgAd9NVn3HJ4s4Hye0Ak2xkKJEv6ZswXgFQ+hY59AaUTkwZj9MolsOk9OaCRXSSHc9Dc9WZ6IUkgEt8DARM4yf7dKWHLCTyzW/RB+3htFMpOOhUVKr727khEhakzUwuQygo6Rl65Ra2cnRNhwNROi5wEgTnqaEXCWh19jXOX+nB3878u6+607M9fkP/Qy2BwoRzH422wdSxZCqMp6ovD+1WEMd/VGOuhYnC2UYCOgE4z5hXD8Vnvi9D+SuGh/lO2R/xBos7nCN1fVhnYOyvnc2CqQkKt8Oo6A1q30Lu+HIOz2zhhyskgt3jKUo6l8Z/iy1H3BE17ZKnD0B5nPdMXp6BYk7YpIQ6dTsNkfDMYJdguoWmx1op72KS71f8ievuyBs2SAg+NrCP4v0g/qFTDburEeqHqp7MMxsiXgDxisAm6lnGxi3q8vSV14+H7Viwaghgo0J6otnDywxCuHBM1M6upA4vXrAt8Y1Jb+F93fYX4yawzulClr2ci50Ajf4lelTqDW6RXJvfI7mxODSkKOWOtNnlFOyVW5dOiQGmLJKPLUP3V+q2/bWc9jcBv0Uddae+kSn9rXM+SA6tZLZpOorefQGnbL8I3Glqazj6mO8+X3o/JcfXLgAGJ4Pl2GDVyt0b2Oo5/SATh8bXJ5G94cKghQTwODzt4ro7cnfCQ1QIC+ZpENqZTJ21g1R4nhShuBrx7asXf2Ta+1Bf48qZMWw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(1800799012)(186009)(82310400011)(451199024)(64100799003)(36840700001)(40470700004)(46966006)(70586007)(70206006)(110136005)(1076003)(54906003)(26005)(40480700001)(2616005)(36860700001)(40460700003)(478600001)(83380400001)(8676002)(4326008)(8936002)(316002)(6666004)(16526019)(426003)(336012)(7696005)(36756003)(44832011)(7416002)(47076005)(5660300002)(30864003)(2906002)(356005)(81166007)(82740400003)(41300700001)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 10:01:13.0409 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d78449-e3af-47a9-2e5f-08dc020bc3c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Daniel
 Stone <daniels@collabora.com>, Erik Faye-Lund <kusmabite@gmail.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 David Airlie <airlied@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Stone <daniels@collabora.com>

Add a new ioctl to allow the guest VM to discover how the guest
actually allocated the underlying buffer, which allows buffers to
be used for GL<->Vulkan interop and through standard window systems.
It's also a step towards properly supporting modifiers in the guest.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Co-developed-by: Julia Zhang <julia.zhang@amd.com> # support query
stride before it's created
Signed-off-by: Julia Zhang <julia.zhang@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c   |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 22 ++++++++-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 66 ++++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  8 +++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 63 ++++++++++++++++++++++++
 include/uapi/drm/virtgpu_drm.h         | 21 ++++++++
 include/uapi/linux/virtio_gpu.h        | 30 ++++++++++++
 7 files changed, 208 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 4334c7608408..98061b714b98 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -148,6 +148,7 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_RESOURCE_UUID,
 	VIRTIO_GPU_F_RESOURCE_BLOB,
 	VIRTIO_GPU_F_CONTEXT_INIT,
+	VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 96365a772f77..bb5edcfeda54 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -214,6 +214,16 @@ struct virtio_gpu_drv_cap_cache {
 	atomic_t is_valid;
 };
 
+struct virtio_gpu_query_info {
+	uint32_t num_planes;
+	uint64_t modifier;
+	struct {
+		uint64_t offset;
+		uint32_t stride;
+	} planes[VIRTIO_GPU_MAX_RESOURCE_PLANES];
+	atomic_t is_valid;
+};
+
 struct virtio_gpu_device {
 	struct drm_device *ddev;
 
@@ -246,6 +256,7 @@ struct virtio_gpu_device {
 	bool has_resource_blob;
 	bool has_host_visible;
 	bool has_context_init;
+	bool has_resource_query_layout;
 	struct virtio_shm_region host_visible_region;
 	struct drm_mm host_visible_mm;
 
@@ -277,7 +288,7 @@ struct virtio_gpu_fpriv {
 };
 
 /* virtgpu_ioctl.c */
-#define DRM_VIRTIO_NUM_IOCTLS 12
+#define DRM_VIRTIO_NUM_IOCTLS 13
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
@@ -420,6 +431,15 @@ virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 				uint32_t width, uint32_t height,
 				uint32_t x, uint32_t y);
 
+int
+virtio_gpu_cmd_get_resource_layout(struct virtio_gpu_device *vgdev,
+				   struct virtio_gpu_query_info *bo_info,
+				   uint32_t width,
+				   uint32_t height,
+				   uint32_t format,
+				   uint32_t bind,
+				   uint32_t hw_res_handle);
+
 /* virtgpu_display.c */
 int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index b24b11f25197..216c04314177 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -107,6 +107,9 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 	case VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs:
 		value = vgdev->capset_id_mask;
 		break;
+	case VIRTGPU_PARAM_RESOURCE_QUERY_LAYOUT:
+		value = vgdev->has_resource_query_layout ? 1 : 0;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -668,6 +671,65 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 	return ret;
 }
 
+static int virtio_gpu_resource_query_layout_ioctl(struct drm_device *dev,
+						  void *data,
+						  struct drm_file *file)
+{
+	struct drm_virtgpu_resource_query_layout *args = data;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct drm_gem_object *obj = NULL;
+	struct virtio_gpu_object *bo = NULL;
+	struct virtio_gpu_query_info bo_info = {0};
+	int ret = 0;
+	int i;
+
+	if (!vgdev->has_resource_query_layout) {
+		DRM_ERROR("failing: no RQL on host\n");
+		return -EINVAL;
+	}
+
+	if (args->handle > 0) {
+		obj = drm_gem_object_lookup(file, args->handle);
+		if (obj == NULL) {
+			DRM_ERROR("invalid handle 0x%x\n", args->handle);
+			return -ENOENT;
+		}
+		bo = gem_to_virtio_gpu_obj(obj);
+	}
+
+	ret = virtio_gpu_cmd_get_resource_layout(vgdev, &bo_info, args->width,
+						 args->height, args->format,
+						 args->bind, bo ? bo->hw_res_handle : 0);
+	if (ret)
+		goto out;
+
+	ret = wait_event_timeout(vgdev->resp_wq,
+				 atomic_read(&bo_info.is_valid),
+				 5 * HZ);
+	if (!ret)
+		goto out;
+
+valid:
+	smp_rmb();
+	WARN_ON(atomic_read(&bo_info.is_valid));
+	args->num_planes = bo_info.num_planes;
+	args->modifier = bo_info.modifier;
+	for (i = 0; i < args->num_planes; i++) {
+		args->planes[i].offset = bo_info.planes[i].offset;
+		args->planes[i].stride = bo_info.planes[i].stride;
+	}
+	for (; i < VIRTIO_GPU_MAX_RESOURCE_PLANES; i++) {
+		args->planes[i].offset = 0;
+		args->planes[i].stride = 0;
+	}
+	ret = 0;
+
+out:
+	if (obj)
+		drm_gem_object_put(obj);
+	return ret;
+}
+
 struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 	DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_ioctl,
 			  DRM_RENDER_ALLOW),
@@ -707,4 +769,8 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_CONTEXT_INIT, virtio_gpu_context_init_ioctl,
 			  DRM_RENDER_ALLOW),
+
+	DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_QUERY_LAYOUT,
+			  virtio_gpu_resource_query_layout_ioctl,
+			  DRM_RENDER_ALLOW),
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 5a3b5aaed1f3..4f34f4145910 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -175,6 +175,9 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB)) {
 		vgdev->has_resource_blob = true;
 	}
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT)) {
+		vgdev->has_resource_query_layout = true;
+	}
 	if (virtio_get_shm_region(vgdev->vdev, &vgdev->host_visible_region,
 				  VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
 		if (!devm_request_mem_region(&vgdev->vdev->dev,
@@ -204,8 +207,9 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		 vgdev->has_resource_blob ? '+' : '-',
 		 vgdev->has_host_visible ? '+' : '-');
 
-	DRM_INFO("features: %ccontext_init\n",
-		 vgdev->has_context_init ? '+' : '-');
+	DRM_INFO("features: %ccontext_init %cresource_query_layout\n",
+		 vgdev->has_context_init ? '+' : '-',
+		 vgdev->has_resource_query_layout ? '+' : '-');
 
 	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
 	if (ret) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index b1a00c0c25a7..26998a3ac4c2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1302,3 +1302,66 @@ void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
+
+static void virtio_gpu_cmd_get_resource_layout_cb(struct virtio_gpu_device *vgdev,
+						  struct virtio_gpu_vbuffer *vbuf)
+{
+	struct virtio_gpu_resp_resource_layout *resp =
+		(struct virtio_gpu_resp_resource_layout *)vbuf->resp_buf;
+	struct virtio_gpu_query_info *bo_info = vbuf->resp_cb_data;
+	int i;
+
+	vbuf->resp_cb_data = NULL;
+
+	if (resp->hdr.type != VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT) {
+		atomic_set(&bo_info->is_valid, 0);
+		goto out;
+	}
+
+	bo_info->modifier = le64_to_cpu(resp->modifier);
+	bo_info->num_planes = le32_to_cpu(resp->num_planes);
+	for (i = 0; i < bo_info->num_planes; i++) {
+		bo_info->planes[i].stride = le32_to_cpu(resp->planes[i].stride);
+		bo_info->planes[i].offset = le32_to_cpu(resp->planes[i].offset);
+	}
+	smp_wmb();
+	atomic_set(&bo_info->is_valid, 1);
+
+out:
+	wake_up_all(&vgdev->resp_wq);
+}
+
+int virtio_gpu_cmd_get_resource_layout(struct virtio_gpu_device *vgdev,
+				       struct virtio_gpu_query_info *bo_info,
+				       uint32_t width,
+				       uint32_t height,
+				       uint32_t format,
+				       uint32_t bind,
+				       uint32_t hw_res_handle)
+{
+	struct virtio_gpu_resource_query_layout *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+	void *resp_buf;
+
+	resp_buf = kzalloc(sizeof(struct virtio_gpu_resp_resource_layout),
+			   GFP_KERNEL);
+	if (!resp_buf)
+		return -ENOMEM;
+
+	cmd_p = virtio_gpu_alloc_cmd_resp
+		(vgdev, &virtio_gpu_cmd_get_resource_layout_cb, &vbuf,
+		 sizeof(*cmd_p), sizeof(struct virtio_gpu_resp_resource_layout),
+		 resp_buf);
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT);
+	cmd_p->resource_id = cpu_to_le32(hw_res_handle);
+	cmd_p->width = cpu_to_le32(width);
+	cmd_p->height = cpu_to_le32(height);
+	cmd_p->format = cpu_to_le32(format);
+	cmd_p->bind = cpu_to_le32(bind);
+	vbuf->resp_cb_data = bo_info;
+
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	return 0;
+}
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index b1d0e56565bc..66f7c0fa1d4d 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -48,6 +48,7 @@ extern "C" {
 #define DRM_VIRTGPU_GET_CAPS  0x09
 #define DRM_VIRTGPU_RESOURCE_CREATE_BLOB 0x0a
 #define DRM_VIRTGPU_CONTEXT_INIT 0x0b
+#define DRM_VIRTGPU_RESOURCE_QUERY_LAYOUT 0x0c
 
 #define VIRTGPU_EXECBUF_FENCE_FD_IN	0x01
 #define VIRTGPU_EXECBUF_FENCE_FD_OUT	0x02
@@ -97,6 +98,7 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
 #define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
 #define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
+#define VIRTGPU_PARAM_RESOURCE_QUERY_LAYOUT 8 /* DRM_VIRTGPU_RESOURCE_QUERY_LAYOUT (also needs cap) */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
@@ -211,6 +213,21 @@ struct drm_virtgpu_context_init {
 	__u64 ctx_set_params;
 };
 
+#define VIRTIO_GPU_MAX_RESOURCE_PLANES 4
+struct drm_virtgpu_resource_query_layout {
+	__u32 handle;
+	__u32 width;
+	__u32 height;
+	__u32 format;
+	__u32 bind;
+	__u32 num_planes;
+	__u64 modifier;
+	struct {
+		__u64 offset;
+		__u32 stride;
+	} planes[VIRTIO_GPU_MAX_RESOURCE_PLANES];
+};
+
 /*
  * Event code that's given when VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK is in
  * effect.  The event size is sizeof(drm_event), since there is no additional
@@ -261,6 +278,10 @@ struct drm_virtgpu_context_init {
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_CONTEXT_INIT,		\
 		struct drm_virtgpu_context_init)
 
+#define DRM_IOCTL_VIRTGPU_RESOURCE_QUERY_LAYOUT				\
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_RESOURCE_QUERY_LAYOUT,	\
+		struct drm_virtgpu_resource_query_layout)
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index f556fde07b76..547575232376 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -65,6 +65,11 @@
  */
 #define VIRTIO_GPU_F_CONTEXT_INIT        4
 
+/*
+ * VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT
+ */
+#define VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT 5
+
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
 
@@ -95,6 +100,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_SUBMIT_3D,
 	VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
 	VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
+	VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT,
 
 	/* cursor commands */
 	VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
@@ -108,6 +114,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_OK_EDID,
 	VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
 	VIRTIO_GPU_RESP_OK_MAP_INFO,
+	VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT,
 
 	/* error responses */
 	VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -453,4 +460,27 @@ struct virtio_gpu_resource_unmap_blob {
 	__le32 padding;
 };
 
+/* VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT */
+struct virtio_gpu_resource_query_layout {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le32 resource_id;
+	__le32 width;
+	__le32 height;
+	__le32 format;
+	__le32 bind;
+};
+
+
+/* VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT */
+#define VIRTIO_GPU_RES_MAX_PLANES 4
+struct virtio_gpu_resp_resource_layout {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le64 modifier;
+	__le32 num_planes;
+	struct virtio_gpu_resource_plane {
+		__le64 offset;
+		__le32 stride;
+	} planes[VIRTIO_GPU_RES_MAX_PLANES];
+};
+
 #endif
-- 
2.34.1

