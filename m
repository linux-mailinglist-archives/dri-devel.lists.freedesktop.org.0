Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827E63577DF
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 00:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D916E171;
	Wed,  7 Apr 2021 22:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5749F6E171;
 Wed,  7 Apr 2021 22:41:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C85161057;
 Wed,  7 Apr 2021 22:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617835311;
 bh=5lZb+aAr8K92mCDz3Mco+1StlTnl7CvhSeYNRB7lNMs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=qZRjQYeFkeG8p1L76Bglc3C5myAukg63MKI16XUnquzVpmkj2V0RL5/B5quyl3HoK
 9Ov9m6Cr9csPp3gPPK5b4dOptydF0RdbRa3bKcOp2XuhptubeVB/8k+eYhobuh++z8
 pUxcN90CuvN7NYYLIvNBNcsNHD6LFjCXttZjHQHHrUpyX33ncY8YfAqIld2UXmnIaR
 bOJICEvUNvxZNNW2W9pvrbmYB1S4zUQ2T/Wrf6lO3OeL8QsOauR7mkkFtum6aBZacP
 QADhHnj8AAaTTNlrIhlM6FLXd8BJHqrHtOHJU6GgRJDFH6JbfcyEVwHR8kUr3d4llA
 q9yEuCx0P9C6g==
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
Date: Wed, 07 Apr 2021 15:41:49 -0700
Message-ID: <161783530964.3790633.16412468884239960912@swboyd.mtv.corp.google.com>
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
> 
> Stephen, this fix affects the DSI PHY rework. Do we have a chance of
> getting it into 5.12, otherwise there will be a cross-dependency between
> msm-next and clk-next.

Think I can get this into the last fixes PR. One question though, I
think this follows the pattern that things like clk-divider.c use for
devm. Are those also broken?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
