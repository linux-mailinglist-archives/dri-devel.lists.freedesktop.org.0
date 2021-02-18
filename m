Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3991031EB7C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 16:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345916EA2D;
	Thu, 18 Feb 2021 15:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559EB6EA2D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 15:30:49 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id g46so528815ooi.9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 07:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a3Bn9sx66twriDy5TSPYi7qgZxsDDPSnNmOXd/lCy0o=;
 b=JUgupJaz4CDFhhhTl0JwM60YGP1fn6xwBbemDzGplrO4lqGD9S7tdIy/T3Alyx+F5a
 6PRuLzsh4LtHdI9OV+ccpbRps/DrPspVB0ExjG9nFNGuIlRoawRuXkyE7W36falgA99x
 EISw+hXhd7MrDkQeWKoXm+jW1XFVi7nwGiPFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a3Bn9sx66twriDy5TSPYi7qgZxsDDPSnNmOXd/lCy0o=;
 b=qaWP9BIalZAfUQR0+mn/6Hh6/abfv5SSdhy12TLJF6DScC3ye05x/in2UD8m5aGNH7
 F0mOFhqtRW3IDNynv114aFMIh02gYziRY9ChqB0ZNi2NK6zyFVgkElZ9l5GjGgoOspGY
 v0pNOV1p3pI5IkOLNDKeByViw/2zQ+xHGo2vos/UKQBzawa6r5QsT3y7pIoGrZYv1K2v
 6G15fwIDuZXb3VaVb4OoD2weQu+Zb7DGyhiGuNJi+QdTHmLFpj/OJtZhCLgz4TnegwhC
 tCz9jZ9V0WMe2QqdaXvXg1+ecK6zlKDPEY0sXSBMpUS3Ll7cmYPFKNNfchBUJY+lRt1W
 QjjA==
X-Gm-Message-State: AOAM531ZqWouKPpK/sMqx83DUseAK1KDuo2/ilrSANxrmyWYyGC+4v/D
 SmLVEHZeDy0dYj1l/gono7c5k7SbsbhASreJpAgWUQ==
X-Google-Smtp-Source: ABdhPJxFg9SAEGhop6Y6d0z7uBxXlqUlF60nq+TIqj7ennTEUNJEyy56WBeZ9sgfLg7uNv8LAZUArBkvmKmsw3NVM5w=
X-Received: by 2002:a4a:e978:: with SMTP id i24mr3412484ooe.89.1613662248596; 
 Thu, 18 Feb 2021 07:30:48 -0800 (PST)
MIME-Version: 1.0
References: <20210217165910.3820374-1-nroberts@igalia.com>
 <7f80b184-7277-0f6c-1108-cf41189626df@arm.com>
In-Reply-To: <7f80b184-7277-0f6c-1108-cf41189626df@arm.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 18 Feb 2021 16:30:37 +0100
Message-ID: <CAKMK7uHPk1G-S6EMRZ8grZU8W6iij_DJR+V2eBGP+79Te6k76A@mail.gmail.com>
Subject: Re: [PATCH] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
To: Steven Price <steven.price@arm.com>
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
Cc: Neil Roberts <nroberts@igalia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 18, 2021 at 4:26 PM Steven Price <steven.price@arm.com> wrote:
>
> On 17/02/2021 16:59, Neil Roberts wrote:
> > When mmapping the shmem, it would previously adjust the pgoff in the
> > vm_area_struct to remove the fake offset that is added to be able to
> > identify the buffer. This patch removes the adjustment and makes the
> > fault handler use the vm_fault address to calculate the page offset
> > instead. Although using this address is apparently discouraged, several
> > DRM drivers seem to be doing it anyway.
> >
> > The problem with removing the pgoff is that it prevents
> > drm_vma_node_unmap from working because that searches the mapping tree
> > by address. That doesn't work because all of the mappings are at offset
> > 0. drm_vma_node_unmap is being used by the shmem helpers when purging
> > the buffer.
> >
> > It looks like panfrost is using drm_gem_shmem_purge so this might fix a
> > potential bug there.
> >
> > Signed-off-by: Neil Roberts <nroberts@igalia.com>
>
> As the test robot points out pgoff_t is unsigned, so the <0 test makes
> no sense. But apart from that it looks good to me.
>
> I think this is worth a "Fixes:" line too - as you point out
> drm_vma_node_unmap() won't be working correctly - which means we're
> potentially leaving user space with pages pointing to freed memory - not
> good! 17acb9f35ed7 is my best guess at the commit that introduced this.

Yeah plus Cc: stable for backporting and I think an igt or similar for
panfrost to check this works correctly would be pretty good too. Since
if it took us over 1 year to notice this bug it's pretty clear that
normal testing doesn't catch this. So very likely we'll break this
again.

btw for testing shrinkers recommended way is to have a debugfs file
that just force-shrinks everything. That way you avoid all the trouble
that tend to happen when you drive a system close to OOM on linux, and
it's also much faster.
-Daniel

> Steve
>
> > ---
> >   drivers/gpu/drm/drm_gem_shmem_helper.c | 12 +++++++-----
> >   1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > index 9825c378dfa6..4b14157f1962 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -526,11 +526,16 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
> >       struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> >       loff_t num_pages = obj->size >> PAGE_SHIFT;
> >       struct page *page;
> > +     pgoff_t page_offset;
> >
> > -     if (vmf->pgoff >= num_pages || WARN_ON_ONCE(!shmem->pages))
> > +     /* We don't use vmf->pgoff since that has the fake offset */
> > +     page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> > +
> > +     if (page_offset < 0 || page_offset >= num_pages ||
> > +         WARN_ON_ONCE(!shmem->pages))
> >               return VM_FAULT_SIGBUS;
> >
> > -     page = shmem->pages[vmf->pgoff];
> > +     page = shmem->pages[page_offset];
> >
> >       return vmf_insert_page(vma, vmf->address, page);
> >   }
> > @@ -581,9 +586,6 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> >       struct drm_gem_shmem_object *shmem;
> >       int ret;
> >
> > -     /* Remove the fake offset */
> > -     vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
> > -
> >       if (obj->import_attach) {
> >               /* Drop the reference drm_gem_mmap_obj() acquired.*/
> >               drm_gem_object_put(obj);
> >
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
