Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D76F4B6447
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 08:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9274E10E3B4;
	Tue, 15 Feb 2022 07:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DBB10E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 20:19:43 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id f37so6600597lfv.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 12:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0OkHBiaZEL4gbI88uAFjC4BevdegDkSw2mEVoE6XUQM=;
 b=o/c8WGQ7vgEvxtzZSzEGkFFVcPUiHrl0G51Eg5NUiYHpcN3AIktYX1CzP78vLb2HCv
 LyiqVlMYdkmHuBOpsyo/3V9Cj1FG5i2UtaP2pa4VVE7DPWVR0qrTIeuZJzSShHz31KtV
 aG2q2Q+V1pIZOhlqrMm86Ieu10aJTAtNG3yAp85NUacZ5B9enUnoF98FgCEJuYwGuOR1
 t/YcS4wqhUQgpObHz7ewBESmzKaLyvkXbT7E+XnLM/nDVEbqTumoE8kp9c32zg+fZ/Cm
 kD09NV6hr9tEchdA4EsbPzDQ4YuOHJVTlkhoDxtAqfFcgQJzv29t30e/mp0RRlaVif14
 p9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0OkHBiaZEL4gbI88uAFjC4BevdegDkSw2mEVoE6XUQM=;
 b=FF7qM4QcEQs1Spskf+3xl6LdwLJzPc7AjZXzJn0Zn+/6vqLfQllNWf1PKEQRxIDycX
 wVt0ez3l19wt27ElTa1yeunTcYDTgslgQ16sRndH2EsVpqKGL8TccmNPF7FjnNDoCXX3
 dA56z25ChTTpeCJlI49gcikC6o76kbF6JrnJ7G7LIaWK0liFvqO17xn12QLGArSu2fSc
 RXJvbkSLdnt/e8Xe1m9L5Lr65wvltjLNJi6N8OgDkiKOL8gl7PWEZVsJGGQZ1vs0dHPY
 PrkUT2umnjQGYjsn6aXu+w+OX2l2uyzp/y3EM8n5UKr6i7MKbQ+H96C6Vl5aViJ6ExjG
 y1ng==
X-Gm-Message-State: AOAM530E2mwdeNa/5zABwI/Vfs8E/1ezLXBzz2sBbhDlVgHuTUo9GLP9
 nz/qTNFp918wWlc1hUZ1VNVL24ar3Tvjq+RCLfc+IA==
X-Google-Smtp-Source: ABdhPJx8lRnGEvo2BKjuadxx0kxXF47MC+omvIOvGqqY/xfT6A0YxtvN/5OElk6DOL9teF9tVH9vVeya6dhvDDCanxQ=
X-Received: by 2002:a05:6512:139e:: with SMTP id
 p30mr572513lfa.502.1644869981206; 
 Mon, 14 Feb 2022 12:19:41 -0800 (PST)
MIME-Version: 1.0
References: <20220211161831.3493782-1-tjmercier@google.com>
 <20220211161831.3493782-7-tjmercier@google.com> <Ygdfe3XSvN8iFuUc@kroah.com>
 <CAHRSSEwoJ67Sr_=gtSaP91cbpjJjZdOo57cfAhv3r-ye0da7PA@mail.gmail.com>
 <CAJuCfpHf=Ewm0e9kguY3MEGVHU_cyviVXByi0oQtq7kTtOOD=A@mail.gmail.com>
In-Reply-To: <CAJuCfpHf=Ewm0e9kguY3MEGVHU_cyviVXByi0oQtq7kTtOOD=A@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Mon, 14 Feb 2022 12:19:28 -0800
Message-ID: <CAHRSSEzsn-EVKXTRfmpbPR9u0wNpdvdZoX64Tm_mB1DQMRSUPQ@mail.gmail.com>
Subject: Re: [RFC v2 6/6] android: binder: Add a buffer flag to relinquish
 ownership of fds
To: Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 15 Feb 2022 07:25:06 +0000
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
Cc: Zefan Li <lizefan.x@bytedance.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kenny.Ho@amd.com,
 Jonathan Corbet <corbet@lwn.net>, Laura Abbott <labbott@redhat.com>,
 linux-media <linux-media@vger.kernel.org>, Todd Kjos <tkjos@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Tejun Heo <tj@kernel.org>, cgroups mailinglist <cgroups@vger.kernel.org>,
 Martijn Coenen <maco@android.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 11:29 AM Suren Baghdasaryan <surenb@google.com> wro=
te:
>
> On Mon, Feb 14, 2022 at 10:33 AM Todd Kjos <tkjos@google.com> wrote:
> >
> > On Fri, Feb 11, 2022 at 11:19 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Feb 11, 2022 at 04:18:29PM +0000, T.J. Mercier wrote:
> >
> > Title: "android: binder: Add a buffer flag to relinquish ownership of f=
ds"
> >
> > Please drop the "android:" from the title.
> >
> > > > This patch introduces a buffer flag BINDER_BUFFER_FLAG_SENDER_NO_NE=
ED
> > > > that a process sending an fd array to another process over binder I=
PC
> > > > can set to relinquish ownership of the fds being sent for memory
> > > > accounting purposes. If the flag is found to be set during the fd a=
rray
> > > > translation and the fd is for a DMA-BUF, the buffer is uncharged fr=
om
> > > > the sender's cgroup and charged to the receiving process's cgroup
> > > > instead.
> > > >
> > > > It is up to the sending process to ensure that it closes the fds
> > > > regardless of whether the transfer failed or succeeded.
> > > >
> > > > Most graphics shared memory allocations in Android are done by the
> > > > graphics allocator HAL process. On requests from clients, the HAL p=
rocess
> > > > allocates memory and sends the fds to the clients over binder IPC.
> > > > The graphics allocator HAL will not retain any references to the
> > > > buffers. When the HAL sets the BINDER_BUFFER_FLAG_SENDER_NO_NEED fo=
r fd
> > > > arrays holding DMA-BUF fds, the gpu cgroup controller will be able =
to
> > > > correctly charge the buffers to the client processes instead of the
> > > > graphics allocator HAL.
> > > >
> > > > From: Hridya Valsaraju <hridya@google.com>
> > > > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > > > Co-developed-by: T.J. Mercier <tjmercier@google.com>
> > > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > > ---
> > > > changes in v2
> > > > - Move dma-buf cgroup charge transfer from a dma_buf_op defined by =
every
> > > > heap to a single dma-buf function for all heaps per Daniel Vetter a=
nd
> > > > Christian K=C3=B6nig.
> > > >
> > > >  drivers/android/binder.c            | 26 +++++++++++++++++++++++++=
+
> > > >  include/uapi/linux/android/binder.h |  1 +
> > > >  2 files changed, 27 insertions(+)
> > > >
> > > > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > > > index 8351c5638880..f50d88ded188 100644
> > > > --- a/drivers/android/binder.c
> > > > +++ b/drivers/android/binder.c
> > > > @@ -42,6 +42,7 @@
> > > >
> > > >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > >
> > > > +#include <linux/dma-buf.h>
> > > >  #include <linux/fdtable.h>
> > > >  #include <linux/file.h>
> > > >  #include <linux/freezer.h>
> > > > @@ -2482,8 +2483,10 @@ static int binder_translate_fd_array(struct =
list_head *pf_head,
> > > >  {
> > > >       binder_size_t fdi, fd_buf_size;
> > > >       binder_size_t fda_offset;
> > > > +     bool transfer_gpu_charge =3D false;
> > > >       const void __user *sender_ufda_base;
> > > >       struct binder_proc *proc =3D thread->proc;
> > > > +     struct binder_proc *target_proc =3D t->to_proc;
> > > >       int ret;
> > > >
> > > >       fd_buf_size =3D sizeof(u32) * fda->num_fds;
> > > > @@ -2521,8 +2524,15 @@ static int binder_translate_fd_array(struct =
list_head *pf_head,
> > > >       if (ret)
> > > >               return ret;
> > > >
> > > > +     if (IS_ENABLED(CONFIG_CGROUP_GPU) &&
> > > > +             parent->flags & BINDER_BUFFER_FLAG_SENDER_NO_NEED)
> > > > +             transfer_gpu_charge =3D true;
> > > > +
> > > >       for (fdi =3D 0; fdi < fda->num_fds; fdi++) {
> > > >               u32 fd;
> > > > +             struct dma_buf *dmabuf;
> > > > +             struct gpucg *gpucg;
> > > > +
> > > >               binder_size_t offset =3D fda_offset + fdi * sizeof(fd=
);
> > > >               binder_size_t sender_uoffset =3D fdi * sizeof(fd);
> > > >
> > > > @@ -2532,6 +2542,22 @@ static int binder_translate_fd_array(struct =
list_head *pf_head,
> > > >                                                 in_reply_to);
> > > >               if (ret)
> > > >                       return ret > 0 ? -EINVAL : ret;
> > > > +
> > > > +             if (!transfer_gpu_charge)
> > > > +                     continue;
> > > > +
> > > > +             dmabuf =3D dma_buf_get(fd);
> > > > +             if (IS_ERR(dmabuf))
> > > > +                     continue;
> > > > +
> > > > +             gpucg =3D gpucg_get(target_proc->tsk);
> > > > +             ret =3D dma_buf_charge_transfer(dmabuf, gpucg);
> > > > +             if (ret) {
> > > > +                     pr_warn("%d:%d Unable to transfer DMA-BUF fd =
charge to %d",
> > > > +                             proc->pid, thread->pid, target_proc->=
pid);
> > > > +                     gpucg_put(gpucg);
> > > > +             }
> > > > +             dma_buf_put(dmabuf);
> >
> > Since we are creating a new gpu cgroup abstraction, couldn't this
> > "transfer" be done in userspace by the target instead of in the kernel
> > driver? Then this patch would reduce to just a flag on the buffer
> > object.
>
> Are you suggesting to have a userspace accessible cgroup interface for
> transferring buffer charges and the target process to use that
> interface for requesting the buffer to be charged to its cgroup?

Well, I'm asking why we need to do these cgroup-ish actions in the
kernel when it seems more natural to do it in userspace.

> I'm worried about the case when the target process does not request
> the transfer after receiving the buffer with this flag set. The charge
> would stay with the wrong process and accounting will be invalid.

I suspect this would be implemented in libbinder wherever the fd array
object is handled, so it wouldn't require changes to every process.

>
> Technically, since the proposed cgroup supports charge transfer from
> the very beginning, the userspace can check if the cgroup is mounted
> and if so then it knows this feature is supported.

Has some userspace code for this been written? I'd like to be
convinced that these changes need to be in the binder kernel driver
instead of in userspace.

>
> > This also solves the issue that Greg brought up about
> > userspace needing to know whether the kernel implements this feature
> > (older kernel running with newer userspace). I think we could just
> > reserve some flags for userspace to use (and since those flags are
> > "reserved" for older kernels, this would enable this feature even for
> > old kernels)
> >
> > > >       }
> > > >       return 0;
> > > >  }
> > > > diff --git a/include/uapi/linux/android/binder.h b/include/uapi/lin=
ux/android/binder.h
> > > > index 3246f2c74696..169fd5069a1a 100644
> > > > --- a/include/uapi/linux/android/binder.h
> > > > +++ b/include/uapi/linux/android/binder.h
> > > > @@ -137,6 +137,7 @@ struct binder_buffer_object {
> > > >
> > > >  enum {
> > > >       BINDER_BUFFER_FLAG_HAS_PARENT =3D 0x01,
> > > > +     BINDER_BUFFER_FLAG_SENDER_NO_NEED =3D 0x02,
> > > >  };
> > > >
> > > >  /* struct binder_fd_array_object - object describing an array of f=
ds in a buffer
> > > > --
> > > > 2.35.1.265.g69c8d7142f-goog
> > > >
> > >
> > > How does userspace know that binder supports this new flag?  And wher=
e
> > > is the userspace test for this new feature?  Isn't there a binder tes=
t
> > > framework somewhere?
> > >
> > > thanks,
> > >
> > > greg k-h
