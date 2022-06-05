Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F5A53DC94
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 17:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C179E10E8C7;
	Sun,  5 Jun 2022 15:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9845810E8C7
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 15:25:48 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id w27so15761047edl.7
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AijNSNENsndq1lruXgHmAupjtkvf2lBpkHUQA6jew9s=;
 b=H0zgmtQMVi6D7id759wg8VhqByApWuQ2eAmgXrVLdr0Q1LBDhY7Kz4vpBWUEF4NhOf
 XiNPQ4GjBN04uYIBj9rn/FJOfwHB5hceglNc0WlSZbm1ugfm6i9LqALZfCEzOoYvi6yF
 92djWVCArm7K7WenfzY12vjC0Kkr0MxID7g4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AijNSNENsndq1lruXgHmAupjtkvf2lBpkHUQA6jew9s=;
 b=Y5o3TvgM1WluWNneVXY3ZA9C+nxtm+7aXnjMiz7JxC7ZTK22G0Q/CQiHNa+hbv7fgz
 JA2b3rxWD3Gc0xYAkGMacRN7fnOow7KPH5Ns/GhFbjaDHeRXuLpuYL7DdSePUzdRYP/B
 EqnoBR90PJnHPU38WmjyiPmqjOYm+bl/C0+B8ZEmlI3LZLV3qwsfz79adu5ndM7ZZl03
 67UaA9lpnDxhE7f5rQKYqawU2zFjcsA4q7YO+9iNHEKBOLN94dfLwwWbCAuBFN8FdhD8
 l4Umjkc6xnCt7uDnnoD/LRAe4ubzBCQ6JymeKajz0boYo1SFoINZOIBVGCj+KcMZO4ob
 SUeA==
X-Gm-Message-State: AOAM532c+8L5FDVSvtKy2imwitoYxsNFIU33vSCZWRw63btkQJuqFr8J
 5nf9AD35zGVvL/cDO/wAw9M0gA==
X-Google-Smtp-Source: ABdhPJz8dAE/Co15RJ/4mJpqVwCjyClqDvdCuxcacvEE1TV8+moyX503AYyBnHuJfqgA1ohjLbwB0w==
X-Received: by 2002:a05:6402:3484:b0:42e:1f3b:4a4c with SMTP id
 v4-20020a056402348400b0042e1f3b4a4cmr17457804edc.326.1654442747113; 
 Sun, 05 Jun 2022 08:25:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a056402125500b0042dddaa8af3sm7051499edw.37.2022.06.05.08.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 08:25:46 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] mm/mempool: use might_alloc()
Date: Sun,  5 Jun 2022 17:25:39 +0200
Message-Id: <20220605152539.3196045-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220605152539.3196045-1-daniel.vetter@ffwll.ch>
References: <20220605152539.3196045-1-daniel.vetter@ffwll.ch>
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
Cc: linux-mm@kvack.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mempool are generally used for GFP_NOIO, so this wont benefit all that
much because might_alloc currently only checks GFP_NOFS. But it does
validate against mmu notifier pte zapping, some might catch some
drivers doing really silly things, plus it's a bit more meaningful in
what we're checking for here.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
---
 mm/mempool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mempool.c b/mm/mempool.c
index b933d0fc21b8..96488b13a1ef 100644
--- a/mm/mempool.c
+++ b/mm/mempool.c
@@ -379,7 +379,7 @@ void *mempool_alloc(mempool_t *pool, gfp_t gfp_mask)
 	gfp_t gfp_temp;
 
 	VM_WARN_ON_ONCE(gfp_mask & __GFP_ZERO);
-	might_sleep_if(gfp_mask & __GFP_DIRECT_RECLAIM);
+	might_alloc(gfp_mask);
 
 	gfp_mask |= __GFP_NOMEMALLOC;	/* don't allocate emergency reserves */
 	gfp_mask |= __GFP_NORETRY;	/* don't loop in __alloc_pages */
-- 
2.36.0

