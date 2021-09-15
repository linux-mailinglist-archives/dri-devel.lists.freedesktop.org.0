Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB5440CE46
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 22:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6711D6EA53;
	Wed, 15 Sep 2021 20:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C956EA55
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 20:39:36 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id a10so4952082qka.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 13:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AsRbP5dRnDOL8jtDrD7xM4MsIESBG338M4ja0G3IYsM=;
 b=BI8eXII0oxt1Xos6KWyJ/4oNvSGLpwTttog3N8S0omjbe3IHD5twyGVXNe7kb3/guI
 PTuyHrXdIZwqWOydF+BDqpvv1wxQaUQ2ybJO4nctrmrnD+4ydTZZYKAZdzbhO7taVe5i
 VZ2ZdsKuoecX1ypc/Z1PVLzqB2cQZl7RqsQa51Ug8D0N2W+qqVye9NdvSokQUt6ohgcl
 iD+kTl/kaa0bq2k9EJ8XkBILOPt39EzK6+58ch6heKsR5Vj6Ox+HBrt9w/UQOIy7vACR
 gBFy/yUrdwoecUkNjDHESzlt+08wSbukaCDwqybAjVIq4rS/PMz8Sd6JqFKAdE2u5NO/
 /ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AsRbP5dRnDOL8jtDrD7xM4MsIESBG338M4ja0G3IYsM=;
 b=fQsXlTxryH/XqOXHDB/+niYiUggpSvXCoY/STBNwhQrEqz0awaPjxFthNmHfssNjM1
 ZFN51SAsjtWo3N53jrOEAXt84Dd6wuq+htVUEGHJzjzzirlJ90XzEdPfLNn28cw3zFA8
 L4wX6QW4KxqvMX8y8LYAA+5qe+eJix9oJtbIMYj4Ndzc33eUyKPPJ/b3lO6hhn1YKlRG
 xEZBkcPiCVV0b8aGi1GOTKSJKJGgi5Jpyf7FMJg53RE9IgFaPE7MmCtQU07lwr+GQ9HP
 wYXkE4aTCuw/XCU7p9ICAj47S9YAbVVyqtKwMWa0ssqbiyuXnY/xNoK7uXQ3JYlmV7OY
 CQmA==
X-Gm-Message-State: AOAM532ngEkQSGgJeRkAVCuo0bhdcrFpknqySV4T7N3Ub9CrsCHF2jvn
 3qLEmrwuxFK1WthFDeWm0hDrneHFmF8HMg==
X-Google-Smtp-Source: ABdhPJwJTXgEXlT6pejzdXpiSt12aEvNmX8i6tGDb12BIX0/S0yUXdney4DYAFdCzgvDZGRYi7pjJQ==
X-Received: by 2002:a37:6317:: with SMTP id x23mr1900658qkb.432.1631738374963; 
 Wed, 15 Sep 2021 13:39:34 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id j2sm765678qtr.4.2021.09.15.13.39.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Sep 2021 13:39:34 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org, Sean Paul <seanpaul@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 11/13] drm/msm/dp: Re-order dp_audio_put in
 deinit_sub_modules
Date: Wed, 15 Sep 2021 16:38:30 -0400
Message-Id: <20210915203834.1439-12-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210915203834.1439-1-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
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
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-12-sean@poorly.run #v1

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

