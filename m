Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7B3379E50
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 06:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DA36E9BA;
	Tue, 11 May 2021 04:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499BB6E9B9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 04:21:01 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso16432899otn.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 21:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wgZFlNZfz9EYfzeQvg8JR3pWaua7Txo/La4Xs65mV68=;
 b=e8cVwtdfQWxKumLU3L2sPcRRE88YwVxhHXUc4c3k7eqlRl0thGjwpqhW1we3uS9N7y
 nZ7umVU/j0VZplwCYa/Y2FS57EbEdKIWHRFcrctPTRdENRXjLBtk5jvAsErUM4Ho5QW7
 NPOh4vQUr10l2STyNoCrunsl92Yy6+WF4CfvrgMzXgLUKK2Z2GzHpAK2+BS3z3DuAPG2
 JDfFgYrw6md2QGmT7Ay26TE4qMmGL0eDzqR6x9BTLl+9VBzFE06GX0GTBMf1gMhEEXIt
 DO95hXL2HCB+vHI2f17IgDu6Fw2DtW4stke/2LQGfrnnDdy1i+fR8GWOzw6KU/7wwgti
 0rOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wgZFlNZfz9EYfzeQvg8JR3pWaua7Txo/La4Xs65mV68=;
 b=jZW2x/Mt6svTAYI2G+4NMQWhbrgxKKOcOzOrGutK6R8Nj3HvPtPSMgLR7rWKn++DHh
 rzxSvSqXhzovpZTDc3B7HYDHEow0YgBPG19a92iZowhlqba4kuZBUFuKqR2sxAuDlTLG
 TzQNoO5jmKzj43B3O7HlDaEYS87DXLfB07qiEy8FXyXT6rIvr9FdCdrT7sN61BAPwzlA
 WD7Uh+ug5LbAlIaYp/HrA7N3jRNQt66Xqmv+g6Co6YFD62HrAXyhgmHGVBXRG3N2oJrz
 4n326A0Xefq12zHAZ6M1tVOU5T044USE18YA+q4zNhU0fG/SbH3oymEg2oW3tz3qWmAe
 BzKQ==
X-Gm-Message-State: AOAM532Mn8S3z8VdWdrkvrOZ4LpVPST51MTDfzUXn7MowaRae3TETkbP
 xJfSrbdruZyHOxMYXsEHTJdbtQ==
X-Google-Smtp-Source: ABdhPJzYz3q7MFfxjCEI/JfYmH/AhONwg4lawUVkKe8sdMsBhbmNaRZcIRoAXDSU/Esv/aaFXnMEug==
X-Received: by 2002:a05:6830:70d:: with SMTP id
 y13mr3221908ots.191.1620706860591; 
 Mon, 10 May 2021 21:21:00 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
 by smtp.gmail.com with ESMTPSA id r124sm3042294oig.38.2021.05.10.21.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:21:00 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, sbillaka@codeaurora.org
Subject: [PATCH 4/4] drm/msm/dp: Add support for SC8180x eDP
Date: Mon, 10 May 2021 23:20:43 -0500
Message-Id: <20210511042043.592802-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511042043.592802-1-bjorn.andersson@linaro.org>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
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
Cc: Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The eDP controller found in SC8180x is at large compatible with the
current implementation, but has its register blocks at slightly
different offsets.

Add the compatible and the new register layout.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  1 +
 drivers/gpu/drm/msm/dp/dp_parser.c  | 28 ++++++++++++++++++++--------
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d1319b58e901..0be03bdc882c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -121,6 +121,7 @@ struct dp_display_private {
 
 static const struct of_device_id dp_dt_match[] = {
 	{.compatible = "qcom,sc7180-dp"},
+	{ .compatible = "qcom,sc8180x-edp" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 51ec85b4803b..47cf18bba4b2 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -251,6 +251,7 @@ static int dp_parser_clock(struct dp_parser *parser)
 static int dp_parser_parse(struct dp_parser *parser)
 {
 	struct dss_io_data *io = &parser->io.dp_controller;
+	struct device *dev = &parser->pdev->dev;
 	int rc = 0;
 
 	if (!parser) {
@@ -276,14 +277,25 @@ static int dp_parser_parse(struct dp_parser *parser)
 	 */
 	parser->regulator_cfg = &sdm845_dp_reg_cfg;
 
-	io->ahb = io->base + 0x0;
-	io->ahb_len = 0x200;
-	io->aux = io->base + 0x200;
-	io->aux_len = 0x200;
-	io->link = io->base + 0x400;
-	io->link_len = 0x600;
-	io->p0 = io->base + 0x1000;
-	io->p0_len = 0x400;
+	if (of_device_is_compatible(dev->of_node, "qcom,sc8180x-edp")) {
+		io->ahb = io->base + 0x0;
+		io->ahb_len = 0x200;
+		io->aux = io->base + 0x200;
+		io->aux_len = 0x200;
+		io->link = io->base + 0x400;
+		io->link_len = 0x600;
+		io->p0 = io->base + 0xa00;
+		io->p0_len = 0x400;
+	} else {
+		io->ahb = io->base + 0x0;
+		io->ahb_len = 0x200;
+		io->aux = io->base + 0x200;
+		io->aux_len = 0x200;
+		io->link = io->base + 0x400;
+		io->link_len = 0x600;
+		io->p0 = io->base + 0x1000;
+		io->p0_len = 0x400;
+	}
 
 	return 0;
 }
-- 
2.29.2

