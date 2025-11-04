Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A6DC30657
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A8F10E5A0;
	Tue,  4 Nov 2025 10:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="UYXCNiyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BDF10E5A0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 10:00:50 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-475dd559b0bso71626455e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 02:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762250449; x=1762855249; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JlVwKwolM5sjAhAjoNFJjS/Et/bs8gMf2Li6ilbi0sk=;
 b=UYXCNiyzke6/K5HgG3jcj9xB1KQcMINwRYD3JFdn4Ofmf9Za40emzlC9FiRUyg6R+E
 E7BgFo1R6/QkUf72UJ4fVV3G6BLbpC68kwm59+S7IpWUxSyJnyUOqwp9KxoByiVk4PKH
 TVATlxptWgbsXrAjfjurlHXwsv/nFbn6gxY6x3YQBZxTRIX8tj7yAdCAVs1+ANFq6BJK
 VrYkFeKCyK5YbnOs5Fmhk1SovoULI+oUr3uKvxgyNgtsH40On6PmNV1yLVQ1n4ilpPi0
 b3EBUnDLYCRenI/ae5zM1OxoBzGyVGN4Jz3TGzQzoE5HD46z1mNgPZjG9wnjxihLc9FN
 /1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762250449; x=1762855249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JlVwKwolM5sjAhAjoNFJjS/Et/bs8gMf2Li6ilbi0sk=;
 b=dCeUJ5a31tydMLNu79drAOZokJeYZFhTyfUkkb05sWsZ7czeUi26N1vP5uJimDzdUE
 7vXUr10xoGXFqA6BMest3dE1DiU5LocdTglMensPxoV5WPBkBUC/r+1uOkiG4QTumJB8
 E9H9IOFseG87qWPI1qlR15QanFwXFQswjXZSbf0OrjiPUknc4zs/1M8t2h+pSIRvS8BK
 hCkcERqRCpf6L0IyzdS6r6hh2LZj1D/vlIygeTf8NH0INU4MK4f2i216dhcMwdtCnTGm
 df+hJAfpmZAnEtb4iUpadwBqUDQnnrgLzoszPec++ucZ5xK5K/mhXMr4qm0XZyDWJukM
 L3lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1oIw62Oyx/lnnoKfmg7CTXV6RkwMv/3h9OxoJYgIeUIho+860qQl5lqBKvgPSuYUAzqiandT7Nu4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWZpLaTNwgw9s0zRWHwbolIhj6KdTPBQRP4+hm1Iae4enVdKv4
 Vf8OmnXWss4X1Dj4h8PIKPy/x5/ZI6RWJoERf96OUyimT4s8jMmAoczC+mGC1APDCw0=
X-Gm-Gg: ASbGncu1UNK7hJ1Ad0tznbzOZcDJxwOTi/xdrozxKoud0DRD6Ruhoodh9/N7RZEC9Q9
 ifHBXHxvwNEbGOStyg/pbrTK2zka/T3oZQqIC2uSTOQZMeX2MnXYUuRSRWSdeavrcPOK2NDd4aT
 nMyDw25uqPESNLrmYuqNGmIGTaapldkrbmniB761D2lBL2cqAdMBtkvuaiSpPKQQMFf/KN69PUX
 1gCkX6hJZvyJcHf47FZ0zeu2kmImNGwcEx6cPCoAnNwIe/5xSXZAA2rnanGVadE/dsYJKUEbmt/
 ugxkyy2XqkCXVlGapqcUC7QDIKfGuHFDxWZ/dWmxRxbXPVb37I0BOyKzBFYcZuhcO8/hYxML9Fe
 XL+huqZTkoZ4JjLqDcm5in4g+gCiTsHsDUZQxV2calniBPb/gsVOO85jUv75SanAhH6pfg4cKvH
 fNx74iztEFSBnMdRn595XBwb0h
X-Google-Smtp-Source: AGHT+IE35Zr7TnYBf7Tgb5joKNHpDdpqyjXIULZRst3eRHtFoQa+qKm5wqipI7KhNj5WLe8NJxZfFQ==
X-Received: by 2002:a05:600c:1f91:b0:471:13fa:1b84 with SMTP id
 5b1f17b1804b1-4773082e1e3mr138207635e9.12.1762250448895; 
 Tue, 04 Nov 2025 02:00:48 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47755942772sm14325865e9.5.2025.11.04.02.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 02:00:48 -0800 (PST)
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
Subject: [PATCH v3 3/3] drm/i915: add WQ_PERCPU to alloc_workqueue users
Date: Tue,  4 Nov 2025 11:00:32 +0100
Message-ID: <20251104100032.61525-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251104100032.61525-1-marco.crivellari@suse.com>
References: <20251104100032.61525-1-marco.crivellari@suse.com>
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

This patch continues the effort to refactor worqueue APIs, which has
begun with the change introducing new workqueues:

commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

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
2.51.1

