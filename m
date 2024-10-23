Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B83179ACC0D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 16:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368F410E7D5;
	Wed, 23 Oct 2024 14:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dvEIsDUi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E552910E7D5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729692972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lu+U1UtLeYKuG7KvpNGTP1vzTWevM8/vvCGog3NAbpM=;
 b=dvEIsDUiYhXBb0mbQgNbdOJdRrs4Cl1SaVgHnrFfUIHIyZeEs8a9CRHtBddjCNJ88Bfqtf
 S1ocw3XJevjpyfVqOZYa2ybman6D0gJnXDdI+xDfVqoC4tTaj1FSrlh8Qd3q7kxdxGRJLj
 GFPbcQAjlCP4btNlrHkcvjqqbTyZCII=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-YLM4h7iuMAG6Ap0Z1o77nw-1; Wed, 23 Oct 2024 10:16:11 -0400
X-MC-Unique: YLM4h7iuMAG6Ap0Z1o77nw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43151e4ef43so50584565e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 07:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729692969; x=1730297769;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lu+U1UtLeYKuG7KvpNGTP1vzTWevM8/vvCGog3NAbpM=;
 b=uiGaHBNTRoelSJTSPcK4f/jyG8eo7MD+cjnQHU4AWjRwg0D2/PkFfvc5upXmbbUm2d
 lAmiIQckHlGy3LXJa8dQ2gvlxc34wSCqv/ZsSSecTk/6mw92fYgLKEXBUzUtUfBojDNf
 18hcYj2x+K3/+VrtId2wFssJn23I9zQRn7hk9qWs4sh4U6aEvs9LtixfvNux0hDzFVT5
 vebkKfXPBfvBTei6+9cz+zLmTNYapyUTldUi0ENMKXH82K2NqUlAbbip7991JFROJEwr
 xVg9jeieDPHSEGMLrkbQGjZ32cMvB556WzIFqlORWznbcl6btQd1rjZWKft4z7bNsfT/
 3DmA==
X-Gm-Message-State: AOJu0YyI4KpLW1h7xV7gJraHQ/tI6bvzXnaRj6izhF+6kxHOqR82vjPm
 j77qmpRpKS7URPzEkvW2l57uUPxRhZKsH2DmxRIYbAl1PbHsbOAn1tOccPNPYmk2b4SbNImjDjI
 OZg1y/+9AUByoYLkoiLkiPtAExNAekp+Ie3bOHwP7Cn1gJLJsoz8KnULqEqGT8t3/Ww==
X-Received: by 2002:a05:600c:1d27:b0:431:57d2:d7b4 with SMTP id
 5b1f17b1804b1-43184189bf9mr24038095e9.26.1729692969162; 
 Wed, 23 Oct 2024 07:16:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHar1p9asUu+YXdAKrBOIOL/4ioKmiQlOhE0COxng/W6LCWD1YB5yXLgKgHAXBJX00kApY/Ag==
X-Received: by 2002:a05:600c:1d27:b0:431:57d2:d7b4 with SMTP id
 5b1f17b1804b1-43184189bf9mr24037725e9.26.1729692968775; 
 Wed, 23 Oct 2024 07:16:08 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dac:2f00:8834:dd3a:39b8:e43b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0a48d51sm8961432f8f.38.2024.10.23.07.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 07:16:08 -0700 (PDT)
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
Subject: [PATCH] drm/sched: warn about drm_sched_job_init()'s partial init
Date: Wed, 23 Oct 2024 16:15:31 +0200
Message-ID: <20241023141530.113370-2-pstanner@redhat.com>
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

drm_sched_job_init()'s name suggests that after the function succeeded,
parameter "job" will be fully initialized. This is not the case; some
members are only later set, notably drm_sched_job.sched by
drm_sched_job_arm().

Document that drm_sched_job_init() does not set all struct members.

Document the lifetime of drm_sched_job.sched.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++++
 include/drm/gpu_scheduler.h            | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index dab8cca79eb7..8c1c4739f36d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -771,6 +771,10 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
  * Drivers must make sure drm_sched_job_cleanup() if this function returns
  * successfully, even when @job is aborted before drm_sched_job_arm() is called.
  *
+ * Note that this function does not assign a valid value to each struct member
+ * of struct drm_sched_job. Take a look at that struct's documentation to see
+ * who sets which struct member with what lifetime.
+ *
  * WARNING: amdgpu abuses &drm_sched.ready to signal when the hardware
  * has died, which can mean that there's no valid runqueue for a @entity.
  * This function returns -ENOENT in this case (which probably should be -EIO as
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index ab161289d1bf..95e17504e46a 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -340,6 +340,14 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
 struct drm_sched_job {
 	struct spsc_node		queue_node;
 	struct list_head		list;
+
+	/**
+	 * @sched:
+	 *
+	 * The scheduler this job is or will be scheduled on. Gets set by
+	 * drm_sched_job_arm(). Valid until drm_sched_backend_ops.free_job()
+	 * has finished.
+	 */
 	struct drm_gpu_scheduler	*sched;
 	struct drm_sched_fence		*s_fence;
 
-- 
2.47.0

