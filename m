Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA67F26FE34
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 15:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B73C6ECF8;
	Fri, 18 Sep 2020 13:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C128F6ECF1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 13:25:13 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b79so5565550wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 06:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OKsZKeGF/oKuwjD45gDaPBlOWbb956a2d4in7boDJ+g=;
 b=FatEyEj3qH2OqZmc2kwDTGXASUhtz7dcN0advILQbhPJz8inMZDQ4WI2fSQ9BLh1gc
 iCyJ1+qsBUrdN7YbYb9LHM0ev4p1gP002/S5nOTUSd6xeA59bALvkzzovwo+psYXHqHc
 wqZrMq6BwFlCMuJDB9TpHN81uPMVTLjkWEoMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OKsZKeGF/oKuwjD45gDaPBlOWbb956a2d4in7boDJ+g=;
 b=T4Ynj2xMDx8/ou2F/VvQsQ2hHk8I9zi3389erxIM9ZHMZcMb62jTqXLMZ7qPVf0pBq
 yNbgJY4fYDj2KRrkhkIYjOkSvn44kxp5I3ZlBGksRTGBl0GcjPkTpXpWn+l46g0w8Bjs
 UnPkYxDuL0Dk3KfA0gVqYYdA5EfbRf2fuyjl2+sTZmxBp974wdp/R6xn4DgsJMEhWufC
 SQsyK1fAyHLiCblL9metQuE9tBpkxl3qT4daTM78umZDZsCYYdZBkG/HqkB7nvLYPXY0
 ArAct/iQTkM/0rvKevCtJX3idx9FXO7NNNTOL9ubAqPhYfP13U7iVTYsJgxilb78iOCO
 wCyQ==
X-Gm-Message-State: AOAM533u0AXSIM+C6watQCxnrgvCKpY4935QR+wlDZ55E3MAEj12xGYW
 i19lutTJDnQdDUBGA3q75XrGYDb8iL9eBx5W
X-Google-Smtp-Source: ABdhPJx/1nyq22k8LCioO1NyWYjQIDaGjDtAJ20T9ky7zgvHsYUavswNF+QtkO3Vx3wDq6uRAyPcMg==
X-Received: by 2002:a1c:6487:: with SMTP id y129mr16383729wmb.90.1600435512077; 
 Fri, 18 Sep 2020 06:25:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k6sm4872693wmi.1.2020.09.18.06.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 06:25:11 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/i915/selftest: Create mock_destroy_device
Date: Fri, 18 Sep 2020 15:25:02 +0200
Message-Id: <20200918132505.2316382-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918132505.2316382-1-daniel.vetter@ffwll.ch>
References: <20200918132505.2316382-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just some prep work before we rework the lifetime handling, which
requires replacing all the drm_dev_put in selftests by something else.

v2: Don't go with a static inline, upsets the header tests and
separation.

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c       | 2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c  | 2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c  | 2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c    | 2 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c           | 2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_evict.c       | 2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c         | 2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c         | 2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c             | 2 +-
 drivers/gpu/drm/i915/selftests/intel_memory_region.c  | 2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c      | 7 ++++++-
 drivers/gpu/drm/i915/selftests/mock_gem_device.h      | 2 ++
 13 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 5daf4a2be422..1f35e71429b4 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1617,7 +1617,7 @@ int i915_gem_huge_page_mock_selftests(void)
 out_put:
 	i915_vm_put(&ppgtt->vm);
 out_unlock:
-	drm_dev_put(&dev_priv->drm);
+	mock_destroy_device(dev_priv);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index 99becb86abd3..d3f87dc4eda3 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -1997,7 +1997,7 @@ int i915_gem_context_mock_selftests(void)
 
 	err = i915_subtests(tests, i915);
 
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 2a52b92586b9..0845ce1ae37c 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -272,7 +272,7 @@ int i915_gem_dmabuf_mock_selftests(void)
 
 	err = i915_subtests(tests, i915);
 
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
index faa5b6d91795..bf853c40ec65 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
@@ -85,7 +85,7 @@ int i915_gem_object_mock_selftests(void)
 
 	err = i915_subtests(tests, i915);
 
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
index a94243dc4c5c..8cee68c6a6dc 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
@@ -73,6 +73,6 @@ int i915_gem_phys_mock_selftests(void)
 
 	err = i915_subtests(tests, i915);
 
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 	return err;
 }
diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/drm/i915/gt/selftest_timeline.c
index 96d164a3841d..19c2cb166e7c 100644
--- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
+++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
@@ -158,7 +158,7 @@ static int mock_hwsp_freelist(void *arg)
 		__mock_hwsp_record(&state, na, NULL);
 	kfree(state.history);
 err_put:
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
index 028baae9631f..f88473d396f4 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
@@ -536,7 +536,7 @@ int i915_gem_evict_mock_selftests(void)
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
 		err = i915_subtests(tests, &i915->gt);
 
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index af8205a2bd8f..c53a222e3dec 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -1727,7 +1727,7 @@ int i915_gem_gtt_mock_selftests(void)
 	mock_fini_ggtt(ggtt);
 	kfree(ggtt);
 out_put:
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 3092ca763789..64bbb8288249 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -527,7 +527,7 @@ int i915_request_mock_selftests(void)
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
 		err = i915_subtests(tests, i915);
 
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 88c5e9acb84c..1b6125e4c1ac 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -841,7 +841,7 @@ int i915_vma_mock_selftests(void)
 	mock_fini_ggtt(ggtt);
 	kfree(ggtt);
 out_put:
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index 93a38a323584..334b0648e253 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -791,7 +791,7 @@ int intel_memory_region_mock_selftests(void)
 
 	intel_memory_region_put(mem);
 out_unref:
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 397c313a8b69..ac600d395c8f 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -222,7 +222,12 @@ struct drm_i915_private *mock_gem_device(void)
 	intel_gt_driver_late_release(&i915->gt);
 	intel_memory_regions_driver_release(i915);
 	drm_mode_config_cleanup(&i915->drm);
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 
 	return NULL;
 }
+
+void mock_destroy_device(struct drm_i915_private *i915)
+{
+	drm_dev_put(&i915->drm);
+}
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.h b/drivers/gpu/drm/i915/selftests/mock_gem_device.h
index b5dc4e394555..953cfe4fab34 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.h
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.h
@@ -7,4 +7,6 @@ struct drm_i915_private;
 struct drm_i915_private *mock_gem_device(void);
 void mock_device_flush(struct drm_i915_private *i915);
 
+void mock_destroy_device(struct drm_i915_private *i915);
+
 #endif /* !__MOCK_GEM_DEVICE_H__ */
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
