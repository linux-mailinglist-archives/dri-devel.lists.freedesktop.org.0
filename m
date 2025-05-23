Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D463CAC232E
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 14:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7521610E2D3;
	Fri, 23 May 2025 12:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JWKxOLeJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C88810E2D3;
 Fri, 23 May 2025 12:56:49 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-60119cd50b6so12167941a12.0; 
 Fri, 23 May 2025 05:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748005008; x=1748609808; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rqwkMrM5JL4EFpQh48JAg7ETFNDz+6d5oJlHLbW/gEc=;
 b=JWKxOLeJKUL+1lr2yGH9ysVSxCV9V3ZOJ54n/sZPOP9gkPjaMvoJeawyUEjLEiWoJf
 zjwpxMBa8pwpWW0WvRo82uX0nIpm6BnGKmZVH+Jo0ql6QzUqiqd9gFoERC6MGsjuGuBH
 +RFgA7d4xM9NkSxzNEN0sPa7KNlYfnLkNGHPf4s4Y4Y8P8Xpkg70x8ZtDa0WKW2kVI68
 CVAGNQDvoVsPiEXhiJc9VH5bRq44sAVZV0cC08fkCevFjSACjLKfP5I/39+QVxV1wMgs
 2VjUu1uDxdr0IoEmAKUDfFj4ezQAc3R9nG7tVWBiInMXTOA0YdZaUzr5Yjvph4iYZnxP
 5ngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748005008; x=1748609808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqwkMrM5JL4EFpQh48JAg7ETFNDz+6d5oJlHLbW/gEc=;
 b=U8EiWtK4SYa1lpNXBbY3SriUiESvlcprDdlDimeHn4DkMdIZ5N7F9hNWGSTJ4AfHqM
 USVFUtK4FpW0X2GMAhrhn6F6hc3rk9iaSo6WI/3xhQJ9vOdJ8fuiZQWcHbbgS/Ve7hjZ
 tU5AuRNsBUR8GyYLZkioxTbRVvSzXvqe5sGXXHOOBX9SpNeDYZrflbhRliLqG77nGFPp
 0sNEYrCsy+uPcS5k+XHWHkJMOldSUp8cNDbble3leWXtZTr8T+a1dMJaf2SS94OC6sXX
 G1TIx486VO8+VTolyGBOZbrZmoAqh7puWwCKYy/9eFKEEIhWjUIemvnnHt6vCgV+A+rT
 fDgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/WtAtrL3qf2UnAqhmRUaLcT7U4SOKdhIMjdLvuU1kqQhF3kizrHpLFLA6qRN62frl56+TjFtWUb9e@lists.freedesktop.org,
 AJvYcCX14/uqV+7kFpM3CtAJ4djk7dfEd4m8bWNyy58vIAzBhL6GdHE+wmu6+yN/Zy3H55f4GT5JwMbV@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVArbDsdOztUC4LXuH3+kQQSj8DiPdGL0Uj+AHW1p1yy9CDnw9
 n2Aw6i9vHAjQXfU9W251aneyQR/UAItOGTusgkyS7GyYl1fz/muJRnKL
X-Gm-Gg: ASbGnct57ykACtg4MfyL3/qkH/2s0H54kgpuUZw9yXV3sd8ybqKw+uc6WuPuBIHl5VJ
 Xg+tKLlyzXBZSZTJKeqeycRr2X6FIGQfBNSsmu0C4G+izh+OAsyvolVaNOuIrO24xB29zQbkCve
 v4vgRj3g6IP+eMgvKkRqpFkcFBhsZz0bumMDhqo7q8xXbemurJd8lB0EgKsfCezI0KEXrMlyXNj
 nzT7r16nF5PjhiE8bcPZ4fK8HzDBlPnR9mQ3CfZqwsjAky3HJoeuTM/RSQ09fJ6GXb1LdBdVjkr
 N0/9CgIyA15mO/l0ZCCoBbCH0aneR4qloK9ASagSeFNhx+pYloh3gSNz2eBMOEIK
X-Google-Smtp-Source: AGHT+IF3uvXTrnNJJNPsB+fNQOeTiI/5FeKKUlQu4WYJJTFZklxm6Tn9OX6S8C+OiIer6yrX0nlRbA==
X-Received: by 2002:a05:6402:4306:b0:601:f87b:b6a9 with SMTP id
 4fb4d7f45d1cf-601f87bba22mr17179284a12.25.1748005007827; 
 Fri, 23 May 2025 05:56:47 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1544:9c00:c200:979c:6701:1954])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6020e441c84sm5863302a12.38.2025.05.23.05.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 05:56:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tursulin@ursulin.net, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/sched: Add a test for prealloced fence slots
Date: Fri, 23 May 2025 14:56:42 +0200
Message-Id: <20250523125643.7540-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523125643.7540-1-christian.koenig@amd.com>
References: <20250523125643.7540-1-christian.koenig@amd.com>
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

Just to exercise the functionality.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 56 ++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 7230057e0594..00dcee298100 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -469,8 +469,62 @@ static struct kunit_suite drm_sched_credits = {
 	.test_cases = drm_sched_credits_tests,
 };
 
+static void drm_sched_test_prealloc(struct kunit *test)
+{
+	struct dma_fence *stub = dma_fence_get_stub();
+	struct drm_mock_sched_entity *entity;
+	struct drm_mock_scheduler *sched;
+	struct drm_mock_sched_job *job;
+	bool done;
+	int ret;
+
+	/*
+	 * Check if preallocation of dependency slots work
+	 */
+
+	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
+
+	entity = drm_mock_sched_entity_new(test,
+					   DRM_SCHED_PRIORITY_NORMAL,
+					   sched);
+
+	job = drm_mock_sched_job_new(test, entity);
+
+	ret = drm_sched_job_add_dependency(&job->base, dma_fence_get(stub));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_sched_job_prealloc_dependency_slots(&job->base, 2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_sched_job_add_dependency(&job->base, dma_fence_get(stub));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_sched_job_add_dependency(&job->base, dma_fence_get(stub));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_mock_sched_job_submit(job);
+
+	done = drm_mock_sched_job_wait_scheduled(job, HZ);
+	KUNIT_ASSERT_TRUE(test, done);
+
+	drm_mock_sched_entity_free(entity);
+	drm_mock_sched_fini(sched);
+	dma_fence_put(stub);
+}
+
+static struct kunit_case drm_sched_prealloc_tests[] = {
+	KUNIT_CASE(drm_sched_test_prealloc),
+	{}
+};
+
+static struct kunit_suite drm_sched_prealloc = {
+	.name = "drm_sched_basic_prealloc_tests",
+	.test_cases = drm_sched_prealloc_tests,
+};
+
 kunit_test_suites(&drm_sched_basic,
 		  &drm_sched_timeout,
 		  &drm_sched_priority,
 		  &drm_sched_modify_sched,
-		  &drm_sched_credits);
+		  &drm_sched_credits,
+		  &drm_sched_prealloc);
-- 
2.34.1

