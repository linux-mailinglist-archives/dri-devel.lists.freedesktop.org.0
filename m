Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B190F242AF9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 16:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2679F6E126;
	Wed, 12 Aug 2020 14:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282096E126
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 14:10:20 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id o21so1881670oie.12
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 07:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fQpYDgkPY9yLnBp0UJp8jvJUvHu94wXm2Rvd4KAL1+8=;
 b=MYObIKtEhualdDLE4KCuFf0k1rLOTRrmO/XY5GYjlct7s5zBj12CSi+TCHJKcq43Em
 iA2ub8UeRKVY23cHauGk+Fq1eqbGYFEELgT0rbSVhgvH4eSGBNDiY7z5P3QzrhhhpH1a
 f4Z0XIXeu2yLjoFhKHpwiKFUkNopB75wb/ZHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fQpYDgkPY9yLnBp0UJp8jvJUvHu94wXm2Rvd4KAL1+8=;
 b=NYP8tPcuF8adDrlfaqFGXk1mGBSX2k33C08Q3uYrfpQmMCF7Jlfn1v5p6GUw4X8T30
 nRkrv68+MMRNB0e0NVovM5jX8RFQH/B8NVMZAMxkm+5DDT6ptBYv9d9pVgphtNply9Bs
 ywytEYkVesqQ+7KGcmhCtr13ifYIKuiKFh1vek8dCEoB5ogqVZftggEsaBPQ73niUad5
 7c8gzwBmKWbm7ME/3ICTHoziNGLP1lYZ9A7uP/ZswZmX10uemwlKLIsoH12P5GRZit1/
 0FejF7qPh/85Yyd0fi+uLD1PPHjFlES6e4xhLXS8jCcOVgXWKRSuHDw4NqCPlID7DlpW
 jY0Q==
X-Gm-Message-State: AOAM532VUKuAjDRQLWp8QeIUttpMUqCPVbPXvS9u0p3+Ph19wBIShwwV
 j4jj8VSA8kXu+nVC7DHUTOd4h8GWLEviNn9hwUv+6w==
X-Google-Smtp-Source: ABdhPJynZpsDvSna0C6RcraPgGewhfAurY7C4qKG2dom85yF0RCs4jaNttjcC9KqInWQ5ZVcRPwP5rJXJxhnPIlnF88=
X-Received: by 2002:aca:88a:: with SMTP id 132mr6823888oii.101.1597241419407; 
 Wed, 12 Aug 2020 07:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2008101004110.27032@montezuma.home>
 <20200811085830.GZ2352366@phenom.ffwll.local>
 <alpine.DEB.2.21.2008111514210.35094@montezuma.home>
In-Reply-To: <alpine.DEB.2.21.2008111514210.35094@montezuma.home>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 12 Aug 2020 16:10:08 +0200
Message-ID: <CAKMK7uHxikojLQNbsnnfDfGZ3tFP9CRUTzvr+DsZghzQupaBGg@mail.gmail.com>
Subject: Re: [PATCH] drm: assure aux_dev is nonzero before using it
To: Zwane Mwaikambo <zwanem@gmail.com>, Lyude <lyude@redhat.com>
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
Cc: dkwon@redhat.com, Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, tcamuso@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 12:16 AM Zwane Mwaikambo <zwanem@gmail.com> wrote:
>
> On Tue, 11 Aug 2020, Daniel Vetter wrote:
>
> > On Mon, Aug 10, 2020 at 10:11:50AM -0700, Zwane Mwaikambo wrote:
> > > Hi Folks,
> > >     I know this thread eventually dropped off due to not identifying
> > > the underlying issue. It's still occuring on 5.8 and in my case it
> > > happened because the udev device nodes for the DP aux devices were not
> > > cleaned up whereas the kernel had no association with them. I can
> > > reproduce the bug just by creating a device node for a non-existent minor
> > > device and calling open().
> >
> > Hm I don't have that thread anymore, but generally these bugs are solved
> > by not registering the device before it's ready for use. We do have
> > drm_connector->late_register for that stuff. Just a guess since I'm not
> > seeing full details here.
>
> In this particular case, the physical device disappeared before the nodes
> were cleaned up. It involves putting a computer to sleep with a monitor
> plugged in and then waking it up with the monitor unplugged.

We also have early_unregister for the reverse, but yes this sounds
more tricky ... Adding Lyude who's been working on way too much
lifetime fun around dp recently.
-Daniel

>
>
> > >
> > > To me it still makes sense to just check aux_dev because the chardev has
> > > no way to check before calling.
> > >
> > > (gdb) list *drm_dp_aux_dev_get_by_minor+0x29
> > > 0x17b39 is in drm_dp_aux_dev_get_by_minor (drivers/gpu/drm/drm_dp_aux_dev.c:65).
> > > 60      static struct drm_dp_aux_dev *drm_dp_aux_dev_get_by_minor(unsigned index)
> > > 61      {
> > > 62              struct drm_dp_aux_dev *aux_dev = NULL;
> > > 63
> > > 64              mutex_lock(&aux_idr_mutex);
> > > 65              aux_dev = idr_find(&aux_idr, index);
> > > 66              if (!kref_get_unless_zero(&aux_dev->refcount))
> > > 67                      aux_dev = NULL;
> > > 68              mutex_unlock(&aux_idr_mutex);
> > > 69
> > > (gdb) p/x &((struct drm_dp_aux_dev *)(0x0))->refcount
> > > $8 = 0x18
> > >
> > > static int auxdev_open(struct inode *inode, struct file *file)
> > > {
> > >     unsigned int minor = iminor(inode);
> > >     struct drm_dp_aux_dev *aux_dev;
> > >
> > >     aux_dev = drm_dp_aux_dev_get_by_minor(minor);
> > >     if (!aux_dev)
> > >         return -ENODEV;
> > >
> > >     file->private_data = aux_dev;
> > >     return 0;
> > > }
> > >
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
