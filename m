Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 577B451BAC5
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 10:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05FE10E2E1;
	Thu,  5 May 2022 08:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A9D10E2E1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 08:39:39 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id n10so7357830ejk.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 01:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oN6Gqb9irXAOOdLc0SOqszl2tbbtpBaXAdAT6AFdNNU=;
 b=WUwkcG1v4Kr5pwoXOsxPJ6TxZdl1bLcHPOA0DPmz7TaJP98dEpDWBKYOBLRak1riiV
 P4Shuf2pBn+t8dnNLVMeSetIb+3cxJPzbICr7/4WxemUI/MraFkZ2vpHrJs/uTUsLmX0
 tDBjithBsayB7+6xmkdu3mM6tkhty6zPRyPRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oN6Gqb9irXAOOdLc0SOqszl2tbbtpBaXAdAT6AFdNNU=;
 b=OvNNbnOGBnFcU8FCHPKSR5S+765TedC1dDs/bLiaLSJ4/qEO67zKMU3hrmNQ8mv+UP
 BwtPbTiuwUe2e2m2b7jGmpBCVYgMFTQhfNRTxcfdSCZVtVQT/o6G7Y0rQ9GUZndmlA6M
 oB0IJTuxxJJinHzp9LBMcYcBD1SbomR1Ah6u6Od3TScYTD3AkwVoYI2KVex7yeVyywWG
 iyFpecMs58EkUGSrpyzl+spiWDf1OWz8JNxPN4LuN7rMvGoH3uYCxaZvhFSF0UTY8Hl6
 +Tt8v+EIaTtNFtpfGQmg/nD7IUyDED+uzwQsajyxB6c9sT+k7V9PhWzEC9GYJgVH44X0
 jKuA==
X-Gm-Message-State: AOAM533SagrnKfCoyfryzFFFjeKu+wBCj48ecYqD+Csl4cCBmuEAik9w
 /1KZLU29F2C5DzLkC3DVIbhnGw==
X-Google-Smtp-Source: ABdhPJwA3wen9g63r28AF6UG4RpFR6cJddfXq7FeXnoj7xub2jturPwVhX5xdOXZhbI6t2bvrUI1YQ==
X-Received: by 2002:a17:906:c156:b0:6f3:9e3c:5cc8 with SMTP id
 dp22-20020a170906c15600b006f39e3c5cc8mr24656606ejc.17.1651739977543; 
 Thu, 05 May 2022 01:39:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ml20-20020a170906cc1400b006f3ef214e2fsm492376ejb.149.2022.05.05.01.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 01:39:37 -0700 (PDT)
Date: Thu, 5 May 2022 10:39:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 2/2] dma-buf: Add an API for importing sync files (v8)
Message-ID: <YnONR/ILVc2JzFIw@phenom.ffwll.local>
References: <20220504203404.1495485-1-jason@jlekstrand.net>
 <20220504203404.1495485-3-jason@jlekstrand.net>
 <YnMD9JX/v6kSQE2t@phenom.ffwll.local>
 <CAOFGe96vXRjUzi3CLj788=Wy3VxGcM-bB3+0M2Ttbg4GPwti7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOFGe96vXRjUzi3CLj788=Wy3VxGcM-bB3+0M2Ttbg4GPwti7A@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 05, 2022 at 03:13:55AM -0500, Jason Ekstrand wrote:
> On Wed, May 4, 2022 at 5:53 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Wed, May 04, 2022 at 03:34:04PM -0500, Jason Ekstrand wrote:
> > > This patch is analogous to the previous sync file export patch in that
> > > it allows you to import a sync_file into a dma-buf.  Unlike the previous
> > > patch, however, this does add genuinely new functionality to dma-buf.
> > > Without this, the only way to attach a sync_file to a dma-buf is to
> > > submit a batch to your driver of choice which waits on the sync_file and
> > > claims to write to the dma-buf.  Even if said batch is a no-op, a submit
> > > is typically way more overhead than just attaching a fence.  A submit
> > > may also imply extra synchronization with other work because it happens
> > > on a hardware queue.
> > >
> > > In the Vulkan world, this is useful for dealing with the out-fence from
> > > vkQueuePresent.  Current Linux window-systems (X11, Wayland, etc.) all
> > > rely on dma-buf implicit sync.  Since Vulkan is an explicit sync API, we
> > > get a set of fences (VkSemaphores) in vkQueuePresent and have to stash
> > > those as an exclusive (write) fence on the dma-buf.  We handle it in
> > > Mesa today with the above mentioned dummy submit trick.  This ioctl
> > > would allow us to set it directly without the dummy submit.
> > >
> > > This may also open up possibilities for GPU drivers to move away from
> > > implicit sync for their kernel driver uAPI and instead provide sync
> > > files and rely on dma-buf import/export for communicating with other
> > > implicit sync clients.
> > >
> > > We make the explicit choice here to only allow setting RW fences which
> > > translates to an exclusive fence on the dma_resv.  There's no use for
> > > read-only fences for communicating with other implicit sync userspace
> > > and any such attempts are likely to be racy at best.  When we got to
> > > insert the RW fence, the actual fence we set as the new exclusive fence
> > > is a combination of the sync_file provided by the user and all the other
> > > fences on the dma_resv.  This ensures that the newly added exclusive
> > > fence will never signal before the old one would have and ensures that
> > > we don't break any dma_resv contracts.  We require userspace to specify
> > > RW in the flags for symmetry with the export ioctl and in case we ever
> > > want to support read fences in the future.
> > >
> > > There is one downside here that's worth documenting:  If two clients
> > > writing to the same dma-buf using this API race with each other, their
> > > actions on the dma-buf may happen in parallel or in an undefined order.
> > > Both with and without this API, the pattern is the same:  Collect all
> > > the fences on dma-buf, submit work which depends on said fences, and
> > > then set a new exclusive (write) fence on the dma-buf which depends on
> > > said work.  The difference is that, when it's all handled by the GPU
> > > driver's submit ioctl, the three operations happen atomically under the
> > > dma_resv lock.  If two userspace submits race, one will happen before
> > > the other.  You aren't guaranteed which but you are guaranteed that
> > > they're strictly ordered.  If userspace manages the fences itself, then
> > > these three operations happen separately and the two render operations
> > > may happen genuinely in parallel or get interleaved.  However, this is a
> > > case of userspace racing with itself.  As long as we ensure userspace
> > > can't back the kernel into a corner, it should be fine.
> > >
> > > v2 (Jason Ekstrand):
> > >  - Use a wrapper dma_fence_array of all fences including the new one
> > >    when importing an exclusive fence.
> > >
> > > v3 (Jason Ekstrand):
> > >  - Lock around setting shared fences as well as exclusive
> > >  - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
> > >  - Initialize ret to 0 in dma_buf_wait_sync_file
> > >
> > > v4 (Jason Ekstrand):
> > >  - Use the new dma_resv_get_singleton helper
> > >
> > > v5 (Jason Ekstrand):
> > >  - Rename the IOCTLs to import/export rather than wait/signal
> > >  - Drop the WRITE flag and always get/set the exclusive fence
> > >
> > > v6 (Jason Ekstrand):
> > >  - Split import and export into separate patches
> > >  - New commit message
> > >
> > > v7 (Daniel Vetter):
> > >  - Fix the uapi header to use the right struct in the ioctl
> > >  - Use a separate dma_buf_import_sync_file struct
> > >  - Add kerneldoc for dma_buf_import_sync_file
> > >
> > > v8 (Jason Ekstrand):
> > >  - Rebase on Christian König's fence rework
> > >
> > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > ---
> > >  drivers/dma-buf/dma-buf.c    | 36 ++++++++++++++++++++++++++++++++++++
> > >  include/uapi/linux/dma-buf.h | 22 ++++++++++++++++++++++
> > >  2 files changed, 58 insertions(+)
> > >
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index 529e0611e53b..68aac6f694f9 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -383,6 +383,40 @@ static long dma_buf_export_sync_file(struct dma_buf
> > *dmabuf,
> > >       put_unused_fd(fd);
> > >       return ret;
> > >  }
> > > +
> > > +static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
> > > +                                  const void __user *user_data)
> > > +{
> > > +     struct dma_buf_import_sync_file arg;
> > > +     struct dma_fence *fence;
> > > +     enum dma_resv_usage usage;
> > > +     int ret = 0;
> > > +
> > > +     if (copy_from_user(&arg, user_data, sizeof(arg)))
> > > +             return -EFAULT;
> > > +
> > > +     if (arg.flags != DMA_BUF_SYNC_RW)
> >
> > I think the flag validation here looks wrong? I think needs needs the
> > exact same 3 checks as the export ioctl.
> >
> 
> Yup.  Fixed.  By which I mean I stuck in the 2-check version.  Let's chat
> on patch 1 about whether or not RW should be allowed.
> 
> 
> >
> > > +             return -EINVAL;
> > > +
> > > +     fence = sync_file_get_fence(arg.fd);
> > > +     if (!fence)
> > > +             return -EINVAL;
> > > +
> > > +     usage = (arg.flags & DMA_BUF_SYNC_WRITE) ? DMA_RESV_USAGE_WRITE :
> > > +                                                DMA_RESV_USAGE_READ;
> > > +
> > > +     dma_resv_lock(dmabuf->resv, NULL);
> > > +
> > > +     ret = dma_resv_reserve_fences(dmabuf->resv, 1);
> > > +     if (!ret)
> > > +             dma_resv_add_fence(dmabuf->resv, fence, usage);
> > > +
> > > +     dma_resv_unlock(dmabuf->resv);
> > > +
> > > +     dma_fence_put(fence);
> > > +
> > > +     return ret;
> > > +}
> > >  #endif
> > >
> > >  static long dma_buf_ioctl(struct file *file,
> > > @@ -431,6 +465,8 @@ static long dma_buf_ioctl(struct file *file,
> > >  #if IS_ENABLED(CONFIG_SYNC_FILE)
> > >       case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
> > >               return dma_buf_export_sync_file(dmabuf, (void __user
> > *)arg);
> > > +     case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
> > > +             return dma_buf_import_sync_file(dmabuf, (const void __user
> > *)arg);
> > >  #endif
> > >
> > >       default:
> > > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> > > index 46f1e3e98b02..913119bf2201 100644
> > > --- a/include/uapi/linux/dma-buf.h
> > > +++ b/include/uapi/linux/dma-buf.h
> > > @@ -119,6 +119,27 @@ struct dma_buf_export_sync_file {
> > >       __s32 fd;
> > >  };
> > >
> > > +/**
> > > + * struct dma_buf_import_sync_file - Insert a sync_file into a dma-buf
> > > + *
> > > + * Userspace can perform a DMA_BUF_IOCTL_IMPORT_SYNC_FILE to insert a
> > > + * sync_file into a dma-buf for the purposes of implicit synchronization
> > > + * with other dma-buf consumers.  This allows clients using explicitly
> > > + * synchronized APIs such as Vulkan to inter-op with dma-buf consumers
> > > + * which expect implicit synchronization such as OpenGL or most media
> > > + * drivers/video.
> > > + */
> > > +struct dma_buf_import_sync_file {
> > > +     /**
> > > +      * @flags: Read/write flags
> > > +      *
> > > +      * Must be DMA_BUF_SYNC_RW.
> >
> > The checks are wrong, but the intent of your implementation looks a lot
> > more like you allow both SYNC_WRITE and SYNC_READ, and I think that makes
> > a lot of sense. Especially since we can now true sync-less access for vk
> > with DMA_RESV_USAGE_BOOKKEEPING, so allowing userspace to explicit set
> > read will be needed.
> >
> > Or does vk only allow you to set write fences anyway? That would suck for
> > the vk app + gl compositor case a bit, so I hope not.
> >
> 
> I just forgot to update the docs.  The reason for only allowing RW before
> was because we were all scared of inserting shared fences and not exclusive
> fences.  Now that we have the fence rework, I think being able to stick in
> a read fence is safe.  Not sure if it's useful, but it's at least safe.

For compositors we do need to be able to insert read fences, or things go
wrong I think with concurrency with apps and readback. If the compositor
marks its access as writing, then you stall the client when it wants to
copy stuff over to the next buffer or do some temporal post processing or
whatever. Or do we just entirely rely on winsys events for handing the
buffers back? I'm honestly not sure on this part ... and there's probably
some buffer sharing where these read fences do matter.
-Daniel

> 
> --Jason
> 
> 
> > > +      */
> > > +     __u32 flags;
> > > +     /** @fd: Sync file descriptor */
> > > +     __s32 fd;
> > > +};
> > > +
> > >  #define DMA_BUF_BASE         'b'
> > >  #define DMA_BUF_IOCTL_SYNC   _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> > >
> > > @@ -129,5 +150,6 @@ struct dma_buf_export_sync_file {
> > >  #define DMA_BUF_SET_NAME_A   _IOW(DMA_BUF_BASE, 1, u32)
> > >  #define DMA_BUF_SET_NAME_B   _IOW(DMA_BUF_BASE, 1, u64)
> > >  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE       _IOWR(DMA_BUF_BASE, 2,
> > struct dma_buf_export_sync_file)
> > > +#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE       _IOW(DMA_BUF_BASE, 3,
> > struct dma_buf_import_sync_file)
> >
> > With the flag nits sorted out:
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > >
> > >  #endif
> > > --
> > > 2.36.0
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
