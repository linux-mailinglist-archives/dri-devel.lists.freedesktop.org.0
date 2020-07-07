Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C8121683D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 10:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8526389D9A;
	Tue,  7 Jul 2020 08:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934CD89D9A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 08:22:18 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21736775-1500050 for multiple; Tue, 07 Jul 2020 09:22:15 +0100
MIME-Version: 1.0
In-Reply-To: <20200707042100.2550260-1-ytht.net@gmail.com>
References: <20200707042100.2550260-1-ytht.net@gmail.com>
Subject: Re: [RFC] drm/vgem: Don't use get_page in fault handler.
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Lepton Wu <ytht.net@gmail.com>, dri-devel@lists.freedesktop.org
Date: Tue, 07 Jul 2020 09:22:14 +0100
Message-ID: <159411013451.16814.2420494053920765965@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: christian.koenig@amd.com, Lepton Wu <ytht.net@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Lepton Wu (2020-07-07 05:21:00)
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

The danger here is that you store a pointer to a physical page in the
CPU page tables and never remove it should the vgem bo be unpinned and
the obj->pages[] released [and the physical pages returned to the system
for reuse].

So judicial adding of 
drm_vma_node_unmap(&bo->base.vma_node, bo->base.anon_inode->i_mapping);
drm_gem_put_pages, and also the kvfree in vgem_gem_free_object is
suspect (for not being a drm_gem_put_pages).
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
