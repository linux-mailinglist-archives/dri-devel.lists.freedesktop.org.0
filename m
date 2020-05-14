Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A387D1D2A74
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 10:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F4D6EAE1;
	Thu, 14 May 2020 08:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EC96EAE1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 08:41:02 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jZ9QJ-0004ZI-Cl; Thu, 14 May 2020 10:40:59 +0200
Message-ID: <ab384507b90474b0030d8ce64fdcfe868b52c3cb.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] drm/etnaviv: Don't ignore errors on getting clocks
From: Lucas Stach <l.stach@pengutronix.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Date: Thu, 14 May 2020 10:40:58 +0200
In-Reply-To: <20200514082755.GN1551@shell.armlinux.org.uk>
References: <20200513150007.1315395-1-lkundrak@v3.sk>
 <20200513150007.1315395-3-lkundrak@v3.sk>
 <CAOMZO5B582=tZ_YBCyVYFtGh=z5hZKFxP7XoUHEmH3jZsk2uYQ@mail.gmail.com>
 <CAOMZO5BdiXCVXs+8jP7PoRvgKd1sxCu4KhjvJBvL=Qig2WOs4g@mail.gmail.com>
 <1e15be39906034a95b86c026e060ed9866586d94.camel@pengutronix.de>
 <20200514082755.GN1551@shell.armlinux.org.uk>
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Lubomir Rintel <lkundrak@v3.sk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, den 14.05.2020, 09:27 +0100 schrieb Russell King - ARM Linux admin:
> On Thu, May 14, 2020 at 10:18:02AM +0200, Lucas Stach wrote:
> > Am Mittwoch, den 13.05.2020, 23:41 -0300 schrieb Fabio Estevam:
> > > On Wed, May 13, 2020 at 2:09 PM Fabio Estevam <festevam@gmail.com> wrote:
> > > 
> > > > The binding doc Documentation/devicetree/bindings/gpu/vivante,gc.yaml
> > > > says that only the 'reg' clock could be optional, the others are
> > > > required.
> > > 
> > > arch/arm/boot/dts/dove.dtsi only uses the 'core' clock.
> > > arch/arm/boot/dts/stm32mp157.dtsi uses 'bus' and 'core'
> > > 
> > > Maybe the binding needs to be updated and it seems that using
> > > devm_clk_get_optional() like you propose is safe.
> > 
> > The binding is correct as-is. We want to require those clocks to be
> > present, but the dove DT was added before the binding was finalized, so
> > the driver still treats the clocks as optional to not break
> > compatibility with old DTs. Maybe this warrants a comment in the
> > code...
> 
> The binding doc in mainline says:
> 
>   clocks:
>     items:
>       - description: AXI/master interface clock
>       - description: GPU core clock
>       - description: Shader clock (only required if GPU has feature PIPE_3D)
>       - description: AHB/slave interface clock (only required if GPU can gate slave interface independently)
>     minItems: 1
>     maxItems: 4
> 
>   clock-names:
>     items:
>       enum: [ bus, core, shader, reg ]
>     minItems: 1
>     maxItems: 4
> 
> which looks correct to me - and means that Dove is compliant with that.

The YAML binding actually did loose something in translation here,
which I didn't notice. Previously all those clocks were listed under
"Required properties", with the exceptions listed in parenthesis. So
the Dove GPU, which is a combined 2D/3D core should have axi, core and
shader clocks specified.

Regards,
Lucas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
