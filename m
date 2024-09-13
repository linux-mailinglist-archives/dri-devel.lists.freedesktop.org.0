Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E6597863C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 18:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3B210ED3D;
	Fri, 13 Sep 2024 16:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ctb4nLFh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C703110ED3D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 16:53:30 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-718e2855479so1789943b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 09:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726246410; x=1726851210; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pRpY/CVpMYAkC/cmsUyFHgCRongi0M1NU9h2RBhRUd4=;
 b=ctb4nLFhCLOji+Vpvi8WcwgQ2ZrAHhwH8BNU5eOP0BRLti12+LliShayxhZ1jjWTG/
 a0nNHh7THtQ8/t2oLzYIR1FpQYwDKNiB/otJtTqylneHAq1plsaDbluP9gElQZeWhLg2
 rRw1yJsLNnNl2f4z5BOi+T/2z3FoQz7OairIr1FCdgSrs5y3WMC8pm7M5xakI56QosNp
 YckVrn4/Nb73slq6AjdJhR4p17UxJscX/FKc/XsUcFeTgheqPZJ33sGztGZhGm//3O8h
 u+stsNJUxRtfr/NAEDsnB3jN5nmJQO7l6juE3QN7/8u8KKPmLz9yfEiZYs5H4tK8CRQq
 CPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726246410; x=1726851210;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pRpY/CVpMYAkC/cmsUyFHgCRongi0M1NU9h2RBhRUd4=;
 b=ZTF5vk83rgzhIagZelb58MG8xFhbDabgblUtDP4wZB7ewXzPCPHpgVjp8t4U3aq172
 ShNJ59HLqQo3y2UDYki5RHZXfda415Q7HcjSZDTJCgna9PDJvtZRYYLtMgOPdwktVmGG
 TW06N3W3a+KXbLSZ8kMv3Bhl6eQWTelahgMQ0rbICj+GjSOv1Yj90sLKRzVZO8gIEqA1
 +nBjcw87TmT1ibUx2py6TCuNfm96jTfKBRl/sTSclepaHO0V/pDalWES9eiKbMhGukiU
 p4GAxlj1WKWs32USfnytB2h4ZHG9DB84rRuicFt+S64AFR/69u3L5lrFxF0Bls61QNyy
 BYog==
X-Gm-Message-State: AOJu0Yyhy88hRLLEcEMVRhb0b6Hvd1LOoZDDV2od3Ho9c4mIJbvN6812
 ONF+QL0yFEsvOK2QNsq6LGwc6Ug9nek12zova0pj78fu6Dxag81kJrBizQ==
X-Google-Smtp-Source: AGHT+IGTpWeAJiptrTee9xaItPApwu1R5b8PiG62o5nmp4riaQE4k+sNYOGCJP4vR1hs7n/+rBdjoQ==
X-Received: by 2002:a05:6a20:5296:b0:1d0:3a28:d2a7 with SMTP id
 adf61e73a8af0-1d03a28d33bmr6257690637.41.1726246409439; 
 Fri, 13 Sep 2024 09:53:29 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71908fc9c7csm6291139b3a.43.2024.09.13.09.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 09:53:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, Asahi Lina <lina@asahilina.net>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/sched: Fix dynamic job-flow control race
Date: Fri, 13 Sep 2024 09:53:25 -0700
Message-ID: <20240913165326.8856-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
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

From: Rob Clark <robdclark@chromium.org>

Fixes a race condition reported here: https://github.com/AsahiLinux/linux/issues/309#issuecomment-2238968609

The whole premise of lockless access to a single-producer-single-
consumer queue is that there is just a single producer and single
consumer.  That means we can't call drm_sched_can_queue() (which is
about queueing more work to the hw, not to the spsc queue) from
anywhere other than the consumer (wq).

This call in the producer is just an optimization to avoid scheduling
the consuming worker if it cannot yet queue more work to the hw.  It
is safe to drop this optimization to avoid the race condition.

Suggested-by: Asahi Lina <lina@asahilina.net>
Fixes: a78422e9dff3 ("drm/sched: implement dynamic job-flow control")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ab53ab486fe6..1af1dbe757d5 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1020,8 +1020,7 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
 		      struct drm_sched_entity *entity)
 {
-	if (drm_sched_can_queue(sched, entity))
-		drm_sched_run_job_queue(sched);
+	drm_sched_run_job_queue(sched);
 }
 
 /**
-- 
2.46.0

