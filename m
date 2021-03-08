Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E813309F5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 10:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5773C89C1B;
	Mon,  8 Mar 2021 09:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D63A89C1B;
 Mon,  8 Mar 2021 09:07:30 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id o38so6003408pgm.9;
 Mon, 08 Mar 2021 01:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rio9oywo5wOO4WrAVB/UN3oilFTR2R4R6Vr0uKN6cks=;
 b=HOc5grBLgA+ZRASYLntuKJqmLM17ZiyL97DMJK1FLt3y9SbUv3HR1y9bP7VNAh7LYc
 hGMzPh3fdiirR1QkFRNPSQokeSeifJjbSJCCBtKh26Fa3bOlMLGvBQ6IDRov0bHIYmdT
 V1LXvCB8IEBRSRNqLLFXKDm5JLmEWij/cuDHtW9rug61n/7hVgsa9lV59B431QJub/MB
 ptFt5vG7TvvRxJ5BUaTlBGA2U+nA8ZKGxXXOTMNasyAPtE8FuK4Wz8xspjmjFEpVWJBv
 iSrE24IAKCz2q+QT67g6cQ5pFYT6gDoq3EhYp2Bn8Ga+sGAN4rbjtuoClws05XirLRvu
 SPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rio9oywo5wOO4WrAVB/UN3oilFTR2R4R6Vr0uKN6cks=;
 b=e+XZT6LR94ixUSjQ9C5qet6cRTp6ZPov/4gWSOXOTAKHBEhgZS43Q8EkL/fL5nrST0
 us6Ttbz0437qHeLrqyZtJFBYKgMb8RdpaIw64knrc7rVcj09FQ/C2fSDI9RGxHeflEru
 lDJ+mAh20PAUEMmBBJZbpLdLeAYc9RsdbVcfIKdXqdjkzcoEzQyQ+YgniH1lR2QQrI/q
 W47YpLrGHHwIoYoZ/wSr8dgmHfm8TiKqW0hJQqhzXM5tpgLG5H2Yj9PohT90vQYZvSjK
 NGjoqaeY89EdSmQDqlp/5FaVf8bQJnXGbopE92EnqudrRGAbUh8QRC6B259vFjPD1d5H
 vgvw==
X-Gm-Message-State: AOAM531oqd94xOR9xctstrGG2y5lWEw2nozKANAy9GCsKUMvbVY3E9N3
 EZntWlHXih9o9xV8IAKqyxELhopzLEYThUCy
X-Google-Smtp-Source: ABdhPJx4r0fB0RLk/Qo6mRWj36/f3U85RpNQWE6AxHogrs4qnyw2tLUGMyOr+6BA3TixqMdSGryazA==
X-Received: by 2002:a63:5962:: with SMTP id j34mr19434247pgm.331.1615194449905; 
 Mon, 08 Mar 2021 01:07:29 -0800 (PST)
Received: from localhost.localdomain ([45.135.186.99])
 by smtp.gmail.com with ESMTPSA id m5sm8357274pfd.96.2021.03.08.01.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 01:07:29 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, matthew.auld@intel.com
Subject: [PATCH] gpu: drm: i915: fix error return code of igt_threaded_blt()
Date: Mon,  8 Mar 2021 01:07:22 -0800
Message-Id: <20210308090722.8392-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: intel-gfx@lists.freedesktop.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When kcalloc() returns NULL to tsk or thread, no error code of 
igt_threaded_blt() is returned.
To fix this bug, -ENOMEM is returned as error code.

Fixes: 0e99f939f08f ("drm/i915/selftests/blt: add some kthreads into the mix")
Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c
index 23b6e11bbc3e..b54ba8a1fcec 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c
@@ -471,11 +471,13 @@ static int igt_threaded_blt(struct intel_engine_cs *engine,
 
 	tsk = kcalloc(n_cpus, sizeof(struct task_struct *), GFP_KERNEL);
 	if (!tsk)
-		return 0;
+		return -ENOMEM;
 
 	thread = kcalloc(n_cpus, sizeof(struct igt_thread_arg), GFP_KERNEL);
-	if (!thread)
+	if (!thread) {
+		err = -ENOMEM;
 		goto out_tsk;
+	}
 
 	thread[0].file = mock_file(engine->i915);
 	if (IS_ERR(thread[0].file)) {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
