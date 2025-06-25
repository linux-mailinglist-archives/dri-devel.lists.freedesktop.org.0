Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEA8AE8809
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 17:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8B110E762;
	Wed, 25 Jun 2025 15:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m0MvXJQs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5BE10E761
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 15:22:00 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-2eaad5eb1easo15579fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750864920; x=1751469720; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:subject:cc:to:from:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Og1GMQOpzfwXI+0cF3jnX9BInwec7Spgn25VRzS7t+E=;
 b=m0MvXJQsTyUbG6mWbtuMieg/jvkDP2ZwuANDwAYqvJmuneEgMC81BALyDAkL2TCiAo
 u6Jdgj3kWeS4HB/6d/hsbtH3IIz96HAaxet0EcNwhQuOQ40skZWUUjxoYYLvsN+Tgy1y
 e5QG72kEVvy0kxkNpRh9RYrc1RElizSZ8CAAVQk2bGlU7gsgy8wYdi26nE0tnWTkBe3B
 uCW9uMLNNz9JkJwxgIHSGFFhV7Abd/kGfTzN3MJRYcacB5n535mPOZGEsyHVI4CPv6V+
 jT0zTlYYXYDwv5qCp6a6oZad19xvKuY+fybpplZeskj8XdrhT8tjELgjOffUKtbLArK7
 HMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750864920; x=1751469720;
 h=content-disposition:mime-version:subject:cc:to:from:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Og1GMQOpzfwXI+0cF3jnX9BInwec7Spgn25VRzS7t+E=;
 b=mwHgIOZTcAgs4DPEBy3FYHvhqJwSzHdNJG+jSXGJCfLOiO64C+5GQ7fvqLqxcq1Rq9
 zZr7VJEBr/C1ezBl/Eove4Xp/hHyBzEmT7e9HDOoF/+bSxQRyXHPs71Ma8h6kulmvQmp
 Pn1zOymMYiTrAhhQ21jsP+zv5msMK+oLmcaRGorC38f00TVcCQ5c0kr/1P4rcYPH4/9j
 W8iPpIH2Hv/GRgJhsQ+8bj5n8+C9frMRVOOcEflRTwGQ2y9lqOyfpae4zRZxnxjN4YgV
 C7m0vdiK4RnhUoJO9+twzW3LS7FRX14uTQT/ZpKB3ZLIIdGnVGpomNJ1aNvlsPZD28v+
 Gnkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3k5NWgPsXAWa08AXlaTcT232fla0d6MFaooTo9EUl4RuJ04RLhuLzuy3+ZvFzFpltRqAsUQYTQxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzydolnoZJukPmB8OXegfpZhnaKQKb2JdUkc/Pjnq8S7gC4/VtN
 A9FQOa4PJdsRTRrIfa/qPPRotjZtNVhglagETxea3JBF8scUr/F+UvoxIvNvZ760hu4=
X-Gm-Gg: ASbGnctUF+RHs4+umFxx2lUfV8hrxtbad+RUejnyZ1fcxKLsqoIYXpVGntltT08uxJn
 5dkaSghyyAB0twIUQWhw2zy/ria9OQFNUUhboTMSNvzDtHlfGKCz8fS8Kq6M1xNu1suszvoDYM+
 q+u2F4/ypLtmrYODBfcvAy4wq0Etz/H1CKRsnBsnn3urRBGgpA8Gh4HhJ2lkvjCLEVGFKJwsYgN
 SvD5ViitaFbyHUuo0QMv4wokjfp8frZZudQRRSfGVPLOiHDPDKzIo/5+CJwxc31XtUZzPDu2Shu
 lTqMYaANAMx488CSo6epMPaqyBoD4xt3scCZBfwTWwNdC0a0iAYnnwft19ZZtlWU/wGdyQ==
X-Google-Smtp-Source: AGHT+IHjveoem5cNH6WAD1vk3qjNmqKvozrExi59Gv6OL5AFVt4hopks6BzgykjOruT+XmUJ/QJh/Q==
X-Received: by 2002:a05:6870:b6aa:b0:2b3:55b3:e38 with SMTP id
 586e51a60fabf-2efce2d2daamr69472fac.21.1750864919683; 
 Wed, 25 Jun 2025 08:21:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
 by smtp.gmail.com with UTF8SMTPSA id
 586e51a60fabf-2ef93691e24sm951547fac.19.2025.06.25.08.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 08:21:59 -0700 (PDT)
Message-ID: <685c1417.050a0220.696f5.5c05@mx.google.com>
X-Google-Original-Message-ID: <@sabinyo.mountain>
Date: Wed, 25 Jun 2025 10:21:58 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frederic Weisbecker <frederic@kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/i915/selftests: Change mock_request() to return error
 pointers
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

There was an error pointer vs NULL bug in __igt_breadcrumbs_smoketest().
The __mock_request_alloc() function implements the
smoketest->request_alloc() function pointer.  It was supposed to return
error pointers, but it propogates the NULL return from mock_request()
so in the event of a failure, it would lead to a NULL pointer
dereference.

To fix this, change the mock_request() function to return error pointers
and update all the callers to expect that.

Fixes: 52c0fdb25c7c ("drm/i915: Replace global breadcrumbs with per-context interrupt tracking")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
V2: In v1 I just updated __mock_request_alloc() to return an error pointer
    but in v2, I changed mock_request() to update an error pointer and
    updated all the callers.  It's a more extensive change, but hopefully
    cleaner.

 drivers/gpu/drm/i915/selftests/i915_request.c | 20 +++++++++----------
 drivers/gpu/drm/i915/selftests/mock_request.c |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 88870844b5bd..2fb7a9e7efec 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -73,8 +73,8 @@ static int igt_add_request(void *arg)
 	/* Basic preliminary test to create a request and let it loose! */
 
 	request = mock_request(rcs0(i915)->kernel_context, HZ / 10);
-	if (!request)
-		return -ENOMEM;
+	if (IS_ERR(request))
+		return PTR_ERR(request);
 
 	i915_request_add(request);
 
@@ -91,8 +91,8 @@ static int igt_wait_request(void *arg)
 	/* Submit a request, then wait upon it */
 
 	request = mock_request(rcs0(i915)->kernel_context, T);
-	if (!request)
-		return -ENOMEM;
+	if (IS_ERR(request))
+		return PTR_ERR(request);
 
 	i915_request_get(request);
 
@@ -160,8 +160,8 @@ static int igt_fence_wait(void *arg)
 	/* Submit a request, treat it as a fence and wait upon it */
 
 	request = mock_request(rcs0(i915)->kernel_context, T);
-	if (!request)
-		return -ENOMEM;
+	if (IS_ERR(request))
+		return PTR_ERR(request);
 
 	if (dma_fence_wait_timeout(&request->fence, false, T) != -ETIME) {
 		pr_err("fence wait success before submit (expected timeout)!\n");
@@ -219,8 +219,8 @@ static int igt_request_rewind(void *arg)
 	GEM_BUG_ON(IS_ERR(ce));
 	request = mock_request(ce, 2 * HZ);
 	intel_context_put(ce);
-	if (!request) {
-		err = -ENOMEM;
+	if (IS_ERR(request)) {
+		err = PTR_ERR(request);
 		goto err_context_0;
 	}
 
@@ -237,8 +237,8 @@ static int igt_request_rewind(void *arg)
 	GEM_BUG_ON(IS_ERR(ce));
 	vip = mock_request(ce, 0);
 	intel_context_put(ce);
-	if (!vip) {
-		err = -ENOMEM;
+	if (IS_ERR(vip)) {
+		err = PTR_ERR(vip);
 		goto err_context_1;
 	}
 
diff --git a/drivers/gpu/drm/i915/selftests/mock_request.c b/drivers/gpu/drm/i915/selftests/mock_request.c
index 09f747228dff..1b0cf073e964 100644
--- a/drivers/gpu/drm/i915/selftests/mock_request.c
+++ b/drivers/gpu/drm/i915/selftests/mock_request.c
@@ -35,7 +35,7 @@ mock_request(struct intel_context *ce, unsigned long delay)
 	/* NB the i915->requests slab cache is enlarged to fit mock_request */
 	request = intel_context_create_request(ce);
 	if (IS_ERR(request))
-		return NULL;
+		return request;
 
 	request->mock.delay = delay;
 	return request;
-- 
2.47.2

