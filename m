Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E373A4893
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 20:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A086F3BE;
	Fri, 11 Jun 2021 18:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5B3A66F3B3;
 Fri, 11 Jun 2021 18:23:17 +0000 (UTC)
Received: from [192.168.0.2] (unknown [188.167.68.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id F2EDD7A024A;
 Fri, 11 Jun 2021 20:23:13 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: nouveau broken on Riva TNT2 in 5.13.0-rc4: NULL pointer
 dereference in nouveau_bo_sync_for_device
Date: Fri, 11 Jun 2021 20:23:10 +0200
User-Agent: KMail/1.9.10
References: <202106052143.52488.linux@zary.sk>
 <d4e5042c-3981-02b0-4b9e-fa2c8e373be4@amd.com>
 <4b4248d8-b708-3832-7fe3-2a9fd2c2311e@amd.com>
In-Reply-To: <4b4248d8-b708-3832-7fe3-2a9fd2c2311e@amd.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <202106112023.11270.linux@zary.sk>
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

On Friday 11 June 2021 14:38:18 Christian K=C3=B6nig wrote:
>=20
> Am 10.06.21 um 19:59 schrieb Christian K=C3=B6nig:
> > Am 10.06.21 um 19:50 schrieb Ondrej Zary:
> >> [SNIP]
> >>> I can't see how this is called from the nouveau code, only=20
> >>> possibility I
> >>> see is that it is maybe called through the AGP code somehow.
> >> Yes, you're right:
> >> [=C2=A0=C2=A0 13.192663] Call Trace:
> >> [=C2=A0=C2=A0 13.192678]=C2=A0 dump_stack+0x54/0x68
> >> [=C2=A0=C2=A0 13.192690]=C2=A0 ttm_tt_init+0x11/0x8a [ttm]
> >> [=C2=A0=C2=A0 13.192699]=C2=A0 ttm_agp_tt_create+0x39/0x51 [ttm]
> >> [=C2=A0=C2=A0 13.192840]=C2=A0 nouveau_ttm_tt_create+0x17/0x22 [nouvea=
u]
> >> [=C2=A0=C2=A0 13.192856]=C2=A0 ttm_tt_create+0x78/0x8c [ttm]
> >> [=C2=A0=C2=A0 13.192864]=C2=A0 ttm_bo_handle_move_mem+0x7d/0xca [ttm]
> >> [=C2=A0=C2=A0 13.192873]=C2=A0 ttm_bo_validate+0x92/0xc8 [ttm]
> >> [=C2=A0=C2=A0 13.192883]=C2=A0 ttm_bo_init_reserved+0x216/0x243 [ttm]
> >> [=C2=A0=C2=A0 13.192892]=C2=A0 ttm_bo_init+0x45/0x65 [ttm]
> >> [=C2=A0=C2=A0 13.193018]=C2=A0 ? nouveau_bo_del_io_reserve_lru+0x48/0x=
48 [nouveau]
> >> [=C2=A0=C2=A0 13.193150]=C2=A0 nouveau_bo_init+0x8c/0x94 [nouveau]
> >> [=C2=A0=C2=A0 13.193273]=C2=A0 ? nouveau_bo_del_io_reserve_lru+0x48/0x=
48 [nouveau]
> >> [=C2=A0=C2=A0 13.193407]=C2=A0 nouveau_bo_new+0x44/0x57 [nouveau]
> >> [=C2=A0=C2=A0 13.193537]=C2=A0 nouveau_channel_prep+0xa3/0x269 [nouvea=
u]
> >> [=C2=A0=C2=A0 13.193665]=C2=A0 nouveau_channel_new+0x3c/0x5f7 [nouveau]
> >> [=C2=A0=C2=A0 13.193679]=C2=A0 ? slab_free_freelist_hook+0x3b/0xa7
> >> [=C2=A0=C2=A0 13.193686]=C2=A0 ? kfree+0x9e/0x11a
> >> [=C2=A0=C2=A0 13.193781]=C2=A0 ? nvif_object_sclass_put+0xd/0x16 [nouv=
eau]
> >> [=C2=A0=C2=A0 13.193908]=C2=A0 nouveau_drm_device_init+0x2e2/0x646 [no=
uveau]
> >> [=C2=A0=C2=A0 13.193924]=C2=A0 ? pci_enable_device_flags+0x1e/0xac
> >> [=C2=A0=C2=A0 13.194052]=C2=A0 nouveau_drm_probe+0xeb/0x188 [nouveau]
> >> [=C2=A0=C2=A0 13.194182]=C2=A0 ? nouveau_drm_device_init+0x646/0x646 [=
nouveau]
> >> [=C2=A0=C2=A0 13.194195]=C2=A0 pci_device_probe+0x89/0xe9
> >> [=C2=A0=C2=A0 13.194205]=C2=A0 really_probe+0x127/0x2a7
> >> [=C2=A0=C2=A0 13.194212]=C2=A0 driver_probe_device+0x5b/0x87
> >> [=C2=A0=C2=A0 13.194219]=C2=A0 device_driver_attach+0x2e/0x41
> >> [=C2=A0=C2=A0 13.194226]=C2=A0 __driver_attach+0x7c/0x83
> >> [=C2=A0=C2=A0 13.194232]=C2=A0 bus_for_each_dev+0x4c/0x66
> >> [=C2=A0=C2=A0 13.194238]=C2=A0 driver_attach+0x14/0x16
> >> [=C2=A0=C2=A0 13.194244]=C2=A0 ? device_driver_attach+0x41/0x41
> >> [=C2=A0=C2=A0 13.194251]=C2=A0 bus_add_driver+0xc5/0x16c
> >> [=C2=A0=C2=A0 13.194258]=C2=A0 driver_register+0x87/0xb9
> >> [=C2=A0=C2=A0 13.194265]=C2=A0 __pci_register_driver+0x38/0x3b
> >> [=C2=A0=C2=A0 13.194271]=C2=A0 ? 0xf0c0d000
> >> [=C2=A0=C2=A0 13.194362]=C2=A0 nouveau_drm_init+0x14c/0x1000 [nouveau]
> >>
> >> How is ttm_dma_tt->dma_address allocated?
> >
> > Mhm, I need to double check how AGP is supposed to work.
> >
> > Since barely anybody is using it these days it is something which=20
> > breaks from time to time.
>=20
> I have no idea how that ever worked in the first place since AGP isn't=20
> supposed to sync between CPU/GPU. Everything is coherent for that case.
>=20
> Anyway here is a patch which adds a check to those functions if the=20
> dma_address array is allocated in the first place. Please test it.

Thanks, the patch fixes the problem and nouveau now works!
Should be applied to 5.12-stable too (5.11 is affected too but EOL).

It's weird that it worked before.
Looks like dma_address was used uninitialized - it contained some random
crap:
[   12.293304] nouveau_bo_sync_for_device: ttm_dma->dma_address=3D3e055971 =
ttm_dma->ttm.num_pages=3D18
[   12.293321] ttm_dma->dma_address[0]=3D0x0
[   12.293341] ttm_dma->dma_address[1]=3D0x0
[   12.293360] ttm_dma->dma_address[2]=3D0xee728980
[   12.293379] ttm_dma->dma_address[3]=3D0xed1cb120
[   12.293397] ttm_dma->dma_address[4]=3D0x12
[   12.293416] ttm_dma->dma_address[5]=3D0x0
[   12.293434] ttm_dma->dma_address[6]=3D0x1
[   12.293453] ttm_dma->dma_address[7]=3D0x0
[   12.293471] ttm_dma->dma_address[8]=3D0x10000
[   12.293490] ttm_dma->dma_address[9]=3D0x0
[   12.293510] ttm_dma->dma_address[10]=3D0x101
[   12.293528] ttm_dma->dma_address[11]=3D0xee7289ec
[   12.293546] ttm_dma->dma_address[12]=3D0xee7289ec
[   12.293564] ttm_dma->dma_address[13]=3D0x0
[   12.293581] ttm_dma->dma_address[14]=3D0x0
[   12.293599] ttm_dma->dma_address[15]=3D0x0
[   12.293616] ttm_dma->dma_address[16]=3D0x0
[   12.293634] ttm_dma->dma_address[17]=3D0x0
But it did not matter as dma_sync_single_for_device is a no-op here.
When dma_address is properly initialized to NULL, it crashes...

> Thanks,
> Christian.
>=20
> >
> > Thanks for the backtrace,
> > Christian.
> >
> >> =C2=A0 I cannot find any assignment
> >> executed (in the working code):
> >>
> >> $ git grep dma_address\ =3D drivers/gpu/
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:=20
> >> sg->sgl->dma_address =3D addr;
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: dma_address =3D=20
> >> &dma->dma_address[offset >> PAGE_SHIFT];
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: dma_address =3D=20
> >> (mm_node->start << PAGE_SHIFT) + offset;
> >> drivers/gpu/drm/i915/gvt/scheduler.c:=C2=A0=C2=A0 sg->dma_address =3D =
addr;
> >> drivers/gpu/drm/i915/i915_gpu_error.c:=C2=A0 sg->dma_address =3D it;
> >> drivers/gpu/drm/ttm/ttm_tt.c:=C2=A0=C2=A0 ttm->dma_address =3D (void *=
)=20
> >> (ttm->ttm.pages + ttm->ttm.num_pages);
> >> drivers/gpu/drm/ttm/ttm_tt.c:=C2=A0=C2=A0 ttm->dma_address =3D=20
> >> kvmalloc_array(ttm->ttm.num_pages,
> >> drivers/gpu/drm/ttm/ttm_tt.c:=C2=A0=C2=A0 ttm_dma->dma_address =3D NUL=
L;
> >> drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c: viter->dma_address =3D=20
> >> &__vmw_piter_phys_addr;
> >> drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c: viter->dma_address =3D=20
> >> &__vmw_piter_dma_addr;
> >> drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c: viter->dma_address =3D=20
> >> &__vmw_piter_sg_addr;
> >>
> >> The 2 cases in ttm_tt.c are in ttm_dma_tt_alloc_page_directory() and
> >> ttm_sg_tt_alloc_page_directory().
> >> Confirmed by adding printk()s that they're NOT called.
> >>
> >>
> >
>=20
>=20


=2D-=20
Ondrej Zary
