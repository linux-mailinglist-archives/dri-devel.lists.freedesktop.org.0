Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACC840B2E9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 17:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDAA89EF7;
	Tue, 14 Sep 2021 15:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F1D89EF7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 15:19:28 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 1f7e259b-156f-11ec-a02a-0050568c148b;
 Tue, 14 Sep 2021 15:19:15 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id E946A194C00;
 Tue, 14 Sep 2021 17:19:12 +0200 (CEST)
Date: Tue, 14 Sep 2021 17:19:18 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, linux-rpi-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/probe-helper: Create a HPD IRQ event helper
 for a single connector
Message-ID: <YUC9dsgz6siHYVGD@ravnborg.org>
References: <20210914101724.266570-1-maxime@cerno.tech>
 <20210914101724.266570-2-maxime@cerno.tech>
 <YUB8c2If+E851x4A@ravnborg.org>
 <20210914150641.dzyioa3wkoyv2o7k@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914150641.dzyioa3wkoyv2o7k@gilmour>
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

On Tue, Sep 14, 2021 at 05:06:41PM +0200, Maxime Ripard wrote:
> Hi Sam,
> 
> On Tue, Sep 14, 2021 at 12:41:55PM +0200, Sam Ravnborg wrote:
> > On Tue, Sep 14, 2021 at 12:17:23PM +0200, Maxime Ripard wrote:
> > > The drm_helper_hpd_irq_event() function is iterating over all the
> > > connectors when an hotplug event is detected.
> > > 
> > > During that iteration, it will call each connector detect function and
> > > figure out if its status changed.
> > > 
> > > Finally, if any connector changed, it will notify the user-space and the
> > > clients that something changed on the DRM device.
> > > 
> > > This is supposed to be used for drivers that don't have a hotplug
> > > interrupt for individual connectors. However, drivers that can use an
> > > interrupt for a single connector are left in the dust and can either
> > > reimplement the logic used during the iteration for each connector or
> > > use that helper and iterate over all connectors all the time.
> > > 
> > > Since both are suboptimal, let's create a helper that will only perform
> > > the status detection on a single connector.
> > > 
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > 
> > > ---
> > > Changes from v2:
> > >   - Skip connectors with DRM_CONNECTOR_POLL_HPD in drm_helper_hpd_irq_event
> > >   - Add drm_connector_helper_hpd_irq_event returned value documentation
> > >   - Improve logging
> > > 
> > > Changes from v1:
> > >   - Rename the shared function
> > >   - Move the hotplug event notification out of the shared function
> > >   - Added missing locks
> > >   - Improve the documentation
> > >   - Switched to drm_dbg_kms
> > > ---
> > >  drivers/gpu/drm/drm_probe_helper.c | 117 +++++++++++++++++++++--------
> > >  include/drm/drm_probe_helper.h     |   1 +
> > >  2 files changed, 87 insertions(+), 31 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> > > index 5b77fb5c1a32..a1ffc0c30b3a 100644
> > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > @@ -795,6 +795,87 @@ void drm_kms_helper_poll_fini(struct drm_device *dev)
> > >  }
> > >  EXPORT_SYMBOL(drm_kms_helper_poll_fini);
> > >  
> > > +static bool check_connector_changed(struct drm_connector *connector)
> > > +{
> > > +	struct drm_device *dev = connector->dev;
> > > +	enum drm_connector_status old_status;
> > > +	u64 old_epoch_counter;
> > > +	bool changed = false;
> > > +
> > > +	/* Only handle HPD capable connectors. */
> > > +	drm_WARN_ON(dev, !(connector->polled & DRM_CONNECTOR_POLL_HPD));
> >
> > This will WARN if DRM_CONNECTOR_POLL_HPD is not set - which the previous
> > code did not. I am not sure this is intentional.
> > Or have I missed something?
> 
> Sorry, I misunderstood your previous comment and thought you wanted to
> skip the !HPD connectors in the drm_helper_hpd_irq_event loop.
> 
> What do you think would be the proper scenario here? Just return false?
Re-reading the patch it looks good.
I missed that the check is no longer deleted - and it is now done
exactly as I thought it should be.

So patch is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

