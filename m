Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301409A64D5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 12:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7AE10E48D;
	Mon, 21 Oct 2024 10:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a0NVYHjE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2488A10E496
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 10:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729507868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h2ciBpbcKEJEKHld76VWMnvn0NitnUmbu3TROV6N+1g=;
 b=a0NVYHjEcz24fNzDqFrOcihRuHZwNRxoS6F2Qod2ubQPLD7nF14dDnhCLemlQoHFYSr6kO
 arqPiXYN9teGXThEp7HeRnCnW1RVaCevtskllr5M9B2BSayHxvBMAI+lm6QxbGBDdXH9VM
 O3wiERDA0fRavspnfiNNKMQukWZPs90=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-7y2op6cBM5a2uJvsMTFnnw-1; Mon, 21 Oct 2024 06:51:07 -0400
X-MC-Unique: 7y2op6cBM5a2uJvsMTFnnw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43159603c92so30245605e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 03:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729507865; x=1730112665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h2ciBpbcKEJEKHld76VWMnvn0NitnUmbu3TROV6N+1g=;
 b=Cs7H/0gD+ZyRKVE0aiFz5ywbQQbuaBiJndZZ/X0dZ3T28kEP/3xaZaVNivD0sT3Svo
 CdzT8GDY3qjgZtwfHNjEcHKOSRN0CPlisEykVdX/cMFusKKM2Iekln6oJcPIuRwvQqS9
 hAxDTjg5pUy68QjbZf+bgJQjfb/iboxk1HPL8TdnGtGIoriW/97IMok+Bf/iaEv53F4t
 Js77JQdAZ4uhhE+WhjXrLzaizm3qVBdvlDN9+9smxWVwVebzqhjNsiuucDrb8mLkVmdy
 wJB61yWr7i23o7UVjxmAClPDZsNniUUM1hV/j6we4zOyQlTv+vc8j4ud8CqXtACG5wxc
 ifWA==
X-Gm-Message-State: AOJu0YzsKw1aw+gJHqhCveRmHkxGP0tSPCnIwXgZ9JzIGOcV+pNe+vwP
 RjqnYkTH/cNHlALOKB+KD39N/1ACP1HN2plgAt1xmLnSkjTv2oeqZEdnYa5bd+PID/sBlvGz1Fm
 nTpdJpr1QwIUVufFEPxDEK7JhdV2FG0DM3cogHzZbgRK2BwlsHSaw7pUsSSrhmw82wQ==
X-Received: by 2002:a05:600c:354e:b0:42b:a7c7:5667 with SMTP id
 5b1f17b1804b1-431616a3a15mr83928845e9.25.1729507865494; 
 Mon, 21 Oct 2024 03:51:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoDq0zpTx4/a8pJZ3ce7VUx/vHA7i5tc7ntMyJG6ujE23KLHEQO3J1ivFPoUl4rZrPbQ5gBQ==
X-Received: by 2002:a05:600c:354e:b0:42b:a7c7:5667 with SMTP id
 5b1f17b1804b1-431616a3a15mr83928585e9.25.1729507865021; 
 Mon, 21 Oct 2024 03:51:05 -0700 (PDT)
Received: from eisenberg.fritz.box
 (200116b82d449800aee93296d73e68da.dip.versatel-1u1.de.
 [2001:16b8:2d44:9800:aee9:3296:d73e:68da])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f57fdb2sm53065615e9.20.2024.10.21.03.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 03:51:04 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/sched: memset() 'job' in drm_sched_job_init()
Date: Mon, 21 Oct 2024 12:50:28 +0200
Message-ID: <20241021105028.19794-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

drm_sched_job_init() has no control over how users allocate struct
drm_sched_job. Unfortunately, the function can also not set some struct
members such as job->sched.

This could theoretically lead to UB by users dereferencing the struct's
pointer members too early.

It is easier to debug such issues if these pointers are initialized to
NULL, so dereferencing them causes a NULL pointer exception.
Accordingly, drm_sched_entity_init() does precisely that and initializes
its struct with memset().

Initialize parameter "job" to 0 in drm_sched_job_init().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
No changes in v2.

+CC Christian and Tvrtko in this thread.
Would be cool if someone can do a review.
---
 drivers/gpu/drm/scheduler/sched_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index dab8cca79eb7..2e0e5a9577d1 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -796,6 +796,14 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		return -EINVAL;
 	}
 
+	/*
+	 * We don't know for sure how the user has allocated. Thus, zero the
+	 * struct so that unallowed (i.e., too early) usage of pointers that
+	 * this function does not set is guaranteed to lead to a NULL pointer
+	 * exception instead of UB.
+	 */
+	memset(job, 0, sizeof(*job));
+
 	job->entity = entity;
 	job->credits = credits;
 	job->s_fence = drm_sched_fence_alloc(entity, owner);
-- 
2.47.0

