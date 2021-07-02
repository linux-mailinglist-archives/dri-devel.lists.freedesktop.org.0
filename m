Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7944B3BA3DF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 20:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFC06E1B6;
	Fri,  2 Jul 2021 18:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B126E1B6
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 18:11:16 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5A98B1F4507C;
 Fri,  2 Jul 2021 19:11:15 +0100 (BST)
Date: Fri, 2 Jul 2021 20:11:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alyssa Rosenzweig <alyssa@collabora.com>
Subject: Re: [PATCH v3 5/7] drm/panfrost: Add a new ioctl to submit batches
Message-ID: <20210702201112.4c07c2c7@collabora.com>
In-Reply-To: <YN9DsztrsMWY1rv+@maud>
References: <20210702143225.3347980-1-boris.brezillon@collabora.com>
 <20210702143225.3347980-6-boris.brezillon@collabora.com>
 <YN8tDD6tRF85cR4z@maud> <20210702173843.44b3e322@collabora.com>
 <YN9DsztrsMWY1rv+@maud>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 2 Jul 2021 12:49:55 -0400
Alyssa Rosenzweig <alyssa@collabora.com> wrote:

> > > ```  
> > > >  #define PANFROST_BO_REF_EXCLUSIVE	0x1
> > > > +#define PANFROST_BO_REF_NO_IMPLICIT_DEP	0x2    
> > > ```
> > > 
> > > This seems logically backwards. NO_IMPLICIT_DEP makes sense if we're
> > > trying to keep backwards compatibility, but here you're crafting a new
> > > interface totally from scratch. If anything, isn't BO_REF_IMPLICIT_DEP
> > > the flag you'd want?  
> > 
> > AFAICT, all other drivers make the no-implicit-dep an opt-in, and I
> > didn't want to do things differently in panfrost. But if that's really
> > an issue, I can make it an opt-out.  
> 
> I don't have strong feelings either way. I was just under the
> impressions other drivers did this for b/w compat reasons which don't
> apply here.

Okay, I think I'll keep it like that unless there's a strong reason to
make no-implicit dep the default. It's safer to oversync than the skip
the synchronization, so it does feel like something the user should
explicitly enable.

> 
> > > Hmm. I'm not /opposed/ and I know kbase uses strides but it seems like
> > > somewhat unwarranted complexity, and there is a combinatoric explosion
> > > here (if jobs, bo refs, and syncobj refs use 3 different versions, as
> > > this encoding permits... as opposed to just specifying a UABI version or
> > > something like that)  
> > 
> > Sounds like a good idea. I'll add a version field and map that
> > to a <job_stride,bo_ref_stride,syncobj_ref_stride> tuple.  
> 
> Cc Steven, does this make sense?

I have this approach working, and I must admit I prefer it to the
per-object stride field passed to the submit struct.

