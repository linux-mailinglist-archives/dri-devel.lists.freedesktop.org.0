Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B70FD4E9EF4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 20:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336B810E163;
	Mon, 28 Mar 2022 18:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD5A10E163
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 18:28:37 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id lr4so22038031ejb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 11:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8WaH8oTp9zQ4RiMod88tKNM8FNGzolc7NDGliqXEyFM=;
 b=RA1LFZlyqYnQKlZhfG5eW4EytFq6FXGfsjb2/DOkWkAoisIvQquLsZTwb8nBtNlht8
 ZHqiJ/MOFhcB+HyYDg4DOrCFHvXKNreT5wQEPJ7PzPnMoI2QrObdeAd08uOLLZhCsV8Y
 oo/fwNelFB8E06amjBdYhwsR2VhATbyd3kx12XlxxP1sGczHl+YWk9N47mzb48HohD17
 d9HYqBqtvUEw1TYZH7O9tEkaSoRyqnabxydRHWLDA8W6lAvtHgHxiIUB7dc49IG+TBgi
 G8ykTzQvXQ9aD4+tQHre6cRAhm0yoObw1rfkn0AAPUuFF1ZU/BUjCdEdRxBpKxz80uJg
 RymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8WaH8oTp9zQ4RiMod88tKNM8FNGzolc7NDGliqXEyFM=;
 b=z7HN5KsV+PHeJOD2hzUmrF7SztW+0VLVMQM63wmvQhWIAP1onw1TPns76QdGLO3i3z
 ghs8HFFFeezM8JohB5Ok0f/gpovTrWuexvLjdCt7MGSCjZrpOuMBuQ7KlIwlM/j64RgO
 J9bGw09TFw5NH2Uox7MKmfQCH8/4dr8JTRU0pdrb4e6ysY9UDQ41qI0t2BGDwtvSa+pS
 CIaPW5Y8I4MJ92ZbTzR6jc+8ExrQ+4Fxt/2kGFgdNfoNV389JYjMVIg7ETQxg/N3S0Va
 nEgAILcTcfwUIpkNTfz4vZRYbOgXjXSITwlwHi1wQYOU9s5II+k8kvR49mCtFaFSnxnI
 vkGA==
X-Gm-Message-State: AOAM532Z3xIGWF20VZO+YguwVI5rLN5wVDj+wCOa+z+Q59lxpei26dq7
 Y1Bskh/RHlftPfzCsSG2r19o6Ldx0Syi4Grfox3ltQ==
X-Google-Smtp-Source: ABdhPJz3R1rYGKfMgCT8Xw+uvi6MQu9Vw8tO6cBRgeUu+llCkBBC4HKzRw85BEQANrPE+Bd5D9ZFeLO+o1zCssURxAk=
X-Received: by 2002:a17:906:9754:b0:6da:7d72:1353 with SMTP id
 o20-20020a170906975400b006da7d721353mr29368499ejy.273.1648492115577; Mon, 28
 Mar 2022 11:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220328035951.1817417-1-tjmercier@google.com>
 <20220328035951.1817417-5-tjmercier@google.com>
 <YkHH/0Use7F30UUE@phenom.ffwll.local>
In-Reply-To: <YkHH/0Use7F30UUE@phenom.ffwll.local>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 28 Mar 2022 11:28:24 -0700
Message-ID: <CABdmKX01p6g_iHsB6dd4Wwh=8iLdYiUqdY6_yyA5ax2YNHt6tQ@mail.gmail.com>
Subject: Re: [RFC v4 4/8] dmabuf: heaps: export system_heap buffers with GPU
 cgroup charging
To: "T.J. Mercier" <tjmercier@google.com>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, 
 Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <john.stultz@linaro.org>, Tejun Heo <tj@kernel.org>, 
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Shuah Khan <shuah@kernel.org>, Kalesh Singh <kaleshsingh@google.com>,
 Kenny.Ho@amd.com, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 7:36 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Mar 28, 2022 at 03:59:43AM +0000, T.J. Mercier wrote:
> > From: Hridya Valsaraju <hridya@google.com>
> >
> > All DMA heaps now register a new GPU cgroup device upon creation, and t=
he
> > system_heap now exports buffers associated with its GPU cgroup device f=
or
> > tracking purposes.
> >
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> >
> > ---
> > v3 changes
> > Use more common dual author commit message format per John Stultz.
> >
> > v2 changes
> > Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
> > heap to a single dma-buf function for all heaps per Daniel Vetter and
> > Christian K=C3=B6nig.
>
> Apologies for being out of the loop quite a bit. I scrolled through this
> all and I think it looks good to get going.
>
> The only thing I have is whether we should move the cgroup controllers ou=
t
> of dma-buf heaps, since that's rather android centric. E.g.
> - a system gpucg_device which is used by all the various single page
>   allocators (dma-buf heap but also shmem helpers and really anything
>   else)
> - same for cma, again both for dma-buf heaps and also for the gem cma
>   helpers in drm

Thanks Daniel, in general that makes sense to me as an approach to
making this more universal. However for the Android case I'm not sure
if the part about a single system gpucg_device would be sufficient,
because there are at least 12 different graphics related heaps that
could potentially be accounted/limited differently. [1]  So that
raises the question of how fine grained we want this to be... I tend
towards separating them all, but I haven't formed a strong opinion
about this at the moment. It sounds like you are in favor of a
smaller, more rigidly defined set of them? Either way, we need to add
code for accounting at points where we know memory is specifically for
graphics use and not something else right? (I.E. Whether it is a
dma-buf heap or somewhere like drm_gem_object_init.) So IIUC the only
question is what to use for the gpucg_device(s) at these locations.

[1] https://cs.android.com/android/platform/superproject/+/master:hardware/=
google/graphics/common/libion/ion.cpp;l=3D39-50

>
> Otherwise this will only work on non-upstream android where gpu drivers
> allocate everything from dma-buf heap. If you use something like the x86
> android project with mesa drivers, then driver-internal buffers will be
> allocated through gem and not through dma-buf heaps. Or at least I think
> that's how it works.
>
> But also meh, we can fix this fairly easily later on by adding these
> standard gpucg_dev somwehere with a bit of kerneldoc.

This is what I was thinking would happen next, but IDK if anyone sees
a more central place to do this type of use-specific accounting.

>
> Anyway has my all my ack, but don't count this as my in-depth review :-)
> -Daniel

Thanks again for taking a look!
>
> > ---
> >  drivers/dma-buf/dma-heap.c          | 27 +++++++++++++++++++++++++++
> >  drivers/dma-buf/heaps/system_heap.c |  3 +++
> >  include/linux/dma-heap.h            | 11 +++++++++++
> >  3 files changed, 41 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 8f5848aa144f..885072427775 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -7,6 +7,7 @@
> >   */
> >
> >  #include <linux/cdev.h>
> > +#include <linux/cgroup_gpu.h>
> >  #include <linux/debugfs.h>
> >  #include <linux/device.h>
> >  #include <linux/dma-buf.h>
> > @@ -31,6 +32,7 @@
> >   * @heap_devt                heap device node
> >   * @list             list head connecting to list of heaps
> >   * @heap_cdev                heap char device
> > + * @gpucg_dev                gpu cgroup device for memory accounting
> >   *
> >   * Represents a heap of memory from which buffers can be made.
> >   */
> > @@ -41,6 +43,9 @@ struct dma_heap {
> >       dev_t heap_devt;
> >       struct list_head list;
> >       struct cdev heap_cdev;
> > +#ifdef CONFIG_CGROUP_GPU
> > +     struct gpucg_device gpucg_dev;
> > +#endif
> >  };
> >
> >  static LIST_HEAD(heap_list);
> > @@ -216,6 +221,26 @@ const char *dma_heap_get_name(struct dma_heap *hea=
p)
> >       return heap->name;
> >  }
> >
> > +#ifdef CONFIG_CGROUP_GPU
> > +/**
> > + * dma_heap_get_gpucg_dev() - get struct gpucg_device for the heap.
> > + * @heap: DMA-Heap to get the gpucg_device struct for.
> > + *
> > + * Returns:
> > + * The gpucg_device struct for the heap. NULL if the GPU cgroup contro=
ller is
> > + * not enabled.
> > + */
> > +struct gpucg_device *dma_heap_get_gpucg_dev(struct dma_heap *heap)
> > +{
> > +     return &heap->gpucg_dev;
> > +}
> > +#else /* CONFIG_CGROUP_GPU */
> > +struct gpucg_device *dma_heap_get_gpucg_dev(struct dma_heap *heap)
> > +{
> > +     return NULL;
> > +}
> > +#endif /* CONFIG_CGROUP_GPU */
> > +
> >  struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_i=
nfo)
> >  {
> >       struct dma_heap *heap, *h, *err_ret;
> > @@ -288,6 +313,8 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >       list_add(&heap->list, &heap_list);
> >       mutex_unlock(&heap_list_lock);
> >
> > +     gpucg_register_device(dma_heap_get_gpucg_dev(heap), exp_info->nam=
e);
> > +
> >       return heap;
> >
> >  err2:
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heap=
s/system_heap.c
> > index ab7fd896d2c4..752a05c3cfe2 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -395,6 +395,9 @@ static struct dma_buf *system_heap_allocate(struct =
dma_heap *heap,
> >       exp_info.ops =3D &system_heap_buf_ops;
> >       exp_info.size =3D buffer->len;
> >       exp_info.flags =3D fd_flags;
> > +#ifdef CONFIG_CGROUP_GPU
> > +     exp_info.gpucg_dev =3D dma_heap_get_gpucg_dev(heap);
> > +#endif
> >       exp_info.priv =3D buffer;
> >       dmabuf =3D dma_buf_export(&exp_info);
> >       if (IS_ERR(dmabuf)) {
> > diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> > index 0c05561cad6e..e447a61d054e 100644
> > --- a/include/linux/dma-heap.h
> > +++ b/include/linux/dma-heap.h
> > @@ -10,6 +10,7 @@
> >  #define _DMA_HEAPS_H
> >
> >  #include <linux/cdev.h>
> > +#include <linux/cgroup_gpu.h>
> >  #include <linux/types.h>
> >
> >  struct dma_heap;
> > @@ -59,6 +60,16 @@ void *dma_heap_get_drvdata(struct dma_heap *heap);
> >   */
> >  const char *dma_heap_get_name(struct dma_heap *heap);
> >
> > +/**
> > + * dma_heap_get_gpucg_dev() - get a pointer to the struct gpucg_device=
 for the
> > + * heap.
> > + * @heap: DMA-Heap to retrieve gpucg_device for.
> > + *
> > + * Returns:
> > + * The gpucg_device struct for the heap.
> > + */
> > +struct gpucg_device *dma_heap_get_gpucg_dev(struct dma_heap *heap);
> > +
> >  /**
> >   * dma_heap_add - adds a heap to dmabuf heaps
> >   * @exp_info:                information needed to register this heap
> > --
> > 2.35.1.1021.g381101b075-goog
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
