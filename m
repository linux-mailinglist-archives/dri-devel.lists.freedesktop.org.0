Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469E47F722E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F88110E1C1;
	Fri, 24 Nov 2023 10:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5F710E1BC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:59:17 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CB94766073AD;
 Fri, 24 Nov 2023 10:59:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700823555;
 bh=ma5hYFiS3vwEYHHxmMJNO4F5DZq9PbgVT+M0eFXqFY0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AbO0h0rp5TYnpVa/uXz0gP89OBMsw7JkYlRBE9esCT9F2yc4IUzIh7pEO4sk94uIF
 PKmrOaSUt/GBNb2VxrjY9qTZddURS6aIAiY31wyqxCtkSOghwS5qNTUJlE5sao4TZE
 6k1o/IY5nHkz11bpIQKow1tS1sy/RdfQCY5OMs7VzGud+RYe/Gi98KjwiQ1VJZqD9R
 76Wtp8Q8WzxaUyncN1a+nMULZuqhbKogn9l5LJhmL2WP1+rajxOP5/wbolk9vvrIeF
 4E+Ek82TH4aAt3mLhSPeDPs3eqs30bjoRrIeQnlxejqxCIZcN9BXkHM99ojPzKBeBM
 C+a8EMDj/1ZfQ==
Date: Fri, 24 Nov 2023 11:59:11 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v18 04/26] drm/shmem-helper: Refactor locked/unlocked
 functions
Message-ID: <20231124115911.79ab24af@collabora.com>
In-Reply-To: <wboljiwogeus7pwgaqzxaltt3xdavy2dzisygn6pdpoiwlnwgc@mwaiukjguzat>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-5-dmitry.osipenko@collabora.com>
 <wboljiwogeus7pwgaqzxaltt3xdavy2dzisygn6pdpoiwlnwgc@mwaiukjguzat>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: kernel@collabora.com, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Emma Anholt <emma@anholt.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Melissa Wen <mwen@igalia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Steven Price <steven.price@arm.com>, virtualization@lists.linux-foundation.org,
 Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Nov 2023 11:40:06 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Mon, Oct 30, 2023 at 02:01:43AM +0300, Dmitry Osipenko wrote:
> > Add locked and remove unlocked postfixes from drm-shmem function names,
> > making names consistent with the drm/gem core code.
> > 
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>  
> 
> This contradicts my earlier ack on a patch but...
> 
> > ---
> >  drivers/gpu/drm/drm_gem_shmem_helper.c        | 64 +++++++++----------
> >  drivers/gpu/drm/lima/lima_gem.c               |  8 +--
> >  drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 +-
> >  drivers/gpu/drm/panfrost/panfrost_gem.c       |  6 +-
> >  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  2 +-
> >  drivers/gpu/drm/panfrost/panfrost_mmu.c       |  2 +-
> >  drivers/gpu/drm/v3d/v3d_bo.c                  |  4 +-
> >  drivers/gpu/drm/virtio/virtgpu_object.c       |  4 +-
> >  include/drm/drm_gem_shmem_helper.h            | 36 +++++------
> >  9 files changed, 64 insertions(+), 64 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > index 0d61f2b3e213..154585ddae08 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -43,8 +43,8 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
> >  	.pin = drm_gem_shmem_object_pin,
> >  	.unpin = drm_gem_shmem_object_unpin,
> >  	.get_sg_table = drm_gem_shmem_object_get_sg_table,
> > -	.vmap = drm_gem_shmem_object_vmap,
> > -	.vunmap = drm_gem_shmem_object_vunmap,
> > +	.vmap = drm_gem_shmem_object_vmap_locked,
> > +	.vunmap = drm_gem_shmem_object_vunmap_locked,  
> 
> While I think we should indeed be consistent with the names, I would
> also expect helpers to get the locking right by default.

Wait, actually I think this patch does what you suggest already. The
_locked() prefix tells the caller: "you should take care of the locking,
I expect the lock to be held when this is hook/function is called". So
helpers without the _locked() prefix take care of the locking (which I
guess matches your 'helpers get the locking right' expectation), and
those with the _locked() prefix don't.

> 
> I'm not sure how reasonable it is, but I think I'd prefer to turn this
> around and keep the drm_gem_shmem_object_vmap/unmap helpers name, and
> convert whatever function needs to be converted to the unlock suffix so
> we get a consistent naming.

That would be an _unlocked() prefix if we do it the other way around. I
think the main confusion comes from the names of the hooks in
drm_gem_shmem_funcs. Some of them, like drm_gem_shmem_funcs::v[un]map()
are called with the GEM resv lock held, and locking is handled by the
core, others, like drm_gem_shmem_funcs::[un]pin() are called
without the GEM resv lock held, and locking is deferred to the
implementation. As I said, I don't mind prefixing hooks/helpers with
_unlocked() for those that take care of the locking, and no prefix for
those that expects locks to be held, as long as it's consistent, but I
just wanted to make sure we're on the same page :-).

