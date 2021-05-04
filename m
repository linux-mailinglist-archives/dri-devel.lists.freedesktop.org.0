Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E25372A6D
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 14:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63D76EAD2;
	Tue,  4 May 2021 12:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0B36E214;
 Tue,  4 May 2021 12:53:43 +0000 (UTC)
IronPort-SDR: dRLt5zsiCrzGUaXaBj2ccy5pb3cDKUaackp5UAC4bC0WOMEfy7sYyq8rQfTApNajuihC0VUvct
 cjYJHUNSuLhg==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="194833005"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="194833005"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 05:53:42 -0700
IronPort-SDR: fvSVcDAH5DChXuddF2Etdns2q6zsCelkGeI2GKbJcmhMRZ6EM5GgqaG3qgRufd6/pPEb7L4x3M
 LA22KC8Y9dug==
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="433268052"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 05:53:38 -0700
Date: Tue, 4 May 2021 15:53:35 +0300
From: Imre Deak <imre.deak@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 4/9] drm/connector: Add support for out-of-band hotplug
 notification
Message-ID: <20210504125335.GA30246@ideak-desk.fi.intel.com>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-5-hdegoede@redhat.com>
 <YI+tlE35i+6F/WUO@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YI+tlE35i+6F/WUO@kuha.fi.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 03, 2021 at 11:00:20AM +0300, Heikki Krogerus wrote:
> Hi Hans,
> 
> On Wed, Apr 28, 2021 at 11:52:52PM +0200, Hans de Goede wrote:
> > +/**
> > + * struct drm_connector_oob_hotplug_event_data: OOB hotplug event data
> > + *
> > + * Contains data about out-of-band hotplug events, signalled through
> > + * drm_connector_oob_hotplug_event().
> > + */
> > +struct drm_connector_oob_hotplug_event_data {
> > +	/**
> > +	 * @connected: New connected status for the connector.
> > +	 */
> > +	bool connected;
> > +	/**
> > +	 * @dp_lanes: Number of available displayport lanes, 0 if unknown.
> > +	 */
> > +	int dp_lanes;
> > +	/**
> > +	 * @orientation: Connector orientation.
> > +	 */
> > +	enum typec_orientation orientation;
> > +};
> 
> I don't think the orientation is relevant. It will always be "normal"
> from DP PoW after muxing, no?
> 
> I'm also not sure those deatils are enough in the long run. Based on
> what I've understood from our graphics team guys, for example knowing
> if multi-function is preferred may be important in some cases.

Combo PHY ports - which is what this patchset is adding the notification
for - can only reverse the lane assignment. TypeC PHY ports (on ICL+)
have a more C-type aware mux in the SoC (FIA) as well, so in theory we
could have a system based on such platforms with an external mux only
switching between the USB, DP, USB+DP (MFD) modes, but leaving the plug
orientation specific muxing up to the FIA. The graphics driver is not
involved in programming the FIA though, it's done by a firmware
component, so I don't think this configuration needs to get passed.

Yes, the driver needs to know if the PD controller configured the sink
in the MFD mode (DP+USB) or in the DP-only mode. For that the number of
lanes assigned to DP is enough.

> +Imre.
> 
> All of that, and more, is already available in the Configuration VDO
> Status VDO that the we have negotiated with the DP partner. Both those
> VDOs are part of struct typec_displayport_data. I think we should
> simply supply that structure to the DRM code instead of picking those
> details out of it...
> 
> >  /**
> >   * struct drm_tv_connector_state - TV connector related states
> >   * @subconnector: selected subconnector
> > @@ -1110,6 +1132,15 @@ struct drm_connector_funcs {
> >  	 */
> >  	void (*atomic_print_state)(struct drm_printer *p,
> >  				   const struct drm_connector_state *state);
> > +
> > +	/**
> > +	 * @oob_hotplug_event:
> > +	 *
> > +	 * This will get called when a hotplug-event for a drm-connector
> > +	 * has been received from a source outside the display driver / device.
> > +	 */
> > +	void (*oob_hotplug_event)(struct drm_connector *connector,
> > +				  struct drm_connector_oob_hotplug_event_data *data);
> 
> So I would not try to generalise this like that. This callback should
> be USB Type-C DP altmode specific:
> 
> 	void (*oob_hotplug_event)(struct drm_connector *connector,
>                                   struct typec_displayport_data *data);
> 
> Or like this if the orientation can really be reversed after muxing:
> 
> 	void (*oob_hotplug_event)(struct drm_connector *connector,
> 				  struct typec_altmode *altmode,
>                                   struct typec_displayport_data *data);
> 
> You can now check the orientation separately with
> typec_altmode_get_orientation() if necessary.
> 
> 
> thanks,
> 
> -- 
> heikki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
