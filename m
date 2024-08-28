Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06939623C7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 11:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF6410E4F7;
	Wed, 28 Aug 2024 09:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="euRZGWvx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88DB10E4F7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724838109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBYc7EE/zONAzLlymWb0hmVq6yfD+J/1DdujpaQCA4s=;
 b=euRZGWvxghB1ihJqtJloC6NXmJ68OAln9PH0ciankUbsaHcLhgIoQ+x5Ya9VE7Oxt575va
 1ijJQ83AXshu2eB8uZyNv77TC2u3Mgm5b6nvHCrlv1V0KstybBqjfFTfTify1lNB5q5M2g
 GIZVKDak5ZmrB5xBpw++SyxN30ewObM=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-5HZpj0KeO9inYkTKdL0UCA-1; Wed, 28 Aug 2024 05:41:46 -0400
X-MC-Unique: 5HZpj0KeO9inYkTKdL0UCA-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-6ad9ffa0d77so144971687b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 02:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724838106; x=1725442906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xBYc7EE/zONAzLlymWb0hmVq6yfD+J/1DdujpaQCA4s=;
 b=SJI2+sRx3dEZdUhyzrQQTKrO7Gr7DBrdsI1oVWEpj80AJdzVkAbPvlBY3a1PDzx7Ng
 GQ+YilSn7CKO9NA/FywNzEd+SBtGphi4xGJ1XcrY3Ahm6q4TVMpHcGthcWma7RacQG82
 RXCmr36uFeYfVhvTSIe2/EQG9M+YIJwbIG1VRRI7jIxOlE2MbDm0vJAu6meAchHDzsiB
 iya1Hd6bLpjUCOyYKH+zWP6fS4MxGHaYuL1PUJaV1PuvGYcAsmaglU/GOeaSB1VgVYzz
 SxS8XEBXyA/lSEE9jUSnfTOceKvOTvDFpA2a9Nm0fJ8+5Pbfnuvgm9GbNrxh0kz8/uoQ
 unOQ==
X-Gm-Message-State: AOJu0YzZti2F9FyHrUCWd+m88Roj8wUDSVHUbFx/lHfxrBUd4EGjwJ9d
 jdxIZNad1oI2X2FNzNjoUaGB4uD7xh6NEWh5DYMmG7W1Xndi4Z2nd/ESEnQetklkagFEN8sAWMU
 w0YqYg+L6qtkkQ8mqafq/DrMywoLzpvissl/vB8BbKObLJdA3xM1c5FBztl8sD8Qqbw9A8FvSOA
 ==
X-Received: by 2002:a05:6902:18cd:b0:e0b:d622:7586 with SMTP id
 3f1490d57ef6-e17a8c1f785mr20922785276.40.1724838105953; 
 Wed, 28 Aug 2024 02:41:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUtII/J0HGM1CH1sN1ODHa9rrXP87mYcjb70QmCWucp301KDKoN1ciQoJLegsU5I774A88iA==
X-Received: by 2002:a05:6902:18cd:b0:e0b:d622:7586 with SMTP id
 3f1490d57ef6-e17a8c1f785mr20922764276.40.1724838105582; 
 Wed, 28 Aug 2024 02:41:45 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162d6548csm63220746d6.68.2024.08.28.02.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 02:41:45 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v2 2/2] drm/sched: warn about drm_sched_job_init()'s partial
 init
Date: Wed, 28 Aug 2024 11:41:35 +0200
Message-ID: <20240828094133.17402-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240828094133.17402-2-pstanner@redhat.com>
References: <20240828094133.17402-2-pstanner@redhat.com>
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
index b0c8ad10b419..721373938c1e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -781,6 +781,10 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
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
index 5acc64954a88..04a268cd22f1 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -337,6 +337,13 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
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
2.46.0

