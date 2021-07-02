Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E9E3BA360
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 18:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8A66E158;
	Fri,  2 Jul 2021 16:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0476F6E158
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 16:50:21 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:8800:8c04:8c00::912b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 59F6D1F44FD2;
 Fri,  2 Jul 2021 17:50:07 +0100 (BST)
Date: Fri, 2 Jul 2021 12:49:55 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 5/7] drm/panfrost: Add a new ioctl to submit batches
Message-ID: <YN9DsztrsMWY1rv+@maud>
References: <20210702143225.3347980-1-boris.brezillon@collabora.com>
 <20210702143225.3347980-6-boris.brezillon@collabora.com>
 <YN8tDD6tRF85cR4z@maud> <20210702173843.44b3e322@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210702173843.44b3e322@collabora.com>
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

> > What is handle? What is point?
> 
> Handle is a syncobj handle, point is the point in a syncobj timeline.
> I'll document those fields.

OK.

> > Why is there padding instead of putting point first?
> 
> We can move the point field first, but we need to keep the explicit
> padding: the struct has to be 64bit aligned because of the __u64 field
> (which the compiler takes care of) but if we don't have an explicit
> padding, the unused 32bits are undefined, which might cause trouble if
> we extend the struct at some point, since we sort of expect that old
> userspace keep this unused 32bit slot to 0, while new users set
> non-zero values if they have to.

Makes sense. Reordering still probably makes sense.

> > ```
> > >  #define PANFROST_BO_REF_EXCLUSIVE	0x1
> > > +#define PANFROST_BO_REF_NO_IMPLICIT_DEP	0x2  
> > ```
> > 
> > This seems logically backwards. NO_IMPLICIT_DEP makes sense if we're
> > trying to keep backwards compatibility, but here you're crafting a new
> > interface totally from scratch. If anything, isn't BO_REF_IMPLICIT_DEP
> > the flag you'd want?
> 
> AFAICT, all other drivers make the no-implicit-dep an opt-in, and I
> didn't want to do things differently in panfrost. But if that's really
> an issue, I can make it an opt-out.

I don't have strong feelings either way. I was just under the
impressions other drivers did this for b/w compat reasons which don't
apply here.

> > Hmm. I'm not /opposed/ and I know kbase uses strides but it seems like
> > somewhat unwarranted complexity, and there is a combinatoric explosion
> > here (if jobs, bo refs, and syncobj refs use 3 different versions, as
> > this encoding permits... as opposed to just specifying a UABI version or
> > something like that)
> 
> Sounds like a good idea. I'll add a version field and map that
> to a <job_stride,bo_ref_stride,syncobj_ref_stride> tuple.

Cc Steven, does this make sense?

> > > +	/**
> > > +	 * If the submission fails, this encodes the index of the job
> > > +	 * failed.
> > > +	 */
> > > +	__u32 fail_idx;  
> > ```
> > 
> > What if multiple jobs fail?
> 
> We stop at the first failure. Note that it's not an execution failure,
> but a submission failure (AKA, userspace passed wrong params, like
> invalid BO or synobj handles).

I see, ok.
