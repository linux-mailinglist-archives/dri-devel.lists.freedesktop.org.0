Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AF81AAFFA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 19:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3DA6EA4E;
	Wed, 15 Apr 2020 17:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F466EA4E;
 Wed, 15 Apr 2020 17:44:32 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B8A472051A;
 Wed, 15 Apr 2020 17:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586972672;
 bh=ar+BseC/NUaksDxsNT8Js037zkG7MGCUU7MyLp15PF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WuP7E8ug4V4q3A4Wg8x0XzHqcW34rw7cTsV2U3f59ayerrH6TXzUJ2k62aOz9KZDF
 ctWUPcHDLB8wmwcuVOAVqcB6D4brPBrycDzLN7nhJcsyGmcXp6ZxcPFPK6daEnd/XO
 m0fzm/ee2QVsCtBGOWQCKXkOz6Yp6rHWjvQIjhfQ=
Date: Wed, 15 Apr 2020 19:44:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH v2] drm/etnaviv: rework perfmon query infrastructure
Message-ID: <20200415174430.GA3665836@kroah.com>
References: <20200228103752.1944629-1-christian.gmeiner@gmail.com>
 <4a5436201ff4345194f64aac1553f9656887203a.camel@pengutronix.de>
 <CA+G9fYvVC8TYk1u-B98MvABqQUuG6hEB6Y7AYd0Qnzs0=-pFUw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYvVC8TYk1u-B98MvABqQUuG6hEB6Y7AYd0Qnzs0=-pFUw@mail.gmail.com>
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
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>,
 lkft-triage@lists.linaro.org, open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 11:08:13PM +0530, Naresh Kamboju wrote:
> On Tue, 3 Mar 2020 at 17:19, Lucas Stach <l.stach@pengutronix.de> wrote:
> >
> > On Fr, 2020-02-28 at 11:37 +0100, Christian Gmeiner wrote:
> > > Report the correct perfmon domains and signals depending
> > > on the supported feature flags.
> > >
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > Fixes: 9e2c2e273012 ("drm/etnaviv: add infrastructure to query perf counter")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> >
> > Thanks, applied to etnaviv/next.
> >
> > Regards,
> > Lucas
> >
> > >
> > > ---
> > > Changes V1 -> V2:
> > >   - Handle domain == NULL case better to get rid of BUG_ON(..) usage.
> > > ---
> > >  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 59 ++++++++++++++++++++---
> > >  1 file changed, 52 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > > index 8adbf2861bff..e6795bafcbb9 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > > @@ -32,6 +32,7 @@ struct etnaviv_pm_domain {
> > >  };
> > >
> > >  struct etnaviv_pm_domain_meta {
> > > +     unsigned int feature;
> > >       const struct etnaviv_pm_domain *domains;
> > >       u32 nr_domains;
> > >  };
> > > @@ -410,36 +411,78 @@ static const struct etnaviv_pm_domain doms_vg[] = {
> > >
> > >  static const struct etnaviv_pm_domain_meta doms_meta[] = {
> > >       {
> > > +             .feature = chipFeatures_PIPE_3D,
> 
> make modules failed for arm architecture on stable rc 4.19 branch.
> 
> drivers/gpu/drm/etnaviv/etnaviv_perfmon.c:392:14: error:
> 'chipFeatures_PIPE_3D' undeclared here (not in a function)
>    .feature = chipFeatures_PIPE_3D,
>               ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/etnaviv/etnaviv_perfmon.c:397:14: error:
> 'chipFeatures_PIPE_2D' undeclared here (not in a function); did you
> mean 'chipFeatures_PIPE_3D'?
>    .feature = chipFeatures_PIPE_2D,
>               ^~~~~~~~~~~~~~~~~~~~
>               chipFeatures_PIPE_3D
> drivers/gpu/drm/etnaviv/etnaviv_perfmon.c:402:14: error:
> 'chipFeatures_PIPE_VG' undeclared here (not in a function); did you
> mean 'chipFeatures_PIPE_2D'?
>    .feature = chipFeatures_PIPE_VG,
>               ^~~~~~~~~~~~~~~~~~~~
>               chipFeatures_PIPE_2D

Looks like I need to include a .h file for this backport, I'll go do
that now, thanks.

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
