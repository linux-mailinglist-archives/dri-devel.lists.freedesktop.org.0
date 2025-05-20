Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F047BABD4A4
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 12:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BAF10E4D9;
	Tue, 20 May 2025 10:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EDF10E4D9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 10:27:41 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-442f5b3c710so43184725e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 03:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747736859; x=1748341659;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sno2TxM6nh2qfS6yS7wci8cH+EcvTWnBUgzpoh/6UDI=;
 b=A4FlREH8Ww3O06w+OMqAeXZttlsWTKFNzX76Dt4DA3Ji+Dso5UxG/XoBh5aiTYNxtU
 x4PKrubliujFSjmWKumKVtA/MQrHq29bazlsjo+7ACQnOi1NFtuemEkfp6QRnvWjbB0T
 WL4UKfjkckLvkaClyLalqwSyhuDr77enWNfvjW6+s8Pb/TIkvZeevxdr/gx3Bu94lUOP
 bc5rWGfgo41MRUZYYiCfTFO45Z1dZgwUM6/XYgognFhklOf7MtzeKquVaYJ/l4tdx9Lu
 1pyo6M7ibkhV0fI+7LtUU/uI0NXBQURc7NYLxgBzYOWmRJYwcZ3gh5VRURfafuEuEIU/
 qjBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6CIsdxTCJ/tjAiHd+Djm7ryo6iM1Wo+w76hkUULWt0Ry7jAfH+1pLYMtao5iAK0/+RJVbuuk4bBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf2T2+CCsCWmkawkGkMp01pLdW7rmpe0zd1UY3yCsCDAeA6m2u
 SG5+H6ddctvchLVYciTyI08AMQ2OukUFc1GqucijBTPHH1QlI9/qTUrI
X-Gm-Gg: ASbGnct4IH/CxUCwl9SZmTt1wDA3WIr2mgD6gXkK50/965qL2vYp8UJmDW2JhKE6PXO
 buaiFPQ18ixrXqLgQFCqGSR0ugyo3Nb//OJd4Q4dgM9qdYz01G4A4Cykf/+Hfg/bgzL8ELjIfE8
 gROQBla1F2WMkyGC1jcSTBYqBdOR3p03wpIbs797Yp+2ECxH8iA8l6HgZtzyV7EnBJyVQm1dszb
 PVcSbVlRb+J7JcpoN3h2c07vhfWLed2qgWFBgPtAezgfB7iKVE08SpjtnDXsdw4BiNsndeZKLp4
 26rLqX8Nd1t9sMCxKjMvoEi3qdhx4hXetqIqtgCLqaiTNb6sudWtCWCm03p2SoUhhq0zXpp+Ajo
 Qn218o1/nIA==
X-Google-Smtp-Source: AGHT+IFVeV+SJDiHq/M1Mn0wviBi4rkXrBqwt1IdCIq93iABKAxWCW3N64g4uPR2N467hpXo1zwylQ==
X-Received: by 2002:a05:600c:34d4:b0:442:e0e0:250 with SMTP id
 5b1f17b1804b1-442fd67200emr148769165e9.29.1747736859396; 
 Tue, 20 May 2025 03:27:39 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f73d3defsm24680025e9.18.2025.05.20.03.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 03:27:38 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 20 May 2025 12:27:01 +0200
Subject: [PATCH v5 08/10] accel/rocket: Add IOCTLs for synchronizing memory
 accesses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-6-10-rocket-v5-8-18c9ca0fcb3c@tomeuvizoso.net>
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
In-Reply-To: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
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
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
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

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/rocket/rocket_drv.c |  2 +
 drivers/accel/rocket/rocket_gem.c | 80 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_gem.h |  5 +++
 include/uapi/drm/rocket_accel.h   | 37 ++++++++++++++++++
 4 files changed, 124 insertions(+)

diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index fef9b93372d3f65c41c1ac35a9bfa0c01ee721a5..c06e66939e6c39909fe08bef3c4f301b07bf8fbf 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -59,6 +59,8 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 
 	ROCKET_IOCTL(CREATE_BO, create_bo),
 	ROCKET_IOCTL(SUBMIT, submit),
+	ROCKET_IOCTL(PREP_BO, prep_bo),
+	ROCKET_IOCTL(FINI_BO, fini_bo),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index 8a8a7185daac4740081293aae6945c9b2bbeb2dd..cdc5238a93fa5978129dc1ac8ec8de955160dc18 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -129,3 +129,83 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 
 	return ret;
 }
+
+static inline enum dma_data_direction rocket_op_to_dma_dir(u32 op)
+{
+	if (op & ROCKET_PREP_READ)
+		return DMA_FROM_DEVICE;
+	else if (op & ROCKET_PREP_WRITE)
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
index 41497554366961cfe18cf6c7e93ab1e4e5dc1886..2caa268f7f496f782996c6ad2c4eb851a225a86f 100644
--- a/drivers/accel/rocket/rocket_gem.h
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -11,12 +11,17 @@ struct rocket_gem_object {
 
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

