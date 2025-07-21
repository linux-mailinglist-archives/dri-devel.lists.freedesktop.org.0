Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D78FB0BFD9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 11:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758B810E4B2;
	Mon, 21 Jul 2025 09:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F8510E4B4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:18:16 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ae0d7b32322so619211266b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 02:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753089495; x=1753694295;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H72rn8ogX3KhM94X5uibatMEZGkDkzHDrTXRw3fgC8g=;
 b=t3ZDtifnCULaNfH2EmzVAikadJ6wm7c2xb0qFmyUK+diqiHpUzQmcNx66RAm/A2Z4J
 REAW7wsH7/U3OWRiTE/Wsutz3pJ4geR9bm91imT/PnAvthNJBbU2TQ1hx5YJs1wsZiyu
 zDdiBl9lua/egT+Dsq6W1FIfTOqG6nSCRq5s7+1jun2Qn1cnu/uuQL1HW+3gyj/xm1Wl
 0P+3Rha9fYpNmwhfA3Fzj5gNkvaotBYoLwstTf/HZXL12nHuZ4WXSu+er5fmLqh8o51l
 hY2AIDFq6+TF1gBrBFCSQSu2GkdYQ4GmeDv0HZbtRo31psn31IMFGK6iqrtFLK2d/rzA
 Ggmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLYLQIpOIPOiC2dQm/oJzDE9vRpEYFqViK8kXRQUJs4gKoofRtv6hD5AvukwGT1MtJH+HggwJfzsI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAm1uFZUAbml00QG58+xC8NGlW0ZDFLEKWTcMoUPPdVrWCkUA1
 VxFDoHGO3CadGsm4dajsdsk2zdkUm3GGFCcz4YFOJGcRPnEK+STNilKF
X-Gm-Gg: ASbGncvTONNK/Qu9Til8aNU5kbRbTQGz/KOUohRMkuizE38fz0WRpfu5OpnJUgdKppx
 ebFYt+m2S7PeyNFQHoHxO8pfn0meLWj3YNb6PHSbS/8L5uzOxNu+daCJC3Egnm3OGLb3NI0Vu0Z
 888FRaXRYYRaSD+dELVjh013uoAMykzdpAvVeziQT+3vkNGqsAqCi52pcsNCIa5q3hqyxPvnoJ8
 loHOwc7AGkLTZUCx6I4F2ffKeOZ+yRaOQ1gbPeTPyFAniCRtbTlhxcyMJcQ5znwrQu3/5pvfj1Y
 kQwqcWcjef+IqPR0EY/xDH5S9nSF52pZxMG6GuONNuKPcW5N+TUfHFaZwmOs+Hwyy4F9HiEXeKJ
 /GodCGHNjRNoF2te9jCpmfMbjllNxiFGr7xvPnDsZYJvCJR0cMxs8y/3A
X-Google-Smtp-Source: AGHT+IGo3DwC+0zvTvAmIYLz28EIx6yOrASpSp5JNWg89ZYrk4pHiToCTuaIip14TiXolC0UklqQVQ==
X-Received: by 2002:a17:907:7f0e:b0:ae6:859a:9e6c with SMTP id
 a640c23a62f3a-ae9cdda300dmr1844078966b.3.1753089495052; 
 Mon, 21 Jul 2025 02:18:15 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca2efc1sm643125266b.83.2025.07.21.02.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 02:18:14 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 21 Jul 2025 11:17:32 +0200
Subject: [PATCH v9 05/10] accel/rocket: Add IOCTLs for synchronizing memory
 accesses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-6-10-rocket-v9-5-77ebd484941e@tomeuvizoso.net>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
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
 Philipp Zabel <p.zabel@pengutronix.de>, 
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

v8:
- Always sync BOs in both directions (Robin Murphy)

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/rocket/rocket_drv.c |  2 ++
 drivers/accel/rocket/rocket_gem.c | 56 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_gem.h |  4 +++
 include/uapi/drm/rocket_accel.h   | 34 ++++++++++++++++++++++++
 4 files changed, 96 insertions(+)

diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index a21aa9aa189ba585c70fbf57d2a41fb578357efd..5c0b63f0a8f00dc71060e7177d0ed1ca15755ec4 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -134,6 +134,8 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 
 	ROCKET_IOCTL(CREATE_BO, create_bo),
 	ROCKET_IOCTL(SUBMIT, submit),
+	ROCKET_IOCTL(PREP_BO, prep_bo),
+	ROCKET_IOCTL(FINI_BO, fini_bo),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index 05cf46040865c01fe14a169c865227780f2db679..0551e11cc184143a582d1718a621e22086217ad9 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -123,3 +123,59 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 
 	return ret;
 }
+
+int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_rocket_prep_bo *args = data;
+	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
+	struct drm_gem_object *gem_obj;
+	struct drm_gem_shmem_object *shmem_obj;
+	long ret = 0;
+
+	if (args->reserved != 0) {
+		drm_dbg(dev, "Reserved field in drm_rocket_prep_bo struct should be 0.\n");
+		return -EINVAL;
+	}
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	ret = dma_resv_wait_timeout(gem_obj->resv, DMA_RESV_USAGE_WRITE, true, timeout);
+	if (!ret)
+		ret = timeout ? -ETIMEDOUT : -EBUSY;
+
+	shmem_obj = &to_rocket_bo(gem_obj)->base;
+
+	dma_sync_sgtable_for_cpu(dev->dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
+
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
+
+int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file)
+{
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
+	dma_sync_sgtable_for_device(dev->dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
+
+	drm_gem_object_put(gem_obj);
+
+	return 0;
+}
diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/rocket_gem.h
index 91a1fc09c56ce483ebe80959e1a7ff934867bedc..24043033450941cb866a21378875810c6e8b9323 100644
--- a/drivers/accel/rocket/rocket_gem.h
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -21,6 +21,10 @@ struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t s
 
 int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file);
 
+int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *file);
+
+int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file);
+
 static inline
 struct  rocket_gem_object *to_rocket_bo(struct drm_gem_object *obj)
 {
diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
index 374f8370ac9df6944fdb6ef06e56f15226e072ba..14b2e12b7c49288a84e645570cdeb815cd632d96 100644
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
@@ -39,6 +43,36 @@ struct drm_rocket_create_bo {
 	__u64 offset;
 };
 
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
+	/** Reserved, must be zero. */
+	__u32 reserved;
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
2.50.0

