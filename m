Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D19D83C8A7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 17:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61E110F8F6;
	Thu, 25 Jan 2024 16:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE13510F5E1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 16:51:01 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rT2wM-0003IL-A5; Thu, 25 Jan 2024 17:50:58 +0100
Message-ID: <516b95eaabc64b4b6c37e7a5840b32203ebcb062.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] drm/etnaviv: Turn etnaviv_is_model_rev() into a
 function
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>
Date: Thu, 25 Jan 2024 17:50:57 +0100
In-Reply-To: <CAH9NwWd7kuk9LFD0cXiy3wm50KHVT8uGM37hdv4=rN9+YGCZmw@mail.gmail.com>
References: <20240125-etnaviv-npu-v2-0-ba23c9a32be1@pengutronix.de>
 <20240125-etnaviv-npu-v2-2-ba23c9a32be1@pengutronix.de>
 <CAH9NwWd7kuk9LFD0cXiy3wm50KHVT8uGM37hdv4=rN9+YGCZmw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Russell King <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 25.01.2024 um 17:27 +0100 schrieb Christian Gmeiner:
> Hi Philipp
>=20
> >=20
> > Turn the etnaviv_is_model_rev() macro into a static inline function.
> > Use the raw model number as a parameter instead of the chipModel_GCxxxx
> > defines. This reduces synchronization requirements for the generated
> > headers. For newer hardware, the GCxxxx names are not the correct model
> > names anyway. For example, model 0x8000 NPUs are called VIPNano-QI/SI(+=
)
> > by VeriSilicon.
>=20
> To catch up with your NPU example Vivante's kernel driver has such
> lines in its hw database [0]
>=20
> /* vipnano-si+ */
> {
>     0x8000, /* ChipID */
>     0x8002, /* ChipRevision */
>     0x5080009, /* ProductID */
>     0x6000000, /* EcoID */
>     0x9f, /* CustomerID */
>     ...
>=20
> I think in reality this function should be called
> etnaviv_is_chip_rev(..) or etnaviv_is_id_rev(..). That would be
> semantically correct and we could even stick the the current macro
> (that gets renamed) and with the current
> GCxxx defines.

The value for what is called ChipID in the downstream driver is read
from a register which is called VIVS_HI_CHIP_MODEL in rnndb. I would
like to stay consistent by calling this model in the etnaviv driver.

I don't see any value in the GCxxx defines, which only add a (pretty)
prefix to a perfectly readable hex number, so I'm fine with changing
the current macro and getting rid of any usage of those defines in the
driver.

Regards,
Lucas

>=20
> [0]: https://github.com/nxp-imx/linux-imx/blob/lf-6.1.y/drivers/mxc/gpu-v=
iv/hal/kernel/inc/gc_feature_database.h#L22373
>=20
> >=20
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 66 ++++++++++++++++++---------=
--------
> >  1 file changed, 34 insertions(+), 32 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/et=
naviv/etnaviv_gpu.c
> > index 9b8445d2a128..c61d50dd3829 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > @@ -172,10 +172,12 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu=
, u32 param, u64 *value)
> >         return 0;
> >  }
> >=20
> > +static inline bool etnaviv_is_model_rev(struct etnaviv_gpu *gpu, u32 m=
odel, u32 revision)
> > +{
> > +       return gpu->identity.model =3D=3D model &&
> > +              gpu->identity.revision =3D=3D revision;
> > +}
> >=20
> > -#define etnaviv_is_model_rev(gpu, mod, rev) \
> > -       ((gpu)->identity.model =3D=3D chipModel_##mod && \
> > -        (gpu)->identity.revision =3D=3D rev)
> >  #define etnaviv_field(val, field) \
> >         (((val) & field##__MASK) >> field##__SHIFT)
> >=20
> > @@ -281,7 +283,7 @@ static void etnaviv_hw_specs(struct etnaviv_gpu *gp=
u)
> >=20
> >         switch (gpu->identity.instruction_count) {
> >         case 0:
> > -               if (etnaviv_is_model_rev(gpu, GC2000, 0x5108) ||
> > +               if (etnaviv_is_model_rev(gpu, 0x2000, 0x5108) ||
> >                     gpu->identity.model =3D=3D chipModel_GC880)
> >                         gpu->identity.instruction_count =3D 512;
> >                 else
> > @@ -315,17 +317,17 @@ static void etnaviv_hw_specs(struct etnaviv_gpu *=
gpu)
> >          * For some cores, two varyings are consumed for position, so t=
he
> >          * maximum varying count needs to be reduced by one.
> >          */
> > -       if (etnaviv_is_model_rev(gpu, GC5000, 0x5434) ||
> > -           etnaviv_is_model_rev(gpu, GC4000, 0x5222) ||
> > -           etnaviv_is_model_rev(gpu, GC4000, 0x5245) ||
> > -           etnaviv_is_model_rev(gpu, GC4000, 0x5208) ||
> > -           etnaviv_is_model_rev(gpu, GC3000, 0x5435) ||
> > -           etnaviv_is_model_rev(gpu, GC2200, 0x5244) ||
> > -           etnaviv_is_model_rev(gpu, GC2100, 0x5108) ||
> > -           etnaviv_is_model_rev(gpu, GC2000, 0x5108) ||
> > -           etnaviv_is_model_rev(gpu, GC1500, 0x5246) ||
> > -           etnaviv_is_model_rev(gpu, GC880, 0x5107) ||
> > -           etnaviv_is_model_rev(gpu, GC880, 0x5106))
> > +       if (etnaviv_is_model_rev(gpu, 0x5000, 0x5434) ||
> > +           etnaviv_is_model_rev(gpu, 0x4000, 0x5222) ||
> > +           etnaviv_is_model_rev(gpu, 0x4000, 0x5245) ||
> > +           etnaviv_is_model_rev(gpu, 0x4000, 0x5208) ||
> > +           etnaviv_is_model_rev(gpu, 0x3000, 0x5435) ||
> > +           etnaviv_is_model_rev(gpu, 0x2200, 0x5244) ||
> > +           etnaviv_is_model_rev(gpu, 0x2100, 0x5108) ||
> > +           etnaviv_is_model_rev(gpu, 0x2000, 0x5108) ||
> > +           etnaviv_is_model_rev(gpu, 0x1500, 0x5246) ||
> > +           etnaviv_is_model_rev(gpu, 0x880, 0x5107) ||
> > +           etnaviv_is_model_rev(gpu, 0x880, 0x5106))
> >                 gpu->identity.varyings_count -=3D 1;
> >  }
> >=20
> > @@ -351,7 +353,7 @@ static void etnaviv_hw_identify(struct etnaviv_gpu =
*gpu)
> >                  * Reading these two registers on GC600 rev 0x19 result=
 in a
> >                  * unhandled fault: external abort on non-linefetch
> >                  */
> > -               if (!etnaviv_is_model_rev(gpu, GC600, 0x19)) {
> > +               if (!etnaviv_is_model_rev(gpu, 0x600, 0x19)) {
> >                         gpu->identity.product_id =3D gpu_read(gpu, VIVS=
_HI_CHIP_PRODUCT_ID);
> >                         gpu->identity.eco_id =3D gpu_read(gpu, VIVS_HI_=
CHIP_ECO_ID);
> >                 }
> > @@ -368,7 +370,7 @@ static void etnaviv_hw_identify(struct etnaviv_gpu =
*gpu)
> >                 }
> >=20
> >                 /* Another special case */
> > -               if (etnaviv_is_model_rev(gpu, GC300, 0x2201)) {
> > +               if (etnaviv_is_model_rev(gpu, 0x300, 0x2201)) {
> >                         u32 chipTime =3D gpu_read(gpu, VIVS_HI_CHIP_TIM=
E);
> >=20
> >                         if (chipDate =3D=3D 0x20080814 && chipTime =3D=
=3D 0x12051100) {
> > @@ -387,15 +389,15 @@ static void etnaviv_hw_identify(struct etnaviv_gp=
u *gpu)
> >                  * Fix model/rev here, so all other places can refer to=
 this
> >                  * core by its real identity.
> >                  */
> > -               if (etnaviv_is_model_rev(gpu, GC2000, 0xffff5450)) {
> > +               if (etnaviv_is_model_rev(gpu, 0x2000, 0xffff5450)) {
> >                         gpu->identity.model =3D chipModel_GC3000;
> >                         gpu->identity.revision &=3D 0xffff;
> >                 }
> >=20
> > -               if (etnaviv_is_model_rev(gpu, GC1000, 0x5037) && (chipD=
ate =3D=3D 0x20120617))
> > +               if (etnaviv_is_model_rev(gpu, 0x1000, 0x5037) && (chipD=
ate =3D=3D 0x20120617))
> >                         gpu->identity.eco_id =3D 1;
> >=20
> > -               if (etnaviv_is_model_rev(gpu, GC320, 0x5303) && (chipDa=
te =3D=3D 0x20140511))
> > +               if (etnaviv_is_model_rev(gpu, 0x320, 0x5303) && (chipDa=
te =3D=3D 0x20140511))
> >                         gpu->identity.eco_id =3D 1;
> >         }
> >=20
> > @@ -630,14 +632,14 @@ static void etnaviv_gpu_enable_mlcg(struct etnavi=
v_gpu *gpu)
> >                 pmc |=3D BIT(15); /* Unknown bit */
> >=20
> >         /* Disable TX clock gating on affected core revisions. */
> > -       if (etnaviv_is_model_rev(gpu, GC4000, 0x5222) ||
> > -           etnaviv_is_model_rev(gpu, GC2000, 0x5108) ||
> > -           etnaviv_is_model_rev(gpu, GC2000, 0x6202) ||
> > -           etnaviv_is_model_rev(gpu, GC2000, 0x6203))
> > +       if (etnaviv_is_model_rev(gpu, 0x4000, 0x5222) ||
> > +           etnaviv_is_model_rev(gpu, 0x2000, 0x5108) ||
> > +           etnaviv_is_model_rev(gpu, 0x2000, 0x6202) ||
> > +           etnaviv_is_model_rev(gpu, 0x2000, 0x6203))
> >                 pmc |=3D VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_G=
ATING_TX;
> >=20
> >         /* Disable SE and RA clock gating on affected core revisions. *=
/
> > -       if (etnaviv_is_model_rev(gpu, GC7000, 0x6202))
> > +       if (etnaviv_is_model_rev(gpu, 0x7000, 0x6202))
> >                 pmc |=3D VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_G=
ATING_SE |
> >                        VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GAT=
ING_RA;
> >=20
> > @@ -690,14 +692,14 @@ static void etnaviv_gpu_setup_pulse_eater(struct =
etnaviv_gpu *gpu)
> >          */
> >         u32 pulse_eater =3D 0x01590880;
> >=20
> > -       if (etnaviv_is_model_rev(gpu, GC4000, 0x5208) ||
> > -           etnaviv_is_model_rev(gpu, GC4000, 0x5222)) {
> > +       if (etnaviv_is_model_rev(gpu, 0x4000, 0x5208) ||
> > +           etnaviv_is_model_rev(gpu, 0x4000, 0x5222)) {
> >                 pulse_eater |=3D BIT(23);
> >=20
> >         }
> >=20
> > -       if (etnaviv_is_model_rev(gpu, GC1000, 0x5039) ||
> > -           etnaviv_is_model_rev(gpu, GC1000, 0x5040)) {
> > +       if (etnaviv_is_model_rev(gpu, 0x1000, 0x5039) ||
> > +           etnaviv_is_model_rev(gpu, 0x1000, 0x5040)) {
> >                 pulse_eater &=3D ~BIT(16);
> >                 pulse_eater |=3D BIT(17);
> >         }
> > @@ -718,8 +720,8 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu =
*gpu)
> >         WARN_ON(!(gpu->state =3D=3D ETNA_GPU_STATE_IDENTIFIED ||
> >                   gpu->state =3D=3D ETNA_GPU_STATE_RESET));
> >=20
> > -       if ((etnaviv_is_model_rev(gpu, GC320, 0x5007) ||
> > -            etnaviv_is_model_rev(gpu, GC320, 0x5220)) &&
> > +       if ((etnaviv_is_model_rev(gpu, 0x320, 0x5007) ||
> > +            etnaviv_is_model_rev(gpu, 0x320, 0x5220)) &&
> >             gpu_read(gpu, VIVS_HI_CHIP_TIME) !=3D 0x2062400) {
> >                 u32 mc_memory_debug;
> >=20
> > @@ -745,7 +747,7 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu =
*gpu)
> >                   VIVS_HI_AXI_CONFIG_ARCACHE(2));
> >=20
> >         /* GC2000 rev 5108 needs a special bus config */
> > -       if (etnaviv_is_model_rev(gpu, GC2000, 0x5108)) {
> > +       if (etnaviv_is_model_rev(gpu, 0x2000, 0x5108)) {
> >                 u32 bus_config =3D gpu_read(gpu, VIVS_MC_BUS_CONFIG);
> >                 bus_config &=3D ~(VIVS_MC_BUS_CONFIG_FE_BUS_CONFIG__MAS=
K |
> >                                 VIVS_MC_BUS_CONFIG_TX_BUS_CONFIG__MASK)=
;
> >=20
> > --
> > 2.39.2
> >=20
>=20
>=20

