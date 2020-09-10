Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E9D2643DA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 12:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA826E901;
	Thu, 10 Sep 2020 10:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735326E8F3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 10:24:51 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kGJl0-0007HR-Ia; Thu, 10 Sep 2020 12:24:46 +0200
Message-ID: <a325e1594dff339ddd6858f0ac93698582a6000a.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx/dcss: fix compilation issue on 32bit
From: Lucas Stach <l.stach@pengutronix.de>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Daniel Vetter
 <daniel@ffwll.ch>
Date: Thu, 10 Sep 2020 12:24:44 +0200
In-Reply-To: <20200910102128.5agk4vxf2jeonw3q@fsr-ub1864-141>
References: <20200910095250.7663-1-laurentiu.palcu@oss.nxp.com>
 <CAKMK7uGsJcg81a_cGebBgk3pwxj4VPrFfmV5AF+5fRyK3_Pigw@mail.gmail.com>
 <20200910102128.5agk4vxf2jeonw3q@fsr-ub1864-141>
User-Agent: Evolution 3.30.5-1.1 
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Do, 2020-09-10 at 13:21 +0300, Laurentiu Palcu wrote:
> On Thu, Sep 10, 2020 at 11:57:10AM +0200, Daniel Vetter wrote:
> > On Thu, Sep 10, 2020 at 11:53 AM Laurentiu Palcu
> > <laurentiu.palcu@oss.nxp.com> wrote:
> > > When compiling for 32bit platforms, the compilation fails with:
> > > 
> > > ERROR: modpost: "__aeabi_ldivmod"
> > > [drivers/gpu/drm/imx/dcss/imx-dcss.ko] undefined!
> > > ERROR: modpost: "__aeabi_uldivmod"
> > > [drivers/gpu/drm/imx/dcss/imx-dcss.ko] undefined!
> > > 
> > > This patch adds a dependency on ARM64 since no 32bit SoCs have DCSS, so far.
> > 
> > Usual way to fix this correctly is using the right division macros,
> > not limiting the driver to 64bit. But this works for now, would be
> > good to fix this properly for compile-testing and all that.
> 
> I didn't see the point in using the macros since this is running only on
> 64bit. Though I will probably revisit it and fix it properly in a
> subsequent patch.
> 
> > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > > Reported-by: Daniel Vetter <daniel@ffwll.ch>
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > Please push to drm-misc-next.
> 
> About that, I may need some help pushing it.

I've already pushed a few minutes ago, so we don't disturb the build
tests any longer.

Regards,
Lucas

> Apparently, my request for
> a legacy SSH account for contributing to drm-misc got stalled:
> 
> https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/289
> 
> Thanks,
> laurentiu
> 
> > -Daniel
> > 
> > 
> > 
> > ---
> > >  drivers/gpu/drm/imx/dcss/Kconfig | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
> > > index 69860de8861f..2b17a964ff05 100644
> > > --- a/drivers/gpu/drm/imx/dcss/Kconfig
> > > +++ b/drivers/gpu/drm/imx/dcss/Kconfig
> > > @@ -3,7 +3,7 @@ config DRM_IMX_DCSS
> > >         select IMX_IRQSTEER
> > >         select DRM_KMS_CMA_HELPER
> > >         select VIDEOMODE_HELPERS
> > > -       depends on DRM && ARCH_MXC
> > > +       depends on DRM && ARCH_MXC && ARM64
> > >         help
> > >           Choose this if you have a NXP i.MX8MQ based system and want to use the
> > >           Display Controller Subsystem. This option enables DCSS support.
> > > --
> > > 2.17.1
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
