Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE55F57A4E9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 19:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4531E91027;
	Tue, 19 Jul 2022 17:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CEC90FAD;
 Tue, 19 Jul 2022 17:19:09 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id z3so194257plb.1;
 Tue, 19 Jul 2022 10:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FzvQD1BdX2RVx+fHXlbnajcgEgfcaBeelT02bqIAfkE=;
 b=JMLFaDiOl3fTF1vQ8KHqql+oNThjBy7zWx/y8DQ9Z/0c7uVTm8yACi7Z2w6/5G66/Q
 0/gthVxtHxEJoGxvMNkZA2OiexiIsS/h9L+UhaFIlsCGbSWvk5bjbugJPd5v1KD75WPT
 Lvr4foB1JtxEKojRY5LTQtiTmcLz/2hbrt2eDW9YBIy8gf1ZEsQNCYCJ866+c1VWoDYi
 jZUJHp9AukkB96Ynu/yZq6y6cUtf8U0EsOE/kfBRWOFn9zPtasaCuPV7EysePzx9c+Bw
 wuSz13pddVCYbbL6gj/OUIm/wDJVGmDeBosyBGsNqJY9rvVBRkxWz9FOrvDalIOCofGi
 gZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FzvQD1BdX2RVx+fHXlbnajcgEgfcaBeelT02bqIAfkE=;
 b=Yx37Ea+OOC1OOrfdeIzJyjnGk67zwNc71/4tcc15AOACC5OMJ6fRHEKqdIaaIJ67hO
 G9VOS8RhsgVCjBNVEr37gCIJFvpmgiaBXEgeZCeJ2y4lrNyPgiOdqzz4FimDCTR5Om+V
 oEM8am0J+CFfIA8Lv03uhQmm9DhS2uI5sHNw8btF+/Prkmb/VnG9mKc7Pq0uNb/5LdC5
 ampMwh/E4zxU0nP3it+rtafWQPJOLaA4IpGsYHOVQdURNZtcLtIejW46em9u9f5OeJ8B
 tXCSupD2Cpzfu85PbnvXs/hPhq4ag90UMR3OwfJoVvAz4D781kcWTYZB1ASqGQDSfHEn
 awcw==
X-Gm-Message-State: AJIora8pUP47d4qE3ah5WfWxS8kusUEOivQcKI3fj3Us9J8FgBNclUNH
 hNEtaSgxqx501j4rruuonh2OkMvTwDg=
X-Google-Smtp-Source: AGRyM1t1cQXyO0F3MTKjBuxm2SfHhx+7oXShSQf6dGqX09a/GWI1vg9zGWJQKN+pDaC5UENRewuDqA==
X-Received: by 2002:a17:90a:df18:b0:1f2:12ba:9092 with SMTP id
 gp24-20020a17090adf1800b001f212ba9092mr406971pjb.204.1658251148083; 
 Tue, 19 Jul 2022 10:19:08 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a056a00212800b0052877d6f66bsm11801040pfj.50.2022.07.19.10.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:19:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/13] drm/msm/gem: Unpin buffers earlier
Date: Tue, 19 Jul 2022 10:18:55 -0700
Message-Id: <20220719171900.289265-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719171900.289265-1-robdclark@gmail.com>
References: <20220719171900.289265-1-robdclark@gmail.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We've already attached the fences, so obj->resv (which shrinker checks)
tells us whether they are still active.  So we can unpin sooner, before
we drop the queue lock.

This also avoids the need to grab the obj lock in the retire path,
avoiding potential for lock contention between submit and retire.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index adf358fb8e9d..5599d93ec0d2 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -501,11 +501,11 @@ static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *ob
  */
 static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 {
-	unsigned cleanup_flags = BO_LOCKED;
+	unsigned cleanup_flags = BO_LOCKED | BO_OBJ_PINNED;
 	unsigned i;
 
 	if (error)
-		cleanup_flags |= BO_VMA_PINNED | BO_OBJ_PINNED;
+		cleanup_flags |= BO_VMA_PINNED;
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
@@ -522,10 +522,6 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 
-		msm_gem_lock(obj);
-		/* Note, VMA already fence-unpinned before submit: */
-		submit_cleanup_bo(submit, i, BO_OBJ_PINNED);
-		msm_gem_unlock(obj);
 		drm_gem_object_put(obj);
 	}
 }
-- 
2.36.1

