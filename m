Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7579835D74E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 07:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8161B6E140;
	Tue, 13 Apr 2021 05:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA2C6E140
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 05:36:42 +0000 (UTC)
IronPort-SDR: ORaUHhDqSMhnG6Ztv2I3p0V/wVmu0aoSdkDety8IpBcZXweAJMjQQES2YvkDpjbW0XkcvnMk8k
 iLyCuTH156xQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="181862825"
X-IronPort-AV: E=Sophos;i="5.82,218,1613462400"; d="scan'208";a="181862825"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 22:36:41 -0700
IronPort-SDR: 3CGe5jHkYMCwVqbLmlkexvB7KNWzAdUajQRb8q9oAQY8/OlJlNTLYfBP2vJeXx/Vynr1BOhxpj
 6BTM+m4Pk2uQ==
X-IronPort-AV: E=Sophos;i="5.82,218,1613462400"; d="scan'208";a="381846314"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 22:36:41 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: Create Dumb BOs as guest Blobs (v3)
Date: Mon, 12 Apr 2021 22:26:14 -0700
Message-Id: <20210413052614.2486768-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <CAAfnVBmkEHB=j3rJyLPOixFRfPD=WQGVs85PuS0RYmViOgVAQA@mail.gmail.com>
References: <CAAfnVBmkEHB=j3rJyLPOixFRfPD=WQGVs85PuS0RYmViOgVAQA@mail.gmail.com>
MIME-Version: 1.0
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If support for Blob resources is available, then dumb BOs created
by the driver can be considered as guest Blobs.

v2: Don't skip transfer and flush commands as part of plane update
as the device may have created a shared mapping. (Gerd)

v3: Don't create dumb BOs as Guest blobs if Virgl is enabled. (Gurchetan)

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_gem.c    | 8 ++++++++
 drivers/gpu/drm/virtio/virtgpu_object.c | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 8502400b2f9c..2de61b63ef91 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -64,6 +64,7 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 {
 	struct drm_gem_object *gobj;
 	struct virtio_gpu_object_params params = { 0 };
+	struct virtio_gpu_device *vgdev = dev->dev_private;
 	int ret;
 	uint32_t pitch;
 
@@ -79,6 +80,13 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 	params.height = args->height;
 	params.size = args->size;
 	params.dumb = true;
+
+	if (vgdev->has_resource_blob && !vgdev->has_virgl_3d) {
+		params.blob_mem = VIRTGPU_BLOB_MEM_GUEST;
+		params.blob_flags = VIRTGPU_BLOB_FLAG_USE_SHAREABLE;
+		params.blob = true;
+	}
+
 	ret = virtio_gpu_gem_create(file_priv, dev, &params, &gobj,
 				    &args->handle);
 	if (ret)
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 4ff1ec28e630..f648b0e24447 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -254,6 +254,9 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	}
 
 	if (params->blob) {
+		if (params->blob_mem == VIRTGPU_BLOB_MEM_GUEST)
+			bo->guest_blob = true;
+
 		virtio_gpu_cmd_resource_create_blob(vgdev, bo, params,
 						    ents, nents);
 	} else if (params->virgl) {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
