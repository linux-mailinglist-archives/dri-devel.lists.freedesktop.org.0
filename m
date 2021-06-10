Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB56F3A3274
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 19:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC6B6E4DE;
	Thu, 10 Jun 2021 17:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D4896E4D7;
 Thu, 10 Jun 2021 17:50:34 +0000 (UTC)
Received: from [192.168.0.2] (188-167-68-178.dynamic.chello.sk
 [188.167.68.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id D668C7A024A;
 Thu, 10 Jun 2021 19:50:32 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: nouveau broken on Riva TNT2 in 5.13.0-rc4: NULL pointer
 dereference in nouveau_bo_sync_for_device
Date: Thu, 10 Jun 2021 19:50:28 +0200
User-Agent: KMail/1.9.10
References: <202106052143.52488.linux@zary.sk>
 <202106092200.08088.linux@zary.sk>
 <081b7908-9a1c-fef1-2b82-4b794f612c9b@amd.com>
In-Reply-To: <081b7908-9a1c-fef1-2b82-4b794f612c9b@amd.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <202106101950.28723.linux@zary.sk>
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday 10 June 2021 08:43:06 Christian K=C3=B6nig wrote:
>=20
> Am 09.06.21 um 22:00 schrieb Ondrej Zary:
> > On Wednesday 09 June 2021 11:21:05 Christian K=C3=B6nig wrote:
> >> Am 09.06.21 um 09:10 schrieb Ondrej Zary:
> >>> On Wednesday 09 June 2021, Christian K=C3=B6nig wrote:
> >>>> Am 09.06.21 um 08:57 schrieb Ondrej Zary:
> >>>>> [SNIP]
> >>>>>> Thanks for the heads up. So the problem with my patch is already f=
ixed,
> >>>>>> isn't it?
> >>>>> The NULL pointer dereference in nouveau_bo_wr16 introduced in
> >>>>> 141b15e59175aa174ca1f7596188bd15a7ca17ba was fixed by
> >>>>> aea656b0d05ec5b8ed5beb2f94c4dd42ea834e9d.
> >>>>>
> >>>>> That's the bug I hit when bisecting the original problem:
> >>>>> NULL pointer dereference in nouveau_bo_sync_for_device
> >>>>> It's caused by:
> >>>>> # first bad commit: [e34b8feeaa4b65725b25f49c9b08a0f8707e8e86] drm/=
ttm: merge ttm_dma_tt back into ttm_tt
> >>>> Good that I've asked :)
> >>>>
> >>>> Ok that's a bit strange. e34b8feeaa4b65725b25f49c9b08a0f8707e8e86 was
> >>>> created mostly automated.
> >>>>
> >>>> Do you have the original backtrace of that NULL pointer deref once m=
ore?
> >>> The original backtrace is here: https://nam11.safelinks.protection.ou=
tlook.com/?url=3Dhttps%3A%2F%2Flkml.org%2Flkml%2F2021%2F6%2F5%2F350&amp;dat=
a=3D04%7C01%7Cchristian.koenig%40amd.com%7C4309ff021d5e4cbe948b08d92b813106=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637588657045383056%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C3000&amp;sdata=3Dt70c9ktzPJzDaEAcO4wpQMv3TUo5b53cUy66AkLeVwE%3D&amp=
;reserved=3D0
> >> And the problem is that ttm_dma->dma_address is NULL, right? Mhm, I
> >> don't see how that can happen since nouveau is using ttm_sg_tt_init().
> >>
> >> Apart from that what nouveau does here is rather questionable since you
> >> need a coherent architecture for most things anyway, but that's not wh=
at
> >> we are trying to fix here.
> >>
> >> Can you try to narrow down if ttm_sg_tt_init is called before calling
> >> this function for the tt object in question?
> > ttm_sg_tt_init is not called:
> > [   12.150124] nouveau 0000:01:00.0: DRM: VRAM: 31 MiB
> > [   12.150133] nouveau 0000:01:00.0: DRM: GART: 128 MiB
> > [   12.150143] nouveau 0000:01:00.0: DRM: BMP version 5.6
> > [   12.150151] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
> > [   12.151362] ttm_tt_init
> > [   12.151370] ttm_tt_init_fields
> > [   12.151374] ttm_tt_alloc_page_directory
> > [   12.151615] BUG: kernel NULL pointer dereference, address: 00000000
>=20
> Please add dump_stack(); to ttm_tt_init() and report back with the=20
> backtrace.
>=20
> I can't see how this is called from the nouveau code, only possibility I=
=20
> see is that it is maybe called through the AGP code somehow.

Yes, you're right:
[   13.192663] Call Trace:
[   13.192678]  dump_stack+0x54/0x68
[   13.192690]  ttm_tt_init+0x11/0x8a [ttm]
[   13.192699]  ttm_agp_tt_create+0x39/0x51 [ttm]
[   13.192840]  nouveau_ttm_tt_create+0x17/0x22 [nouveau]
[   13.192856]  ttm_tt_create+0x78/0x8c [ttm]
[   13.192864]  ttm_bo_handle_move_mem+0x7d/0xca [ttm]
[   13.192873]  ttm_bo_validate+0x92/0xc8 [ttm]
[   13.192883]  ttm_bo_init_reserved+0x216/0x243 [ttm]
[   13.192892]  ttm_bo_init+0x45/0x65 [ttm]
[   13.193018]  ? nouveau_bo_del_io_reserve_lru+0x48/0x48 [nouveau]
[   13.193150]  nouveau_bo_init+0x8c/0x94 [nouveau]
[   13.193273]  ? nouveau_bo_del_io_reserve_lru+0x48/0x48 [nouveau]
[   13.193407]  nouveau_bo_new+0x44/0x57 [nouveau]
[   13.193537]  nouveau_channel_prep+0xa3/0x269 [nouveau]
[   13.193665]  nouveau_channel_new+0x3c/0x5f7 [nouveau]
[   13.193679]  ? slab_free_freelist_hook+0x3b/0xa7
[   13.193686]  ? kfree+0x9e/0x11a
[   13.193781]  ? nvif_object_sclass_put+0xd/0x16 [nouveau]
[   13.193908]  nouveau_drm_device_init+0x2e2/0x646 [nouveau]
[   13.193924]  ? pci_enable_device_flags+0x1e/0xac
[   13.194052]  nouveau_drm_probe+0xeb/0x188 [nouveau]
[   13.194182]  ? nouveau_drm_device_init+0x646/0x646 [nouveau]
[   13.194195]  pci_device_probe+0x89/0xe9
[   13.194205]  really_probe+0x127/0x2a7
[   13.194212]  driver_probe_device+0x5b/0x87
[   13.194219]  device_driver_attach+0x2e/0x41
[   13.194226]  __driver_attach+0x7c/0x83
[   13.194232]  bus_for_each_dev+0x4c/0x66
[   13.194238]  driver_attach+0x14/0x16
[   13.194244]  ? device_driver_attach+0x41/0x41
[   13.194251]  bus_add_driver+0xc5/0x16c
[   13.194258]  driver_register+0x87/0xb9
[   13.194265]  __pci_register_driver+0x38/0x3b
[   13.194271]  ? 0xf0c0d000
[   13.194362]  nouveau_drm_init+0x14c/0x1000 [nouveau]

How is ttm_dma_tt->dma_address allocated? I cannot find any assignment
executed (in the working code):

$ git grep dma_address\ =3D drivers/gpu/
drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:       sg->sgl->dma_addres=
s =3D addr;
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:                dma_address =3D &dm=
a->dma_address[offset >> PAGE_SHIFT];
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:                dma_address =3D (mm=
_node->start << PAGE_SHIFT) + offset;
drivers/gpu/drm/i915/gvt/scheduler.c:   sg->dma_address =3D addr;
drivers/gpu/drm/i915/i915_gpu_error.c:  sg->dma_address =3D it;
drivers/gpu/drm/ttm/ttm_tt.c:   ttm->dma_address =3D (void *) (ttm->ttm.pag=
es + ttm->ttm.num_pages);
drivers/gpu/drm/ttm/ttm_tt.c:   ttm->dma_address =3D kvmalloc_array(ttm->tt=
m.num_pages,
drivers/gpu/drm/ttm/ttm_tt.c:   ttm_dma->dma_address =3D NULL;
drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c:             viter->dma_address =
=3D &__vmw_piter_phys_addr;
drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c:             viter->dma_address =
=3D &__vmw_piter_dma_addr;
drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c:             viter->dma_address =
=3D &__vmw_piter_sg_addr;

The 2 cases in ttm_tt.c are in ttm_dma_tt_alloc_page_directory() and
ttm_sg_tt_alloc_page_directory().
Confirmed by adding printk()s that they're NOT called.


=2D-=20
Ondrej Zary
