Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F989118AA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 04:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0D610E907;
	Fri, 21 Jun 2024 02:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aEgDnr9r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4D910E907
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 02:32:50 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-70436048c25so1558806b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718937170; x=1719541970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ByPZqEdQZBBtzQ6Ut5Ro8SR1Vw4SYts83oZvgSR+UR8=;
 b=aEgDnr9rD7rxr857OChC+Yq2QTkH86d4cze3ZAFAoARN1EPrMDvzLgvzPkQ77bdQ9W
 z7QPAV3/Aesn2iRn3Ey4CHmwqoAy/BrrvylEI3h/nnos4WrI0T6MIltWHdJUCJuTsEjw
 CzdR3C8RP3z+vUsdViXOV/qRUU7sGdWmjkosRPZMqU40nzs6qT5V+m4aOeAwe1fvkQ0H
 IRa0147Vp08i43ZbOXNUlAAQeUvu4p03MkQylX8Hus1QpKo1Rd9PBGCJQmSwe3oKmaT5
 pPrK0xWp4OccENDgwpGK53Jl7ljYsWpjGBAUYgLZSX6FFFWBOHjD4ZdtLNCNkLwkjzMN
 1Xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718937170; x=1719541970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ByPZqEdQZBBtzQ6Ut5Ro8SR1Vw4SYts83oZvgSR+UR8=;
 b=cvigDscPLp//W2ItbSr0r7uPaHF2mUHJPhuYF/jDxoIleTbvLmDc9RAQjKcLDdo8Fn
 10LM+D8QAZNlV8fRkHIgrZXGRHngjRKY2E3IPo3wPOU4G7DpYv72f7dnCrymVm0fPmTH
 sB4NR6mhx3/t5xryTKNaT/QsALPtMt7QDqKcZeTtvFfotRE73YAkmf850hCY/up7Tqwi
 1NRkvk4x4ruPZyGi7SVU5P3qicR12hhgloiZIf6SVsgbyPTwPnd6sxMLdpfJpk8CZK5n
 5bX4Swa1AqiC3z4pTb0tQFG5ZFPKHyOnNXv1Rd9qWijLtn2zzBP3WIEGaCPbEYh41/Ic
 sUBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRDyrKrVbLXQ4PdYI7N9bP/kxwSIqB6KxJwfScy053WF7i5Gwe+R1ch6XRERt/xbJ+klK4fBF6cNZWJre8q4YjdRv8Ut+joMs9tjdxK5ep
X-Gm-Message-State: AOJu0YxHX9+EEPehrKC1WgMz/Ao66E5dC4rYxWJlnMYRZH5ZVoiHe21P
 ue2upL3d274suc/ciZm8of+2U5MDdA6R0Xg2JOTq3F891xiqAu8+InkWKA7B
X-Google-Smtp-Source: AGHT+IHwLzKazOZk9J+TnuaENF2GrO7T5JApXVTdzZDurk6fW60Sg+sw/brS6M3qBlKISuVvI9yc+A==
X-Received: by 2002:a05:6a00:4d91:b0:6e7:20a7:9fc0 with SMTP id
 d2e1a72fcca58-70629d0d58cmr6849890b3a.34.1718937169948; 
 Thu, 20 Jun 2024 19:32:49 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.24])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706511944d2sm332488b3a.70.2024.06.20.19.32.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2024 19:32:49 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 11/11] drm: Replace strcpy() with __get_task_comm()
Date: Fri, 21 Jun 2024 10:29:59 +0800
Message-Id: <20240621022959.9124-12-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240621022959.9124-1-laoar.shao@gmail.com>
References: <20240621022959.9124-1-laoar.shao@gmail.com>
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
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
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
2.39.1

