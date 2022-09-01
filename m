Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077B35A92EA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 11:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B67610E66C;
	Thu,  1 Sep 2022 09:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE2910E663
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 09:15:31 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id z29so14911190lfb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 02:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jNM+5myziriC40IcLi6KZeIacAr+ajJ9scGcT8bKpzo=;
 b=TPU5kkYcJ/bgeVpCEiOlPxfeLqUaaCPDobVW8KvP0t4ccjSpwx+gYAwldV7QaklzxM
 YUPO6qjo6OEi/7l1GhfjVE7Cr1igB6CdWJgTTi9HpjS4QT84noyhAXEd9QLaJl5h4M1/
 GoAueKnl0gIsq6AjZPXF1rO/kQX6sRaTq4B6jeCkc4fuIVWEcEu1NF6Vg/kn2PQ9V3Dn
 hyPSkDhVH3aLmX1e1Hk0ApD8P3TFuIT/lJwxfF16QivYZfYsrD9sXF8WjNQb8fxmuDOy
 yOYvEnlvZEWp+LVI7Cw+6XmzXhhB2Rphl6NsmERJvi7sgabkLedAVqAa8hbJjEIlur9w
 oQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jNM+5myziriC40IcLi6KZeIacAr+ajJ9scGcT8bKpzo=;
 b=VOl3ayRr5ivIn8v+mBOQ3+eRrCq9CXebSRxSVw9lHE0WzHHHL+x1xAYik2BJm0cgM+
 XUijFk5fXLIIpYNTTTr2rJ2wlwGpBQb8obE9oVGxCD7cwtqDwWu0OolnvT1TQbnwFV7Z
 W8RekgTEh5BnrOPVV00lHMC3qrMWkSYlMwfcMQpOEU0U4nrt8qCoycsjiiXE3IBr99MV
 6tVcXP+wjBkJh/CW/qcKRWmb/ArNy+HLJM3scGGZ4ynkBeTKbXlpEb0t6Frk302MpGIK
 Q43sKk7BrIjILxflS5zZL8dKAbYQ6QmqgKFYf/X2hHFnLnecw2K2Y6wzNzSWB5E+F5aQ
 PJPw==
X-Gm-Message-State: ACgBeo3f+gOC39j9anuBIx1v8on8jhgDvAW4HN+hPQLb2OAo+MXrhWrl
 idLLHLe1HDXvaDruFudo+16sLW2DUeyebw==
X-Google-Smtp-Source: AA6agR5LX8WMcaeVD4ENclbBhkqZGs2/l0DYGO4bc0F6WTraZHk3TbrLnXaw4WnOMwev2kp1gk7JMQ==
X-Received: by 2002:a05:6512:2350:b0:494:9925:f734 with SMTP id
 p16-20020a056512235000b004949925f734mr965847lfu.97.1662023729618; 
 Thu, 01 Sep 2022 02:15:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 t17-20020a2e2d11000000b00261b4df9ec4sm2422349ljt.138.2022.09.01.02.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 02:15:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH 1/3] drm/msm/dp: fold disable_irq into devm_request_irq
Date: Thu,  1 Sep 2022 12:15:25 +0300
Message-Id: <20220901091527.1992208-2-dmitry.baryshkov@linaro.org>
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

Calling disable_irq() right after devm_request_irq() is a bad practice.
it leaves a small window when the driver doesn't expect the IRQ, but the
hardware still can trigger it. Use the IRQF_NO_AUTOEN flag to prevent
the request_irq from enabling the IRQ line.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bfd0aeff3f0d..3173e6962a78 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1251,13 +1251,12 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 
 	rc = devm_request_irq(&dp->pdev->dev, dp->irq,
 			dp_display_irq_handler,
-			IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
+			IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN, "dp_display_isr", dp);
 	if (rc < 0) {
 		DRM_ERROR("failed to request IRQ%u: %d\n",
 				dp->irq, rc);
 		return rc;
 	}
-	disable_irq(dp->irq);
 
 	return 0;
 }
-- 
2.35.1

