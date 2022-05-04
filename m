Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAF751A119
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 15:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B435B10ECB7;
	Wed,  4 May 2022 13:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A957410EC12;
 Wed,  4 May 2022 13:38:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E0FCFB825A3;
 Wed,  4 May 2022 13:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5F6C385A5;
 Wed,  4 May 2022 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651671514;
 bh=ms/oyRGQxDUqaugdsNOsAi79kIujYMIoaULc56D4HJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LchARCrM+yDW/NerV1t8xe7pnaIovw2oFSNkkLYo9oUtUXSfRWqDB2TYRefaPA2Zg
 YGu5CEW36YhNDNpRa8Hv5PlReBOZrYwK1KQZjgNfdFMDetseIpLHvIL4NXsFxfjtKS
 fxIVSIZhRDjaEWjhfMXtHc0ktN+o0WTvbxBMgtSDBVp6LGS6/tp2MzlQ6+e68zXBIF
 bUs8vjWNpaxtdLag2nb5tYHRZmr2/L1LZaOqlWY0QPNNtMyAbi8zfc1RYL/W0oULy2
 OrPAxkZn6RrpTOcWJdWsI0GNdLRvgUjta7T7jsa0NhB3D4kykSvqQ8ORcAJzoVKoxG
 hon7XlT0qqEwA==
Date: Wed, 4 May 2022 19:08:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2] drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
Message-ID: <YnKB1nYLSVUSbSUJ@matsya>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <02114b24-f954-f145-4918-01cc3def65ac@linaro.org>
 <20220501204102.3xijmadbcrxwyu3x@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220501204102.3xijmadbcrxwyu3x@SoMainline.org>
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01-05-22, 22:41, Marijn Suijten wrote:
> On 2022-04-30 22:28:42, Dmitry Baryshkov wrote:
> > On 30/04/2022 21:58, Marijn Suijten wrote:
> > > On 2022-04-30 20:55:33, Dmitry Baryshkov wrote:
> > >> The downstream uses read-modify-write for updating command mode
> > >> compression registers. Let's follow this approach. This also fixes the
> > >> following warning:
> > >>
> > >> drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 'reg_ctrl' set but not used [-Wunused-but-set-variable]
> > >>
> > >> Reported-by: kernel test robot <lkp@intel.com>
> > >> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > 
> > > I pointed this out in review multiple times, so you'll obviously get my:
> > 
> > I think I might have also pointed this out once (and then forgot to 
> > check that the issue was fixed by Vinod).
> > 
> > > 
> > > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > 
> > > (But are you sure there's nothing else to clear in the 1st CTRL
> > > register, only the lowest 16 bits?  That should mean `reg` never
> > > contains anything in 0xffff0000)
> > 
> > Judging from the downstream the upper half conains the same fields, but 
> > used for other virtual channel. I didn't research what's the difference 
> > yet. All the dtsi files that I have here at hand use 
> > 'qcom,mdss-dsi-virtual-channel-id = <0>;'
> 
> As replied to Abhinav I'm simply asking whether we should be strict
> and add `reg & 0xffff` to prevent accidentally writing the top 16 bits,
> which are stream 1.  It doesn't seem like the current code can hit that
> though, with all the macros using masks internally already; but it's

Since the macros were used I skipped setting that up explictly...

> still a little scary since we're assuming the registers for VIDEO are
> identical to CMD (as mentioned in the reply to Abhinav: I wonder if it's

The documentation seems to indicate they are similar and that is the
reason, I merged the code paths and set different registers required for
video and cmd modes

-- 
~Vinod
