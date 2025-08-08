Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA003B1E5F5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 11:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B8D10E8FA;
	Fri,  8 Aug 2025 09:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=grimler.se header.i=@grimler.se header.b="KvU40ydH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4F110E8FA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 09:53:12 +0000 (UTC)
Date: Fri, 8 Aug 2025 11:52:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
 t=1754646790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=axyrifqNPjr8C6r1QvIN7+JuBjVLsnAazuNCWOgONBA=;
 b=KvU40ydHKE0w7RhnYkcl2Fb4yOKj1J3yckXJpVjWfImCkk+Xyt2kBF+g+usQem2sMRyzPq
 z0/rFqabrKERJFwUjlJGQqVdvN+RUzp42rml2K0b5dyQO8NgVWSS0P310wexL16Bp4tERl
 3gj5fe514/cWTRE8Pz9+Ji8IPg/B5hY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
Subject: Re: [PATCH v2 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
Message-ID: <20250808095259.GA31443@grimfrac.localdomain>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
 <20250724-exynos4-sii9234-driver-v2-3-faee244f1d40@grimler.se>
 <ldhyfuczwtwydwnvno4xn6ppjtt7mtcj35fp52xrqaajtfbtpb@2pgkytczb5k5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ldhyfuczwtwydwnvno4xn6ppjtt7mtcj35fp52xrqaajtfbtpb@2pgkytczb5k5>
X-Migadu-Flow: FLOW_OUT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Sun, Jul 27, 2025 at 08:07:37PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jul 24, 2025 at 08:50:53PM +0200, Henrik Grimler wrote:
> > To use MHL we currently need the MHL chip to be permanently on, which
> > consumes unnecessary power. Let's use extcon attached to MUIC to enable
> > the MHL chip only if it detects an MHL cable.
> 
> Does HPD GPIO reflect the correct state of the cable?

Yes, the HPD gpio pin changes state from low to high when a mhl cable is
connected:

$ sudo cat /sys/kernel/debug/gpio|grep gpio-755
 gpio-755 (                    |hpd                 ) in  lo IRQ
$ sudo cat /sys/kernel/debug/gpio|grep gpio-755
 gpio-755 (                    |hpd                 ) in  hi IRQ

so that is described correctly.

> What is the order of events in such a case?

Order of events as in function tracing log? I enabled function tracing
with these filters:

  'max77693_muic_*' 'samsung_dsim_*' 'drm_bridge_*'
  'drm_atomic_bridge_*' 'exynos_irq_*' 'hdmi*' 'sii9234_*'

and captured the calls when I connect cable. dmesg with debug output
at the same time gives:

[ 6568.462521] max77693-muic max77693-muic: external connector is attached (adc:0x00, prev_adc:0x0)
[ 6568.470575] max77693-charger max77693-charger: not charging. connector type: 13
[ 6568.491722] sii9234 15-0039: sii9234: detection started d3
[ 6569.398148] i2c i2c-15: sendbytes: NAK bailout.
[ 6569.401477] sii9234 15-0039: writebm:  TPI[0x3d] <- 0x3e
[ 6569.408403] max77693-muic max77693-muic: external connector is attached (adc:0x00, prev_adc:0x0)
[ 6569.422638] max77693-charger max77693-charger: not charging. connector type: 13
[ 6569.570615] sii9234 15-0039: sii9234_irq_thread
[ 6569.622846] sii9234 15-0039: irq 00/00 42/5c 00/00
[ 6569.626182] sii9234 15-0039: RGND_READY_INT
[ 6570.592367] sii9234 15-0039: sii9234_irq_thread
[ 6570.644626] sii9234 15-0039: irq 00/60 40/5c 00/00
[ 6570.656185] sii9234 15-0039: RGND 1K!!
[ 6570.937165] sii9234 15-0039: sii9234_irq_thread
[ 6570.989467] sii9234 15-0039: irq 20/60 00/5c 00/0c
[ 6571.000986] sii9234 15-0039: MHL cable connected.. RSEN High
[ 6571.222655] sii9234 15-0039: sii9234_irq_thread
[ 6571.274884] sii9234 15-0039: irq 00/60 04/5c 00/04
[ 6571.278219] sii9234 15-0039: mhl est interrupt
[ 6571.408117] sii9234 15-0039: sii9234_irq_thread
[ 6571.460346] sii9234 15-0039: irq 40/60 00/5c 00/04

and in captured trace I see that on cable connect we get an irq that
is handled through:
1. max77693_muic_irq_handler
2. max77693_muic_irq_work
3. max77693_muic_adc_handler
4. sii9234_extcon_notifier
5. sii9234_extcon_work
6. sii9234_cable_in
7. hdmi_irq_thread

Raw captured trace dat file can be found here:
https://grimler.se/files/sii9234-mhl-connect-trace.dat

Maybe you were asking for some other type of order of events log
though, please let me know if I misunderstand.

> Should the sii9234 signal to Exynos HDMI that the link is established?

Maybe.. Sorry, I do not know enough about extcon and drm yet. I assume
you mean through drm_helper_hpd_irq_event() and
drm_bridge_hpd_notify(), I will experiment a bit and add it to the
driver and see if this improves it.

There is currently (as I wrote to Marek Szyprowski in a response in
v1) an issue where device screen stops working if cable is connected
when device screen is off, maybe proper notification would help..

> > Signed-off-by: Henrik Grimler <henrik@grimler.se>
> > ---
> > v2: add dependency on extcon. Issue reported by kernel test robot
> >     <lkp@intel.com>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig   |  1 +
> >  drivers/gpu/drm/bridge/sii9234.c | 89 ++++++++++++++++++++++++++++++++++++++--
> >  2 files changed, 87 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > index b9e0ca85226a603a24f90c6879d1499f824060cb..f18a083f6e1c6fe40bde5e65a1548acc61a162ae 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -303,6 +303,7 @@ config DRM_SII902X
> >  config DRM_SII9234
> >  	tristate "Silicon Image SII9234 HDMI/MHL bridge"
> >  	depends on OF
> > +	select EXTCON
> 
> Either this or 'depends on EXTCON || !EXTCON'

Feels like depends is a better description so will change to it,
thanks!

Best regards,
Henrik Grimler

> >  	help
> >  	  Say Y here if you want support for the MHL interface.
> >  	  It is an I2C driver, that detects connection of MHL bridge
> 
> -- 
> With best wishes
> Dmitry
> 
