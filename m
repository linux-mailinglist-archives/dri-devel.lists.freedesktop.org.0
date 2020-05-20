Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0154A1DE076
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731E26E98F;
	Fri, 22 May 2020 06:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from v6.sk (v6.sk [167.172.42.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519A56E850;
 Wed, 20 May 2020 13:39:00 +0000 (UTC)
Received: from localhost (v6.sk [IPv6:::1])
 by v6.sk (Postfix) with ESMTP id 0F6AC61300;
 Wed, 20 May 2020 13:38:28 +0000 (UTC)
Date: Wed, 20 May 2020 15:38:24 +0200
From: Lubomir Rintel <lkundrak@v3.sk>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 2/3] drm/etnaviv: Don't ignore errors on getting clocks
Message-ID: <20200520133824.GK1695525@furthur.local>
References: <20200513150007.1315395-1-lkundrak@v3.sk>
 <20200513150007.1315395-3-lkundrak@v3.sk>
 <CAOMZO5B582=tZ_YBCyVYFtGh=z5hZKFxP7XoUHEmH3jZsk2uYQ@mail.gmail.com>
 <CAOMZO5BdiXCVXs+8jP7PoRvgKd1sxCu4KhjvJBvL=Qig2WOs4g@mail.gmail.com>
 <1e15be39906034a95b86c026e060ed9866586d94.camel@pengutronix.de>
 <20200514082755.GN1551@shell.armlinux.org.uk>
 <ab384507b90474b0030d8ce64fdcfe868b52c3cb.camel@pengutronix.de>
 <20200514085307.GO1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514085307.GO1551@shell.armlinux.org.uk>
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:06 +0000
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 09:53:08AM +0100, Russell King - ARM Linux admin wrote:
> On Thu, May 14, 2020 at 10:40:58AM +0200, Lucas Stach wrote:
> > Am Donnerstag, den 14.05.2020, 09:27 +0100 schrieb Russell King - ARM Linux admin:
> > > On Thu, May 14, 2020 at 10:18:02AM +0200, Lucas Stach wrote:
> > > > Am Mittwoch, den 13.05.2020, 23:41 -0300 schrieb Fabio Estevam:
> > > > > On Wed, May 13, 2020 at 2:09 PM Fabio Estevam <festevam@gmail.com> wrote:
> > > > > 
> > > > > > The binding doc Documentation/devicetree/bindings/gpu/vivante,gc.yaml
> > > > > > says that only the 'reg' clock could be optional, the others are
> > > > > > required.
> > > > > 
> > > > > arch/arm/boot/dts/dove.dtsi only uses the 'core' clock.
> > > > > arch/arm/boot/dts/stm32mp157.dtsi uses 'bus' and 'core'
> > > > > 
> > > > > Maybe the binding needs to be updated and it seems that using
> > > > > devm_clk_get_optional() like you propose is safe.
> > > > 
> > > > The binding is correct as-is. We want to require those clocks to be
> > > > present, but the dove DT was added before the binding was finalized, so
> > > > the driver still treats the clocks as optional to not break
> > > > compatibility with old DTs. Maybe this warrants a comment in the
> > > > code...
> > > 
> > > The binding doc in mainline says:
> > > 
> > >   clocks:
> > >     items:
> > >       - description: AXI/master interface clock
> > >       - description: GPU core clock
> > >       - description: Shader clock (only required if GPU has feature PIPE_3D)
> > >       - description: AHB/slave interface clock (only required if GPU can gate slave interface independently)
> > >     minItems: 1
> > >     maxItems: 4
> > > 
> > >   clock-names:
> > >     items:
> > >       enum: [ bus, core, shader, reg ]
> > >     minItems: 1
> > >     maxItems: 4
> > > 
> > > which looks correct to me - and means that Dove is compliant with that.
> > 
> > The YAML binding actually did loose something in translation here,
> > which I didn't notice. Previously all those clocks were listed under
> > "Required properties", with the exceptions listed in parenthesis. So
> > the Dove GPU, which is a combined 2D/3D core should have axi, core and
> > shader clocks specified.
> 
> That may be your desire, but that is impossible without knowing that
> (a) it has the clocks
> (b) what those clocks are connected to
> 
> I guess we could "make something up" but as DT is supposed to describe
> hardware, I don't see how we can satisfy that and your requirement.
> 
> The only thing that is known from the documentation is that there is
> one clock for the GPU on Dove.

Yes. This means that in fact "core" is the only required clock for all
implementations of vivante,gc and the common binding needs to be updated
to reflect that. I'll follow with a patch that does that, unless there
are strong objections.

If there are implementations that require different clock inputs, then they
need to use additional compatible string for the particular flavor and the
binding should have conditionals for them. Something like this:

  if:
    properties:
      compatible:
        contains:
          const: fsl,imx6sx-gpu
  then:
    properties:
      clocks:
        minItems: 4

Lubo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
