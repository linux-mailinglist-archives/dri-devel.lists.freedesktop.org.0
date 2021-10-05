Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9BC42344B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 01:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39456EC99;
	Tue,  5 Oct 2021 23:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36386EC92
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 23:11:49 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 a17-20020a4a6851000000b002b59bfbf669so281725oof.9
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 16:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/v5p/Ve9RUFoo4IfDLEcH542gJPDz9Km3sRmpush8O0=;
 b=k2ecrN8fG+oc/ePYrUrEfKSsZnF70RnwIGl0D+YFgs+/6hrQyKZ3lkQfiDiKf71Bmq
 xYwRZpD6bhce4lZK0kfC6K9a/CvWkohMCr6hMZfLM38IYXPfZ/JfNE+Hj0lAtcyiZfw6
 HFFwpimwhjy34R5RPKn1wVx+cH4rTbBCg2SaEJeljevKMfI5ZRRvV3kwgpL3TJwP1Edr
 U2pKmyvSTfvWqyovSKsos5xY1DQNk2EFcevADRE/TECsRy+B6C3JRQ0OpDNr7VHXarg/
 7dO4RO8SUQAo7gOifCFEQrzcub2BArQVX6AXn9zEunjrzB/oeGjN7B5WpYpK2tqMUKhl
 DiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/v5p/Ve9RUFoo4IfDLEcH542gJPDz9Km3sRmpush8O0=;
 b=FGb7WnNoACLckoHVw+13zJ6mlqxO/DzE49DaDjcECv4v93PgovkQP8eonRIrpd3ZHa
 kjhXvqS7YC5qVcAf60dneh9BDM8KCXJyGuQbZBWRMpQm7vQbl3og4fE0XIt7dNUsbFPb
 /d8omqmpgRy6vE7jjJyIYNPgzmEsChdP/fyZpR0gPH3VGf1F8/CaPEoPz+EcSmzIrtgy
 XjbbkwDGgBxrBDKfXGh8rkubC2T3SR7OVFegwuJye1PPiHbL8AKpCsdI1xrqGZNXPRUP
 ct1l9ZoNJFA/KMEWoHvNogQE+GE11J1okHqo6OdYOVEZ9nGoO9C3JRMUPU75WE2CmUai
 rNqQ==
X-Gm-Message-State: AOAM5327n6G0YPlH1RBafvZivE0LK0rl89zn993w6WIL3I9KLvZQ019c
 OxJKd/McvHgO6x4NTEdJZuB3daUqpg2Yng==
X-Google-Smtp-Source: ABdhPJxN5PHge5EzLnVUk65GK/y++2iJXI/H43T6JX8d+ltCU94ac/Zp77mPtHACBrAQaXfuL7nHPQ==
X-Received: by 2002:a4a:ba90:: with SMTP id d16mr2504712oop.83.1633475508970; 
 Tue, 05 Oct 2021 16:11:48 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 v9sm1665141oth.62.2021.10.05.16.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 16:11:48 -0700 (PDT)
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
Subject: [PATCH v4 7/7] drm/msm/dp: Add sc8180x DP controllers
Date: Tue,  5 Oct 2021 16:13:23 -0700
Message-Id: <20211005231323.2663520-8-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
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

Changes since v3:
- Rebased upon previous patches in series

 drivers/gpu/drm/msm/dp/dp_display.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 674cddfee5b0..29c2c1c52ddb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -135,8 +135,19 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 	.num_descs = 1,
 };
 
+static const struct msm_dp_config sc8180x_dp_cfg = {
+	.descs = (struct msm_dp_desc[]) {
+		{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+		{ .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+		{ .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
+	},
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

