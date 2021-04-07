Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC8D357829
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 01:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949266E9AB;
	Wed,  7 Apr 2021 23:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF8C6E9AB;
 Wed,  7 Apr 2021 23:01:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D5C7611C9;
 Wed,  7 Apr 2021 23:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617836478;
 bh=Z7WqCUanSlNvnD9wexNvEc3dx0BZpbT+4uVfy5X9skQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=AD9RsG1MszT7GTAMUnWeZhwOTLC5s3l0DrH6BnTkqDkKT0q18MV8IYE6Zy0t7p5Ok
 m7vfcNJ+KrsG5vKPysOXjwIU8Ddzt5lPY/swg7C+T4xQKlOqtsugxVnOr08V01rqjm
 +b4gnM0uRwAQvV1c8+OLWg24WeT+BrQY55ACrC6DdrvdUNhgwcIVSwOh04wb4Tmyra
 CMfM1W90tDzF9smEKQ8sDIaRLgKXK4oa1KkHVRq2BUPrZVObCC3LbpyZUH8e5v3nyh
 6Qq5uTvDfaffUx5Jis1ztg2qckI8AC2GPSNxRE+OlyvyQNb9fraw/7coh+lGkjbsAm
 SdcW9KKg06CAA==
MIME-Version: 1.0
In-Reply-To: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] clk: fixed: fix double free in resource managed
 fixed-factor clock
From: Stephen Boyd <sboyd@kernel.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed, 07 Apr 2021 16:01:16 -0700
Message-ID: <161783647690.3790633.7004111396421583619@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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

Quoting Dmitry Baryshkov (2021-04-06 16:06:06)
> devm_clk_hw_register_fixed_factor_release(), the release function for
> the devm_clk_hw_register_fixed_factor(), calls
> clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> after that the devres functions will also kfree the allocated data,
> resulting in double free/memory corruption. Just call
> clk_hw_unregister() instead, leaving kfree() to devres code.
> 
> Reported-by: Rob Clark <robdclark@chromium.org>
> Cc: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-fixes. I also squashed this in to cleanup that ugly cast.

---8<----

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 390c16f321a6..4e4b6d367612 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -66,12 +66,14 @@ EXPORT_SYMBOL_GPL(clk_fixed_factor_ops);
 
 static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *res)
 {
+	struct clk_fixed_factor *fix = res;
+
 	/*
 	 * We can not use clk_hw_unregister_fixed_factor, since it will kfree()
 	 * the hw, resulting in double free. Just unregister the hw and let
 	 * devres code kfree() it.
 	 */
-	clk_hw_unregister(&((struct clk_fixed_factor *)res)->hw);
+	clk_hw_unregister(&fix->hw);
 }
 
 static struct clk_hw *
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
