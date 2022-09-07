Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 105725B0AB5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 18:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDE910E7DF;
	Wed,  7 Sep 2022 16:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBA710E7FA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 16:55:50 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id fg1so9657583ejc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date;
 bh=3wG8aEYmlMq503E+b15Mt/ISE8s5toQ5qwq6MQ9S1TE=;
 b=GKRsGngx/rUi39rZzRpt+Ipq5LWhNCBLO+KbZUF5e7HrJTE3+E1MokSVuUt5GYdJTJ
 mW+lOrIQ10CVaXLDixGqICRGyjHW/b+odWdSZ4PgqfGCh8bUGPOsPYa7PGVj+zlmhl8/
 8wOuMw07sHpku7pTTLI0qLlwBKbL9mpll1MdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=3wG8aEYmlMq503E+b15Mt/ISE8s5toQ5qwq6MQ9S1TE=;
 b=hnOsgCKTbJF+IsseUHAoszn3rwJslMRNtcYBHYOwrhYlUkEDwVC15LxWXDjhBkkmQp
 +w0I5r2taWSJbdMX1nmrsX9WZlbdKdJy4MnbLUQ91pYeLdU33MXuneWcs0k+ewSZxIJM
 xFvEJY49Ykl6NGW41NxRVa8B0CZvNvAOQh/yA+/Ri5+RykU8HTwWY6vPr0R+WFTqw6F0
 RKSMB/7k5YqYS8IZCbnIBLH70z0TkE44Su7cchA0L5yTWmnr5MbGXbzKreP5uOlvTBdl
 bKUIQQrLSgqFokgQKJX85//KE0nRHZ9w0aE9cPqG29Nt4Tdxc0n8ijyfTG8Um7/n8daY
 bhbA==
X-Gm-Message-State: ACgBeo2cxuQTpqqGMuiH9fgVlIDBTIsd/FIAoos5b1RBbbd6TPLbgyWs
 7k1JlDvWU+1f9I9qyzWiMCi65g==
X-Google-Smtp-Source: AA6agR50K9CduSBZwi8jvyMeuyPtPN09nDffGy7tsDAnCQhuWszoLdYbys/A8c5KCluQdXtq5/fgFQ==
X-Received: by 2002:a17:907:7faa:b0:741:7674:5ea1 with SMTP id
 qk42-20020a1709077faa00b0074176745ea1mr3076474ejc.27.1662569748894; 
 Wed, 07 Sep 2022 09:55:48 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 f22-20020a056402161600b0044e8ecb9d25sm6220633edv.52.2022.09.07.09.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 09:55:48 -0700 (PDT)
Date: Wed, 7 Sep 2022 18:55:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 1/3] dma-buf: Add ioctl to query mmap coherency/cache
 info
Message-ID: <YxjNEr888ndOnBjI@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>
References: <327c77d5-5812-a158-6c9f-c68e15a5a6b4@amd.com>
 <CAF6AEGu3oxM+EX_FsLpw4m0KouMyFMLN=AGGbf=6TVQGkJ7jQg@mail.gmail.com>
 <6396ccf9-a677-427d-f5f9-12d30ad2197e@amd.com>
 <CAF6AEGsbc9PuSOyvhnr0ALQiLY9gSBySHyisEOfteZq9NXN0VA@mail.gmail.com>
 <8afce42b-db0e-9f71-7cd7-2680b6c9a1c9@amd.com>
 <CAF6AEGvBhx9ZFBzb8dUymhN99HPq7eTyGwVH-Uk9GQr1QjWN+Q@mail.gmail.com>
 <973682df-b2e5-020c-98e9-96ec9af214d5@amd.com>
 <CAF6AEGtVMAzqECSTUFX1Zmb8BOLiq-n04nizO22J2ENcGTgQBQ@mail.gmail.com>
 <1d9da979-7d09-d80b-bc0e-f9641422b962@amd.com>
 <CAF6AEGv7xYSucyriCkPhibQXs2KBxT5mMW6dMxX_E63xvpKLDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGv7xYSucyriCkPhibQXs2KBxT5mMW6dMxX_E63xvpKLDA@mail.gmail.com>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 18, 2022 at 08:01:53AM -0700, Rob Clark wrote:
> On Thu, Aug 18, 2022 at 7:54 AM Christian König
> <christian.koenig@amd.com> wrote:
> >
> > Am 18.08.22 um 16:25 schrieb Rob Clark:
> > > On Thu, Aug 18, 2022 at 4:21 AM Christian König
> > > <christian.koenig@amd.com> wrote:
> > >> Am 17.08.22 um 15:44 schrieb Rob Clark:
> > >>> On Wed, Aug 17, 2022 at 2:57 AM Christian König
> > >>> <christian.koenig@amd.com> wrote:
> > >>>> [SNIP]
> > >>>>
> > >>>> The resulting cache attrs from combination of S1 and S2 translation
> > >>>> can differ.  So ideally we setup the S2 pgtables in guest aligned with
> > >>>> host userspace mappings
> > >>>> Well exactly that is not very convincing.
> > >>>>
> > >>>> What you want to do is to use one channel for the address and a
> > >>>> different one for the cache attrs, that's not something I would
> > >>>> recommend doing in general.
> > >>> How would that work.. mmap() is the channel for the address, we'd need
> > >>> to introduce a new syscall that returned additional information?
> > >> The channel for the address is not mmap(), but rather the page faults.
> > >> mmap() is just the function setting up that channel.
> > >>
> > >> The page faults then insert both the address as well as the caching
> > >> attributes (at least on x86).
> > > This is true on arm64 as well, but only in the S1 tables (which I
> > > would have to assume is the case on x86 as well)
> > >
> > >> That we then need to forward the caching attributes manually once more
> > >> seems really misplaced.
> > >>
> > >>>> Instead the client pgtables should be setup in a way so that host can
> > >>>> overwrite them.
> > >>> How?  That is completely not how VMs work.  Even if the host knew
> > >>> where the pgtables were and somehow magically knew the various guest
> > >>> userspace VAs, it would be racey.
> > >> Well you mentioned that the client page tables can be setup in a way
> > >> that the host page tables determine what caching to use. As far as I can
> > >> see this is what we should use here.
> > > On arm64/aarch64, they *can*.. but the system (on some versions of
> > > armv8) can also be configured to let S2 determine the attributes.  And
> > > apparently there are benefits to this (avoids unnecessary cache
> > > flushing in the host, AFAIU.)  This is the case where we need this new
> > > api.
> > >
> > > IMO it is fine for the exporter to return a value indicating that the
> > > attributes change dynamically or that S1 attributes must somehow be
> > > used by the hw.  This would at least let the VMM return an error in
> > > cases where S1 attrs cannot be relied on.  But there are enough
> > > exporters where the cache attrs are static for the life of the buffer.
> > > So even if you need to return DMA_BUF_MAP_I_DONT_KNOW, maybe that is
> > > fine (if x86 can always rely on S1 attrs), or at least will let the
> > > VMM return an error rather than just blindly assuming things will
> > > work.
> > >
> > > But it makes no sense to reject the whole idea just because of some
> > > exporters (which may not even need this).  There is always room to let
> > > them return a map-info value that describes the situation or
> > > limitations to the VMM.
> >
> > Well it does make sense as far as I can see.
> >
> > This is a very specific workaround for a platform problem which only
> > matters there, but increases complexity for everybody.
> 
> I'm not sure how this adds complexity for everybody.. or at least the
> intention was the default value for the new enum is the same as
> current status-quo, so no need to plumb something thru every single
> exporter.

I think what König freaks out about here, and I think it's the same
concern I have, is that this is for _all_ dma-buf exporter.

Yeah I know we're having this "anything might not be implemented" escape
hatch, but we're also slowly working to get that fixed and make dma-buf
implementations. And so adding a fully generic dma-buf ioctl which is very
limited use for arm64 VM in funky configuration (where the guest controls
caching mode in ptes fully). The usual way we do these very special things
are:

- Importer upcasts the dma-buf to the exporters buffer type by checking
  the ops structure pointer.
- There is no dma-buf interface anymore really, and you can do very
  specific stuff like xgmi mappings, or virtio uuid, or whatever.

I think this should also work like that. Which means the query ioctl
should be on some kvm/vm specific interface most likely, and not on
generic dma-buf.

Also if we add this interface somewhere in the kvm world then that would
also be a natural place to implement stuff like "the guest can't actually
overwrite caching modes, ignore this all" and anything else. Ideally this
thing exists only where it's actually needed, i.e. this specific vm+arm64
cases. Not anywhere else, because experience says that if dma-buf can be
abused in some way, people will.

Also I'd really like to understand the full flow here too, some vague
hand-waving that "apparently it has some cache flushing benefits" is a bit
too vague, if this is really only for performance. Like my experience has
been that when a less priviledge entity can control caching, then you
actually have to flush more often, not less. At least depending upon
hardware (some recent intel igpu chips have this issue where due to
userspace overwriting cache control too much we have to defensively flush
caches again for everything - hw design is going to get fixed again soon).
-Daniel

> 
> BR,
> -R
> 
> > If we don't have any other choice on the problem to work around that I
> > would say ok we add an ARM specific workaround.
> >
> > But as long as that's not the case the whole idea is pretty clearly a
> > NAK from my side.
> >
> > Regards,
> > Christian.
> >
> > >
> > > BR,
> > > -R
> > >
> > >> Regards,
> > >> Christian.
> > >>
> > >>> BR,
> > >>> -R
> > >>>
> > >>>> Regards,
> > >>>> Christian.
> > >>>>
> > >>>>> BR,
> > >>>>> -R
> > >>>>>
> > >>>>>> Regards,
> > >>>>>> Christian.
> > >>>>>>
> > >>>>>>> BR,
> > >>>>>>> -R
> > >>>>>>>
> > >>>>>>>> If the hardware can't use the caching information from the host CPU page
> > >>>>>>>> tables directly then that pretty much completely breaks the concept that
> > >>>>>>>> the exporter is responsible for setting up those page tables.
> > >>>>>>>>
> > >>>>>>>> Regards,
> > >>>>>>>> Christian.
> > >>>>>>>>
> > >>>>>>>>>       drivers/dma-buf/dma-buf.c    | 63 +++++++++++++++++++++++++++------
> > >>>>>>>>>       include/linux/dma-buf.h      | 11 ++++++
> > >>>>>>>>>       include/uapi/linux/dma-buf.h | 68 ++++++++++++++++++++++++++++++++++++
> > >>>>>>>>>       3 files changed, 132 insertions(+), 10 deletions(-)
> > >>>>>>>>>
> > >>>>>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > >>>>>>>>> index 32f55640890c..262c4706f721 100644
> > >>>>>>>>> --- a/drivers/dma-buf/dma-buf.c
> > >>>>>>>>> +++ b/drivers/dma-buf/dma-buf.c
> > >>>>>>>>> @@ -125,6 +125,32 @@ static struct file_system_type dma_buf_fs_type = {
> > >>>>>>>>>           .kill_sb = kill_anon_super,
> > >>>>>>>>>       };
> > >>>>>>>>>
> > >>>>>>>>> +static int __dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> > >>>>>>>>> +{
> > >>>>>>>>> +     int ret;
> > >>>>>>>>> +
> > >>>>>>>>> +     /* check if buffer supports mmap */
> > >>>>>>>>> +     if (!dmabuf->ops->mmap)
> > >>>>>>>>> +             return -EINVAL;
> > >>>>>>>>> +
> > >>>>>>>>> +     ret = dmabuf->ops->mmap(dmabuf, vma);
> > >>>>>>>>> +
> > >>>>>>>>> +     /*
> > >>>>>>>>> +      * If the exporter claims to support coherent access, ensure the
> > >>>>>>>>> +      * pgprot flags match the claim.
> > >>>>>>>>> +      */
> > >>>>>>>>> +     if ((dmabuf->map_info != DMA_BUF_MAP_INCOHERENT) && !ret) {
> > >>>>>>>>> +             pgprot_t wc_prot = pgprot_writecombine(vma->vm_page_prot);
> > >>>>>>>>> +             if (dmabuf->map_info == DMA_BUF_COHERENT_WC) {
> > >>>>>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) != pgprot_val(wc_prot));
> > >>>>>>>>> +             } else {
> > >>>>>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) == pgprot_val(wc_prot));
> > >>>>>>>>> +             }
> > >>>>>>>>> +     }
> > >>>>>>>>> +
> > >>>>>>>>> +     return ret;
> > >>>>>>>>> +}
> > >>>>>>>>> +
> > >>>>>>>>>       static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
> > >>>>>>>>>       {
> > >>>>>>>>>           struct dma_buf *dmabuf;
> > >>>>>>>>> @@ -134,16 +160,12 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
> > >>>>>>>>>
> > >>>>>>>>>           dmabuf = file->private_data;
> > >>>>>>>>>
> > >>>>>>>>> -     /* check if buffer supports mmap */
> > >>>>>>>>> -     if (!dmabuf->ops->mmap)
> > >>>>>>>>> -             return -EINVAL;
> > >>>>>>>>> -
> > >>>>>>>>>           /* check for overflowing the buffer's size */
> > >>>>>>>>>           if (vma->vm_pgoff + vma_pages(vma) >
> > >>>>>>>>>               dmabuf->size >> PAGE_SHIFT)
> > >>>>>>>>>                   return -EINVAL;
> > >>>>>>>>>
> > >>>>>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
> > >>>>>>>>> +     return __dma_buf_mmap(dmabuf, vma);
> > >>>>>>>>>       }
> > >>>>>>>>>
> > >>>>>>>>>       static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
> > >>>>>>>>> @@ -326,6 +348,27 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
> > >>>>>>>>>           return 0;
> > >>>>>>>>>       }
> > >>>>>>>>>
> > >>>>>>>>> +static long dma_buf_info(struct dma_buf *dmabuf, void __user *uarg)
> > >>>>>>>>> +{
> > >>>>>>>>> +     struct dma_buf_info arg;
> > >>>>>>>>> +
> > >>>>>>>>> +     if (copy_from_user(&arg, uarg, sizeof(arg)))
> > >>>>>>>>> +             return -EFAULT;
> > >>>>>>>>> +
> > >>>>>>>>> +     switch (arg.param) {
> > >>>>>>>>> +     case DMA_BUF_INFO_MAP_INFO:
> > >>>>>>>>> +             arg.value = dmabuf->map_info;
> > >>>>>>>>> +             break;
> > >>>>>>>>> +     default:
> > >>>>>>>>> +             return -EINVAL;
> > >>>>>>>>> +     }
> > >>>>>>>>> +
> > >>>>>>>>> +     if (copy_to_user(uarg, &arg, sizeof(arg)))
> > >>>>>>>>> +             return -EFAULT;
> > >>>>>>>>> +
> > >>>>>>>>> +     return 0;
> > >>>>>>>>> +}
> > >>>>>>>>> +
> > >>>>>>>>>       static long dma_buf_ioctl(struct file *file,
> > >>>>>>>>>                             unsigned int cmd, unsigned long arg)
> > >>>>>>>>>       {
> > >>>>>>>>> @@ -369,6 +412,9 @@ static long dma_buf_ioctl(struct file *file,
> > >>>>>>>>>           case DMA_BUF_SET_NAME_B:
> > >>>>>>>>>                   return dma_buf_set_name(dmabuf, (const char __user *)arg);
> > >>>>>>>>>
> > >>>>>>>>> +     case DMA_BUF_IOCTL_INFO:
> > >>>>>>>>> +             return dma_buf_info(dmabuf, (void __user *)arg);
> > >>>>>>>>> +
> > >>>>>>>>>           default:
> > >>>>>>>>>                   return -ENOTTY;
> > >>>>>>>>>           }
> > >>>>>>>>> @@ -530,6 +576,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
> > >>>>>>>>>           dmabuf->priv = exp_info->priv;
> > >>>>>>>>>           dmabuf->ops = exp_info->ops;
> > >>>>>>>>>           dmabuf->size = exp_info->size;
> > >>>>>>>>> +     dmabuf->map_info = exp_info->map_info;
> > >>>>>>>>>           dmabuf->exp_name = exp_info->exp_name;
> > >>>>>>>>>           dmabuf->owner = exp_info->owner;
> > >>>>>>>>>           spin_lock_init(&dmabuf->name_lock);
> > >>>>>>>>> @@ -1245,10 +1292,6 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
> > >>>>>>>>>           if (WARN_ON(!dmabuf || !vma))
> > >>>>>>>>>                   return -EINVAL;
> > >>>>>>>>>
> > >>>>>>>>> -     /* check if buffer supports mmap */
> > >>>>>>>>> -     if (!dmabuf->ops->mmap)
> > >>>>>>>>> -             return -EINVAL;
> > >>>>>>>>> -
> > >>>>>>>>>           /* check for offset overflow */
> > >>>>>>>>>           if (pgoff + vma_pages(vma) < pgoff)
> > >>>>>>>>>                   return -EOVERFLOW;
> > >>>>>>>>> @@ -1262,7 +1305,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
> > >>>>>>>>>           vma_set_file(vma, dmabuf->file);
> > >>>>>>>>>           vma->vm_pgoff = pgoff;
> > >>>>>>>>>
> > >>>>>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
> > >>>>>>>>> +     return __dma_buf_mmap(dmabuf, vma);
> > >>>>>>>>>       }
> > >>>>>>>>>       EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
> > >>>>>>>>>
> > >>>>>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > >>>>>>>>> index 71731796c8c3..37923c8d5c24 100644
> > >>>>>>>>> --- a/include/linux/dma-buf.h
> > >>>>>>>>> +++ b/include/linux/dma-buf.h
> > >>>>>>>>> @@ -23,6 +23,8 @@
> > >>>>>>>>>       #include <linux/dma-fence.h>
> > >>>>>>>>>       #include <linux/wait.h>
> > >>>>>>>>>
> > >>>>>>>>> +#include <uapi/linux/dma-buf.h>
> > >>>>>>>>> +
> > >>>>>>>>>       struct device;
> > >>>>>>>>>       struct dma_buf;
> > >>>>>>>>>       struct dma_buf_attachment;
> > >>>>>>>>> @@ -307,6 +309,13 @@ struct dma_buf {
> > >>>>>>>>>            */
> > >>>>>>>>>           size_t size;
> > >>>>>>>>>
> > >>>>>>>>> +     /**
> > >>>>>>>>> +      * @map_info:
> > >>>>>>>>> +      *
> > >>>>>>>>> +      * CPU mapping/coherency information for the buffer.
> > >>>>>>>>> +      */
> > >>>>>>>>> +     enum dma_buf_map_info map_info;
> > >>>>>>>>> +
> > >>>>>>>>>           /**
> > >>>>>>>>>            * @file:
> > >>>>>>>>>            *
> > >>>>>>>>> @@ -533,6 +542,7 @@ struct dma_buf_attachment {
> > >>>>>>>>>        * @ops:    Attach allocator-defined dma buf ops to the new buffer
> > >>>>>>>>>        * @size:   Size of the buffer - invariant over the lifetime of the buffer
> > >>>>>>>>>        * @flags:  mode flags for the file
> > >>>>>>>>> + * @map_info:        CPU mapping/coherency information for the buffer
> > >>>>>>>>>        * @resv:   reservation-object, NULL to allocate default one
> > >>>>>>>>>        * @priv:   Attach private data of allocator to this buffer
> > >>>>>>>>>        *
> > >>>>>>>>> @@ -545,6 +555,7 @@ struct dma_buf_export_info {
> > >>>>>>>>>           const struct dma_buf_ops *ops;
> > >>>>>>>>>           size_t size;
> > >>>>>>>>>           int flags;
> > >>>>>>>>> +     enum dma_buf_map_info map_info;
> > >>>>>>>>>           struct dma_resv *resv;
> > >>>>>>>>>           void *priv;
> > >>>>>>>>>       };
> > >>>>>>>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> > >>>>>>>>> index b1523cb8ab30..07b403ffdb43 100644
> > >>>>>>>>> --- a/include/uapi/linux/dma-buf.h
> > >>>>>>>>> +++ b/include/uapi/linux/dma-buf.h
> > >>>>>>>>> @@ -85,6 +85,72 @@ struct dma_buf_sync {
> > >>>>>>>>>
> > >>>>>>>>>       #define DMA_BUF_NAME_LEN    32
> > >>>>>>>>>
> > >>>>>>>>> +/**
> > >>>>>>>>> + * enum dma_buf_map_info - CPU mapping info
> > >>>>>>>>> + *
> > >>>>>>>>> + * This enum describes coherency of a userspace mapping of the dmabuf.
> > >>>>>>>>> + *
> > >>>>>>>>> + * Importing devices should check dma_buf::map_info flag and reject an
> > >>>>>>>>> + * import if unsupported.  For example, if the exporting device uses
> > >>>>>>>>> + * @DMA_BUF_COHERENT_CACHED but the importing device does not support
> > >>>>>>>>> + * CPU cache coherency, the dma-buf import should fail.
> > >>>>>>>>> + */
> > >>>>>>>>> +enum dma_buf_map_info {
> > >>>>>>>>> +     /**
> > >>>>>>>>> +      * @DMA_BUF_MAP_INCOHERENT: CPU mapping is incoherent.
> > >>>>>>>>> +      *
> > >>>>>>>>> +      * Use of DMA_BUF_IOCTL_SYNC is required for CPU managed coherenency.
> > >>>>>>>>> +      */
> > >>>>>>>>> +     DMA_BUF_MAP_INCOHERENT,
> > >>>>>>>>> +
> > >>>>>>>>> +     /**
> > >>>>>>>>> +      * @DMA_BUF_COHERENT_WC: CPU mapping is coherent but not cached.
> > >>>>>>>>> +      *
> > >>>>>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
> > >>>>>>>>> +      * However fences may be still required for synchronizing access.  Ie.
> > >>>>>>>>> +      * coherency can only be relied upon by an explicit-fencing userspace.
> > >>>>>>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
> > >>>>>>>>> +      *
> > >>>>>>>>> +      * The cpu mapping is writecombine.
> > >>>>>>>>> +      */
> > >>>>>>>>> +     DMA_BUF_COHERENT_WC,
> > >>>>>>>>> +
> > >>>>>>>>> +     /**
> > >>>>>>>>> +      * @DMA_BUF_COHERENT_CACHED: CPU mapping is coherent and CPU cached.
> > >>>>>>>>> +      *
> > >>>>>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
> > >>>>>>>>> +      * However fences may be still required for synchronizing access.  Ie.
> > >>>>>>>>> +      * coherency can only be relied upon by an explicit-fencing userspace.
> > >>>>>>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
> > >>>>>>>>> +      *
> > >>>>>>>>> +      * The cpu mapping is cached.
> > >>>>>>>>> +      */
> > >>>>>>>>> +     DMA_BUF_COHERENT_CACHED,
> > >>>>>>>>> +};
> > >>>>>>>>> +
> > >>>>>>>>> +/**
> > >>>>>>>>> + * struct dma_buf_info - Query info about the buffer.
> > >>>>>>>>> + */
> > >>>>>>>>> +struct dma_buf_info {
> > >>>>>>>>> +
> > >>>>>>>>> +#define DMA_BUF_INFO_MAP_INFO    1
> > >>>>>>>>> +
> > >>>>>>>>> +     /**
> > >>>>>>>>> +      * @param: Which param to query
> > >>>>>>>>> +      *
> > >>>>>>>>> +      * DMA_BUF_INFO_MAP_INFO:
> > >>>>>>>>> +      *     Returns enum dma_buf_map_info, describing the coherency and
> > >>>>>>>>> +      *     caching of a CPU mapping of the buffer.
> > >>>>>>>>> +      */
> > >>>>>>>>> +     __u32 param;
> > >>>>>>>>> +     __u32 pad;
> > >>>>>>>>> +
> > >>>>>>>>> +     /**
> > >>>>>>>>> +      * @value: Return value of the query.
> > >>>>>>>>> +      */
> > >>>>>>>>> +     __u64 value;
> > >>>>>>>>> +};
> > >>>>>>>>> +
> > >>>>>>>>>       #define DMA_BUF_BASE                'b'
> > >>>>>>>>>       #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> > >>>>>>>>>
> > >>>>>>>>> @@ -95,4 +161,6 @@ struct dma_buf_sync {
> > >>>>>>>>>       #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
> > >>>>>>>>>       #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
> > >>>>>>>>>
> > >>>>>>>>> +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_buf_info)
> > >>>>>>>>> +
> > >>>>>>>>>       #endif
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
