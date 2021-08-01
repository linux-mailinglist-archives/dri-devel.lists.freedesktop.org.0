Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBCB3DCDAF
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 22:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6B16E207;
	Sun,  1 Aug 2021 20:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701C06E207
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 20:24:48 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 87953902-f306-11eb-9082-0050568c148b;
 Sun, 01 Aug 2021 20:24:53 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 1B081194B1A;
 Sun,  1 Aug 2021 22:25:07 +0200 (CEST)
Date: Sun, 1 Aug 2021 22:24:41 +0200
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
Message-ID: <YQcDCVuSM2kLbQcI@ravnborg.org>
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <YQWbWjV5TYzp+5C4@ravnborg.org>
 <d50b3199-20fe-0ecb-ab7d-7425ad1d0f21@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d50b3199-20fe-0ecb-ab7d-7425ad1d0f21@suse.de>
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

> > 
> > 1) IRQ_NOTCONNECTED
> > 
> > We do not have this check in drm_irq today and we should avoid spreading
> > it all over. We are either carrying it forever or we wil lsee patches
> > floating in to drop the check again.
> > The current use in the kernel is minimal:
> > https://elixir.bootlin.com/linux/latest/A/ident/IRQ_NOTCONNECTED
> > 
> > So as a minimum drop it from atmel_hlcdc and preferably from the rest as
> > it is really not used. (Speaking as atmel_hlcdc maintainer)
> 
> I'll drop it from atmel_hlcdc then.
> 
> But saying that it's not used is not correct.
My point is the drm_irq do not check this - so adding this check add
something there was not needed/done before.

> > 2) devm_request_irq()
> > 
> > We are moving towards managed allocation so we do not fail to free
> > resources. And an irq has a lifetime equal the device itself - so an
> > obvious cnadidate for devm_request_irq.
> > If we do not introduce it now we will see a revisit of this later.
> > I can be convinced to wait with this as we will have to do much more in
> > each driver, but I cannot see any good arguments to avoid the more
> > modern way to use devm_request_irq.
> 
> I'll change this in atmel_hdlcd and maybe I can find trivial cases where
> devm_request_irq() can be used. But drivers that had an uninstall callback
> before should not have the cleanup logic altered by a patch as this one. I
> suspect that most of the IRQ cleanup
> is actually a vblank cleanup and should be done in response to
> drm_vblank_init(). But that's again not something for this patchset here. We
> cannot change multiple things at once and still expect any of it to work.
> 
> I welcome the use of devm_ et al. But these changes are better done in a
> per-driver patchset that changes all of the driver to managed release.
Fair enough, and fine with me.
I have yet to read through all patches - will do so in the coming week.

	Sam
