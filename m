Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4A2AA0451
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 09:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C41B10E328;
	Tue, 29 Apr 2025 07:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iqKvPj8O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9BF10E2E8;
 Tue, 29 Apr 2025 07:23:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 08C695C271E;
 Tue, 29 Apr 2025 07:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75B2C4CEE3;
 Tue, 29 Apr 2025 07:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745911425;
 bh=GTvBB4cqcEPZCXZA2x2a6SH8nj7EOHN48+b8FpTOeNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iqKvPj8O4qVO7NAKLAzFUKorShtpffTEeisaeaG1sJFtQPmuuqCIJbolqelu3paHJ
 ngdfBMDzhssstj5OAoiuzE2KK7go4hHXxVxGHYKh/l3TqOKi0EtnUbM7BdGWmWwOUj
 TeI1h9HK+c2rVx1Xkz29cNnhY4o6SmoyHlEZQpveeDm+wxi7/dU56eSWgONctqVqLX
 3hLRgEJca8mnMTFoXp+2WvoHcO2tzxA2j1IiI7R/nPbCZ1TD2RZdKNVmFK//6xbfTr
 DAUABO0pOPAtSGzZ4WbjVdID4zWzlaHfFYMF+GR0mFiCGFksM0GaT1dMPoLZ/pVq98
 R4HFx2Ty1i9EQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1u9fJi-000000004MS-2Cgi;
 Tue, 29 Apr 2025 09:23:47 +0200
Date: Tue, 29 Apr 2025 09:23:46 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aBB-gl150GVaZPn5@hovoldconsulting.com>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA+N8YHX0DZ6h9Uj@linaro.org>
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

On Mon, Apr 28, 2025 at 05:17:21PM +0300, Abel Vesa wrote:
> On 25-04-28 14:47:04, Johan Hovold wrote:
> > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> > > > On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> > > > > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > > > > to non-transparent mode to enable video output on X1E-based devices
> > > > > that come with LTTPR on the motherboards. However, video would not work
> > > > > if additional LTTPR(s) are present between sink and source, which is
> > > > > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > > > > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
> > > >
> > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > adapters or docks with retimers in transparent mode?

> > > Docks with retimers do not work in 6.15-rcX, but I am unable to verify
> > > if it did work before, as I do not have a Qualcomm based device
> > > without LTTPR on the baseboard.
> > 
> > Abel (or anyone else), do you have one of these docks that you could
> > test with the X13s to confirm whether this series fixes a regression or
> > not?
> 
> Before the support for LTTPRs has been merged, if you would have one of
> those docks (I do not own one) with LTTPRs, link training would've just
> failed if the LTTPRs were not by default in transparent mode, which IIRC
> is what the standard dictates.

Ok, but my concern is if they may have worked in a default transparent
mode.

> X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> would return 0 and none of the of the transparent/non-transparent setup
> would happen.

But this is the crux; does any off-board LTTPRs in transparent mode add
to the count or not? If they don't, how would you ever learn that there
are any LTTPRs? If they do, it seems we may have a problem here.

Johan
