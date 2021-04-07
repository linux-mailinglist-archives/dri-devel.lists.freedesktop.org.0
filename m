Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F00357883
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 01:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43316E9BB;
	Wed,  7 Apr 2021 23:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A462F6E9B9;
 Wed,  7 Apr 2021 23:27:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AABC611C9;
 Wed,  7 Apr 2021 23:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617838034;
 bh=5cQuER9fmc8fHAwXS8iEloQ3JTxyDIMqjDHmBWLnXl0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=PBOh8ip9/zbP5hdMG6IH1fQDPFqXLrfClhSqsPqTcEnnzJ/uZiLO7WZDYJJRYb5ht
 45aHyqPjQwTJKXXVSWfyKYrK0cERH1BMo4jIp7iG0t31eoIAugTLtxleiusKiyxO1q
 OC6TcmDOduW3Jl7s8ss5WzESRlWvmEekrwmbsexHBlberXmWPG9b0F0kfzkxm9/Hrz
 CujlpQYi0Fg/6bi3PE81l2hhCHC7bS3T2aISXcTzckilZguH1bH91gShNMn7Ae/hpH
 XAAL8ZGViNo3N3t/jWa5E52Vvb//0PnYj8RBbnzFd8ly0OLoul4wA1lm024tBn+rg7
 cWRXQiq4ARzwA==
MIME-Version: 1.0
In-Reply-To: <CAA8EJppsM1sP=OTiMY8jsLLgU=+p3qgZDD7M+M5naJhfFEF_Zg@mail.gmail.com>
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
 <161783530964.3790633.16412468884239960912@swboyd.mtv.corp.google.com>
 <CAA8EJppsM1sP=OTiMY8jsLLgU=+p3qgZDD7M+M5naJhfFEF_Zg@mail.gmail.com>
Subject: Re: [PATCH] clk: fixed: fix double free in resource managed
 fixed-factor clock
From: Stephen Boyd <sboyd@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 07 Apr 2021 16:27:13 -0700
Message-ID: <161783803315.3790633.10829887417379757624@swboyd.mtv.corp.google.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 DRM DRIVER FOR MSM ADRENO GPU <linux-arm-msm@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Daniel Palmer <daniel@0x0f.com>,
 DRM DRIVER FOR MSM ADRENO GPU <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 COMMON CLK FRAMEWORK <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2021-04-07 15:57:01)
> On Thu, 8 Apr 2021 at 01:41, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2021-04-06 16:06:06)
> > > devm_clk_hw_register_fixed_factor_release(), the release function for
> > > the devm_clk_hw_register_fixed_factor(), calls
> > > clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> > > after that the devres functions will also kfree the allocated data,
> > > resulting in double free/memory corruption. Just call
> > > clk_hw_unregister() instead, leaving kfree() to devres code.
> > >
> > > Reported-by: Rob Clark <robdclark@chromium.org>
> > > Cc: Daniel Palmer <daniel@0x0f.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >
> > > Stephen, this fix affects the DSI PHY rework. Do we have a chance of
> > > getting it into 5.12, otherwise there will be a cross-dependency between
> > > msm-next and clk-next.
> >
> > Think I can get this into the last fixes PR. One question though, I
> > think this follows the pattern that things like clk-divider.c use for
> > devm. Are those also broken?
> 
> It looks so. See e.g. the devres_release() function. It calls
> (*release) callback, then it will kfree the resource.
> Also see Documentation/driver-api/driver-model/devres.rst, which does
> not kfree() in release functions.
> 
> Do you wish for me to send all the fixes?
> 

Yes please send more fixes. They're not high priority though so I'll
probably leave them to bake in next for a week or so.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
