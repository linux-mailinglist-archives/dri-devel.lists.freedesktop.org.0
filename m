Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8558C9A64D7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 12:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE8A10E48F;
	Mon, 21 Oct 2024 10:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QmWGEjhV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018F310E490
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 10:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729507870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uERVLrzhOKhLyLR6uH7ER1kb2hRnG0ld4wlyovWxQbk=;
 b=QmWGEjhVOkJY9AUXQFkE4THkhKxy86At++WieYv4fHq5puGU4VGwDIWYgj7eBIxk405Ph6
 8vK3HoTygiYGe+kvSa8IgQDJ4ST3mm4snpncSx4Je+xvxamv+FcwyOE3ZbpNBD3QWLA4o8
 7/+41TGWVQJugi0sXqL3OSHozsr9Si4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-qH2kJRRSObqtP9n4IspgXg-1; Mon, 21 Oct 2024 06:51:08 -0400
X-MC-Unique: qH2kJRRSObqtP9n4IspgXg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-431673032e6so17242975e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 03:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729507867; x=1730112667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uERVLrzhOKhLyLR6uH7ER1kb2hRnG0ld4wlyovWxQbk=;
 b=cEdxIEu66MK6nkPll8nK4b5Q3EjP7I2ggpsn+yTS7qfyoiJAuYHOcZWO7KOR3djt/m
 k1cYP9RUNN5yrGmJFHz+wAHCOMpE9wJEptnSAFnDa/9m1NrJQa8fnJBX6EAXe05odFEM
 zMHsRwZqSCDwilNKI7Xt/ojMhhAbNk56V5to0ghXOUDBzhZc8NRfjhse1mehMeZdnaz3
 qbwo8R7775lH4nuW90F8KMJnQ0i0uAIhJA9yA3VvDItjdyG3WxV+Ng3OcXuzZkulwUfB
 VpTPn3uyIo2B3fhS5myB8OxMyEDndoohpMTNOxPePUNqph1rIAgkBy8t0Vyk3xHFeb8E
 OgcQ==
X-Gm-Message-State: AOJu0Yx9EgVA8fT/2m5wdUPGu0lms/gND+bSijMMDRC/dpJn4FefDQ3k
 t/lm8sBZEBrkEki9n6+jpTTtCncneXmqq+KJirN+rOVikj8tXDlMwIcQXEExm6FbGpeGyCG+qGt
 4H4EnuoIYpB0f5xIwTS3PxZVouWCndacRf8fqy/7eRYh+jq+cqJal/vs2P6EEiJUU+A==
X-Received: by 2002:a05:600c:4f92:b0:430:57f2:bae2 with SMTP id
 5b1f17b1804b1-4316168f5c5mr89908195e9.23.1729507867296; 
 Mon, 21 Oct 2024 03:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPmPGAC/TJn/N01rVgAYAftWJLh4CDyx+85d5RAJFtI4za1CbAHsmGjBAZD5WWq6terZNiEg==
X-Received: by 2002:a05:600c:4f92:b0:430:57f2:bae2 with SMTP id
 5b1f17b1804b1-4316168f5c5mr89907975e9.23.1729507866946; 
 Mon, 21 Oct 2024 03:51:06 -0700 (PDT)
Received: from eisenberg.fritz.box
 (200116b82d449800aee93296d73e68da.dip.versatel-1u1.de.
 [2001:16b8:2d44:9800:aee9:3296:d73e:68da])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f57fdb2sm53065615e9.20.2024.10.21.03.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 03:51:06 -0700 (PDT)
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
Subject: [PATCH 2/2] drm/sched: warn about drm_sched_job_init()'s partial init
Date: Mon, 21 Oct 2024 12:50:29 +0200
Message-ID: <20241021105028.19794-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021105028.19794-2-pstanner@redhat.com>
References: <20241021105028.19794-2-pstanner@redhat.com>
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
members are only later set, notably "job->sched" by drm_sched_job_arm().

Document that drm_sched_job_init() does not set all struct members.

Document that job->sched in particular is uninitialized before
drm_sched_job_arm().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
Changes in v2:
  - Change grammar in the new comments a bit.
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++++
 include/drm/gpu_scheduler.h            | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 2e0e5a9577d1..2f1b514ff4cf 100644
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
index ab161289d1bf..f7d9bdd0fb6b 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -340,6 +340,13 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
 struct drm_sched_job {
 	struct spsc_node		queue_node;
 	struct list_head		list;
+
+	/*
+	 * The scheduler this job is or will be scheduled on.
+	 *
+	 * Gets set by drm_sched_arm(). Valid until the scheduler's backend_ops
+	 * callback "free_job()" has been called.
+	 */
 	struct drm_gpu_scheduler	*sched;
 	struct drm_sched_fence		*s_fence;
 
-- 
2.47.0

