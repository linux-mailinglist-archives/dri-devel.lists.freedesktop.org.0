Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EB94FC706
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 23:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AC210E10B;
	Mon, 11 Apr 2022 21:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2685789E7B;
 Mon, 11 Apr 2022 21:58:22 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id s137so12623293pgs.5;
 Mon, 11 Apr 2022 14:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGa5BVmzMUOjfF5fklYjMnwty8EXXy2NltxcnqNLnSI=;
 b=NpgvKbziTPlvUGcW9mmJML9sHLc+zWxqDmsbtj0YPGHgvqfUVIRhOCs3jBrfYtBflP
 BRRRrlWxy5weosAOCDvRt+HTgIMiHC4IyBg1lVwBPuClbtSTdYvZjN0ilyUxUPAp6bSR
 qdXkyjlUAO7DrzOh9WlMRCFziz1oabCONC3bcjLB4faf87UIN36nQEPlkZcITeUiQX7p
 GEI4xjRFYuLgb8IyjCIpB7+7V6YWolJPj74Aqu8bNBZ/OjhUAjCi+FlHm/TivQCo12F4
 NdjlLeqYsDbx7moYxmicY/LFN1ZiEFhLi4L/wOVMvsqDGaEmYM4E9WNf+KJBZSZSR0gQ
 OCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SGa5BVmzMUOjfF5fklYjMnwty8EXXy2NltxcnqNLnSI=;
 b=Vp3O8kxSoxA0Pow09f7V+qLzFFKxOI1XBzKHPnJrxPv8qwT8IepoHbGwpLhYHdAA7x
 vA3x/qLwxpOGFcoe8pC6FqIzJIaDf0pQjkq5SyQ8tLpO4DhR/52S9Ol8YRMbhoVBu8JT
 HiacG4tbX6+kTEpQgZrKmgzIsod9l3e4k5OFrhOdSdfu9nAD6UNArVHtfYgrRUFLN+Bh
 Wr8He7SIpv8WQQC4vkAYnffPcX6Iddi7EZc7Da0xgcREHyJXKJKpx0Lq08rTFdvLdjYU
 6+XopOStEt0XsRdQ6p1eENsF5t7sfXiy0GOqL8E1zrysu+lZXJ8+fbl/0jr6O5E/VRm4
 bSIw==
X-Gm-Message-State: AOAM530drOjKNF/i3RlVQVN83uDRKIS23VbZuWiXPlSCaAKZJNHzOkyM
 f5ihjA9QLihdPHhfPoO5JVw+uMYzl7k=
X-Google-Smtp-Source: ABdhPJzwPB9DkLCamMEM9k77qgBonZ3Mia3qrEXeQdTkvM8+jJIvPtn5pD698qi/bI9kLsDk9wifFQ==
X-Received: by 2002:a63:fe4d:0:b0:39d:20ac:d7f7 with SMTP id
 x13-20020a63fe4d000000b0039d20acd7f7mr6811611pgj.369.1649714301088; 
 Mon, 11 Apr 2022 14:58:21 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 mw10-20020a17090b4d0a00b001c7cc82daabsm461830pjb.1.2022.04.11.14.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:58:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 03/10] drm/msm/gem: Convert some missed GEM_WARN_ON()s
Date: Mon, 11 Apr 2022 14:58:32 -0700
Message-Id: <20220411215849.297838-4-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index f914ddbaea89..64906594fc65 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -44,7 +44,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 	unsigned size = vma->node.size << PAGE_SHIFT;
 
 	/* Print a message if we try to purge a vma in use */
-	if (WARN_ON(vma->inuse > 0))
+	if (GEM_WARN_ON(vma->inuse > 0))
 		return;
 
 	/* Don't do anything if the memory isn't mapped */
@@ -61,7 +61,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
 {
-	if (!WARN_ON(!vma->iova))
+	if (!GEM_WARN_ON(!vma->iova))
 		vma->inuse--;
 }
 
@@ -73,7 +73,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
 	unsigned size = npages << PAGE_SHIFT;
 	int ret = 0;
 
-	if (WARN_ON(!vma->iova))
+	if (GEM_WARN_ON(!vma->iova))
 		return -EINVAL;
 
 	/* Increase the usage counter */
@@ -100,7 +100,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
 void msm_gem_close_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
 {
-	if (WARN_ON(vma->inuse > 0 || vma->mapped))
+	if (GEM_WARN_ON(vma->inuse > 0 || vma->mapped))
 		return;
 
 	spin_lock(&aspace->lock);
@@ -120,7 +120,7 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
 {
 	int ret;
 
-	if (WARN_ON(vma->iova))
+	if (GEM_WARN_ON(vma->iova))
 		return -EBUSY;
 
 	spin_lock(&aspace->lock);
-- 
2.35.1

