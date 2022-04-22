Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CE050B33E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 10:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BE310F50E;
	Fri, 22 Apr 2022 08:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8145A10EB85;
 Fri, 22 Apr 2022 08:50:08 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id c1so5334302qkf.13;
 Fri, 22 Apr 2022 01:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6nkPYSNqK+Cw/qD6vjcOwkiY8eCBmiuAPmGQItUKZ0E=;
 b=IdhdwlZB5sTnfN3m5koHQdBJdez4rySc7Gh3bi7zDveBPNwaHnj1HrpLWB8Xu3RN2c
 q5ELUClQ1eGaDzTesqeK69p+q2L1oemo2Ov5wmUcNXYCEDlOcvXOdt2Hw0DmSI1h7WhL
 ESqtoX9vIbUmbEFHKbmzUxZYfarIU5Ya8UWTc4Gmgpzj5ghpgmhqmihapgQ0X6TCaORO
 QHKURbaD7/9p71VIYelAw7VlCWzlHvI+A7tdnmYgx6RRDBxHzP3xs9JOLuUDCKcAZxCw
 CoHJKZx00cjCZzU+LmYcrHKeW3U+kbOOPWmCjhfSKTo/tzC+r/tPjhS7JsTAioo32o2I
 fypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6nkPYSNqK+Cw/qD6vjcOwkiY8eCBmiuAPmGQItUKZ0E=;
 b=t4NGkDn+ngNvvemAbJAzfwHoNGWv6IDWYqhuqvdwbHaa7WDS+vD/9vdEw7SBlIwdYe
 L0a71oB4wZjkg9alk0RvGqdmaAIgfNkM9sc7FTYF90I1iqFOusC3bjopMDjiiF9D/ANL
 my8yiF+2FKpQZAZDkKCZ/f7a5+p6Oi55COYwesVk9awpevX92I6/nbz/jfqclRDZKnA8
 bjUFvwpA28+3BRZQcNydEtoqSQXN2Yk4pWY4vBuc/GWRP9fw4LuoNxURkqlITEB3GzUt
 wtOwbx+BeGZFPPmseqaFjSC+Pc11vod9pF7HJ8hzIEXZQwZqmhayLTvMcmqiPFnFhAIQ
 lvgQ==
X-Gm-Message-State: AOAM530pgzaXDGdhmI7ynwFFkyfpnbNSS+s6rEgE68e8MRmC9YOyiWNM
 wYOFXyx/PHRF8iOOonxPdg4=
X-Google-Smtp-Source: ABdhPJyXCx0PAFPmSxMP4XcsxbcfGEtc4GJyQK+4XSFjo//0/7XCsgrqJoEyPTW8ArA3Zu5AvNz3Bw==
X-Received: by 2002:a05:620a:2681:b0:67e:933e:54b6 with SMTP id
 c1-20020a05620a268100b0067e933e54b6mr1980148qkp.428.1650617407550; 
 Fri, 22 Apr 2022 01:50:07 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 w82-20020a376255000000b0069ee3f0ae63sm653237qkb.45.2022.04.22.01.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 01:50:07 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: robdclark@gmail.com,
	sean@poorly.run,
	quic_abhinavk@quicinc.com
Subject: [PATCH] drm/msm/dp: fix error check return value of
 irq_of_parse_and_map()
Date: Fri, 22 Apr 2022 08:49:51 +0000
Message-Id: <20220422084951.2776123-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 dmitry.baryshkov@linaro.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
 linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

The irq_of_parse_and_map() function returns 0 on failure, and does not
return an negative value.

Fixes: 	8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a42732b67349..3926d2ac107d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1239,7 +1239,7 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
 	dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
-	if (dp->irq < 0) {
+	if (!dp->irq) {
 		rc = dp->irq;
 		DRM_ERROR("failed to get irq: %d\n", rc);
 		return rc;
-- 
2.25.1

