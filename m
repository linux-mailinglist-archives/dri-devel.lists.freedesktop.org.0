Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C51409B8B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 19:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1486ECD0;
	Mon, 13 Sep 2021 17:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413DB6ECF1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 17:58:43 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id ay33so11486728qkb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5lJyWPQ/3+Xa5evtg9nYe6ccWuKsIvtWNw1YcJwpQdU=;
 b=Xr1Q5VlWqMOrRJGpm88EVkf81ekfN0id2HBb+gbilUvJ/UzjqmrcXin/oSnRTQhSFx
 89xx306m11zx5BW8YhhuFIU30ek7MZQkW5Ks2FrR4IcHkqtiCMjEMeHe4KadCKBXPx0L
 IhV0u7evV9Tvlzsx74UiU7dTDPJMRs5GUf8dC2P79Scrur9oB/GC/cFfqjcC+ajqK8cm
 tX5l4cqZUkkv5nY6ZC4nKlgTj2fOL95uezodFGSvILTLcHIJvwFgOf+3giB0jk54qRZw
 zEjGmWFVbVeg9ypwmqbagenhuXo+WOQKuhRfnY+ynvEyfbK6WrUCt0JpgNVoSbAQ5bCR
 QqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5lJyWPQ/3+Xa5evtg9nYe6ccWuKsIvtWNw1YcJwpQdU=;
 b=aWED3ocM25c40DGZ3ON/qwa2/B2s3a9SSLRb0NFPJymGGmBmOWAc0qDj6FaJsKfqWK
 vyg9oyqkkByvjFlAnxF/qJ9v3kR6jwa2btl9MS8U7nnSi+ilSmQaUcuQP6AsILGeToS/
 4add3ZTOY2LMQOEl04c6CoofAfxizvF7hj6dVBnx1bzef6jLC512VUgqJ96bqO70EV7g
 mR7YwJn2tWMP+ooSTr9yB9irhMWyL/TxgYYphqpaZT5eb8bRvzibqnokBRnHylmsW3k+
 yutBHEDDPG46iZBMPrgpOIQkJ3nh2Hm1KIoDnsdVsV3LLKyVfmhcsGmebEZd9YUtArec
 z8oQ==
X-Gm-Message-State: AOAM531yW3WfEeO+6lppZS9LVUCn2rlPP2i8NyuD1g91meLj9pJo7VrY
 /y4ImRxwqsw8HsRg9Q48K13kzbi4dZNpAg==
X-Google-Smtp-Source: ABdhPJyj9+8POv3KXdcDALh9BjOuMmM6UpBZnrQNonh08bvRuIHEBH3SBlVEgxBetgmq4r9y2Knvkg==
X-Received: by 2002:a37:e301:: with SMTP id y1mr795704qki.475.1631555922254;
 Mon, 13 Sep 2021 10:58:42 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id j3sm5739505qki.104.2021.09.13.10.58.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Sep 2021 10:58:42 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 11/14] drm/msm/dp: Re-order dp_audio_put in deinit_sub_modules
Date: Mon, 13 Sep 2021 13:57:42 -0400
Message-Id: <20210913175747.47456-12-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Audio is initialized last, it should be de-initialized first to match
the order in dp_init_sub_modules().

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fbe4c2cd52a3..19946024e235 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -714,9 +714,9 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 {
 	dp_debug_put(dp->debug);
+	dp_audio_put(dp->audio);
 	dp_panel_put(dp->panel);
 	dp_aux_put(dp->aux);
-	dp_audio_put(dp->audio);
 }
 
 static int dp_init_sub_modules(struct dp_display_private *dp)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

