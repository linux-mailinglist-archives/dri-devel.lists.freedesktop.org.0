Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1574834512B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 21:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2715C6E5B4;
	Mon, 22 Mar 2021 20:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1486E5B4;
 Mon, 22 Mar 2021 20:51:51 +0000 (UTC)
IronPort-SDR: fKGwnLKcLq3xwrzMUhk1hJCGmeLKbkrF42PvoFJduIzH/LzUJaH0we2BfNu1MqETHvO3VMODKg
 5JGkX7hmYiSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="190373947"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="190373947"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 13:51:50 -0700
IronPort-SDR: 9rD+cPZNNn/jiw3DxHGciMk7J0kZvRlVXCTtRJlRI5EQ2r2fXy7DCWHdpYPL2zNta549kgMuJa
 XhEPTZYcFuuA==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="390619153"
Received: from hhchau-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.212.137.90])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 13:51:49 -0700
Date: Mon, 22 Mar 2021 16:51:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display/vlv_dsi: Do no shut down
 displays on reboot if a DSI panel is used
Message-ID: <YFkDYzN0NJ3Co8bT@intel.com>
References: <20210301154347.50052-1-hdegoede@redhat.com>
 <8d882647-bab3-dfc3-70ad-4f1910dcb5af@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d882647-bab3-dfc3-70ad-4f1910dcb5af@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 04:45:32PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 3/1/21 4:43 PM, Hans de Goede wrote:
> > After the recently added commit fe0f1e3bfdfe ("drm/i915: Shut down
> > displays gracefully on reboot"), the DSI panel on a Cherry Trail based
> > Predia Basic tablet would no longer properly light up after reboot.
> > 
> > The backlight still turns back on after reboot, but the LCD shows an
> > all black display. The display is also all black during the time that
> > EFI / the GOP is managing it, so e.g. the grub menu also is not visible.
> > 
> > In this scenario the panel is initialized so that it appears to be working
> > and the fastboot code skips doing a modeset. Forcing a modeset by doing a
> > chvt to a text-console over ssh followed by echo-ing 1 and then 0 to
> > /sys/class/graphics/fb0/blank causes the panel to work again.
> > 
> > Add a QUIRK_SKIP_SHUTDOWN quirk which turns i915_driver_shutdown() into
> > a no-op when set; and set this on vlv/chv devices when a DSI panel is
> > detected, to work around this.
> > 
> > Admittedly this is a bit of a big hammer, but these platforms have been
> > around for quite some time now and they have always worked fine without
> > the new behavior to shutdown everything on shutdown/reboot. This approach
> > simply disables the recently introduced new shutdown behavior in this
> > specific case where it is known to cause problems. Which is a nice and
> > simple way to deal with this.
> > 
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Ping? Since sending this patch I've been seeing the issue addressed by
> this on variour other CHT based devices too.
> 
> So we have various devices suffering from a black screen after reboot
> now. This is pretty serious usability regression.
> 
> As such it would be good to get this reviewed, or another fix proposed.

For the quirks we try to limit them to very specific vendor and model ids,
so I wonder if it would be possible to get this information in here instead
to all the vlv with dsi...

Or avoid the quirk "infra" and skip to all vlv with active dsi?!

Jani?
Ville?

> 
> Regards,
> 
> Hans
> 
> 
> 
> > ---
> >  drivers/gpu/drm/i915/display/vlv_dsi.c | 3 +++
> >  drivers/gpu/drm/i915/i915_drv.c        | 3 +++
> >  drivers/gpu/drm/i915/i915_drv.h        | 1 +
> >  3 files changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> > index f94025ec603a..792ef868b6af 100644
> > --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> > +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> > @@ -1949,6 +1949,9 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
> >  
> >  	vlv_dsi_add_properties(intel_connector);
> >  
> > +	/* Some BIOS-es fail to re-init the DSI panel on reboot if we turn it off */
> > +	dev_priv->quirks |= QUIRK_SKIP_SHUTDOWN;
> > +
> >  	return;
> >  
> >  err_cleanup_connector:
> > diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> > index 8e9cb44e66e5..92f2af55af6d 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.c
> > +++ b/drivers/gpu/drm/i915/i915_drv.c
> > @@ -1048,6 +1048,9 @@ static void intel_shutdown_encoders(struct drm_i915_private *dev_priv)
> >  
> >  void i915_driver_shutdown(struct drm_i915_private *i915)
> >  {
> > +	if (i915->quirks & QUIRK_SKIP_SHUTDOWN)
> > +		return;
> > +
> >  	disable_rpm_wakeref_asserts(&i915->runtime_pm);
> >  
> >  	i915_gem_suspend(i915);
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index 26d69d06aa6d..272cd7cb22d4 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -517,6 +517,7 @@ struct i915_psr {
> >  #define QUIRK_PIN_SWIZZLED_PAGES (1<<5)
> >  #define QUIRK_INCREASE_T12_DELAY (1<<6)
> >  #define QUIRK_INCREASE_DDI_DISABLED_TIME (1<<7)
> > +#define QUIRK_SKIP_SHUTDOWN (1<<8)
> >  
> >  struct intel_fbdev;
> >  struct intel_fbc_work;
> > 
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
