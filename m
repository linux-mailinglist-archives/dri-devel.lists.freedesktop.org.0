Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69157946D53
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 09:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E184D10E0D7;
	Sun,  4 Aug 2024 07:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aCJCLNtG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F5710E0D7
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 07:59:08 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3d9e13ef9aaso6621587b6e.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2024 00:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722758348; x=1723363148; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=leoSzvc1irTIRY4t+RZAVg9wXL8E4KK0Ycetp1tzeI4=;
 b=aCJCLNtG1YUZpwXslrWttIeBQOacOPfNc8/UlTxa7mbxQB8cg37XYei6JcpQ2EBRkQ
 Q07NSkv3r84FNZMH4LX5wzwW4m3HrWzNawhQtPuzCpH/9RpNIilfi8FBN4yG1Gjl5ld3
 MB6G3yMZkfZq0pOXtt42m2aL92rHXv9uvlHfNiVWqXKVWH9K4MTzcpi6emJiG/W5K/Hn
 0bZrkB0PAVNF2dqB05vKFikAZGPTwPDy7Gd7LzgIi5hROZ1jGO5YcMWDeX7oebE/wRJD
 uU/8M/dJA5B6/fupxeNY/UoOOojcQWoLt4SJEM5E4fxry8MzaBs/rkwTAMdVK1mUR2gn
 jemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722758348; x=1723363148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=leoSzvc1irTIRY4t+RZAVg9wXL8E4KK0Ycetp1tzeI4=;
 b=R+nSlTlY/U5Mp06TXERrZyLqhdqxblRnqgl4mOMyrFfYfdoCRVIWF5EeNhBsvdAZbK
 4yGE7tmon3wxJRL/hQ5VIqgwUbGvNqguW+Nr68co9ZdmPAC3jXPacwUqdcSlvzSBJZkv
 FKLHpIKoHZCdk6MBVUhG+LApGXsy1qZFMknAAx80Z3TtkNdlnPxwXlivu6xqodKJBdEr
 PcjvEQRcDtYaIaCENhofhY7j9rwxcMnsnEMC/ouQgCtMVVsk9iz8Go26ucH/CaHHBjoJ
 d7JCQUJT8mgpvnPn+btTzMCSleJVHd8uCyiV+I0FDxIeynB5Kn0amjuJlhZQsbisMhjr
 yAng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUug9NZLttWKRnGXHEUc8sp1A6G5pP5KAz9QaWTZN8DIowq43ZAnsTFT4cRKdUpgMa/cya5X11ncmCpKqTxUVyCaXBXzhONq5IN6V9sq1xO
X-Gm-Message-State: AOJu0YzpQOAmk/olz0kNKVSKj6KGetZs3QkuWCki0ZDFuOBbHjFwq9qU
 i+lcpBJHLtF9XyeNPvT7rdKwXN91bR1n/RGx3WLHOpoVjy6hqmhR
X-Google-Smtp-Source: AGHT+IFvxFD9i5t49STUUYBZ5sy63mPUTCqzaYfVU1LOK5V4jv+UubPbJD8tYCgFeYVMewc026EG+Q==
X-Received: by 2002:a05:6808:10d5:b0:3db:25f6:a62f with SMTP id
 5614622812f47-3db5580f909mr13121118b6e.28.1722758347849; 
 Sun, 04 Aug 2024 00:59:07 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff59178248sm46387605ad.202.2024.08.04.00.58.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Aug 2024 00:59:07 -0700 (PDT)
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
Subject: [PATCH v5 9/9] drm: Replace strcpy() with __get_task_comm()
Date: Sun,  4 Aug 2024 15:56:19 +0800
Message-Id: <20240804075619.20804-10-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240804075619.20804-1-laoar.shao@gmail.com>
References: <20240804075619.20804-1-laoar.shao@gmail.com>
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
index 96c6cafd5b9e..163457a6e484 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1412,7 +1412,7 @@ static bool record_context(struct i915_gem_context_coredump *e,
 	rcu_read_lock();
 	task = pid_task(ctx->pid, PIDTYPE_PID);
 	if (task) {
-		strcpy(e->comm, task->comm);
+		__get_task_comm(e->comm, sizeof(e->comm), task);
 		e->pid = task->pid;
 	}
 	rcu_read_unlock();
-- 
2.34.1

