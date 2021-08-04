Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3E13E07AB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 20:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED235893EB;
	Wed,  4 Aug 2021 18:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E2A6E434
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 18:33:36 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 8496dbbf-f552-11eb-8d1a-0050568cd888;
 Wed, 04 Aug 2021 18:33:52 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 365E9194B00;
 Wed,  4 Aug 2021 20:33:58 +0200 (CEST)
Date: Wed, 4 Aug 2021 20:33:30 +0200
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
 jyri.sarha@iki.fi, tomba@kernel.org, Dan.Sneddon@microchip.com,
 tomi.valkeinen@ideasonboard.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 11/14] drm/tilcdc: Convert to Linux IRQ interfaces
Message-ID: <YQrdelvqiiv6On8r@ravnborg.org>
References: <20210803090704.32152-1-tzimmermann@suse.de>
 <20210803090704.32152-12-tzimmermann@suse.de>
 <YQlZ+EQVbO9N3Mla@ravnborg.org>
 <896793e5-f5a8-fe74-1d8f-3dd1450d3fae@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <896793e5-f5a8-fe74-1d8f-3dd1450d3fae@suse.de>
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
On Wed, Aug 04, 2021 at 08:30:41PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.08.21 um 17:00 schrieb Sam Ravnborg:
> > Hi Thomas,
> > 
> > On Tue, Aug 03, 2021 at 11:07:01AM +0200, Thomas Zimmermann wrote:
> > > Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> > > IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> > > don't benefit from using it.
> > > 
> > > DRM IRQ callbacks are now being called directly or inlined.
> > > 
> > > Calls to platform_get_irq() can fail with a negative errno code.
> > > Abort initialization in this case. The DRM IRQ midlayer does not
> > > handle this case correctly.
> > 
> > I cannot see why the irq_enabled flag is needed here, and the changelog
> > do not help me.
> > What do I miss?
> 
> That's a good point. Usually, only the DRM IRQ helpers use irq_enabled in
> struct drm_device. It'll become legacy and we can ignore it for the driver
> conversion.
> 
> The exception is tilcdc, which also uses irq_enabled to make its error
> rollback work correctly. So I duplicated the state in the local private
> structure.
> 
> I'll add this explanation to the commit message.
With this added:
Acked-by: Sam Ravnborg <sam@ravnborg.org>
