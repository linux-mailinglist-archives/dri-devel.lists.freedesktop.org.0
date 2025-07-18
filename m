Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9F6B09B89
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 08:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DCC10E8D8;
	Fri, 18 Jul 2025 06:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KtBS34Fq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1090210E8CE
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 06:38:28 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-236470b2dceso14755135ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752820707; x=1753425507; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pyOFBjjILGZ/9yy1QKGeqG5tqzgbh2ChTzOEA3keYr0=;
 b=KtBS34FqXrWOwDj3rJ5hDQKrloxpu3hX9pLdPMXloUNMh8afG8YbBzShqjIpPvZAbb
 ISRDBBVAqGof9NhjeWA5Y7gWurOP8leqcrBnGDbQZm2D3J4VJhOqjlvZtdIDtxw/H2PQ
 oV/P30j7h7t9H5+0wftu4dpFY2EJf7PtMsAaNW8fGILIuKi5rGjVD4vV23AS2u/gRGcb
 +vt0GZT62mzpurMsrNWxbgetrQiVJjTSEWHWQ9EQ3yFV8MV8KgE4eKpwA8oOlEU1FNNP
 wgCfyNnGXnXBCe0FZJbpqqzbM7ZXvxBzCA7c/Ryh/Gh5R0RmRYmdCSG9ujV5iJiqgtXn
 jZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752820707; x=1753425507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pyOFBjjILGZ/9yy1QKGeqG5tqzgbh2ChTzOEA3keYr0=;
 b=gx55KoLSN4D4IXq3GvTCAixYq2kja0RZdpczIxvoBuf6ft7VHemHxNT3b8Z6tOkGJs
 AEyLjDsxZaM6rA0ZRbONTV1KzxL+p6aXBfXoyaOG9sYVdiFheDXz3dX1JJVtdIUtqc56
 oM0SfuX3rw/NqftMPHt4b8RELzHyaxlfYWI6vXmL3Q0tRhYl1Zy+LeX0IEwiiLCdQmho
 jOAfZl34NWFhe5/nL75nw56zXMRxFG8Fo2SjEX+bWxGcBuKVlOj0GiAa2N2CnxQWmrcu
 +O4LKxDPUdwRA3XBxPg3Yp5UMAesL01dE20ZREijtgDazm7qs/K61I6aOP/p2Ckh6BIq
 C9JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaUIvSg0uRG8yT7UE/KL0F+j83HQ30JFrSdNERiMYEaT5k+qq+tjKAjgpoRjDSXVPYcpM5D3k32io=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxukbGLs4Wg9ILeFcVQY2E71KLCW5hb0zgkboLFfzoWY3jguazy
 wprqD0ZpJa+d/nMdUjHQ7fkrzNFNtMGc1nszUDFieS+tbascwzoxLNqT
X-Gm-Gg: ASbGnctn+WCLvUJhbrGn9lc0YG8m/42yjCMrj+e3g+3VpyQgezH8/nZE8ol+Y32G7L1
 qc8Rg8lbqByKfbw7JYs+jpnOxcIGa7p2CSj/jRXIGBQOcHAXXr4faNyQvYnoj1hm1aYCfNLEUhq
 LtFwnJTbPOePC3OyWhT8bmHALC3NYTmBGtGzeJ5s/atZfn0gw1PBsFNfJ2kR+Dx7H2QRhpIYQ49
 XpRERCcggSZ1Sa2xdtdiFikrbLRJE+MPPTGsxxwxq/trByjydebwRzu/REnP4jxFdcy8wG9hEaC
 OxMYCKqNCHM+T34fzFrJJ8/6GynUxlWrnJgO3/bITE2VzPS35huFOJutcdx3iJ9D1Hb40wXoGVL
 5ZStGdlIOvfG+JGVWpcMyAa+rmF1mx4BfvNqjkQDobPGNNbV8uNBoFoeq/ZbUrysK+x8=
X-Google-Smtp-Source: AGHT+IEyBbipxL07jKyKAdXRLruyc99NlUyMTGUqtVPY6nQyPvdJBmDPwU1q3oCR3Iz/i0MUPQJT5g==
X-Received: by 2002:a17:902:db11:b0:237:ed7c:cd0c with SMTP id
 d9443c01a7336-23e2566b0fdmr128701105ad.11.1752820707379; 
 Thu, 17 Jul 2025 23:38:27 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com.
 [34.125.18.212]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23e3b6b4b73sm6649105ad.113.2025.07.17.23.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 23:38:27 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] panthor: dump task pid and comm on gpu errors
Date: Thu, 17 Jul 2025 23:38:16 -0700
Message-ID: <20250718063816.1452123-4-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250718063816.1452123-1-olvaffe@gmail.com>
References: <20250718063816.1452123-1-olvaffe@gmail.com>
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

It is useful to know which tasks cause gpu errors.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 9987aeb4608bc..3a7472baa09ac 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1364,8 +1364,12 @@ cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
 	fatal = cs_iface->output->fatal;
 	info = cs_iface->output->fatal_info;
 
-	if (group)
+	if (group) {
+		drm_warn(&ptdev->base, "CS_FATAL: pid=%d, comm=%s\n",
+			 group->task_info.pid, group->task_info.comm);
+
 		group->fatal_queues |= BIT(cs_id);
+	}
 
 	if (CS_EXCEPTION_TYPE(fatal) == DRM_PANTHOR_EXCEPTION_CS_UNRECOVERABLE) {
 		/* If this exception is unrecoverable, queue a reset, and make
@@ -1425,6 +1429,11 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
 		spin_unlock(&queue->fence_ctx.lock);
 	}
 
+	if (group) {
+		drm_warn(&ptdev->base, "CS_FAULT: pid=%d, comm=%s\n",
+			 group->task_info.pid, group->task_info.comm);
+	}
+
 	drm_warn(&ptdev->base,
 		 "CSG slot %d CS slot: %d\n"
 		 "CS_FAULT.EXCEPTION_TYPE: 0x%x (%s)\n"
@@ -1641,11 +1650,15 @@ csg_slot_process_progress_timer_event_locked(struct panthor_device *ptdev, u32 c
 
 	lockdep_assert_held(&sched->lock);
 
-	drm_warn(&ptdev->base, "CSG slot %d progress timeout\n", csg_id);
-
 	group = csg_slot->group;
-	if (!drm_WARN_ON(&ptdev->base, !group))
+	if (!drm_WARN_ON(&ptdev->base, !group)) {
+		drm_warn(&ptdev->base, "CSG_PROGRESS_TIMER_EVENT: pid=%d, comm=%s\n",
+			 group->task_info.pid, group->task_info.comm);
+
 		group->timedout = true;
+	}
+
+	drm_warn(&ptdev->base, "CSG slot %d progress timeout\n", csg_id);
 
 	sched_queue_delayed_work(sched, tick, 0);
 }
@@ -3227,7 +3240,8 @@ queue_timedout_job(struct drm_sched_job *sched_job)
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_queue *queue = group->queues[job->queue_idx];
 
-	drm_warn(&ptdev->base, "job timeout\n");
+	drm_warn(&ptdev->base, "job timeout: pid=%d, comm=%s, seqno=%llu\n",
+		 group->task_info.pid, group->task_info.comm, job->done_fence->seqno);
 
 	drm_WARN_ON(&ptdev->base, atomic_read(&sched->reset.in_progress));
 
-- 
2.50.0.727.gbf7dc18ff4-goog

