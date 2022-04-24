Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EDB50CEE0
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 05:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF5611273E;
	Sun, 24 Apr 2022 03:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C8211273D;
 Sun, 24 Apr 2022 03:24:27 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id bz24so8267410qtb.2;
 Sat, 23 Apr 2022 20:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eqBlRZKmWXonJqRPv0/gmIodrBlaINi/8RFwh4KPYVo=;
 b=IGCNjuJzMB0egqttIvZuaEMfeM4P3pewgaNHqC2ykJS+bmBF+pboRCYd4uikqES3Ap
 vQUeKeCXbx38GV9GK0QqvlLoXXeoCTpYg86Lp1uaSK/cOwVhFlJkWyBKZKE+nEmWRuBi
 biVS0WdQflPqhNZQHv6rlJR4ZPKmH2yZ6ELQY38zO6N141H3AmXqrugAlzQDlC6korgg
 2chSzUSyo0uCvWWKs1iqjsCL3TQQKbyhP6uXPy0Rt0U0NT0dMbKRiLQrpr2lvXVeL5T8
 jdubCP933OMf8QpngLLn9SOhHd1wwtmZbJwLTcB4zTURLkXfUNq7zzTYJ4Wxy8Ceyq+o
 ZA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eqBlRZKmWXonJqRPv0/gmIodrBlaINi/8RFwh4KPYVo=;
 b=HErwCK2A0CoMetO6TjRqXrleQEyZ6yfnEkmq15Jl5FjEdLGnVHAbGH7xZED7BYKIJw
 /3wbng9SE3HlXsfF2NiWVCrS7DEBC19S5Qc50sFXBv6VZwS7hUlY1VxT+RW7ukas7tbt
 oboqWaEpgw4FnIgGmmsLmydhQmzgwTtMovEjp+7GnUchEu4I6HWBiFi06ML1XKlaVV5i
 UYB6gaxXrZUv7coP60pDfVAbe3tKAmClrEWdpnDsCkq9aEzOG1pmy7ekjww7vVOEYe9Y
 FR5gMEquI/OwnDBBTvk3bO+JZsBbemT+pco59LG2OsgaZZREyk3gQIvI/SS4HdkGGacr
 +OVw==
X-Gm-Message-State: AOAM5306Mh3kSDrEtmL2/4FY3b0+rEMRNPHhrSFt+mcd7RYjmMtFGWnY
 /FZi1knCqxsDZhN3HKnuzRY=
X-Google-Smtp-Source: ABdhPJx3igzCHoeO0tVtEqABqsVn0BHEEn7rMTXyCjjgErjXpg5VcP7xv+7pqhEZa4T6Hf8jzXTRTw==
X-Received: by 2002:a05:622a:256:b0:2e1:a01b:a538 with SMTP id
 c22-20020a05622a025600b002e1a01ba538mr8163370qtx.167.1650770666773; 
 Sat, 23 Apr 2022 20:24:26 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 f14-20020ac87f0e000000b002f28b077974sm4043923qtk.87.2022.04.23.20.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 20:24:26 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: dmitry.baryshkov@linaro.org
Subject: [PATCH v2] drm/msm/dp: fix error check return value of
 irq_of_parse_and_map()
Date: Sun, 24 Apr 2022 03:24:18 +0000
Message-Id: <20220424032418.3173632-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <0e6028f6-3fc1-2a27-0a45-0e024c632248@linaro.org>
References: <0e6028f6-3fc1-2a27-0a45-0e024c632248@linaro.org>
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
Cc: sean@poorly.run, quic_abhinavk@quicinc.com, airlied@linux.ie,
 cgel.zte@gmail.com, lv.ruyi@zte.com.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

The irq_of_parse_and_map() function returns 0 on failure, and does not
return an negative value.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
v2: don't print rc, and return -EINVAL rather than 0
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a42732b67349..c3566e6564b1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1239,10 +1239,9 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
 	dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
-	if (dp->irq < 0) {
-		rc = dp->irq;
-		DRM_ERROR("failed to get irq: %d\n", rc);
-		return rc;
+	if (!dp->irq) {
+		DRM_ERROR("failed to get irq\n");
+		return -EINVAL;
 	}
 
 	rc = devm_request_irq(&dp->pdev->dev, dp->irq,
-- 
2.25.1

