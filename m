Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6F8ACFC99
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 08:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2883510E3BB;
	Fri,  6 Jun 2025 06:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EE910E383
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 06:29:06 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-60700a745e5so347267a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 23:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749191345; x=1749796145;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4hhddfXDfku9i7J1TvbwOFygxBDLs6NnmsiXqGK3WQo=;
 b=T02X61uzVm61mAl/gmngwHoo4ZGHK5HZnHaaDsstUQ4yrw6CNH+tGOQ5QUajwaEYA6
 ZiiLZqoVfdHNy34bpVJKEETOLZO1J5/Tp9AT3/wKPz1zhgQz/mVdlihWQzanjTo6O2/G
 2V9G2VuRSiILtu72brFfruKU84gWDE3KJ6dLHu1fOWfrDh4KjgcOTx/SWLl7bsFylUuo
 lIWFY/OJXNRf//fSwase5rkBjsZSQxg2Tl8BvGpSSqpQkB8QlbqDL5I9p5my7ckElDEx
 e3X9c027YXMmJ/cFo9VZgD4dwpZZtHuFXYHEUa/tMdBT6VP/vNOufY/VIqaSSPDmVash
 otUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtRm1f4Q/RkNxMXIkiLQmViPCo5Z+UW7hzMrRFw9icI66xUQaD9jzWeSFNCXTtJVYTjyRl1LYSz8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQC9LCZp+WAQmoWxpZWMUos8dwVOluFEDSucql0yLA0E9NOxIf
 QnS2tjKCk5zmdbNGlnNKsElwLHVw2qE3c/hef8OD7RRvqAOT7UKcVwnU
X-Gm-Gg: ASbGncuwPlDgd9RmWl9kJA+SOVW0teJuNDBQ0K19HISIdeM/5w6gu1Y76sGDxUuN5pv
 THt8k7MmX6GqBe+2kGAwl0E9X5iTgGRRHMX8+DJI2TSPtwYKPP8MJU2AVwn+gD8kHY0TOKvzPxJ
 5H82Dqxob0aUCoJQZVFtDbApbBktTtvsbfCg1TwlRFkbSZzAmJpwVxE6njbsvf8rn44w0KicagI
 rulZodQmKqaCFlZIPb7y1FFfgc2gguqPnxmBcApqvU3C57+yBanhcF/aQn5eWeVusyi7BGtXVEm
 gIo+7lU8DcCUUCAcAyMJC3i1IPy97w4M4L4VYYIFgwQ3KaFGv9RTjRRMWVHQ0aCH0MlayveTToq
 0n5USNCB1R2KMFB3h67nd
X-Google-Smtp-Source: AGHT+IF0kxEjRZKTJ5Isl9wd00bAvRzmf0g2DA8yKPRdTtooV62OfCm5lLjAbaXv/OYSPuoOw9Ifiw==
X-Received: by 2002:a17:907:fdca:b0:ad2:549b:4c8d with SMTP id
 a640c23a62f3a-ade1aa46a4bmr190952566b.51.1749191344875; 
 Thu, 05 Jun 2025 23:29:04 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 23:29:04 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 06 Jun 2025 08:28:25 +0200
Subject: [PATCH v7 05/10] accel/rocket: Add IOCTLs for synchronizing memory
 accesses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-6-10-rocket-v7-5-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
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

The NPU cores have their own access to the memory bus, and this isn't
cache coherent with the CPUs.

Add IOCTLs so userspace can mark when the caches need to be flushed, and
also when a writer job needs to be waited for before the buffer can be
accessed from the CPU.

Initially based on the same IOCTLs from the Etnaviv driver.

v2:
- Don't break UABI by reordering the IOCTL IDs (Jeff Hugo)

v3:
- Check that padding fields in IOCTLs are zero (Jeff Hugo)

v6:
- Fix conversion logic to make sure we use DMA_BIDIRECTIONAL when needed
  (Lucas Stach)

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
 drivers/accel/rocket/rocket_drv.c |  2 +
 drivers/accel/rocket/rocket_gem.c | 82 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_gem.h |  5 +++
 include/uapi/drm/rocket_accel.h   | 37 ++++++++++++++++++
 4 files changed, 126 insertions(+)

diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 4ab78193c186dfcfc3e323f16c588e85e6a8a334..eb9284ee2511f730afe6a532225c2706ce0e2822 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -62,6 +62,8 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 
 	ROCKET_IOCTL(CREATE_BO, create_bo),
 	ROCKET_IOCTL(SUBMIT, submit),
+	ROCKET_IOCTL(PREP_BO, prep_bo),
+	ROCKET_IOCTL(FINI_BO, fini_bo),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index 61b7f970a6885aa13784daa1222611a02aa10dee..07024b6e71bf544dc7f00b008b9afb74b0c4e802 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -113,3 +113,85 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 
 	return ret;
 }
+
+static inline enum dma_data_direction rocket_op_to_dma_dir(u32 op)
+{
+	op &= ROCKET_PREP_READ | ROCKET_PREP_WRITE;
+
+	if (op == ROCKET_PREP_READ)
+		return DMA_FROM_DEVICE;
+	else if (op == ROCKET_PREP_WRITE)
+		return DMA_TO_DEVICE;
+	else
+		return DMA_BIDIRECTIONAL;
+}
+
+int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_rocket_prep_bo *args = data;
+	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
+	struct rocket_device *rdev = to_rocket_device(dev);
+	struct drm_gem_object *gem_obj;
+	struct drm_gem_shmem_object *shmem_obj;
+	bool write = !!(args->op & ROCKET_PREP_WRITE);
+	long ret = 0;
+
+	if (args->op & ~(ROCKET_PREP_READ | ROCKET_PREP_WRITE))
+		return -EINVAL;
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	ret = dma_resv_wait_timeout(gem_obj->resv, dma_resv_usage_rw(write),
+				    true, timeout);
+	if (!ret)
+		ret = timeout ? -ETIMEDOUT : -EBUSY;
+
+	shmem_obj = &to_rocket_bo(gem_obj)->base;
+
+	for (unsigned int core = 1; core < rdev->num_cores; core++) {
+		dma_sync_sgtable_for_cpu(rdev->cores[core].dev, shmem_obj->sgt,
+					 rocket_op_to_dma_dir(args->op));
+	}
+
+	to_rocket_bo(gem_obj)->last_cpu_prep_op = args->op;
+
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
+
+int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct rocket_device *rdev = to_rocket_device(dev);
+	struct drm_rocket_fini_bo *args = data;
+	struct drm_gem_shmem_object *shmem_obj;
+	struct rocket_gem_object *rkt_obj;
+	struct drm_gem_object *gem_obj;
+
+	if (args->reserved != 0) {
+		drm_dbg(dev, "Reserved field in drm_rocket_fini_bo struct should be 0.\n");
+		return -EINVAL;
+	}
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	rkt_obj = to_rocket_bo(gem_obj);
+	shmem_obj = &rkt_obj->base;
+
+	WARN_ON(rkt_obj->last_cpu_prep_op == 0);
+
+	for (unsigned int core = 1; core < rdev->num_cores; core++) {
+		dma_sync_sgtable_for_device(rdev->cores[core].dev, shmem_obj->sgt,
+					    rocket_op_to_dma_dir(rkt_obj->last_cpu_prep_op));
+	}
+
+	rkt_obj->last_cpu_prep_op = 0;
+
+	drm_gem_object_put(gem_obj);
+
+	return 0;
+}
diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/rocket_gem.h
index e8a4d6213fd80419be2ec8af04583a67fb1a4b75..a52a63cd78339a6150b99592ab5f94feeeb51fde 100644
--- a/drivers/accel/rocket/rocket_gem.h
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -12,12 +12,17 @@ struct rocket_gem_object {
 	struct iommu_domain *domain;
 	size_t size;
 	u32 offset;
+	u32 last_cpu_prep_op;
 };
 
 struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t size);
 
 int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file);
 
+int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *file);
+
+int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file);
+
 static inline
 struct  rocket_gem_object *to_rocket_bo(struct drm_gem_object *obj)
 {
diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
index cb1b5934c201160e7650aabd1b3a2b1c77b1fd7b..b5c80dd767be56e9720b51e4a82617a425a881a1 100644
--- a/include/uapi/drm/rocket_accel.h
+++ b/include/uapi/drm/rocket_accel.h
@@ -13,9 +13,13 @@ extern "C" {
 
 #define DRM_ROCKET_CREATE_BO			0x00
 #define DRM_ROCKET_SUBMIT			0x01
+#define DRM_ROCKET_PREP_BO			0x02
+#define DRM_ROCKET_FINI_BO			0x03
 
 #define DRM_IOCTL_ROCKET_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_ROCKET_CREATE_BO, struct drm_rocket_create_bo)
 #define DRM_IOCTL_ROCKET_SUBMIT			DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET_SUBMIT, struct drm_rocket_submit)
+#define DRM_IOCTL_ROCKET_PREP_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET_PREP_BO, struct drm_rocket_prep_bo)
+#define DRM_IOCTL_ROCKET_FINI_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET_FINI_BO, struct drm_rocket_fini_bo)
 
 /**
  * struct drm_rocket_create_bo - ioctl argument for creating Rocket BOs.
@@ -39,6 +43,39 @@ struct drm_rocket_create_bo {
 	__u64 offset;
 };
 
+#define ROCKET_PREP_READ        0x01
+#define ROCKET_PREP_WRITE       0x02
+
+/**
+ * struct drm_rocket_prep_bo - ioctl argument for starting CPU ownership of the BO.
+ *
+ * Takes care of waiting for any NPU jobs that might still use the NPU and performs cache
+ * synchronization.
+ */
+struct drm_rocket_prep_bo {
+	/** Input: GEM handle of the buffer object. */
+	__u32 handle;
+
+	/** Input: mask of ROCKET_PREP_x, direction of the access. */
+	__u32 op;
+
+	/** Input: Amount of time to wait for NPU jobs. */
+	__s64 timeout_ns;
+};
+
+/**
+ * struct drm_rocket_fini_bo - ioctl argument for finishing CPU ownership of the BO.
+ *
+ * Synchronize caches for NPU access.
+ */
+struct drm_rocket_fini_bo {
+	/** Input: GEM handle of the buffer object. */
+	__u32 handle;
+
+	/** Reserved, must be zero. */
+	__u32 reserved;
+};
+
 /**
  * struct drm_rocket_task - A task to be run on the NPU
  *

-- 
2.49.0

