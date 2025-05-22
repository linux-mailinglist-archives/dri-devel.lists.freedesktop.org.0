Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8058AC0D0A
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F2110EE42;
	Thu, 22 May 2025 13:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FjtslFJS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8347210EDFE;
 Thu, 22 May 2025 13:41:24 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso1357888266b.3; 
 Thu, 22 May 2025 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747921283; x=1748526083; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d8qwrxuhG4XkPcoOdgSwGdIS8QW2hrRgCMU4VDYgvI4=;
 b=FjtslFJSgNe84wA9LybFDO8G3sQhw8PYt5mvRu2dpMxXU1Gxw8ZBPrpwml3gG8obwO
 LFo9u9Lz+CCmauqebbbSAMdDYZO3i5DRrgv80k2f1ODAkZLtW81KHXLLwhIjxtqfWgTB
 BHpBeAYJtmjFfORrPnC6QAyALuU+PVp9cZGRhOBxgc7n7ynFTukZ1HpLzKpipgTXt8m1
 jXj4WW/qDtWL4WBomtCFSNe4WfjXPqawWhY+WIp9Uyno9BrqR6pGA1OHwH63MumYxnZm
 78YNNcttbxx4WwKBme+XwEZ1bAwtYtIzfCoSBnW4/F9k4VdMbTDzZFIkvgOxpA07x6gI
 fXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747921283; x=1748526083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d8qwrxuhG4XkPcoOdgSwGdIS8QW2hrRgCMU4VDYgvI4=;
 b=MDmrvh8u8VEGe1ckj7nF4lFis60YtnOlf8XWRpoO6kcBQ+JSWyj+UYhg7OVrAAdqHs
 /GSi1Jb9GH2xN8xM6Wj+K5CZUkUv6Ijv0IXWrZvz0Ld8MgyHEyXUy0Z7CNaLitHlfFP+
 KmSc7nh8G1DyXqIKOuAHUG9i5sv7i2gR1O6RfhuA9szz3MUHy7sOCRh8pZT66WQgg7HS
 nKhFwM0V1Iatb6OY4aGoN55lYXGjQuEBR3+ObSBxZRA3oulILq+F/5VLzHr1vG1sqGPH
 nrKAh4A7LQqr0o8E2DVr9Bt4jtp6gSViq47G+bQH/3Xkwv4H6lzRiFuo50s9wWqvJhMh
 KryQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj/DAuxVVnpCUPBRTXTTuOLTktdwzOiJ+fRzw953Y0qIDOW2BHw6us4nfW7G7wWwTQrJFvd3w7@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7jWK4Id0TC+IWdO9qt9zW0jX+biWtAF0qZDxCh/qAH+vtUIq+
 4sPICtdWbOP9sv1l9EByGSkPbOGKwMw7PAaJ89sXNXNgZzn/shMSsVsA7L/74Q==
X-Gm-Gg: ASbGncvRXHeTQs1f4z0H/RQ6LLLo4Ng3aDaRjESreq1fE6CvA/o+0eE43E6hxH2EbQ2
 rIKvksDaPSLrCWjmf4PZVRaUXvK6EGtJCVztN49VxOt3vhUJAZ8/Jr1XvDZ1+P7I1i0ju4Lalvc
 OyJ92LNCT1S0nE9fz6+bddpiIBqtC2QKM7DIULSIxcpOiIt0MgTtkTlgU82QSqqvs01ndjUZ2hC
 3w/KmL0Nm2XnVLzpRfDiECn8qXquJxTG3sfO/5+v+6DBJbabfjDz5aK4gBMO98zpdVagx/MMdp4
 JAxcNYFNhOmg2F9MULJ6TWnI7sKxh6FRI0hzCMZyPHo/87+T0j2TpJabfDuAwRc=
X-Google-Smtp-Source: AGHT+IET3ZMQc4RHbeFOw3R7mFs+I0VaoKKqbtaJ/9oHwoofiZOYXLpUAkur1r33sUiNdret6YJd7Q==
X-Received: by 2002:a17:906:f5a0:b0:ac2:2ba5:5471 with SMTP id
 a640c23a62f3a-ad52d4f8b8emr2050810366b.24.1747921282837; 
 Thu, 22 May 2025 06:41:22 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1533:800:9db1:9b52:19ec:8c5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04af40sm1082487566b.34.2025.05.22.06.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 06:41:22 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/sched: add drm_sched_prealloc_dependency_slots
Date: Thu, 22 May 2025 15:41:15 +0200
Message-Id: <20250522134117.7561-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522134117.7561-1-christian.koenig@amd.com>
References: <20250522134117.7561-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Sometimes drivers need to be able to submit multiple jobs which depend on
each other to different schedulers at the same time, but using
drm_sched_job_add_dependency() can't fail any more after the first job is
initialized.

This function preallocate memory for dependency slots so that no ENOMEM
can come later while adding dependencies.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 37 ++++++++++++++++++++++++++
 include/drm/gpu_scheduler.h            |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index d2d64bf17c96..84713214fbf3 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -858,6 +858,43 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 }
 EXPORT_SYMBOL(drm_sched_job_arm);
 
+/**
+ * drm_sched_job_prealloc_dependency_slots - avoid ENOMEM on adding dependencies
+ * @job: scheduler job where dependencies will be added
+ * @num_slots: number of slots to reserve
+  *
+ * Sometimes drivers need to be able to submit multiple jobs which depend on
+ * each other to different schedulers at the same time, but using
+ * drm_sched_job_add_dependency() can't fail any more after the first job is
+ * initialized.
+ *
+ * This function preallocate memory for dependency slots so that no ENOMEM can
+ * come later while adding dependencies.
+ *
+ * Return:
+ * 0 on success, or an error on failing to expand the array.
+ */
+int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job *job,
+					    unsigned int num_slots)
+{
+	int ret;
+	u32 id;
+
+	/*
+	 * This works because NULL entries are not returned by xa_for_each. So
+	 * drm_sched_job_add_dependency() will ignore those while checking for
+	 * duplicates, but can then use the entry when storing the new fence.
+	 */
+	while (num_slots--) {
+		ret = xa_alloc(&job->dependencies, &id, NULL, xa_limit_32b,
+			       GFP_KERNEL);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slots);
+
 /**
  * drm_sched_job_add_dependency - adds the fence as a job dependency
  * @job: scheduler job to add the dependencies to
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d860db087ea5..a560a00c6275 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -632,6 +632,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       u32 credits, void *owner);
 void drm_sched_job_arm(struct drm_sched_job *job);
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
+int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job *job,
+					    unsigned int num_slots);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
 int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
-- 
2.34.1

