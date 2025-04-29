Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421B6AA0998
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 13:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B38210E43A;
	Tue, 29 Apr 2025 11:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hz4du+ZY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FE910E439;
 Tue, 29 Apr 2025 11:31:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 944EF5C59EB;
 Tue, 29 Apr 2025 11:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9CAC4CEE3;
 Tue, 29 Apr 2025 11:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745926311;
 bh=BvpiRLn5q1zqS0ANt0tunGv+6IDfRdLg0j1ztQdGuEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hz4du+ZYhItBH+pEiMVkEqulI3w44ZFoSVpduuKNU5Z31A2GbjpT38SI275Is2IGf
 ctDOuoST6jACwtITo9MNGV3EQSj3NyCmq2Ge6tgJxIzlaCCI66370eTSxacfUpzmB7
 bbP2EjVnOz8cvz+KDZd0mVZcROXDbCIRq9OISQOnbDrWvP2MIkpnlC1FaJjRJU4qIY
 Etq/ThOSK6w7oE+e8Pk3c7fixwoYqBz97EeUa4QJeN7Xv6ZKIg6yfv4aT9dLhtQqKH
 E3iOyy4o9ayi49TvMcynaNrWa7+qEVybDGm0Zx2O2x5CfT0QXH0e2FRYKgBxeLnHP9
 JoeUuoZQaeo/g==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1u9jBp-000000003qx-1r60;
 Tue, 29 Apr 2025 13:31:53 +0200
Date: Tue, 29 Apr 2025 13:31:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aBC4qS0fx61qJxkh@hovoldconsulting.com>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
 <aBB-gl150GVaZPn5@hovoldconsulting.com>
 <aBCE3wSG2g5pp7jg@linaro.org>
 <aBCH4oo7dbG8ajvP@hovoldconsulting.com>
 <CAMcHhXrDEVrM4fEyMwZ9TDgqgY=s_mTcKZMacCoUuZ2fa8FhWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXrDEVrM4fEyMwZ9TDgqgY=s_mTcKZMacCoUuZ2fa8FhWg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 29, 2025 at 12:57:16PM +0200, Aleksandrs Vinarskis wrote:
> On Tue, 29 Apr 2025 at 10:03, Johan Hovold <johan@kernel.org> wrote:
> > On Tue, Apr 29, 2025 at 10:50:55AM +0300, Abel Vesa wrote:
> > > On 25-04-29 09:23:46, Johan Hovold wrote:

> > > > But this is the crux; does any off-board LTTPRs in transparent mode add
> > > > to the count or not? If they don't, how would you ever learn that there
> > > > are any LTTPRs? If they do, it seems we may have a problem here.
> > >
> > > Count gets increased either way. It doesn't matter if they are in
> > > transparent mode or not.
> >
> > Thanks for confirming. So then it seems we do have a problem as since
> > 6.15-rc1 drm_dp_lttpr_init() will switch all LTTPRs to non-transparent
> > mode.
> 
> In this case, let me add Fixes to the entire series. Do you think we
> could land it in 6.15-rcX then?

That's for the msm drm maintainers to answer. It should be possible, and
if we agree (or could confirm) that this breaks existing setups then
this needs to be addressed before 6.15 final is out in some way.

Note that you'd need to rebase on rc4 which doesn't have that return
value rework that's in msm-next.

> The second option proposed to roll
> back current LTTPR support and wait until 6.16 will completely break
> DP output on all X1E, so it's very undesirable.

Right, but it wasn't enabled until 6.15-rc1 so that's technically not a
regression (i.e. since 6.14). Essentially, we'd only wait with enabling
DP for another cycle (and I believe DT changes to enable this never made
it into 6.15 either for most laptops anyway).

> This series was tested quite a bit on at least the X1E/X1P devices,
> both with and without docking stations, as it is also (v2 iirc) part
> of Ubuntu's concept tree since little over a month ago. You have
> confirmed that x13s also works with this change but without a docking
> station. If someone could confirm that x13s with this change does work
> with a docking station as well, it would be safe to merge the entire
> series as fix to 6.15, correct? I could reach out on #aarch64-laptops,
> perhaps someone has both x13s (or another qcom-based non X1(E) device)
> and a docking station.

If it fixes a regression then I would merge it for 6.15.

Johan
