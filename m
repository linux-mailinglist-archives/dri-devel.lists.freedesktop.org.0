Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEA985B4AA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 09:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC3A10E19C;
	Tue, 20 Feb 2024 08:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hWAqPqIF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFC410E19C;
 Tue, 20 Feb 2024 08:14:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D89F8CE140C;
 Tue, 20 Feb 2024 08:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A99C433F1;
 Tue, 20 Feb 2024 08:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708416841;
 bh=KMaiaCUm3bZGBK7I5/F1KQ3UkBMCQjLFXyGs6MrrrZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hWAqPqIFYAZcp/X5cbUN4fXO8zQJX/f6D4UJtzxFT6y6m5gyG3oKuoyLyKCf6r6Np
 bHxHY+ewlI5Loa2rf5avoXxV7CrD6+ALSzIiHSWDVhHYjfzr8O7AlZOYCQ+5MF7fqv
 5avMiRaq3S3N4IBGWssZdSlZbpiZED8r8rwXL3dA/xuPMaO3XXoym7jDw5qlYD75+r
 qTCuA0UYbEVEQ/dDDyvoTExr1WLTNadhOWBz6MI+2wm5we1NzvkYcklutzMXfXStn5
 qRtBEHp4ZmitTxwcP/I3jc0w5avu3ifpbqNlHzrJDtbU055PBcjgSF0W1JJZxS9Vnc
 7ap2cwluTBrzw==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rcLGJ-000000002QZ-0PDo;
 Tue, 20 Feb 2024 09:13:59 +0100
Date: Tue, 20 Feb 2024 09:13:59 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Wire up tlb ops
Message-ID: <ZdRfR3xqYIYNISbL@hovoldconsulting.com>
References: <20240213172340.228314-1-robdclark@gmail.com>
 <Zc2-qVd0gtErdbKe@hovoldconsulting.com>
 <CAF6AEGsPojmqDgMZWrEAm_CoWGZ05euc0jzD5+9aX0cXQha_ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsPojmqDgMZWrEAm_CoWGZ05euc0jzD5+9aX0cXQha_ew@mail.gmail.com>
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

On Thu, Feb 15, 2024 at 07:28:53AM -0800, Rob Clark wrote:
> On Wed, Feb 14, 2024 at 11:34 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Tue, Feb 13, 2024 at 09:23:40AM -0800, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > The brute force iommu_flush_iotlb_all() was good enough for unmap, but
> > > in some cases a map operation could require removing a table pte entry
> > > to replace with a block entry.  This also requires tlb invalidation.
> > > Missing this was resulting an obscure iova fault on what should be a
> > > valid buffer address.
> > >
> > > Thanks to Robin Murphy for helping me understand the cause of the fault.
> > >
> > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > Fixes: b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")
> >
> > Sounds like you're missing a
> >
> > Cc: stable@vger.kernel.org
> >
> > here? Or is there some reason not to backport this fix (to 5.9 and later
> > kernels)?
> 
> No reason, I just expected the Fixes tag was sufficient

No, you should still mark patches intended for stable with an explicit
CC-stable tag (as per the documentation).

The fact that Sasha and his AI tries to catch fixes which the author and
maintainer failed to tag as a fallback should not be relied upon. It
also makes it harder for the stable team and others to determine what
the intention with a fix was.

Johan
