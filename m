Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B93793B30BC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539746EBA1;
	Thu, 24 Jun 2021 14:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6FB6EB13
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:00:43 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u11so6762311wrw.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h4neqYKocq6FWa9Fza6gnyrNdB23+Gq0+Ckf2Dni93E=;
 b=Ih/TCSVOcC9kojaC7XSy9oGax5wS5T6kKF1h0Kuiu2Te92n8tPM+WtiTpJCX5B+PcL
 UwMqZSKf+nPHoGK8BWF76Fr7BOP2pBc+mnTM34gTnDiFNyWhh9YTTlkf/Dom39cwTJNy
 4qLMUJ6rmKhYz2YRijXBxJXCOmnSQBPZ9c0jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h4neqYKocq6FWa9Fza6gnyrNdB23+Gq0+Ckf2Dni93E=;
 b=B6JL9BkluBaoT6Z5DWhvQ97x4E76P/1V+vuBiMlSCad7YDuVjxbD42D6Dbr5bR4iz8
 YAek3+VJcxKlaZhhGMQGnjoOeS1O9Dtu2wyUQahypKHmPr8Mhy5eFbxwMOXrAWoEYrJR
 /nP0KmDPS0vPF1OAGcsdKlFPcd5da3rJCmm28zjwZ5Ror6iwgXNffsr06J7eZ7xpLRwz
 4Rsk/pof3KyFmUD+9qzwp/nlSZK0CeRCsMJGfsHqlYDqnOG0JtrTg/8+RYskiuj9iY97
 YoVSETGlMlUZtCxOy6RD+hVZO5OId1e3kfqCAq9MWZqmQqQP6S55WJ1/KZuTsc252CcV
 u/Og==
X-Gm-Message-State: AOAM531pwYeaZNEfvI47QWeAckmQfu15vBwlWYt/DaYwr1XTDQnq3iUQ
 FCYDBTCY+6t1MATz/12qZXycMxJ6kBkHsA==
X-Google-Smtp-Source: ABdhPJzNF3ApFJ2OJ8HAFL/AoTyB8QotrPmYkqPqwaVa47/DZ1mli5lDlJpKIhHhqn4sVD7seZZglg==
X-Received: by 2002:a5d:64ab:: with SMTP id m11mr4886518wrp.336.1624543242054; 
 Thu, 24 Jun 2021 07:00:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm3600167wrd.25.2021.06.24.07.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:00:41 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/11] drm/sched: Check locking in drm_sched_job_await_implicit
Date: Thu, 24 Jun 2021 16:00:25 +0200
Message-Id: <20210624140025.438303-12-daniel.vetter@ffwll.ch>
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

You really need to hold the reservation here or all kinds of funny
things can happen between grabbing the dependencies and inserting the
new fences.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jack Zhang <Jack.Zhang1@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c31d7cf7df74..ee75383331af 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -703,6 +703,8 @@ int drm_sched_job_await_implicit(struct drm_sched_job *job,
 	struct dma_fence **fences;
 	unsigned int i, fence_count;
 
+	dma_resv_assert_held(obj->resv);
+
 	if (!write) {
 		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
 
-- 
2.32.0.rc2

