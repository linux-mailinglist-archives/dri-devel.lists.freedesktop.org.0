Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3299864EE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 18:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1684E10E713;
	Wed, 25 Sep 2024 16:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p1BvZ1VZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694C510E713
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 16:36:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 375C77E2;
 Wed, 25 Sep 2024 18:34:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1727282084;
 bh=w8SJ75PMeCgEFuEGe+d801zRh1FiK0RxpW5UvU9+MMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p1BvZ1VZU8NqNvU4usiN0aUF0oWWNqsE/HUYKw+oINfkcwWDuPYJo/XVySWlz4lNN
 MmR+tDYjMazIuUVgltKcW5gCKH4zq7BVExqxHdlM5tIDhMRFgSW3ReEjP7iqb4EwbB
 dFn7qKR2uWG7q7solOzlcCDPjRfIqn0pMe+0Vv34=
Date: Wed, 25 Sep 2024 19:36:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steffen Dirkwinkel <lists@steffen.cc>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dpsub: also call
 drm_helper_hpd_irq_event
Message-ID: <20240925163609.GD27666@pendragon.ideasonboard.com>
References: <20240923074803.10306-1-lists@steffen.cc>
 <20240924184335.GJ30551@pendragon.ideasonboard.com>
 <e4626c1d3b28613d1d219c735bcd8525be0f0d9e.camel@dirkwinkel.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4626c1d3b28613d1d219c735bcd8525be0f0d9e.camel@dirkwinkel.cc>
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

Hi Steffen,

On Wed, Sep 25, 2024 at 09:54:18AM +0200, Steffen Dirkwinkel wrote:
> On Tue, 2024-09-24 at 21:43 +0300, Laurent Pinchart wrote:
> > On Mon, Sep 23, 2024 at 09:48:03AM +0200, lists@steffen.cc wrote:
> > > From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
> > > 
> > > With hpd going through the bridge as of commit eb2d64bfcc17
> > > ("drm: xlnx: zynqmp_dpsub: Report HPD through the bridge")
> > > we don't get hotplug events in userspace on zynqmp hardware.
> > > Also sending hotplug events with drm_helper_hpd_irq_event works.
> > 
> > Why does the driver need to call both drm_helper_hpd_irq_event() and
> > drm_bridge_hpd_notify() ? The latter should end up calling
> > drm_kms_helper_connector_hotplug_event(), which is the same function
> > that drm_helper_hpd_irq_event() calls.
> 
> I don't know why we need drm_helper_hpd_irq_event.
> I'll try to trace what happens on hotplug.

Thank you. Let's try to find the best solution based on your findings.

> > > Fixes: eb2d64bfcc17 ("drm: xlnx: zynqmp_dpsub: Report HPD through
> > > the bridge")
> > > Signed-off-by: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
> > > ---
> > >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > index 1846c4971fd8..cb823540a412 100644
> > > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > @@ -17,6 +17,7 @@
> > >  #include <drm/drm_fourcc.h>
> > >  #include <drm/drm_modes.h>
> > >  #include <drm/drm_of.h>
> > > +#include <drm/drm_probe_helper.h>
> > >  
> > >  #include <linux/clk.h>
> > >  #include <linux/delay.h>
> > > @@ -1614,6 +1615,9 @@ static void zynqmp_dp_hpd_work_func(struct
> > > work_struct *work)
> > >  					    hpd_work.work);
> > >  	enum drm_connector_status status;
> > >  
> > > +	if (dp->bridge.dev)
> > > +		drm_helper_hpd_irq_event(dp->bridge.dev);
> > > +
> > >  	status = zynqmp_dp_bridge_detect(&dp->bridge);
> > >  	drm_bridge_hpd_notify(&dp->bridge, status);
> > >  }

-- 
Regards,

Laurent Pinchart
