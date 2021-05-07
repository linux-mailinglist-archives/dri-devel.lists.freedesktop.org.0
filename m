Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC08D3766F6
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 16:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069A26EE2A;
	Fri,  7 May 2021 14:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73ECB6E1FB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 14:16:58 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id w9so4825057qvi.13
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 07:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CrsCAQJk5ZnVE8tHLcfB4TXYodmjeHRejfnH2DA3Xwo=;
 b=gNmi0I+4CIYhNbZW0mjW8xkLfbDle3nmeSHl3j6E8TPjhsuWwRmnSwbeE6MHpKhUI7
 mc2Wo5bRyjZUO09n3MPdnG8XOfARJg842Eez33T8q57wX4PY/bDUrzlhrKP73P8CuJKJ
 ugEs4LCsqjhO3wOEkdr7TYYl0RsHgIgNJSl8vvNQ15o5BCyHaGf0Q+aqq/NlIjL/nt2O
 5zIx1jTVT7Mqd8GXWZ716NkdOOExYzd1lTr/SAUQmHG4WJ1f5cGH0oPcckrBxup9olDF
 R9DgA9WquRKw/btJaBOmn9iMnIhzDQa1ZQN7xv38apNm5nPHQZ3zQ+V+AhBSIIlsBJS/
 hhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CrsCAQJk5ZnVE8tHLcfB4TXYodmjeHRejfnH2DA3Xwo=;
 b=YnEhe3mPR5FMYVIQHeivQJiq/9lGoClq1rVKPjddLoag/IfOtUIlIYpsWE70tpxHrl
 ZH2hZzufZaUeW0KtNbcsVKSrirPP+JKrXCkmz+LTuS4j866XX5H3wM80ckclsKVt5pnl
 J1KlswzUHIou46Ee4fYG7tWV0Jlt3B4JSeW0JlYFAvXSGsj0J185lZhQe3y9lSnotE03
 9NgIMhy1Mmm7JeuYu4oabXPbLXPBK6yta5jo6nyHVVNO9OQSzFCN1Czo8RAsdiagOtm+
 KniSHkrn3F+S01FDeyn0f1onRIbqp8D1PwxsvV/oDqcLHo/SRVkTr3chby4Lixshh5dQ
 kcDA==
X-Gm-Message-State: AOAM530xjk+aP6uor4VDtrZX/mgDBoH+U9shSkEdgzVr8kAnrfG0l8tD
 gyUKWgEPr8OQt3dul+QoaFDQS8xobqZE8w==
X-Google-Smtp-Source: ABdhPJxp56tr64aqcM62OQw+TwL3qUEpuXjmL1PUPxM/z2GmPIuBhQjZC4jfARWKPzrg8mF7L12rlg==
X-Received: by 2002:a0c:dd01:: with SMTP id u1mr10179642qvk.32.1620397017195; 
 Fri, 07 May 2021 07:16:57 -0700 (PDT)
Received: from localhost ([172.58.157.149])
 by smtp.gmail.com with ESMTPSA id r8sm4642098qtc.24.2021.05.07.07.16.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 May 2021 07:16:56 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix uninitialized var usage in dsi_phy_28nm_8960.c
Date: Fri,  7 May 2021 10:16:43 -0400
Message-Id: <20210507141651.2887-1-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <seanpaul@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch fixes the following error:

drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:425:11: error: variable 'parent_name' is uninitialized when used here
[-Werror,-Wuninitialized]
        snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
                 ^~~~~~~~~~~
drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:385:30:
note: initialize the variable 'parent_name' to silence this warning
        char *clk_name, *parent_name, *vco_name;
                                    ^
                                     = NULL
1 error generated.
make[5]: ***
[scripts/Makefile.build:279: drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.o] Error 1

It looks like the allocation was inadvertently deleted.

Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 582b1428f971..86e40a0d41a3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -405,6 +405,10 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	if (!vco_name)
 		return -ENOMEM;
 
+	parent_name = devm_kzalloc(dev, 32, GFP_KERNEL);
+	if (!parent_name)
+		return -ENOMEM;
+
 	clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
 	if (!clk_name)
 		return -ENOMEM;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

