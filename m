Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E94355F3A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 01:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A0D89FEA;
	Tue,  6 Apr 2021 23:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6333E89FEA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 23:06:09 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id y1so18360216ljm.10
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Apr 2021 16:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPWXCRyQycYQvj6HYAPrgu+5Z9a57EfhLN3d1yHm7Ps=;
 b=TpblUsbtD5po/N9CH/uKdwv0vEB3mnX65H7KPdYRddC7mVJFSjpYcspElVN2O/5zzv
 2NpmbX9x1UTxC/AiZlaBMKn4eS9jCVyuZQ/exmSW+stHaDAlpm6HzEuLtv+YbAGyjeua
 V4S8RLiqJk+mcEOvLgVUqhmmcWK2LLUItP/tmnl5KhP45rkzszvaaqhxln/vB2NErNSF
 whPy8AlWU59tdX6njnk0uAnKlCsN7wG36UGU6SFGzJ3mGEaoee9u6DAarPFvGZCBgvJN
 qqevv4fjV00ioLnCri+pzlI9ZIilUwxBMtOxAcgry/cd3REqfT8EOVLrcqTJqQiyak+f
 oa4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPWXCRyQycYQvj6HYAPrgu+5Z9a57EfhLN3d1yHm7Ps=;
 b=V4IP0oP7a3crGJDu7IcVJcp94aKPLHLtexJlYeX4nDGxFhp5HS0zqFar8jQ9oGm/ks
 bYIoXWKZCC8qnF1Cw2MsPjgE43lLKWeGMjU8gp6L8STYe97+5vSLA7YNEjZ9lOXvG/Kh
 HN1LJiVLsLWBt5wAYnV5Bjsesx50XgSTI+LuRRRLai7JWwBbMb+0VsdANsnrj17lFFVr
 ibJoRmqhUH8SelHvr5Fa68YPvkhix4oPG0EW5LyU+G51VjEM8MW/lrO5kzqc9b2TnsJo
 8h70h9f+7dEBXCbl2W/Tncq1+MEwqy6zhrNqRHxX2LFoovrLhXd7RrD+kXaLOAc8n51+
 u2Yg==
X-Gm-Message-State: AOAM532cRNfHj7iVL9L9ctLNFdIzZU/on+cJn9qhaHamkPjEbIgVMBq2
 m+zenkZJuxc2yuSpFMmnV56/Ig==
X-Google-Smtp-Source: ABdhPJxc5AF4qmysF86wYNJ0vHcgPANetDoaI2kJ39Ne3VwoDSAJxdpOVbZhfFJ5YUI9Ez56qmMVXA==
X-Received: by 2002:a05:651c:ca:: with SMTP id 10mr240945ljr.63.1617750367763; 
 Tue, 06 Apr 2021 16:06:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b25sm2351498ljo.80.2021.04.06.16.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 16:06:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH] clk: fixed: fix double free in resource managed fixed-factor
 clock
Date: Wed,  7 Apr 2021 02:06:06 +0300
Message-Id: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
 Daniel Palmer <daniel@0x0f.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_clk_hw_register_fixed_factor_release(), the release function for
the devm_clk_hw_register_fixed_factor(), calls
clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
after that the devres functions will also kfree the allocated data,
resulting in double free/memory corruption. Just call
clk_hw_unregister() instead, leaving kfree() to devres code.

Reported-by: Rob Clark <robdclark@chromium.org>
Cc: Daniel Palmer <daniel@0x0f.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Stephen, this fix affects the DSI PHY rework. Do we have a chance of
getting it into 5.12, otherwise there will be a cross-dependency between
msm-next and clk-next.

---
 drivers/clk/clk-fixed-factor.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 4f7bf3929d6d..390c16f321a6 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -66,7 +66,12 @@ EXPORT_SYMBOL_GPL(clk_fixed_factor_ops);
 
 static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *res)
 {
-	clk_hw_unregister_fixed_factor(&((struct clk_fixed_factor *)res)->hw);
+	/*
+	 * We can not use clk_hw_unregister_fixed_factor, since it will kfree()
+	 * the hw, resulting in double free. Just unregister the hw and let
+	 * devres code kfree() it.
+	 */
+	clk_hw_unregister(&((struct clk_fixed_factor *)res)->hw);
 }
 
 static struct clk_hw *
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
