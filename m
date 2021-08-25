Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907343F7F1A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 01:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2086E441;
	Wed, 25 Aug 2021 23:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848016E446
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 23:41:26 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id w19so1761230oik.10
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 16:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zmkhJZgxUoBYEWfmUUPtlawWDiOOQTnvHmBTREcB0I8=;
 b=JyWNsF0Fao+n3iA7RF4tPiWMJ8n2MZ2mYJoFDYpVaqi9ikZqme6UoCEL5AL6XWV8+b
 7j87fGb8hvJLvdo6yIJZGnmE8E4AXI+nFHBd1vgw/ziftZGciRFPiNm6JyxoKk4XqR8R
 WZf76jy/wYt9SI4BubN6PAu11atHjFJc6O5BLQ/wS52aA2uWAtwaI3YInYvWOgACsamN
 lerEgJOmm6aVh2+Wsj1TQGiWtR6jEXRCBgn32lvkpTeYUci5pjr1cWJmIX6WHVJjzKoz
 j9cQiPlS9DuiiKiFzshN54SQEfYOJxDMmAKpOJLwvJXhgE/NrZVmiItvzv6iUdhqFKc8
 RcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zmkhJZgxUoBYEWfmUUPtlawWDiOOQTnvHmBTREcB0I8=;
 b=ks697YYHC/hI/3HxOAZPR5NEkGk2dNUs2TyYdAEy09l9HYJXqMgAXD6TWt2mSGOpuV
 aItYDgNSfgQytEQBbh1DnjC6X82WrcFSwCOkQKAzNu0HH0tDd0Lq+h+AwxmUELY/cRR8
 t6yETuxVCpT4vTMDOHgZ7LkRjvrR3yBACBRNOq2bUjZA63eFILK9vmk+mAtDVRogVBaL
 VZcDK2z7BsdK8WDDCiTikW46lJuNN5s4PW4avveIL+PRXu+nBvb3R4sxXmyB6XeE00lN
 qANQKHcnsGx/8U3FCv+6XximCG7WyysnrngeYHDo8ygSPzF3meGd0RZYJ3OYz2nRiXnH
 M38Q==
X-Gm-Message-State: AOAM530qS4yrcfiP4pXSkSVMdz2MeomIk8O4FBCGGYGyQaKIB65+ExZp
 ZWA6fMhdknUm4nPT9zF7BjXEdQ==
X-Google-Smtp-Source: ABdhPJz6tjCEJEeOJPotO0Zqa9gAx16HRWTqIQ4PQRuPnenQfro7aG6soUq54MIbZLfLl+BS50n8vA==
X-Received: by 2002:a05:6808:95:: with SMTP id s21mr418519oic.80.1629934885805; 
 Wed, 25 Aug 2021 16:41:25 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g10sm267136oof.37.2021.08.25.16.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 16:41:25 -0700 (PDT)
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
Subject: [PATCH v2 5/5] drm/msm/dp: Add sc8180x DP controllers
Date: Wed, 25 Aug 2021 16:42:33 -0700
Message-Id: <20210825234233.1721068-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
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

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Squashed DP and eDP data, as there's no reason to keep them separate today

 drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4a6132c18e57..c1307230dc47 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -128,8 +128,15 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 	.num_dp = 1,
 };
 
+static const struct msm_dp_config sc8180x_dp_cfg = {
+	.io_start = { 0xae90000, 0xae98000, 0xae9a000 },
+	.num_dp = 3,
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

