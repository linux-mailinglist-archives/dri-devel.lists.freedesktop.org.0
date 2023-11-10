Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C127E79B2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 08:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3345A10E938;
	Fri, 10 Nov 2023 07:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390E210E6A5;
 Fri, 10 Nov 2023 07:17:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhcPrPEnerIhawAKAotiGmet6FwvhlExGODc3aWflv/IBn6bdwgvAiiOPReSssopBPQI2nIG7scUq1y1g5T5ukBWzk/2RHD3/9FXJVIl8daeW6SC9s3OVIQLgYbzTuKUUrDV8Hi44vEq+JKOTYCi3877zEeYBJ6SWmiT3cSG9nJDV1IWD22e9UW4mbPIxbUTBxCB8DjXcA9mxQGdq3yHjPzrML1MT6gPZyGCtbEfXDxoOdcKQMU1HGbL5Njv4PqH9GMEgVSSewpmy9IxeGU/2xuB3mVYhCUkvXTA5RVgInB/DdQBWZ2oaXMjE/FlmrNmBwn1EfTU+sPfhfNDFsprDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1echFh573nf0XBqg2NeD73oL/jGQRgCaqVwB9Q4BLI=;
 b=kM4oJwOOzyPOE7fk8mkDbpx08aLHIPs5zQkwKutzd23+CdIhXzjTj9JvNd4n5AsobNVhrbdZTHKnXSKlLigc4R3p2IvlVmxb0RZp9WmK4jBhg4uIP1pvRGTWGvARHdeMEH5g6SaMMJRJfTb+jKMFNWzD7dpHUmd4Zgx2eHzMCr8Z/yr4BjaX5FL3s5kHUuUwiVKtqOP50vz7U+V9bYDR7du9dItGSEh6vfhC94E3PGGSJUq+c/JgLW1QgHOkAA60IXAEPCYfEwSxoUin2OmIsIZbNdLigPWYsy4Ky5OCNsxawwaT418dBiLiHn4JsztyFm/jMP1q/+AgxqNxq/Q2rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=chromium.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1echFh573nf0XBqg2NeD73oL/jGQRgCaqVwB9Q4BLI=;
 b=D4wTFkWlM18Obw+rR0jLonv1Z18GfvVTQO5ZxCxdfYh5e8LV3Y5eudcCwJcMcIfVVQuLoQarNMe9ETi+QKaE2SrfRVTLnZFYiwZxbZPoVoaC9boOaG0WPJ8PGamb8hUkkEuiH80LUJebJsV47AQ2ujge12qpMjt+C4zWRI/z+Ko=
Received: from MW2PR16CA0022.namprd16.prod.outlook.com (2603:10b6:907::35) by
 LV8PR12MB9270.namprd12.prod.outlook.com (2603:10b6:408:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 07:17:02 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:907:0:cafe::b3) by MW2PR16CA0022.outlook.office365.com
 (2603:10b6:907::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21 via Frontend
 Transport; Fri, 10 Nov 2023 07:17:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Fri, 10 Nov 2023 07:17:01 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 10 Nov
 2023 01:16:55 -0600
From: Julia Zhang <julia.zhang@amd.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>
Subject: [PATCH 1/2] drm/virtio: Implement RESOURCE_GET_LAYOUT ioctl
Date: Fri, 10 Nov 2023 15:16:31 +0800
Message-ID: <20231110071632.24612-2-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110071632.24612-1-julia.zhang@amd.com>
References: <20231110071632.24612-1-julia.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|LV8PR12MB9270:EE_
X-MS-Office365-Filtering-Correlation-Id: 168732c2-206a-45e5-aacc-08dbe1bd08f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rs/jqMxrFQQ2HJD8NpAQb9VMTtbUYOa/o3jEQpZThy2VTMZ4Z8XW8ckt0kMActNo+5uxoKZnth53vp2K+xmnhXpsgdR2VdqTjhzn6QUn3JTkjul1YGh9ZNWzOmUaK4Qn0Sbm1QJDpi/ZSes9eVpMFizqKBRYlbBFIWZcNmiAa5tD7gIiOVdVTsMudupSDpfDlLmhg12B0DUoNHcPxAAG1ZT3vZx20F7mmJc4zwIYz02mnKTEtqNi7lZLjwtT5q7aAu82/hG6t0AA9Nu7tX0gNQJj09CIwVulz79V6q5U2OL+deqKDp+X7H6D5uhAyXeZdzUsRTSiEoUR8QRs35sPDBV9T8bKfZroDqmu+NBtDyWRVVl8YBKl4pPWbQ8xJLt/pd7J2Q3trM0e0HvwiYVr3Gcm+btXxepVgsnfTa6t/0/1MQ82N3IyXstyix8bJipGw2n6mwZFaZQpTIYQ2ZsczNz0ThtYu8kV2pUVDOKMsino111rUtL3N6QSiV9Q8ckv2iltxf4QDlZU9J7oLaF1g/O/Mqk5nN1h95j5L6CpKU9ipKziAg+Vc+JCqu1/w33nxe/7jetYJWdv0kN4erPyCUkgORVukSVye22Hefw03QAjK5okx1F4gkIH+W0qynud6cTgNh+Ayc/uQuLNN5+NibU2As1Y3KRdOzcbvZAmcXdEkFulhcfXx3IUpLmcG98kjr7bT/Ck6fGERLvYWmPfxuGVPzNf1Y1b7t/xOrWB24UwlwEtnfpqP8jjvJvoEyIpUENbpC1YBN5uJ8Op34Cnxg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(82740400003)(2616005)(336012)(40460700003)(83380400001)(26005)(110136005)(426003)(70206006)(16526019)(1076003)(6666004)(7696005)(478600001)(70586007)(5660300002)(7416002)(316002)(4326008)(2906002)(41300700001)(8936002)(356005)(40480700001)(36756003)(8676002)(36860700001)(47076005)(30864003)(81166007)(44832011)(86362001)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 07:17:01.6462 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 168732c2-206a-45e5-aacc-08dbe1bd08f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9270
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
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Stone <daniels@collabora.com>

This ioctl allows the guest to discover how the guest actually allocated
the underlying buffer, which allows buffers to be used for GL<->Vulkan
interop and through standard window systems. It's also a step towards
properly supporting modifiers in the guest.
---
 drivers/gpu/drm/virtio/virtgpu_drv.c   |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 16 +++++-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 71 ++++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  8 ++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 56 ++++++++++++++++++++
 include/uapi/drm/virtgpu_drm.h         | 19 +++++++
 include/uapi/linux/virtio_gpu.h        | 30 +++++++++++
 7 files changed, 198 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 4f7140e27614..1ee09974d4b7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -190,6 +190,7 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_RESOURCE_BLOB,
 	VIRTIO_GPU_F_CONTEXT_INIT,
 	VIRTIO_GPU_F_CONTEXT_FENCE_WAIT,
+	VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 7ef4b3df0ada..d6fc0d4ecb7d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -93,6 +93,15 @@ struct virtio_gpu_object {
 	bool host3d_blob, guest_blob;
 	uint32_t blob_mem, blob_flags;
 
+	atomic_t layout_state;
+	struct {
+		uint64_t offset;
+		uint64_t size;
+		uint32_t stride;
+	} planes[VIRTIO_GPU_RES_MAX_PLANES];
+	uint64_t modifier;
+	uint32_t num_planes;
+
 	int uuid_state;
 	uuid_t uuid;
 
@@ -249,6 +258,7 @@ struct virtio_gpu_device {
 	bool has_host_visible;
 	bool has_context_init;
 	bool has_host_fence_wait;
+	bool has_resource_query_layout;
 	struct virtio_shm_region host_visible_region;
 	struct drm_mm host_visible_mm;
 
@@ -281,7 +291,7 @@ struct virtio_gpu_fpriv {
 };
 
 /* virtgpu_ioctl.c */
-#define DRM_VIRTIO_NUM_IOCTLS 12
+#define DRM_VIRTIO_NUM_IOCTLS 13
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
@@ -436,6 +446,10 @@ int virtio_gpu_cmd_status_freezing(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_host_wait(struct virtio_gpu_device *vgdev,
 			      uint32_t ctx_id, uint64_t fence_id);
 
+int
+virtio_gpu_cmd_get_resource_layout(struct virtio_gpu_device *vgdev,
+				   struct virtio_gpu_object *bo);
+
 /* virtgpu_display.c */
 int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index b6079d2bff69..51d04460d0d8 100644
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
@@ -676,6 +679,70 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 	return ret;
 }
 
+static int virtio_gpu_resource_query_layout_ioctl(struct drm_device *dev,
+						  void *data,
+						  struct drm_file *file)
+{
+	struct drm_virtgpu_resource_query_layout *args = data;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct drm_gem_object *obj;
+	struct virtio_gpu_object *bo;
+	int layout_state;
+	int ret = 0;
+	int i;
+
+	if (!vgdev->has_resource_query_layout) {
+		DRM_ERROR("failing: no RQL on host\n");
+		return -EINVAL;
+	}
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (obj == NULL) {
+		DRM_ERROR("invalid handle 0x%x\n", args->handle);
+		return -ENOENT;
+	}
+	bo = gem_to_virtio_gpu_obj(obj);
+
+	layout_state = atomic_read(&bo->layout_state);
+	if (layout_state == STATE_ERR) {
+		ret = -EINVAL;
+		goto out;
+	} else if (layout_state == STATE_OK) {
+		goto valid;
+	}
+
+	ret = virtio_gpu_cmd_get_resource_layout(vgdev, bo);
+	if (ret)
+		goto out;
+
+	ret = wait_event_timeout(vgdev->resp_wq,
+				 atomic_read(&bo->layout_state) == STATE_OK,
+				 5 * HZ);
+	if (!ret)
+		goto out;
+
+valid:
+	smp_rmb();
+	WARN_ON(atomic_read(&bo->layout_state) != STATE_OK);
+	args->num_planes = bo->num_planes;
+	args->modifier = bo->modifier;
+	for (i = 0; i < args->num_planes; i++) {
+		args->planes[i].offset = bo->planes[i].offset;
+		args->planes[i].size = bo->planes[i].size;
+		args->planes[i].stride = bo->planes[i].stride;
+	}
+	for (; i < VIRTIO_GPU_MAX_RESOURCE_PLANES; i++) {
+		args->planes[i].offset = 0;
+		args->planes[i].size = 0;
+		args->planes[i].stride = 0;
+	}
+	ret = 0;
+
+out:
+	drm_gem_object_put(obj);
+	return ret;
+}
+
 struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 	DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_ioctl,
 			  DRM_RENDER_ALLOW),
@@ -715,4 +782,8 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_CONTEXT_INIT, virtio_gpu_context_init_ioctl,
 			  DRM_RENDER_ALLOW),
+
+	DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_QUERY_LAYOUT,
+			  virtio_gpu_resource_query_layout_ioctl,
+			  DRM_RENDER_ALLOW),
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index dd6450179227..fe863bf07298 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -188,6 +188,9 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB)) {
 		vgdev->has_resource_blob = true;
 	}
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT)) {
+		vgdev->has_resource_query_layout = true;
+	}
 	if (virtio_get_shm_region(vgdev->vdev, &vgdev->host_visible_region,
 				  VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
 		if (!devm_request_mem_region(&vgdev->vdev->dev,
@@ -221,8 +224,9 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		 vgdev->has_host_visible ? '+' : '-',
 		 vgdev->has_host_fence_wait ? '+' : '-');
 
-	DRM_INFO("features: %ccontext_init\n",
-		 vgdev->has_context_init ? '+' : '-');
+	DRM_INFO("features: %ccontext_init %cresource_query_layout\n",
+		 vgdev->has_context_init ? '+' : '-',
+		 vgdev->has_resource_query_layout ? '+' : '-');
 
 	ret = virtio_gpu_init_vqs(vdev);
 	if (ret) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 7a4c9e30f847..8d0a2eaec11c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1333,3 +1333,59 @@ void virtio_gpu_cmd_host_wait(struct virtio_gpu_device *vgdev,
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
+
+static void virtio_gpu_cmd_get_resource_layout_cb(struct virtio_gpu_device *vgdev,
+						  struct virtio_gpu_vbuffer *vbuf)
+{
+	struct virtio_gpu_resp_resource_layout *resp =
+		(struct virtio_gpu_resp_resource_layout *)vbuf->resp_buf;
+	struct virtio_gpu_object *bo = vbuf->resp_cb_data;
+	int i;
+
+	vbuf->resp_cb_data = NULL;
+
+	if (resp->hdr.type != VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT) {
+		atomic_set(&bo->layout_state, STATE_ERR);
+		goto out;
+	}
+
+	bo->modifier = le64_to_cpu(resp->modifier);
+	bo->num_planes = le32_to_cpu(resp->num_planes);
+	for (i = 0; i < VIRTIO_GPU_RES_MAX_PLANES; i++) {
+		bo->planes[i].offset = le64_to_cpu(resp->planes[i].offset);
+		bo->planes[i].size = le64_to_cpu(resp->planes[i].size);
+		bo->planes[i].stride = le32_to_cpu(resp->planes[i].stride);
+	}
+	smp_wmb();
+	atomic_set(&bo->layout_state, STATE_OK);
+
+out:
+	drm_gem_object_put(&bo->base.base);
+	wake_up_all(&vgdev->resp_wq);
+}
+
+int virtio_gpu_cmd_get_resource_layout(struct virtio_gpu_device *vgdev,
+				       struct virtio_gpu_object *bo)
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
+	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+	drm_gem_object_get(&bo->base.base);
+	vbuf->resp_cb_data = bo;
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	return 0;
+}
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index ac804cef737c..7ec57d7e261a 100644
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
@@ -212,6 +214,19 @@ struct drm_virtgpu_context_init {
 	__u64 ctx_set_params;
 };
 
+#define VIRTIO_GPU_MAX_RESOURCE_PLANES 4
+struct drm_virtgpu_resource_query_layout {
+	__u32 handle;
+	__u32 num_planes;
+	__u64 modifier;
+	struct {
+		__u64 offset;
+		__u64 size;
+		__u32 stride;
+		__u32 padding;
+	} planes[VIRTIO_GPU_MAX_RESOURCE_PLANES];
+};
+
 /*
  * Event code that's given when VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK is in
  * effect.  The event size is sizeof(drm_event), since there is no additional
@@ -262,6 +277,10 @@ struct drm_virtgpu_context_init {
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
index c9bf921303cc..c7b22861af69 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -70,6 +70,11 @@
  */
 #define VIRTIO_GPU_F_CONTEXT_FENCE_WAIT  5
 
+/*
+ * VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT
+ */
+#define VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT 6
+
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
 
@@ -101,6 +106,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
 	VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
 	VIRTIO_GPU_CMD_WAIT_FENCE,
+	VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT,
 
 	/* cursor commands */
 	VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
@@ -114,6 +120,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_OK_EDID,
 	VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
 	VIRTIO_GPU_RESP_OK_MAP_INFO,
+	VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT,
 
 	/* error responses */
 	VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -474,4 +481,27 @@ struct virtio_gpu_cmd_host_wait {
 	__le64 fence_id;
 };
 
+/* VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT */
+struct virtio_gpu_resource_query_layout {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le32 resource_id;
+	__le32 padding;
+};
+
+
+/* VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT */
+#define VIRTIO_GPU_RES_MAX_PLANES 4
+struct virtio_gpu_resp_resource_layout {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le64 modifier;
+	__le32 num_planes;
+	__le32 padding;
+	struct virtio_gpu_resource_plane {
+		__le64 offset;
+		__le64 size;
+		__le32 stride;
+		__le32 padding;
+	} planes[VIRTIO_GPU_RES_MAX_PLANES];
+};
+
 #endif
-- 
2.34.1

