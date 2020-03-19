Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD8018C30A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 23:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036276E0D3;
	Thu, 19 Mar 2020 22:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AB86E0D3;
 Thu, 19 Mar 2020 22:38:18 +0000 (UTC)
IronPort-SDR: 09/GnM+i/frUnO0KsQIIjdxlOaxTXn66lev+FQzRbkFN51nvYvLZmQdBMgoxrU/PJY6uVxoSUu
 TwvEQ0JUnbhg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 15:38:17 -0700
IronPort-SDR: iZFdc8tRJT+7U8QnOhspoULD472Rb88r7ky5kDgu/QXVnhLRCP+gS44+inqtySx1jkqQnrDF3m
 am6DFWqwaUkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,573,1574150400"; d="scan'208";a="444753107"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by fmsmga005.fm.intel.com with ESMTP; 19 Mar 2020 15:38:16 -0700
Date: Thu, 19 Mar 2020 15:39:53 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 2/3] drm: Create a drm_connector_helper_funcs hook for
 Adaptive Sync support
Message-ID: <20200319223953.GD11219@intel.com>
References: <20200318063517.3844-1-manasi.d.navare@intel.com>
 <20200318063517.3844-2-manasi.d.navare@intel.com>
 <87y2rwd5ee.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y2rwd5ee.fsf@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 12:07:37PM +0200, Jani Nikula wrote:
> On Tue, 17 Mar 2020, Manasi Navare <manasi.d.navare@intel.com> wrote:
> > This patch adds a hook in drm_connector_helper_funcs to get the
> > support of the driver for adaptive sync functionality.
> >
> > This can be called in the connector probe helper function after
> > the connector detect() and get_modes() hooks to also
> > query the adaptive sync support of the driver.
> =

> I can obviously see that from the patch. But this does not explain at
> all *why* we need another hook to begin with, and why it neeeds to be
> called from ->fill_modes that is set to
> drm_helper_probe_single_connector_modes().
>

This needs to be called after get_modes that ends up populating the
monitor range after parsing the EDID.

I could have just modified the get_modes hook in the driver to set the
vrr capabilities but that doesnt go with the definition of get_modes() hook
which is purely to obtain modes from edid.

So i added a separate hook which will always return the vrr capabilities if=
 this
hook exists in the driver everytime a connector probe happens.

Would you suggest this elsewhere or some other design?
I am open to better placement of this hook or reusing some other hook or
other suggestions for getting the vrr capabilities in the driver

Manasi
 =

> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
> > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > ---
> >  drivers/gpu/drm/drm_probe_helper.c       |  4 ++++
> >  include/drm/drm_modeset_helper_vtables.h | 16 ++++++++++++++++
> >  2 files changed, 20 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_p=
robe_helper.c
> > index 576b4b7dcd89..4403817bfb02 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -482,6 +482,10 @@ int drm_helper_probe_single_connector_modes(struct=
 drm_connector *connector,
> >  =

> >  	count =3D (*connector_funcs->get_modes)(connector);
> >  =

> > +	/* Get the Adaptive Sync Support if helper exists */
> > +	if (*connector_funcs->get_adaptive_sync_support)
> > +		(**connector_funcs->get_adaptive_sync_support)(connector);
> > +
> =

> This is in the middle of a sequence figuring out the modes. First
> ->get_modes, then fallback to other mechanisms. Certainly we don't want
> to do something else in the middle.
> =

> >  	/*
> >  	 * Fallback for when DDC probe failed in drm_get_edid() and thus skip=
ped
> >  	 * override/firmware EDID.
> > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm=
_modeset_helper_vtables.h
> > index 7c20b1c8b6a7..0b203fdd25df 100644
> > --- a/include/drm/drm_modeset_helper_vtables.h
> > +++ b/include/drm/drm_modeset_helper_vtables.h
> > @@ -1079,6 +1079,22 @@ struct drm_connector_helper_funcs {
> >  				     struct drm_writeback_job *job);
> >  	void (*cleanup_writeback_job)(struct drm_writeback_connector *connect=
or,
> >  				      struct drm_writeback_job *job);
> > +
> > +	/**
> > +	 * @get_adaptive_sync_support:
> > +	 *
> > +	 * This hook is used by the probe helper to get the driver's support
> > +	 * for adaptive sync or variable refresh rate.
> > +	 * This is called from drm_helper_probe_single_connector_modes()
> > +	 * This is called after the @get_modes hook so that the connector mod=
es
> > +	 * are already obtained and EDID is parsed to obtain the monitor
> > +	 * range descriptor information.
> > +	 *
> > +	 * This hook is optional and defined only for the drivers and on
> > +	 * connectors that advertise adaptive sync support.
> > +	 *
> > +	 */
> > +	void (*get_adaptive_sync_support)(struct drm_connector *connector);
> >  };
> >  =

> >  /**
> =

> -- =

> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
