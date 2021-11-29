Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA1E461D74
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 19:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B386E4A6;
	Mon, 29 Nov 2021 18:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B496E558;
 Mon, 29 Nov 2021 18:18:28 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id k4so6815983pgb.8;
 Mon, 29 Nov 2021 10:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fUNuveYGMtrqjB2VQZVCUJJ1mSxi3vYF+lEWoSAESLM=;
 b=SdrRH1TrlPjoH3o1ImcgrE+JbnNbd74DzvJjimwCmDhp3OiBNEk18o0Ys4Uicpze3g
 zCw9IGuUC4v9BZ3CYiScmVgbZeZiuvOS2RLrM/6RhKvqepnADkdKhvVbDrJ3NewrVm2e
 QkJbwFI67r2N1UWhs9XjfbDcNC8N67++NnHIH83L8flrOCi9RFPkIyFGQxiwV1+t69kZ
 xb3y0ca8ks1Fwi5AovNNmkOezoX6/KDZR5IqLoti7r5uqWZ7tAFDuyivhX2knAKqZNQi
 4RHrssSrZg9WIhHbA/vUFfaq8NU/kED7xEz2fNqm+STCQIV0P9QO+dogodmRpk1RwMzw
 9gJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fUNuveYGMtrqjB2VQZVCUJJ1mSxi3vYF+lEWoSAESLM=;
 b=qtRWb1PC0fjZqKmuhp/LtupUMck3WTcjpqkl4Caf0FR9aZ00n5pgu7+EdrcJioB5+n
 LHgcV6kZnkSjX+LZPBSAnZPXojUL0pb9K7Hn7d0xZhVnV7KvcpEUf55Gx7Wi8E4q2giF
 7jolBfQcmEHX55mKcg4SMFvyvoeuAMvYTd6avGOMxexrBWnWMQ6/zS2giw+Ub99aPTCz
 PJTgTP6TXIiM0t8OeF9eOiA44/h3lrAzaDpBvN/F5DSISqqgchOEdAGiaR7+EaFlkbZq
 50SEOKFBC3vO8tk2a/1NMj0u5J2NJf5kNPR7CJ4VYf9ZZHxH7Rl7DrqJBIWBaGY7UEBE
 e/NQ==
X-Gm-Message-State: AOAM530aEdIc9YvKGrVNKdZKkVkbqFD44n/CbSM2gNg1TKEX+s31AN2o
 eeV5/WzuAUXvo5SaNtv+3Qlg4a4FQhU=
X-Google-Smtp-Source: ABdhPJyJeydSjX4k1OB1bo6HrPO31iSNMLC3cBqM8orkTUv7tItFGjyOmE00ZWY2AuQIhUqjA3OxNA==
X-Received: by 2002:a63:3190:: with SMTP id
 x138mr35037673pgx.401.1638209906886; 
 Mon, 29 Nov 2021 10:18:26 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id d7sm19415554pfj.91.2021.11.29.10.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 10:18:25 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/gpu: Don't allow zero fence_id
Date: Mon, 29 Nov 2021 10:23:44 -0800
Message-Id: <20211129182344.292609-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Elsewhere we treat zero as "no fence" and __msm_gem_submit_destroy()
skips removal from fence_idr.  We could alternately change this to use
negative values for "no fence" but I think it is more clear to not allow
zero as a valid fence_id.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 282628d6b72c..6cfa984dee6a 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -881,7 +881,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	 * to the underlying fence.
 	 */
 	submit->fence_id = idr_alloc_cyclic(&queue->fence_idr,
-			submit->user_fence, 0, INT_MAX, GFP_KERNEL);
+			submit->user_fence, 1, INT_MAX, GFP_KERNEL);
 	if (submit->fence_id < 0) {
 		ret = submit->fence_id = 0;
 		submit->fence_id = 0;
-- 
2.33.1

