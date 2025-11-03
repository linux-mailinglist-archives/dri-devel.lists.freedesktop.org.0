Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A071C2CEF7
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A2E10E435;
	Mon,  3 Nov 2025 15:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="X+b65Vnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACFF10E435
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:58:04 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-475de184058so14087415e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 07:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762185483; x=1762790283; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BSjslf49+4C1KeXizurd3u1HRFo6JeAJTXRM556HvGI=;
 b=X+b65VnwGamedqlRBC3nUBTdTvkA1xLkaLZT31yrWPcLcNmMF+OKMAvnQIEMwLluSz
 9GofmgCNthQebg+oW9Vw0UdJKkwWHuayNtdKXxHUsHiHJMr8FF3+bpHeFhjDywaN9WWt
 SSSBgxAqkM1m8C1jLgK+gCblpHg2DcYViPd1t91zooNA0YFi6vjW3DOimLDzmvTbM+pF
 fgjdKdnG8TBAnME6TUQjbB/zu/xGQMIToPiI6nu9D3mzz0imVZnhjCs7OHTKRPFUvRct
 ev7hpV1rDbtA9KxOa16h5FwjoUK6H40x9vCOdqf+3uUgZkmubY7fotPHc0AJx6XHNxA0
 UnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762185483; x=1762790283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BSjslf49+4C1KeXizurd3u1HRFo6JeAJTXRM556HvGI=;
 b=wdRaLC9NeC/8491kxvXepFEVU6AaoyG8eBOvtC2ccejmiMSuyHgIJdgC2Zbj9PRen4
 Yu2IVeDtuvClYMmkWADA7BRx5dLonvn1GZVqkIYbFbACotcQ5fzYktVUjCLK9LexXoTC
 4rXwT7caSzIT1CHvJbbtAQ1EIPThvXXdjwHXaOs4+Zz4lMYmzunzsKEmsdQW8gyoqial
 hsM4JRdYqzaOjEzQ6YyKhW0rGcMmoXAlu+SPUIrrGvysV7G1d+Ryt2fjD6mFOrBA+76m
 IVekrn4pSUwSF0WnwuhR1jVkU09ZOLNDNeAkP7tDZ2lcCj02ulCuZjtvX5zxWkIITAsT
 80Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL41owuedIzxj+uJ8icPaZxExAk7naBQmlWNPMT8oojzNy+YS1Q+2vqQrbepChRAixa2DC00bSCko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywhm/sqoCHauBa3izaPvXAJYmnw/a5tkahsRXDtJR9QlCbWZNNI
 5phQJHKLOHFnUFqPK497J3WVmfn3BvGVEhlZROHiK6hXQo/kSXfutOswUzo5M/guC/DXtVBcI0r
 Oly8/
X-Gm-Gg: ASbGncvc8pSBPDQKsIyRecSJ8j3oDGV0butT/E7MgwC5k+/qnRucSt6CDsswqhlSiWI
 VTlscCNVvq3w9gwmJRf1m0kQKch8PkaOq9nFHRW13a0rFBVkMCrRzoBsTN7nq9VWpmj8iwOhF+V
 3mX1KREAde2JzC9Qz8n4aR/xMKFeGBA9VxmPENjQz8YUi5MNu6I7y3kT4HpXIziKczFQk4XDeC3
 dEge97eoaAlqmQP7RF5SRN+03FyVxGlIgNusbranVEhz7Xr7ezZoV9n58SQXTZyiZ3AOuGLftHZ
 HDsab/LPbJ9HwE2WW43l9tOmfgNwBh4rncV1j6HwoxOeOxFm+3N0wjnbBDa//rvmafDlUVPQyl4
 amRDclx0HVO2VDhC/QX0LwdNQOv5c8xc+FA1KLLZpK6WZRF1S/nzlAXq/EWlwJ67FEXbs55E8mE
 ca6wujfWzBekxif72oJmpJeXGaOkS4vRnI/F8=
X-Google-Smtp-Source: AGHT+IEBOwqlZ6rp5xc4yApoAq4SvaoICYZIEJ//QiOLN7wf/ONd9RM56bwB3wHPfebuEpSn8JNvnA==
X-Received: by 2002:a05:600c:b85:b0:471:9da:5252 with SMTP id
 5b1f17b1804b1-477308900e0mr115180965e9.29.1762185483424; 
 Mon, 03 Nov 2025 07:58:03 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47754adcd08sm48245e9.5.2025.11.03.07.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 07:58:03 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philip Yang <yangp@amd.com>
Subject: [PATCH v2 4/4] drm/radeon: add WQ_PERCPU to alloc_workqueue users
Date: Mon,  3 Nov 2025 16:57:40 +0100
Message-ID: <20251103155740.250398-5-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251103155740.250398-1-marco.crivellari@suse.com>
References: <20251103155740.250398-1-marco.crivellari@suse.com>
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

The above change introduced in the Workqueue API has been introduced by:

commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/radeon/radeon_display.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 351b9dfcdad8..3c8aa5274c51 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -687,7 +687,8 @@ static void radeon_crtc_init(struct drm_device *dev, int index)
 	if (radeon_crtc == NULL)
 		return;
 
-	radeon_crtc->flip_queue = alloc_workqueue("radeon-crtc", WQ_HIGHPRI, 0);
+	radeon_crtc->flip_queue = alloc_workqueue("radeon-crtc",
+						  WQ_HIGHPRI | WQ_PERCPU, 0);
 	if (!radeon_crtc->flip_queue) {
 		kfree(radeon_crtc);
 		return;
-- 
2.51.1

