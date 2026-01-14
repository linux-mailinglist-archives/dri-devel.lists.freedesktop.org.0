Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0A6D1D37D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 09:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DD710E3A7;
	Wed, 14 Jan 2026 08:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3FB10E3A7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:47:27 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-64b9b0b4d5dso17832576a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 00:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768380445; x=1768985245;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MFgbGKta1WWetg8kikPQgA/0YVVbzxRzodQq2Gmv8S8=;
 b=CLmVGKgjDlvZ62tIpNArYVyw2MdMk8j+rqipr7oA+S632Q+2N9fQSPy9nJVQa7evyR
 utptudmvi8HlpbJJE+JzV71ycJpEPc9Ze6eQEnfYSyIAdN9hizui8vtho/HKSDS6DWEC
 Z9aL4LHNN3zzjNjZTZZYQCS3xY0LsCDUKOEJcSsvuSRZxTYgcAkEXPkUWNMPdh+1HAIV
 Gv5glwm2NZu67R8fIGL6BA+bPzWSceXyjIrmwS+XwlG/TYKzyQ32BO/qGFnEKythKcj/
 riQbzsLqgvpB1ihSa24M9WjIQ05+FI560hSeKj2mquzv6ql4+nsoYInNSiTjVIAKfOLS
 kdiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWst9yU0Nrx30ZWMeEST40DF38oUmCTC6gQYQZ5w7+pVR6znMyxebSXcxJNcEFXJPPPMJGeu2PryyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9fbPPAGrAYPEmSEEmQIuyyvMYx77n5oEEnSw0hvuHCdLyqlcm
 91Ml4rOf7QNZ4DZGX2mOu3vfsUis/914K2HdQXK9mHoxPi6KzxftXZ+/
X-Gm-Gg: AY/fxX6CrbfFFJfQbxEdXdIJ30/T8fFiqfNUHdLoveT0/MFc1RHthMHOyZhRFzYQMy+
 2Eyc2KTdh4rRHRhSnxlE0Lp/xWhKIbIUKAzFxG0iREjEbVIhmID0WpyFTDOQg9Gl2JqkO16Kx5A
 fZ22rcKeXBGa6fjkWO/7M8CCTHPXA8BXPNz3d/DUWwT9EoV2N2N1uO/deT3cvKmmE93T0MnV3Uw
 c9e9l63FZG7Yu7mwc8QM2PEMMC8XJk73ttykgvutNYGe7Sqb6YzjPtUof5VWV9pMm4hHZwMMbaf
 ZZuOkmvR8AehPF5zi+X1FNjZ/SaQ/7r3owCXgR6bsAmN1aT9mnDzGsvC/+7JQeFBBdm7pVhjcL0
 qDAVYREpfe6juR1JQrlPy3IdOZis3dbR6oH1CJ5tYOpXKeZI/JQy+weYW3jsuTw7d2K/UJnP3l+
 axJ3HuJrPh5KCnsAqqN7OrMB5mGU0YCxI8rCQHkV8fVm7016D0YhwSMf3s
X-Received: by 2002:a05:6402:790:b0:640:e75a:f95d with SMTP id
 4fb4d7f45d1cf-653ec12583bmr1081734a12.15.1768380445470; 
 Wed, 14 Jan 2026 00:47:25 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507bf6d5d4sm22379136a12.32.2026.01.14.00.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 00:47:25 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 14 Jan 2026 09:46:52 +0100
Subject: [PATCH v2 5/5] accel/thames: Add IOCTL for memory synchronization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-thames-v2-5-e94a6636e050@tomeuvizoso.net>
References: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
In-Reply-To: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
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

The DSP cores have their own access to the memory bus, and it isn't
cache coherent with the CPUs.

Add IOCTLs so userspace can mark when the caches need to be flushed, and
also when a writer job needs to be waited for before the buffer can be
accessed from the CPU.

Initially based on the same IOCTLs from the Etnaviv driver.

v2:
- Add thames_accel.h UAPI header (Robert Nelson).

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/thames/thames_drv.c |  2 ++
 drivers/accel/thames/thames_gem.c | 52 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/thames/thames_gem.h |  4 +++
 include/uapi/drm/thames_accel.h   | 31 +++++++++++++++++++++++
 4 files changed, 89 insertions(+)

diff --git a/drivers/accel/thames/thames_drv.c b/drivers/accel/thames/thames_drv.c
index 1ff01428e6c80765cb741ae45c67971b7b0f28c8..6993d503139d3aaef830cdf5cfcf38476c5f9d99 100644
--- a/drivers/accel/thames/thames_drv.c
+++ b/drivers/accel/thames/thames_drv.c
@@ -76,6 +76,8 @@ static const struct drm_ioctl_desc thames_drm_driver_ioctls[] = {
 	THAMES_IOCTL(BO_CREATE, bo_create),
 	THAMES_IOCTL(BO_MMAP_OFFSET, bo_mmap_offset),
 	THAMES_IOCTL(SUBMIT, submit),
+	THAMES_IOCTL(BO_PREP, bo_prep),
+	THAMES_IOCTL(BO_FINI, bo_fini),
 };
 
 DEFINE_DRM_ACCEL_FOPS(thames_accel_driver_fops);
diff --git a/drivers/accel/thames/thames_gem.c b/drivers/accel/thames/thames_gem.c
index 5a01ddaeb2448117d400a79e53d2c6123ecb5390..4ded8fab0f3ff6f75a1446c5661fdbc68f1f2ac7 100644
--- a/drivers/accel/thames/thames_gem.c
+++ b/drivers/accel/thames/thames_gem.c
@@ -351,3 +351,55 @@ int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_
 
 	return 0;
 }
+
+int thames_ioctl_bo_prep(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct drm_thames_bo_prep *args = data;
+	struct drm_gem_object *gem_obj;
+	struct drm_gem_shmem_object *shmem_obj;
+	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
+	long ret = 0;
+
+	if (args->reserved != 0)
+		return -EINVAL;
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	ret = dma_resv_wait_timeout(gem_obj->resv, DMA_RESV_USAGE_WRITE, true, timeout);
+	if (!ret)
+		ret = timeout ? -ETIMEDOUT : -EBUSY;
+
+	shmem_obj = &to_thames_bo(gem_obj)->base;
+
+	dma_sync_sgtable_for_cpu(ddev->dev, shmem_obj->sgt, DMA_FROM_DEVICE);
+
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
+
+int thames_ioctl_bo_fini(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct drm_thames_bo_fini *args = data;
+	struct drm_gem_shmem_object *shmem_obj;
+	struct thames_gem_object *thames_obj;
+	struct drm_gem_object *gem_obj;
+
+	if (args->reserved != 0)
+		return -EINVAL;
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	thames_obj = to_thames_bo(gem_obj);
+	shmem_obj = &thames_obj->base;
+
+	dma_sync_sgtable_for_device(ddev->dev, shmem_obj->sgt, DMA_TO_DEVICE);
+
+	drm_gem_object_put(gem_obj);
+
+	return 0;
+}
diff --git a/drivers/accel/thames/thames_gem.h b/drivers/accel/thames/thames_gem.h
index 785843c40a89a9e84ab634aad77e9ec46111693e..e5a8278e98c578c2903cf23aea1bf887be0389e8 100644
--- a/drivers/accel/thames/thames_gem.h
+++ b/drivers/accel/thames/thames_gem.h
@@ -29,6 +29,10 @@ int thames_ioctl_bo_create(struct drm_device *ddev, void *data, struct drm_file
 
 int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_file *file);
 
+int thames_ioctl_bo_prep(struct drm_device *ddev, void *data, struct drm_file *file);
+
+int thames_ioctl_bo_fini(struct drm_device *ddev, void *data, struct drm_file *file);
+
 int thames_context_create(struct thames_file_priv *priv);
 
 void thames_context_destroy(struct thames_file_priv *priv);
diff --git a/include/uapi/drm/thames_accel.h b/include/uapi/drm/thames_accel.h
index 5b35e50826ed95bfcc3709bef33416d2b6d11c70..07477087211c14721298ff52a1f3d253a6e65d58 100644
--- a/include/uapi/drm/thames_accel.h
+++ b/include/uapi/drm/thames_accel.h
@@ -31,6 +31,12 @@ enum drm_thames_ioctl_id {
 
 	/** @DRM_THAMES_SUBMIT: Submit a job and BOs to run. */
 	DRM_THAMES_SUBMIT,
+
+	/** @DRM_THAMES_BO_PREP: Prepare a BO for CPU access after DSP writes. */
+	DRM_THAMES_BO_PREP,
+
+	/** @DRM_THAMES_BO_FINI: Finish CPU access and prepare BO for DSP access. */
+	DRM_THAMES_BO_FINI,
 };
 
 /**
@@ -127,6 +133,27 @@ struct drm_thames_submit {
 	__u32 pad;
 };
 
+/**
+ * struct drm_thames_bo_prep - ioctl argument for preparing a BO for CPU access.
+ *
+ * This invalidates CPU caches and waits for pending DSP operations to complete.
+ */
+struct drm_thames_bo_prep {
+	__u32 handle;
+	__u32 reserved;
+	__s64 timeout_ns;	/* absolute */
+};
+
+/**
+ * struct drm_thames_bo_fini - ioctl argument for finishing CPU access to a BO.
+ *
+ * This flushes CPU caches to make CPU writes visible to the DSP.
+ */
+struct drm_thames_bo_fini {
+	__u32 handle;
+	__u32 reserved;
+};
+
 /**
  * DRM_IOCTL_THAMES() - Build a thames IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -149,6 +176,10 @@ enum {
 		DRM_IOCTL_THAMES(WR, BO_MMAP_OFFSET, bo_mmap_offset),
 	DRM_IOCTL_THAMES_SUBMIT =
 		DRM_IOCTL_THAMES(WR, SUBMIT, submit),
+	DRM_IOCTL_THAMES_BO_PREP =
+		DRM_IOCTL_THAMES(WR, BO_PREP, bo_prep),
+	DRM_IOCTL_THAMES_BO_FINI =
+		DRM_IOCTL_THAMES(WR, BO_FINI, bo_fini),
 };
 
 #if defined(__cplusplus)

-- 
2.52.0

