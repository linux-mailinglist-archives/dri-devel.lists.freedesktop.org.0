Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F9E41F42F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9466EEBA;
	Fri,  1 Oct 2021 17:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A05F6EEB6
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 17:59:17 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id s24so12398079oij.8
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 10:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JI+sywciYnZbmZEgEJHRDL/J7+jew9UCDT1hip8NvrU=;
 b=FyoEbdW2FqsPcEhkuzRiqeAZHw3KxbHbOcE66Ei50UA+S5jXlr/d7sRdoPXj0zrPM/
 76r6rt7i+ccdj+mTerjrunN45spBenJDBib2hBvA6rhfnWpjHqmkNK5z5wJgO+jXn4p0
 h8raVVABtgEso+pTjYoll7GzjNoJgFGPIE/Q/rcwKVRadh1jHI48y9214q0FbwcNp5WJ
 M0pg+/b8khuqIFspFtwtwhAfa+JcRwQ+TBmb6BrtuIUOUSEYZ1bb5ZiQFC4p5TnMblcg
 zSxLtACQTor8eVznN8PPWSFJWfAADp52R487S2riQYeeqU7BpyvBkm9YvYD7Txy3HbMS
 Q8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JI+sywciYnZbmZEgEJHRDL/J7+jew9UCDT1hip8NvrU=;
 b=PUDeDVY+SdNrISduaigRrLW5kHbOeZ9C89dulNs/QMVe1gXATulVgcL7x4ZE6vTNBK
 TtSuefWvrQ7RkOb55TadMu5Q8nLksaqjME30Ds/1Pn79smYXN8EjaoXpz2yOgZcogLp7
 haBt7npJh/C1Uhk+Dfb9ab/bk8GdasqU8uQNS5X/yn8myT1550vjQqhSQOTtCUnRmzdG
 mY54vmftempwaD3fKOlgI88o6+g1UWyQcIDZOJYEknwB9hfH1UvatYYWP9XGH9f1BGln
 s388pUzFvu4gTB7uv+yHIiUpx7pm5fzc25TeAZU0s0SFF9LufZtBrtHuT6u/rIxxQsra
 oxBw==
X-Gm-Message-State: AOAM532CaJDg0VO8/IedTpwOYY9cI8XJqKWOm6y/Zs8PrQqNms/CYLEN
 g5+95e8MvN3kKeWZCVALk7pVWg==
X-Google-Smtp-Source: ABdhPJy4WkvL2DtpKyrAXS99LAVSyxpiYi/tK7s8P4u/fX707mFCaQdncul2tax8VCgac4O/k7y/dQ==
X-Received: by 2002:aca:f189:: with SMTP id p131mr4906839oih.128.1633111156385; 
 Fri, 01 Oct 2021 10:59:16 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 w2sm1284798oof.23.2021.10.01.10.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:59:16 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] drm/msm/dp: Add sc8180x DP controllers
Date: Fri,  1 Oct 2021 11:00:58 -0700
Message-Id: <20211001180058.1021913-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
References: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
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

The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
DP driver.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ff3477474c5d..56a79aeffed4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -127,8 +127,15 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 	.num_descs = 1,
 };
 
+static const struct msm_dp_config sc8180x_dp_cfg = {
+	.io_start = { 0xae90000, 0xae98000, 0xae9a000 },
+	.num_descs = 3,
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
+	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
+	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },
 	{}
 };
 
-- 
2.29.2

