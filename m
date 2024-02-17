Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19FC85906F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 16:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5290810E2F5;
	Sat, 17 Feb 2024 15:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nE7HsySo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECBC10E069;
 Sat, 17 Feb 2024 15:14:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D398C61281;
 Sat, 17 Feb 2024 15:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E663C433F1;
 Sat, 17 Feb 2024 15:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708182898;
 bh=TLjN2HulsLngOJVgAuYf4Pn7GqZqS3+GGjKKcBZ0KkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nE7HsySov90y/vHtMCfJXd23d7y6KBAtm1F4lITB4vg8MBRjnFV0snYu57pS04AHo
 /4GtJZiH7KWwW1kKACjE3hCQSRcfwb9zXVHDpI9D753TxbzIaK4lhFJEtHxBG9n5Cs
 zc5SamBHZXw6g1u5F2JyYpiKNIpsG/XcMtmnzbbiaXsAvHrHx1xsXxqGhXmv+soR+O
 DNBUfMQUqod4rzw4eInf23Mt96swC3oHpbUFe0NtdiEwXmXh0vKjPofCQQYpgqhI33
 lmJj0Mc8dg1t7sOVpEAJzbgnyeeIJ1dL8sGY9i04DZT1pGS/3sw8gjbjI7tLYyIGVx
 6b//0l8cHdAsQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rbMP4-000000001bL-1zG3;
 Sat, 17 Feb 2024 16:14:58 +0100
Date: Sat, 17 Feb 2024 16:14:58 +0100
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: drm/msm: DisplayPort regressions in 6.8-rc1
Message-ID: <ZdDNcrf4KpflGeYQ@hovoldconsulting.com>
References: <ZctVmLK4zTwcpW3A@hovoldconsulting.com>
 <343710b1-f0f4-5c05-70e6-3c221cdc9580@quicinc.com>
 <ZczFhVjHIm55JTfO@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZczFhVjHIm55JTfO@hovoldconsulting.com>
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

On Wed, Feb 14, 2024 at 02:52:06PM +0100, Johan Hovold wrote:
> On Tue, Feb 13, 2024 at 10:00:13AM -0800, Abhinav Kumar wrote:
> 
> > I do agree that pm runtime eDP driver got merged that time but I think 
> > the issue is either a combination of that along with DRM aux bridge 
> > https://patchwork.freedesktop.org/series/122584/ OR just the latter as 
> > even that went in around the same time.
> 
> Yes, indeed there was a lot of changes that went into the MSM drm driver
> in 6.8-rc1 and since I have not tried to debug this myself I can't say
> for sure which change or changes that triggered this regression (or
> possibly regressions).
> 
> The fact that the USB-C/DP PHY appears to be involved
> (/soc@0/phy@88eb000) could indeed point to the series you mentioned.
> 
> > Thats why perhaps this issue was not seen with the chromebooks we tested 
> > on as they do not use pmic_glink (aux bridge).
> > 
> > So we will need to debug this on sc8280xp specifically or an equivalent 
> > device which uses aux bridge.
> 
> I've hit the NULL-pointer deference three times now in the last few days
> on the sc8280xp CRD. But since it doesn't trigger on every boot it seems
> you need to go back to the series that could potentially have caused
> this regression and review them again. There's clearly something quite
> broken here.

Since Dmitry had trouble reproducing this issue I took a closer look at
the DRM aux bridge series that Abhinav pointed and was able to track
down the bridge regressions and come up with a reproducer. I just posted
a series fixing this here:

	https://lore.kernel.org/lkml/20240217150228.5788-1-johan+linaro@kernel.org/

As I mentioned in the cover letter, I am still seeing intermittent hard
resets around the time that the DRM subsystem is initialising, which
suggests that we may be dealing with two separate DRM regressions here
however.

If the hard resets are triggered by something like unclocked hardware,
perhaps that bit could this be related to the runtime PM rework?

Johan
