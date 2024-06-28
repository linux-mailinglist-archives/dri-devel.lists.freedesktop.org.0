Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBF591BAD9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA18010EBED;
	Fri, 28 Jun 2024 09:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XclwU8xk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D98A10EBEB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:06:37 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1faad409ca7so10102205ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719565596; x=1720170396; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uws88M38Us6mZwthahlWUK7fM6+CMa7f0lHdNpc5/ec=;
 b=XclwU8xk/mftjG1++58n1d7G6wgj8L/2+wfmO4SVr5ZPO1vlebBmK0/NSgyXz3aDvi
 UFfReis9g8xUgbtfcCNkpskXF7rG0jHC+Bb3T3W2Dus+COSgqs0PcU0BbYdvfD89HxJ6
 ia7Lk3VTPF9FsucbvRd759mPHTxHX7hHIsVJmEMb5e8PMgLK6g/2D146IvxXWYGikaHu
 xUBdncGbAjfcpxyGWLLewTpWQgIv44MpSd7zILg4/8fRp/i5mk1KvOs7j1Z693TKLMsg
 /m9aBPwSB73r7NNKUC5aRGrEcdQb+e8/FiG0ioPbWQ6trR1iK2NunnrqpzBGsdDT4+jA
 gf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719565596; x=1720170396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uws88M38Us6mZwthahlWUK7fM6+CMa7f0lHdNpc5/ec=;
 b=uXfeESHIUHkzMBMyiQsDn0D3pr7JbCH4orXGMY3aVlr1RT8THcujzWurKEnxiWK7gn
 kM71SrakzzFUYcrlcHQdbTOVyL4VVFZPKGF+J3/WJgJb4//4tn6ktDySmQqShC/SAG8p
 yolThHk4/WvmAKxDSjpRTLN4WH4PNSvbpdkUFbWuqORuZYYQ9TMjEFp9DzOIvCDkKsx4
 HvfAjUJJ/iqhX0n6w1OobvN2p4/tdK6Z2vCw6SnWu2aIPcyrXuimIGdSi10/7BjOCjFq
 MUUzIXn0/GZ/3zteenmof0xY83gJubzxFPJTPZINTeyTletqLsreZV8ItX5TvhcQJgY+
 /P8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKrIYqH0OeLWSfCEk0U/c8l8dIrFGrONq+YoR46UC5zUtUrB7NUNW8/R843K1RRkzYKTu2ENJwwVJiT3cQ9nTrYn3Dt12H1ew5SMV6gPpa
X-Gm-Message-State: AOJu0YzHVOTKHlgSUqjDoSWgx7QRTmpRyQXXPo6ZMxwY3C6l9aDZt1XS
 FTnsW/we2L1JEYWz1M/pARzqMh0WGf4/Uq2QhFu4tLLDPTDnGWvK
X-Google-Smtp-Source: AGHT+IFavdIVLnysCQZL38ewD7/CaBekji3/EpakpMEZSkmUhyVQ9iiqTWsp/YgBhmvk5fMqdYz2hg==
X-Received: by 2002:a17:903:244a:b0:1f9:e3fa:d932 with SMTP id
 d9443c01a7336-1fac7e975ffmr17035345ad.9.1719565596545; 
 Fri, 28 Jun 2024 02:06:36 -0700 (PDT)
Received: from localhost.localdomain ([39.144.106.153])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e3a1dsm10473085ad.68.2024.06.28.02.06.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:06:36 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	laoar.shao@gmail.com
Cc: akpm@linux-foundation.org, alexei.starovoitov@gmail.com,
 audit@vger.kernel.org, bpf@vger.kernel.org, catalin.marinas@arm.com,
 dri-devel@lists.freedesktop.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 netdev@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp,
 rostedt@goodmis.org, selinux@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Subject: [PATCH v4 11/11] drm: Replace strcpy() with __get_task_comm()
Date: Fri, 28 Jun 2024 17:05:17 +0800
Message-Id: <20240628090517.17994-11-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240628090517.17994-1-laoar.shao@gmail.com>
References: <20240628085750.17367-1-laoar.shao@gmail.com>
 <20240628090517.17994-1-laoar.shao@gmail.com>
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

To prevent erros from occurring when the src string is longer than the
dst string in strcpy(), we should use __get_task_comm() instead. This
approach also facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
---
 drivers/gpu/drm/drm_framebuffer.c     | 2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 888aadb6a4ac..25262b07ffaf 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -868,7 +868,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 	INIT_LIST_HEAD(&fb->filp_head);
 
 	fb->funcs = funcs;
-	strcpy(fb->comm, current->comm);
+	__get_task_comm(fb->comm, sizeof(fb->comm), current);
 
 	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
 				    false, drm_framebuffer_free);
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 625b3c024540..b2c16a53bd24 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1411,7 +1411,7 @@ static bool record_context(struct i915_gem_context_coredump *e,
 	rcu_read_lock();
 	task = pid_task(ctx->pid, PIDTYPE_PID);
 	if (task) {
-		strcpy(e->comm, task->comm);
+		__get_task_comm(e->comm, sizeof(e->comm), task);
 		e->pid = task->pid;
 	}
 	rcu_read_unlock();
-- 
2.43.5

