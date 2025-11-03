Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064D8C2D39B
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 17:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4ABC10E44B;
	Mon,  3 Nov 2025 16:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="KQmb5FV/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57EB10E446
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 16:48:13 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-429b7ba208eso2814075f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 08:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762188492; x=1762793292; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SyYmbonVksmjO4zdrRb5zZMg/W/CIKYJ9eFNKIpVKgE=;
 b=KQmb5FV/z0lTcjJGS86Fi4o94D7HsOl3XcVuGDTWNN1RVpIJOYYodJGdN0PIQtDK7c
 gp49dIFHhL9f3XKmfK51a/6jPErT1mqIbRoIsOHA2MaUlLb/3xgxgjtcJHbvRi/B6Mz1
 zgLnZoJPyZohXRLnePRqrS9y12QKf2X49yGFpory4wh2NvsHtMjwL77EWj2BXSxOQ3zw
 /EV6Yps0PYXCrr2AzPjFKNryWMFr2EBanaFHx+asWWrKMvpUjiIphuW47PnRSuuVcBiv
 /A31/oJDE3tsvOMlPSqpul8jRml7UH/mQv+cMmIb/X4OSDWsg3P+N6U+I+MdLkUw8S3+
 X7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762188492; x=1762793292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SyYmbonVksmjO4zdrRb5zZMg/W/CIKYJ9eFNKIpVKgE=;
 b=ILaqJSWGoc/WthySQmcw8ap5+5z33RhPGvYOS5zH+n+M3mdNdYz7uvhVFNvFmvkVc9
 1HtdH90bARIj9MsIMB4ZQDjQr+Z3TwCdFMZFdvc7O4U/rHkIM2PDVM5I/RY4wLKBgq/b
 rlVD9fr7rSOqDqcG0+bZv06eZTt1iW0mmi6gC1XU0l8xTXi6gW1jikAnOmQNC7r02b6I
 N//Xnsib96gIF4R7WGFsOWjN+xdqQPdJN7tqHI6IwPwP7Ro3IwZse0oVeS0f8Fz02Asn
 LdW6SWl/R82uiNcxfCzYSZCrwjwm533GwXkCmYsqzOYbHGxh2df9JxmxiMv57/ugK1k2
 iFGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn3aZQYacQV8Bu0wmDQLAEi20z+Z5+nHOsQBYdIBLgB3QctpoEtMperT/6jBEXRmu17NjGLM+fjkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxC1bZ+Ju0wpsX9thmzD1an1SdDZYLr1l7yhdsEJWDN2ZP31Qs3
 kMle86Nl8kkb6wOZMcGSOgd2f3oyYwlMDPX4+3ZN/wAzd7aRwC9z++ORRQ5Qx5X/0aA=
X-Gm-Gg: ASbGncurkoeOimsD0IoXVAOZUcPQawe2HlqqJe9TWJ04suzXA0i57izLxq6AcHO/scI
 CNpYEfC2rZ4cgFHUWeOTCWqn+QyE/JdtX6jYglq4O5Ru3wEPMb3OWqBOWLMmrphD24VzZsKjv6B
 lFo5Dk5p86yhJnPcOjhrukJ+uCo2vMsbiFJeWsMHIFCqifAjvBaB08oitUciA0b6SS0H/bGbYYv
 4/cLL7KWtAzuK3acLyoNDkRLzhLJRc265W8FTzkYF0xKljvwNFUntnhKjtrBbO2e4WN1UqtMlk0
 uxDKCzjJ9yDzU0r89RHXXrycjaqpa6LAzNQ+9UgbHCzxSxNZyAMFBlldXNfuWaEY3x2rSEeKd86
 wZz8W+DjiQa+XPMghJ917s+TI9z49ULHOcKmKTaE2iqyERpdfO8eBsrqwHv2r7TOiZvM29vW6iz
 pb4llLHxRn0N2qyRDCaPXmmlrR/Ul5h+iBI2o=
X-Google-Smtp-Source: AGHT+IFc884SvsviOs5LrjoU8X3I/ITy7QFOXG0JfVMfzUC93v8R6MCSY9RxAFBfGaj4xUYdphxHcQ==
X-Received: by 2002:a05:6000:2010:b0:429:cc1c:c2e with SMTP id
 ffacd0b85a97d-429cc1c0e3emr4859302f8f.1.1762188492269; 
 Mon, 03 Nov 2025 08:48:12 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429d1061efasm9864899f8f.24.2025.11.03.08.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 08:48:11 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH v2 2/3] drm/i915: replace use of system_wq with
 system_percpu_wq in the documentation
Date: Mon,  3 Nov 2025 17:47:59 +0100
Message-ID: <20251103164800.294729-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251103164800.294729-1-marco.crivellari@suse.com>
References: <20251103164800.294729-1-marco.crivellari@suse.com>
MIME-Version: 1.0
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The above change to the Workqueue API has been introduced by:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")

The old wq (system_wq) will be kept for a few release cycles.

This change only update the documentation of drm/i915.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 2 +-
 drivers/gpu/drm/i915/i915_drv.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index a28c3710c4d5..0f33cdc11736 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -140,7 +140,7 @@ static int i915_workqueues_init(struct drm_i915_private *dev_priv)
 	/*
 	 * The unordered i915 workqueue should be used for all work
 	 * scheduling that do not require running in order, which used
-	 * to be scheduled on the system_wq before moving to a driver
+	 * to be scheduled on the system_percpu_wq before moving to a driver
 	 * instance due deprecation of flush_scheduled_work().
 	 */
 	dev_priv->unordered_wq = alloc_workqueue("i915-unordered", 0, 0);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 6a768aad8edd..d9f73b9995cf 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -256,7 +256,7 @@ struct drm_i915_private {
 	 *
 	 * This workqueue should be used for all unordered work
 	 * scheduling within i915, which used to be scheduled on the
-	 * system_wq before moving to a driver instance due
+	 * system_percpu_wq before moving to a driver instance due
 	 * deprecation of flush_scheduled_work().
 	 */
 	struct workqueue_struct *unordered_wq;
-- 
2.51.1

