Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4FB28ABCC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 04:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777486E226;
	Mon, 12 Oct 2020 02:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8029C6E226;
 Mon, 12 Oct 2020 02:09:42 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id e10so12145052pfj.1;
 Sun, 11 Oct 2020 19:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fCvUZrMqyJzQQ14uf8jQABI7a2ChVtRsN/nTnfqUZZE=;
 b=WmJqGmK6lYy+ITsDu6cyf835lQJCk+kswy9EShZfZTjxTyPKJZhY/Nq2SnAR8mrYgn
 voh2SgimOlbEHSM1sgAXI6MZ4iiR+oMtHhvjjMSJyOoX8oBLsJd491F6BTdkDXY7mJQY
 sCyh4HdSgNCZxsDX3zlIfjqJ3s7llujnW5q30K9IOJGjeX+7f40WVNZYYOcN+T6OuxP2
 DGBhCy+FJBU19f7cVdussY0FQmhf4UoDc5xg+Ix6ifbWz/nwb6s/2fZePVULezLdQ1Qe
 GnF4QluzByU8B40DC+oMh5ynodygrx2lXvWCTq5Uo6wmei8o4u0UcHL6FXW7+PJvxuir
 dYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fCvUZrMqyJzQQ14uf8jQABI7a2ChVtRsN/nTnfqUZZE=;
 b=BiaxGeGrszBm9EDV75Oj2eYiXLDX/orSef6c4rR8S7Hup2effNowllbc74PmqT/FKs
 8xJkOZZYReQfoJASnm2aRzu6xR7NoyyyIVSSw2xd2FsSQ02iYXhU5g+oQEtjvG69P0Pj
 erMyo8Ap7uJigLuSzf68LvQ+7ZnqxFT7BFJ8WUwtIrCMqw3VX/fu4PkaaFSlw//Gj169
 Dywc6xTvfwaObdcQpRt5UcDqj6fG7h7B3JNgyils6ZV7p/K6TAavteygh5/xga5g8dl7
 gaUzLiYDQYaC96YWqRNCW4dVADMC747vTBLxHj9iDg4+ecDdeipC8yJMe2lf0hAYWMAG
 KIVQ==
X-Gm-Message-State: AOAM531LxLo+aheggAuPpZmVklYSLDl6jNkf6q2YCE74mslcF+YpE2hi
 ++2M587qEVAcy5g8GDIr6KacQO0JNDTbSH5s
X-Google-Smtp-Source: ABdhPJyvg9NYY3SSw3ECtdf96uoOyKdmHmuRhh+WcKRTDhDtAQOFmYqKak+UQH6tgAOrhK77M8YCMQ==
X-Received: by 2002:a17:90a:7d16:: with SMTP id
 g22mr17496646pjl.135.1602468581497; 
 Sun, 11 Oct 2020 19:09:41 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 q81sm18970519pfc.36.2020.10.11.19.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 19:09:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 22/22] drm/msm: Don't implicit-sync if only a single ring
Date: Sun, 11 Oct 2020 19:09:49 -0700
Message-Id: <20201012020958.229288-23-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Any cross-device sync use-cases *must* use explicit sync.  And if there
is only a single ring (no-preemption), everything is FIFO order and
there is no need to implicit-sync.

Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
is undefined when fences are not used to synchronize buffer usage across
contexts (which is the only case where multiple different priority rings
could come into play).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3151a0ca8904..c69803ea53c8 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -277,7 +277,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	return ret;
 }
 
-static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
+static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
 {
 	int i, ret = 0;
 
@@ -297,7 +297,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 				return ret;
 		}
 
-		if (no_implicit)
+		if (!implicit_sync)
 			continue;
 
 		ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
@@ -768,7 +768,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
-	ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
+	ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
+			!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
 	if (ret)
 		goto out;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
