Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8159A9F149
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 14:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2519510E4B6;
	Mon, 28 Apr 2025 12:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="evPeBLpa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A21310E4A5;
 Mon, 28 Apr 2025 12:47:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2F5866115B;
 Mon, 28 Apr 2025 12:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B601CC4CEEE;
 Mon, 28 Apr 2025 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745844424;
 bh=HsH8nSf/ZGhRZOeMHnaNQznU6FZlvjFFRODGQYmj+JY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=evPeBLpaoctrC5GT63OrxExzUsjgpxglDn0tp5Lk8sirEe7wne4kUoXS8RapfZ3Sl
 PDaO/2qt4VKJhE5rskd5h2CAlBlSniCYmN19BMYrch4HLuQYHBx6a+UFh6NLXuEgj8
 8sAeKb9tPeVHSJgLGxAPENU8bPkh/5cQQsGvx1qUWxZjfRxXL3YVoLhIhOrhQg9wl7
 Osm9FTUWcRiM5N1b7Y3JAQcf9CVdqiMDM8VCAQfzMgo3nln0KS4+qOMJUYRfSxEQWJ
 /fXC0xTXBPy9ko+uu/Dp1GG13ch0vhXPf+yGhnagiopkwzn4n4XCUA0RXKE5dYC4A5
 mezPocQXwjeDQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1u9Nt2-000000004Gi-3jfr;
 Mon, 28 Apr 2025 14:47:05 +0200
Date: Mon, 28 Apr 2025 14:47:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aA94yOjsayZHNDpx@hovoldconsulting.com>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
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

On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> > On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> > > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > > to non-transparent mode to enable video output on X1E-based devices
> > > that come with LTTPR on the motherboards. However, video would not work
> > > if additional LTTPR(s) are present between sink and source, which is
> > > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
> >
> > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > adapters or docks with retimers in transparent mode?
> 
> I am actually not 100% sure.
> - If without LTTPR initialization, they default to transparent mode,
> then yes, incomplete LTTPR support sets them to non-transparent
> without per-segment training and breaks docks with retimers, while it
> would've worked if LTTPR(s) would've been left in default transparent
> mode. Note that in this case, X1E devices with ps883x are somehow an
> exception, because without LTTPR initialization at all the training
> always fails.

Right, I'm concerned about breaking working setups for users of machines
like the X13s.

> - If LTTPR has to be initialized either way, and explicitly set to
> transparent mode if we do not want non-transparent, then no,
> incomplete LTTPR support in 6.15-rcX did not explicitly break docks
> with retimers, as those never worked in the first place. As per my
> understanding, this is the case, unless something (firmware?) has
> already placed LTTPR to transparent mode before the driver takes over
> - then 1st case would be applicable.
> 
> Docks with retimers do not work in 6.15-rcX, but I am unable to verify
> if it did work before, as I do not have a Qualcomm based device
> without LTTPR on the baseboard.

Abel (or anyone else), do you have one of these docks that you could
test with the X13s to confirm whether this series fixes a regression or
not?

> > You describe at least one of this patches as a fix but I'm not seeing
> > any Fixes tags or indication that these need to go into 6.15-rc to fix
> > a regression.
> 
> You are right, I will add Fixes tag to the 1st patch to make it clear:
> Fixes 72d0af4accd (drm/msm/dp: Add support for LTTPR handling)
> 
> Or should I mark the entire series with Fixes, so that the docking
> stations with retimers can be fixed in 6.15 already? Landing only the
> 1st patch will fix inconsistency with DP spec, but will not fix
> docking stations with retimers. I guess this comes down to whether
> existing LTTPR (but not multiple LTTPRs) support is considered a bug
> (and patches 2,3,4 are a fix) or lack of functionality (and patches
> 2,3,4 are a new feature).

Indeed. If LTTPR support broke existing setups, then I think all should
be marked with a Fixes tag and merged for 6.15. If we can't get it into
6.15 we may consider just disabling LTTPR support in 6.15 to address the
regression and then enable it again once fixed in 6.16.

But if this series is just enabling support for docks (and USB-C ports)
that did not used to work, then I guess this can all wait for 6.16.

Johan
