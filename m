Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62753357811
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 00:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564826E9A8;
	Wed,  7 Apr 2021 22:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA36A6E103
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 22:57:13 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id i19so43088qtv.7
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Apr 2021 15:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hRs+CscktAAF86xhY4f4Gc+d+jTkYYtuzHlchmkbnGo=;
 b=DfQ8LfVYvhwJp3KWDRqYgmqB9J2punZRzzRcoTUoQjh3+MbEDBCELLIEcQYM8gDRxs
 2pLMt/ikmgNZjPORvJIzHWot8kz9+TBZSpXZc6dQQ18sj/XSWiYSSPQ13oXew7L4GVoR
 CEgfP0L86Z9Hho/7GGcm952dR4VN5jK7iDHAweRaOEnbuMvt2GICHE8X8lmcswsiAzdJ
 ykQj4d1u5EDW/WC4CBfUAUBa+IPmmYpet/uhQRZiOeFnOUxFDWAbi5Na/PyjSgoPup8L
 Goxqa5RSRF3R7m167JYmZGo1zEzkEBUDoJBUpD3kZwwCJIwetdzoGS1NiHaPoJL4vzbi
 RzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hRs+CscktAAF86xhY4f4Gc+d+jTkYYtuzHlchmkbnGo=;
 b=pm9H9LBwB6hubYDCDPbIA/M35WfZMeC2dVnJ8BthatLdw9fsfVrBAmNtsVa18G0/Ei
 CptTBIsznoQdJZIrgbZjsciVhmIBPPx8dScKywia+teqTWJ/GjojIa9AOsAfUiJ6iTJ6
 Lqp3WTDIzwwQvxUg3GECYQK2Qmq0xhBmD0hSV+yql3FTBSPeq2mSCd3Fhv0djO3jQxkt
 0WMyekeI4RLzzJJnABDClnZ980UJ1PuVP5KHtiRsPi0zhzgprAr4df8cFVI0zIpB97nx
 CMkxa0Po+5AEI9351oxg4du/Ny/dX4BIHYs/TyAaL/cIL9g3821dPeRiCW+GL8CpZD7n
 qm9g==
X-Gm-Message-State: AOAM5326K6gg27lpSUCb8dR0l8KOXXcg+jDFiz3Z3DmMlRTrENdF5voJ
 8zlvGDEE+jJmO6/6eKd7enuxagvbyTtOrWkAqpqufA==
X-Google-Smtp-Source: ABdhPJwL88K+C5x/fkGrHo0TqiM6J9CldMCEqdVeQBU6fBx7RyibSpm1pEKspE22YHyKc4R0qTegCJgblL8XYRbbO3I=
X-Received: by 2002:ac8:d4d:: with SMTP id r13mr364364qti.298.1617836232951;
 Wed, 07 Apr 2021 15:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
 <161783530964.3790633.16412468884239960912@swboyd.mtv.corp.google.com>
In-Reply-To: <161783530964.3790633.16412468884239960912@swboyd.mtv.corp.google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 8 Apr 2021 01:57:01 +0300
Message-ID: <CAA8EJppsM1sP=OTiMY8jsLLgU=+p3qgZDD7M+M5naJhfFEF_Zg@mail.gmail.com>
Subject: Re: [PATCH] clk: fixed: fix double free in resource managed
 fixed-factor clock
To: Stephen Boyd <sboyd@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Daniel Palmer <daniel@0x0f.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 8 Apr 2021 at 01:41, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-04-06 16:06:06)
> > devm_clk_hw_register_fixed_factor_release(), the release function for
> > the devm_clk_hw_register_fixed_factor(), calls
> > clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> > after that the devres functions will also kfree the allocated data,
> > resulting in double free/memory corruption. Just call
> > clk_hw_unregister() instead, leaving kfree() to devres code.
> >
> > Reported-by: Rob Clark <robdclark@chromium.org>
> > Cc: Daniel Palmer <daniel@0x0f.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > Stephen, this fix affects the DSI PHY rework. Do we have a chance of
> > getting it into 5.12, otherwise there will be a cross-dependency between
> > msm-next and clk-next.
>
> Think I can get this into the last fixes PR. One question though, I
> think this follows the pattern that things like clk-divider.c use for
> devm. Are those also broken?

It looks so. See e.g. the devres_release() function. It calls
(*release) callback, then it will kfree the resource.
Also see Documentation/driver-api/driver-model/devres.rst, which does
not kfree() in release functions.

Do you wish for me to send all the fixes?



-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
