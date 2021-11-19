Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F60945790E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 23:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3F86E875;
	Fri, 19 Nov 2021 22:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DE26E40F;
 Fri, 19 Nov 2021 22:47:01 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 28so9789846pgq.8;
 Fri, 19 Nov 2021 14:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oc0ol4V+6f1FUJ4tw/CYx1vddRWZjt85+l1yOQxtvDQ=;
 b=jSizSv4oOdRjv7BP02RkpKfuuEMos/m3sJYsGjimaXxyBBf8BUkOFlbFu6Ume4rVc6
 qryWpQkDCaYedMEa9UzM9eytzwNvGXq0vcelhJFJlnsv8UbTTJlTXHgl78nReskDZPzH
 c6qdE3AGRPoQ2XSQjo6icN92qJ50NmFvHq+7G6kI2wm7941CNv/YYb75JXLQ8P9v3N90
 FCqvrvOgVroizP4SXMc8rXetdJFSX2oJj2+9LVYZ1d0mORoUvxlz6nKHyp4V8RrTwpdP
 VJOaXyRv2TMFYiqh15V4teiK2MPO+TPJ8QRSC3t5z74RurpaYJ8bufUiK/jgtFE2bbt3
 LbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oc0ol4V+6f1FUJ4tw/CYx1vddRWZjt85+l1yOQxtvDQ=;
 b=UpXVuHnilHx7+heUEQyx09QirshG67qUeSOgSCT4gJXKlF37tZRKD8ogJCGHSh8UP+
 clAVyj3wYRsb7zRPAqwNufmmbX9iDz1ptMeYErTagKR9VCQNTzEC/K08taREzKwRORYl
 XtJfJETGDncguxTkPt9RbFc/yyYVUAxCfLeb9pFEZG/0ska3tF5mgDZ2uhmoZiLTgBI6
 W7dNO0kk9qEXffMFa4xWSdlbN7schfPkAjiTVQzXkVAXbzPgWdrMuZJtTtkderDStdbK
 4xU7pfaBActfomfpfrKJEo4Fp8H9gr02UuofmWTOZLExNTdRqk2Lv2aaw7QitvLsP2X7
 lqRA==
X-Gm-Message-State: AOAM533+l6wA8jkDNOldV8Jy0SbRiwW86Nkm5DNkziepm0zumYXgA35O
 pM6t9s+gnGcB3MxPTcF8D3b4hviI3pA=
X-Google-Smtp-Source: ABdhPJwdZyLppiJ42MmyCru5whIXHzj7Wo0ZcF/f5JOkbefQ/XFrPGLKce6g4uJgG/fKJx88eX28Gw==
X-Received: by 2002:a63:494f:: with SMTP id y15mr19778226pgk.257.1637362020412; 
 Fri, 19 Nov 2021 14:47:00 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 t67sm631440pfd.24.2021.11.19.14.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:46:59 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/gpu: Fix idle_work time
Date: Fri, 19 Nov 2021 14:51:56 -0800
Message-Id: <20211119225157.984706-1-robdclark@gmail.com>
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
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This was supposed to be a relative timer, not absolute.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 43468919df61..7285041c737e 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -228,5 +228,5 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
 	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
-			       HRTIMER_MODE_ABS);
+			       HRTIMER_MODE_REL);
 }
-- 
2.33.1

