Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C61C245C0
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEF510EAEE;
	Fri, 31 Oct 2025 10:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="UdR7bSxa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785C510EAF3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:09:41 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-475db4ad7e4so7889095e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761905380; x=1762510180; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uIEAHpZJgPenfQa0eR0eha1rgNHE8FkwlCwPAkqtADI=;
 b=UdR7bSxadN1D7NnOG/8atzU9iq5djtnBgXLH/tl/MD6I5kUzjXwNqoABdx40HfGOOK
 ag+ETuCf1YGFp6DwdBh4yOxfljV8PNLRzWSEBImGAJ1psu+2/kDuRRGs3HuhTHWH7iZg
 +/HncfDEx1winMW4d8Qd/f4LQAqe32vl2VMOa//hyYUoj5AX3k3LhIBNdsoR4aM8UDIQ
 n1CRaadA8KkzL8bPqvvX4tB59qER0aNCYuFJ3ctA/iZVKHxckk2xiTGHK3O46QJBA+nC
 92mWcaKKPc0Ssq0SqdMAfRgt3G4bISdsM52LcEXzyMRNHMrAZSkKOUXYLS6UamL1IRDC
 J5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761905380; x=1762510180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uIEAHpZJgPenfQa0eR0eha1rgNHE8FkwlCwPAkqtADI=;
 b=UZoJJVNoS68x0hKLWVlWk9oFrXzlGmba6M7viJuVx0eK6++AEKcTJI+9RbQIW28R/G
 x9zzVMmY5XAp0tTiwEC9BX2nW0ZyaQT/SEnhW5fRinqqbNdCt87Xobr6b+5QW8GYr1XF
 UGjGH1n3PARZpPL0L20RZPPw0iNrNL9wD/DLbFr0Q5707OR7ivbFOcOtQvuYvTmGJMJn
 2S5d3QA96ebsCzbbLPmnziYFu/MZZOXHrQpQBia5WirCviTJQWfRhzTxZcE1pbqs8sZN
 KOwQ3BAeaxvoei7iAh7oj14QY6v4f0kcB8pZJikpO0WYwW044BqQo2DZ7Ib5raomyE2m
 aPFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuu2+vvxYwbvG6JODns7gA/XYMFBUdesZGdFP0/zSH4+81IltVsUioNqazcgvTXk7+/g/fBst2sCQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdvNKGdzh/pWaE2qrE8Pmu5qeqgG8hA1H3pZBLn0gOfN84LNP+
 yEAwL+dGpL9GnJPzVNYwWDhpbXlICIWKp6MnJDbbBYnATrflnXarvB6ePOogD5kimZw=
X-Gm-Gg: ASbGncuIcM4UrRjq+oJVyLXKXBihjuDQhlxGp2CD+X1+cNWeWNoo8xqnPH+fqGofO2m
 w1WUWF/uoWdLoHedgfGnbZZihl/VgInbPMsdgECpvz4Kh/UiCy0Rjwj19tE13kRwE7IJDx11yM2
 GSu5DjA32X1t+KqnikyDHSR+LdOYvAROPjBTSzSP77mbWKhwwSssvhCWQq79NwJEWEr4p/xe9o3
 qLazlztS1xlVpLlRNGD5/WSbrnivh45tsfq3Ldpa3FsLL1deoBq1lzZjk0cDySREJ/6GevQCYXf
 ko/Yb+E7sZ2TqseFwxwmZt54t7BS8U9ltGDtu2lnRdvkZZ+NiKVlLhPI4v4HgZhIQonmPLaDod8
 vQINLqSYKF7QHuT2411mHKOQPflc0HGaqex5pixObisHrJ0b0oYH/1JzcO2UqAUTEDr6+xii97r
 1gXwTR11oWOSXxtsLFSQCzPsie49koCK8tqI1SqG9QSnzfxA==
X-Google-Smtp-Source: AGHT+IEuYSheTD0LAmCUTXMqTUnmXFPaQcuKHhOpSOYN7DCVbycYCPaNazgBhc5bsfGHuKVEiD6GEw==
X-Received: by 2002:a05:600c:4695:b0:471:1774:3003 with SMTP id
 5b1f17b1804b1-477308be7b3mr29933385e9.29.1761905379892; 
 Fri, 31 Oct 2025 03:09:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13e1c9esm2839171f8f.22.2025.10.31.03.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:09:39 -0700 (PDT)
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
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 3/3] drm/i915: WQ_PERCPU added to alloc_workqueue users
Date: Fri, 31 Oct 2025 11:09:23 +0100
Message-ID: <20251031100923.85721-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031100923.85721-1-marco.crivellari@suse.com>
References: <20251031100923.85721-1-marco.crivellari@suse.com>
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistentcy cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This change adds a new WQ_PERCPU flag to explicitly request
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 4 ++--
 drivers/gpu/drm/i915/i915_driver.c                  | 3 ++-
 drivers/gpu/drm/i915/selftests/i915_sw_fence.c      | 2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c    | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index cf1c14412abe..e12f9126b155 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -257,13 +257,13 @@ int intel_display_driver_probe_noirq(struct intel_display *display)
 		goto cleanup_wq_modeset;
 	}
 
-	display->wq.cleanup = alloc_workqueue("i915_cleanup", WQ_HIGHPRI, 0);
+	display->wq.cleanup = alloc_workqueue("i915_cleanup", WQ_HIGHPRI | WQ_PERCPU, 0);
 	if (!display->wq.cleanup) {
 		ret = -ENOMEM;
 		goto cleanup_wq_flip;
 	}
 
-	display->wq.unordered = alloc_workqueue("display_unordered", 0, 0);
+	display->wq.unordered = alloc_workqueue("display_unordered", WQ_PERCPU, 0);
 	if (!display->wq.unordered) {
 		ret = -ENOMEM;
 		goto cleanup_wq_cleanup;
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 0f33cdc11736..380cb20a47c6 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -143,7 +143,8 @@ static int i915_workqueues_init(struct drm_i915_private *dev_priv)
 	 * to be scheduled on the system_percpu_wq before moving to a driver
 	 * instance due deprecation of flush_scheduled_work().
 	 */
-	dev_priv->unordered_wq = alloc_workqueue("i915-unordered", 0, 0);
+	dev_priv->unordered_wq = alloc_workqueue("i915-unordered", WQ_PERCPU,
+						 0);
 	if (dev_priv->unordered_wq == NULL)
 		goto out_free_wq;
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
index 8f5ce71fa453..b81d65c77458 100644
--- a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
@@ -526,7 +526,7 @@ static int test_ipc(void *arg)
 	struct workqueue_struct *wq;
 	int ret = 0;
 
-	wq = alloc_workqueue("i1915-selftest", 0, 0);
+	wq = alloc_workqueue("i1915-selftest", WQ_PERCPU, 0);
 	if (wq == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index fb8751bd5df0..684e6ca0f960 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -221,7 +221,7 @@ struct drm_i915_private *mock_gem_device(void)
 	if (!i915->wq)
 		goto err_drv;
 
-	i915->unordered_wq = alloc_workqueue("mock-unordered", 0, 0);
+	i915->unordered_wq = alloc_workqueue("mock-unordered", WQ_PERCPU, 0);
 	if (!i915->unordered_wq)
 		goto err_wq;
 
-- 
2.51.0

