Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5056FB02E8A
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 05:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8595C10E033;
	Sun, 13 Jul 2025 03:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PU9Hr4GZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9168A10E0FE
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 03:08:48 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-23c703c471dso36392685ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 20:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752376128; x=1752980928; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FOwnLqSs1rW2UYmEVELRGgX3h26kVH+s5TT74bf5das=;
 b=PU9Hr4GZPASabd4bI7ZNOqVXDSgSo3LUxBdX4o3fcr1cOo4IJDiwDGzKEusH8XYuiE
 RkBpTdZy8tF7WKEi4/su9L62X1e6JsJKmmKFHs7z1mvjarJ8qHZjbTpQoBAII84Y0/QK
 bnHclnDzsOEUyG4PuVLUl+wPb2S6HgtscZvZX6+KR9A0UZbXegwqP5fdrnxeAF0dpQyt
 Y4LEh66Nf8Y+nUzFvNLS7wscuYRZQrYXtjHqjn6jVUXSsnrmIVhxJtKj7OBbXpOcLMG6
 zpCWEqNwXZWGroII9W3g96fJJnf/5/PEJmbSrS+uXXsd/L2tjkZ64YJ7nv13Z5m1FrUI
 /oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752376128; x=1752980928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FOwnLqSs1rW2UYmEVELRGgX3h26kVH+s5TT74bf5das=;
 b=boHvpDcMqoox3LZYOKGBgV41DzMPGMv9adtyLqm34mEuMI3L+OiiNw1/0tmffrWeQU
 rc9KIiRoJzeAnpdPHDF3OSj8dWqqoW44MXO+f19cESAQjhwmRxHIMMB0WduJizEvhnic
 D022/56etCpd+1aXUZS1Ijy0ZOnLQ7+lLjH2R1X+rhowrS6x8hKEuZgV3gYOG3BsHbgq
 1zXCTgA2PsSP83FtATCxX2gnUxui33Pku/0qB0mjfNOO/mEtWStXa3bpsaFdyxvUQUPe
 I8jOxyDdk7RkMpCdCUymO1p0sWMJkqGhxsY2YSWLWpd95PsQMopNiLtEmGY1U0x5Oix/
 M2qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUdsl6SMTXdhpNcIeOVcIeRDDcolNpEPyf3tkIQbW4vJd3QnY/jkXqnc3frAhIGbRKDykOvq+XKR0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLCS42VkO5l0Tw31eSpeg3PXnSldOX0QQS7Sd0WO73iTv+gPgM
 WUoVUVHmHgGmRQjr/JU6VeeVwSCRSrKopQcFeB2p+tiJqWua+uIrVXbR
X-Gm-Gg: ASbGncsCq7nNOzv0DG2c304laDs69yCjxFyydEANpWA+1TAEH0S0L0fOb4BarPmEuH1
 Un0DT8UDlQYCcMjmGE7LQ49j3wyEkX22grIQlfOwn2xHPVFEusSOZwzZHi8TxFMq5GIKD8/LuGC
 vCcMWoZ4v5wOkr0kQq8AMV0Nhk4Z+z9cvdQhVFmIow+jU9kTXUc6jessy96aIU9hkvKz6EFKTab
 SlDYSJXe6WvDLKn3YuLJUaxrlkE6mLQ3mM9W47OtwBAv8PEuaKXUdxj0p2Y9+VcLYnv7X5PpnXH
 2Rqo731zlkAclBAtPc+VJsZKJyHLaINL517WmbfwK6y/a7i0qYJP2yl6u63+GenQVbJL3FD7CY8
 P2qFUzsTI87gbD8OATO4+SZPIs1G3kni1YYmwHQ5E4uoc8uMicFxNuBir
X-Google-Smtp-Source: AGHT+IHEjvSrvB+9387zR5i0O6g6zaBHfqOrSnLb9UWk7X06QM857ZJw7NrfsXYDnkcxFugrnXKMhQ==
X-Received: by 2002:a17:902:d58d:b0:235:e1e4:edb0 with SMTP id
 d9443c01a7336-23de2ff102emr196227525ad.22.1752376127944; 
 Sat, 12 Jul 2025 20:08:47 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com.
 [34.125.18.212]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23de4322b0csm72162565ad.113.2025.07.12.20.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jul 2025 20:08:47 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] panthor: dump task pid and comm on gpu errors
Date: Sat, 12 Jul 2025 20:08:31 -0700
Message-ID: <20250713030831.3227607-4-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250713030831.3227607-1-olvaffe@gmail.com>
References: <20250713030831.3227607-1-olvaffe@gmail.com>
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
---
 drivers/gpu/drm/panthor/panthor_sched.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 823b0fe678ba6..47912b06ec9d3 100644
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

