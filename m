Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D624FC708
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 23:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CDA10E2E1;
	Mon, 11 Apr 2022 21:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C09510E298;
 Mon, 11 Apr 2022 21:58:24 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id j8so15011338pll.11;
 Mon, 11 Apr 2022 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tAkFR+6vhq0o/UUKOqeWc9uPJoN5WXdSoZFQuuhB/hI=;
 b=BVAdqHYdjgRDHToJmUjlWr1WJiW8u4kwQFY6dwLmE9EMWP13SbsQQdQGBdhzMJxAyo
 BPxrqDtdxL3W3u35q0PXTqfgpXcoRJ4MzivwkAtgqY3uw7PaAnpUbSWi7t1ISrnW+HSJ
 pjmiLq2iiiuIzKhKZJIa316Mlfk773qV7x9biGJX54TQMn4HpNetx9cbPn3JVupXmoR8
 t4W/4kY99yX4BsD5BB/25GZBg4EFdILkT2TXgGziKg3mir6RWhCHXyBUjxnafbH9BSps
 Ag2iCEdxn7EqSl4fYVM5ODa4776/3AGho+7h1A6cAOgoqtg0cvcfVNfVabLGIgSAWUo6
 PTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tAkFR+6vhq0o/UUKOqeWc9uPJoN5WXdSoZFQuuhB/hI=;
 b=G8dwU0qbCKhbodj5uDm2vJM4/qGR3QnWnwFEk2tat3NzJ7Xsn/5TNRy2yk/qyltP/m
 m9YYh5+L8f81zfI9s+CJ94fZPrpQ8xVgcVcxBzpomDqOX9w0Zu45lPyocK0rlsfCApd0
 QHXibyehWfe8KYckEXuztWcWCQZdwoY277EKEwM8+de0gPWUHB49lawqSp5JcCih/ivp
 zOORDtrVcckFmfMnqTpGVBqjRXGH/nE+5BxToCKkLVdOaDOAST9LursDLIBMXKIvYlcx
 ejKzWjiWRTA16h/SzoFhK3n5+EUOBhXP8yQZcCldjJG2LRpC8UWNNJ2bttOrTwpeXzH3
 +syQ==
X-Gm-Message-State: AOAM532ZzUJNQg7WhdvwcqXj6/OlmPr1dEohe2WkJttYhgCpqhXqoQcI
 nFeRu+FBwovZGtYleM4p3zXRtX/9wnQ=
X-Google-Smtp-Source: ABdhPJxNCwWDB9v3U/Ie32ovHq1HTYiwkwWYce1aYR2ERIaJqRWChN3IzYNAaPnGp53xn1g5gZmoGQ==
X-Received: by 2002:a17:903:41c2:b0:158:83f7:f8a9 with SMTP id
 u2-20020a17090341c200b0015883f7f8a9mr1442985ple.146.1649714303486; 
 Mon, 11 Apr 2022 14:58:23 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a63ab4f000000b00381eef69bfbsm652869pgp.3.2022.04.11.14.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:58:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 04/10] drm/msm/gem: Split out inuse helper
Date: Mon, 11 Apr 2022 14:58:33 -0700
Message-Id: <20220411215849.297838-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411215849.297838-1-robdclark@gmail.com>
References: <20220411215849.297838-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Prep for a following patch, where it gets a bit more complicated.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 2 +-
 drivers/gpu/drm/msm/msm_gem.h     | 1 +
 drivers/gpu/drm/msm/msm_gem_vma.c | 9 +++++++--
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index a4f61972667b..f96d1dc72021 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -938,7 +938,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 				name, comm ? ":" : "", comm ? comm : "",
 				vma->aspace, vma->iova,
 				vma->mapped ? "mapped" : "unmapped",
-				vma->inuse);
+				msm_gem_vma_inuse(vma));
 			kfree(comm);
 		}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 947ff7d9b471..1b7f0f0b88bf 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -61,6 +61,7 @@ struct msm_gem_vma {
 int msm_gem_init_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma, int npages,
 		u64 range_start, u64 range_end);
+bool msm_gem_vma_inuse(struct msm_gem_vma *vma);
 void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma);
 void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 64906594fc65..dc2ae097805e 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -37,6 +37,11 @@ msm_gem_address_space_get(struct msm_gem_address_space *aspace)
 	return aspace;
 }
 
+bool msm_gem_vma_inuse(struct msm_gem_vma *vma)
+{
+	return !!vma->inuse;
+}
+
 /* Actually unmap memory for the vma */
 void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
@@ -44,7 +49,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 	unsigned size = vma->node.size << PAGE_SHIFT;
 
 	/* Print a message if we try to purge a vma in use */
-	if (GEM_WARN_ON(vma->inuse > 0))
+	if (GEM_WARN_ON(msm_gem_vma_inuse(vma)))
 		return;
 
 	/* Don't do anything if the memory isn't mapped */
@@ -100,7 +105,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
 void msm_gem_close_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
 {
-	if (GEM_WARN_ON(vma->inuse > 0 || vma->mapped))
+	if (GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped))
 		return;
 
 	spin_lock(&aspace->lock);
-- 
2.35.1

