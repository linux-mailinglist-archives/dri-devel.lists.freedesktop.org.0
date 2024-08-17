Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755B1955513
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 04:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CCB10E86D;
	Sat, 17 Aug 2024 02:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nZE9NjbU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E10F10E86D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 02:58:02 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-690404fd27eso25415697b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 19:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723863481; x=1724468281; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PIeMfVPvNi2mFgQGi33u0WiVQIXgvCVnP/JNmg1PAVg=;
 b=nZE9NjbUUKVza4vQuG3s9V/ohiLeNNO8QohzHPNQx621jwxXglj0g6Q+vRToQvt2iQ
 a3MKYWjFHYYxQQ6zmF9SEHTAIpxa05HJO/apRZ8uGBB9zQFL/NIisneGqznIJ0F2/C1H
 QOvWvdmRyf9hs6bJTM2xlT4ogX95+31w/bgW3/qwokItEfbSkq/Sib2Ecx+5JQRstoQW
 2zPV12eR4M/JavLQB41IB4kXCMoJI6cObaaUhBSYk1Yzv5qzswxUmL4a0MgXG3oae3BD
 zXiI0s46c5X4AdvmEg8puiXqjxX76kbx2Xj33my+kcU8yl5lVs0cr6ft3dT9p5ydPWrD
 dYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723863481; x=1724468281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PIeMfVPvNi2mFgQGi33u0WiVQIXgvCVnP/JNmg1PAVg=;
 b=FMk5qihkVALpv6tiJlXPrtczbYJgEyrf+hH8YFQERjNbDgo+64a3IJhhvxSyLhXiA+
 UcmUHbU+SKmdcBURncSKRjLQKyIgF3eogyLdn9KhonUwDTog0xwT87YRKIf6RQ3YSV6z
 YAdXmzG4tYK4fDdebpL9XE/qgtR+VqXFak/IIEqRoyvGe7R2H3VXD6trC3e+VdSrpD5j
 uwcoB6pZKs4FqNT4OjQu0aeWYODSzc9HtyEWaqGsls1zq3p9pYYFeG4wBhWsx3tmEn9B
 OtnDnqSSv2D7nbVHitHOupk2nQTc+A8cmAUHUT/p5CzA8FIKDRmryb6z7aTL3MrP2y06
 WCIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY9QmzY6tc97Nsg/bqDWVOeWoUVG4WKZfGj1yKumk6OIvYNJqM7LsNhPScgq4Col4EASXuk3bMvhvFKADXYZGqLh/L3SaG6DlZnCArYVEm
X-Gm-Message-State: AOJu0Yy+iGjLyJMFQ+w94kkgod5SDMEU7b4ugoLUU8j+zkvmKDDKu30T
 zIpHpLNQKN3pYD5C0BYd8/fLqWIoV5RIsHjaTogZT8dTv1ZxuufP
X-Google-Smtp-Source: AGHT+IHIEqe/Cmg7s9PimPuB+lj47WHhB9AJi/MthWBlVJ6PrU4Dd47Rx7cTZURpMhIAboN0X1uK+w==
X-Received: by 2002:a05:690c:f01:b0:62f:f535:f38 with SMTP id
 00721157ae682-6b1b9a64059mr67878767b3.8.1723863481074; 
 Fri, 16 Aug 2024 19:58:01 -0700 (PDT)
Received: from localhost.localdomain ([183.193.177.10])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f031c5e1sm31801785ad.94.2024.08.16.19.57.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2024 19:58:00 -0700 (PDT)
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
Subject: [PATCH v7 8/8] drm: Replace strcpy() with strscpy()
Date: Sat, 17 Aug 2024 10:56:24 +0800
Message-Id: <20240817025624.13157-9-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240817025624.13157-1-laoar.shao@gmail.com>
References: <20240817025624.13157-1-laoar.shao@gmail.com>
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
index 625b3c024540..374378ac7c85 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1411,7 +1411,7 @@ static bool record_context(struct i915_gem_context_coredump *e,
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

