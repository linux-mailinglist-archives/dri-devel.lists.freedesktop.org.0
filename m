Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A134EA97C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 10:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B60F10E7E8;
	Tue, 29 Mar 2022 08:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577D710E7E8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:42:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h23so23696488wrb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 01:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=lFgsYM4zWagmGFR0mX6PcOwk+1vvvPuWIVIxk5q1HzY=;
 b=hvVW6QkfUoJI7v+QSqi4yNrySbRNmw6dpN3LGpOoEN+D5BX0bDR5eMx3aXp0NJl47N
 KOKHZ2JRZUpYhPm5RhWck5cLNWp2nTzcW13KOo0EzQkLMh7zcAdwHPty91/OFL/Yf33K
 b3pfLfKWpmSo1+KfbbJPJQup0g3wrzlk7QejA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=lFgsYM4zWagmGFR0mX6PcOwk+1vvvPuWIVIxk5q1HzY=;
 b=gWYahmAdFpotDRcLCCv4rP91Kyj3gMcKhnmtU34aM6be9j/Ly+BR+Etwo7FVyF5vfa
 /JV3PPWUXdV6kSUca6O8ux269Lusgifrc0mpyh/Wi+HJ/5oBqml4/phJImH7byqB1pQG
 jfKBNNta8npA0mbafamgSYSGBYg0tDjXHLmZQsh8oZaN6lAw71yXU+49hpOYs6JezGlA
 CiObFkMMYy5adiLBQpvjAFL4GsVILNJmMlPr4VxzV2wNMSMJB5IoF53xq7803lExZBz5
 HUe6Zli0yTPYMhm2qg4Vmh32yHzTq3nOppHxj1V/Q1IgfMraUJA7Bd2Q2FMfquOPXHtt
 iVPA==
X-Gm-Message-State: AOAM530pCKQZ+86s3tKGQ6fApJcBwxbQrNkEhH5UpWPkgu/a+7l5BEm0
 JWrFDNEx0cbWm+gsyoPjoE8HDw==
X-Google-Smtp-Source: ABdhPJyvivybM3GVmZaWjrXRx1KODRyFpVQl4kff2gyWX8mRASed0fPCZS8ndiHYIOBBsRWgpOtubg==
X-Received: by 2002:a5d:4091:0:b0:203:f2a6:66f0 with SMTP id
 o17-20020a5d4091000000b00203f2a666f0mr29509943wrp.481.1648543343815; 
 Tue, 29 Mar 2022 01:42:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm1725908wmb.48.2022.03.29.01.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 01:42:23 -0700 (PDT)
Date: Tue, 29 Mar 2022 10:42:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [RFC v4 4/8] dmabuf: heaps: export system_heap buffers with GPU
 cgroup charging
Message-ID: <YkLGbL5Z3HVCyVkK@phenom.ffwll.local>
Mail-Followup-To: "T.J. Mercier" <tjmercier@google.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <john.stultz@linaro.org>, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>,
 Kalesh Singh <kaleshsingh@google.com>, Kenny.Ho@amd.com,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, cgroups@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20220328035951.1817417-1-tjmercier@google.com>
 <20220328035951.1817417-5-tjmercier@google.com>
 <YkHH/0Use7F30UUE@phenom.ffwll.local>
 <CABdmKX01p6g_iHsB6dd4Wwh=8iLdYiUqdY6_yyA5ax2YNHt6tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABdmKX01p6g_iHsB6dd4Wwh=8iLdYiUqdY6_yyA5ax2YNHt6tQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kenny.Ho@amd.com, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Laura Abbott <labbott@redhat.com>,
 linux-media@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, linaro-mm-sig@lists.linaro.org,
 Tejun Heo <tj@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 11:28:24AM -0700, T.J. Mercier wrote:
> On Mon, Mar 28, 2022 at 7:36 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Mar 28, 2022 at 03:59:43AM +0000, T.J. Mercier wrote:
> > > From: Hridya Valsaraju <hridya@google.com>
> > >
> > > All DMA heaps now register a new GPU cgroup device upon creation, and the
> > > system_heap now exports buffers associated with its GPU cgroup device for
> > > tracking purposes.
> > >
> > > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > >
> > > ---
> > > v3 changes
> > > Use more common dual author commit message format per John Stultz.
> > >
> > > v2 changes
> > > Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
> > > heap to a single dma-buf function for all heaps per Daniel Vetter and
> > > Christian König.
> >
> > Apologies for being out of the loop quite a bit. I scrolled through this
> > all and I think it looks good to get going.
> >
> > The only thing I have is whether we should move the cgroup controllers out
> > of dma-buf heaps, since that's rather android centric. E.g.
> > - a system gpucg_device which is used by all the various single page
> >   allocators (dma-buf heap but also shmem helpers and really anything
> >   else)
> > - same for cma, again both for dma-buf heaps and also for the gem cma
> >   helpers in drm
> 
> Thanks Daniel, in general that makes sense to me as an approach to
> making this more universal. However for the Android case I'm not sure
> if the part about a single system gpucg_device would be sufficient,
> because there are at least 12 different graphics related heaps that
> could potentially be accounted/limited differently. [1]  So that
> raises the question of how fine grained we want this to be... I tend
> towards separating them all, but I haven't formed a strong opinion
> about this at the moment. It sounds like you are in favor of a
> smaller, more rigidly defined set of them? Either way, we need to add
> code for accounting at points where we know memory is specifically for
> graphics use and not something else right? (I.E. Whether it is a
> dma-buf heap or somewhere like drm_gem_object_init.) So IIUC the only
> question is what to use for the gpucg_device(s) at these locations.

We don't have 12 in upstream, so this is a lot easier here :-)

I'm not exactly sure why you have such a huge pile of them.

For gem buffers it would be fairly similar to what you've done for dma-buf
heaps I think, with the various helper libraries (drivers stopped
hand-rolling their gem buffer) setting the right accounting group. And
yeah for system memory I think we'd need to have standard ones, for driver
specific ones it's kinda different.

> [1] https://cs.android.com/android/platform/superproject/+/master:hardware/google/graphics/common/libion/ion.cpp;l=39-50
> 
> >
> > Otherwise this will only work on non-upstream android where gpu drivers
> > allocate everything from dma-buf heap. If you use something like the x86
> > android project with mesa drivers, then driver-internal buffers will be
> > allocated through gem and not through dma-buf heaps. Or at least I think
> > that's how it works.
> >
> > But also meh, we can fix this fairly easily later on by adding these
> > standard gpucg_dev somwehere with a bit of kerneldoc.
> 
> This is what I was thinking would happen next, but IDK if anyone sees
> a more central place to do this type of use-specific accounting.

Hm I just realized ... are the names in the groups abi? If yes then I
think we need to fix this before we merge anything.
-Daniel

> 
> >
> > Anyway has my all my ack, but don't count this as my in-depth review :-)
> > -Daniel
> 
> Thanks again for taking a look!
> >
> > > ---
> > >  drivers/dma-buf/dma-heap.c          | 27 +++++++++++++++++++++++++++
> > >  drivers/dma-buf/heaps/system_heap.c |  3 +++
> > >  include/linux/dma-heap.h            | 11 +++++++++++
> > >  3 files changed, 41 insertions(+)
> > >
> > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > > index 8f5848aa144f..885072427775 100644
> > > --- a/drivers/dma-buf/dma-heap.c
> > > +++ b/drivers/dma-buf/dma-heap.c
> > > @@ -7,6 +7,7 @@
> > >   */
> > >
> > >  #include <linux/cdev.h>
> > > +#include <linux/cgroup_gpu.h>
> > >  #include <linux/debugfs.h>
> > >  #include <linux/device.h>
> > >  #include <linux/dma-buf.h>
> > > @@ -31,6 +32,7 @@
> > >   * @heap_devt                heap device node
> > >   * @list             list head connecting to list of heaps
> > >   * @heap_cdev                heap char device
> > > + * @gpucg_dev                gpu cgroup device for memory accounting
> > >   *
> > >   * Represents a heap of memory from which buffers can be made.
> > >   */
> > > @@ -41,6 +43,9 @@ struct dma_heap {
> > >       dev_t heap_devt;
> > >       struct list_head list;
> > >       struct cdev heap_cdev;
> > > +#ifdef CONFIG_CGROUP_GPU
> > > +     struct gpucg_device gpucg_dev;
> > > +#endif
> > >  };
> > >
> > >  static LIST_HEAD(heap_list);
> > > @@ -216,6 +221,26 @@ const char *dma_heap_get_name(struct dma_heap *heap)
> > >       return heap->name;
> > >  }
> > >
> > > +#ifdef CONFIG_CGROUP_GPU
> > > +/**
> > > + * dma_heap_get_gpucg_dev() - get struct gpucg_device for the heap.
> > > + * @heap: DMA-Heap to get the gpucg_device struct for.
> > > + *
> > > + * Returns:
> > > + * The gpucg_device struct for the heap. NULL if the GPU cgroup controller is
> > > + * not enabled.
> > > + */
> > > +struct gpucg_device *dma_heap_get_gpucg_dev(struct dma_heap *heap)
> > > +{
> > > +     return &heap->gpucg_dev;
> > > +}
> > > +#else /* CONFIG_CGROUP_GPU */
> > > +struct gpucg_device *dma_heap_get_gpucg_dev(struct dma_heap *heap)
> > > +{
> > > +     return NULL;
> > > +}
> > > +#endif /* CONFIG_CGROUP_GPU */
> > > +
> > >  struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
> > >  {
> > >       struct dma_heap *heap, *h, *err_ret;
> > > @@ -288,6 +313,8 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
> > >       list_add(&heap->list, &heap_list);
> > >       mutex_unlock(&heap_list_lock);
> > >
> > > +     gpucg_register_device(dma_heap_get_gpucg_dev(heap), exp_info->name);
> > > +
> > >       return heap;
> > >
> > >  err2:
> > > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> > > index ab7fd896d2c4..752a05c3cfe2 100644
> > > --- a/drivers/dma-buf/heaps/system_heap.c
> > > +++ b/drivers/dma-buf/heaps/system_heap.c
> > > @@ -395,6 +395,9 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
> > >       exp_info.ops = &system_heap_buf_ops;
> > >       exp_info.size = buffer->len;
> > >       exp_info.flags = fd_flags;
> > > +#ifdef CONFIG_CGROUP_GPU
> > > +     exp_info.gpucg_dev = dma_heap_get_gpucg_dev(heap);
> > > +#endif
> > >       exp_info.priv = buffer;
> > >       dmabuf = dma_buf_export(&exp_info);
> > >       if (IS_ERR(dmabuf)) {
> > > diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> > > index 0c05561cad6e..e447a61d054e 100644
> > > --- a/include/linux/dma-heap.h
> > > +++ b/include/linux/dma-heap.h
> > > @@ -10,6 +10,7 @@
> > >  #define _DMA_HEAPS_H
> > >
> > >  #include <linux/cdev.h>
> > > +#include <linux/cgroup_gpu.h>
> > >  #include <linux/types.h>
> > >
> > >  struct dma_heap;
> > > @@ -59,6 +60,16 @@ void *dma_heap_get_drvdata(struct dma_heap *heap);
> > >   */
> > >  const char *dma_heap_get_name(struct dma_heap *heap);
> > >
> > > +/**
> > > + * dma_heap_get_gpucg_dev() - get a pointer to the struct gpucg_device for the
> > > + * heap.
> > > + * @heap: DMA-Heap to retrieve gpucg_device for.
> > > + *
> > > + * Returns:
> > > + * The gpucg_device struct for the heap.
> > > + */
> > > +struct gpucg_device *dma_heap_get_gpucg_dev(struct dma_heap *heap);
> > > +
> > >  /**
> > >   * dma_heap_add - adds a heap to dmabuf heaps
> > >   * @exp_info:                information needed to register this heap
> > > --
> > > 2.35.1.1021.g381101b075-goog
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
