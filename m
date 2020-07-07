Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778E62168B4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 11:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3E56E11D;
	Tue,  7 Jul 2020 09:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351106E13F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 09:00:08 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id w17so25926115otl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 02:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NNUZn332rCgkjganzrHKkiFv7KudV7k1M6LsdZjErP4=;
 b=aDMd2DVTrcN5Uw7TCrz237YqapP6BvvU/KVyvMJPAtK7LeVXRmT3cnX4xBVT4UFIPl
 Rq8LFYQ2MXpGjRfQI9Bbnx5EkB4+y/A7bZfk4E9ZJNb4keyTW5NG5uCfpr2cqFmisNSW
 b2lC/BSOdUWRiV8yQVhqtYxO2toU7i5g0Fsq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NNUZn332rCgkjganzrHKkiFv7KudV7k1M6LsdZjErP4=;
 b=HW4qYKLXRz7YqL/tnUPZGhYlxWm8qTlekD6DeHPcl676pu+X/4Clb37eb3NWV5vGBX
 gz5GfPLPGLMWl1pIUwhn1gO38yZCuFWPT4pKDqjcnstkRyZBLM+7pyuqjAtnUwsC8nVN
 X/N2d/iYQqpd99+IjBlNnHP7SNJ8IgrHXHLOiTGchLiozBuLTSC6H1DE6txn+xJoEvO2
 m9WY6PvprHv0Z+3ZeuIBuOeicGT01zV19W3ivsgjK/pLWs/BrUXtiD3QGlCILj8l6kn4
 XsDc/aLF95NwShQ01mi25aNX+72kQOVnYcJeZdAp2B6SG9IPAB3aKTYgzeVTNKrFaVZw
 L5QA==
X-Gm-Message-State: AOAM532dRv/OwmhvS5V6TGK7fS/RwtcpPlVyPAudZogc/d2moYFRIVr3
 EvMQUm0R70yze/wJo1T+uVP9kQ2mgN+ymCq9nOnVrQ==
X-Google-Smtp-Source: ABdhPJzQ05hH6K07diTtotWREKsl1zADVqYbhKoQdQeVJcFL4rB21rsn0gL7ImDbbd3Wj3wLdcy7Yvi2EMaS2MHkoaI=
X-Received: by 2002:a05:6830:1613:: with SMTP id
 g19mr31465766otr.303.1594112408104; 
 Tue, 07 Jul 2020 02:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200707042100.2550260-1-ytht.net@gmail.com>
In-Reply-To: <20200707042100.2550260-1-ytht.net@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 7 Jul 2020 10:59:56 +0200
Message-ID: <CAKMK7uHCPZwzh7_3KTm=JhjtYsUd3o7gKALTfSkBLiVt8Y=5bw@mail.gmail.com>
Subject: Re: [RFC] drm/vgem: Don't use get_page in fault handler.
To: Lepton Wu <ytht.net@gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 7, 2020 at 9:27 AM Lepton Wu <ytht.net@gmail.com> wrote:
>
> For pages which are allocated in ttm with transparent huge pages,
> tail pages have zero as reference count. The current vgem code use
> get_page on them and it will trigger BUG when release_pages get called
> on those pages later.
>
> Here I attach the minimal code to trigger this bug on a qemu VM which
> enables virtio gpu (card1) and vgem (card0). BTW, since the upstream
> virtio gpu has changed to use drm gem and moved away from ttm. So we
> have to use an old kernel like 5.4 to reproduce it. But I guess
> same thing could happen for a real GPU if the real GPU use similar code
> path to allocate pages from ttm. I am not sure about two things: first, do we
> need to fix this? will a real GPU hit this code path? Second, suppose this
> need to be fixed, should this be fixed in ttm side or vgem side?  If we remove
> "huge_flags &= ~__GFP_COMP" from ttm_get_pages, then get_page in vgem works
> fine. But it's there for fix another bug:
> https://bugs.freedesktop.org/show_bug.cgi?id=103138
> It could also be "fixed" with this patch. But I am really not sure if this is
> the way to go.

For imported dma-buf objects, vgem should not handle this itself, but
forward to the exporter through the dma_buf_mmap stuff. We have
helpers for this all now, probably just not wired up correctly. Trying
to ensure that all combinations of mmap code across all drivers work
the same doesn't work.

Caveat: I might not be understanding exactly what's going on here :-)
-Daniel

>
> Here is the code to reproduce this bug:
>
> unsigned int WIDTH = 1024;
> unsigned int HEIGHT = 513;
> unsigned int size = WIDTH * HEIGHT * 4;
>
> int work(int vfd, int dfd, int handle) {
>         int ret;
>         struct drm_prime_handle hf = {.handle =  handle };
>         ret = ioctl(dfd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &hf);
>         fprintf(stderr, "fd is %d\n", hf.fd);
>         hf.flags = DRM_CLOEXEC | DRM_RDWR;
>         ret = ioctl(vfd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &hf);
>         fprintf(stderr, "new handle is %d\n", hf.handle);
>         struct drm_mode_map_dumb map = {.handle = hf.handle };
>         ret = ioctl(vfd, DRM_IOCTL_MODE_MAP_DUMB, &map);
>         fprintf(stderr, "need map at offset %lld\n", map.offset);
>         unsigned char * ptr = mmap(NULL, size, PROT_READ|PROT_WRITE, MAP_SHARED, vfd,
>                           map.offset);
>         memset(ptr, 2, size);
>         munmap(ptr, size);
> }
>
> int main()
> {
>         int vfd = open("/dev/dri/card0", O_RDWR); // vgem
>         int dfd = open("/dev/dri/card1", O_RDWR); // virtio gpu
>
>         int ret;
>         struct drm_mode_create_dumb ct = {};
>
>         ct.height = HEIGHT;
>         ct.width = WIDTH;
>         ct.bpp = 32;
>         ret = ioctl(dfd, DRM_IOCTL_MODE_CREATE_DUMB, &ct);
>         work(vfd, dfd, ct.handle);
>         fprintf(stderr, "done\n");
> }
>
> Signed-off-by: Lepton Wu <ytht.net@gmail.com>
> ---
>  drivers/gpu/drm/vgem/vgem_drv.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index ec1a8ebb6f1b..be3d97e29804 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -87,9 +87,8 @@ static vm_fault_t vgem_gem_fault(struct vm_fault *vmf)
>
>         mutex_lock(&obj->pages_lock);
>         if (obj->pages) {
> -               get_page(obj->pages[page_offset]);
> -               vmf->page = obj->pages[page_offset];
> -               ret = 0;
> +               ret = vmf_insert_pfn(vmf->vma, vmf->address,
> +                                    page_to_pfn(obj->pages[page_offset]));
>         }
>         mutex_unlock(&obj->pages_lock);
>         if (ret) {
> @@ -263,7 +262,6 @@ static struct drm_ioctl_desc vgem_ioctls[] = {
>
>  static int vgem_mmap(struct file *filp, struct vm_area_struct *vma)
>  {
> -       unsigned long flags = vma->vm_flags;
>         int ret;
>
>         ret = drm_gem_mmap(filp, vma);
> @@ -273,7 +271,6 @@ static int vgem_mmap(struct file *filp, struct vm_area_struct *vma)
>         /* Keep the WC mmaping set by drm_gem_mmap() but our pages
>          * are ordinary and not special.
>          */
> -       vma->vm_flags = flags | VM_DONTEXPAND | VM_DONTDUMP;
>         return 0;
>  }
>
> --
> 2.27.0.212.ge8ba1cc988-goog
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
