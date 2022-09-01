Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8325A92EB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 11:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA72B89070;
	Thu,  1 Sep 2022 09:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EAF10E663
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 09:15:32 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id p16so5476679lfd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=0PopVUeDqVd8id5zcihhw1xot4mofrXOyc1GZjax4ec=;
 b=IvP5i70p6ppN98XYu7InwUNO/+mqptBcaId0KlOwGkf8kyje4IQAH2CDYHJMDp/ZkV
 ghEi4pY9LVoo25cOb3Hn6nvWNCrDZKlvqmXrmQy/2QZBmTJI4DlLM2sG00w3mIYIj2X1
 2tZsUDbm0nz3vikoSorTOUEXrx7rY+G/beM993ie//kW8O4VYZFpH8OZwv6tcD0bfeBS
 Zox9T3tugtECHNPlCggRMug5xoVMHWC6mRXfC3J2F53BXuVVr1lqRrYu30dpb8wOl7iF
 Yy/a7pLx90ybXbpD4qmPqCn5+xj5wmjKBY9H/FXKsaDUmnGyJ/+9O9MciMzRpAz2QB+H
 qipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0PopVUeDqVd8id5zcihhw1xot4mofrXOyc1GZjax4ec=;
 b=CY+SOXuarZZtkvG51YcFFbOsVvVvV0uTkMkVHy4jQwmFzJ9uAf4GF1YkuKEd1Gzq2j
 vRuoky/CKrqL8rPO3+ZUCANRYa0r5OPNAto4bh1x2fDb97eyxDSqchjZsIkd1BsegQ1u
 UJgn7uEVGXmEUfQ5QwIE77DRLctaL4/8HlnbIn/tS2sVynRPaJi3l3pda117Df5/j8YB
 Kmx4/leELPH+68DBTte+SfTzTYCVBtGG4lYKHtet1US+SsJuP0eK5u3cBwPP5axhDLno
 Qj7+tGtr8sKk+iU7X3ovE9LmSh+vWouf/Smkz2uai1WBKZmIK9U0Cr4W8k6n6NbJ/h33
 xjQw==
X-Gm-Message-State: ACgBeo3uzuaSOWjRZS5/ArXaeIgJwpj3W5olcTc+XibyFwWRiYGLG9rT
 5NT3h1mLSfrPFTrCwCaghJrJzw==
X-Google-Smtp-Source: AA6agR5gcvtrIHFZtE7o0eCPzN0rFEUKDxuoa820dKQCQFP47AtJxDVJ+nfan1kBmHAfIo9uLh6Mtw==
X-Received: by 2002:a05:6512:3fa2:b0:48a:16df:266f with SMTP id
 x34-20020a0565123fa200b0048a16df266fmr10153605lfa.414.1662023730688; 
 Thu, 01 Sep 2022 02:15:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 t17-20020a2e2d11000000b00261b4df9ec4sm2422349ljt.138.2022.09.01.02.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 02:15:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH 2/3] drm/msm/dp: switch to using platform_get_irq()
Date: Thu,  1 Sep 2022 12:15:26 +0300
Message-Id: <20220901091527.1992208-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is little point in using irq_of_parse_and_map(). Switch to plain
and usual platform_get_irq() for parsing the DP IRQ line.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3173e6962a78..40c7f91abec9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1243,8 +1243,8 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
-	if (!dp->irq) {
+	dp->irq = platform_get_irq(dp->pdev, 0);
+	if (dp->irq < 0) {
 		DRM_ERROR("failed to get irq\n");
 		return -EINVAL;
 	}
-- 
2.35.1

