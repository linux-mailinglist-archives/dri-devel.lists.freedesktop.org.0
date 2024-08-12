Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A4A94E4F2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 04:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1126C10E062;
	Mon, 12 Aug 2024 02:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pt5/YOzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299BE10E062
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:31:35 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-7a103ac7be3so2282194a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 19:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723429895; x=1724034695; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZu3KZG3iOINXwUvnWcZKbey2aLH0BWohtl6uQ29mP4=;
 b=Pt5/YOzo3Lgb2BbosUJ0du67+B/lD7nanvHTxPf44S6HrldejiwHKrP7DFSVVbw6Zd
 z6rNxG8H7dnv02WOAhT+CgdIgS1RQE618QA/DVlVvNsnmD6I1HKbyzV5yvzPqANAy0DU
 ut6cKvD1934TQVCHlrZba0g+QZaowFjW7jZXo2/z0H5dHwbO11uSu/y10YiBMG8TPl0N
 2o4F6l54hdASolS/1XENhONPv1yLh4eTI5I7HSasduxrwTgRkFEHJTj1cj/wiJiggsLL
 N1VKLozHnoVW8BkTI3fmlGrwrffPtMQAu+xFFqwBvKmDe/Hg5gPbJ1LonXTcZwwkbEN4
 4JhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723429895; x=1724034695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZu3KZG3iOINXwUvnWcZKbey2aLH0BWohtl6uQ29mP4=;
 b=Ncs++8qnoxkqCvQ3xeDjwdc83UcS90fBf6s1/H6rIt57FQ59ByQNAI1udcVqlp13dC
 4ww74bJaOwT8DL/VImj6ZA3wjJUxZ8ujzi+Q+yw873ReunIBBagcFz4USrq3Ai+3JdnY
 nDzW3eoiRaTGDuzAjEatBUNTUPQmyAkXjyrrJ0lmba+uBUQcAAD2ca8usWimhYDfAnWP
 PsPezhdMBKAeGwK6GD7oCxCRkjMlFU8SIFLF1gigOUCAmHRbLgW03hrGT2mMTx/pWyjB
 VODXpAzNl+dbf4vP1RKmsUAkNMPf1p0r70CiAQXnTjqUGz1b0HIlnJ/Huwf1rNpqvcDc
 53rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg9goIZDbQPXSbNE9qSRv+Mf/Lk2DMDfdDNYMQ6J78JX8eShXVutPCwOZ3doQba9cpAnQcUbYUGvfggvGO+f8UcE1ndKV6UR5chxHaXhJt
X-Gm-Message-State: AOJu0YwXVibeRt4aR9vLmspGCGgSBI//jg011Y9Tt3DL2tN/qJub5ifu
 kHvOMm1eEeDJWTrQd6PF5AEvEbuh+DiJI36wTVmt7TfTJHrKPiZd
X-Google-Smtp-Source: AGHT+IHdX1dJ6B1gxMt4DoIS5gsxO+K0m5bSRRhjzARSl7z6wL1zfkA/bgMgo4cA342XfY8E/QA2Rw==
X-Received: by 2002:a05:6a21:b85:b0:1c6:fc56:744 with SMTP id
 adf61e73a8af0-1c89fd26229mr6526380637.31.1723429894568; 
 Sun, 11 Aug 2024 19:31:34 -0700 (PDT)
Received: from localhost.localdomain ([39.144.39.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bb9fed69sm27884765ad.188.2024.08.11.19.31.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Aug 2024 19:31:34 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
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
Subject: [PATCH v6 9/9] drm: Replace strcpy() with strscpy()
Date: Mon, 12 Aug 2024 10:29:33 +0800
Message-Id: <20240812022933.69850-10-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240812022933.69850-1-laoar.shao@gmail.com>
References: <20240812022933.69850-1-laoar.shao@gmail.com>
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
dst string in strcpy(), we should use strscpy() instead. This
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
index 888aadb6a4ac..71bf8997eddf 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -868,7 +868,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 	INIT_LIST_HEAD(&fb->filp_head);
 
 	fb->funcs = funcs;
-	strcpy(fb->comm, current->comm);
+	strscpy(fb->comm, current->comm, sizeof(fb->comm));
 
 	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
 				    false, drm_framebuffer_free);
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 625b3c024540..97424a53bf9e 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1411,7 +1411,7 @@ static bool record_context(struct i915_gem_context_coredump *e,
 	rcu_read_lock();
 	task = pid_task(ctx->pid, PIDTYPE_PID);
 	if (task) {
-		strcpy(e->comm, task->comm);
+		strscpy(e->comm, task->comm, sizeof(e->comm));
 		e->pid = task->pid;
 	}
 	rcu_read_unlock();
-- 
2.43.5

