Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E272E3C2629
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 16:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A258966C;
	Fri,  9 Jul 2021 14:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5278966C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 14:43:42 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 o17-20020a9d76510000b02903eabfc221a9so9697618otl.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 07:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qXny3SFgD29qhWyMourICntAdqkx2VvDNSpQiEKe/nk=;
 b=WFdYkmHJ6RlJxBhxHEy30cT4ze8ksr/srX41N1TU2tN7WW9k9Rp5LiAjImYHKZWCgO
 K1DJZ+OYY3+ebZO/O8tTiNxX3uyA+FOAWklhPjwfDPHKxadOqYuASfmmL0j4+D6+uNw3
 kSw6MjJL26mdb2qOByhDizSsOtCIbXDx23SDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qXny3SFgD29qhWyMourICntAdqkx2VvDNSpQiEKe/nk=;
 b=ih3OTzE2TIQsp8OpevzejqNB11bxBrXyIzYOMRmWTtFwNLmITLwW9D9iNd0KKE+keX
 78kiae4+CZ+O+bEVLkMEpRIjrqj3bUhaodDYI27+6FreU+NJBvXHdi6LRNlyGJzm9AWv
 aAkjZN06ZpYpLw8am9/VyW2oXXV0X4cfwZOIwtzvjAqekgJShF9ahRymhxEtBBmizpDX
 sNUorbDmkIfhytifDnzIyJtun9fo6k8+1s/FuFp2MZZTz/uT4Zx7qgE3FC2fPBFYyNol
 16T2X8mwHqVOlvaIMsQnJEb+MOXhyXaPkfz5FCE9UQp+cuJv1WWDgDEGXUbyj0DNGnQM
 LAGA==
X-Gm-Message-State: AOAM533m0PsM77VpiFNpAly3T5VxrL4+lTClqJfDdNW41quir1b5bltc
 KRWI04Q8PvYNY5WycqKiotjNRmET4XKtzAbed9W7Jw==
X-Google-Smtp-Source: ABdhPJzWMEhvmSADRErSjdWxhtcfIO0hcqNWTe3sdWoyPT7ZwbOF6rJlDCKtqN2UkERR8oDP/0+kMs/hdEacmKUIM3A=
X-Received: by 2002:a05:6830:2366:: with SMTP id
 r6mr28580571oth.188.1625841822116; 
 Fri, 09 Jul 2021 07:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210709114731.31467-1-tzimmermann@suse.de>
In-Reply-To: <20210709114731.31467-1-tzimmermann@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 9 Jul 2021 16:43:31 +0200
Message-ID: <CAKMK7uGyQ5Z+o4LB8KvRgACvKDDL5Ymo3Wp6TRJ9+3kEnCi2RQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vgem: Restore mmap functionality
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Dave Airlie <airlied@linux.ie>, Qinglang Miao <miaoqinglang@huawei.com>,
 "Wilson, Chris" <chris@chris-wilson.co.uk>,
 Melissa Wen <melissa.srw@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 dri-devel <dri-devel@lists.freedesktop.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 9, 2021 at 1:47 PM Thomas Zimmermann <tzimmermann@suse.de> wrot=
e:
>
> Commit 375cca1cfeb5 ("drm/vgem: Implement mmap as GEM object function")
> accidentally removed the actual mmap functionality from vgem. Restore
> the original implementation and VMA flags.

Ah yes that explains things.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Fixes access to unmapped memory:
>
> [  106.591744] BUG: KASAN: vmalloc-out-of-bounds in do_fault+0x38/0x480
> [  106.598154] Read of size 8 at addr ffffffffc10c44a8 by task vgem_basic=
/1514
> [  106.605173]
> [  106.606678] CPU: 1 PID: 1514 Comm: vgem_basic Tainted: G            E =
    5.13.0-1-default+ #990
> [  106.615535] Hardware name: Dell Inc. OptiPlex 9020/0N4YC8, BIOS A24 10=
/24/2018
> [  106.622818] Call Trace:
> [  106.625289]  dump_stack+0xa5/0xdc
> [  106.628642]  print_address_description.constprop.0+0x18/0x100
> [  106.634439]  ? do_fault+0x38/0x480
> [  106.637872]  kasan_report.cold+0x7c/0xd8
> [  106.641834]  ? do_fault+0x38/0x480
> [  106.645274]  do_fault+0x38/0x480
> [  106.648535]  __handle_mm_fault+0x935/0xb00
> [  106.652676]  ? vm_iomap_memory+0xe0/0xe0
> [  106.656634]  ? __lock_release+0x12f/0x4e0
> [  106.660696]  ? count_memcg_event_mm.part.0+0xb9/0x190
> [  106.665799]  handle_mm_fault+0xd0/0x370
> [  106.669675]  do_user_addr_fault+0x2a0/0x8c0
> [  106.673908]  exc_page_fault+0x64/0xf0
> [  106.677604]  ? asm_exc_page_fault+0x8/0x30
> [  106.681739]  asm_exc_page_fault+0x1e/0x30
> [  106.685782] RIP: 0033:0x402e12
> ...
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 375cca1cfeb5 ("drm/vgem: Implement mmap as GEM object function")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/vgem/vgem_drv.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_=
drv.c
> index df634aa52638..f50fd10c4fad 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -364,8 +364,17 @@ static void vgem_prime_vunmap(struct drm_gem_object =
*obj, struct dma_buf_map *ma
>
>  static int vgem_prime_mmap(struct drm_gem_object *obj, struct vm_area_st=
ruct *vma)
>  {
> +       int ret;
> +
> +       if (!obj->filp)
> +               return -ENODEV;
> +
> +       ret =3D call_mmap(obj->filp, vma);
> +       if (ret)
> +               return ret;
> +
>         vma_set_file(vma, obj->filp);
> -       vma->vm_flags |=3D VM_DONTEXPAND | VM_DONTDUMP;
> +       vma->vm_flags |=3D VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUM=
P;
>         vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vma->v=
m_flags));
>         vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
>
> --
> 2.32.0
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
