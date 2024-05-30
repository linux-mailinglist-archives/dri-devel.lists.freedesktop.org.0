Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4F48D5047
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 18:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B721810E728;
	Thu, 30 May 2024 16:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HwjFQjzh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F6010E12B;
 Thu, 30 May 2024 16:55:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EED88CE1B08;
 Thu, 30 May 2024 16:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350D5C2BBFC;
 Thu, 30 May 2024 16:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717088156;
 bh=y9NCFZ2r7d1RUlF0MdnMJsnplEp0MXxCrVSUOSZQRC4=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=HwjFQjzh27GeUw64vzkp+R2RQfD9cS2BWClNN+muvviU1GUsUzKkxI6aLXiCXvj5O
 6kzm0mkIhqbpis4AUlw5nRtjE2SCflJCCEQAiZka/7S1olX/wppKf/2b8lqO9skDDi
 ExSsfy7wj2x9f6qhRTyKt7UnrmIX1sEjcZhfeblJhcGfsFH+AUF3D0kG8zmswE1oVp
 zOeqfX/u7L0eLHRCNJJI7UQ8uvtEFUtXWiWzDdwzhT0BWyP2cJ3TeJBNKnK2Yhe8hn
 C/Ce7G1Qnd+OSiI4PAtFA6LJCZpYkiYXEbyY2IdVZhTjmimLE+Ffcuw14kYIvlYCDS
 TzI1P3eULcFgQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 32A06CE075F; Thu, 30 May 2024 09:55:55 -0700 (PDT)
Date: Thu, 30 May 2024 09:55:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: sfr@canb.auug.org.au, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Hunter <jonathanh@nvidia.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] Build failure and alleged fix for next-20240523
Message-ID: <4f821c7f-6201-470f-b39d-ba689ca027d9@paulmck-laptop>
References: <287206c0-b53d-4aa1-b35c-0725adc5e9ef@paulmck-laptop>
 <28db820c-860d-be1c-bb94-ed534622fdc8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28db820c-860d-be1c-bb94-ed534622fdc8@quicinc.com>
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

On Fri, May 24, 2024 at 12:57:58PM -0700, Abhinav Kumar wrote:
> Hello
> 
> On 5/24/2024 12:55 PM, Paul E. McKenney wrote:
> > Hello!
> > 
> > I get the following allmodconfig build error on x86 in next-20240523:
> > 
> > Traceback (most recent call last):
> >    File "drivers/gpu/drm/msm/registers/gen_header.py", line 970, in <module>
> >      main()
> >    File "drivers/gpu/drm/msm/registers/gen_header.py", line 951, in main
> >      parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
> > AttributeError: module 'argparse' has no attribute 'BooleanOptionalAction'
> > 
> > The following patch allows the build to complete successfully:
> > 
> > https://patchwork.kernel.org/project/dri-devel/patch/20240508091751.336654-1-jonathanh@nvidia.com/#25842751
> > 
> > As to whether this is a proper fix, I must defer to the DRM folks on CC.
> 
> Thanks for the report.
> 
> I have raised a merge request for
> https://patchwork.freedesktop.org/patch/593057/ to make it available for the
> next fixes release for msm.

Thank you!

This still is not in -next, so I am putting it into -rcu just to silence
the diagnostic.  Or should I push this to mainline via -rcu?

							Thanx, Paul
