Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49414552A59
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 06:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C22D10F682;
	Tue, 21 Jun 2022 04:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C01310F682;
 Tue, 21 Jun 2022 04:41:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 22EAD60DF3;
 Tue, 21 Jun 2022 04:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE615C3411D;
 Tue, 21 Jun 2022 04:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655786499;
 bh=nM5Ncu4DzAKAp2OYDGK4cJt8P9gyd3/R9Q7YtZK7zWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s9NLOnL0OUJZ+pCJHDYG1PbLQ5Y20ijxniiK6cmkV+dMc+H7f1VFfbiCDd6H8oeuM
 ZO57bqSvj1amVwI9FFeuAm2GzGh253Rr5ABVZ1MorTNXW6fpcqvS1doU4Z7UWbux1i
 HSAgWuQJxrUu2J9RUD4YSBL090pwIt+q2FUI4gRa0Rsfka97zuwQZcSy4dOK4Kzdz/
 22SzO1L2eOsjdwAt2BpqwPyYfQlSRwCsq9IxvKLqcKw0t+vU6rnGOhlfDVjJ3B9Yf/
 MEHvUh4W1gpCP59ZTv2lMJifen/5lpsdCcpxtiWL7/auFy26xcwlq7jUs2OszGr/7n
 dj28Auekh8tQg==
Date: Tue, 21 Jun 2022 10:11:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v13 0/3] eDP/DP Phy vdda realted function
Message-ID: <YrFL/9Fu/WZXa2EI@matsya>
References: <1653512540-21956-1-git-send-email-quic_khsieh@quicinc.com>
 <YqvEjzgSbvrOCFtq@matsya>
 <6f1ade9f-38b0-827c-667b-5c8018b7779a@quicinc.com>
 <af23976a-11dc-2503-66ea-8558fc1b3108@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af23976a-11dc-2503-66ea-8558fc1b3108@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, bjorn.andersson@linaro.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20-06-22, 13:43, Kuogee Hsieh wrote:
> 
> On 6/20/2022 1:07 PM, Kuogee Hsieh wrote:
> > 
> > On 6/16/2022 5:02 PM, Vinod Koul wrote:
> > > On 25-05-22, 14:02, Kuogee Hsieh wrote:
> > > > 1) add regulator_set_load() to eDP phy
> > > > 2) add regulator_set_load() to DP phy
> > > > 3) remove vdda related function out of eDP/DP controller
> > > > 
> > > > Kuogee Hsieh (3):
> > > >    phy: qcom-edp: add regulator_set_load to edp phy
> > > >    phy: qcom-qmp: add regulator_set_load to dp phy
> > > >    drm/msm/dp: delete vdda regulator related functions from eDP/DP
> > > >      controller
> > > > 
> > > >   drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ------
> > > >   drivers/gpu/drm/msm/dp/dp_parser.h  |  8 ----
> > > >   drivers/gpu/drm/msm/dp/dp_power.c   | 95
> > > > +------------------------------------
> > > >   drivers/phy/qualcomm/phy-qcom-edp.c | 12 +++++
> > > >   drivers/phy/qualcomm/phy-qcom-qmp.c | 40 ++++++++++++----
> > > Please rebase this to phy-next and apply to specific qmp phy driver...
> > I will rebase to ==>
> > https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git
> 
> Hi Vinod,
> 
> Would you please specify exactly procedures i have to do as to rebase this
> patch series to phy=next tree.

Yes pls rebase to above tree and next branch

-- 
~Vinod
