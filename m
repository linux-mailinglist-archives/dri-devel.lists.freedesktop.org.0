Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E024F90688E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B01110E9B9;
	Thu, 13 Jun 2024 09:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T447+X/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8114A10E960
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:32:25 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-6e57506bb2dso450723a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718245945; x=1718850745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ByPZqEdQZBBtzQ6Ut5Ro8SR1Vw4SYts83oZvgSR+UR8=;
 b=T447+X/l+FtIDTCxe1g4qLqexAo8lb+eRf0EcD/SitfwzUxWjM0XOCwXpPPP0Ys2Aj
 hc8DtcIBaj6U6Zp4n350UaJqj7GwmRUn1RAu8awjh2cQ9TH3OnABbny1zlqgDRVZ2b9K
 C+OKtqypba5TL3nZ5V2jFAVq+5aAATKRJSnvZKnMDhZ7muB3FtL+UeBG+fwvJyFL+t9t
 wx0d5HFIyPlm7lGV/cqO0Yf13IRAVyUSZd1evZmgjuyzJtswbj+WAWXJlGbuf2KBUiNv
 lau2x1i8ivPbVsBXBmlTqmqdsRSaxbfxHScwmgr5yr6cospV5PUuqxvz/8itAdPP5+V6
 Na/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718245945; x=1718850745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ByPZqEdQZBBtzQ6Ut5Ro8SR1Vw4SYts83oZvgSR+UR8=;
 b=e82YCy5las9YwZFa0ovJyAJqfmg/7nCTd4jhbAh12lFoSOa0+aAdLNB1WZQQI4BXNp
 yuTpIoHGsymJEPsYhHu9NSUOL4CjDLph0vo2oRmYuZVnD84d/sWeIUdnk0UUgQUaw3Bd
 cqYzwlWCQh1h1W0sw9Xl0+V9oBMUJsI0qTXc9nyx5R7oRxcbpk9EtKJuchp4mvN0+CCJ
 w7XCAVMWK2c+DsywRWomRAkATKRb7mP5CYr+DokgKV182wIlQVCjnl24svyf8gSslzSm
 REI/fn7TNbt5cIqnMkakrYpUMPC1vBPOnaVbfTeUnB0RSVYx4Nv4UeTZlc6zQa5d1Btm
 Bi4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6Xaah7Oee1Dl1ruYpdU+t4DMbn7jO5fedvyuJkkJs9hNYSXMpfZoUhCklGLUmrJBBu45qdxoTnokwrZHhOxFzg6Vk/kNyCFeFh3uxqCz2
X-Gm-Message-State: AOJu0YyhfezunDrr1OXnCofob7qNHfK90gpRRTf7a+fyyFEL/RdhTzkE
 EMpBUsQgeE3FnDmscYMfrqO/jk/4NZz+YpgQzgtZBYLnWyt9ZAXU
X-Google-Smtp-Source: AGHT+IE+I63Tcz7mU3dbe4p80REUOFhGXlU1vxQyrrx4b613sOPf+IM/heFPON96TqCsfc2pgVpt6g==
X-Received: by 2002:a05:6a20:840c:b0:1b6:c527:7e42 with SMTP id
 adf61e73a8af0-1b8a9b1eb09mr4050153637.3.1718245944827; 
 Wed, 12 Jun 2024 19:32:24 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.92])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f4d159sm1755695ad.289.2024.06.12.19.32.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2024 19:32:24 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 10/10] drm: Replace strcpy() with __get_task_comm()
Date: Thu, 13 Jun 2024 10:30:44 +0800
Message-Id: <20240613023044.45873-11-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240613023044.45873-1-laoar.shao@gmail.com>
References: <20240613023044.45873-1-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jun 2024 09:26:31 +0000
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

