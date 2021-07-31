Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0C93DC7C6
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 20:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00E06E5C8;
	Sat, 31 Jul 2021 18:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E276E894
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 18:50:08 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 2a153144-f230-11eb-8d1a-0050568cd888;
 Sat, 31 Jul 2021 18:50:24 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id ED887194B0F;
 Sat, 31 Jul 2021 20:50:27 +0200 (CEST)
Date: Sat, 31 Jul 2021 20:50:02 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com,
 brian.starkey@arm.com, bbrezillon@kernel.org,
 nicolas.ferre@microchip.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, stefan@agner.ch, alison.wang@nxp.com,
 patrik.r.jakobsson@gmail.com, anitha.chrisanthus@intel.com,
 robdclark@gmail.com, edmund.j.dea@intel.com, sean@poorly.run,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 jyri.sarha@iki.fi, tomba@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/14] drm: Make DRM's IRQ helpers legacy
Message-ID: <YQWbWjV5TYzp+5C4@ravnborg.org>
References: <20210727182721.17981-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727182721.17981-1-tzimmermann@suse.de>
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

Hi Thomas,

On Tue, Jul 27, 2021 at 08:27:07PM +0200, Thomas Zimmermann wrote:
> DRM's IRQ helpers are only helpful for old, non-KMS drivers. Move
> the code behind CONFIG_DRM_LEGACY. Convert KMS drivers to Linux
> IRQ interfaces.
> 
> DRM provides IRQ helpers for setting up, receiving and removing IRQ
> handlers. It's an abstraction over plain Linux functions. The code
> is mid-layerish with several callbacks to hook into the rsp drivers.
> Old UMS driver have their interrupts enabled via ioctl, so these
> abstractions makes some sense. Modern KMS manage all their interrupts
> internally. Using the DRM helpers adds indirection without benefits.
> 
> Most KMs drivers already use Linux IRQ functions instead of DRM's
> abstraction layer. Patches 1 to 12 convert the remaining ones.
> The patches also resolve a bug for devices without assigned interrupt
> number. DRM helpers don't test for IRQ_NOTCONNECTED, so drivers do
> not detect if the device has no interrupt assigned.
> 
> Patch 13 removes an unused function.
> 
> Patch 14 moves the DRM IRQ helpers behind CONFIG_DRM_LEGACY. Only
> the old non-KMS drivers still use the functionality.
> 
> Thomas Zimmermann (14):
>   drm/amdgpu: Convert to Linux IRQ interfaces
>   drm/arm/hdlcd: Convert to Linux IRQ interfaces
>   drm/atmel-hlcdc: Convert to Linux IRQ interfaces
>   drm/fsl-dcu: Convert to Linux IRQ interfaces
>   drm/gma500: Convert to Linux IRQ interfaces
>   drm/kmb: Convert to Linux IRQ interfaces
>   drm/msm: Convert to Linux IRQ interfaces
>   drm/mxsfb: Convert to Linux IRQ interfaces
>   drm/radeon: Convert to Linux IRQ interfaces
>   drm/tidss: Convert to Linux IRQ interfaces
>   drm/tilcdc: Convert to Linux IRQ interfaces
>   drm/vc4: Convert to Linux IRQ interfaces
>   drm: Remove unused devm_drm_irq_install()
>   drm: IRQ midlayer is now legacy

With the irq_enabled confusion out of the way I want to re-address two
issues here that I know you have answered but I am just not convinced.

1) IRQ_NOTCONNECTED

We do not have this check in drm_irq today and we should avoid spreading
it all over. We are either carrying it forever or we wil lsee patches
floating in to drop the check again.
The current use in the kernel is minimal:
https://elixir.bootlin.com/linux/latest/A/ident/IRQ_NOTCONNECTED

So as a minimum drop it from atmel_hlcdc and preferably from the rest as
it is really not used. (Speaking as atmel_hlcdc maintainer)


2) devm_request_irq()

We are moving towards managed allocation so we do not fail to free
resources. And an irq has a lifetime equal the device itself - so an
obvious cnadidate for devm_request_irq.
If we do not introduce it now we will see a revisit of this later.
I can be convinced to wait with this as we will have to do much more in
each driver, but I cannot see any good arguments to avoid the more
modern way to use devm_request_irq.

	Sam
