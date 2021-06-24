Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F5E3B30B8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD346EBA2;
	Thu, 24 Jun 2021 14:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652216EB13
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:00:42 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u11so6762250wrw.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=59YvDY9b+hqFUpN0mq/UEMc/tXKiQ+aUBvDl4BaKifk=;
 b=MQ97qTUbfqjalikwVqboXh7qr+BYKs2xDYWqDAfW28PNojS8qdjzt8fWXlMbf6Qk0D
 2LXGClsOD6i8V1T+Rs4MhW1BWjasf9bVsbcwWB7q4CFZhVsq8PV6OtlaZsjVnfrcS4Vm
 i1YLqCSIaE7o0w2naYnWpzrXcRpEzF/nfSyco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=59YvDY9b+hqFUpN0mq/UEMc/tXKiQ+aUBvDl4BaKifk=;
 b=loTmvQnb8PbTtAQ/FEl9AMytyy0Wu6cNdkhrQ6wpJORTGp6OsLYDVnpifOvlUqqTFy
 Yc0/OLJksoz+Ek9iFZOTEiVgbZUAlzuW1T2AKzruxOl8xIJvP7HxXz8SSeg9JeYWWjir
 MrE4sVrA5E0gcvrUonXeunigsyDCKBe/WgFlvL5w2nOqWaY0Q+LHpKtBfgv2l4+j4a5z
 m05/fhlO59LwQnRsxfCI6Ffzxd2f9scbhDXSQPjGdFOfccq/gc901w4bxs+5MM2uASiO
 ayUBZrsmC8AzuGwRJbr/HBNGr4OMnpJ2TdzvXpPRfxn+nBegZrcLDeN+/USr2N2Ruk3C
 0kJQ==
X-Gm-Message-State: AOAM530YvOWSWV1H4iT+MuhJi0Hn3rv8TOpt6VopyjBlC6Zfqm3e2U2H
 vsZCokK0+sNl3DrEKQw+sRvfFs4LT8Z3hA==
X-Google-Smtp-Source: ABdhPJxyVZFavNJouubdMPIDShg+GJM79I2d02Q+ZY5+F44JcKBwz9R2fSWB6gLUG3lNWvu2mvUAIg==
X-Received: by 2002:adf:d082:: with SMTP id y2mr4674680wrh.285.1624543241147; 
 Thu, 24 Jun 2021 07:00:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm3600167wrd.25.2021.06.24.07.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:00:40 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/11] drm/scheduler: Don't store self-dependencies
Date: Thu, 24 Jun 2021 16:00:24 +0200
Message-Id: <20210624140025.438303-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is essentially part of drm_sched_dependency_optimized(), which
only amdgpu seems to make use of. Use it a bit more.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jack Zhang <Jack.Zhang1@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 370c336d383f..c31d7cf7df74 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -649,6 +649,13 @@ int drm_sched_job_await_fence(struct drm_sched_job *job,
 	if (!fence)
 		return 0;
 
+	/* if it's a fence from us it's guaranteed to be earlier */
+	if (fence->context == job->entity->fence_context ||
+	    fence->context == job->entity->fence_context + 1) {
+		dma_fence_put(fence);
+		return 0;
+	}
+
 	/* Deduplicate if we already depend on a fence from the same context.
 	 * This lets the size of the array of deps scale with the number of
 	 * engines involved, rather than the number of BOs.
-- 
2.32.0.rc2

