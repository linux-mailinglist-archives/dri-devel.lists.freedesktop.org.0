Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C133D5771
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 12:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3A46E863;
	Mon, 26 Jul 2021 10:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264426E863
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 10:27:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbrezillon) with ESMTPSA id 71D481F4285E
Date: Mon, 26 Jul 2021 12:27:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH v4 5/7] drm/panfrost: Add a new ioctl to submit batches
Message-ID: <20210726122706.7fb3a8d5@collabora.com>
In-Reply-To: <1fe2d843-041d-40f6-b552-91f159487495@gmail.com>
References: <20210705082950.3573841-1-boris.brezillon@collabora.com>
 <20210705082950.3573841-6-boris.brezillon@collabora.com>
 <YOLRnPjCDkc9DRxE@phenom.ffwll.local>
 <1fe2d843-041d-40f6-b552-91f159487495@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 8 Jul 2021 14:10:45 +0200
Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> wrote:

> >> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> >> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> >> @@ -254,6 +254,9 @@ static int panfrost_acquire_object_fences(struct p=
anfrost_job *job)
> >>   				return ret;
> >>   		}
> >>  =20
> >> +		if (job->bo_flags[i] & PANFROST_BO_REF_NO_IMPLICIT_DEP)
> >> +			continue; =20
> > This breaks dma_resv rules. I'll send out patch set fixing this pattern=
 in
> > other drivers, I'll ping you on that for what you need to change. Should
> > go out today or so.

I guess you're talking about [1]. TBH, I don't quite see the point of
exposing a 'no-implicit' flag if we end up forcing this implicit dep
anyway, but I'm probably missing something.

>=20
> I'm really wondering if the behavior that the exclusive fences replaces=20
> all the shared fences was such a good idea.

Is that what's done in [1], or are you talking about a different
patchset/approach?

>=20
> It just allows drivers to mess up things in a way which can be easily=20
> used to compromise the system.

I must admit I'm a bit lost, so I'm tempted to drop that flag for now
:-).

[1]https://patchwork.freedesktop.org/patch/443711/?series=3D92334&rev=3D3
