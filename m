Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3005C7F225E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 01:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D6310E202;
	Tue, 21 Nov 2023 00:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7ECC10E212;
 Tue, 21 Nov 2023 00:40:14 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1cc938f9612so31618925ad.1; 
 Mon, 20 Nov 2023 16:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700527213; x=1701132013; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0h8yAS+G8YHpuqagMyaQ9goLsE9tJyhmBTQ25AFj0s=;
 b=Wn6PSttEc1uVEYG+tGdflP/xtHVTR603rImfGrV8Fwy1s7lBUBbzSQIzBHaelqTBiQ
 BjWmKcWBkVvC6GSUHAmT8jZjVE6/kiNVjy3l0/M1uK5XY6pzGgVKWygr9u90TpFQq1/s
 60H7HTcHmY2Gr7ypehycPqJk7cZzFGnogSFXQFwStSazd65rbBS+rqM60/DspW/pVY+n
 ehG/y4goMjtkpNJv0V1HqUIqR+4HnYxN7N4PSmUn33MD34c/MqKGxVlkg4BEnAPZUeLO
 MT9YexRt/uNxYv0cgFUpAoxf1L3AvC8cD7xMFq5logyYmbwQ7F062rHO52yfYzEkgeNe
 tdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700527213; x=1701132013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o0h8yAS+G8YHpuqagMyaQ9goLsE9tJyhmBTQ25AFj0s=;
 b=iAdJQKjWOsz9MhZrSDhi6WhnHCo62TBIvZpiuXuN4ZahtbtZblz6ga1hdLQo98x8dB
 454AoZMpMPnSSdoVP5JR2FvWcXp6+LL6t0dYHQc7WaxXbYzmMclbD7mS7oV3QiAthY18
 WgixB1fsxH22ATA89e49/vRO8PiAequQ/Dkt866KxJsGSxksfNGQ41mgp9rGK+1Egd78
 O294KDZ4Fmdb6rYXD2jTnhcitOl7JP7K4g3duVzRzDDs0MCW/Yc8b/Es+WW/pMyXNmss
 +RzDLjIp6YtI8T2/iP5cv/mI9Velq7I/hUatkAg6xfHtH1D7Jdm+IuCUK94eu63ML0uL
 g83Q==
X-Gm-Message-State: AOJu0YxSF+qUnU3wVTj+HgBqlx/aiYQskvBH6MKK1mwrTVhXCul/3lZo
 KHdHs0k516vmeSGvR73xOs8OHCFxMsg=
X-Google-Smtp-Source: AGHT+IFRewbZRAvUU6gZKQNB4YVM/KU5JvPUE8Ku/K2+YHY6o9UQhoZvejH2rTSIxis/nDYoz8E2Qw==
X-Received: by 2002:a17:902:eb8f:b0:1cc:237c:75d6 with SMTP id
 q15-20020a170902eb8f00b001cc237c75d6mr7706097plg.67.1700527213178; 
 Mon, 20 Nov 2023 16:40:13 -0800 (PST)
Received: from localhost ([47.215.232.245]) by smtp.gmail.com with ESMTPSA id
 u1-20020a170902b28100b001cf567252besm4035798plr.237.2023.11.20.16.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 16:40:12 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/7] drm/msm/gem: Cleanup submit_cleanup_bo()
Date: Mon, 20 Nov 2023 16:38:49 -0800
Message-ID: <20231121003935.5868-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121003935.5868-1-robdclark@gmail.com>
References: <20231121003935.5868-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that it only handles unlock duty, drop the superfluous arg and
rename it.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index d001bf286606..603f04d851d9 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -248,14 +248,10 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 	return ret;
 }
 
-/* Unwind bo state, according to cleanup_flags.  In the success case, only
- * the lock is dropped at the end of the submit (and active/pin ref is dropped
- * later when the submit is retired).
- */
-static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
-		unsigned cleanup_flags)
+static void submit_unlock_bo(struct msm_gem_submit *submit, int i)
 {
 	struct drm_gem_object *obj = submit->bos[i].obj;
+	unsigned cleanup_flags = BO_LOCKED;
 	unsigned flags = submit->bos[i].flags & cleanup_flags;
 
 	/*
@@ -304,10 +300,10 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	}
 
 	for (; i >= 0; i--)
-		submit_cleanup_bo(submit, i, BO_LOCKED);
+		submit_unlock_bo(submit, i);
 
 	if (slow_locked > 0)
-		submit_cleanup_bo(submit, slow_locked, BO_LOCKED);
+		submit_unlock_bo(submit, slow_locked);
 
 	if (ret == -EDEADLK) {
 		struct drm_gem_object *obj = submit->bos[contended].obj;
@@ -533,7 +529,6 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
  */
 static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 {
-	unsigned cleanup_flags = BO_LOCKED;
 	unsigned i;
 
 	if (error)
@@ -541,7 +536,7 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
-		submit_cleanup_bo(submit, i, cleanup_flags);
+		submit_unlock_bo(submit, i);
 		if (error)
 			drm_gem_object_put(obj);
 	}
-- 
2.42.0

