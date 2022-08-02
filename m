Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6317A587F7C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 17:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0813E18BEC2;
	Tue,  2 Aug 2022 15:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15A78DF81;
 Tue,  2 Aug 2022 15:51:48 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id a8so551763pjg.5;
 Tue, 02 Aug 2022 08:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=FzvQD1BdX2RVx+fHXlbnajcgEgfcaBeelT02bqIAfkE=;
 b=gyJP/xxOXSRqgltSY6MkFDlfxok3ZireuVXp4CDqtTjrutwuMplFbCh+3nG4pa0MYW
 O1i/IDxYXB5GWQEa2h/8BclQIu7fJFhdTb1UbBQuOqal0b/te/FXbS5DGyOENv8V2ZC3
 e0FxaB4NpVSBOrK+1HbDBDDsV7CddlDJaVQEuSeWE19EVEK+HY5z9Gt5t+9MkDojAhJv
 NT80ariNQXjQpxcjVr2wjKnldhFOUsmLlGLtFKl7jsx+13EEMnneqEuAmigPPcXJvMPq
 DPZjy5mX6M7VCyL+DBo1Qdaq7sFVxWr1hTRW/zvw41YgBT/87nW7rBVrtjvsyRIuJxTN
 4UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FzvQD1BdX2RVx+fHXlbnajcgEgfcaBeelT02bqIAfkE=;
 b=n6S8AoHBQI+cwc6YaqgTdWUYRxjdoT+O/sj0Ur2S1RKmbuoFMfW2oCVKtvyw/HdqD6
 yFz4POmcc/LVix3UJWzzTIxUIhiqvfnm0u02SajUrJH7OYb6eOvF6fgR2bPuTF0ik3Ya
 iIr9NyrwCO+w9/X/FKHFI+trH7VKTnJPgdlnmD2GqLoH9nv5iWQ5Jgh6I2jp9+4bXHuy
 GQ3Ulxo2vNdd95nPv1n/XMxtbE3AE7BQhBTfbkmAPTrYUDk72/n418NJ+Tvbc7TyQZMy
 Eh1aOr9pcGDLFoBaoSZPygxxqqzrpCmCvUYaYYzGvnZdSY28GQ6ltpUa/oQuFot3omnN
 MQhw==
X-Gm-Message-State: ACgBeo0Z7TgV+txK61s+90VjZ5QsI8OBYObm8OFXWJQZhuMtUc4jr689
 +0T8IxQT+lCQbBtlC/YgDCV28JYnIt8=
X-Google-Smtp-Source: AA6agR5riFYgIxD5qt970Uy22d2sGuBlqC5eT/s6nbNG9HJYGy8kuF+I9Yeo95ehMIRdQhNhcsu4qA==
X-Received: by 2002:a17:90a:1943:b0:1ef:8146:f32f with SMTP id
 3-20020a17090a194300b001ef8146f32fmr137919pjh.112.1659455507557; 
 Tue, 02 Aug 2022 08:51:47 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a17090332cd00b0016edd557412sm6301857plr.201.2022.08.02.08.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 08:51:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 11/15] drm/msm/gem: Unpin buffers earlier
Date: Tue,  2 Aug 2022 08:51:44 -0700
Message-Id: <20220802155152.1727594-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220802155152.1727594-1-robdclark@gmail.com>
References: <20220802155152.1727594-1-robdclark@gmail.com>
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

