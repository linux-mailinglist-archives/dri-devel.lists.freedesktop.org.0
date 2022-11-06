Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFBF61E2C3
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 15:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB3310E121;
	Sun,  6 Nov 2022 14:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8C710E121;
 Sun,  6 Nov 2022 14:52:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C1B460C02;
 Sun,  6 Nov 2022 14:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09565C433D6;
 Sun,  6 Nov 2022 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667746327;
 bh=Ycv1TxqlDJ3PK7eO119N5f0GkPr0orUNrH7dQ8IQPdE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fu3I/AcPITAehA5xO7w7LrjaeI07r9dQU0hYsX9eSlAL95iAt0S5BcMkDiT55oG2b
 XoMuJMB59oIzPzp+Txhv/p1zbzUYKjQpemIB4ph6ouTRByEIJmHmBK5H+Fhf1lPMkF
 tHuKnv9DXQE+4X8Qz5YxkT3Q4o/J8tQVSV+NoUA4bFTTyIe18cSYR0D+G5v1JuHcSU
 OKMWlLawq1RjaBoqyUWWF3CIkHG5oknE+YFIYgbDB7ZsG5++PKyd5Pgh8rZviUFoXr
 00WEzdSfgW1plbx33ymsV/yT+9N1zMLds6r+3Lp1OzjebteK/VMTMj5So0qnQ53UrF
 ygU19VQkPSu/g==
Received: by mail-yb1-f170.google.com with SMTP id y186so6268999yby.10;
 Sun, 06 Nov 2022 06:52:06 -0800 (PST)
X-Gm-Message-State: ACrzQf2t2xRnN8Gg9sHdxvjHmg6Klb7UYySTkcgtaki9zZpDmWcYbr6a
 1KDk5EinDSe4rSAC1Lr9BWBXOoLsD4hSGN3Jmq4=
X-Google-Smtp-Source: AMsMyM6TvlDttRINKFf1Xcnd0MX5uUAP1N9lvaQHPrt6uoT9ZyWzHOEh5zd8XsvoUYuAsAJ+Ic5VwHx+OwCliyzxs9U=
X-Received: by 2002:a05:6902:152:b0:6ca:8fa:105b with SMTP id
 p18-20020a056902015200b006ca08fa105bmr44476132ybh.550.1667746326046; Sun, 06
 Nov 2022 06:52:06 -0800 (PST)
MIME-Version: 1.0
References: <20220911211443.581481-1-michal.winiarski@intel.com>
 <20220911211443.581481-2-michal.winiarski@intel.com>
 <CAFCwf11=hKGm93oF1A5PLhdvdo2ujYJWyt4qAqK-KQQqe6ngDA@mail.gmail.com>
In-Reply-To: <CAFCwf11=hKGm93oF1A5PLhdvdo2ujYJWyt4qAqK-KQQqe6ngDA@mail.gmail.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 6 Nov 2022 16:51:39 +0200
X-Gmail-Original-Message-ID: <CAFCwf12+piEABvv=nxFJCzUU4XdZw5Pu=r=i3aKQGZrBeraFqw@mail.gmail.com>
Message-ID: <CAFCwf12+piEABvv=nxFJCzUU4XdZw5Pu=r=i3aKQGZrBeraFqw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] drm: Use XArray instead of IDR for minors
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 2, 2022 at 4:23 PM Oded Gabbay <ogabbay@kernel.org> wrote:
>
> On Mon, Sep 12, 2022 at 12:17 AM Micha=C5=82 Winiarski
> <michal.winiarski@intel.com> wrote:
> >
> > IDR is deprecated, and since XArray manages its own state with internal
> > locking, it simplifies the locking on DRM side.
> > Additionally, don't use the IRQ-safe variant, since operating on drm
> > minor is not done in IRQ context.
> >
> > Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > ---
> >  drivers/gpu/drm/drm_drv.c | 51 ++++++++++++++-------------------------
> >  1 file changed, 18 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 8214a0b1ab7f..61d24cdcd0f8 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -34,6 +34,7 @@
> >  #include <linux/pseudo_fs.h>
> >  #include <linux/slab.h>
> >  #include <linux/srcu.h>
> > +#include <linux/xarray.h>
> >
> >  #include <drm/drm_cache.h>
> >  #include <drm/drm_client.h>
> > @@ -53,8 +54,7 @@ MODULE_AUTHOR("Gareth Hughes, Leif Delgass, Jos=C3=A9=
 Fonseca, Jon Smirl");
> >  MODULE_DESCRIPTION("DRM shared core routines");
> >  MODULE_LICENSE("GPL and additional rights");
> >
> > -static DEFINE_SPINLOCK(drm_minor_lock);
> > -static struct idr drm_minors_idr;
> > +static DEFINE_XARRAY_ALLOC(drm_minors_xa);
> >
> >  /*
> >   * If the drm core fails to init for whatever reason,
> > @@ -98,21 +98,19 @@ static struct drm_minor **drm_minor_get_slot(struct=
 drm_device *dev,
> >  static void drm_minor_alloc_release(struct drm_device *dev, void *data=
)
> >  {
> >         struct drm_minor *minor =3D data;
> > -       unsigned long flags;
> >
> >         WARN_ON(dev !=3D minor->dev);
> >
> >         put_device(minor->kdev);
> >
> > -       spin_lock_irqsave(&drm_minor_lock, flags);
> > -       idr_remove(&drm_minors_idr, minor->index);
> > -       spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +       xa_erase(&drm_minors_xa, minor->index);
> >  }
> >
> > +#define DRM_MINOR_LIMIT(t) ({ typeof(t) _t =3D (t); XA_LIMIT(64 * _t, =
64 * _t + 63); })
> > +
> >  static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> >  {
> >         struct drm_minor *minor;
> > -       unsigned long flags;
> >         int r;
> >
> >         minor =3D drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
> > @@ -122,21 +120,10 @@ static int drm_minor_alloc(struct drm_device *dev=
, unsigned int type)
> >         minor->type =3D type;
> >         minor->dev =3D dev;
> >
> > -       idr_preload(GFP_KERNEL);
> > -       spin_lock_irqsave(&drm_minor_lock, flags);
> > -       r =3D idr_alloc(&drm_minors_idr,
> > -                     NULL,
> > -                     64 * type,
> > -                     64 * (type + 1),
> > -                     GFP_NOWAIT);
> > -       spin_unlock_irqrestore(&drm_minor_lock, flags);
> > -       idr_preload_end();
> > -
> > +       r =3D xa_alloc(&drm_minors_xa, &minor->index, NULL, DRM_MINOR_L=
IMIT(type), GFP_KERNEL);
This was GFP_NOWAIT in the original code.

> >         if (r < 0)
> >                 return r;
> >
> > -       minor->index =3D r;
> > -
> >         r =3D drmm_add_action_or_reset(dev, drm_minor_alloc_release, mi=
nor);
> >         if (r)
> >                 return r;
> > @@ -152,7 +139,7 @@ static int drm_minor_alloc(struct drm_device *dev, =
unsigned int type)
> >  static int drm_minor_register(struct drm_device *dev, unsigned int typ=
e)
> >  {
> >         struct drm_minor *minor;
> > -       unsigned long flags;
> > +       void *entry;
> >         int ret;
> >
> >         DRM_DEBUG("\n");
> > @@ -172,9 +159,12 @@ static int drm_minor_register(struct drm_device *d=
ev, unsigned int type)
> >                 goto err_debugfs;
> >
> >         /* replace NULL with @minor so lookups will succeed from now on=
 */
> > -       spin_lock_irqsave(&drm_minor_lock, flags);
> > -       idr_replace(&drm_minors_idr, minor, minor->index);
> > -       spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +       entry =3D xa_cmpxchg(&drm_minors_xa, minor->index, NULL, &minor=
, GFP_KERNEL);
> I believe we should pass in "minor", without the &, as &minor will
> give you the address of the local pointer.
>
> Oded
>
> > +       if (xa_is_err(entry)) {
> > +               ret =3D xa_err(entry);
> > +               goto err_debugfs;
> > +       }
> > +       WARN_ON(entry);
> >
> >         DRM_DEBUG("new minor registered %d\n", minor->index);
> >         return 0;
> > @@ -187,16 +177,13 @@ static int drm_minor_register(struct drm_device *=
dev, unsigned int type)
> >  static void drm_minor_unregister(struct drm_device *dev, unsigned int =
type)
> >  {
> >         struct drm_minor *minor;
> > -       unsigned long flags;
> >
> >         minor =3D *drm_minor_get_slot(dev, type);
> >         if (!minor || !device_is_registered(minor->kdev))
> >                 return;
> >
> >         /* replace @minor with NULL so lookups will fail from now on */
> > -       spin_lock_irqsave(&drm_minor_lock, flags);
> > -       idr_replace(&drm_minors_idr, NULL, minor->index);
> > -       spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +       xa_store(&drm_minors_xa, minor->index, NULL, GFP_KERNEL);
> >
> >         device_del(minor->kdev);
> >         dev_set_drvdata(minor->kdev, NULL); /* safety belt */
> > @@ -215,13 +202,12 @@ static void drm_minor_unregister(struct drm_devic=
e *dev, unsigned int type)
> >  struct drm_minor *drm_minor_acquire(unsigned int minor_id)
> >  {
> >         struct drm_minor *minor;
> > -       unsigned long flags;
> >
> > -       spin_lock_irqsave(&drm_minor_lock, flags);
> > -       minor =3D idr_find(&drm_minors_idr, minor_id);
> > +       xa_lock(&drm_minors_xa);
> > +       minor =3D xa_load(&drm_minors_xa, minor_id);
Did you check this part ? Because this always gives me NULL...

I tried executing the following code in a dummy driver I wrote:

static DEFINE_XARRAY_ALLOC(xa_dummy);
void check_xa(void *pdev)
{
  void *entry;
  int ret, index;

  ret =3D xa_alloc(&xa_dummy, &index, NULL, XA_LIMIT(0, 63), GFP_NOWAIT);
  if (ret < 0)
      return ret;

  entry =3D xa_cmpxchg(&xa_dummy, index, NULL, pdev, GFP_KERNEL);
  if (xa_is_err(entry))
       return;

  xa_lock(&xa_dummy);
  xa_dev =3D xa_load(&xa_dummy, index);
  xa_unlock(&xa_dummy);
}

And to my surprise xa_dev is always NULL, when it should be pdev.
I believe that because we first allocate the entry with NULL, it is
considered a "zero" entry in the XA.
And when we replace it, this attribute doesn't change so when we do
xa_load, the xa code thinks the entry is a "zero" entry and returns
NULL.
If that's correct, you need to either fix xarray code or change the
flow of allocating this in drm.

If I send a real pointer (just a dummy object I allocated) instead of
NULL in xa_alloc, and then do xa_cmpxchg with pdev, xa_load returns
pdev successfully.
That points to the NULL being problematic in allocating an entry.

Oded


> >         if (minor)
> >                 drm_dev_get(minor->dev);
> > -       spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +       xa_unlock(&drm_minors_xa);
> >
> >         if (!minor) {
> >                 return ERR_PTR(-ENODEV);
> > @@ -1037,7 +1023,7 @@ static void drm_core_exit(void)
> >         unregister_chrdev(DRM_MAJOR, "drm");
> >         debugfs_remove(drm_debugfs_root);
> >         drm_sysfs_destroy();
> > -       idr_destroy(&drm_minors_idr);
> > +       WARN_ON(!xa_empty(&drm_minors_xa));
> >         drm_connector_ida_destroy();
> >  }
> >
> > @@ -1046,7 +1032,6 @@ static int __init drm_core_init(void)
> >         int ret;
> >
> >         drm_connector_ida_init();
> > -       idr_init(&drm_minors_idr);
> >         drm_memcpy_init_early();
> >
> >         ret =3D drm_sysfs_init();
> > --
> > 2.37.3
> >
