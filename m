Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D48526F69E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 09:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891F06E0AA;
	Fri, 18 Sep 2020 07:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A356E423
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 22:44:27 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id md22so3408809pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 15:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=emK8TCQ/AOCbQCaTZuyx4EX1GGlS5xLteCwUhZhZWKs=;
 b=asVwRODTCKzTMhPdETpQLiZroP91Get/mIBjAac5bezdK+pOzFI4MJpd0T9o9DUYWW
 Jrgc59dc5QywWAx0/rRfNXXzIp+8G6594T6t/N1pVZVe2h3Q97pV/5VPO3dLx5rXGWbS
 OUXTBUjCBjdKZPF75UxabZQM0laVCy2zi9SYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=emK8TCQ/AOCbQCaTZuyx4EX1GGlS5xLteCwUhZhZWKs=;
 b=CK3bP4bk1HnsKstm6+YM7qVcZWqWCXIXUPdWKdlT4uWm5FuDf8R6lJ0s3oVbVUl8Ak
 LE9UDVlS3jiD2ge1nfcYOJAceilv2cHUJGXlQgk3lG4K8NefuE2MeYIXNZQrTdwop1O/
 fzx2HqtFHYMixGyLmrBG/vArG2kBQptCqSidAPxosnwhAIC9+3u0WeK9Z/aQ5SnbaPQB
 CcwY97Y+3rihBxc3sURtpkZREgSSO3SenjCEHGWNkFLq7aOg2ni0wqg1zl7PgkBlP39C
 LDWJoZ9U0sCuOv8MxqwaYFF00xgwUd9CevqK5qsSq5GaKmNk9FCoZsS9/y6mQYjOr5oR
 ITpg==
X-Gm-Message-State: AOAM530zqmdUcCwn5L58ucUc7caalXaHy62W2tPtdch1qoSbueUpT1zO
 +R0ANHsd8i/w8IDfB+dxjAA9sQ==
X-Google-Smtp-Source: ABdhPJywypDGBU0fygZ+vRZ0Ah7m+uJXUNioxfPKAcCRYPGZUExxbYZ5CmLJLP3uPld3wN0+0sGN1Q==
X-Received: by 2002:a17:902:8509:b029:d0:cbe1:e746 with SMTP id
 bj9-20020a1709028509b02900d0cbe1e746mr29812096plb.33.1600382667062; 
 Thu, 17 Sep 2020 15:44:27 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id l123sm674509pgl.24.2020.09.17.15.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 15:44:26 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/msm/dp: Sleep properly in dp_hpd_handler kthread
Date: Thu, 17 Sep 2020 15:44:25 -0700
Message-Id: <20200917224425.2331583-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Sep 2020 07:21:19 +0000
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tanmay Shah <tanmay@codeaurora.org>, Douglas Anderson <dianders@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We shouldn't be waiting for an event here with a timeout of 100ms when
we're not in the 'timeout' arm of the if condition. Instead we should be
sleeping in the interruptible state (S) until something happens and we
need to wakeup. Right now this kthread is running almost all the time
because it sleeps for 100ms, wakes up, sees there's nothing to do, and
then starts the process all over again. Looking at top it shows up in
the D state (uninterruptible) because it uses wait_event_timeout(). FIx
this up.

Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Reported-by: Douglas Anderson <dianders@chromium.org>
Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Based on msm-next-dp of https://gitlab.freedesktop.org/drm/msm.git

 drivers/gpu/drm/msm/dp/dp_display.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 05a97e097edf..e175aa3fd3a9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -970,9 +970,8 @@ static int hpd_event_thread(void *data)
 				(dp_priv->event_pndx == dp_priv->event_gndx),
 						EVENT_TIMEOUT);
 		} else {
-			wait_event_timeout(dp_priv->event_q,
-				(dp_priv->event_pndx != dp_priv->event_gndx),
-						EVENT_TIMEOUT);
+			wait_event_interruptible(dp_priv->event_q,
+				(dp_priv->event_pndx != dp_priv->event_gndx));
 		}
 		spin_lock_irqsave(&dp_priv->event_lock, flag);
 		todo = &dp_priv->event_list[dp_priv->event_gndx];

base-commit: 937f941ca06f2f3ab64baebf31be2c16d57ae7b8
-- 
Sent by a computer, using git, on the internet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
