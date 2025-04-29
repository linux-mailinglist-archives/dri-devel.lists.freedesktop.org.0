Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B4EAA052A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 10:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9C610E3B4;
	Tue, 29 Apr 2025 08:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Dz1MO+Di";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6497E10E3AB;
 Tue, 29 Apr 2025 08:03:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 158BB61120;
 Tue, 29 Apr 2025 08:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742C8C4CEE3;
 Tue, 29 Apr 2025 08:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745913825;
 bh=pmshIlvLRAdRvDeLsdcl2kLYHfWtssSEGw+i8OfR21Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dz1MO+DiWtr9y2ztoIPuBon5YwwEoH0xVH+OZfkXRcZzqWoMYZ4YYU0O23F+k95Te
 5y1UAv2PfUvdN1iouu6DcSUFlYD/1B5BuePdepcpHgZeGb9KwohRY7DRaardZOG4uA
 wPrQ0sTcoHvcF/vgHanR7SwrVhFVlRvfWrNvsG962NnmEAMNWv/crVv3vW8hB7URwM
 pVp3AAqDP/JVHWTO/p/oWxgUkhPP0WhJvQZdn+sjT1cBFpYbzQEyhyjZBEPHOcrUm4
 jOjXOsYL75bu3DdLds793KongrHCe5RKYddb7LcQeQpPJACyaEmqShDKg7mwwVJ4CD
 A1PnVEBOxpIAQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1u9fwQ-000000007Pq-3tEE;
 Tue, 29 Apr 2025 10:03:47 +0200
Date: Tue, 29 Apr 2025 10:03:46 +0200
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
Message-ID: <aBCH4oo7dbG8ajvP@hovoldconsulting.com>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
 <aBB-gl150GVaZPn5@hovoldconsulting.com>
 <aBCE3wSG2g5pp7jg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBCE3wSG2g5pp7jg@linaro.org>
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

On Tue, Apr 29, 2025 at 10:50:55AM +0300, Abel Vesa wrote:
> On 25-04-29 09:23:46, Johan Hovold wrote:
> > On Mon, Apr 28, 2025 at 05:17:21PM +0300, Abel Vesa wrote:
> > > On 25-04-28 14:47:04, Johan Hovold wrote:
> > > > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:

> > > > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > > > adapters or docks with retimers in transparent mode?

> > Ok, but my concern is if they may have worked in a default transparent
> > mode.
> 
> But if they are by default in transparent mode, doing the setup to
> transparent mode will not break it in any way.

It looks like it will, see below.

> > > X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> > > would return 0 and none of the of the transparent/non-transparent setup
> > > would happen.
> > 
> > But this is the crux; does any off-board LTTPRs in transparent mode add
> > to the count or not? If they don't, how would you ever learn that there
> > are any LTTPRs? If they do, it seems we may have a problem here.
> 
> Count gets increased either way. It doesn't matter if they are in
> transparent mode or not.

Thanks for confirming. So then it seems we do have a problem as since
6.15-rc1 drm_dp_lttpr_init() will switch all LTTPRs to non-transparent
mode.

Johan
