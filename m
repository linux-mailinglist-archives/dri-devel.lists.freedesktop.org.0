Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCED3C30BCE
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 12:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C04910E25A;
	Tue,  4 Nov 2025 11:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="cxaovZwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AE710E25A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 11:29:39 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-640ace5f283so2664727a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 03:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762255777; x=1762860577; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/6U30xhVv6V/OllWka10lpmVdIsxk7KF/mWNRD7vXBM=;
 b=cxaovZwRxh5Rz1mdgG0f/aM12rOCc1pbQT6kfjHZwfP/OrIn4/a+f3gtEchwBE5xvX
 4zxH/8BjPvFvrPNfMWXa7sb/kPyZ0jcpLNUe8NTB5bY29f72YciWn0KNjjBroJKSeCTB
 VXQMAzL4YeXjg/68amzbHTdoYbXBt+bnGXmU5vbeBKR5DsPtwdZ+KoundM2MLU7qvoNl
 lk+b/p+3s/MuI6jkwuXMCRH4nuM0TE3T9WHq0lsyXgnoxfX0vQGgtVsrVPyyvxVM103z
 oWxkJaBYNhBC+udaxv5HEzkS7FZyNvcGPhbMhcv5nB5bA67XS/hJyRbr6I6YbwAQ6BX4
 Tfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762255777; x=1762860577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/6U30xhVv6V/OllWka10lpmVdIsxk7KF/mWNRD7vXBM=;
 b=GoQUwq1FnN+EmPrUg3KNMyeH7a4mP7HJFA06e4wehxppYoZOWUu+2ewSy9pM8BXNRs
 fI8I/pQf1bgAZyw0A76J6kJmm6JtXakaJbMEF7/cDx5gvPKGzmD/k3YTDOiaMjP2TtCV
 KXwJfQHCQjMxKbSh6YmOpOZv+lUYLVPXRjGZ8GDJ3JUhuRl2gw/0wA3DgKopH0l8J+RG
 FN6JhT9tgOZqjT52+DAFnFNh4whY8qrTWrmpi2uRItb/CGgY4dJ+euWdGUrae2B+hiBV
 mRy8oPwMHleBZWPX/3bIe9cIigadkWBbmj9qSkscDsHgQ3pnFLodyiWNOUX1JE9qL0AU
 f98A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVneH1mAeOIgPvxgT5A/WzOHN8rr6iA4nD/qk/cIRUxojMYM9Ap3F4bOmaOOIxQQheg7+3ws4jMNtQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7e7JJ4OeeMoh7tNoORdoXobu5pOOMD6652SeLjNBuRDl6BHRq
 stKCy8RiszCPGj3uu8gffnfgQOLqTA7VQHzdLpUyDTKY8BzMKZAcz8aeDoRxBaSd0ow=
X-Gm-Gg: ASbGncsz5LBnbSuUcdyneXvjYrwHZ5PiMWL8lp0jhKjWQpk/lAfi6/DtrwGwhe/81C7
 DaiU/+Krt18ovAt1zhZKoyQA3E0AZrBurgHOWyrnWd3Y20SDgvBXNTa/xfYdI4Ab2DiATXd1VXv
 /n0Kv8VfqzlOQ5F9aVUajkhqtns/u6KUUyQ+Oi44BKtiy9uAhN0GlXD2D+a9Jj3XUSreBomj10J
 DAzvvHWugqjMzRxewMfwyl77nqPHAFpOOxXy1rQ1Qs55YN9d9xM9vYKNrJwyqhRjr4RuE3UIJvN
 osP3hbfzx8rJ+DDWLAuBGthijyRL+v7zgbWYGI/G/WUwnsP24T0sZrhXSKo/sa/g9ZoS5KtJPly
 f97XWcAA6VzIyxWCvBBpv37ts3U+6De7qXnkj0pjlBbMEvA+nY904nY78T+ByaY5dldG+JI1TTo
 a1GU8=
X-Google-Smtp-Source: AGHT+IEH6YLnLzKBUaOBrPF+gt/Vwu3vr6ZVwfIBKjg5lysKKReAoUvEVvkYcdEX36hZw8BRX3tIXQ==
X-Received: by 2002:a05:6402:26d6:b0:640:a356:e78b with SMTP id
 4fb4d7f45d1cf-640a356f0e2mr8579226a12.7.1762255777493; 
 Tue, 04 Nov 2025 03:29:37 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-640e680578esm1820370a12.10.2025.11.04.03.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 03:29:37 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] drm/exynos: hdmi: replace use of system_wq with
 system_percpu_wq
Date: Tue,  4 Nov 2025 12:29:23 +0100
Message-ID: <20251104112923.143408-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
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

This lack of consistentcy cannot be addressed without refactoring the API.

This patch continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues and a new alloc_workqueue flag:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 01813e11e6c6..8e76ac8ee4e2 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1692,7 +1692,7 @@ static irqreturn_t hdmi_irq_thread(int irq, void *arg)
 {
 	struct hdmi_context *hdata = arg;
 
-	mod_delayed_work(system_wq, &hdata->hotplug_work,
+	mod_delayed_work(system_percpu_wq, &hdata->hotplug_work,
 			msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 
 	return IRQ_HANDLED;
-- 
2.51.1

