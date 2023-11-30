Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B997FFB20
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 20:21:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF8510E772;
	Thu, 30 Nov 2023 19:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249CF10E76E;
 Thu, 30 Nov 2023 19:21:24 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6cde11fb647so1312724b3a.1; 
 Thu, 30 Nov 2023 11:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701372083; x=1701976883; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FNcHli21vir5baYj9ku8MMNBlCqv0AKIpWf2Lyqz8B0=;
 b=RqrrwCzo3ZPkenvo0ylhFsF+Zaf/eguZ1q7dfcNFvoO8cA/USMbKstrS+3GN3Hjeqm
 MNZJ67okOCBkp/1WT561i4EKQKFr1VZRKFoBKzm1HsHeiO9uP6RxtEAEQmMXXPiVTy3E
 W0ptbneAE/R0TmyomanFNPaKJCWqV4I/+SxAOgDoDegJqYpEk+D0chBXhx9WY8vhcZHG
 jQDXOkqzT75ezhBey+U9MEBHzk1XiRvKzlEL5rXcplTvLxvZ703e4zQf86NXGSQDqPQA
 VF8yT8vLt3bzMT9o+8dGxha4BampK54hdB5ILsHKrhltirpKHBuSytpjES/ocSep4qKH
 yHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701372083; x=1701976883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FNcHli21vir5baYj9ku8MMNBlCqv0AKIpWf2Lyqz8B0=;
 b=ryg2r2DCJ3TpPR+rks9/eGGBP1NkMUlThQ0Z2lk5QL9HudNjWgIF4xXgd+CI5b/M/2
 XSf9KXNXt/MwYTEjDikudHDGUBI3lv6LuLSYFVipg1nZoKi1F6CT24hmCeJcNx4/Mm6p
 RQEl7Oc1QfK6PEQF7RY0erHLRMF9KAO5vQFPbjlnH06k+bAWcbWsYiw4aHGheqOQZFX3
 6E6Zr3DOu96397pqCYZxSpJObeqOfLrU4riqb4G7YRdCOd7VWvAo7PdO6c/WyXfTQ49u
 Hu2tjobh+4wkjeKTdaW77ndc4iUcjJQpJIgPiV9K0Kw82RO6ZhrgGrZ/oRjhtYWzHlbw
 q/SQ==
X-Gm-Message-State: AOJu0YynnnyQQdWapJMCyO1jblyciaMtF4GrmOkWsavBhVWO/g6WkiIV
 +StYBpYot3o+IQQ9rXKxn6W+zIwVEck=
X-Google-Smtp-Source: AGHT+IE2f9qp1SjvrsRN4lxzgsw0h/B5/kyMl8ci2BReCokFmvVJMt2wKJZqfjD/VXwiZhodFeQ39Q==
X-Received: by 2002:a05:6a00:21c9:b0:6cb:8ec7:ad01 with SMTP id
 t9-20020a056a0021c900b006cb8ec7ad01mr27603366pfj.10.1701372082809; 
 Thu, 30 Nov 2023 11:21:22 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 y63-20020a62ce42000000b006c3069547bfsm1628882pfg.79.2023.11.30.11.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 11:21:22 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: Correct UBWC settings for sc8280xp
Date: Thu, 30 Nov 2023 11:21:18 -0800
Message-ID: <20231130192119.32538-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Steev Klimaszewski <steev@kali.org>,
 Danylo Piliaiev <dpiliaiev@igalia.com>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The UBWC settings need to match between the display and GPU.  When we
updated the GPU settings, we forgot to make the corresponding update on
the display side.

Reported-by: Steev Klimaszewski <steev@kali.org>
Fixes: 07e6de738aa6 ("drm/msm/a690: Fix reg values for a690")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 6865db1e3ce8..29bb38f0bb2c 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -545,7 +545,7 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
-	.highest_bank_bit = 2,
+	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
 };
 
-- 
2.42.0

