Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7288311AC72
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 14:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C806EB56;
	Wed, 11 Dec 2019 13:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 436 seconds by postgrey-1.36 at gabe;
 Wed, 11 Dec 2019 13:52:23 UTC
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199066EB56
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 13:52:23 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5F0C2464B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 13:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576071907;
 bh=E2MWxqDHowMmws7LX1VR3/hKgxqcddNAtPx3Wb07a+s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fFiWzJuVzkko8HFxPE7GivBAdCxSyKXCaH4gIJ1eaHAc/kWOUiPfMFvdPv+ZkQvgt
 XMTxcKNH+7T6NntPyTPjE38FcMV7CyTiZ0IsDOwT2mmGnj43kAn6E18AaejDuYrjlG
 9UFy39nOWuXwq4KUX26DMmreIMs84rXqtE+RzjqA=
Received: by mail-qk1-f177.google.com with SMTP id r14so11497908qke.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 05:45:07 -0800 (PST)
X-Gm-Message-State: APjAAAWCXGFrWA/lZ/yPkJx+qtqnlA38cXDIXK0cnSqSHWujyteU/XlS
 vW+5xhHSUiaqeSEqiq0uNteHmYJ1lqocxj+dVg==
X-Google-Smtp-Source: APXvYqzu8YYdR69zEtHqKcaqcyvw9lw+dbtE5Hn+7do61yv/MFPVICJc28Dg77bLISDvuYjHaE/zjubhgxeZBEhC338=
X-Received: by 2002:ae9:f205:: with SMTP id m5mr3009689qkg.152.1576071906612; 
 Wed, 11 Dec 2019 05:45:06 -0800 (PST)
MIME-Version: 1.0
References: <20191210230844.794-1-robh@kernel.org>
 <12053d81-88a9-8a4a-19f5-43ccdbc5bc0b@arm.com>
In-Reply-To: <12053d81-88a9-8a4a-19f5-43ccdbc5bc0b@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 11 Dec 2019 07:44:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJFFHApUwRr3CxVAd=uRgCYxpJ56PKrG8hxYG3qNgwNUw@mail.gmail.com>
Message-ID: <CAL_JsqJFFHApUwRr3CxVAd=uRgCYxpJ56PKrG8hxYG3qNgwNUw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panfrost: Add the panfrost_gem_mapping concept
To: Steven Price <steven.price@arm.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 6:38 AM Steven Price <steven.price@arm.com> wrote:
>
> On 10/12/2019 23:08, Rob Herring wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> >
> > With the introduction of per-FD address space, the same BO can be mapped
> > in different address space if the BO is globally visible (GEM_FLINK)
> > and opened in different context or if the dmabuf is self-imported. The
> > current implementation does not take that case into account, and
> > attaches the mapping directly to the panfrost_gem_object.
> >
> > Let's create a panfrost_gem_mapping struct and allow multiple mappings
> > per BO.
> >
> > The mappings are refcounted which helps solve another problem where
> > mappings were torn down (GEM handle closed by userspace) while GPU
> > jobs accessing those BOs were still in-flight. Jobs now keep a
> > reference on the mappings they use.
> >
> > v2 (robh):
> > - Minor review comment clean-ups from Steven
> > - Use list_is_singular helper
> > - Just WARN if we add a mapping when madvise state is not WILLNEED.
> >   With that, drop the use of object_name_lock.
> >
> > Fixes: a5efb4c9a562 ("drm/panfrost: Restructure the GEM object creation")
> > Fixes: 7282f7645d06 ("drm/panfrost: Implement per FD address spaces")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > I've hacked up IGT prime_self_import test to run on panfrost other than
> > the 2 test which depend on i915 debugfs files (export-vs-gem_close-race,
> > reimport-vs-gem_close-race). With this patch, they now pass.
> >
> > I'm not adding the test to IGT which is just a copy-n-paste of the
> > original except for different wrappers for BO alloc and mmap. That
> > should be fixed first IMO.
> >
> > Rob
> >
> >  drivers/gpu/drm/panfrost/panfrost_drv.c       |  91 +++++++++++--
> >  drivers/gpu/drm/panfrost/panfrost_gem.c       | 123 +++++++++++++++---
> >  drivers/gpu/drm/panfrost/panfrost_gem.h       |  41 +++++-
> >  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |   3 +-
> >  drivers/gpu/drm/panfrost/panfrost_job.c       |  13 +-
> >  drivers/gpu/drm/panfrost/panfrost_job.h       |   1 +
> >  drivers/gpu/drm/panfrost/panfrost_mmu.c       |  61 +++++----
> >  drivers/gpu/drm/panfrost/panfrost_mmu.h       |   6 +-
> >  drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  34 +++--
> >  9 files changed, 299 insertions(+), 74 deletions(-)
> >
>
> <snip>
>
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> > index fd766b1395fb..3a7862e3e775 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> > @@ -29,6 +29,12 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
> >       list_del_init(&bo->base.madv_list);
> >       mutex_unlock(&pfdev->shrinker_lock);
> >
> > +     /*
> > +      * If we still have mappings attached to the BO, there's a problem in
> > +      * our refcounting.
> > +      */
> > +     WARN_ON_ONCE(!list_empty(&bo->mappings.list));
> > +
> >       if (bo->sgts) {
> >               int i;
> >               int n_sgt = bo->base.base.size / SZ_2M;
> > @@ -46,6 +52,68 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
> >       drm_gem_shmem_free_object(obj);
> >  }
> >
> > +struct panfrost_gem_mapping *
> > +panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
> > +                      struct panfrost_file_priv *priv)
> > +{
> > +     struct panfrost_gem_mapping *iter;
> > +
> > +     mutex_lock(&bo->mappings.lock);
> > +     list_for_each_entry(iter, &bo->mappings.list, node) {
> > +             if (iter->mmu == &priv->mmu) {
> > +                     kref_get(&iter->refcount);
> > +                     break;
> > +             }
> > +     }
> > +     mutex_unlock(&bo->mappings.lock);
> > +
> > +     return iter;
>
> If the entry isn't found then iter will equal
> container_of(&bo->mappings.list, struct panfrost_gem_mapping, node) -
> but you actually want a NULL return in this case.

Ugg, yes. I knew that...

> I also think the previous version with a "member" variable being
> returned was clearer.

I over interpreted what you were suggesting. Will change it back and
*just* add the break.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
