Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94E158191B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D14963FC;
	Tue, 26 Jul 2022 17:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C4211A1C3;
 Tue, 26 Jul 2022 17:50:47 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso212768pjo.1; 
 Tue, 26 Jul 2022 10:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FzvQD1BdX2RVx+fHXlbnajcgEgfcaBeelT02bqIAfkE=;
 b=C3rcsNLGUDjPRxfROWRdoZEqoPkKn1/Htx7zNkExFevmAr6cVYFPDwZk4cJHQuOjHg
 7zp1XEPvH9pdrPAIHxwIRBSeD9v/q5BEq8SzErK351H9HEU9UjEYJB3U7dLDRJUOeo/C
 fzsPnfbr7GciGNhhETTtlx5iIyPnhqwJepjcHeqov4vLVlLC//PFuwmy5n4ZBfFdQwEU
 9rqlJsrjcQNNRVjXyyh962ue2QdUjvI7uk/DpyP28VihilgKjyn49nDzVN43FIEUdCrW
 AeI+KADu9MKjjJHjevG34Z4qEh1wv1KPXw7Iox6VhZtIFn90D0TTjfQreasf/G7ISIij
 GpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FzvQD1BdX2RVx+fHXlbnajcgEgfcaBeelT02bqIAfkE=;
 b=cTW81wDx/Ng8ns8H2H2+0vn3XYRhkPdBfXqhCSWRmHuAp7zALINdD7m0YPpRV7vU/l
 g+Yt6yG7qQwVVktSUe6SaPtSy6oRATVf6EKIlK39IdZ8GbwgrOjw9jllNqXc2gATNcIi
 T158sL7J8Y5tG5epLXhfJR9XSDDkSDIpkOOSE2IqG9GGcoieQaRUFPKcoc8oSWe+yG3V
 y/MxNuUhDX1xlzv5l9X4vB6preXBGH6rIfFRNrYU+pxCWkViSOa6/Kt8enDxtOE7uf03
 2Egj6WRCtWqnbEgw19cLU3pWZp00M9eXGofM7QDG4bFp7rWeTnPWTfJb0pyLqNopVYS4
 9D7Q==
X-Gm-Message-State: AJIora+MOXIYpEsO9pZOqbjo91upqUCnDRpKf7kkVThRxtKFgPOvClcp
 D332s4AzNSRFqawk4JIppiLCEbYouWI=
X-Google-Smtp-Source: AGRyM1sv575TC+lxA2u2e7voRIevFC2jb9zeRMsA6HFThlboaFzIal5t6kaH6LzWzhGEUpQTPqbR/w==
X-Received: by 2002:a17:90b:343:b0:1ef:b65d:f4d8 with SMTP id
 fh3-20020a17090b034300b001efb65df4d8mr306192pjb.187.1658857846082; 
 Tue, 26 Jul 2022 10:50:46 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902c10d00b0016bfe9ab1f3sm11868299pli.36.2022.07.26.10.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:50:45 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 11/15] drm/msm/gem: Unpin buffers earlier
Date: Tue, 26 Jul 2022 10:50:35 -0700
Message-Id: <20220726175043.1027731-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220726175043.1027731-1-robdclark@gmail.com>
References: <20220726175043.1027731-1-robdclark@gmail.com>
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

