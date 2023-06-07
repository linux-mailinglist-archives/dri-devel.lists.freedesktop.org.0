Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F50772658C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 18:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D80310E18D;
	Wed,  7 Jun 2023 16:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5FB10E0C7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 16:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1686154371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lt2PAuX6ogLwweJHt0XpKOi0qBHu6KFBJkJ9eCDXBLc=;
 b=LRRsWNiO0V+uLTymFpCVIfdXW1dHJcxO/PLiMUXHDNXEySnnKwh/ZAVPqvaKYtAUPOOyxr
 pXiIOIh2bfvSOpTMIuenDBwHikYdl7gCjV7uBlipLrGytp5ZVHEmjLpf5u8WmeId2dTUwl
 BS+btEk60KtkaQ1/oyrfDwqiSddV+Lg=
Message-ID: <2dd4c870a5605a79105fb621c97a5f59a18c8c24.camel@crapouillou.net>
Subject: Re: [PATCH] drm: gem: add an option for supporting the dma-coherent
 hardware.
From: Paul Cercueil <paul@crapouillou.net>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>
Date: Wed, 07 Jun 2023 18:12:48 +0200
In-Reply-To: <d5494751-0af0-42f6-bcad-f75415e4a6bd@loongson.cn>
References: <20230607053053.345101-1-suijingfeng@loongson.cn>
 <d4378aad1cf179d308068ef6072c5c7ff2bf2502.camel@crapouillou.net>
 <6db23d14-652e-4b13-24cb-bfb92fa3faed@loongson.cn>
 <e9714a0c29b1c4268081827571ad2545b0e6d5ec.camel@crapouillou.net>
 <d5494751-0af0-42f6-bcad-f75415e4a6bd@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: linux-renesas-soc@vger.kernel.org, loongson-kernel@lists.loongnix.cn,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

Le mercredi 07 juin 2023 =C3=A0 22:38 +0800, Sui Jingfeng a =C3=A9crit=C2=
=A0:
> Hi,=C2=A0 welcome to discussion.
>=20
>=20
> I have limited skills in manipulating English.
>=20
> It may not express what I'm really means in the short time.
>=20
> Part of word in the sentence may not as accurate as your.
>=20
> Well, please don't misunderstand, I'm not doing the rude to you.

No problem.

>=20
> I will explain it with more details.
>=20
> See below:
>=20
>=20
> On 2023/6/7 20:09, Paul Cercueil wrote:
> > Hi Sui,
> >=20
> > Le mercredi 07 juin 2023 =C3=A0 18:30 +0800, Sui Jingfeng a =C3=A9crit=
=C2=A0:
> > > Hi,
> > >=20
> > >=20
> > > On 2023/6/7 17:36, Paul Cercueil wrote:
> > > > Hi Sui,
> > > >=20
> > > > Le mercredi 07 juin 2023 =C3=A0 13:30 +0800, Sui Jingfeng a =C3=A9c=
rit=C2=A0:
> > > > > The single map_noncoherent member of struct
> > > > > drm_gem_dma_object
> > > > > may
> > > > > not
> > > > > sufficient for describing the backing memory of the GEM
> > > > > buffer
> > > > > object.
> > > > >=20
> > > > > Especially on dma-coherent systems, the backing memory is
> > > > > both
> > > > > cached
> > > > > coherent for multi-core CPUs and dma-coherent for peripheral
> > > > > device.
> > > > > Say architectures like X86-64, LoongArch64, Loongson Mips64,
> > > > > etc.
> > > > >=20
> > > > > Whether a peripheral device is dma-coherent or not can be
> > > > > implementation-dependent. The single map_noncoherent option
> > > > > is
> > > > > not
> > > > > enough
> > > > > to reflect real hardware anymore. For example, the Loongson
> > > > > LS3A4000
> > > > > CPU
> > > > > and LS2K2000/LS2K1000 SoC, peripheral device of such hardware
> > > > > platform
> > > > > allways snoop CPU's cache. Doing the allocation with
> > > > > dma_alloc_coherent
> > > > > function is preferred. The return buffer is cached, it should
> > > > > not
> > > > > using
> > > > > the default write-combine mapping. While with the current
> > > > > implement,
> > > > > there
> > > > > no way to tell the drm core to reflect this.
> > > > >=20
> > > > > This patch adds cached and coherent members to struct
> > > > > drm_gem_dma_object.
> > > > > which allow driver implements to inform the core. Introducing
> > > > > new
> > > > > mappings
> > > > > while keeping the original default behavior unchanged.
> > > > Did you try to simply set the "dma-coherent" property to the
> > > > device's
> > > > node?
> > > But this approach can only be applied for the device driver with
> > > DT
> > > support.
> > >=20
> > > X86-64, Loongson ls3a4000 mips64, Loongson ls3a5000 CPU typically
> > > do
> > > not
> > > have DT support.
> > >=20
> > > They using ACPI to pass parameter from the firmware to Linux
> > > kernel.
> > >=20
> > > You approach will lost the effectiveness on such a case.
> > Well, I don't really know how ACPI handles it - but it should just
> > be a
> > matter of setting dev->dma_coherent. That's basically what the DT
> > code
> > does.
> >=20
> > Some MIPS boards set it in their setup code for instance.
> >=20
> This is a *strategy*, not a *mechanism*.
>=20
> In this case, DT is just used to describing the hardware.
>=20
> (It is actually a hardware feature describing language, the
> granularity=20
> is large)
>=20
> It does not changing the state of the hardware.
>=20
> It's your platform firmware or kernel setting up code who actually do
> such a things.
>=20
>=20
> It's just that it works on *one* platform, it does not guarantee it
> will=20
> works on others.

If you add the "dma-coherent" property in a device node in DT, you
effectively specify that the device is DMA-coherent; so you describe
the hardware, which is what DT is for, and you are not changing the
state of the hardware.

Note that some MIPS platforms (arch/mips/alchemy/common/setup.c)
default to DMA-coherent mapping; I believe you could do something
similar with your Loongson LS3A4000 CPU and LS2K2000/LS2K1000 SoC.


> While my patch is trying to create a *mechanism* which could probably
>=20
> works on all platform.
>=20
>=20
> It is based the patch you have already commuted.
>=20
> Thanks for your excellent contribution.
>=20
>=20
> > > > =C2=A0=C2=A0From what I understand if you add that property then Li=
nux
> > > > will
> > > > use DMA
> > > > coherent memory even though you use dma_alloc_noncoherent() and
> > > > the
> > > > sync_single_for_cpu() / sync_single_for_device() are then NOPs.
> > > Please do not mitigate the problems with confusing method.
> > >=20
> > >=20
> > > This approach not only tend to generate confusion but also
> > > implement-dependent
> > >=20
> > > and arch-dependent. It's definitely problematic.
> > >=20
> > >=20
> > > How does the dma_alloc_coherent/dma_alloc_noncoherent is a ARCH
> > > specific
> > > thing.
> > >=20
> > > Dependent on how does the arch_dma_ops is implemented.
> > >=20
> > >=20
> > > The definition of the coherent on different ARCH has different
> > > meanings.
> > >=20
> > > The definition of the wirte-combine on different ARCH has
> > > different
> > > meanings.
> > >=20
> > >=20
> > > The wirte-combine(uncache acceleration) on mips is non dma-
> > > coherent.
> > It is dma-coherent on Ingenic SoCs.
> >=20
> >=20
> It is dma-coherent ? How does it achieve it?
>=20
>=20
> As far as I know,=C2=A0 there is a write buffer within the mips cpu.
>=20
> typically 64 byte,=C2=A0 but it is not cache. It will gather the CPU writ=
e
> access,
>=20
> When a peripheral device do the DMA, how does you platform guarantee
>=20
> the data in the CPU write buffer has been already arrived at (or
> flushed=20
> out to)
>=20
> the system RAM?
>=20
>=20
> Does the=C2=A0 peripheral device snoop the CPU's write buffer,
>=20
> or it need manually flush the write buffer with SYNC instruction?

I believe the DMA flushes the write buffer? I don't actually know the
details, it would be something to ask to Ingenic.

>=20
> > > But on arm, It seem that wirte-combine is coherent. (guaranteed
> > > by
> > > arch
> > > implement).
> > >=20
> > >=20
> > > I also heard using dma_alloc_coherent=C2=A0 to allocation the buffer
> > > for
> > > the
> > > non-coherent doesn't hurt, but the reverse is not true.
> > >=20
> > >=20
> > > But please do not create confusion.
> > >=20
> > > software composite is faster because better cacheusing rate and
> > >=20
> > > cache is faster to read.
> > >=20
> > > It is faster because it is cached, not because it is non-
> > > coherent.
> > >=20
> > > non-coherent is arch thing and/or driver-side thing,
> > >=20
> > > it is a side effect of=C2=A0 using the cached mapping.
> > Yes, I know that.
> >=20
> > >=20
> > > It should left to driver to handle such a side effect. The device
> > > driver
> > >=20
> > > know their device, so its the device driver's responsibility to
> > > maintain
> > > the coherency.=C2=A0 On loongson platform, we don't need to call
> > > drm_fb_dma_sync_non_coherent() function, Its already guaranteed
> > > by
> > > hardware.
> > I understand. What I'm saying, is that you should be able to set
> > dma_obj->map_noncoherent (which would arguably be better named
> > "map_cached",
>=20
> My point is that the word *cached* reflect the nature,
>=20
> dma-coherent or dma-noncoherent is secondary.
>=20
> We are all on the way to pursue the performance.
>=20
> In the end, it is the cache give us the speed.
>=20
>=20
> Why not we credit the cache hardware inside of the CPU?

dma_alloc_noncoherent() gives you *cached* memory.

Therefore, if you want *cached* memory, you should set
gem->map_noncoherent.

I understand your confusion; it would be easier to understand if this
function was called dma_alloc_cached().

Then, if the memory is actually DMA-coherent for the device (dev-
>dma_coherent =3D=3D true), the drm_fb_dma_sync_non_coherent() function is
a no-op.

But in both cases (DMA-coherent device, non DMA-coherent device), if
you want cached buffers, you should call dma_alloc_noncoherent().


> > but that's a different problem). Then the GEM code would
> > end up calling dma_alloc_noncoherent(), which will give you
> > *cached*
> > memory. Then as long as dev->dma_coherent =3D true,
> > drm_fb_dma_sync_non_coherent() should be a NOP - so you wouldn't
> > pointlessly sync/invalidate the caches.
> >=20
> > And I disagree with you, the driver shouldn't handle such things.
>=20
> You already handle the side effect of such things, See below:
>=20
>=20
> ```
>=20
> =C2=A0=C2=A0=C2=A0 if (ingenic_drm_map_noncoherent(ipu->master))
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 drm_fb_dma_sync_non_coherent(=
ipu->drm, oldstate, newstate);
>=20
> ```
>=20
> By the way,=C2=A0 Ingenic is the only driver in the drivers/gpu/drm/ that=
=20
> handle such things
>=20
> so far.

Yes; and now I think that this was a bad idea (for the reasons Maxime
listed in his email).

>=20
> > =C2=A0 The
> > fact that it is better to use cached memory or uncached with write-
> > combine really is platform-specific and not something that the
> > driver
> > should be aware of.
>=20
> But the fact is that,=C2=A0 It is drm/ingenic tell the drm core,=C2=A0 so=
me SoC
> is=20
> prefer cached,
>=20
> but unable to enforce the coherent. So that it need=C2=A0 flush the cache=
=20
> manually.
>=20
> What do you meant by saying that the driver should not be aware of ?

Ideally, the driver should just call a function "dma_alloc_buffer",
which would return cached memory when it makes sense, otherwise a
uncached buffer with the write-combine attribute.

Then the arch code (or DT) can decide what's the best setting, and not
the driver.

In the meantime, you should use gem->dma_noncoherent like the ingenic-
drm driver does - until somebody (probably me) refactor things.

Cheers,
-Paul

>=20
> > Cheers,
> > -Paul
> >=20
> > >=20
> > > > Cheers,
> > > > -Paul
> > > >=20
> > > > > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > > > > ---
> > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/drm_fb_dma_helper.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++------
> > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/drm_fbdev_dma.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/drm_gem_dma_helper.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 20
> > > > > ++++++++++++++++----
> > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/ingenic/ingenic-drm-drv.c |=C2=
=A0 5 ++++-
> > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/rcar-du/Kconfig=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/rcar-du/rcar_du_kms.c=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 +++-
> > > > > =C2=A0=C2=A0=C2=A0include/drm/drm_gem_dma_helper.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++--
> > > > > =C2=A0=C2=A0=C2=A07 files changed, 34 insertions(+), 17 deletions=
(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c
> > > > > b/drivers/gpu/drm/drm_fb_dma_helper.c
> > > > > index 3b535ad1b07c..93ff05041192 100644
> > > > > --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> > > > > +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> > > > > @@ -106,16 +106,15 @@ dma_addr_t
> > > > > drm_fb_dma_get_gem_addr(struct
> > > > > drm_framebuffer *fb,
> > > > > =C2=A0=C2=A0=C2=A0EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0/**
> > > > > - * drm_fb_dma_sync_non_coherent - Sync GEM object to non-
> > > > > coherent
> > > > > backing
> > > > > - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memory
> > > > > + * drm_fb_dma_sync_non_coherent - Sync GEM object to cached
> > > > > backing
> > > > > memory
> > > > > =C2=A0=C2=A0=C2=A0 * @drm: DRM device
> > > > > =C2=A0=C2=A0=C2=A0 * @old_state: Old plane state
> > > > > =C2=A0=C2=A0=C2=A0 * @state: New plane state
> > > > > =C2=A0=C2=A0=C2=A0 *
> > > > > =C2=A0=C2=A0=C2=A0 * This function can be used by drivers that us=
e damage
> > > > > clips
> > > > > and
> > > > > have
> > > > > - * DMA GEM objects backed by non-coherent memory. Calling
> > > > > this
> > > > > function
> > > > > - * in a plane's .atomic_update ensures that all the data in
> > > > > the
> > > > > backing
> > > > > - * memory have been written to RAM.
> > > > > + * DMA GEM objects backed by cached memory. Calling this
> > > > > function in
> > > > > a
> > > > > + * plane's .atomic_update ensures that all the data in the
> > > > > backing
> > > > > memory
> > > > > + * have been written to RAM.
> > > > > =C2=A0=C2=A0=C2=A0 */
> > > > > =C2=A0=C2=A0=C2=A0void drm_fb_dma_sync_non_coherent(struct drm_de=
vice *drm,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct drm_plane_state
> > > > > *old_state,
> > > > > @@ -131,7 +130,7 @@ void drm_fb_dma_sync_non_coherent(struct
> > > > > drm_device *drm,
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (=
i =3D 0; i < finfo->num_planes; i++) {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_obj =3D drm_fb_dma_get_gem=
_obj(state->fb,
> > > > > i);
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!dma_obj->map_noncoherent)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dma_obj->cached && dma_obj->coherent)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0continue;
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0daddr =3D drm_fb_dma_get_gem_a=
ddr(state->fb,
> > > > > state, i);
> > > > > diff --git a/drivers/gpu/drm/drm_fbdev_dma.c
> > > > > b/drivers/gpu/drm/drm_fbdev_dma.c
> > > > > index d86773fa8ab0..49fe9b284cc8 100644
> > > > > --- a/drivers/gpu/drm/drm_fbdev_dma.c
> > > > > +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> > > > > @@ -131,7 +131,7 @@ static int
> > > > > drm_fbdev_dma_helper_fb_probe(struct
> > > > > drm_fb_helper *fb_helper,
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* sc=
reen */
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0info-=
>flags |=3D FBINFO_VIRTFB; /* system memory */
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dma_obj->map_nonco=
herent)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dma_obj->cached)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0info->flags |=3D FBINFO_READS_=
FAST; /* signal
> > > > > caching
> > > > > */
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0info-=
>screen_size =3D sizes->surface_height * fb-
> > > > > > pitches[0];
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0info-=
>screen_buffer =3D map.vaddr;
> > > > > diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c
> > > > > b/drivers/gpu/drm/drm_gem_dma_helper.c
> > > > > index 870b90b78bc4..dec1d512bdf1 100644
> > > > > --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> > > > > +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> > > > > @@ -93,7 +93,11 @@ __drm_gem_dma_create(struct drm_device
> > > > > *drm,
> > > > > size_t size, bool private)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gem_private_object_init(dr=
m, gem_obj,
> > > > > size);
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Always use writecombine for=
 dma-buf
> > > > > mappings
> > > > > */
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_obj->map_noncoherent =3D false;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0/* FIXME: This is not always true, on some
> > > > > dma
> > > > > coherent system,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * cached mappings should be preferred over
> > > > > writecombine
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_obj->cached =3D false;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_obj->coherent =3D false;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} els=
e {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D drm_gem_object_init(dr=
m, gem_obj,
> > > > > size);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > > > @@ -143,7 +147,11 @@ struct drm_gem_dma_object
> > > > > *drm_gem_dma_create(struct drm_device *drm,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (I=
S_ERR(dma_obj))
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return dma_obj;
> > > > > =C2=A0=C2=A0=20
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dma_obj->map_nonco=
herent) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dma_obj->cached &&=
 dma_obj->coherent) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_obj->vaddr =3D dma_alloc_coherent(drm->dev,
> > > > > size,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 &dma_obj-
> > > > > > dma_addr,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
> > > > > GFP_KERNEL |
> > > > > __GFP_NOWARN);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else if (dma_obj->ca=
ched && !dma_obj->coherent) {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_obj->vaddr =3D dma_alloc_n=
oncoherent(drm-
> > > > > >dev,
> > > > > size,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > &dma_obj-
> > > > > > dma_addr,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > DMA_TO_DEVICE,
> > > > > @@ -153,6 +161,7 @@ struct drm_gem_dma_object
> > > > > *drm_gem_dma_create(struct drm_device *drm,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dma_=
obj-
> > > > > > dma_addr,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_K=
ERNEL |
> > > > > __GFP_NOWARN);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!=
dma_obj->vaddr) {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_dbg(drm, "failed to alloca=
te buffer
> > > > > with
> > > > > size
> > > > > %zu\n",
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 size);
> > > > > @@ -233,7 +242,10 @@ void drm_gem_dma_free(struct
> > > > > drm_gem_dma_object
> > > > > *dma_obj)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0dma_buf_vunmap_unlocked(gem_obj-
> > > > > > import_attach->dmabuf, &map);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_prime_gem_destroy(gem_obj,=
 dma_obj-
> > > > > >sgt);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} els=
e if (dma_obj->vaddr) {
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dma_obj->map_noncoherent)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dma_obj->cached && dma_obj->coherent)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
dma_free_coherent(gem_obj->dev->dev,
> > > > > dma_obj-
> > > > > > base.size,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_obj->vaddr,
> > > > > dma_obj-
> > > > > > dma_addr);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0else if (dma_obj->cached && !dma_obj-
> > > > > >coherent)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0dma_free_noncoherent(gem_obj->dev-
> > > > > >dev,
> > > > > dma_obj->base.size,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_obj-
> > > > > >vaddr,
> > > > > dma_obj-
> > > > > > dma_addr,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > DMA_TO_DEVICE);
> > > > > @@ -532,7 +544,7 @@ int drm_gem_dma_mmap(struct
> > > > > drm_gem_dma_object
> > > > > *dma_obj, struct vm_area_struct *
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vma->=
vm_pgoff -=3D drm_vma_node_start(&obj-
> > > > > >vma_node);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vm_fl=
ags_mod(vma, VM_DONTEXPAND, VM_PFNMAP);
> > > > > =C2=A0=C2=A0=20
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dma_obj->map_nonco=
herent) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dma_obj->cached) {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vma->vm_page_prot =3D vm_get_p=
age_prot(vma-
> > > > > > vm_flags);
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D dma_mmap_pages(dma_obj=
->base.dev-
> > > > > >dev,
> > > > > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > > > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > > > index 5ec75e9ba499..a3df2f99a757 100644
> > > > > --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > > > +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > > > @@ -919,7 +919,10 @@ ingenic_drm_gem_create_object(struct
> > > > > drm_device
> > > > > *drm, size_t size)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!=
obj)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ERR_PTR(-ENOMEM);
> > > > > =C2=A0=C2=A0=20
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0obj->map_noncoherent =
=3D priv->soc_info-
> > > > > >map_noncoherent;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (priv->soc_info->ma=
p_noncoherent) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0obj->cached =3D true;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0obj->coherent =3D false;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retur=
n &obj->base;
> > > > > =C2=A0=C2=A0=C2=A0}
> > > > > diff --git a/drivers/gpu/drm/rcar-du/Kconfig
> > > > > b/drivers/gpu/drm/rcar-
> > > > > du/Kconfig
> > > > > index 53c356aed5d5..dddc70c08bdc 100644
> > > > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > > > @@ -2,8 +2,6 @@
> > > > > =C2=A0=C2=A0=C2=A0config DRM_RCAR_DU
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0trist=
ate "DRM Support for R-Car Display Unit"
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depen=
ds on DRM && OF
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on ARM || ARM6=
4
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on ARCH_RENESA=
S || COMPILE_TEST
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0selec=
t DRM_KMS_HELPER
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0selec=
t DRM_GEM_DMA_HELPER
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0selec=
t VIDEOMODE_HELPERS
> > > > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > > > b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > > > index adfb36b0e815..1142d51473e6 100644
> > > > > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > > > @@ -386,7 +386,9 @@ struct drm_gem_object
> > > > > *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gem_o=
bj->funcs =3D &rcar_du_gem_funcs;
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_g=
em_private_object_init(dev, gem_obj, attach-
> > > > > > dmabuf-
> > > > > > size);
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_obj->map_noncohere=
nt =3D false;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_obj->cached =3D fa=
lse;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_obj->coherent =3D =
false;
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =
=3D drm_gem_create_mmap_offset(gem_obj);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (r=
et) {
> > > > > diff --git a/include/drm/drm_gem_dma_helper.h
> > > > > b/include/drm/drm_gem_dma_helper.h
> > > > > index 8a043235dad8..585ce3d4d1eb 100644
> > > > > --- a/include/drm/drm_gem_dma_helper.h
> > > > > +++ b/include/drm/drm_gem_dma_helper.h
> > > > > @@ -16,7 +16,9 @@ struct drm_mode_create_dumb;
> > > > > =C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 more tha=
n one entry but they are guaranteed to
> > > > > have
> > > > > contiguous
> > > > > =C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA addr=
esses.
> > > > > =C2=A0=C2=A0=C2=A0 * @vaddr: kernel virtual address of the backin=
g memory
> > > > > - * @map_noncoherent: if true, the GEM object is backed by
> > > > > non-
> > > > > coherent memory
> > > > > + * @cached: if true, the GEM object is backed by cached
> > > > > memory
> > > > > + * @coherent: This option only meaningful when a GEM object
> > > > > is
> > > > > cached.
> > > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 If true, Sync the GEM object for DMA access is
> > > > > not
> > > > > required.
> > > > > =C2=A0=C2=A0=C2=A0 */
> > > > > =C2=A0=C2=A0=C2=A0struct drm_gem_dma_object {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struc=
t drm_gem_object base;
> > > > > @@ -26,7 +28,8 @@ struct drm_gem_dma_object {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Fo=
r objects with DMA memory allocated by GEM DMA
> > > > > */
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void =
*vaddr;
> > > > > =C2=A0=C2=A0=20
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool map_noncoherent;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool cached;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool coherent;
> > > > > =C2=A0=C2=A0=C2=A0};
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0#define to_drm_gem_dma_obj(gem_obj) \
>=20

