Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEEE534A70
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 08:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BC310F2F1;
	Thu, 26 May 2022 06:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D6710E472
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 15:51:30 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id i11so36970494ybq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 08:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U0WGHaQuHk/1B7NXEQbeJq4Fi4GItXCmVCjLq8xgU0s=;
 b=59hsDPgJOcR0dU6KyboTyagU7msKKY9+jNW74pFAJW00jX/gm1hzC+3OZUFJTlzQ8Y
 OYp6rmTanPcMBQdCplOyp73OzacRi1VssBLamQMetoSYcShIFPvMDQr8m0EesK4R6eFW
 rVB4XSKywverELAJzYb57piuUF7T2sitLK2dp9OIvEGU5YO7GZDYPeH1tclW3yEhINYr
 pp+A0uZPqfdvTlzvVlJtaoIq5pxG2iNLpVzxagRh049ZvqRRlVjc4At2daB6EEED1ymN
 22CoC9AZRk+bsCA3lLiyAk5JlTUH8W4INw0tQj8M+h+P5Cr6G5MBQWz0UJzOnCOgHKXF
 fQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U0WGHaQuHk/1B7NXEQbeJq4Fi4GItXCmVCjLq8xgU0s=;
 b=Nh30xnCbFnBNZr7yQarSKD/bb8FcoLnMTTQQ95trxWvHghFKSFCGBEVqLyy8UcB64S
 RsnLR2CFK1gQ9a9DJ6uQnckXQXd4Sf56xYeWtX/FrbNKdgowfo1gvJa5f9L9FSCPw78w
 H2IgPnuBlzpDKNUqvRYAch3hXJvszbqs8pNE+uU7N8UKpIFbdCdF9NIxQEDbZZvQRdlI
 1xSsUSqn0RF7YZReOfXWMv54tgebppFL7q8biKJXi9vJ7BUyGR/mtdos4OPeAuifT0Bs
 YifwyHRl1YHO80Pnb47FyHy8zqN7Z+CFR1WlBD9LeFOsIsiZllYA9SPAraBc3IZSH6Lp
 hVvQ==
X-Gm-Message-State: AOAM532BYmUCQw3KhM5IpZQwKG3IsGsbdr94Q/VSZovvy0r+UdP+MczK
 Wul9N0ncG5J0xtP+H9NMIrZS5zXj4D5ePGrdfBYrxQ==
X-Google-Smtp-Source: ABdhPJy197MNQzCu56hwzsLpb3kmOPKvx3JGbbR7r+CTNWGWDLXqu+zdfSLuq/xEtV8unFsSWlIiWjYyKy6ZMfXxXYg=
X-Received: by 2002:a25:c003:0:b0:64d:6291:a6b with SMTP id
 c3-20020a25c003000000b0064d62910a6bmr30077456ybf.19.1653493889273; Wed, 25
 May 2022 08:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220506180216.2095060-1-jason@jlekstrand.net>
 <20220506180216.2095060-2-jason@jlekstrand.net>
 <8bdd71c9-970b-219c-0d5d-67eabe1ab11b@amd.com>
 <Yo4tEIouNU04Z3H1@phenom.ffwll.local>
 <CAOFGe976kGheo-7kJiz-RrmUGcuX9A4cnJkgDg7Vc_yAPh=FhA@mail.gmail.com>
 <Yo5OqSLqUkV0ncmh@phenom.ffwll.local>
In-Reply-To: <Yo5OqSLqUkV0ncmh@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 25 May 2022 10:51:18 -0500
Message-ID: <CAOFGe95rLq5wA+Eg5CdytCuTPU9Ro_mXw0cP2MoqfWL_9xvxyQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dma-buf: Add an API for exporting sync files (v14)
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="000000000000e8a79705dfd80b3d"
X-Mailman-Approved-At: Thu, 26 May 2022 06:47:10 +0000
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
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000e8a79705dfd80b3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 10:43 AM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, May 25, 2022 at 10:35:47AM -0500, Jason Ekstrand wrote:
> > On Wed, May 25, 2022 at 8:20 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > On Mon, May 09, 2022 at 07:54:19AM +0200, Christian K=C3=B6nig wrote:
> > > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for th=
e
> series.
> > > >
> > > > I assume you have the userspace part ready as well? If yes let's pu=
sh
> > > this
> > > > to drm-misc-next asap.
> > >
> > > Hopefully I'm not too late, but I think all my review has also been
> > > addressed. On the series:
> > >
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >
> >
> > Thanks!  If Christian hasn't already, can we get this in drm-misc-next
> > please?  I don't have access AFAIK.
>
> We need to fix this?
>

I don't do enough kernel dev to be worth giving access, I don't think.
It's infrequent enough that I'm going to have to ask someone else how to
use the tools to push stuff every time anyway.

--Jason



> -Daniel
> >
> > --Jason
> >
> >
> >
> > > >
> > > > Christian.
> > > >
> > > > Am 06.05.22 um 20:02 schrieb Jason Ekstrand:
> > > > > Modern userspace APIs like Vulkan are built on an explicit
> > > > > synchronization model.  This doesn't always play nicely with the
> > > > > implicit synchronization used in the kernel and assumed by X11 an=
d
> > > > > Wayland.  The client -> compositor half of the synchronization
> isn't
> > > too
> > > > > bad, at least on intel, because we can control whether or not i91=
5
> > > > > synchronizes on the buffer and whether or not it's considered
> written.
> > > > >
> > > > > The harder part is the compositor -> client synchronization when
> we get
> > > > > the buffer back from the compositor.  We're required to be able t=
o
> > > > > provide the client with a VkSemaphore and VkFence representing th=
e
> > > point
> > > > > in time where the window system (compositor and/or display)
> finished
> > > > > using the buffer.  With current APIs, it's very hard to do this i=
n
> such
> > > > > a way that we don't get confused by the Vulkan driver's access of
> the
> > > > > buffer.  In particular, once we tell the kernel that we're
> rendering to
> > > > > the buffer again, any CPU waits on the buffer or GPU dependencies
> will
> > > > > wait on some of the client rendering and not just the compositor.
> > > > >
> > > > > This new IOCTL solves this problem by allowing us to get a
> snapshot of
> > > > > the implicit synchronization state of a given dma-buf in the form
> of a
> > > > > sync file.  It's effectively the same as a poll() or I915_GEM_WAI=
T
> > > only,
> > > > > instead of CPU waiting directly, it encapsulates the wait
> operation, at
> > > > > the current moment in time, in a sync_file so we can check/wait o=
n
> it
> > > > > later.  As long as the Vulkan driver does the sync_file export
> from the
> > > > > dma-buf before we re-introduce it for rendering, it will only
> contain
> > > > > fences from the compositor or display.  This allows to accurately
> turn
> > > > > it into a VkFence or VkSemaphore without any over-synchronization=
.
> > > > >
> > > > > By making this an ioctl on the dma-buf itself, it allows this new
> > > > > functionality to be used in an entirely driver-agnostic way witho=
ut
> > > > > having access to a DRM fd. This makes it ideal for use in
> > > driver-generic
> > > > > code in Mesa or in a client such as a compositor where the DRM fd
> may
> > > be
> > > > > hard to reach.
> > > > >
> > > > > v2 (Jason Ekstrand):
> > > > >   - Use a wrapper dma_fence_array of all fences including the new
> one
> > > > >     when importing an exclusive fence.
> > > > >
> > > > > v3 (Jason Ekstrand):
> > > > >   - Lock around setting shared fences as well as exclusive
> > > > >   - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
> > > > >   - Initialize ret to 0 in dma_buf_wait_sync_file
> > > > >
> > > > > v4 (Jason Ekstrand):
> > > > >   - Use the new dma_resv_get_singleton helper
> > > > >
> > > > > v5 (Jason Ekstrand):
> > > > >   - Rename the IOCTLs to import/export rather than wait/signal
> > > > >   - Drop the WRITE flag and always get/set the exclusive fence
> > > > >
> > > > > v6 (Jason Ekstrand):
> > > > >   - Drop the sync_file import as it was all-around sketchy and no=
t
> > > nearly
> > > > >     as useful as import.
> > > > >   - Re-introduce READ/WRITE flag support for export
> > > > >   - Rework the commit message
> > > > >
> > > > > v7 (Jason Ekstrand):
> > > > >   - Require at least one sync flag
> > > > >   - Fix a refcounting bug: dma_resv_get_excl() doesn't take a
> reference
> > > > >   - Use _rcu helpers since we're accessing the dma_resv read-only
> > > > >
> > > > > v8 (Jason Ekstrand):
> > > > >   - Return -ENOMEM if the sync_file_create fails
> > > > >   - Predicate support on IS_ENABLED(CONFIG_SYNC_FILE)
> > > > >
> > > > > v9 (Jason Ekstrand):
> > > > >   - Add documentation for the new ioctl
> > > > >
> > > > > v10 (Jason Ekstrand):
> > > > >   - Go back to dma_buf_sync_file as the ioctl struct name
> > > > >
> > > > > v11 (Daniel Vetter):
> > > > >   - Go back to dma_buf_export_sync_file as the ioctl struct name
> > > > >   - Better kerneldoc describing what the read/write flags do
> > > > >
> > > > > v12 (Christian K=C3=B6nig):
> > > > >   - Document why we chose to make it an ioctl on dma-buf
> > > > >
> > > > > v13 (Jason Ekstrand):
> > > > >   - Rebase on Christian K=C3=B6nig's fence rework
> > > > >
> > > > > v14 (Daniel Vetter & Christian K=C3=B6nig):
> > > > >   - Use dma_rev_usage_rw to get the properly inverted usage to
> pass to
> > > > >     dma_resv_get_singleton()
> > > > >   - Clean up the sync_file and fd if copy_to_user() fails
> > > > >
> > > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > > Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>
> > > > > Signed-off-by: Jason Ekstrand <jason.ekstrand@collabora.com>
> > > > > Acked-by: Simon Ser <contact@emersion.fr>
> > > > > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > ---
> > > > >   drivers/dma-buf/dma-buf.c    | 67
> > > ++++++++++++++++++++++++++++++++++++
> > > > >   include/uapi/linux/dma-buf.h | 35 +++++++++++++++++++
> > > > >   2 files changed, 102 insertions(+)
> > > > >
> > > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.=
c
> > > > > index 79795857be3e..6ff54f7e6119 100644
> > > > > --- a/drivers/dma-buf/dma-buf.c
> > > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > > @@ -20,6 +20,7 @@
> > > > >   #include <linux/debugfs.h>
> > > > >   #include <linux/module.h>
> > > > >   #include <linux/seq_file.h>
> > > > > +#include <linux/sync_file.h>
> > > > >   #include <linux/poll.h>
> > > > >   #include <linux/dma-resv.h>
> > > > >   #include <linux/mm.h>
> > > > > @@ -192,6 +193,9 @@ static loff_t dma_buf_llseek(struct file *fil=
e,
> > > loff_t offset, int whence)
> > > > >    * Note that this only signals the completion of the respective
> > > fences, i.e. the
> > > > >    * DMA transfers are complete. Cache flushing and any other
> necessary
> > > > >    * preparations before CPU access can begin still need to happe=
n.
> > > > > + *
> > > > > + * As an alternative to poll(), the set of fences on DMA buffer
> can be
> > > > > + * exported as a &sync_file using &dma_buf_sync_file_export.
> > > > >    */
> > > > >   static void dma_buf_poll_cb(struct dma_fence *fence, struct
> > > dma_fence_cb *cb)
> > > > > @@ -326,6 +330,64 @@ static long dma_buf_set_name(struct dma_buf
> > > *dmabuf, const char __user *buf)
> > > > >     return 0;
> > > > >   }
> > > > > +#if IS_ENABLED(CONFIG_SYNC_FILE)
> > > > > +static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
> > > > > +                                void __user *user_data)
> > > > > +{
> > > > > +   struct dma_buf_export_sync_file arg;
> > > > > +   enum dma_resv_usage usage;
> > > > > +   struct dma_fence *fence =3D NULL;
> > > > > +   struct sync_file *sync_file;
> > > > > +   int fd, ret;
> > > > > +
> > > > > +   if (copy_from_user(&arg, user_data, sizeof(arg)))
> > > > > +           return -EFAULT;
> > > > > +
> > > > > +   if (arg.flags & ~DMA_BUF_SYNC_RW)
> > > > > +           return -EINVAL;
> > > > > +
> > > > > +   if ((arg.flags & DMA_BUF_SYNC_RW) =3D=3D 0)
> > > > > +           return -EINVAL;
> > > > > +
> > > > > +   fd =3D get_unused_fd_flags(O_CLOEXEC);
> > > > > +   if (fd < 0)
> > > > > +           return fd;
> > > > > +
> > > > > +   usage =3D dma_resv_usage_rw(arg.flags & DMA_BUF_SYNC_WRITE);
> > > > > +   ret =3D dma_resv_get_singleton(dmabuf->resv, usage, &fence);
> > > > > +   if (ret)
> > > > > +           goto err_put_fd;
> > > > > +
> > > > > +   if (!fence)
> > > > > +           fence =3D dma_fence_get_stub();
> > > > > +
> > > > > +   sync_file =3D sync_file_create(fence);
> > > > > +
> > > > > +   dma_fence_put(fence);
> > > > > +
> > > > > +   if (!sync_file) {
> > > > > +           ret =3D -ENOMEM;
> > > > > +           goto err_put_fd;
> > > > > +   }
> > > > > +
> > > > > +   arg.fd =3D fd;
> > > > > +   if (copy_to_user(user_data, &arg, sizeof(arg))) {
> > > > > +           ret =3D -EFAULT;
> > > > > +           goto err_put_file;
> > > > > +   }
> > > > > +
> > > > > +   fd_install(fd, sync_file->file);
> > > > > +
> > > > > +   return 0;
> > > > > +
> > > > > +err_put_file:
> > > > > +   fput(sync_file->file);
> > > > > +err_put_fd:
> > > > > +   put_unused_fd(fd);
> > > > > +   return ret;
> > > > > +}
> > > > > +#endif
> > > > > +
> > > > >   static long dma_buf_ioctl(struct file *file,
> > > > >                       unsigned int cmd, unsigned long arg)
> > > > >   {
> > > > > @@ -369,6 +431,11 @@ static long dma_buf_ioctl(struct file *file,
> > > > >     case DMA_BUF_SET_NAME_B:
> > > > >             return dma_buf_set_name(dmabuf, (const char __user
> *)arg);
> > > > > +#if IS_ENABLED(CONFIG_SYNC_FILE)
> > > > > +   case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
> > > > > +           return dma_buf_export_sync_file(dmabuf, (void __user
> > > *)arg);
> > > > > +#endif
> > > > > +
> > > > >     default:
> > > > >             return -ENOTTY;
> > > > >     }
> > > > > diff --git a/include/uapi/linux/dma-buf.h
> > > b/include/uapi/linux/dma-buf.h
> > > > > index 8e4a2ca0bcbf..46f1e3e98b02 100644
> > > > > --- a/include/uapi/linux/dma-buf.h
> > > > > +++ b/include/uapi/linux/dma-buf.h
> > > > > @@ -85,6 +85,40 @@ struct dma_buf_sync {
> > > > >   #define DMA_BUF_NAME_LEN  32
> > > > > +/**
> > > > > + * struct dma_buf_export_sync_file - Get a sync_file from a
> dma-buf
> > > > > + *
> > > > > + * Userspace can perform a DMA_BUF_IOCTL_EXPORT_SYNC_FILE to
> retrieve
> > > the
> > > > > + * current set of fences on a dma-buf file descriptor as a
> > > sync_file.  CPU
> > > > > + * waits via poll() or other driver-specific mechanisms typicall=
y
> > > wait on
> > > > > + * whatever fences are on the dma-buf at the time the wait begin=
s.
> > > This
> > > > > + * is similar except that it takes a snapshot of the current
> fences
> > > on the
> > > > > + * dma-buf for waiting later instead of waiting immediately.
> This is
> > > > > + * useful for modern graphics APIs such as Vulkan which assume a=
n
> > > explicit
> > > > > + * synchronization model but still need to inter-operate with
> dma-buf.
> > > > > + */
> > > > > +struct dma_buf_export_sync_file {
> > > > > +   /**
> > > > > +    * @flags: Read/write flags
> > > > > +    *
> > > > > +    * Must be DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE, or both.
> > > > > +    *
> > > > > +    * If DMA_BUF_SYNC_READ is set and DMA_BUF_SYNC_WRITE is not
> set,
> > > > > +    * the returned sync file waits on any writers of the dma-buf
> to
> > > > > +    * complete.  Waiting on the returned sync file is equivalent
> to
> > > > > +    * poll() with POLLIN.
> > > > > +    *
> > > > > +    * If DMA_BUF_SYNC_WRITE is set, the returned sync file waits
> on
> > > > > +    * any users of the dma-buf (read or write) to complete.
> Waiting
> > > > > +    * on the returned sync file is equivalent to poll() with
> POLLOUT.
> > > > > +    * If both DMA_BUF_SYNC_WRITE and DMA_BUF_SYNC_READ are set,
> this
> > > > > +    * is equivalent to just DMA_BUF_SYNC_WRITE.
> > > > > +    */
> > > > > +   __u32 flags;
> > > > > +   /** @fd: Returned sync file descriptor */
> > > > > +   __s32 fd;
> > > > > +};
> > > > > +
> > > > >   #define DMA_BUF_BASE              'b'
> > > > >   #define DMA_BUF_IOCTL_SYNC        _IOW(DMA_BUF_BASE, 0, struct
> > > dma_buf_sync)
> > > > > @@ -94,5 +128,6 @@ struct dma_buf_sync {
> > > > >   #define DMA_BUF_SET_NAME  _IOW(DMA_BUF_BASE, 1, const char *)
> > > > >   #define DMA_BUF_SET_NAME_A        _IOW(DMA_BUF_BASE, 1, u32)
> > > > >   #define DMA_BUF_SET_NAME_B        _IOW(DMA_BUF_BASE, 1, u64)
> > > > > +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE     _IOWR(DMA_BUF_BASE, 2=
,
> > > struct dma_buf_export_sync_file)
> > > > >   #endif
> > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000e8a79705dfd80b3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, May 25, 2022 at 10:43 AM Daniel Vetter &lt;<a href=3D"mailto=
:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Wed, May 25, 2022 at 10:35:47AM -0500, =
Jason Ekstrand wrote:<br>
&gt; On Wed, May 25, 2022 at 8:20 AM Daniel Vetter &lt;<a href=3D"mailto:da=
niel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Mon, May 09, 2022 at 07:54:19AM +0200, Christian K=C3=B6nig wr=
ote:<br>
&gt; &gt; &gt; Reviewed-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:chri=
stian.koenig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt; fo=
r the series.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I assume you have the userspace part ready as well? If yes l=
et&#39;s push<br>
&gt; &gt; this<br>
&gt; &gt; &gt; to drm-misc-next asap.<br>
&gt; &gt;<br>
&gt; &gt; Hopefully I&#39;m not too late, but I think all my review has als=
o been<br>
&gt; &gt; addressed. On the series:<br>
&gt; &gt;<br>
&gt; &gt; Reviewed-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ff=
wll.ch" target=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; Thanks!=C2=A0 If Christian hasn&#39;t already, can we get this in drm-=
misc-next<br>
&gt; please?=C2=A0 I don&#39;t have access AFAIK.<br>
<br>
We need to fix this?<br></blockquote><div><br></div><div>I don&#39;t do eno=
ugh kernel dev to be worth giving access, I don&#39;t think.=C2=A0 It&#39;s=
 infrequent enough that I&#39;m going to have to ask someone else how to us=
e the tools to push stuff every time anyway.</div><div><br></div><div>--Jas=
on</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
-Daniel<br>
&gt; <br>
&gt; --Jason<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Christian.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Am 06.05.22 um 20:02 schrieb Jason Ekstrand:<br>
&gt; &gt; &gt; &gt; Modern userspace APIs like Vulkan are built on an expli=
cit<br>
&gt; &gt; &gt; &gt; synchronization model.=C2=A0 This doesn&#39;t always pl=
ay nicely with the<br>
&gt; &gt; &gt; &gt; implicit synchronization used in the kernel and assumed=
 by X11 and<br>
&gt; &gt; &gt; &gt; Wayland.=C2=A0 The client -&gt; compositor half of the =
synchronization isn&#39;t<br>
&gt; &gt; too<br>
&gt; &gt; &gt; &gt; bad, at least on intel, because we can control whether =
or not i915<br>
&gt; &gt; &gt; &gt; synchronizes on the buffer and whether or not it&#39;s =
considered written.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The harder part is the compositor -&gt; client synchron=
ization when we get<br>
&gt; &gt; &gt; &gt; the buffer back from the compositor.=C2=A0 We&#39;re re=
quired to be able to<br>
&gt; &gt; &gt; &gt; provide the client with a VkSemaphore and VkFence repre=
senting the<br>
&gt; &gt; point<br>
&gt; &gt; &gt; &gt; in time where the window system (compositor and/or disp=
lay) finished<br>
&gt; &gt; &gt; &gt; using the buffer.=C2=A0 With current APIs, it&#39;s ver=
y hard to do this in such<br>
&gt; &gt; &gt; &gt; a way that we don&#39;t get confused by the Vulkan driv=
er&#39;s access of the<br>
&gt; &gt; &gt; &gt; buffer.=C2=A0 In particular, once we tell the kernel th=
at we&#39;re rendering to<br>
&gt; &gt; &gt; &gt; the buffer again, any CPU waits on the buffer or GPU de=
pendencies will<br>
&gt; &gt; &gt; &gt; wait on some of the client rendering and not just the c=
ompositor.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This new IOCTL solves this problem by allowing us to ge=
t a snapshot of<br>
&gt; &gt; &gt; &gt; the implicit synchronization state of a given dma-buf i=
n the form of a<br>
&gt; &gt; &gt; &gt; sync file.=C2=A0 It&#39;s effectively the same as a pol=
l() or I915_GEM_WAIT<br>
&gt; &gt; only,<br>
&gt; &gt; &gt; &gt; instead of CPU waiting directly, it encapsulates the wa=
it operation, at<br>
&gt; &gt; &gt; &gt; the current moment in time, in a sync_file so we can ch=
eck/wait on it<br>
&gt; &gt; &gt; &gt; later.=C2=A0 As long as the Vulkan driver does the sync=
_file export from the<br>
&gt; &gt; &gt; &gt; dma-buf before we re-introduce it for rendering, it wil=
l only contain<br>
&gt; &gt; &gt; &gt; fences from the compositor or display.=C2=A0 This allow=
s to accurately turn<br>
&gt; &gt; &gt; &gt; it into a VkFence or VkSemaphore without any over-synch=
ronization.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; By making this an ioctl on the dma-buf itself, it allow=
s this new<br>
&gt; &gt; &gt; &gt; functionality to be used in an entirely driver-agnostic=
 way without<br>
&gt; &gt; &gt; &gt; having access to a DRM fd. This makes it ideal for use =
in<br>
&gt; &gt; driver-generic<br>
&gt; &gt; &gt; &gt; code in Mesa or in a client such as a compositor where =
the DRM fd may<br>
&gt; &gt; be<br>
&gt; &gt; &gt; &gt; hard to reach.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; v2 (Jason Ekstrand):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Use a wrapper dma_fence_array of all fenc=
es including the new one<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0when importing an exclusive fence.<b=
r>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; v3 (Jason Ekstrand):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Lock around setting shared fences as well=
 as exclusive<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Mark SIGNAL_SYNC_FILE as a read-write ioc=
tl.<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Initialize ret to 0 in dma_buf_wait_sync_=
file<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; v4 (Jason Ekstrand):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Use the new dma_resv_get_singleton helper=
<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; v5 (Jason Ekstrand):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Rename the IOCTLs to import/export rather=
 than wait/signal<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Drop the WRITE flag and always get/set th=
e exclusive fence<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; v6 (Jason Ekstrand):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Drop the sync_file import as it was all-a=
round sketchy and not<br>
&gt; &gt; nearly<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0as useful as import.<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Re-introduce READ/WRITE flag support for =
export<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Rework the commit message<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; v7 (Jason Ekstrand):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Require at least one sync flag<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Fix a refcounting bug: dma_resv_get_excl(=
) doesn&#39;t take a reference<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Use _rcu helpers since we&#39;re accessin=
g the dma_resv read-only<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; v8 (Jason Ekstrand):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Return -ENOMEM if the sync_file_create fa=
ils<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Predicate support on IS_ENABLED(CONFIG_SY=
NC_FILE)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; v9 (Jason Ekstrand):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Add documentation for the new ioctl<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; v10 (Jason Ekstrand):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Go back to dma_buf_sync_file as the ioctl=
 struct name<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; v11 (Daniel Vetter):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Go back to dma_buf_export_sync_file as th=
e ioctl struct name<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Better kerneldoc describing what the read=
/write flags do<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; v12 (Christian K=C3=B6nig):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Document why we chose to make it an ioctl=
 on dma-buf<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; v13 (Jason Ekstrand):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Rebase on Christian K=C3=B6nig&#39;s fenc=
e rework<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; v14 (Daniel Vetter &amp; Christian K=C3=B6nig):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Use dma_rev_usage_rw to get the properly =
inverted usage to pass to<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dma_resv_get_singleton()<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Clean up the sync_file and fd if copy_to_=
user() fails<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Jason Ekstrand &lt;<a href=3D"mailto:jas=
on@jlekstrand.net" target=3D"_blank">jason@jlekstrand.net</a>&gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Jason Ekstrand &lt;<a href=3D"mailto:jas=
on.ekstrand@intel.com" target=3D"_blank">jason.ekstrand@intel.com</a>&gt;<b=
r>
&gt; &gt; &gt; &gt; Signed-off-by: Jason Ekstrand &lt;<a href=3D"mailto:jas=
on.ekstrand@collabora.com" target=3D"_blank">jason.ekstrand@collabora.com</=
a>&gt;<br>
&gt; &gt; &gt; &gt; Acked-by: Simon Ser &lt;<a href=3D"mailto:contact@emers=
ion.fr" target=3D"_blank">contact@emersion.fr</a>&gt;<br>
&gt; &gt; &gt; &gt; Acked-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:ch=
ristian.koenig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<=
br>
&gt; &gt; &gt; &gt; Reviewed-by: Daniel Vetter &lt;<a href=3D"mailto:daniel=
.vetter@ffwll.ch" target=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
&gt; &gt; &gt; &gt; Cc: Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@lin=
aro.org" target=3D"_blank">sumit.semwal@linaro.org</a>&gt;<br>
&gt; &gt; &gt; &gt; Cc: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lan=
khorst@linux.intel.com" target=3D"_blank">maarten.lankhorst@linux.intel.com=
</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0drivers/dma-buf/dma-buf.c=C2=A0 =C2=A0 | 67=
<br>
&gt; &gt; ++++++++++++++++++++++++++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0include/uapi/linux/dma-buf.h | 35 +++++++++=
++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A02 files changed, 102 insertions(+)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-bu=
f/dma-buf.c<br>
&gt; &gt; &gt; &gt; index 79795857be3e..6ff54f7e6119 100644<br>
&gt; &gt; &gt; &gt; --- a/drivers/dma-buf/dma-buf.c<br>
&gt; &gt; &gt; &gt; +++ b/drivers/dma-buf/dma-buf.c<br>
&gt; &gt; &gt; &gt; @@ -20,6 +20,7 @@<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#include &lt;linux/debugfs.h&gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#include &lt;linux/module.h&gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#include &lt;linux/seq_file.h&gt;<br>
&gt; &gt; &gt; &gt; +#include &lt;linux/sync_file.h&gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#include &lt;linux/poll.h&gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#include &lt;linux/dma-resv.h&gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#include &lt;linux/mm.h&gt;<br>
&gt; &gt; &gt; &gt; @@ -192,6 +193,9 @@ static loff_t dma_buf_llseek(struct=
 file *file,<br>
&gt; &gt; loff_t offset, int whence)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 * Note that this only signals the completi=
on of the respective<br>
&gt; &gt; fences, i.e. the<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 * DMA transfers are complete. Cache flushi=
ng and any other necessary<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 * preparations before CPU access can begin=
 still need to happen.<br>
&gt; &gt; &gt; &gt; + *<br>
&gt; &gt; &gt; &gt; + * As an alternative to poll(), the set of fences on D=
MA buffer can be<br>
&gt; &gt; &gt; &gt; + * exported as a &amp;sync_file using &amp;dma_buf_syn=
c_file_export.<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 */<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0static void dma_buf_poll_cb(struct dma_fenc=
e *fence, struct<br>
&gt; &gt; dma_fence_cb *cb)<br>
&gt; &gt; &gt; &gt; @@ -326,6 +330,64 @@ static long dma_buf_set_name(struc=
t dma_buf<br>
&gt; &gt; *dmabuf, const char __user *buf)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; +#if IS_ENABLED(CONFIG_SYNC_FILE)<br>
&gt; &gt; &gt; &gt; +static long dma_buf_export_sync_file(struct dma_buf *d=
mabuf,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void __user *us=
er_data)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0struct dma_buf_export_sync_file arg;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0enum dma_resv_usage usage;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0struct dma_fence *fence =3D NULL;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0struct sync_file *sync_file;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0int fd, ret;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0if (copy_from_user(&amp;arg, user_data, s=
izeof(arg)))<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAUL=
T;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0if (arg.flags &amp; ~DMA_BUF_SYNC_RW)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVA=
L;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0if ((arg.flags &amp; DMA_BUF_SYNC_RW) =3D=
=3D 0)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVA=
L;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0fd =3D get_unused_fd_flags(O_CLOEXEC);<br=
>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0if (fd &lt; 0)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fd;<br=
>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0usage =3D dma_resv_usage_rw(arg.flags &am=
p; DMA_BUF_SYNC_WRITE);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0ret =3D dma_resv_get_singleton(dmabuf-&gt=
;resv, usage, &amp;fence);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0if (ret)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_put_=
fd;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0if (!fence)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fence =3D dma=
_fence_get_stub();<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0sync_file =3D sync_file_create(fence);<br=
>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0dma_fence_put(fence);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0if (!sync_file) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOM=
EM;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_put_=
fd;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0arg.fd =3D fd;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0if (copy_to_user(user_data, &amp;arg, siz=
eof(arg))) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EFAU=
LT;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_put_=
file;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0fd_install(fd, sync_file-&gt;file);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +err_put_file:<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0fput(sync_file-&gt;file);<br>
&gt; &gt; &gt; &gt; +err_put_fd:<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0put_unused_fd(fd);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0return ret;<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +#endif<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0static long dma_buf_ioctl(struct file *file=
,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int cmd, unsigned long arg)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0{<br>
&gt; &gt; &gt; &gt; @@ -369,6 +431,11 @@ static long dma_buf_ioctl(struct f=
ile *file,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0case DMA_BUF_SET_NAME_B:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return d=
ma_buf_set_name(dmabuf, (const char __user *)arg);<br>
&gt; &gt; &gt; &gt; +#if IS_ENABLED(CONFIG_SYNC_FILE)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dma_bu=
f_export_sync_file(dmabuf, (void __user<br>
&gt; &gt; *)arg);<br>
&gt; &gt; &gt; &gt; +#endif<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -=
ENOTTY;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; diff --git a/include/uapi/linux/dma-buf.h<br>
&gt; &gt; b/include/uapi/linux/dma-buf.h<br>
&gt; &gt; &gt; &gt; index 8e4a2ca0bcbf..46f1e3e98b02 100644<br>
&gt; &gt; &gt; &gt; --- a/include/uapi/linux/dma-buf.h<br>
&gt; &gt; &gt; &gt; +++ b/include/uapi/linux/dma-buf.h<br>
&gt; &gt; &gt; &gt; @@ -85,6 +85,40 @@ struct dma_buf_sync {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#define DMA_BUF_NAME_LEN=C2=A0 32<br>
&gt; &gt; &gt; &gt; +/**<br>
&gt; &gt; &gt; &gt; + * struct dma_buf_export_sync_file - Get a sync_file f=
rom a dma-buf<br>
&gt; &gt; &gt; &gt; + *<br>
&gt; &gt; &gt; &gt; + * Userspace can perform a DMA_BUF_IOCTL_EXPORT_SYNC_F=
ILE to retrieve<br>
&gt; &gt; the<br>
&gt; &gt; &gt; &gt; + * current set of fences on a dma-buf file descriptor =
as a<br>
&gt; &gt; sync_file.=C2=A0 CPU<br>
&gt; &gt; &gt; &gt; + * waits via poll() or other driver-specific mechanism=
s typically<br>
&gt; &gt; wait on<br>
&gt; &gt; &gt; &gt; + * whatever fences are on the dma-buf at the time the =
wait begins.<br>
&gt; &gt; This<br>
&gt; &gt; &gt; &gt; + * is similar except that it takes a snapshot of the c=
urrent fences<br>
&gt; &gt; on the<br>
&gt; &gt; &gt; &gt; + * dma-buf for waiting later instead of waiting immedi=
ately.=C2=A0 This is<br>
&gt; &gt; &gt; &gt; + * useful for modern graphics APIs such as Vulkan whic=
h assume an<br>
&gt; &gt; explicit<br>
&gt; &gt; &gt; &gt; + * synchronization model but still need to inter-opera=
te with dma-buf.<br>
&gt; &gt; &gt; &gt; + */<br>
&gt; &gt; &gt; &gt; +struct dma_buf_export_sync_file {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0/**<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 * @flags: Read/write flags<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 *<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 * Must be DMA_BUF_SYNC_READ, DMA_BUF_SYN=
C_WRITE, or both.<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 *<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 * If DMA_BUF_SYNC_READ is set and DMA_BU=
F_SYNC_WRITE is not set,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 * the returned sync file waits on any wr=
iters of the dma-buf to<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 * complete.=C2=A0 Waiting on the returne=
d sync file is equivalent to<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 * poll() with POLLIN.<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 *<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 * If DMA_BUF_SYNC_WRITE is set, the retu=
rned sync file waits on<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 * any users of the dma-buf (read or writ=
e) to complete.=C2=A0 Waiting<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 * on the returned sync file is equivalen=
t to poll() with POLLOUT.<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 * If both DMA_BUF_SYNC_WRITE and DMA_BUF=
_SYNC_READ are set, this<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 * is equivalent to just DMA_BUF_SYNC_WRI=
TE.<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0__u32 flags;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0/** @fd: Returned sync file descriptor */=
<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0__s32 fd;<br>
&gt; &gt; &gt; &gt; +};<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#define DMA_BUF_BASE=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;b&#39;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#define DMA_BUF_IOCTL_SYNC=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 _IOW(DMA_BUF_BASE, 0, struct<br>
&gt; &gt; dma_buf_sync)<br>
&gt; &gt; &gt; &gt; @@ -94,5 +128,6 @@ struct dma_buf_sync {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#define DMA_BUF_SET_NAME=C2=A0 _IOW(DMA_BUF=
_BASE, 1, const char *)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#define DMA_BUF_SET_NAME_A=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 _IOW(DMA_BUF_BASE, 1, u32)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#define DMA_BUF_SET_NAME_B=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 _IOW(DMA_BUF_BASE, 1, u64)<br>
&gt; &gt; &gt; &gt; +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE=C2=A0 =C2=A0 =
=C2=A0_IOWR(DMA_BUF_BASE, 2,<br>
&gt; &gt; struct dma_buf_export_sync_file)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#endif<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Daniel Vetter<br>
&gt; &gt; Software Engineer, Intel Corporation<br>
&gt; &gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_bl=
ank">http://blog.ffwll.ch</a><br>
&gt; &gt;<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div></div>

--000000000000e8a79705dfd80b3d--
