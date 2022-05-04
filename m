Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEF851A0FD
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 15:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387D010EB41;
	Wed,  4 May 2022 13:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AA810EC6B;
 Wed,  4 May 2022 13:36:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B44961967;
 Wed,  4 May 2022 13:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A011C385AF;
 Wed,  4 May 2022 13:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651671358;
 bh=kNhPGoxLldv4gWT0XuX6jvHYFzpnyliDly+8z7ipYrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O7HGc+qHGOavR+BgNIiQSJiHOHhLG5MVP5Y8Qrq4ZrqIEjGRHh0qFXgWWYafDK8nd
 VNn9im1zQnjGfyjvT2xqk15nRAEQ6hQB6rerYBBEhC38wZBprNKpA8CtVgi98NZHan
 Txovb+Y58HFsh3aWAYoArlNhBXEyghLpcZKLFRAXCaye3ZneFZlMFnhVusyLq6oDEw
 py2egKM4DmY2rJQHLnRWd5MD2LjO5Tdw2yAHiBvPUMs9ZoCqrqSf8YmaqOzDWx7XXy
 UdoWM02XJwMRF+f2wQj/D4X+LYyFEEM3qBkV7L4/U/GOhLBOQ3Ys2qSrTbOHPVyJqr
 qgJFzX+zIQHOQ==
Date: Wed, 4 May 2022 19:05:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
Message-ID: <YnKBOr1bBXarjQgJ@matsya>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <02114b24-f954-f145-4918-01cc3def65ac@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02114b24-f954-f145-4918-01cc3def65ac@linaro.org>
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30-04-22, 22:28, Dmitry Baryshkov wrote:
> On 30/04/2022 21:58, Marijn Suijten wrote:
> > On 2022-04-30 20:55:33, Dmitry Baryshkov wrote:
> > > The downstream uses read-modify-write for updating command mode
> > > compression registers. Let's follow this approach. This also fixes the
> > > following warning:
> > > 
> > > drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 'reg_ctrl' set but not used [-Wunused-but-set-variable]
> > > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > I pointed this out in review multiple times, so you'll obviously get my:
> 
> I think I might have also pointed this out once (and then forgot to check
> that the issue was fixed by Vinod).

I think i have tried to reply to all comments, if anything was missed
that would be my mistake..

> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> > (But are you sure there's nothing else to clear in the 1st CTRL
> > register, only the lowest 16 bits?  That should mean `reg` never
> > contains anything in 0xffff0000)
> 
> Judging from the downstream the upper half conains the same fields, but used
> for other virtual channel. I didn't research what's the difference yet. All
> the dtsi files that I have here at hand use
> 'qcom,mdss-dsi-virtual-channel-id = <0>;'

Yes the register description is for STREAM1 in documentation, it is
unclear to me when that can be used

-- 
~Vinod
