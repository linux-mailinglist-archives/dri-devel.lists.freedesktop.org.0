Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FAA635691
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 10:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAA810E0F0;
	Wed, 23 Nov 2022 09:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6216010E536
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 09:34:10 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id e27so1293996ejc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 01:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eaoNQNPQh1D0M9ASOIATnCY2bDKOxaIZFdZSYeu2AVU=;
 b=RMt3JOxIQZ+xFx84pQltpGWI1aa+nHijLWYpM/9MD53KeuGh9anNrdvbMkILFssPxr
 2IGkvYiWoiVnbqC4YWeIB7pkomSW8Zpv79dOx7NSzp9pu6N18yQiih29xUZLqCaGldKu
 QZ2diXWp1IIJPK8cQ6O8cweW3/WDsoBxtmfj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eaoNQNPQh1D0M9ASOIATnCY2bDKOxaIZFdZSYeu2AVU=;
 b=7RHH+ls0ezvBKJcwQPgq1X6NPIzcgd6azG9JnmVOkFJqic6fGWad4XSV2HKOI2HPOF
 FcbeFBD31oYJ0Ji+wcI3ufj4amLMsBtyJReMIBvEdkxSafV0xYm5OOfyEsM9FXk83cHF
 1DuUERsXeczr9tTM/6Apf4hWvRoZFwpuZ9U7wV0RqqMgVUfKoJsFHQ9D6IwU9y2YoWE3
 ukwUYf5adDKfOPumA/c54zO7o3u49LBqg0EbwFEpSSqJc1U3B/XH+cY8qRqi914SWvqo
 IiKqX8sh6rnJwjtWmrsNl6GfmiQerNn2eXISdMTdy1h4qF7Vjme5acD9bxBFLGiJ7zZj
 qhmw==
X-Gm-Message-State: ANoB5plUtrp+NyySaY3LxXygBQlxCdA1bJ/Gl4vEEhbg/LC2w0uiiq1S
 CAdNR+WdpM9aC6bTpA1qfrNgA9/IZqT1H+C38m8VLg==
X-Google-Smtp-Source: AA0mqf5FwM2IuOqLfNqel4/ejeW7bYTnzXwCbpgfhL4aPEVMyPRFaHI3e6WRPKcn6SNyBGK84yQq/1c1DMMfY3IL7+E=
X-Received: by 2002:a17:906:1614:b0:78d:4e5b:ffaa with SMTP id
 m20-20020a170906161400b0078d4e5bffaamr6742960ejd.455.1669196048915; Wed, 23
 Nov 2022 01:34:08 -0800 (PST)
MIME-Version: 1.0
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
 <5c3c8d4f-2c06-9210-b00a-4d0ff6f6fbb7@suse.de>
In-Reply-To: <5c3c8d4f-2c06-9210-b00a-4d0ff6f6fbb7@suse.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 23 Nov 2022 10:33:57 +0100
Message-ID: <CAKMK7uGqQMs5q0h40q=E5JqTxw7qRjGT3GaTF0CJVU--B+pjRg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
To: Thomas Zimmermann <tzimmermann@suse.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Jason Gunthorpe <jgg@ziepe.ca>,
 John Stultz <john.stultz@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Nov 2022 at 09:07, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
>
> Hi
>
> Am 22.11.22 um 18:08 schrieb Daniel Vetter:
> > tldr; DMA buffers aren't normal memory, expecting that you can use
> > them like that (like calling get_user_pages works, or that they're
> > accounting like any other normal memory) cannot be guaranteed.
> >
> > Since some userspace only runs on integrated devices, where all
> > buffers are actually all resident system memory, there's a huge
> > temptation to assume that a struct page is always present and useable
> > like for any more pagecache backed mmap. This has the potential to
> > result in a uapi nightmare.
> >
> > To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
> > blocks get_user_pages and all the other struct page based
> > infrastructure for everyone. In spirit this is the uapi counterpart to
> > the kernel-internal CONFIG_DMABUF_DEBUG.
> >
> > Motivated by a recent patch which wanted to swich the system dma-buf
> > heap to vm_insert_page instead of vm_insert_pfn.
> >
> > v2:
> >
> > Jason brought up that we also want to guarantee that all ptes have the
> > pte_special flag set, to catch fast get_user_pages (on architectures
> > that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
> > still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.
> >
> >  From auditing the various functions to insert pfn pte entires
> > (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
> > dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
> > this should be the correct flag to check for.
> >
> > v3: Change to WARN_ON_ONCE (Thomas Zimmermann)
> >
> > References: https://lore.kernel.org/lkml/CAKMK7uHi+mG0z0HUmNt13QCCvutuR=
VjpcR0NjRL12k-WbWzkRg@mail.gmail.com/
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Matthew Wilcox <willy@infradead.org>
> > Cc: John Stultz <john.stultz@linaro.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > --
> > Ok I entirely forgot about this patch but stumbled over it and checked
> > what's up with it no. I think it's ready now for merging:
> > - shmem helper patches to fix up vgem landed
> > - ttm has been fixed since a while
> > - I don't think we've had any other open issues
> >
> > Time to lock down this uapi contract for real?
> > -Daniel
> > ---
> >   drivers/dma-buf/dma-buf.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index b6c36914e7c6..88718665c3c3 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -150,6 +150,8 @@ static int dma_buf_mmap_internal(struct file *file,=
 struct vm_area_struct *vma)
> >       ret =3D dmabuf->ops->mmap(dmabuf, vma);
> >       dma_resv_unlock(dmabuf->resv);
> >
> > +     WARN_ON_ONCE(!(vma->vm_flags & VM_PFNMAP));
>
> Well , I already a-b'ed this, but does it work with DMa helpers. I'm
> asking because of [1].
>
> Best regards
> Thomas
>
> [1]
> https://elixir.bootlin.com/linux/v6.1-rc6/source/drivers/gpu/drm/drm_gem_=
dma_helper.c#L533

This one is entertaining, but also doesn't matter, because the
remap_pfn_range that the various dma_mmap functions boil down to sets
the VM_PFNMAP and a pile of other flags. See

https://elixir.bootlin.com/linux/v6.1-rc6/source/mm/memory.c#L2518

I have no idea why Laurent cleared this flag here just so it gets
reset again a bit later when he added that code. Laurent?
-Daniel

> > +
> >       return ret;
> >   }
> >
> > @@ -1495,6 +1497,8 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct v=
m_area_struct *vma,
> >       ret =3D dmabuf->ops->mmap(dmabuf, vma);
> >       dma_resv_unlock(dmabuf->resv);
> >
> > +     WARN_ON_ONCE(!(vma->vm_flags & VM_PFNMAP));
> > +
> >       return ret;
> >   }
> >   EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
