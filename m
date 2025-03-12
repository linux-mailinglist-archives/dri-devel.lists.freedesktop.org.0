Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F94A5E873
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 00:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CF210E7DC;
	Wed, 12 Mar 2025 23:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="SRO9agTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D83210E7D2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 21:38:11 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4766631a6a4so2589071cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 14:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1741815491;
 x=1742420291; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/DdyU1t3FqtU1jJ8vS8wTATOGoqapC7RIj2+M56AKU=;
 b=SRO9agTBuogRrn8izgJMVCxNsOp8G0/MJ+qZn7zl76MadOTqOoPZW6GbI46OoT5Wzj
 NF72WVV+SupiW+9jfL6sKkxS4xSQsYc8vXLvO95hQyZZj0WG2xftIaZUw7GlyLoF/mlY
 Ar74W2YiEXAzGWXDH3ABXgjy9dQo9lr6Quf7h5W31yYUAZJtjmc+Jwwp4n7YpBETtxMS
 vgJMKbZxIPJIvWMueabwnj6rq6Xtx1n/48R+BB4jzrbj1NLQiHa3Gp2rI1rNORiAAJ7t
 G2IeiyOzrJMSOPfU5DwTlOpnda7PwyuUinBqYkCMsqMtBjw1mbJZGBrX6/fME0p/7ZAs
 XJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741815491; x=1742420291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/DdyU1t3FqtU1jJ8vS8wTATOGoqapC7RIj2+M56AKU=;
 b=wAT0PpitlD7VY9lnzCSw/zy4WKZEnCl6WL4yYw9dwcypu3MxgqI7mydZrpqwcUzZr/
 Qg+UjOggY4GUwdHdM1sgiZW6lX9pwAJBUFWJtOzTAI7Ilku3p0kOtbh5N/V/eF1tjbX7
 vcAMUSWeQKRv/BMv/vaUgEQY+wsaG/uQqjcJU8M0OoRvz6mLRCPbFdea4L/mY95LOtmz
 5fPIxM5wh3hiRxDV7iLA62qJ3/RVn6G3X1TLTMp9SB+G9+8EKK168+EnKWIFrk1UE0Ww
 IyLsslT35nl0KLSk6rUrfeWBVGIqaOxzP/2Z4ggH7Isv63lEurzBPDqHAOEsWKj53oiM
 MgFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfGHgiRWQcdcG+clUhUKik+JKHNuYFGqLnezXSor8UY+dPpcb06b1cA91pcF8yLMKDZMm48O09mhg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6WungeYz9N5tJieiBcenz/r17PbLWEaDdn/oy86DMusmZhtbq
 TO5F/2OPZMkzl9/I7wFikHAXrZX0qa0sJsUGs3W95rXZ7OA9JZdvEeDRAjGxIuw=
X-Gm-Gg: ASbGncsl9LqfllNsopqdeikru1qj+Sn6yerO+3JYI8rki6UwPx+iuVh4xHAAfWiYG+D
 pKakJIsH5JOHzfWQ8O41KwcIjvShoPLNvMvjLs6d9MgPLV4JLPCiwrM6b/iWJIuqhyq1KMktsAQ
 m9u0+CiwQpmkxFF69UZXtfHOQzOp653kfAcfEn51iPBtNxvrbOWThOrXxOWqzeEmqRIh09prEOB
 zkV+VApL3xPkezeSrE77EE1cvVgRThDl37HBi2C/Km0rShRtp8EUyH77JHMtOskXvBx0YJFDMeI
 O4apis3zxPEpI0BIYyusZ41HX/VArl4AqwmdR6IjyD3SfX2v0wjloyWjsBgo5fu6yihpYH+iz5X
 iA4I=
X-Google-Smtp-Source: AGHT+IEEZsKurk8/7u0g5W3yhnVQ7CmjGrWvkCBw8xfksDt3GmZoxgsguPba7Y89wzJChqdNVS1hgA==
X-Received: by 2002:a05:622a:1a15:b0:476:838c:b0ce with SMTP id
 d75a77b69052e-476994cc79fmr130831381cf.13.1741815490645; 
 Wed, 12 Mar 2025 14:38:10 -0700 (PDT)
Received: from m-kiwi.mynetworksettings.com
 ([2600:4040:9834:3d00:ea98:25f3:a3:e5c5])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47690deda7csm40220361cf.29.2025.03.12.14.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 14:38:09 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
Date: Wed, 12 Mar 2025 17:36:14 -0400
Message-ID: <20250312213746.228042-2-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312213746.228042-1-mhenning@darkrefraction.com>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Mar 2025 23:31:25 +0000
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

Userspace needs this information to set up zcull correctly.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 .../drm/nouveau/include/nvkm/core/device.h    |  6 ++
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h | 69 +++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_abi16.c       | 15 ++++
 drivers/gpu/drm/nouveau/nouveau_abi16.h       |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c | 34 +++++++++
 include/uapi/drm/nouveau_drm.h                | 19 +++++
 7 files changed, 145 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
index 46afb877a296..d1742ff1cf6b 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -3,6 +3,9 @@
 #define __NVKM_DEVICE_H__
 #include <core/oclass.h>
 #include <core/intr.h>
+
+#include "uapi/drm/nouveau_drm.h"
+
 enum nvkm_subdev_type;
 
 enum nvkm_device_type {
@@ -72,6 +75,9 @@ struct nvkm_device {
 		bool armed;
 		bool legacy_done;
 	} intr;
+
+	bool has_zcull_info;
+	struct drm_nouveau_get_zcull_info zcull_info;
 };
 
 struct nvkm_subdev *nvkm_device_subdev(struct nvkm_device *, int type, int inst);
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
index 59f8895bc5d7..01884b926c9c 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
@@ -26,6 +26,75 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+/**
+ * NV2080_CTRL_CMD_GR_GET_ZCULL_INFO
+ *
+ * This command is used to query the RM for zcull information that the
+ * driver will need to allocate and manage the zcull regions.
+ *
+ *   widthAlignPixels
+ *     This parameter returns the width alignment restrictions in pixels
+ *     used to adjust a surface for proper aliquot coverage (typically
+ *     #TPC's * 16).
+ *
+ *   heightAlignPixels
+ *     This parameter returns the height alignment restrictions in pixels
+ *     used to adjust a surface for proper aliquot coverage (typically 32).
+ *
+ *   pixelSquaresByAliquots
+ *     This parameter returns the pixel area covered by an aliquot
+ *     (typically #Zcull_banks * 16 * 16).
+ *
+ *   aliquotTotal
+ *     This parameter returns the total aliquot pool available in HW.
+ *
+ *   zcullRegionByteMultiplier
+ *     This parameter returns multiplier used to convert aliquots in a region
+ *     to the number of bytes required to save/restore them.
+ *
+ *   zcullRegionHeaderSize
+ *     This parameter returns the region header size which is required to be
+ *     allocated and accounted for in any save/restore operation on a region.
+ *
+ *   zcullSubregionHeaderSize
+ *     This parameter returns the subregion header size which is required to be
+ *     allocated and accounted for in any save/restore operation on a region.
+ *
+ *   subregionCount
+ *     This parameter returns the subregion count.
+ *
+ *   subregionWidthAlignPixels
+ *     This parameter returns the subregion width alignment restrictions in
+ *     pixels used to adjust a surface for proper aliquot coverage
+ *     (typically #TPC's * 16).
+ *
+ *   subregionHeightAlignPixels
+ *     This parameter returns the subregion height alignment restrictions in
+ *     pixels used to adjust a surface for proper aliquot coverage
+ *     (typically 62).
+ *
+ *   The callee should compute the size of a zcull region as follows.
+ *     (numBytes = aliquots * zcullRegionByteMultiplier +
+ *                 zcullRegionHeaderSize + zcullSubregionHeaderSize)
+ */
+#define NV2080_CTRL_CMD_GR_GET_ZCULL_INFO            (0x20801206U) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_GR_INTERFACE_ID << 8) | NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS_MESSAGE_ID" */
+
+#define NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS_SUBREGION_SUPPORTED
+#define NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS_MESSAGE_ID (0x6U)
+
+typedef struct NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS {
+    NvU32 widthAlignPixels;
+    NvU32 heightAlignPixels;
+    NvU32 pixelSquaresByAliquots;
+    NvU32 aliquotTotal;
+    NvU32 zcullRegionByteMultiplier;
+    NvU32 zcullRegionHeaderSize;
+    NvU32 zcullSubregionHeaderSize;
+    NvU32 subregionCount;
+    NvU32 subregionWidthAlignPixels;
+    NvU32 subregionHeightAlignPixels;
+} NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS;
+
 typedef enum NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS {
     NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_MAIN = 0,
     NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_SPILL = 1,
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 2a0617e5fe2a..981abea97546 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -333,6 +333,21 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 	return 0;
 }
 
+int
+nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
+{
+	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nvkm_device *device = drm->nvkm;
+	struct drm_nouveau_get_zcull_info *out = data;
+
+	if (device->has_zcull_info) {
+		*out = device->zcull_info;
+		return 0;
+	} else {
+		return -ENODEV;
+	}
+}
+
 int
 nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index af6b4e1cefd2..134b3ab58719 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -6,6 +6,7 @@
 	struct drm_device *dev, void *data, struct drm_file *file_priv
 
 int nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS);
+int nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS);
 int nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS);
 int nouveau_abi16_ioctl_channel_free(ABI16_IOCTL_ARGS);
 int nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 107f63f08bd9..4c4168b50e60 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1244,6 +1244,7 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GROBJ_ALLOC, nouveau_abi16_ioctl_grobj_alloc, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_NOTIFIEROBJ_ALLOC, nouveau_abi16_ioctl_notifierobj_alloc, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GPUOBJ_FREE, nouveau_abi16_ioctl_gpuobj_free, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_GET_ZCULL_INFO, nouveau_abi16_ioctl_get_zcull_info, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_SVM_INIT, nouveau_svmm_init, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_SVM_BIND, nouveau_svmm_bind, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_NEW, nouveau_gem_ioctl_new, DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
index f4bed3eb1ec2..6669f2b1f492 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
@@ -34,6 +34,7 @@
 #include <nvrm/535.113.01/common/sdk/nvidia/inc/alloc/alloc_channel.h>
 #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h>
 #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h>
 #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h>
 #include <nvrm/535.113.01/nvidia/generated/g_kernel_channel_nvoc.h>
 
@@ -244,6 +245,8 @@ static int
 r535_gr_oneinit(struct nvkm_gr *base)
 {
 	NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
+	NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS *zcull_info;
+	u32 zcull_ctxsw_size, zcull_ctxsw_align;
 	struct r535_gr *gr = container_of(base, typeof(*gr), base);
 	struct nvkm_subdev *subdev = &gr->base.engine.subdev;
 	struct nvkm_device *device = subdev->device;
@@ -418,6 +421,11 @@ r535_gr_oneinit(struct nvkm_gr *base)
 		}
 	}
 
+	zcull_ctxsw_size = info->engineContextBuffersInfo[0]
+		.engine[NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ZCULL].size;
+	zcull_ctxsw_align = info->engineContextBuffersInfo[0]
+		.engine[NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ZCULL].alignment;
+
 	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
 
 	/* Promote golden context to RM. */
@@ -450,6 +458,32 @@ r535_gr_oneinit(struct nvkm_gr *base)
 		}
 	}
 
+	zcull_info = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+					 NV2080_CTRL_CMD_GR_GET_ZCULL_INFO,
+					 sizeof(*zcull_info));
+	if (WARN_ON(IS_ERR(zcull_info))) {
+		ret = PTR_ERR(zcull_info);
+		goto done;
+	}
+
+	device->has_zcull_info = true;
+
+	device->zcull_info.width_align_pixels = zcull_info->widthAlignPixels;
+	device->zcull_info.height_align_pixels = zcull_info->heightAlignPixels;
+	device->zcull_info.pixel_squares_by_aliquots = zcull_info->pixelSquaresByAliquots;
+	device->zcull_info.aliquot_total = zcull_info->aliquotTotal;
+	device->zcull_info.zcull_region_byte_multiplier = zcull_info->zcullRegionByteMultiplier;
+	device->zcull_info.zcull_region_header_size = zcull_info->zcullRegionHeaderSize;
+	device->zcull_info.zcull_subregion_header_size = zcull_info->zcullSubregionHeaderSize;
+	device->zcull_info.subregion_count = zcull_info->subregionCount;
+	device->zcull_info.subregion_width_align_pixels = zcull_info->subregionWidthAlignPixels;
+	device->zcull_info.subregion_height_align_pixels = zcull_info->subregionHeightAlignPixels;
+
+	device->zcull_info.ctxsw_size = zcull_ctxsw_size;
+	device->zcull_info.ctxsw_align = zcull_ctxsw_align;
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, zcull_info);
+
 done:
 	nvkm_gsp_rm_free(&golden.chan);
 	for (int i = gr->ctxbuf_nr - 1; i >= 0; i--)
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index dd87f8f30793..33361784eb4e 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -432,6 +432,22 @@ struct drm_nouveau_exec {
 	__u64 push_ptr;
 };
 
+struct drm_nouveau_get_zcull_info {
+	__u32 width_align_pixels;
+	__u32 height_align_pixels;
+	__u32 pixel_squares_by_aliquots;
+	__u32 aliquot_total;
+	__u32 zcull_region_byte_multiplier;
+	__u32 zcull_region_header_size;
+	__u32 zcull_subregion_header_size;
+	__u32 subregion_count;
+	__u32 subregion_width_align_pixels;
+	__u32 subregion_height_align_pixels;
+
+	__u32 ctxsw_size;
+	__u32 ctxsw_align;
+};
+
 #define DRM_NOUVEAU_GETPARAM           0x00
 #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
 #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
@@ -445,6 +461,7 @@ struct drm_nouveau_exec {
 #define DRM_NOUVEAU_VM_INIT            0x10
 #define DRM_NOUVEAU_VM_BIND            0x11
 #define DRM_NOUVEAU_EXEC               0x12
+#define DRM_NOUVEAU_GET_ZCULL_INFO     0x13
 #define DRM_NOUVEAU_GEM_NEW            0x40
 #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
 #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
@@ -513,6 +530,8 @@ struct drm_nouveau_svm_bind {
 #define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
 #define DRM_IOCTL_NOUVEAU_VM_BIND            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
 #define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
+
+#define DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO     DRM_IOR (DRM_COMMAND_BASE + DRM_NOUVEAU_GET_ZCULL_INFO, struct drm_nouveau_get_zcull_info)
 #if defined(__cplusplus)
 }
 #endif
-- 
2.48.1

