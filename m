Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F9A70EEC2
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 08:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398EF10E57C;
	Wed, 24 May 2023 06:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C35410E046;
 Wed, 24 May 2023 06:59:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 55C79626BE;
 Wed, 24 May 2023 06:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A14C433EF;
 Wed, 24 May 2023 06:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684911589;
 bh=EGxKW0ENE1SqUGUsYp+MnGqiOllxXX1HxcX9JCZtn/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pFFnpgTWz0mFlcM7EiCO4wqhXZSoxWvo5e6iAqou8ivxTUOcgv3tRwJhDekhFPmWL
 O0tdDOMhV8UqOQvPqsRiBdPsaZpFEpva03kuZW/udlzFBVPDk9C+6wmhT+i3Km8yA4
 h1tCHUMQpW1WDMjaNx45ejnB17QToaDeknC6B0Oww6UiSVYGKXHrS/JEmbZj6vGA9o
 znEOfH9UGHM5jjj4sYzkusaFY45cw4ZONwjdicCO+qHGAYlJJ831mIfUX9Tmid3ydR
 JSHRVsVE3Cg9kPOHZbZs+svQGuzOJbejGJ6Dk+94IW9wKNIMRi81ZIk3Qc0SIwFD6g
 HioNUMDijK0nA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1q1iTS-0003FU-8Y; Wed, 24 May 2023 08:59:55 +0200
Date: Wed, 24 May 2023 08:59:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] drm/msm/dp: add module parameter for PSR
Message-ID: <ZG216qoxK9hQ-kQs@hovoldconsulting.com>
References: <20230427232848.5200-1-quic_abhinavk@quicinc.com>
 <053819bd-b3c4-a72c-9316-85d974082ad6@linaro.org>
 <ZGzalLjTvUfzEADU@hovoldconsulting.com>
 <f530691b-989d-b059-6b06-e66abb740bdb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f530691b-989d-b059-6b06-e66abb740bdb@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 quic_jesszhan@quicinc.com, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 12:23:04PM -0700, Abhinav Kumar wrote:
> On 5/23/2023 8:24 AM, Johan Hovold wrote:
> > On Fri, May 12, 2023 at 09:13:04PM +0300, Dmitry Baryshkov wrote:
> >> On 28/04/2023 02:28, Abhinav Kumar wrote:
> >>> On sc7280 where eDP is the primary display, PSR is causing
> >>> IGT breakage even for basic test cases like kms_atomic and
> >>> kms_atomic_transition. Most often the issue starts with below
> >>> stack so providing that as reference
> >>>
> >>> Call trace:

> >>> ---[ end trace 0000000000000000 ]---
> >>> [drm-dp] dp_ctrl_push_idle: PUSH_IDLE pattern timedout
> >>>
> >>> Other basic use-cases still seem to work fine hence add a
> >>> a module parameter to allow toggling psr enable/disable till
> >>> PSR related issues are hashed out with IGT.
> >>
> >> For the reference: Bjorn reported that he has issues with VT on a
> >> PSR-enabled laptops. This patch fixes the issue for him
> > 
> > Module parameters are almost never warranted, and it is definitely not
> > the right way to handle a broken implementation.
> > 
> > I've just sent a revert that unconditionally disables PSR support until
> > the implementation has been fixed:
> > 
> > 	https://lore.kernel.org/lkml/20230523151646.28366-1-johan+linaro@kernel.org/
> 
> I dont completely agree with this. Even the virtual terminal case was 
> reported to be fixed by one user but not the other. So it was probably 
> something missed out either in validation or reproduction steps of the 
> user who reported it to be fixed OR the user who reported it not fixed. 
> That needs to be investigated now.

Yes, there may still be some time left to fix it, but it's pretty damn
annoying to find that an issue reported two months ago still is not
fixed at 6.4-rc3. (I even waited to make the switch to 6.4 so that I
would not have to spend time on this.)

I didn't see any mail from Bjorn saying that the series that claimed to
fix the VT issue actually did fix the VT issue. There's only the comment
above from Dmitry suggesting that disabling this feature is the only way
to get a working terminal back.

Regressions happen and sometimes there are corner cases that are harder
to find, but this is a breakage of a fundamental feature that was
reported before the code was even merged into mainline.

> We should have ideally gone with the modparam with the feature patches 
> itself knowing that it gets enabled for all sinks if PSR is supported.

Modparams are things of the past should not be used to enable broken
features so that some vendor can tick of their internal lists of
features that have been "mainlined".

You can carry that single patch out-of-tree to enable this if you need
it for some particular use case where you don't care about VTs.

But hopefully you can just get this sorted quickly. If not, the revert I
posted is the way to go rather than adding random module parameters.

Johan
