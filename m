Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A03421CA0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 04:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC3C6F522;
	Tue,  5 Oct 2021 02:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE136E187
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 02:36:09 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 97-20020a9d006a000000b00545420bff9eso24121207ota.8
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 19:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+GYY3fgaaeOEZFwlrXaNb8Km6kTmaOO7oRCYiPn9Rtw=;
 b=qQxkZKeNLS9TSHR3BlSX1ArGn+F4qj0wLMrriaL9e+NNs7BGuGFPd04emb85TkfPqs
 X5AgvVsDLajRGyM/ad3xXjCLnxemgsLZiSsaXyU8ZIF0MZ2f3paGBdn3qlHqBAWB6L1K
 L6B/pOj4UvESvrUkJkI5Tuq4Mfi7nWF3jlQA297TMkMYlWNoZuAiaUM70ZrRkq0twPWM
 1iPyV55ubu9/9JIibbHyGJy47zoRQT8OXWRlrVswfb9Rxz578tl+dzTTZMqOnPos8/5h
 +mBryetbbDvyQ744howTfEswI9PW1svgzLRTQZaC8LMS8BMG5xI+N4iw6ZA04Rjj5sTo
 mcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+GYY3fgaaeOEZFwlrXaNb8Km6kTmaOO7oRCYiPn9Rtw=;
 b=Bqj+fxJ2FYu9S4CRCp6le/tE7MY2CCTmwux2Csora6Q2qKw4gzQQlqq+foPmInKrOw
 D4bn62PWWCqG8wTZlq0c9X10jmzBliUsISjUZqm3SuM73jDXHlPETfw5Nr8tP39WCYAC
 wibloT93KzinGhA6xG78DKU7pYcyMFjto44q6Ka+TscxXuidDLR8pkoAhL/sbTIdtG9A
 GhNIskWlxwqV5QBpsbuWbEK8cpFQYeXp5u3u+phIdDLjaMeFErpfHrO+wYJiu2ahjC2G
 ra5ujO4MIuPKxUaVJIsklrvnTn1QZ0RG0aZpyZhPRcsSzlVUQ0FaeX94cbtummGCpR8q
 ApuA==
X-Gm-Message-State: AOAM53088McmuNaIFjD8uGAv/rEJOdqbnI8Hmc4NKLNXZD562FNxvWtp
 p9TW9bLFJcIrYy5KxmCkGLoua6SOU9xwog==
X-Google-Smtp-Source: ABdhPJygR0UDTE4BCHMd53yNo4xPeVw33V9dkfjhe2wQn4fgUTpyYl/AR4nlydFZHzSlhUGbJGWU4A==
X-Received: by 2002:a9d:7307:: with SMTP id e7mr12316641otk.35.1633401369095; 
 Mon, 04 Oct 2021 19:36:09 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 i12sm3055329oik.50.2021.10.04.19.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 19:36:08 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sankeerth Billakanti <sbillaka@codeaurora.org>
Subject: [PATCH] drm/msm/dp: Shorten SETUP timeout
Date: Mon,  4 Oct 2021 19:37:50 -0700
Message-Id: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
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

Found in the middle of a patch from Sankeerth was the reduction of the
INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
is initalized and HPD interrupt start to be serviced, so in the case of
eDP this reduction improves the user experience dramatically - i.e.
removes 9.9s of bland screen time at boot.

Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 21b9c1de4ecb..46d9f3eb6d13 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1438,7 +1438,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 
 	dp_hpd_event_setup(dp);
 
-	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
+	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1);
 }
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
-- 
2.29.2

