Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3312441F0DA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 17:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC846EE3F;
	Fri,  1 Oct 2021 15:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1041F6EE40
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 15:12:41 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id f130so9430102qke.6
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 08:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1JK+qFUiwYEt4EG3Izi4lkTF9eNwxVf2HfUhjtHyP+I=;
 b=a7GYpaY8HtdoFdhDknXiC2DG5VjgIZoLNTwJcrsfE3yIMKvbRXjpTBK/mgs1jBSJbP
 x4T2hgkMZ8Qq78jOYKNkekmADRez1XhJfIPoqe7vZ3jeu+9bKp5U5hxp3RsBuvi5ZGjk
 KrP6A2+zEEbAL0yc0YgJeo+KStYgt46UHy8zrwVmQ21FWk/4D52EGtgXJSdiw6mydHSQ
 H8nekpe3OCHGZP78jGUTRvG0Ukt09Z11Oa7sAxRQ1wsGKqpkCmg9rNd7XIF+u7pZMtkh
 LEVUAINzwdBTB/ojEV2Oq7m9mWeOByYgZdigwotytlH4UoQ3EAn3t/NevxV9aAGxj4we
 UHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1JK+qFUiwYEt4EG3Izi4lkTF9eNwxVf2HfUhjtHyP+I=;
 b=Z+xU/o3ngAXR0Ue7xnv5ao/54ita3lNCvYOoe30EE6o015nZc4OtKJIYuQ5RG21mOq
 upyC9+IlqBATiayNDy9t4dfPHYi4zh2euNRULOuGBRwDtUJ0gXwvIQ5LV+FYlQ+pRrcw
 p1eOQWWJO2c5f+puxnZ0iIgUOdG0R7pxYA1LC4KVbCOOhEc1BZwDH8e6jgTYyipzCqkM
 4rdbb1LqnokggNgZ8GSvHsapjT0wt/bA/bnEgcPrLKFD57YhHGJKvUKsGYEJyNCLyAGF
 MNDQBm2C3Rj4TLZJEQ0RWYvGZF3lNBousQwHH4C8uPJFJu6bt6sC8YMD0ezyXNkglUIS
 D3Jg==
X-Gm-Message-State: AOAM531AstAjAMZ3pVHkRRWhoCl55e3OCaC5ilVpwpx6FWMtZqLUNWqu
 V+g8xA7kxS5VWNZGgU5JV6i6AKaRJghuIw==
X-Google-Smtp-Source: ABdhPJz/BKi1zA6FTLxvhBBBeUOMOTAUTSwjrWe0fjrFIXANNQdOuM1mPEu+zk1I2WI33nirpxWEKg==
X-Received: by 2002:a37:41ca:: with SMTP id
 o193mr10288797qka.187.1633101160092; 
 Fri, 01 Oct 2021 08:12:40 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id n11sm3667110qtk.92.2021.10.01.08.12.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Oct 2021 08:12:39 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org, jani.nikula@linux.intel.com,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 11/14] drm/msm/dp: Re-order dp_audio_put in
 deinit_sub_modules
Date: Fri,  1 Oct 2021 11:11:40 -0400
Message-Id: <20211001151145.55916-12-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211001151145.55916-1-sean@poorly.run>
References: <20211001151145.55916-1-sean@poorly.run>
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

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-12-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-12-sean@poorly.run #v2

Changes in v2:
-None
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

