Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140EA73457B
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 10:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7015010E0D9;
	Sun, 18 Jun 2023 08:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D60B10E0D9;
 Sun, 18 Jun 2023 08:26:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 52C3A60AB8;
 Sun, 18 Jun 2023 08:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD64CC433C8;
 Sun, 18 Jun 2023 08:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687076765;
 bh=+eBofwSb6IZB/zKNx2theD2VaBH+ePSND06CcMvofWU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Z7U8LSS8dYC1Pcg36jSAiC3bXPpkaqfS1ne4hpzs7v6D3F5xp9ZWJKZwV5flLCe5q
 gn84w/dpdodijLyfRl/5h99pG1RpqrTqikYF26xDRBZx2ybZ0fnc6J8WI9h1PT9Agz
 MKu3OXIkA9w15olPWWwpuQt+RJqhObyVvCFhxHeSH/O7Qna7xGb0IsKRHjm/FgERTS
 8SiwYc4QHLkIc+f7oe2YXXSOAbgzb1gjNaUW7he+X1keyE7NZtGgfVOCqa02eK9BRI
 u946ZcISFRy+pX1jP8rFAgcxVNiB5tTyUyVGBVlHifSD0mcSRyk0p8+6QlXQdVZEV/
 9Osceacr5bvmQ==
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-b9a6eec8611so5287295276.0; 
 Sun, 18 Jun 2023 01:26:05 -0700 (PDT)
X-Gm-Message-State: AC+VfDzP5YbJquI+uqI6e2o/Yjq26jNgUhNM7qxpfCgFc775mBFK5e93
 niYYEfuTcOU0S9YxK/oJOrfkcxuXb7xFTPNiABI=
X-Google-Smtp-Source: ACHHUZ5sKOlE9gVOTIYCRtcG65JgW7CsutADrDLB7Y5SKPMyjSkAC/QhMYvmm2lKbg4VNOm32Ryi2iCoqMVo6JEDU4A=
X-Received: by 2002:a25:4c84:0:b0:bca:1d11:c02e with SMTP id
 z126-20020a254c84000000b00bca1d11c02emr3562475yba.13.1687076764664; Sun, 18
 Jun 2023 01:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230602142501.6-1-francois.dugast@intel.com>
 <20230602142501.6-2-francois.dugast@intel.com>
 <qcsuilqdccvku4qoa36a5m3mhdr75akwpba77oisjk6e4kvkrm@6u5tr3dfmf5v>
 <ZIdIfdiClQ60fZSI@fdugast-desk.home>
 <20230615000105.GU5433@mdroper-desk1.amr.corp.intel.com>
 <CAFCwf10Td52xyKN9U903-GzS8V_T6sJ8t9ppLiXCNLzHGHzLEQ@mail.gmail.com>
 <20230615163420.GW5433@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230615163420.GW5433@mdroper-desk1.amr.corp.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 18 Jun 2023 11:25:38 +0300
X-Gmail-Original-Message-ID: <CAFCwf12r1VHY5m7u=Krx4oSBje-O0+E5MhQwu21+NVVnejTj6g@mail.gmail.com>
Message-ID: <CAFCwf12r1VHY5m7u=Krx4oSBje-O0+E5MhQwu21+NVVnejTj6g@mail.gmail.com>
Subject: Re: [Intel-xe] [RFC PATCH 1/1] drm/xe: Introduce function pointers
 for MMIO functions
To: Matt Roper <matthew.d.roper@intel.com>
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
Cc: ofir1.bitton@intel.com, Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 ohadshar@intel.com, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 7:34=E2=80=AFPM Matt Roper <matthew.d.roper@intel.c=
om> wrote:
>
> On Thu, Jun 15, 2023 at 04:04:18PM +0300, Oded Gabbay wrote:
> > On Thu, Jun 15, 2023 at 3:01=E2=80=AFAM Matt Roper <matthew.d.roper@int=
el.com> wrote:
> > >
> > > On Mon, Jun 12, 2023 at 06:31:57PM +0200, Francois Dugast wrote:
> > > > On Thu, Jun 08, 2023 at 10:35:29AM -0700, Lucas De Marchi wrote:
> > > > > On Fri, Jun 02, 2023 at 02:25:01PM +0000, Francois Dugast wrote:
> > > > > > A local structure of function pointers is used as a minimal har=
dware
> > > > > > abstraction layer to prepare for platform independent MMIO call=
s.
> > > > > >
> > > > > > Cc: Oded Gabbay <ogabbay@kernel.org>
> > > > > > Cc: Ofir Bitton <ofir1.bitton@intel.com>
> > > > > > Cc: Ohad Sharabi <ohadshar@intel.com>
> > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > > ---
> > > > > > drivers/gpu/drm/xe/xe_device_types.h |  3 ++
> > > > > > drivers/gpu/drm/xe/xe_mmio.c         | 81 +++++++++++++++++++++=
+++++++
> > > > > > drivers/gpu/drm/xe/xe_mmio.h         | 35 ++++++------
> > > > > > 3 files changed, 99 insertions(+), 20 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu=
/drm/xe/xe_device_types.h
> > > > > > index 17b6b1cc5adb..3f8fd0d8129b 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > @@ -378,6 +378,9 @@ struct xe_device {
> > > > > >   /** @d3cold_allowed: Indicates if d3cold is a valid device st=
ate */
> > > > > >   bool d3cold_allowed;
> > > > > >
> > > > > > + /** @mmio_funcs: function pointers for MMIO related functions=
 */
> > > > > > + const struct xe_mmio_funcs *mmio_funcs;
> > > > > > +
> > > > > >   /* private: */
> > > > > >
> > > > > > #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/=
xe_mmio.c
> > > > > > index 475b14fe4356..f3d08676a77a 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > @@ -25,6 +25,62 @@
> > > > > >
> > > > > > #define BAR_SIZE_SHIFT 20
> > > > > >
> > > > > > +static void xe_mmio_write32_device(struct xe_gt *gt,
> > > > > > +                            struct xe_reg reg, u32 val);
> > > > > > +static u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_r=
eg reg);
> > > > > > +static void xe_mmio_write64_device(struct xe_gt *gt,
> > > > > > +                            struct xe_reg reg, u64 val);
> > > > > > +static u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_r=
eg reg);
> > > > > > +
> > > > > > +static const struct xe_mmio_funcs xe_mmio_funcs_device =3D {
> > > > > > + .write32 =3D xe_mmio_write32_device,
> > > > > > + .read32 =3D xe_mmio_read32_device,
> > > > > > + .write64 =3D xe_mmio_write64_device,
> > > > > > + .read64 =3D xe_mmio_read64_device,
> > > > > > +};
> > > > > > +
> > > > > > +static inline void xe_mmio_write32_device(struct xe_gt *gt,
> > > > > > +                            struct xe_reg reg, u32 val)
> > > > > > +{
> > > > > > + struct xe_tile *tile =3D gt_to_tile(gt);
> > > > > > +
> > > > > > + if (reg.addr < gt->mmio.adj_limit)
> > > > > > +         reg.addr +=3D gt->mmio.adj_offset;
> > > > > > +
> > > > > > + writel(val, tile->mmio.regs + reg.addr);
> > > > > > +}
> > > > > > +
> > > > > > +static inline u32 xe_mmio_read32_device(struct xe_gt *gt, stru=
ct xe_reg reg)
> > > > > > +{
> > > > > > + struct xe_tile *tile =3D gt_to_tile(gt);
> > > > > > +
> > > > > > + if (reg.addr < gt->mmio.adj_limit)
> > > > > > +         reg.addr +=3D gt->mmio.adj_offset;
> > > > > > +
> > > > > > + return readl(tile->mmio.regs + reg.addr);
> > > > > > +}
> > > > > > +
> > > > > > +static inline void xe_mmio_write64_device(struct xe_gt *gt,
> > > > > > +                            struct xe_reg reg, u64 val)
> > > > > > +{
> > > > > > + struct xe_tile *tile =3D gt_to_tile(gt);
> > > > > > +
> > > > > > + if (reg.addr < gt->mmio.adj_limit)
> > > > > > +         reg.addr +=3D gt->mmio.adj_offset;
> > > > > > +
> > > > > > + writeq(val, tile->mmio.regs + reg.addr);
> > > > > > +}
> > > > > > +
> > > > > > +static inline u64 xe_mmio_read64_device(struct xe_gt *gt, stru=
ct xe_reg reg)
> > > > > > +{
> > > > > > + struct xe_tile *tile =3D gt_to_tile(gt);
> > > > > > +
> > > > > > + if (reg.addr < gt->mmio.adj_limit)
> > > > > > +         reg.addr +=3D gt->mmio.adj_offset;
> > > > > > +
> > > > > > + return readq(tile->mmio.regs + reg.addr);
> > > > > > +}
> > > > > > +
> > > > > > static int xe_set_dma_info(struct xe_device *xe)
> > > > > > {
> > > > > >   unsigned int mask_size =3D xe->info.dma_mask_size;
> > > > > > @@ -377,6 +433,29 @@ static void mmio_fini(struct drm_device *d=
rm, void *arg)
> > > > > >           iounmap(xe->mem.vram.mapping);
> > > > > > }
> > > > > >
> > > > > > +static void xe_mmio_set_funcs(struct xe_device *xe)
> > > > > > +{
> > > > > > + /* For now all platforms use the set of MMIO functions for a
> > > > > > +  * physical device.
> > > > > > +  */
> > > > >
> > > > >
> > > > > what is "device" in this context? that seems confusing as we alwa=
ys ever
> > > > > just support reading/writing to a real device (physical here may =
also
> > > > > add to the confusion when thinking about SR-IOV and VFs).
> > > > > We shouldn't add abstractions that are then never used and all pl=
atforms
> > > > > end up using the same. Unless it's a preparation for a follow up =
series
> > > > > adding the different handling.
> > > >
> > > > For now "device" is meant as "in opposition to simulator" but I agr=
ee
> > > > we can find a better name. Existing platforms all use the same
> > > > implementation but this is preparation for platforms that require a
> > > > different implementation.
> > >
> > > I agree with Lucas that this doesn't really seem to be a good candida=
te
> > > for a vtable; every platform uses exactly the same logic and I can't
> > > really envision how/why this would need to change for future platform=
s
> > > either, so this seems to just be adding unnecessary complexity.
> > > Registers being accessed at some offset into a PCI BAR isn't likely t=
o
> > > change going forward.  On future platforms it's more likely that we'd
> > > need changes to the part of the code that maps the MMIO BAR rather th=
an
> > > the code that reads/writes an offset into a mapping that's already be=
en
> > > setup.
> > I agree with that for every *real hardware* platform the
> > implementation will probably be the same.
> > But for simulator/emulation, there is a different implementation.
> > And even if we don't upstream that different implementation, doing
> > this abstraction will help us upstream the rest of the driver as we
> > minimize the differences between upstream and downstream.
> > And helping us upstream the driver is a good enough reason imo to add
> > this abstraction.
>
> Adding extra abstraction layers to upstream code that provide no
> upstream benefit and only come into play for some private, internal-only
> workflow is generally frowned upon in the DRM subsystem.  Unless you
> have some kind of public, open-source usage model, adding the extra
> complexity and clutter here is probably a no-go for upstream.
While in general I ofc agree with this statement, I believe it doesn't
apply to this case.

The intention behind changing register access to be callback functions
is to allow the Linux driver to serve as the principal entity for
pre-silicon validation . This is an important distinction, as the aim
is not to obscure the Linux kernel API for portability across other
operating systems or to reinvent mechanisms already provided by the
kernel, which I believe is the primary objection of upstream for
adding abstraction layers.

Instead, this strategy is about utilizing the inherent advantages of
Linux for the crucial stage of pre-silicon validation. In fact,
adopting Linux as the main vessel for this process can help leverage a
broader open source community for problem-solving, encourage more
uniform testing practices, and result in higher quality drivers due to
the transparency and scrutiny inherent in open-source development.

Making the upstream driver as close as possible to the internal driver
is advantageous for both the speed and quality of the upstreaming
process. A driver that closely mirrors the internal one will likely
require fewer modifications, thus streamlining the upstreaming
process. With a closely aligned internal and upstream driver, the
benefits of any improvements, bug fixes, and other modifications made
in the internal driver could be quickly and easily transferred to the
upstream driver.

In short, this change will allow us to do a continuously faster and
better upstream process, which imho provides a substantial benefit to
the kernel community.

>
> Also, even if you do have an unusual form of simulation/emulation that
> doesn't behave like real hardware, are you going to have several of them
> that all work in different manners and need unique implementations?  If
> we only ever expect to have two code paths total (and only one of those
> upstream), then using a vtable seems like overkill.  A very simple
>
>         if (special case)
>                 return alternate_implementation();
>
> would be much easier to understand and maintain.
Specifically in this case (register access), as I don't foresee more
than two implementations, we can go with your suggestion.
i.e. add to the mmio inline functions

if (sim)
    return alternate_implementation();

If there is no objection, we will follow this approach and send a
patch for review.

Thanks,
Oded
>
>
> There are lots of other places in the Xe driver that _would_ benefit
> from per-platform vtables; we should prioritize making changes like this
> in the areas where they provide a clear benefit.
>
>
> Matt
>
> >
> >
> > Oded
> > >
> > > >
> > > > >
> > > > > +Matt as there is still (at least) one refactor planned in this a=
rea,
> > > > > since gt is not always the proper target for the MMIOs. He was sa=
ying in
> > > > > his earlier series about having a mmio_view or such to abstract t=
he
> > > > > offset and other differences between each IO range. Not sure if t=
his
> > > > > series would go the rigth direction, maybe we need to think in bo=
th
> > > > > cases together.
> > > >
> > > > Matt, would this series block the refactor mentioned by Lucas?
> > > >
> > > > In general, are there objections to introducing functions pointers =
for
> > > > MMIO functions (extended to all of them, as suggested by Ohad)?
> > >
> > > It probably makes more sense to do vtable conversion on other parts o=
f
> > > the driver where we already have different implementations per platfo=
rm
> > > and where we already know that design makes sense.  We can always com=
e
> > > back and do this to the MMIO functions later once there are actually
> > > multiple implementations, but it doesn't seem to serve any purpose ri=
ght
> > > now.
> > >
> > >
> > > Matt
> > >
> > > >
> > > > Thanks,
> > > > Francois
> > > >
> > > > >
> > > > >
> > > > > Lucas De Marchi
> > > > >
> > > > > > + switch (xe->info.platform) {
> > > > > > + case XE_TIGERLAKE:
> > > > > > + case XE_ROCKETLAKE:
> > > > > > + case XE_ALDERLAKE_S:
> > > > > > + case XE_ALDERLAKE_P:
> > > > > > + case XE_ALDERLAKE_N:
> > > > > > + case XE_DG1:
> > > > > > + case XE_DG2:
> > > > > > + case XE_PVC:
> > > > > > + case XE_METEORLAKE:
> > > > > > +         xe->mmio_funcs =3D &xe_mmio_funcs_device;
> > > > > > +         break;
> > > > > > + default:
> > > > > > +         DRM_ERROR("Unsupported platform\n");
> > > > > > +         break;
> > > > > > + }
> > > > > > +}
> > > > > > +
> > > > > > int xe_mmio_init(struct xe_device *xe)
> > > > > > {
> > > > > >   struct xe_tile *root_tile =3D xe_device_get_root_tile(xe);
> > > > > > @@ -384,6 +463,8 @@ int xe_mmio_init(struct xe_device *xe)
> > > > > >   const int mmio_bar =3D 0;
> > > > > >   int err;
> > > > > >
> > > > > > + xe_mmio_set_funcs(xe);
> > > > > > +
> > > > > >   /*
> > > > > >    * Map the first 16MB of th BAR, which includes the registers=
 (0-4MB),
> > > > > >    * reserved space (4MB-8MB), and GGTT (8MB-16MB) for a single=
 tile.
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/=
xe_mmio.h
> > > > > > index 3c547d78afba..80ce9de7aac4 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > > > > > @@ -19,6 +19,13 @@ struct xe_device;
> > > > > >
> > > > > > #define GEN12_LMEM_BAR            2
> > > > > >
> > > > > > +struct xe_mmio_funcs {
> > > > > > + u32 (*read32)(struct xe_gt *gt, struct xe_reg reg);
> > > > > > + u64 (*read64)(struct xe_gt *gt, struct xe_reg reg);
> > > > > > + void (*write32)(struct xe_gt *gt, struct xe_reg reg, u32 val)=
;
> > > > > > + void (*write64)(struct xe_gt *gt, struct xe_reg reg, u64 val)=
;
> > > > > > +};
> > > > > > +
> > > > > > int xe_mmio_init(struct xe_device *xe);
> > > > > >
> > > > > > static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg =
reg)
> > > > > > @@ -34,22 +41,16 @@ static inline u8 xe_mmio_read8(struct xe_gt=
 *gt, struct xe_reg reg)
> > > > > > static inline void xe_mmio_write32(struct xe_gt *gt,
> > > > > >                              struct xe_reg reg, u32 val)
> > > > > > {
> > > > > > - struct xe_tile *tile =3D gt_to_tile(gt);
> > > > > > -
> > > > > > - if (reg.addr < gt->mmio.adj_limit)
> > > > > > -         reg.addr +=3D gt->mmio.adj_offset;
> > > > > > + struct xe_device *xe =3D gt_to_xe(gt);
> > > > > >
> > > > > > - writel(val, tile->mmio.regs + reg.addr);
> > > > > > + xe->mmio_funcs->write32(gt, reg, val);
> > > > > > }
> > > > > >
> > > > > > static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_re=
g reg)
> > > > > > {
> > > > > > - struct xe_tile *tile =3D gt_to_tile(gt);
> > > > > > -
> > > > > > - if (reg.addr < gt->mmio.adj_limit)
> > > > > > -         reg.addr +=3D gt->mmio.adj_offset;
> > > > > > + struct xe_device *xe =3D gt_to_xe(gt);
> > > > > >
> > > > > > - return readl(tile->mmio.regs + reg.addr);
> > > > > > + return xe->mmio_funcs->read32(gt, reg);
> > > > > > }
> > > > > >
> > > > > > static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg=
 reg, u32 clr,
> > > > > > @@ -67,22 +68,16 @@ static inline u32 xe_mmio_rmw32(struct xe_g=
t *gt, struct xe_reg reg, u32 clr,
> > > > > > static inline void xe_mmio_write64(struct xe_gt *gt,
> > > > > >                              struct xe_reg reg, u64 val)
> > > > > > {
> > > > > > - struct xe_tile *tile =3D gt_to_tile(gt);
> > > > > > -
> > > > > > - if (reg.addr < gt->mmio.adj_limit)
> > > > > > -         reg.addr +=3D gt->mmio.adj_offset;
> > > > > > + struct xe_device *xe =3D gt_to_xe(gt);
> > > > > >
> > > > > > - writeq(val, tile->mmio.regs + reg.addr);
> > > > > > + xe->mmio_funcs->write64(gt, reg, val);
> > > > > > }
> > > > > >
> > > > > > static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_re=
g reg)
> > > > > > {
> > > > > > - struct xe_tile *tile =3D gt_to_tile(gt);
> > > > > > -
> > > > > > - if (reg.addr < gt->mmio.adj_limit)
> > > > > > -         reg.addr +=3D gt->mmio.adj_offset;
> > > > > > + struct xe_device *xe =3D gt_to_xe(gt);
> > > > > >
> > > > > > - return readq(tile->mmio.regs + reg.addr);
> > > > > > + return xe->mmio_funcs->read64(gt, reg);
> > > > > > }
> > > > > >
> > > > > > static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
> > > > > > --
> > > > > > 2.34.1
> > > > > >
> > >
> > > --
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
>
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
