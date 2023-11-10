Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220C57E79B5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 08:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA25410E6A8;
	Fri, 10 Nov 2023 07:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6147010E6A8;
 Fri, 10 Nov 2023 07:17:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXp+amiD/I451OHAJmCGsi7AB7tjm7B4gmYZMLd14wcJHrWpx2oeg5cpgQGdyRKdfeyscCe6Pbg7Gh1bps1iMajezs2tvlocgipTYGtDGxUja5a4aBm4u5vVcyaIO+u5fwEwM38f8U+Uo1q3iA8fksqL+BKBQVWWHC85uxWjayhSrQHSwOVls/fCvc7YmYo1eTp3/rZzO+u/K1oKDmUuQ/U+hVkAUJG7f6pIsP4WHitZAFIyHNu0B9cX1M4JcBzve+0LFrvWen9IRRjMB5pWVCiDxH0dlTDV8pnJIG3ZwiO7KaX6O6jWQ5ZyeJls0mWMR7BSB0+xJDw0mILgwy2+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jg6T/G1JPjOi2//nxlFQPuwyX6gp0XevSOpuSdi1ew=;
 b=Bgq6ts4f9y19/PEpA1fghnO/bNaLVpfSwWLkGBuJcDHNsP9H4YJJAcksNkoDN+gzAftyqMbiGvmBalAgl54Kk4EneCYyVEdlWwaPBXInrMRb+5P1p71gbAbgsBgZQYrK18GCSwsfyoJRk+GqqTColTwd5zv4pcWAh5xwQA55wWY9+MbtF624hfItpz8ASH1+c55jis6dshYBsfqNhAj3eqVYobjb6eluctl5NAXXEbIT5Evvxw03amkA9ZekBU3yKZ62iB4rJTRVeozSfH51cV0jmh4bYWSl5cUdRLmerzs/a4jiQQ7x4LkJLF/u/WyS/yC8ZTrRAH7GV1ddtyLFIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=chromium.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jg6T/G1JPjOi2//nxlFQPuwyX6gp0XevSOpuSdi1ew=;
 b=L7jxhGYQ4//KHkZi8wcMukwqaCASHl7nBoktSimWmGSeHu5nqJLlAHXBU0BuuiNq1H0veOKyX9ajsOfGDqs1Qlwx4XA6vdDMl/GjeeCWxRM6zFYaTwYTaXI8Ycawb9nHTxydbc7jKRfziznZSoK6Vj58D+3b2orX8CEdf5L6E+c=
Received: from MW4PR04CA0145.namprd04.prod.outlook.com (2603:10b6:303:84::30)
 by IA1PR12MB8309.namprd12.prod.outlook.com (2603:10b6:208:3fe::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 07:17:10 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:303:84:cafe::4a) by MW4PR04CA0145.outlook.office365.com
 (2603:10b6:303:84::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Fri, 10 Nov 2023 07:17:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Fri, 10 Nov 2023 07:17:09 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 10 Nov
 2023 01:17:01 -0600
From: Julia Zhang <julia.zhang@amd.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>
Subject: [PATCH 2/2] drm/virtio: Modify RESOURCE_GET_LAYOUT ioctl
Date: Fri, 10 Nov 2023 15:16:32 +0800
Message-ID: <20231110071632.24612-3-julia.zhang@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|IA1PR12MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c585098-003c-4b9e-fe49-08dbe1bd0d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nb5njeUlUlb9I0OPHl378SITL87GpTwysKZ4/ud+37PYq0WFL60eCPean1xnx/X37G8HMEjTZodVD6HkNDgWf0sHqrlU9KzYLdtYiJbv8ZG/jAZ3eZ00Mlsc0HK2HT2QupEOieXVWVpCzQWzXRMgWcda8LNajaEh3zi0Q7ytLnEbgR44JJs60ZKCuZUn9SFpg0yT38xF4oQMx7PX8p40sURH5tzCMujoqnrNKwYGwfxV31GR0J9q7WZNBQ/K4UKokuqr1BFDXvQqLclvFmO10lQa3bDdoLrwdsiAkYK2OBThs/qBmaNvStbORoKWFYLhMk0hGZMLsNSekW85Jamkfbvudgqz0W3GsTBzijlJsruIbyW7JCGaCvJiTKuMl2UgXzJY1Cgf2ijQEfut7q2JrzCfKCvrbJ5B9m6HtiTEnXWPdJQx+JZA0xhaBjAbdkoRF/jfZUBeIovDjVkRA+4pT7Q2qKc8NND6KgWc6hnK9E5wqw1KX0a9+AsHbf9CS4+EcCTPjJT3TqHvq9UcUv8cSl/r8k8xwtyTnIoZ5G/B75/IFpWbkVo0X/oxthFeJ2ClozIrIuVfnSphmNbtAmzg+B8gHxiHT/deSjXMKcVSR5aN+iy9gGkd5M+/A3p1Bt7RoGytUhK1WwwwSCJnJjQmadhDmcuNJqO10REZGfNweK3AIlamaFraJ8LaktaStHo0vSIXSG6pFEZPWtw+I6tvHGsxWiShCiTyLcBu/Wuk9eoDdjgszrHYo8cUT2nhPZbJAcMingWwitt12pzLgVckCw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799009)(36840700001)(46966006)(40470700004)(316002)(41300700001)(8936002)(36756003)(2906002)(40480700001)(8676002)(4326008)(5660300002)(36860700001)(47076005)(356005)(54906003)(7416002)(81166007)(86362001)(44832011)(70206006)(83380400001)(40460700003)(336012)(16526019)(26005)(82740400003)(1076003)(2616005)(70586007)(426003)(110136005)(7696005)(6666004)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 07:17:09.2293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c585098-003c-4b9e-fe49-08dbe1bd0d71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8309
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

Modify RESOURCE_GET_LAYOUT ioctl to handle the use case that query
correct stride for guest linear resource before it is created.

Signed-off-by: Julia Zhang <julia.zhang@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 26 ++++++++------
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 47 ++++++++++++--------------
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 35 +++++++++++--------
 include/uapi/drm/virtgpu_drm.h         |  6 ++--
 include/uapi/linux/virtio_gpu.h        |  8 ++---
 5 files changed, 66 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index d6fc0d4ecb7d..82dffb3e4c6b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -93,15 +93,6 @@ struct virtio_gpu_object {
 	bool host3d_blob, guest_blob;
 	uint32_t blob_mem, blob_flags;
 
-	atomic_t layout_state;
-	struct {
-		uint64_t offset;
-		uint64_t size;
-		uint32_t stride;
-	} planes[VIRTIO_GPU_RES_MAX_PLANES];
-	uint64_t modifier;
-	uint32_t num_planes;
-
 	int uuid_state;
 	uuid_t uuid;
 
@@ -225,6 +216,16 @@ struct virtio_gpu_drv_cap_cache {
 	atomic_t is_valid;
 };
 
+struct virtio_gpu_query_info {
+	uint32_t num_planes;
+	uint64_t modifier;
+	struct {
+		uint64_t offset;
+		uint32_t stride;
+	} planes [VIRTIO_GPU_MAX_RESOURCE_PLANES];
+	atomic_t is_valid;
+};
+
 struct virtio_gpu_device {
 	struct drm_device *ddev;
 
@@ -448,7 +449,12 @@ void virtio_gpu_cmd_host_wait(struct virtio_gpu_device *vgdev,
 
 int
 virtio_gpu_cmd_get_resource_layout(struct virtio_gpu_device *vgdev,
-				   struct virtio_gpu_object *bo);
+				   struct virtio_gpu_query_info *bo_info,
+				   uint32_t width,
+				   uint32_t height,
+				   uint32_t format,
+				   uint32_t bind,
+				   uint32_t hw_res_handle);
 
 /* virtgpu_display.c */
 int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 51d04460d0d8..034a7c0927a5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -685,9 +685,9 @@ static int virtio_gpu_resource_query_layout_ioctl(struct drm_device *dev,
 {
 	struct drm_virtgpu_resource_query_layout *args = data;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
-	struct drm_gem_object *obj;
-	struct virtio_gpu_object *bo;
-	int layout_state;
+	struct drm_gem_object *obj = NULL;
+	struct virtio_gpu_object *bo = NULL;
+	struct virtio_gpu_query_info bo_info = {0};
 	int ret = 0;
 	int i;
 
@@ -696,50 +696,45 @@ static int virtio_gpu_resource_query_layout_ioctl(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	obj = drm_gem_object_lookup(file, args->handle);
-	if (obj == NULL) {
-		DRM_ERROR("invalid handle 0x%x\n", args->handle);
-		return -ENOENT;
-	}
-	bo = gem_to_virtio_gpu_obj(obj);
-
-	layout_state = atomic_read(&bo->layout_state);
-	if (layout_state == STATE_ERR) {
-		ret = -EINVAL;
-		goto out;
-	} else if (layout_state == STATE_OK) {
-		goto valid;
+	if (args->handle > 0) {
+		obj = drm_gem_object_lookup(file, args->handle);
+		if (obj == NULL) {
+			DRM_ERROR("invalid handle 0x%x\n", args->handle);
+			return -ENOENT;
+		}
+		bo = gem_to_virtio_gpu_obj(obj);
 	}
 
-	ret = virtio_gpu_cmd_get_resource_layout(vgdev, bo);
+	ret = virtio_gpu_cmd_get_resource_layout(vgdev, &bo_info, args->width,
+						 args->height, args->format,
+						 args->bind, bo ? bo->hw_res_handle : 0);
 	if (ret)
 		goto out;
 
 	ret = wait_event_timeout(vgdev->resp_wq,
-				 atomic_read(&bo->layout_state) == STATE_OK,
+				 atomic_read(&bo_info.is_valid),
 				 5 * HZ);
 	if (!ret)
 		goto out;
 
 valid:
 	smp_rmb();
-	WARN_ON(atomic_read(&bo->layout_state) != STATE_OK);
-	args->num_planes = bo->num_planes;
-	args->modifier = bo->modifier;
+	WARN_ON(atomic_read(&bo_info.is_valid));
+	args->num_planes = bo_info.num_planes;
+	args->modifier = bo_info.modifier;
 	for (i = 0; i < args->num_planes; i++) {
-		args->planes[i].offset = bo->planes[i].offset;
-		args->planes[i].size = bo->planes[i].size;
-		args->planes[i].stride = bo->planes[i].stride;
+		args->planes[i].offset = bo_info.planes[i].offset;
+		args->planes[i].stride = bo_info.planes[i].stride;
 	}
 	for (; i < VIRTIO_GPU_MAX_RESOURCE_PLANES; i++) {
 		args->planes[i].offset = 0;
-		args->planes[i].size = 0;
 		args->planes[i].stride = 0;
 	}
 	ret = 0;
 
 out:
-	drm_gem_object_put(obj);
+	if (obj)
+		drm_gem_object_put(obj);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 8d0a2eaec11c..95da6d0008f8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1339,33 +1339,36 @@ static void virtio_gpu_cmd_get_resource_layout_cb(struct virtio_gpu_device *vgde
 {
 	struct virtio_gpu_resp_resource_layout *resp =
 		(struct virtio_gpu_resp_resource_layout *)vbuf->resp_buf;
-	struct virtio_gpu_object *bo = vbuf->resp_cb_data;
+	struct virtio_gpu_query_info *bo_info = vbuf->resp_cb_data;
 	int i;
 
 	vbuf->resp_cb_data = NULL;
 
 	if (resp->hdr.type != VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT) {
-		atomic_set(&bo->layout_state, STATE_ERR);
+		atomic_set(&bo_info->is_valid, 0);
 		goto out;
 	}
 
-	bo->modifier = le64_to_cpu(resp->modifier);
-	bo->num_planes = le32_to_cpu(resp->num_planes);
-	for (i = 0; i < VIRTIO_GPU_RES_MAX_PLANES; i++) {
-		bo->planes[i].offset = le64_to_cpu(resp->planes[i].offset);
-		bo->planes[i].size = le64_to_cpu(resp->planes[i].size);
-		bo->planes[i].stride = le32_to_cpu(resp->planes[i].stride);
+	bo_info->modifier = le64_to_cpu(resp->modifier);
+	bo_info->num_planes = le32_to_cpu(resp->num_planes);
+	for (i = 0; i < bo_info->num_planes; i++) {
+		bo_info->planes[i].stride = le32_to_cpu(resp->planes[i].stride);
+		bo_info->planes[i].offset = le32_to_cpu(resp->planes[i].offset);
 	}
 	smp_wmb();
-	atomic_set(&bo->layout_state, STATE_OK);
+	atomic_set(&bo_info->is_valid, 1);
 
 out:
-	drm_gem_object_put(&bo->base.base);
 	wake_up_all(&vgdev->resp_wq);
 }
 
 int virtio_gpu_cmd_get_resource_layout(struct virtio_gpu_device *vgdev,
-				       struct virtio_gpu_object *bo)
+				       struct virtio_gpu_query_info *bo_info,
+				       uint32_t width,
+				       uint32_t height,
+				       uint32_t format,
+				       uint32_t bind,
+				       uint32_t hw_res_handle)
 {
 	struct virtio_gpu_resource_query_layout *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
@@ -1383,9 +1386,13 @@ int virtio_gpu_cmd_get_resource_layout(struct virtio_gpu_device *vgdev,
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT);
-	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
-	drm_gem_object_get(&bo->base.base);
-	vbuf->resp_cb_data = bo;
+	cmd_p->resource_id = cpu_to_le32(hw_res_handle);
+	cmd_p->width = cpu_to_le32(width);
+	cmd_p->height = cpu_to_le32(height);
+	cmd_p->format = cpu_to_le32(format);
+	cmd_p->bind = cpu_to_le32(bind);
+	vbuf->resp_cb_data = bo_info;
+
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 	return 0;
 }
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index 7ec57d7e261a..41f9c592aeaf 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -217,13 +217,15 @@ struct drm_virtgpu_context_init {
 #define VIRTIO_GPU_MAX_RESOURCE_PLANES 4
 struct drm_virtgpu_resource_query_layout {
 	__u32 handle;
+	__u32 width;
+	__u32 height;
+	__u32 format;
+	__u32 bind;
 	__u32 num_planes;
 	__u64 modifier;
 	struct {
 		__u64 offset;
-		__u64 size;
 		__u32 stride;
-		__u32 padding;
 	} planes[VIRTIO_GPU_MAX_RESOURCE_PLANES];
 };
 
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index c7b22861af69..3e653f018dd7 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -485,7 +485,10 @@ struct virtio_gpu_cmd_host_wait {
 struct virtio_gpu_resource_query_layout {
 	struct virtio_gpu_ctrl_hdr hdr;
 	__le32 resource_id;
-	__le32 padding;
+	__le32 width;
+	__le32 height;
+	__le32 format;
+	__le32 bind;
 };
 
 
@@ -495,12 +498,9 @@ struct virtio_gpu_resp_resource_layout {
 	struct virtio_gpu_ctrl_hdr hdr;
 	__le64 modifier;
 	__le32 num_planes;
-	__le32 padding;
 	struct virtio_gpu_resource_plane {
 		__le64 offset;
-		__le64 size;
 		__le32 stride;
-		__le32 padding;
 	} planes[VIRTIO_GPU_RES_MAX_PLANES];
 };
 
-- 
2.34.1

