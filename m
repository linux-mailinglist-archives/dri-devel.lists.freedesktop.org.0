Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BED213119C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 12:50:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA9B6E271;
	Mon,  6 Jan 2020 11:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521F06E271
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 11:50:56 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ioQuK-0006CS-IE; Mon, 06 Jan 2020 12:50:52 +0100
Message-ID: <a4b9f091b846ef0a445408debef57a55feb1e647.camel@pengutronix.de>
Subject: Re: [PATCH 2/6] drm/etnaviv: determine product, customer and eco id
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 06 Jan 2020 12:50:52 +0100
In-Reply-To: <CAH9NwWc-M2TvPGnDY5d_aWxrtrb+SZZOObd9KSAAzN+K7WMpOg@mail.gmail.com>
References: <20200102100230.420009-1-christian.gmeiner@gmail.com>
 <20200102100230.420009-3-christian.gmeiner@gmail.com>
 <5cd1dc11df43d86d9db0dc2520de9b2e839ea7cc.camel@pengutronix.de>
 <CAH9NwWddNNc+2rRsntm+_eYF0S9uwC0kTszpPysbzmkc4dNuNA@mail.gmail.com>
 <191213c32908a217cf78590464c9b9519865f3e0.camel@pengutronix.de>
 <CAH9NwWc-M2TvPGnDY5d_aWxrtrb+SZZOObd9KSAAzN+K7WMpOg@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mo, 2020-01-06 at 12:40 +0100, Christian Gmeiner wrote:
> Hi Lucas
> 
> Am Mo., 6. Jan. 2020 um 12:22 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
> > On Mo, 2020-01-06 at 11:57 +0100, Christian Gmeiner wrote:
> > > Hi Lucas
> > > 
> > > Am Mo., 6. Jan. 2020 um 11:03 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
> > > > On Do, 2020-01-02 at 11:02 +0100, Christian Gmeiner wrote:
> > > > > They will be used for extended HWDB support. The eco id logic was taken
> > > > > from galcore kernel driver sources.
> > > > > 
> > > > > Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> > > > > ---
> > > > >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 17 +++++++++++++++++
> > > > >  drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  6 +++---
> > > > >  2 files changed, 20 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > > > index d47d1a8e0219..253301be9e95 100644
> > > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > > > @@ -321,6 +321,18 @@ static void etnaviv_hw_specs(struct etnaviv_gpu *gpu)
> > > > >               gpu->identity.varyings_count -= 1;
> > > > >  }
> > > > > 
> > > > > +static void etnaviv_hw_eco_id(struct etnaviv_gpu *gpu)
> > > > > +{
> > > > > +     const u32 chipDate = gpu_read(gpu, VIVS_HI_CHIP_DATE);
> > > > > +     gpu->identity.eco_id = gpu_read(gpu, VIVS_HI_CHIP_ECO_ID);
> > > > > +
> > > > > +     if (etnaviv_is_model_rev(gpu, GC1000, 0x5037) && (chipDate == 0x20120617))
> > > > > +             gpu->identity.eco_id = 1;
> > > > > +
> > > > > +     if (etnaviv_is_model_rev(gpu, GC320, 0x5303) && (chipDate == 0x20140511))
> > > > > +             gpu->identity.eco_id = 1;
> > > > 
> > > > I'm not sure if those two checks warrant a separate function. Maybe
> > > > just place them besides the other ID fixups?
> > > > 
> > > 
> > > This is almost a 1:1 copy of _GetEcoID(..) but will try to move the fixups.
> > > 
> > > 
> > > > > +}
> > > > > +
> > > > >  static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
> > > > >  {
> > > > >       u32 chipIdentity;
> > > > > @@ -362,6 +374,8 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
> > > > >                       }
> > > > >               }
> > > > > 
> > > > > +             gpu->identity.product_id = gpu_read(gpu, VIVS_HI_CHIP_PRODUCT_ID);
> > > > > +
> > > > >               /*
> > > > >                * NXP likes to call the GPU on the i.MX6QP GC2000+, but in
> > > > >                * reality it's just a re-branded GC3000. We can identify this
> > > > > @@ -375,6 +389,9 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
> > > > >               }
> > > > >       }
> > > > > 
> > > > > +     etnaviv_hw_eco_id(gpu);
> > > > > +     gpu->identity.customer_id = gpu_read(gpu, VIVS_HI_CHIP_CUSTOMER_ID);
> > > > 
> > > > I don't like this scattering of identity register reads. Please move
> > > > all of those reads to the else clause where we currently read
> > > > model/rev. I doubt that the customer ID register is available on the
> > > > really early cores, that only have the VIVS_HI_CHIP_IDENTITY register.
> > > > 
> > > 
> > > There is feature bit for it: chipMinorFeatures5_HAS_PRODUCTID
> > > Will change the code to make use of it. Shall I still put it in the
> > > else clause then?
> > 
> > If there's a feature bit we need to move the read toward the end of the
> > function, as we currently read the features as the last step in the
> > hw_identify.
> > 
> > But then I'm not sure if the HAS_PRODUCTID feature bit is correct. At
> > least wumpus' gpus_comparison says that none of the known <= GC3000
> > cores has it set, which seems... suspicious.
> > 
> 
> Hmm... what if I just mimic what is done here?
> https://github.com/etnaviv/vivante_kernel_drivers/blob/master/imx8_v6.2.3.129602/hal/kernel/arch/gc_hal_kernel_hardware.c#L220
> 
> Unconditionally read the product id at the end of the else clause. The
> same is done in the stm32 galcore kernel driver.

If we read it unconditionally, just move it to the start of the else
clause, next to the model/rev reads and be done with it.

Regards,
Lucas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
