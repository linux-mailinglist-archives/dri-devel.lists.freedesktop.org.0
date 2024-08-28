Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFA79623C4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 11:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD6910E4F5;
	Wed, 28 Aug 2024 09:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Mw/SHbUw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BA210E4F5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724838102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7Yd3rFzmS9qQQpG4ioW+kWZ7R6351lz0USRC/qcKN5c=;
 b=Mw/SHbUwMhV85a25JIBmiP4+qb12+rqSp1xBoMz/KFrU//PUPemd7trIMdhFqqP5C92NS4
 Oirp9vUzmEOj4S8Uf3/WNtS13jlIrN7c3OAcVMy+eoRo6qW9AyH1xigP8OAM7m81IFufuS
 TaNP0hmLe/S2MebHP1FX+R4j8X5YlKo=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-RUk5Z9ETOTqLB3XGNnPyow-1; Wed, 28 Aug 2024 05:41:41 -0400
X-MC-Unique: RUk5Z9ETOTqLB3XGNnPyow-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-6b8f13f2965so139577767b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 02:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724838100; x=1725442900;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Yd3rFzmS9qQQpG4ioW+kWZ7R6351lz0USRC/qcKN5c=;
 b=m8GiT7eYc+ccdFgvEWV4g8Aw7tLAlrSHrqX5s2WfmkfutYAvmvkyouL6HE0o6vwmUz
 Ft0DCBSGtzr3FEbEeMC2PjhJ88SdI/lUMujTwRtdn083Fb9KPnKoa1KfPKG6qAr3RGau
 KnIfOKZ2fOlCiQ9+mZkd9M6U/xZFw991bKxAwz9D0Ta26ZglzxDezssVP+Z1yinTYVex
 VB8iETkFjpN1eJZi4Kpg0jyMj/pENLR/lkQp/HDqyMHAOBCdrOiOcXO5PewtUYsA4+o9
 5T6Bq7qagR89AH+SU/OfSsTmiVPsA2lqhge3MyuafXn8t1jCqh3SfH1jeWbBqLf31Y5j
 2w6w==
X-Gm-Message-State: AOJu0YycJYYFtXN0YbhI6PlHkmvrVh4r6gW9l7UBozuh1Rvs+StCtT1W
 nHWwytIDt9MD/GEa5w+OBYL5hFU73rRWX3Do8amvlr5ExvgsJcDGTA53vv2loj46UHMsiq+wdSQ
 GOZKrwTdqNKL/G2xsLlFg0heqyeUX3kPV2cYPCgxqid2zZWhYnEobKz7PtKCYzP5L4A==
X-Received: by 2002:a05:6902:2213:b0:e0d:d525:86b8 with SMTP id
 3f1490d57ef6-e17a8c1fbebmr17013010276.36.1724838100381; 
 Wed, 28 Aug 2024 02:41:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/k/O8mP1KK/+YqegEJ7jjal4P8Q4yMJPU52PdUhYvO/Y3VBXKL4kEvKC3od5OT/8wxcjfXg==
X-Received: by 2002:a05:6902:2213:b0:e0d:d525:86b8 with SMTP id
 3f1490d57ef6-e17a8c1fbebmr17013003276.36.1724838099982; 
 Wed, 28 Aug 2024 02:41:39 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162d6548csm63220746d6.68.2024.08.28.02.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 02:41:39 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v2 1/2] drm/sched: memset() 'job' in drm_sched_job_init()
Date: Wed, 28 Aug 2024 11:41:33 +0200
Message-ID: <20240828094133.17402-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
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
---
 drivers/gpu/drm/scheduler/sched_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 356c30fa24a8..b0c8ad10b419 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -806,6 +806,14 @@ int drm_sched_job_init(struct drm_sched_job *job,
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
2.46.0

