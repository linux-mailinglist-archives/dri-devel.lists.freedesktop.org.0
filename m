Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C23419D878
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE25C6EBF6;
	Fri,  3 Apr 2020 13:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F252B6EBF8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:59:23 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m17so8611649wrw.11
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37MbQdW7wnuPxzMpa2O3lGBreE0hYjYyHaUQlX4ufO0=;
 b=XhNyEYSelUAB1ZmjdwxtIkrY3wFwSDeVStzvhSxXJYdsCqnIK/zKO+BTj+p3Q9v0qM
 5x9nb+yqfWhb0H54zPc0zsV2j1/It3J6r/bB+al+okEm9hlvI6yvLc6VAgKJrEfFAHQ+
 Ja0d+PN9q+T8fdhlHcRUKyleUMI02HrzTCZLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37MbQdW7wnuPxzMpa2O3lGBreE0hYjYyHaUQlX4ufO0=;
 b=YPJxTF06LxT9Htze2hdSFijvKEI7gAJczrC4NBLVC8Ken5S6Ig8kYBRCn/1qO9YXBr
 4uEsqnLo/LA45Wwv/dtBitAMHozrF9louvpV2H4y/F+aRqVdI01MxKh1aKVQQGVupq7w
 o8QC3wCrah8Ugws6FsgTIQBjSZEmF9Dm3JD+XU6oZcUO5LBdO1t3zefdcfzF3gO/sqzm
 yRgXDhw8V8NwJSZsr8KS2z+ueFFM27k3VQ9eYyL0Vf1NP+aeI4wyLyVOeTvIrIJeHGcP
 WdzWeDxmo0cWV//1FhJgfY4Hhx2eAlJk27W8+gUeXifDNNYXZJuvp9aCm9Qn1stdrwC1
 Y03A==
X-Gm-Message-State: AGi0PubskEldf5D6mz+V9Gf43OKYiUH8rgtGXiezeOycVFHlGnrnAl+2
 EQcvYNJx8q4yk04uBud/PDKLklPBggpRMw==
X-Google-Smtp-Source: APiQypK7KoccTFArUNn3QOGydjBeIdO90yWgh5zPzzJmicUmsNwEEYEK1Kg2q1fPF75T1utidHjP4Q==
X-Received: by 2002:adf:b35d:: with SMTP id k29mr9399268wrd.239.1585922362054; 
 Fri, 03 Apr 2020 06:59:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:21 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 42/44] drm/i915/selftest: Create mock_destroy_device
Date: Fri,  3 Apr 2020 15:58:26 +0200
Message-Id: <20200403135828.2542770-43-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just some prep work before we rework the lifetime handling, which
requires replacing all the drm_dev_put in selftests by something else.

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
 drivers/gpu/drm/i915/selftests/mock_gem_device.c      | 2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.h      | 5 +++++
 13 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 2d0fd50c5312..d19bb011fc6b 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1789,7 +1789,7 @@ int i915_gem_huge_page_mock_selftests(void)
 	i915_vm_put(&ppgtt->vm);
 
 out_unlock:
-	drm_dev_put(&dev_priv->drm);
+	mock_destroy_device(dev_priv);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index f4f933240b39..d9d96d23e37e 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -1986,7 +1986,7 @@ int i915_gem_context_mock_selftests(void)
 
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
index 2b6db6f799de..085644edebfc 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
@@ -85,7 +85,7 @@ int i915_gem_object_mock_selftests(void)
 
 	err = i915_subtests(tests, i915);
 
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
index 34932871b3a5..2a9709eb5a42 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
@@ -73,6 +73,6 @@ int i915_gem_phys_mock_selftests(void)
 
 	err = i915_subtests(tests, i915);
 
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 	return err;
 }
diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/drm/i915/gt/selftest_timeline.c
index c2578a0f2f14..1c0865227714 100644
--- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
+++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
@@ -157,7 +157,7 @@ static int mock_hwsp_freelist(void *arg)
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
index 5d2a02fcf595..035e4f77f06f 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -1714,7 +1714,7 @@ int i915_gem_gtt_mock_selftests(void)
 	mock_fini_ggtt(ggtt);
 	kfree(ggtt);
 out_put:
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 1dab0360f76a..6bc6a2fc83ab 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -521,7 +521,7 @@ int i915_request_mock_selftests(void)
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
 		err = i915_subtests(tests, i915);
 
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 58b5f40a07dd..7d51cc2da36f 100644
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
index 6e80d99048e4..5226767d5384 100644
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
index 9b105b811f1f..03607647cdeb 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -214,7 +214,7 @@ struct drm_i915_private *mock_gem_device(void)
 	intel_gt_driver_late_release(&i915->gt);
 	intel_memory_regions_driver_release(i915);
 	drm_mode_config_cleanup(&i915->drm);
-	drm_dev_put(&i915->drm);
+	mock_destroy_device(i915);
 
 	return NULL;
 }
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.h b/drivers/gpu/drm/i915/selftests/mock_gem_device.h
index b5dc4e394555..2e3c7585a7bb 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.h
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.h
@@ -7,4 +7,9 @@ struct drm_i915_private;
 struct drm_i915_private *mock_gem_device(void);
 void mock_device_flush(struct drm_i915_private *i915);
 
+static inline void mock_destroy_device(struct drm_i915_private *i915)
+{
+	drm_dev_put(&i915->drm);
+}
+
 #endif /* !__MOCK_GEM_DEVICE_H__ */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
