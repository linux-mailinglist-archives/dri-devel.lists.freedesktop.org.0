Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE76C9D173
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 22:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DE210E6DA;
	Tue,  2 Dec 2025 21:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A+JjGU5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E80B10E6DA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 21:31:10 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7d26a7e5639so6668876b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 13:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764711070; x=1765315870; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=yH5BeOmwEsubUzKm+mTo1kbqOHNBbe73SWrF7jJ44Lo=;
 b=A+JjGU5AVs8ryISQlTdOVwzJPPy97bZLdAcYTZ01tn3thSWfncqJiyS4e4XzWPybpf
 QFmnGGmno7L3WBzyWeR9r83uF4oR7lSRm10msEL7tmVKzVxJeRgW9nKi/dzUGcqb5ZrF
 wMsNT5iUlHBnF2OqhgTyw1DbMyUSmBdvDtv/dln1sddnsVENpmrVZaPrMSOrBUHC3oB+
 hOZhlmg+L2++tCQJ3xKfip/9Biq9Fs+0IiKk6C7iRDnRtLebg3DYDO7+WsY3xInBgp10
 fdms020+arWxZIuLp40t/i94+vuxgqnJu4M1h0Z8iLx01BlZpE3vB2ftHhSKVWT9dp+3
 Iq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764711070; x=1765315870;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yH5BeOmwEsubUzKm+mTo1kbqOHNBbe73SWrF7jJ44Lo=;
 b=NNyy5tCk1u44codI/iaig8z6Xrv22gELiHyHwZplwveCRbWzaaOnGZMWLm3lMMXNrj
 fdt3nfQoH32DiqgG6na3ndR+fx8ZrIRXrR3AeyJ1hTNJBroiWT0RiCEHxUFN5xeMP1mV
 NlGGJDwath6xZDCHoatRzioFWQX42DQ9wHxI4Dmwpwe6CxOq6Pwfj29GJi+ZlM2JSV0G
 Jc3h907tKftFCx5BfLKp88f0uJ2ua5TQd7BjRAEEbVuNm4TFBmsUXGhspBO7WNhDPYtV
 pPbxjuFEMfqVHKyDq5tZaV3rLc9hzbqwIJQtIggUQELeF1vQLga+RiG/8GXJsGQ+NyEg
 NaiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqyl1JmkYWiLYJCAhU/tkgwgYGl0OAvC+uO9E1v1m8ONEqNWPcFNWVe6hyAod2M2oUXdCDL1+iSlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9HnJLsST9Z3yQM+mqjaZ0AXd1cqHAzPj5QJPz2qDgONFVl4Uh
 NevFhMcWOwQ90eJf68fygj+8Er0AihOQ7N+K4S8tYFH2+MYqN+x2MFtE
X-Gm-Gg: ASbGncsX/9w2bVNGtuqoCJILIiyrFSEMiU9uDkb659X6k3lbzXbNo/+llwJki9TTzo9
 /JMM1qYRidd+2dWNrflBJh0OODcAX5uDExSgKkJbTh7B16eMhu7XZ+H2GZOU7BNbSrNhV6ln0Az
 nBjFweLNzKyXt28k46zT0Cpa9clGm1Gelq8QDiaVL9bX2H+qhcSlcWSXrplUVQ8ChaIRplLBggN
 bwlNK7YTsEQdjhM36gYCMdPWlw5KFbJr4MhvTxQl61N9+ebg9ENerCzKg9c8MX/iUnmBtQGbOQm
 oK/3zFtpVQEVdVsGz7WlHLYtKZN5hFfwKzzqyD8UnvwahJd9GtJwPmDKBE19vUGFktujEJY9Aqk
 XPBCrPKzc1IBSi/FJo5Cu55k2h2/X72sNvRF/gMMVekoMbWO1rbWEdVULwDEMjxnV7CCNn6ehW0
 BQww1qnyAi2jhey9KHiNxgYRx8a/yaxNq7cvNjbdq2y3k=
X-Google-Smtp-Source: AGHT+IFLhtBquNW3xKloVQHsX1MZpv5u7WEmUkGX/XE0NZ6v4BvhM0KL2YOk9v5fch5S241BeyuiBw==
X-Received: by 2002:a05:6a00:88b:b0:7aa:d434:69d6 with SMTP id
 d2e1a72fcca58-7c58c7a3e40mr43738305b3a.10.1764711069957; 
 Tue, 02 Dec 2025 13:31:09 -0800 (PST)
Received: from localhost (78.31.125.34.bc.googleusercontent.com.
 [34.125.31.78]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7d15e6e5e2dsm17742194b3a.35.2025.12.02.13.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 13:31:09 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ashley.smith@collabora.com
Subject: [PATCH v2] drm/panthor: fix queue_reset_timeout_locked
Date: Tue,  2 Dec 2025 13:31:02 -0800
Message-ID: <20251202213102.3197965-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
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

queue_check_job_completion calls queue_reset_timeout_locked to reset the
timeout when progress is made. We want the reset to happen when the
timeout is running, not when it is suspended.

Fixes: 345c5b7cc0f85 ("drm/panthor: Make the timeout per-queue instead of per-job")
Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

---
v2: reset queue->timeout.remaining when suspended (Boris)
---
 drivers/gpu/drm/panthor/panthor_sched.c | 26 +++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 389d508b3848e..95ae42168ce18 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1052,18 +1052,6 @@ group_is_idle(struct panthor_group *group)
 	return hweight32(inactive_queues) == group->queue_count;
 }
 
-static void
-queue_reset_timeout_locked(struct panthor_queue *queue)
-{
-	lockdep_assert_held(&queue->fence_ctx.lock);
-
-	if (queue->timeout.remaining != MAX_SCHEDULE_TIMEOUT) {
-		mod_delayed_work(queue->scheduler.timeout_wq,
-				 &queue->timeout.work,
-				 msecs_to_jiffies(JOB_TIMEOUT_MS));
-	}
-}
-
 static bool
 group_can_run(struct panthor_group *group)
 {
@@ -1080,6 +1068,20 @@ queue_timeout_is_suspended(struct panthor_queue *queue)
 	return queue->timeout.remaining != MAX_SCHEDULE_TIMEOUT;
 }
 
+static void
+queue_reset_timeout_locked(struct panthor_queue *queue)
+{
+	lockdep_assert_held(&queue->fence_ctx.lock);
+
+	if (queue_timeout_is_suspended(queue)) {
+		queue->timeout.remaining = msecs_to_jiffies(JOB_TIMEOUT_MS);
+	} else {
+		mod_delayed_work(queue->scheduler.timeout_wq,
+				 &queue->timeout.work,
+				 msecs_to_jiffies(JOB_TIMEOUT_MS));
+	}
+}
+
 static void
 queue_suspend_timeout_locked(struct panthor_queue *queue)
 {
-- 
2.52.0.158.g65b55ccf14-goog

