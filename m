Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590D24F3D7C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 22:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155AE10ED82;
	Tue,  5 Apr 2022 20:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CEB10ED82
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 20:06:10 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id k10so298995oia.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 13:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QWxUGBkyoJQZulOyqMEuVhaAfgSTMVNxIngnIdOPpYU=;
 b=bw29hLLMef0W9ZGmzfypk9FJayJsWNNBjyZHyz+UOw2JWyLqc5ndJK47wGNLpUJmg5
 91d4gA4L0EXHMsMbWyl34/IPf8R/fvZzdhCNojgWOCSgD6thSmAPl+hrLpeWLiFiF0oC
 /YAXoJy2FwmBMZNWJkQNqmXBJQ2nn7ykVDREs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QWxUGBkyoJQZulOyqMEuVhaAfgSTMVNxIngnIdOPpYU=;
 b=mFa38jP2KKBbEAbCMXY+uBATj7tKBBVGvpC9rG4/WxY0RLYsapOKOLWNxsFKU5QClb
 /0sfpaRWKSVT5yrnqBVBnDv2RizP4fsAcYB9RgmQGZIx6gh16yYaRbfBmMfqSKD00s9u
 BOnwUBMsXvrQ9vMcdgKV/HU/qlS2wO1mcaAJ8SGLY5NWGiE0+TZTVNSciovjw+CoDah4
 cGivr4qWuVnm+iuGKvBXAGypLpOwA2S46Amk8/axP9xQUTDqzCC0TCNhfHqpTTkxFGwz
 E+0z4z0LPR2O62rhohDmgmx/EmX3MbL3lYHXCAXs2dUNnbzL/GRgAzr7Y7yY8MzQbxLt
 i3DQ==
X-Gm-Message-State: AOAM530nBMCDlynQYSntCyva7EG5qjg+dGf4vKTd109TR8ENL/sm3kx/
 FR3c2gyovIH6BRHRG9a5T4ogTglG2w0ft3qygmj4fg==
X-Google-Smtp-Source: ABdhPJyN88JgxOV9OdsCTGmy9Zri73CWMwH03gYk8nSqfOZZNb26TA3gERB0i0Y9msTdlltQyneNy8Bc/xB/fXzhJNU=
X-Received: by 2002:a54:4099:0:b0:2ec:d31c:481d with SMTP id
 i25-20020a544099000000b002ecd31c481dmr2236343oii.7.1649189169679; Tue, 05 Apr
 2022 13:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220401205602.1172975-1-zack@kde.org>
 <YksRCsiQtCp74y/A@phenom.ffwll.local>
 <51403dc6d7a769eeda6718a31e92135173591d9d.camel@vmware.com>
In-Reply-To: <51403dc6d7a769eeda6718a31e92135173591d9d.camel@vmware.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 5 Apr 2022 22:05:58 +0200
Message-ID: <CAKMK7uFrb_NhyxvvJdp42QXb1enkETWs=RQ4WrMHscHmuohTbA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/vmwgfx: Add debugfs entries for ttm placements
To: Zack Rusin <zackr@vmware.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 Apr 2022 at 16:01, Zack Rusin <zackr@vmware.com> wrote:
>
> On Mon, 2022-04-04 at 17:38 +0200, Daniel Vetter wrote:
> > On Fri, Apr 01, 2022 at 04:56:00PM -0400, Zack Rusin wrote:
> > > From: Zack Rusin <zackr@vmware.com>
> > >
> > > Add a few debugfs entries for every used TTM placement that vmwgfx
> > > is
> > > using. This allows basic tracking of memory usage inside vmwgfx,
> > > e.g.
> > > 'cat /sys/kernel/debug/dri/0/mob_ttm' will display mob memory
> > > usage.
> > >
> > > Signed-off-by: Zack Rusin <zackr@vmware.com>
> > > Reviewed-by: Martin Krastev <krastevm@vmware.com>
> > > ---
> > >  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |  1 +
> > >  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  1 +
> > >  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 97
> > > +++++++++++++++++++++-
> > >  3 files changed, 98 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> > > b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> > > index 791f9a5f3868..6d675855f065 100644
> > > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> > > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> > > @@ -1632,6 +1632,7 @@ static int vmw_probe(struct pci_dev *pdev,
> > > const struct pci_device_id *ent)
> > >               goto out_unload;
> > >
> > >       vmw_debugfs_gem_init(vmw);
> > > +     vmw_ttm_debugfs_init(vmw);
> > >
> > >       return 0;
> > >  out_unload:
> > > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > > b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > > index be19aa6e1f13..eabe3e8e9cf9 100644
> > > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > > @@ -1085,6 +1085,7 @@ vmw_bo_sg_table(struct ttm_buffer_object
> > > *bo);
> > >  extern int vmw_bo_create_and_populate(struct vmw_private
> > > *dev_priv,
> > >                                     unsigned long bo_size,
> > >                                     struct ttm_buffer_object
> > > **bo_p);
> > > +void vmw_ttm_debugfs_init(struct vmw_private *vdev);
> > >
> > >  extern void vmw_piter_start(struct vmw_piter *viter,
> > >                           const struct vmw_sg_table *vsgt,
> > > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > > b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > > index b84ecc6d6611..355414595e52 100644
> > > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > > @@ -1,7 +1,7 @@
> > >  // SPDX-License-Identifier: GPL-2.0 OR MIT
> > >  /*****************************************************************
> > > *********
> > >   *
> > > - * Copyright 2009-2015 VMware, Inc., Palo Alto, CA., USA
> > > + * Copyright 2009-2022 VMware, Inc., Palo Alto, CA., USA
> > >   *
> > >   * Permission is hereby granted, free of charge, to any person
> > > obtaining a
> > >   * copy of this software and associated documentation files (the
> > > @@ -677,3 +677,98 @@ int vmw_bo_create_and_populate(struct
> > > vmw_private *dev_priv,
> > >               *bo_p = bo;
> > >       return ret;
> > >  }
> > > +
> > > +#if defined(CONFIG_DEBUG_FS)
> > > +
> > > +static int vmw_ttm_vram_table_show(struct seq_file *m, void
> > > *unused)
> > > +{
> > > +     struct vmw_private *vdev = (struct vmw_private *)m->private;
> > > +     struct ttm_resource_manager *man = ttm_manager_type(&vdev-
> > > >bdev,
> > > +
> > > TTM_PL_VRAM);
> > > +     struct drm_printer p = drm_seq_file_printer(m);
> > > +
> > > +     ttm_resource_manager_debug(man, &p);
> > > +     return 0;
> > > +}
> > > +
> > > +static int vmw_ttm_page_pool_show(struct seq_file *m, void
> > > *unused)
> > > +{
> > > +     struct vmw_private *vdev = (struct vmw_private *)m->private;
> > > +
> > > +     return ttm_pool_debugfs(&vdev->bdev.pool, m);
> > > +}
> > > +
> > > +static int vmw_ttm_mob_table_show(struct seq_file *m, void
> > > *unused)
> > > +{
> > > +     struct vmw_private *vdev = (struct vmw_private *)m->private;
> > > +     struct ttm_resource_manager *man = ttm_manager_type(&vdev-
> > > >bdev,
> > > +
> > > VMW_PL_MOB);
> > > +     struct drm_printer p = drm_seq_file_printer(m);
> > > +
> > > +     ttm_resource_manager_debug(man, &p);
> > > +     return 0;
> > > +}
> > > +
> > > +static int vmw_ttm_gmr_table_show(struct seq_file *m, void
> > > *unused)
> > > +{
> > > +     struct vmw_private *vdev = (struct vmw_private *)m->private;
> > > +     struct ttm_resource_manager *man = ttm_manager_type(&vdev-
> > > >bdev,
> > > +
> > > VMW_PL_GMR);
> > > +     struct drm_printer p = drm_seq_file_printer(m);
> > > +
> > > +     ttm_resource_manager_debug(man, &p);
> > > +     return 0;
> > > +}
> > > +
> > > +static int vmw_ttm_system_table_show(struct seq_file *m, void
> > > *unused)
> > > +{
> > > +     struct vmw_private *vdev = (struct vmw_private *)m->private;
> > > +     struct ttm_resource_manager *man = ttm_manager_type(&vdev-
> > > >bdev,
> > > +
> > > TTM_PL_SYSTEM);
> > > +     struct drm_printer p = drm_seq_file_printer(m);
> > > +
> > > +     ttm_resource_manager_debug(man, &p);
> > > +     return 0;
> > > +}
> > > +
> > > +static int vmw_ttm_system_mob_table_show(struct seq_file *m, void
> > > *unused)
> > > +{
> > > +     struct vmw_private *vdev = (struct vmw_private *)m->private;
> > > +     struct ttm_resource_manager *man = ttm_manager_type(&vdev-
> > > >bdev,
> > > +
> > > VMW_PL_SYSTEM);
> > > +     struct drm_printer p = drm_seq_file_printer(m);
> > > +
> > > +     ttm_resource_manager_debug(man, &p);
> > > +     return 0;
> > > +}
> > > +
> > > +DEFINE_SHOW_ATTRIBUTE(vmw_ttm_vram_table);
> > > +DEFINE_SHOW_ATTRIBUTE(vmw_ttm_mob_table);
> > > +DEFINE_SHOW_ATTRIBUTE(vmw_ttm_gmr_table);
> > > +DEFINE_SHOW_ATTRIBUTE(vmw_ttm_system_table);
> > > +DEFINE_SHOW_ATTRIBUTE(vmw_ttm_system_mob_table);
> > > +DEFINE_SHOW_ATTRIBUTE(vmw_ttm_page_pool);
> > > +
> > > +#endif
> > > +
> > > +void vmw_ttm_debugfs_init(struct vmw_private *vdev)
> > > +{
> > > +#if defined(CONFIG_DEBUG_FS)
> > > +     struct drm_device *drm = &vdev->drm;
> > > +     struct drm_minor *minor = drm->primary;
> > > +     struct dentry *root = minor->debugfs_root;
> > > +
> > > +     debugfs_create_file("vram_ttm", 0444, root, vdev,
> > > +                         &vmw_ttm_vram_table_fops);
> > > +     debugfs_create_file("mob_ttm", 0444, root, vdev,
> > > +                         &vmw_ttm_mob_table_fops);
> > > +     debugfs_create_file("gmr_ttm", 0444, root, vdev,
> > > +                         &vmw_ttm_gmr_table_fops);
> > > +     debugfs_create_file("system_ttm", 0444, root, vdev,
> > > +                         &vmw_ttm_system_table_fops);
> > > +     debugfs_create_file("system_mob_ttm", 0444, root, vdev,
> > > +                         &vmw_ttm_system_mob_table_fops);
> > > +     debugfs_create_file("ttm_page_pool", 0444, root, vdev,
> > > +                         &vmw_ttm_page_pool_fops);
> > > +#endif
> >
> > Bit orthogonal, but can't ttm create the debugfs files for all the
> > regions
> > on its own when we set everything up? Or at least a "create me all
> > the
> > regions debugfs files" helpers would be useful. It's just rather
> > silly
> > amounts of boilerplate we're having here, and that in each driver.
>
> Yea, agreed. With some kind of mapping between ttm data placement
> defines and file names, this would be very much doable. Would you like
> to see that done instead of this patch or after this patch lands?

If you're volunteering either way is fine imo :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
