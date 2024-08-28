Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68722961C93
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 05:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C756E10E48F;
	Wed, 28 Aug 2024 03:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bpRdcJBS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1FD10E48F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 03:04:43 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2d3c05ec278so4580393a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 20:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724814283; x=1725419083; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8OBLeQ9F541pwxbn8dEubiWANdxJtGv9ekHxWl5Hwac=;
 b=bpRdcJBSlhJmZS69VbnxID9zxEk6JZ1HQvYPd7wxoh160hIdyogKlf1u2/JyxBvD4d
 KZnAda0U52dvGPO2WUpgWC+aieUvkiioGAKM2Jnyjw+U3wYKAe0cXJ1aZo+/dfx+iyD1
 KTidGArq6utLU+/rscMo7pfEp2a6TliYbwx6Ctl7zqGkhFm/p4EaeFdvtohM6RZWVem5
 tdZuXgmzfpLSsPy8EYeaDObkrhTCuXmq8Q0vavk5KjPlrs/vmz5t+YF6h16Yl5hWuP77
 VBXPiCaNZh9UR1Hpoav5vfh+WSsi9eUIhwkCHkPkzRIERrtLX91ZvEtbf+mx+IB4JBuN
 NazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724814283; x=1725419083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8OBLeQ9F541pwxbn8dEubiWANdxJtGv9ekHxWl5Hwac=;
 b=qy72+q7EqgRYcia3PBpGfixnxW36fP8IIGgaKHv77PcODdAw9j3rfeu9mVom87mhJO
 ekEvz7FUdIHNhxcwfv1DxA/8Mg+cMiHsXqnacmmOLftY6hVOB9bzS7WoE3STxF+MdwCm
 k15vapd58Brlv2Ibir5uE0dmdq7AakKCs9wBP8Y+BVegqJU3bxIlwkuAmiylUt8UuSHL
 qd4sML4T7F+ZgC5Faj2yLLbR61T0yngc6GI3vkmk4aCVBEB1fyQoCv9KX88rd3KFEcwQ
 H1C3TKIAX3M2zWJJ8oc6Shj+NIKw7Ld0jxaudta2z/o44Uzcd1sIbw3ypfrawmi14ar5
 KIPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoSWhQ8G0V9/CFGJMpLsbXDSoROC9Ss+Vcat1ERSZTwXm5+c35QLL5LQFq1XRy8Ja1UlhKgeO+KRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5t+QcKOp2lldar9Jg5xLK1COzRAPbJy08r5z1x4GvOWoDKzMq
 GF8ij8YDX5uPCgcfg5+p9p7QD5+r2ZOPYDflKhJLuY1qy+CG1wrl
X-Google-Smtp-Source: AGHT+IG9WCG/sJqfIUmD5L1QkWASIgz28eaxuJrS0TfQtB7xTFo8bkGI6Rj777tc/95CgBuyWlEpcw==
X-Received: by 2002:a17:90b:390e:b0:2c8:e888:26a2 with SMTP id
 98e67ed59e1d1-2d646bcd147mr17296354a91.13.1724814282792; 
 Tue, 27 Aug 2024 20:04:42 -0700 (PDT)
Received: from localhost.localdomain ([39.144.104.43])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8445db8f6sm317977a91.1.2024.08.27.20.04.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2024 20:04:42 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, alx@kernel.org, justinstitt@google.com,
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Subject: [PATCH v8 8/8] drm: Replace strcpy() with strscpy()
Date: Wed, 28 Aug 2024 11:03:21 +0800
Message-Id: <20240828030321.20688-9-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240828030321.20688-1-laoar.shao@gmail.com>
References: <20240828030321.20688-1-laoar.shao@gmail.com>
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
index 96c6cafd5b9e..afa9dae39378 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1412,7 +1412,7 @@ static bool record_context(struct i915_gem_context_coredump *e,
 	rcu_read_lock();
 	task = pid_task(ctx->pid, PIDTYPE_PID);
 	if (task) {
-		strcpy(e->comm, task->comm);
+		strscpy(e->comm, task->comm);
 		e->pid = task->pid;
 	}
 	rcu_read_unlock();
-- 
2.43.5

