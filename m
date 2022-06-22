Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB715545F0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 14:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB09D11333F;
	Wed, 22 Jun 2022 12:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3807F11333F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 12:08:33 +0000 (UTC)
Received: from maud (unknown [184.175.41.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 72BA96601792;
 Wed, 22 Jun 2022 13:08:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655899712;
 bh=OPrmD/1mhTg3+/bTF0sZDhaNhdN3Dc9Cr3c2DYFgrwo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i8G7OZIsNtbeKDQ/prV+bbMa2GwrFz/9EF1gGaOKJb5g86k2uf32g6DVJMa1vradM
 vUzYMa177UI7Q9pRzdA43cXjgpYFoK0r/8cA/nif+qi97uAMB3JcIklGZkY3tu3zMQ
 2L8BtnO0g3NFb5hD10yNBVz66J7Uggm8m7yN7lkl79v4pfdZia4eOuUGsF7z8NKWJg
 9osoz73oC2wtaPKz24M4KXo7TiSd1zqCJJYlAxvfoNw1BW0n6fwc5lXVPwaFRtKfDM
 tfuLMW70tnsS0Wu0kcnnJ/DZkw22wZRP91lowv/AVzrMzlj+BWFq5vYKBUouWKG9mX
 n6RjVyJdcFR5Q==
Date: Wed, 22 Jun 2022 08:08:24 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Adri??n Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH v2 1/1] drm/panfrost: Add support for devcoredump
Message-ID: <YrMGOOqJZmJD+Z5X@maud>
References: <20220621023204.94179-1-adrian.larumbe@collabora.com>
 <20220621023204.94179-2-adrian.larumbe@collabora.com>
 <YrHBs+u9gAbOAAxT@maud> <20220622015455.pqiiqevouh7udj7y@sobremesa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622015455.pqiiqevouh7udj7y@sobremesa>
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
Cc: dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 tomeu.vizoso@collabora.com, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > +	iter.start = __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
> > > +			__GFP_NORETRY);
> > > +	if (!iter.start) {
> > > +		dev_warn(pfdev->dev, "failed to allocate devcoredump file\n");
> > > +		return;
> > > +	}
> > > ...
> > > +	memset(iter.hdr, 0, iter.data - iter.start);
> > 
> > Why are we using __GFP_NOWARN and __GFP_NORETRY? Why not plain vmalloc?
> > 
> > Also, why vmalloc instead of vzalloc? (Or adding __GFP_ZERO to the list
> > of __vmalloc flags if __GFP_NOWARN/__GFP_NORETRY are really needed?) Are
> > there relevant performance or security considerations?
> 
> I borrowed this code from Etnaviv a while ago and the same doubt struck me
> then. My understanding of its intended behaviour is that because the dump file
> might be huge, we don't want the memory manager to trigger the OOM killer and
> annoy quite a few running processes because of a debug feature. Also since the
> code already handles the situation when an allocation fails by refusing to
> generate a dump, there's no need for the allocator to generate specific error
> messages.
> 
> So I guess it boils down to 'if there's quite enough memory to allocate a huge
> dump file, go ahead, otherwise don't reclaim any processes' pages for something
> that isn't essential'.
> 
> I don't see much use for __GFP_ZERO in this case, because the dump file gets
> memcpy'd with the contents of every single bo so whatever the original
> contents of the memory were at the time of the allocation, they're overwritten
> immediately.

I think that's a reasonable explanation, bearing in mind I'm firmly a
userspace person ;-)

Please add a comment explaining the assumptions here, though, because
the code will live longer than this ML thread.

> I've also rebased v3 on top of drm-misc-next and the compiler error because of
> the removed panfrost_job structure member is gone.

Excellent
