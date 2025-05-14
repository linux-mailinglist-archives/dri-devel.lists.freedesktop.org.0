Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578D6AB717C
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 18:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2A610E6A2;
	Wed, 14 May 2025 16:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KjhxOGa9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7170810E69C;
 Wed, 14 May 2025 16:33:48 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-22e7eff58a0so106265ad.3; 
 Wed, 14 May 2025 09:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747240422; x=1747845222; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I8NFmJ8VaC2SUZH7esKNt2Ms7nN1mYBgEnYL3nIvpM4=;
 b=KjhxOGa9G2C11aisG8NwLNEoJIEno1JbhEoqvv4KviRrE4jiq9x2E+pW6Vhngx1mWc
 p0jFucQxzs6mxNuZr8E+OOuJGlb1kf2GYFVWmEfWgbaEWPyNTf+g8PhXgKscmZn70N4I
 woD647I/MaOGb0oMyTTQEOQObbVbA1HvflQD+Q2vURV2qKSb4aQ62O32ZxKBnkKQvKLs
 Tjgb35SU8fuwLYpAl9GgeSFomB6B2N7CKdeX0aW2DjOaUhowxDVt/AJqrbWWOS0QIyf8
 QyYhGhemZm575JYgOQlPsQKrEf/EvjuyI9NpkhPSr9wU6xwDnWTa31RzyFQZJ1FfIp/Z
 LTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747240422; x=1747845222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I8NFmJ8VaC2SUZH7esKNt2Ms7nN1mYBgEnYL3nIvpM4=;
 b=cNkiI1xHP2SQm8fDsYVrmQv+l1u9pIM+CJADZfbmHEDZzAARQUeVz6jO0Na+q5A54V
 iNhx8/WRq+/JQeieo68u5Di7Byvng66tK+/CIML6JvCesGb3kR54aHmLUPVjH2kHFjG5
 ueLnGZD7BKj0RYn39V4/TcVkjlmNbr8ohYYkLhUZinGZpK1WUyoaXJYukHJQaBF8ghaj
 h+nwzwHrto8EFt2M61N6XmKOa0cslnhhrjIDoKgVdzQ2nrAnoEhR11cCzIoMVUe9Wxmx
 EOQdI5zhyQkY1lCJyXVwSHHQDKQnuYzhuzDa6EqiW3mjjsFOJgeFucgdC609xiy6d/JA
 TA1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI+S++01q4NcLsHOMu3M7rKs7cdof4+DBbR4TGm8tKdsP2qiQtZjKbkf9bAacGHEw6jsw9I3rUJlo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWAl+RxcjNkz6JUyjwgoK8F8NbXMlCGh6/39QJzUwr6tUK1kRT
 CYglKiMjzeYDz+qmm4N7HWnbGVBkZC8c8MTYRfkpyfSNeJqM2U0F9ETEvQ==
X-Gm-Gg: ASbGnctmUbDpi3dv7yg8tq8jCJPcvbBiZzH2YusiCEmo0OyoNaFWMzpr1+71sYADVKi
 nZ2CagyBPEZnT8Jl7adUX2aqNoOW1jAlCBd0ckunrBDfPGz9FVmIjF22/v71ZCJgF9qLHYD4g2Y
 9YgOt5CeilQHQkcyYgdm1bhEZIAwfzEZfAXO1hPR9zyy/Q2c0Q4/HbK6P3mM0bbboS8FniA/mXE
 LFDfHcz1Ftu1mYrj3nzU1RN3JoXbQCc4rIqYDffHnXE795EX7tJozsVaXwDCSsU/9bYsH+v7a4B
 6P5LU/IZGPyDDqbOXl92WfNvTlGoRwLMQKufH0BEmSSJ0u1/UuhaWx9nZG+v23IUu/2oSRUZaN+
 RJGlmmz3sc+cUhtgEHRIisDS7rg==
X-Google-Smtp-Source: AGHT+IERCtCWMPp273Pn/kSesFNut1YmKeS7V26pT+IIXOt9MSp5ENJ0CmcVrJLH9gRNLdpIfbkHPw==
X-Received: by 2002:a17:903:1aef:b0:21f:6a36:7bf3 with SMTP id
 d9443c01a7336-23198126227mr68599475ad.12.1747240421020; 
 Wed, 14 May 2025 09:33:41 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc773f225sm99788915ad.89.2025.05.14.09.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:33:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Fix a fence leak in submit error path
Date: Wed, 14 May 2025 09:33:32 -0700
Message-ID: <20250514163334.23544-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514163334.23544-1-robdclark@gmail.com>
References: <20250514163334.23544-1-robdclark@gmail.com>
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

In error paths, we could unref the submit without calling
drm_sched_entity_push_job(), so msm_job_free() will never get
called.  Since drm_sched_job_cleanup() will NULL out the
s_fence, we can use that to detect this case.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3e9aa2cc38ef..b2aeaecaa39b 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -85,6 +85,15 @@ void __msm_gem_submit_destroy(struct kref *kref)
 			container_of(kref, struct msm_gem_submit, ref);
 	unsigned i;
 
+	/*
+	 * In error paths, we could unref the submit without calling
+	 * drm_sched_entity_push_job(), so msm_job_free() will never
+	 * get called.  Since drm_sched_job_cleanup() will NULL out
+	 * s_fence, we can use that to detect this case.
+	 */
+	if (submit->base.s_fence)
+		drm_sched_job_cleanup(&submit->base);
+
 	if (submit->fence_id) {
 		spin_lock(&submit->queue->idr_lock);
 		idr_remove(&submit->queue->fence_idr, submit->fence_id);
-- 
2.49.0

