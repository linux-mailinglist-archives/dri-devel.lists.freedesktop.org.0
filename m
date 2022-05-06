Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE4351D58D
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4283B10FD0E;
	Fri,  6 May 2022 10:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4F510FF7D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 00:11:43 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f7d7e3b5bfso65694767b3.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 17:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nmup9VJjCZ6TZF2+xyvCLGKSlcvRC/NMak/GaZxZe50=;
 b=UUiWePVmET3spybwtIPEu2qhY2ADyFBccy9cfOnD6zu+In5gpjPvzXO6x302LofI39
 ArANbCurB5fmrDsauPlJFAISX8umstsctH9RFhNEpd0YwZhLJP3B3PZAqblgSSpjcF8y
 n6pcIycXLM4TA5Xi/wdwI2rTkFcjRLmdo057q2MeVVNvC5aHGLfmPMHpeVlUks3ehI0S
 u0hhF5e8nOHT2XOewz7QNTI1sp+hKmwfdP6xNkYifIe4gu3RGQlTTcwkxaPwfthxvIq1
 +M2mpO9ryJRH0TK+lhvhsDeFzY4oPwBakqNQvi70ZeD42V1vd64zhNjs8hnsCovPIWNj
 nemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nmup9VJjCZ6TZF2+xyvCLGKSlcvRC/NMak/GaZxZe50=;
 b=Rs+er7/BB2qX+cCGGoJ5A44mdZecyk/o7DmZlxSxS5Gj+JBmwjO/K3tY8tIpAp6nvP
 9i8FDTcxT6tfxBTu46nvCgfITQZjFcnAY1OkjeeNB28AkHyuKF6FzkKB72NWEZZmZilN
 JidiAzWq9RGnfAcoBgpbPyNyOdSjcp9tMNt3Vzq5w4/QQXrVE1iFB7XKUHQi+VC/eJjC
 ffsV6DnMcq6Pq6KsBBu4F+/aGrsAv+NMfWETzi5vVEFFOvdzQpqlC7x7WUae/qS2T7rk
 d1A7spTBOYlIcFknc0ElpOEzojkiDvoily/O8m81/FchvX39H4mS3L2ichCerT3pAyQw
 MCvg==
X-Gm-Message-State: AOAM5303n29lwk4hjcSF5EukXUSbij/0+FPe/WwdqLZda+xHgYeLxLqP
 pk3cB1iEJd5QJ7Ap7FrjjSEP8kd5StrZRLo/WWWcag==
X-Google-Smtp-Source: ABdhPJwcW7Byr5Uxl0RDTxRF7FD7zzfE+hl40cyB7lXkBQy+hzfm+pmWcuAv15V/JTXk4qO9tfxBX8U+XCRLeUKl9BY=
X-Received: by 2002:a81:f0e:0:b0:2f7:d523:e49d with SMTP id
 14-20020a810f0e000000b002f7d523e49dmr535179ywp.311.1651795901914; Thu, 05 May
 2022 17:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220504203404.1495485-1-jason@jlekstrand.net>
 <20220504203404.1495485-2-jason@jlekstrand.net>
 <YnMC8xKCUqfaHtfT@phenom.ffwll.local>
 <CAOFGe96JygpUXNxHRKuRdosYebJ4nneDJ9PZJGjEi2vUdGgHHg@mail.gmail.com>
 <YnOJkONcKR2Ll7bK@phenom.ffwll.local>
In-Reply-To: <YnOJkONcKR2Ll7bK@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 5 May 2022 19:11:30 -0500
Message-ID: <CAOFGe95fpHv9dV2PsM01rRv-B0Qhxp=ug7sF-f1cigKtqw-izQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dma-buf: Add an API for exporting sync files (v13)
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="000000000000f9b27205de4cb39d"
X-Mailman-Approved-At: Fri, 06 May 2022 10:19:04 +0000
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f9b27205de4cb39d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 5, 2022 at 3:23 AM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, May 05, 2022 at 03:05:44AM -0500, Jason Ekstrand wrote:
> > On Wed, May 4, 2022 at 5:49 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > On Wed, May 04, 2022 at 03:34:03PM -0500, Jason Ekstrand wrote:
> > > > Modern userspace APIs like Vulkan are built on an explicit
> > > > synchronization model.  This doesn't always play nicely with the
> > > > implicit synchronization used in the kernel and assumed by X11 and
> > > > Wayland.  The client -> compositor half of the synchronization isn'=
t
> too
> > > > bad, at least on intel, because we can control whether or not i915
> > > > synchronizes on the buffer and whether or not it's considered
> written.
> > > >
> > > > The harder part is the compositor -> client synchronization when we
> get
> > > > the buffer back from the compositor.  We're required to be able to
> > > > provide the client with a VkSemaphore and VkFence representing the
> point
> > > > in time where the window system (compositor and/or display) finishe=
d
> > > > using the buffer.  With current APIs, it's very hard to do this in
> such
> > > > a way that we don't get confused by the Vulkan driver's access of t=
he
> > > > buffer.  In particular, once we tell the kernel that we're renderin=
g
> to
> > > > the buffer again, any CPU waits on the buffer or GPU dependencies
> will
> > > > wait on some of the client rendering and not just the compositor.
> > > >
> > > > This new IOCTL solves this problem by allowing us to get a snapshot
> of
> > > > the implicit synchronization state of a given dma-buf in the form o=
f
> a
> > > > sync file.  It's effectively the same as a poll() or I915_GEM_WAIT
> only,
> > > > instead of CPU waiting directly, it encapsulates the wait operation=
,
> at
> > > > the current moment in time, in a sync_file so we can check/wait on =
it
> > > > later.  As long as the Vulkan driver does the sync_file export from
> the
> > > > dma-buf before we re-introduce it for rendering, it will only conta=
in
> > > > fences from the compositor or display.  This allows to accurately
> turn
> > > > it into a VkFence or VkSemaphore without any over-synchronization.
> > > >
> > > > By making this an ioctl on the dma-buf itself, it allows this new
> > > > functionality to be used in an entirely driver-agnostic way without
> > > > having access to a DRM fd. This makes it ideal for use in
> driver-generic
> > > > code in Mesa or in a client such as a compositor where the DRM fd
> may be
> > > > hard to reach.
> > > >
> > > > v2 (Jason Ekstrand):
> > > >  - Use a wrapper dma_fence_array of all fences including the new on=
e
> > > >    when importing an exclusive fence.
> > > >
> > > > v3 (Jason Ekstrand):
> > > >  - Lock around setting shared fences as well as exclusive
> > > >  - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
> > > >  - Initialize ret to 0 in dma_buf_wait_sync_file
> > > >
> > > > v4 (Jason Ekstrand):
> > > >  - Use the new dma_resv_get_singleton helper
> > > >
> > > > v5 (Jason Ekstrand):
> > > >  - Rename the IOCTLs to import/export rather than wait/signal
> > > >  - Drop the WRITE flag and always get/set the exclusive fence
> > > >
> > > > v6 (Jason Ekstrand):
> > > >  - Drop the sync_file import as it was all-around sketchy and not
> nearly
> > > >    as useful as import.
> > > >  - Re-introduce READ/WRITE flag support for export
> > > >  - Rework the commit message
> > > >
> > > > v7 (Jason Ekstrand):
> > > >  - Require at least one sync flag
> > > >  - Fix a refcounting bug: dma_resv_get_excl() doesn't take a
> reference
> > > >  - Use _rcu helpers since we're accessing the dma_resv read-only
> > > >
> > > > v8 (Jason Ekstrand):
> > > >  - Return -ENOMEM if the sync_file_create fails
> > > >  - Predicate support on IS_ENABLED(CONFIG_SYNC_FILE)
> > > >
> > > > v9 (Jason Ekstrand):
> > > >  - Add documentation for the new ioctl
> > > >
> > > > v10 (Jason Ekstrand):
> > > >  - Go back to dma_buf_sync_file as the ioctl struct name
> > > >
> > > > v11 (Daniel Vetter):
> > > >  - Go back to dma_buf_export_sync_file as the ioctl struct name
> > > >  - Better kerneldoc describing what the read/write flags do
> > > >
> > > > v12 (Christian K=C3=B6nig):
> > > >  - Document why we chose to make it an ioctl on dma-buf
> > > >
> > > > v12 (Jason Ekstrand):
> > > >  - Rebase on Christian K=C3=B6nig's fence rework
> > > >
> > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > Acked-by: Simon Ser <contact@emersion.fr>
> > > > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >
> > > Not sure which version it was that I reviewed, but with dma_resv_usag=
e
> > > this all looks neat and tidy. One nit below.
> > >
> > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > ---
> > > >  drivers/dma-buf/dma-buf.c    | 64
> ++++++++++++++++++++++++++++++++++++
> > > >  include/uapi/linux/dma-buf.h | 35 ++++++++++++++++++++
> > > >  2 files changed, 99 insertions(+)
> > > >
> > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > > index 79795857be3e..529e0611e53b 100644
> > > > --- a/drivers/dma-buf/dma-buf.c
> > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > @@ -20,6 +20,7 @@
> > > >  #include <linux/debugfs.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/seq_file.h>
> > > > +#include <linux/sync_file.h>
> > > >  #include <linux/poll.h>
> > > >  #include <linux/dma-resv.h>
> > > >  #include <linux/mm.h>
> > > > @@ -192,6 +193,9 @@ static loff_t dma_buf_llseek(struct file *file,
> > > loff_t offset, int whence)
> > > >   * Note that this only signals the completion of the respective
> fences,
> > > i.e. the
> > > >   * DMA transfers are complete. Cache flushing and any other
> necessary
> > > >   * preparations before CPU access can begin still need to happen.
> > > > + *
> > > > + * As an alternative to poll(), the set of fences on DMA buffer ca=
n
> be
> > > > + * exported as a &sync_file using &dma_buf_sync_file_export.
> > > >   */
> > > >
> > > >  static void dma_buf_poll_cb(struct dma_fence *fence, struct
> > > dma_fence_cb *cb)
> > > > @@ -326,6 +330,61 @@ static long dma_buf_set_name(struct dma_buf
> > > *dmabuf, const char __user *buf)
> > > >       return 0;
> > > >  }
> > > >
> > > > +#if IS_ENABLED(CONFIG_SYNC_FILE)
> > > > +static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
> > > > +                                  void __user *user_data)
> > > > +{
> > > > +     struct dma_buf_export_sync_file arg;
> > > > +     enum dma_resv_usage usage;
> > > > +     struct dma_fence *fence =3D NULL;
> > > > +     struct sync_file *sync_file;
> > > > +     int fd, ret;
> > > > +
> > > > +     if (copy_from_user(&arg, user_data, sizeof(arg)))
> > > > +             return -EFAULT;
> > > > +
> > > > +     if (arg.flags & ~DMA_BUF_SYNC_RW)
> > > > +             return -EINVAL;
> > > > +
> > > > +     if ((arg.flags & DMA_BUF_SYNC_RW) =3D=3D 0)
> > > > +             return -EINVAL;
> > >
> > > We allow userspace to set both SYNC_READ and SYNC_WRITE here, I think
> > >
> > >         if ((arg.flags & DMA_BUF_SYNC_RW) =3D=3D DMA_BUF_SYNC_RW)
> > >                 return -EINVAL;
> > >
> > > is missing?
> > >
> >
> > We could, but I don't really get why we should disallow that.  SYNC_REA=
D
> |
> > SYNC_WRITE is the same as SYNC_WRITE and that seems like perfectly sane
> > behavior to me.
>
> Yeah, but it's resulting in some really confusing semantics:
>
> - SYNC_WRITE gives you the write fences
> - SYNC_READ gives you the read fences _and_ the write fences
> - SYNC_WRITE | SYNC_READ gives you only the write fences
>
> Someone will get this wrong. Also pondering some more we reuse the sync
> flags from the cpu flush helpers, and there you need to set them for the
> access you're about to do. And that's also how all the drivers use, which
> means maybe the more natural meaning if these flags would be:
>
> - SYNC_WRITE | SYNC_READ (or just SYNC_WRITE) gives you both read and
>   write fences, since those are the fences you need to wait on before you
>   start writing
> - SYNC_READ only gives you the read fence
>
> This is also what Christian implemented in the dma_resv_usage_rw() helper
> for implicit sync.
>

Yup.  I've reworked to use dma_rev_usage_rw() to fix the bug.

--Jason


> -Daniel
>
> >
> > --Jason
> >
> >
> > > Also maybe a case to add to your igt.
> > >
> > > > +
> > > > +     fd =3D get_unused_fd_flags(O_CLOEXEC);
> > > > +     if (fd < 0)
> > > > +             return fd;
> > > > +
> > > > +     usage =3D (arg.flags & DMA_BUF_SYNC_WRITE) ?
> DMA_RESV_USAGE_WRITE :
> > > > +                                                DMA_RESV_USAGE_REA=
D;
> > > > +     ret =3D dma_resv_get_singleton(dmabuf->resv, usage, &fence);
> > > > +     if (ret)
> > > > +             goto err_put_fd;
> > > > +
> > > > +     if (!fence)
> > > > +             fence =3D dma_fence_get_stub();
> > > > +
> > > > +     sync_file =3D sync_file_create(fence);
> > > > +
> > > > +     dma_fence_put(fence);
> > > > +
> > > > +     if (!sync_file) {
> > > > +             ret =3D -ENOMEM;
> > > > +             goto err_put_fd;
> > > > +     }
> > > > +
> > > > +     fd_install(fd, sync_file->file);
> > > > +
> > > > +     arg.fd =3D fd;
> > > > +     if (copy_to_user(user_data, &arg, sizeof(arg)))
> > > > +             return -EFAULT;
> > > > +
> > > > +     return 0;
> > > > +
> > > > +err_put_fd:
> > > > +     put_unused_fd(fd);
> > > > +     return ret;
> > > > +}
> > > > +#endif
> > > > +
> > > >  static long dma_buf_ioctl(struct file *file,
> > > >                         unsigned int cmd, unsigned long arg)
> > > >  {
> > > > @@ -369,6 +428,11 @@ static long dma_buf_ioctl(struct file *file,
> > > >       case DMA_BUF_SET_NAME_B:
> > > >               return dma_buf_set_name(dmabuf, (const char __user
> *)arg);
> > > >
> > > > +#if IS_ENABLED(CONFIG_SYNC_FILE)
> > > > +     case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
> > > > +             return dma_buf_export_sync_file(dmabuf, (void __user
> > > *)arg);
> > > > +#endif
> > > > +
> > > >       default:
> > > >               return -ENOTTY;
> > > >       }
> > > > diff --git a/include/uapi/linux/dma-buf.h
> b/include/uapi/linux/dma-buf.h
> > > > index 8e4a2ca0bcbf..46f1e3e98b02 100644
> > > > --- a/include/uapi/linux/dma-buf.h
> > > > +++ b/include/uapi/linux/dma-buf.h
> > > > @@ -85,6 +85,40 @@ struct dma_buf_sync {
> > > >
> > > >  #define DMA_BUF_NAME_LEN     32
> > > >
> > > > +/**
> > > > + * struct dma_buf_export_sync_file - Get a sync_file from a dma-bu=
f
> > > > + *
> > > > + * Userspace can perform a DMA_BUF_IOCTL_EXPORT_SYNC_FILE to
> retrieve
> > > the
> > > > + * current set of fences on a dma-buf file descriptor as a
> sync_file.
> > > CPU
> > > > + * waits via poll() or other driver-specific mechanisms typically
> wait
> > > on
> > > > + * whatever fences are on the dma-buf at the time the wait begins.
> This
> > > > + * is similar except that it takes a snapshot of the current fence=
s
> on
> > > the
> > > > + * dma-buf for waiting later instead of waiting immediately.  This
> is
> > > > + * useful for modern graphics APIs such as Vulkan which assume an
> > > explicit
> > > > + * synchronization model but still need to inter-operate with
> dma-buf.
> > > > + */
> > > > +struct dma_buf_export_sync_file {
> > > > +     /**
> > > > +      * @flags: Read/write flags
> > > > +      *
> > > > +      * Must be DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE, or both.
> > > > +      *
> > > > +      * If DMA_BUF_SYNC_READ is set and DMA_BUF_SYNC_WRITE is not
> set,
> > > > +      * the returned sync file waits on any writers of the dma-buf
> to
> > > > +      * complete.  Waiting on the returned sync file is equivalent
> to
> > > > +      * poll() with POLLIN.
> > > > +      *
> > > > +      * If DMA_BUF_SYNC_WRITE is set, the returned sync file waits
> on
> > > > +      * any users of the dma-buf (read or write) to complete.
> Waiting
> > > > +      * on the returned sync file is equivalent to poll() with
> POLLOUT.
> > > > +      * If both DMA_BUF_SYNC_WRITE and DMA_BUF_SYNC_READ are set,
> this
> > > > +      * is equivalent to just DMA_BUF_SYNC_WRITE.
> > > > +      */
> > > > +     __u32 flags;
> > > > +     /** @fd: Returned sync file descriptor */
> > > > +     __s32 fd;
> > > > +};
> > > > +
> > > >  #define DMA_BUF_BASE         'b'
> > > >  #define DMA_BUF_IOCTL_SYNC   _IOW(DMA_BUF_BASE, 0, struct
> dma_buf_sync)
> > > >
> > > > @@ -94,5 +128,6 @@ struct dma_buf_sync {
> > > >  #define DMA_BUF_SET_NAME     _IOW(DMA_BUF_BASE, 1, const char *)
> > > >  #define DMA_BUF_SET_NAME_A   _IOW(DMA_BUF_BASE, 1, u32)
> > > >  #define DMA_BUF_SET_NAME_B   _IOW(DMA_BUF_BASE, 1, u64)
> > > > +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE       _IOWR(DMA_BUF_BASE, 2=
,
> > > struct dma_buf_export_sync_file)
> > >
> > > With the one nit fixed for this version:
> > >
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >
> > > >
> > > >  #endif
> > > > --
> > > > 2.36.0
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

--000000000000f9b27205de4cb39d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, May 5, 2022 at 3:23 AM Daniel Vetter &lt;<a href=3D"mailto:d=
aniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, May 05, 2022 at 03:05:44AM -0500, =
Jason Ekstrand wrote:<br>
&gt; On Wed, May 4, 2022 at 5:49 PM Daniel Vetter &lt;<a href=3D"mailto:dan=
iel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, May 04, 2022 at 03:34:03PM -0500, Jason Ekstrand wrote:<b=
r>
&gt; &gt; &gt; Modern userspace APIs like Vulkan are built on an explicit<b=
r>
&gt; &gt; &gt; synchronization model.=C2=A0 This doesn&#39;t always play ni=
cely with the<br>
&gt; &gt; &gt; implicit synchronization used in the kernel and assumed by X=
11 and<br>
&gt; &gt; &gt; Wayland.=C2=A0 The client -&gt; compositor half of the synch=
ronization isn&#39;t too<br>
&gt; &gt; &gt; bad, at least on intel, because we can control whether or no=
t i915<br>
&gt; &gt; &gt; synchronizes on the buffer and whether or not it&#39;s consi=
dered written.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The harder part is the compositor -&gt; client synchronizati=
on when we get<br>
&gt; &gt; &gt; the buffer back from the compositor.=C2=A0 We&#39;re require=
d to be able to<br>
&gt; &gt; &gt; provide the client with a VkSemaphore and VkFence representi=
ng the point<br>
&gt; &gt; &gt; in time where the window system (compositor and/or display) =
finished<br>
&gt; &gt; &gt; using the buffer.=C2=A0 With current APIs, it&#39;s very har=
d to do this in such<br>
&gt; &gt; &gt; a way that we don&#39;t get confused by the Vulkan driver&#3=
9;s access of the<br>
&gt; &gt; &gt; buffer.=C2=A0 In particular, once we tell the kernel that we=
&#39;re rendering to<br>
&gt; &gt; &gt; the buffer again, any CPU waits on the buffer or GPU depende=
ncies will<br>
&gt; &gt; &gt; wait on some of the client rendering and not just the compos=
itor.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This new IOCTL solves this problem by allowing us to get a s=
napshot of<br>
&gt; &gt; &gt; the implicit synchronization state of a given dma-buf in the=
 form of a<br>
&gt; &gt; &gt; sync file.=C2=A0 It&#39;s effectively the same as a poll() o=
r I915_GEM_WAIT only,<br>
&gt; &gt; &gt; instead of CPU waiting directly, it encapsulates the wait op=
eration, at<br>
&gt; &gt; &gt; the current moment in time, in a sync_file so we can check/w=
ait on it<br>
&gt; &gt; &gt; later.=C2=A0 As long as the Vulkan driver does the sync_file=
 export from the<br>
&gt; &gt; &gt; dma-buf before we re-introduce it for rendering, it will onl=
y contain<br>
&gt; &gt; &gt; fences from the compositor or display.=C2=A0 This allows to =
accurately turn<br>
&gt; &gt; &gt; it into a VkFence or VkSemaphore without any over-synchroniz=
ation.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; By making this an ioctl on the dma-buf itself, it allows thi=
s new<br>
&gt; &gt; &gt; functionality to be used in an entirely driver-agnostic way =
without<br>
&gt; &gt; &gt; having access to a DRM fd. This makes it ideal for use in dr=
iver-generic<br>
&gt; &gt; &gt; code in Mesa or in a client such as a compositor where the D=
RM fd may be<br>
&gt; &gt; &gt; hard to reach.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v2 (Jason Ekstrand):<br>
&gt; &gt; &gt;=C2=A0 - Use a wrapper dma_fence_array of all fences includin=
g the new one<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 when importing an exclusive fence.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v3 (Jason Ekstrand):<br>
&gt; &gt; &gt;=C2=A0 - Lock around setting shared fences as well as exclusi=
ve<br>
&gt; &gt; &gt;=C2=A0 - Mark SIGNAL_SYNC_FILE as a read-write ioctl.<br>
&gt; &gt; &gt;=C2=A0 - Initialize ret to 0 in dma_buf_wait_sync_file<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v4 (Jason Ekstrand):<br>
&gt; &gt; &gt;=C2=A0 - Use the new dma_resv_get_singleton helper<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v5 (Jason Ekstrand):<br>
&gt; &gt; &gt;=C2=A0 - Rename the IOCTLs to import/export rather than wait/=
signal<br>
&gt; &gt; &gt;=C2=A0 - Drop the WRITE flag and always get/set the exclusive=
 fence<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v6 (Jason Ekstrand):<br>
&gt; &gt; &gt;=C2=A0 - Drop the sync_file import as it was all-around sketc=
hy and not nearly<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 as useful as import.<br>
&gt; &gt; &gt;=C2=A0 - Re-introduce READ/WRITE flag support for export<br>
&gt; &gt; &gt;=C2=A0 - Rework the commit message<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v7 (Jason Ekstrand):<br>
&gt; &gt; &gt;=C2=A0 - Require at least one sync flag<br>
&gt; &gt; &gt;=C2=A0 - Fix a refcounting bug: dma_resv_get_excl() doesn&#39=
;t take a reference<br>
&gt; &gt; &gt;=C2=A0 - Use _rcu helpers since we&#39;re accessing the dma_r=
esv read-only<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v8 (Jason Ekstrand):<br>
&gt; &gt; &gt;=C2=A0 - Return -ENOMEM if the sync_file_create fails<br>
&gt; &gt; &gt;=C2=A0 - Predicate support on IS_ENABLED(CONFIG_SYNC_FILE)<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v9 (Jason Ekstrand):<br>
&gt; &gt; &gt;=C2=A0 - Add documentation for the new ioctl<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v10 (Jason Ekstrand):<br>
&gt; &gt; &gt;=C2=A0 - Go back to dma_buf_sync_file as the ioctl struct nam=
e<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v11 (Daniel Vetter):<br>
&gt; &gt; &gt;=C2=A0 - Go back to dma_buf_export_sync_file as the ioctl str=
uct name<br>
&gt; &gt; &gt;=C2=A0 - Better kerneldoc describing what the read/write flag=
s do<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v12 (Christian K=C3=B6nig):<br>
&gt; &gt; &gt;=C2=A0 - Document why we chose to make it an ioctl on dma-buf=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v12 (Jason Ekstrand):<br>
&gt; &gt; &gt;=C2=A0 - Rebase on Christian K=C3=B6nig&#39;s fence rework<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Jason Ekstrand &lt;<a href=3D"mailto:jason@jl=
ekstrand.net" target=3D"_blank">jason@jlekstrand.net</a>&gt;<br>
&gt; &gt; &gt; Acked-by: Simon Ser &lt;<a href=3D"mailto:contact@emersion.f=
r" target=3D"_blank">contact@emersion.fr</a>&gt;<br>
&gt; &gt; &gt; Acked-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christi=
an.koenig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
&gt; &gt; &gt; Reviewed-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vett=
er@ffwll.ch" target=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Not sure which version it was that I reviewed, but with dma_resv_=
usage<br>
&gt; &gt; this all looks neat and tidy. One nit below.<br>
&gt; &gt;<br>
&gt; &gt; &gt; Cc: Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@linaro.o=
rg" target=3D"_blank">sumit.semwal@linaro.org</a>&gt;<br>
&gt; &gt; &gt; Cc: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lankhors=
t@linux.intel.com" target=3D"_blank">maarten.lankhorst@linux.intel.com</a>&=
gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 drivers/dma-buf/dma-buf.c=C2=A0 =C2=A0 | 64 ++++++++++=
++++++++++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 include/uapi/linux/dma-buf.h | 35 ++++++++++++++++++++=
<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 99 insertions(+)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma=
-buf.c<br>
&gt; &gt; &gt; index 79795857be3e..529e0611e53b 100644<br>
&gt; &gt; &gt; --- a/drivers/dma-buf/dma-buf.c<br>
&gt; &gt; &gt; +++ b/drivers/dma-buf/dma-buf.c<br>
&gt; &gt; &gt; @@ -20,6 +20,7 @@<br>
&gt; &gt; &gt;=C2=A0 #include &lt;linux/debugfs.h&gt;<br>
&gt; &gt; &gt;=C2=A0 #include &lt;linux/module.h&gt;<br>
&gt; &gt; &gt;=C2=A0 #include &lt;linux/seq_file.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/sync_file.h&gt;<br>
&gt; &gt; &gt;=C2=A0 #include &lt;linux/poll.h&gt;<br>
&gt; &gt; &gt;=C2=A0 #include &lt;linux/dma-resv.h&gt;<br>
&gt; &gt; &gt;=C2=A0 #include &lt;linux/mm.h&gt;<br>
&gt; &gt; &gt; @@ -192,6 +193,9 @@ static loff_t dma_buf_llseek(struct file=
 *file,<br>
&gt; &gt; loff_t offset, int whence)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0* Note that this only signals the completion of =
the respective fences,<br>
&gt; &gt; i.e. the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0* DMA transfers are complete. Cache flushing and=
 any other necessary<br>
&gt; &gt; &gt;=C2=A0 =C2=A0* preparations before CPU access can begin still=
 need to happen.<br>
&gt; &gt; &gt; + *<br>
&gt; &gt; &gt; + * As an alternative to poll(), the set of fences on DMA bu=
ffer can be<br>
&gt; &gt; &gt; + * exported as a &amp;sync_file using &amp;dma_buf_sync_fil=
e_export.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 static void dma_buf_poll_cb(struct dma_fence *fence, s=
truct<br>
&gt; &gt; dma_fence_cb *cb)<br>
&gt; &gt; &gt; @@ -326,6 +330,61 @@ static long dma_buf_set_name(struct dma=
_buf<br>
&gt; &gt; *dmabuf, const char __user *buf)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +#if IS_ENABLED(CONFIG_SYNC_FILE)<br>
&gt; &gt; &gt; +static long dma_buf_export_sync_file(struct dma_buf *dmabuf=
,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void __user *us=
er_data)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct dma_buf_export_sync_file arg;<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0enum dma_resv_usage usage;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct dma_fence *fence =3D NULL;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct sync_file *sync_file;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int fd, ret;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (copy_from_user(&amp;arg, user_data,=
 sizeof(arg)))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFA=
ULT;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (arg.flags &amp; ~DMA_BUF_SYNC_RW)<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EIN=
VAL;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if ((arg.flags &amp; DMA_BUF_SYNC_RW) =
=3D=3D 0)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EIN=
VAL;<br>
&gt; &gt;<br>
&gt; &gt; We allow userspace to set both SYNC_READ and SYNC_WRITE here, I t=
hink<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((arg.flags &amp; DMA_BUF_SYN=
C_RW) =3D=3D DMA_BUF_SYNC_RW)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn -EINVAL;<br>
&gt; &gt;<br>
&gt; &gt; is missing?<br>
&gt; &gt;<br>
&gt; <br>
&gt; We could, but I don&#39;t really get why we should disallow that.=C2=
=A0 SYNC_READ |<br>
&gt; SYNC_WRITE is the same as SYNC_WRITE and that seems like perfectly san=
e<br>
&gt; behavior to me.<br>
<br>
Yeah, but it&#39;s resulting in some really confusing semantics:<br>
<br>
- SYNC_WRITE gives you the write fences<br>
- SYNC_READ gives you the read fences _and_ the write fences<br>
- SYNC_WRITE | SYNC_READ gives you only the write fences<br>
<br>
Someone will get this wrong. Also pondering some more we reuse the sync<br>
flags from the cpu flush helpers, and there you need to set them for the<br=
>
access you&#39;re about to do. And that&#39;s also how all the drivers use,=
 which<br>
means maybe the more natural meaning if these flags would be:<br>
<br>
- SYNC_WRITE | SYNC_READ (or just SYNC_WRITE) gives you both read and<br>
=C2=A0 write fences, since those are the fences you need to wait on before =
you<br>
=C2=A0 start writing<br>
- SYNC_READ only gives you the read fence<br>
<br>
This is also what Christian implemented in the dma_resv_usage_rw() helper<b=
r>
for implicit sync.<br></blockquote><div><br></div><div>Yup.=C2=A0 I&#39;ve =
reworked to use dma_rev_usage_rw() to fix the bug.</div><div><br></div><div=
>--Jason<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
-Daniel<br>
<br>
&gt; <br>
&gt; --Jason<br>
&gt; <br>
&gt; <br>
&gt; &gt; Also maybe a case to add to your igt.<br>
&gt; &gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0fd =3D get_unused_fd_flags(O_CLOEXEC);<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fd;<=
br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0usage =3D (arg.flags &amp; DMA_BUF_SYNC=
_WRITE) ? DMA_RESV_USAGE_WRITE :<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMA_RESV_USAGE_READ;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dma_resv_get_singleton(dmabuf-&=
gt;resv, usage, &amp;fence);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_pu=
t_fd;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!fence)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fence =3D d=
ma_fence_get_stub();<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0sync_file =3D sync_file_create(fence);<=
br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0dma_fence_put(fence);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!sync_file) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EN=
OMEM;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_pu=
t_fd;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0fd_install(fd, sync_file-&gt;file);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0arg.fd =3D fd;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (copy_to_user(user_data, &amp;arg, s=
izeof(arg)))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFA=
ULT;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +err_put_fd:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0put_unused_fd(fd);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +#endif<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 static long dma_buf_ioctl(struct file *file,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int cmd, unsigned long arg)<br>
&gt; &gt; &gt;=C2=A0 {<br>
&gt; &gt; &gt; @@ -369,6 +428,11 @@ static long dma_buf_ioctl(struct file *=
file,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case DMA_BUF_SET_NAME_B:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
 dma_buf_set_name(dmabuf, (const char __user *)arg);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +#if IS_ENABLED(CONFIG_SYNC_FILE)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dma_=
buf_export_sync_file(dmabuf, (void __user<br>
&gt; &gt; *)arg);<br>
&gt; &gt; &gt; +#endif<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
 -ENOTTY;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/lin=
ux/dma-buf.h<br>
&gt; &gt; &gt; index 8e4a2ca0bcbf..46f1e3e98b02 100644<br>
&gt; &gt; &gt; --- a/include/uapi/linux/dma-buf.h<br>
&gt; &gt; &gt; +++ b/include/uapi/linux/dma-buf.h<br>
&gt; &gt; &gt; @@ -85,6 +85,40 @@ struct dma_buf_sync {<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 #define DMA_BUF_NAME_LEN=C2=A0 =C2=A0 =C2=A032<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +/**<br>
&gt; &gt; &gt; + * struct dma_buf_export_sync_file - Get a sync_file from a=
 dma-buf<br>
&gt; &gt; &gt; + *<br>
&gt; &gt; &gt; + * Userspace can perform a DMA_BUF_IOCTL_EXPORT_SYNC_FILE t=
o retrieve<br>
&gt; &gt; the<br>
&gt; &gt; &gt; + * current set of fences on a dma-buf file descriptor as a =
sync_file.<br>
&gt; &gt; CPU<br>
&gt; &gt; &gt; + * waits via poll() or other driver-specific mechanisms typ=
ically wait<br>
&gt; &gt; on<br>
&gt; &gt; &gt; + * whatever fences are on the dma-buf at the time the wait =
begins.=C2=A0 This<br>
&gt; &gt; &gt; + * is similar except that it takes a snapshot of the curren=
t fences on<br>
&gt; &gt; the<br>
&gt; &gt; &gt; + * dma-buf for waiting later instead of waiting immediately=
.=C2=A0 This is<br>
&gt; &gt; &gt; + * useful for modern graphics APIs such as Vulkan which ass=
ume an<br>
&gt; &gt; explicit<br>
&gt; &gt; &gt; + * synchronization model but still need to inter-operate wi=
th dma-buf.<br>
&gt; &gt; &gt; + */<br>
&gt; &gt; &gt; +struct dma_buf_export_sync_file {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0/**<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * @flags: Read/write flags<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * Must be DMA_BUF_SYNC_READ, DMA_BUF_S=
YNC_WRITE, or both.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * If DMA_BUF_SYNC_READ is set and DMA_=
BUF_SYNC_WRITE is not set,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * the returned sync file waits on any =
writers of the dma-buf to<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * complete.=C2=A0 Waiting on the retur=
ned sync file is equivalent to<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * poll() with POLLIN.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * If DMA_BUF_SYNC_WRITE is set, the re=
turned sync file waits on<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * any users of the dma-buf (read or wr=
ite) to complete.=C2=A0 Waiting<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * on the returned sync file is equival=
ent to poll() with POLLOUT.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * If both DMA_BUF_SYNC_WRITE and DMA_B=
UF_SYNC_READ are set, this<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * is equivalent to just DMA_BUF_SYNC_W=
RITE.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0/** @fd: Returned sync file descriptor =
*/<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0__s32 fd;<br>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 #define DMA_BUF_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;b&#39;<br>
&gt; &gt; &gt;=C2=A0 #define DMA_BUF_IOCTL_SYNC=C2=A0 =C2=A0_IOW(DMA_BUF_BA=
SE, 0, struct dma_buf_sync)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -94,5 +128,6 @@ struct dma_buf_sync {<br>
&gt; &gt; &gt;=C2=A0 #define DMA_BUF_SET_NAME=C2=A0 =C2=A0 =C2=A0_IOW(DMA_B=
UF_BASE, 1, const char *)<br>
&gt; &gt; &gt;=C2=A0 #define DMA_BUF_SET_NAME_A=C2=A0 =C2=A0_IOW(DMA_BUF_BA=
SE, 1, u32)<br>
&gt; &gt; &gt;=C2=A0 #define DMA_BUF_SET_NAME_B=C2=A0 =C2=A0_IOW(DMA_BUF_BA=
SE, 1, u64)<br>
&gt; &gt; &gt; +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE=C2=A0 =C2=A0 =C2=A0 =
=C2=A0_IOWR(DMA_BUF_BASE, 2,<br>
&gt; &gt; struct dma_buf_export_sync_file)<br>
&gt; &gt;<br>
&gt; &gt; With the one nit fixed for this version:<br>
&gt; &gt;<br>
&gt; &gt; Reviewed-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ff=
wll.ch" target=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 #endif<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.36.0<br>
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

--000000000000f9b27205de4cb39d--
