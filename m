Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD73C24694
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D4010EAF4;
	Fri, 31 Oct 2025 10:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Zhbcz02f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3411410EAF7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:20:31 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so1450517f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761906030; x=1762510830; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/u+awZrbSzQ6eDfqV7nDtHfvXhS1UpzbuBjH1UCPs0c=;
 b=Zhbcz02fqu1/BP1Jl6q7KkM5oCidczad0aFj3YvNmRT3UkLJHW6iByh8CAwP8kbr4v
 LmB/FAXTMusf5w2Hbud2K/zMLiN7S3Yx7sHRjZ6B1S4bvu603h726Fh2Uph7gblV6agL
 bWWDJS647L8v6GwUHO1POusHuvdEV9sZd5MJ0175kMmb5WxUEjS2VnQh2mqvPzMkSQaf
 yt5USNLTFn9mycQbeEmBliA8fKriOYfJbGvk63FF/CG06CaEWAuy/7GxD6HB2jKCFQxY
 pwum4ptrdfiCEu4DZ6AjbGU8Bxclbkzhhn3grspxhPZC2uBZR2f8VGweUv2gBUOEfc+T
 sbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761906030; x=1762510830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/u+awZrbSzQ6eDfqV7nDtHfvXhS1UpzbuBjH1UCPs0c=;
 b=jgKzi731WAQJHxTbm41kdkXKuvl+u37toQX9v0J5tWhGG9O3q/rGnYmdZdzNW+LGms
 cCXBQ+381ped+aNZOcL9KWT6Umyo0p5zSfCbCCzGq45uDeWbEs2gtIUNi8AoF5haeFhu
 bLdB4R45bX7q6fDjmQq7xi6efdusViZ5eR5dl3yXkTpcqZBT5bZiypx+yTcQRyyUH8z/
 2E6tku5pz3535uTOSpquxylFlWz0jvRLcHILexqy9lEWih5UxtmPS7wRrFWUWQQUp/ZD
 0hDaDRD3t7E3RoNixXHzxuo8axhFQizl7G/Ewu1JklATk5AF9eVg8o6Wck9uRjeLzReW
 qaJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUknyzIHekX+H4ReLCrRQ7SolH5RTsk0Z2XBe0MKmw0lxE9+fbqCYRzftF1zHrMCnZyvQNhc5P/88Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw96hqD++9VviQIuy9RlWJHo04PmP/9cfIR60T/bHgqB9qYzzQr
 la2L6Y7J1kBUj6BJENoEIj+8/70iMX6acPiIhXvKVDRc4NsIKs5sVPEv51H+zMIrrCM=
X-Gm-Gg: ASbGncubg/fseBj8qC9lEQi3M9EW9vJ5En4TKkSZoau4v7EldK5owEQsPFfIP+K2Uao
 f+c9Yy/nHzLd8pl1yP1HIAMjGeRe2VtHhuCCvRo67AV6UROuTZkJvtpkiWbs7MoJEVm5Ne9V4+X
 c4UmcnEzBqohacquQh3mQB/rcJKqYKs82VErX8V7y4acpnm0EyTuAs9B4Gka87fPBmzFstCVOzW
 fVPaIeAXehuCao3By8Ey8CHvb+PReCMTK/FE6tpzwH+FtZUGqrUZSdtM+aklRL12HwmbnQmswLy
 l+jx+vec5w8QKmopbWPnjaORG81WTffSURDThf1ZXqtoPjV1LBN7em0Z8qbMFNJogFpQq27JIbv
 v/YCCYBkmLj+s5CKSOdkx88FzowTamRFzGtv6S2GrQSTO54Wvfam8QmTm2ua7llRfC68qvAPR9I
 YLo1dRgnLuzVg5sbzuFFId5y8YBH54q8Ywrk5TDyCYBBVNXA==
X-Google-Smtp-Source: AGHT+IFGDvTKB2rxlJh5yej09wy7WNNlEMpaWtu5SfSjAIP63L2LKeKXvN3qht8svwvhZJc5Fdl6Ag==
X-Received: by 2002:a05:6000:2f86:b0:3f0:2ab8:710f with SMTP id
 ffacd0b85a97d-429bd671cc6mr2113941f8f.8.1761906029644; 
 Fri, 31 Oct 2025 03:20:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c110037asm3090410f8f.3.2025.10.31.03.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:20:29 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 2/2] drm/nouveau: WQ_PERCPU added to alloc_workqueue users
Date: Fri, 31 Oct 2025 11:20:20 +0100
Message-ID: <20251031102020.95349-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031102020.95349-1-marco.crivellari@suse.com>
References: <20251031102020.95349-1-marco.crivellari@suse.com>
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
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1527b801f013..5a2970ef27d4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -631,7 +631,7 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 	struct drm_device *dev = drm->dev;
 	int ret;
 
-	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
+	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", WQ_PERCPU,
 					WQ_MAX_ACTIVE);
 	if (!drm->sched_wq)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index e60f7892f5ce..79cf157ab2a5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -416,7 +416,8 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 	int ret;
 
 	if (!wq) {
-		wq = alloc_workqueue("nouveau_sched_wq_%d", 0, WQ_MAX_ACTIVE,
+		wq = alloc_workqueue("nouveau_sched_wq_%d", WQ_PERCPU,
+				     WQ_MAX_ACTIVE,
 				     current->pid);
 		if (!wq)
 			return -ENOMEM;
-- 
2.51.0

