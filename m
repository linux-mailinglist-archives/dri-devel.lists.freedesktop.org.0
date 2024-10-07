Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CA8992FE9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 16:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADE610E3C6;
	Mon,  7 Oct 2024 14:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G9tIZegf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302C610E3C6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 14:50:54 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-7ea0ae67df5so861392a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 07:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728312654; x=1728917454; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7VwBx3mFnKYzOzVHPezqvf6E6t3GSTY/lMuePwrb08s=;
 b=G9tIZegfj4mvOb+3a/N/CIkLK/b0qHSfdl4GZOyGkrlenGv49aWAUM4kSEdvSHOpsG
 RSm6mCEApd4Wzt61AtbjL/up5pVjWICAuEqwEvH1d+zA9p/z8r034OXF7bIWPJR4KbDq
 JmdKSIfGQgG8UXH+127YGDHyqUiNqBcAxCkiv1RpE+X4jtFtXfQXLdJYKyPJiqS8MLCb
 LqVXaLRBXDYSQAQyYHPmzo/vr8D0U0fvjbD1Bd9HsuhlT/0uPdvs9H9P8FBB8e7W1t8j
 +VfSbuA1Fg0+RSnWZDNC76jacYrCLCFjvPhmQGL3Ko/FDa1l00AZ4jbbaCUaRbA+XPWP
 MTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728312654; x=1728917454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7VwBx3mFnKYzOzVHPezqvf6E6t3GSTY/lMuePwrb08s=;
 b=uF6CpQoDPfqnU9YNeWOkJJKABlC1WUMCIsvT/dzjSVUNI/my14blI5zc5KhLMx2CNT
 b5I1TdZ6CABhg2tzbrd3/VtGi8ZsTUbSuy9bBofWhsDU8DHGmC9AvJ8o+4/b/KDL5DdG
 YJSlKRJfFljhvlAqGMXhBOxZ9mO0u3GPwIGFAANqd/Vm5WjGrg9w2qQV9kLBacMWrLDW
 IRololxrHhaMfxJ2DEnsUgbsEAICjRCpDojMzu6BmOiVvlhpGZM6AcfPPJT4Bgs3K6M1
 3U7P6pherMbZ44HvE7EOyhHfeCHv6UMGBumUl46voEMHRpWC+h9D9Kn8TFHie2CyvpaG
 ETKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7dsCLgVb+3663ys7TekVi8/+0ok5GO53o5zOjjg8sb49c0SNiHZcV23Kd0O9lSses2ncJAclx+0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvcD3Z2kTXbN+mkjaof4PQhMyCJ3nRnL3trUKJJMy3H4j8cw/D
 VcVILCqq/Yz1t/+sHKP/QhTIjaR3rEUThlEANgAW3Rjq910KRrAK
X-Google-Smtp-Source: AGHT+IEwpXCzalPlyOY9Cdfli1GLzxvFvEupvvujLKDDOEy0H0EsRpGoLeoHLvpBbBHNCnkbeHqgcw==
X-Received: by 2002:a05:6a20:9f8f:b0:1d2:eb9d:997d with SMTP id
 adf61e73a8af0-1d6dfa23bccmr18227823637.7.1728312653634; 
 Mon, 07 Oct 2024 07:50:53 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.43])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0d7cf82sm4466432b3a.200.2024.10.07.07.50.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2024 07:50:53 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, keescook@chromium.org, alx@kernel.org,
 justinstitt@google.com, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Subject: [PATCH v9 7/7] drm: Replace strcpy() with strscpy()
Date: Mon,  7 Oct 2024 22:49:11 +0800
Message-Id: <20241007144911.27693-8-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20241007144911.27693-1-laoar.shao@gmail.com>
References: <20241007144911.27693-1-laoar.shao@gmail.com>
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

To prevent errors from occurring when the src string is longer than the
dst string in strcpy(), we should use strscpy() instead. This
approach also facilitates future extensions to the task comm.

Suggested-by: Justin Stitt <justinstitt@google.com>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Justin Stitt <justinstitt@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
---
 drivers/gpu/drm/drm_framebuffer.c     | 2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 888aadb6a4ac..2d6993539474 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -868,7 +868,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 	INIT_LIST_HEAD(&fb->filp_head);
 
 	fb->funcs = funcs;
-	strcpy(fb->comm, current->comm);
+	strscpy(fb->comm, current->comm);
 
 	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
 				    false, drm_framebuffer_free);
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 6469b9bcf2ec..9d4b25b2cd39 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1113,7 +1113,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 	}
 
 	INIT_LIST_HEAD(&dst->page_list);
-	strcpy(dst->name, name);
+	strscpy(dst->name, name);
 	dst->next = NULL;
 
 	dst->gtt_offset = vma_res->start;
@@ -1413,7 +1413,7 @@ static bool record_context(struct i915_gem_context_coredump *e,
 	rcu_read_lock();
 	task = pid_task(ctx->pid, PIDTYPE_PID);
 	if (task) {
-		strcpy(e->comm, task->comm);
+		strscpy(e->comm, task->comm);
 		e->pid = task->pid;
 	}
 	rcu_read_unlock();
@@ -1459,7 +1459,7 @@ capture_vma_snapshot(struct intel_engine_capture_vma *next,
 		return next;
 	}
 
-	strcpy(c->name, name);
+	strscpy(c->name, name);
 	c->vma_res = i915_vma_resource_get(vma_res);
 
 	c->next = next;
-- 
2.43.5

