Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD358D53F6
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 22:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFFE11A854;
	Thu, 30 May 2024 20:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A/dmQNd+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73C711A854;
 Thu, 30 May 2024 20:40:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7C941CE1B38;
 Thu, 30 May 2024 20:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B775AC2BBFC;
 Thu, 30 May 2024 20:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717101655;
 bh=WnrKe/9pHs5nuVA9Y9cr8+yFs4LEuqdMGeXWbC5IBRY=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=A/dmQNd+wVul3Ok9rrYia9eqQpGIAtHMtr3VwMyZskZiiJGxI9+1iTTaXt2+GV2ny
 rfSwaYzND+LspQW3M1xP2YlLvJOzHtFcsDOhMl9596b4cecPJnsaTYwJa5WgeVYKnN
 17Xiu8kTZxTw1s2CN+7fgE8w1+mNtokEVyOHEmFpbgjlFtnMhjGYk3xaf8UEC6rTI5
 qXWyDCJTxHp6fzAwtQbzSqZ9TwG12Z9nORp6nlD07CAxbUBhPc7l/RV+z2CNMC05km
 8JZ2AhBZV2hQPmLZdMCPtnyzZQ3mD5g7AUzBCicP/qmNfDZqUl+hNHEfhauRobbzDp
 7/d1kyIAWAJ7A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 03FC5CE095C; Thu, 30 May 2024 13:40:55 -0700 (PDT)
Date: Thu, 30 May 2024 13:40:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, sfr@canb.auug.org.au,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Hunter <jonathanh@nvidia.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] Build failure and alleged fix for next-20240523
Message-ID: <72a4d07d-3ac8-4c39-8501-b3f93a26654a@paulmck-laptop>
References: <287206c0-b53d-4aa1-b35c-0725adc5e9ef@paulmck-laptop>
 <28db820c-860d-be1c-bb94-ed534622fdc8@quicinc.com>
 <4f821c7f-6201-470f-b39d-ba689ca027d9@paulmck-laptop>
 <D1N6WYWR463J.3UVC2PP2CUIY4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D1N6WYWR463J.3UVC2PP2CUIY4@gmail.com>
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
Reply-To: paulmck@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 30, 2024 at 08:28:17PM +0200, Thierry Reding wrote:
> On Thu May 30, 2024 at 6:55 PM CEST, Paul E. McKenney wrote:
> > On Fri, May 24, 2024 at 12:57:58PM -0700, Abhinav Kumar wrote:
> > > Hello
> > > 
> > > On 5/24/2024 12:55 PM, Paul E. McKenney wrote:
> > > > Hello!
> > > > 
> > > > I get the following allmodconfig build error on x86 in next-20240523:
> > > > 
> > > > Traceback (most recent call last):
> > > >    File "drivers/gpu/drm/msm/registers/gen_header.py", line 970, in <module>
> > > >      main()
> > > >    File "drivers/gpu/drm/msm/registers/gen_header.py", line 951, in main
> > > >      parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
> > > > AttributeError: module 'argparse' has no attribute 'BooleanOptionalAction'
> > > > 
> > > > The following patch allows the build to complete successfully:
> > > > 
> > > > https://patchwork.kernel.org/project/dri-devel/patch/20240508091751.336654-1-jonathanh@nvidia.com/#25842751
> > > > 
> > > > As to whether this is a proper fix, I must defer to the DRM folks on CC.
> > > 
> > > Thanks for the report.
> > > 
> > > I have raised a merge request for
> > > https://patchwork.freedesktop.org/patch/593057/ to make it available for the
> > > next fixes release for msm.
> >
> > Thank you!
> >
> > This still is not in -next, so I am putting it into -rcu just to silence
> > the diagnostic.  Or should I push this to mainline via -rcu?
> 
> I pushed this to drm-misc-fixes earlier today, so should show up in
> linux-next soon and hopefully in v6.10-rc2.

Thank you, Thierry!

							Thanx, Paul
