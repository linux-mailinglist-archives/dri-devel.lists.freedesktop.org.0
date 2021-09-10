Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F981406862
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 10:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD8E6E98C;
	Fri, 10 Sep 2021 08:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C196E98C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 08:27:04 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q26so1446945wrc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=byLSDqjdKi3+cE2IMMDe/R3eVJ9OpfF5t0/Jijtn6q0=;
 b=M1RjKlSJECx4MS0DsZ1oArWcYKVcShptg1wsRAotmw1sniqngIJqtiAE3qMaCmkPLX
 lEG/vaQf3P4qw3rCZbxGt2y8/sIT539y5GkEQhbx/ui7Ao/GlSSvixm2fN7a9mJMoG/+
 01Gqs805XQAF/rJFxdViLwn3FBTNqb8d1BEP32pqLh187NRgc91uKspSGsjRasIbusy7
 xH9UK/jcaGUslitEmn3CuvD/FNeYb5ZP6uIpXNbGSaA/fBj+waWwo4rGG2r5Gg3cQwxY
 vMxnCGBhwrWq9f2+Lkf2R6xBkcpzqSpk25ce5oQ4ssN+anqUm1qMLZWDAqxrBKF6Iq46
 fxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=byLSDqjdKi3+cE2IMMDe/R3eVJ9OpfF5t0/Jijtn6q0=;
 b=liGOfFSgYPtKWrhjCvZazc/yJpVX08shZJiBpaOkIPtRvPcUvkjzSr6ub0JoCAXD70
 eq4KtsDnOmQnsDfaSrTBkgUmYmD8LgTy8wxQDk0CvBwdnDU2Xq4KZGnvkLWreh+mR/lg
 H1nXbnZLrP/Rz/bwABqGjLNb9XdsJfp9Q1mYOJD8HG7rjKMQSq6hlx/ZceOeyohzbIF1
 st3aiXGUQcIZN2YOFdVjNYXDY+F8/y5XUkwcHdcwQ8VGbF68G781euTS5twLFuWq7aYT
 i/DTJ0cTmXurJN56uOlrRso/wVMiXRtgR3c7f+SakBRNe1KzTUNd7Asbn0aUvv3SCXi3
 eNiw==
X-Gm-Message-State: AOAM5315DG+ARh4YC5JyrdGghM+D7G8YPu/ISI6M2QkrcCxH9eafuZRP
 hnH1T45Uea0fi95tokEMSPc=
X-Google-Smtp-Source: ABdhPJwti/PivNUxcntiq+mV5bRnvy3fWoun3RXdVSzz/jtT7J7GtASJ96xhTkxgTdJNYJ6YimSHEQ==
X-Received: by 2002:a5d:4e51:: with SMTP id r17mr8260877wrt.308.1631262423353; 
 Fri, 10 Sep 2021 01:27:03 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l10sm4429756wrg.50.2021.09.10.01.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 01:27:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch
Subject: [PATCH 07/14] drm/i915: use the new iterator in i915_gem_busy_ioctl
Date: Fri, 10 Sep 2021 10:26:48 +0200
Message-Id: <20210910082655.82168-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This makes the function much simpler since the complex
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 30 +++++++-----------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 6234e17259c1..c6c6d747b33e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_gem_busy *args = data;
 	struct drm_i915_gem_object *obj;
-	struct dma_resv_list *list;
-	unsigned int seq;
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
 	int err;
 
 	err = -ENOENT;
@@ -109,28 +109,16 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 	 * to report the overall busyness. This is what the wait-ioctl does.
 	 *
 	 */
-retry:
-	seq = raw_read_seqcount(&obj->base.resv->seq);
-
-	/* Translate the exclusive fence to the READ *and* WRITE engine */
-	args->busy = busy_check_writer(dma_resv_excl_fence(obj->base.resv));
-
-	/* Translate shared fences to READ set of engines */
-	list = dma_resv_shared_list(obj->base.resv);
-	if (list) {
-		unsigned int shared_count = list->shared_count, i;
-
-		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence =
-				rcu_dereference(list->shared[i]);
-
+	args->busy = false;
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, true, fence) {
+		if (cursor.is_exclusive)
+			/* Translate the exclusive fence to the READ *and* WRITE engine */
+			args->busy = busy_check_writer(fence);
+		else
+			/* Translate shared fences to READ set of engines */
 			args->busy |= busy_check_reader(fence);
-		}
 	}
 
-	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
-		goto retry;
-
 	err = 0;
 out:
 	rcu_read_unlock();
-- 
2.25.1

