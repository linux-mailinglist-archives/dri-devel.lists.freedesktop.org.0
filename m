Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0C4372C8E
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 16:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719076EB19;
	Tue,  4 May 2021 14:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEF46EB18;
 Tue,  4 May 2021 14:52:46 +0000 (UTC)
IronPort-SDR: 2FwWEaRAuYXWlAQnBIhebDW2RHZETqmZ/OUiqT7W7DSFnoBENGui1hyQ/GQYEG4SSHL0jzKW7e
 BMaVo9Ou2KOg==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="185464133"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="185464133"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 07:52:45 -0700
IronPort-SDR: vU+uxj5bo8hDLN6NcpjGw6Pky+yuJ7aER+QDsY62qHxO4ixpBbwju6LlsRENQoKe/I1++IH5Mj
 l8zTA6jmHa8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="531087248"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 04 May 2021 07:52:40 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 04 May 2021 17:52:40 +0300
Date: Tue, 4 May 2021 17:52:40 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 4/9] drm/connector: Add support for out-of-band hotplug
 notification
Message-ID: <YJFfuF3UGP0TZrVw@kuha.fi.intel.com>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-5-hdegoede@redhat.com>
 <YI+tlE35i+6F/WUO@kuha.fi.intel.com>
 <00e380b2-0376-0ddb-9b0e-342779b7fc06@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00e380b2-0376-0ddb-9b0e-342779b7fc06@redhat.com>
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
 platform-driver-x86@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 03, 2021 at 04:35:29PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 5/3/21 10:00 AM, Heikki Krogerus wrote:
> > Hi Hans,
> > 
> > On Wed, Apr 28, 2021 at 11:52:52PM +0200, Hans de Goede wrote:
> >> +/**
> >> + * struct drm_connector_oob_hotplug_event_data: OOB hotplug event data
> >> + *
> >> + * Contains data about out-of-band hotplug events, signalled through
> >> + * drm_connector_oob_hotplug_event().
> >> + */
> >> +struct drm_connector_oob_hotplug_event_data {
> >> +	/**
> >> +	 * @connected: New connected status for the connector.
> >> +	 */
> >> +	bool connected;
> >> +	/**
> >> +	 * @dp_lanes: Number of available displayport lanes, 0 if unknown.
> >> +	 */
> >> +	int dp_lanes;
> >> +	/**
> >> +	 * @orientation: Connector orientation.
> >> +	 */
> >> +	enum typec_orientation orientation;
> >> +};
> > 
> > I don't think the orientation is relevant. It will always be "normal"
> > from DP PoW after muxing, no?
> 
> That is what I thought to, but during the discussion of my previous attempt
> at this one of the i915 devs mentioned that in some cases the muxes manage
> to swap the lane order when the connector upside-down and at least the
> Intel GPUs can correct for this on the GPU side, so they asked for this
> info to be included.
> 
> > I'm also not sure those deatils are enough in the long run. Based on
> > what I've understood from our graphics team guys, for example knowing
> > if multi-function is preferred may be important in some cases.
> 
> The current data being passed is just intended as a starting point,
> this is purely a kernel internal API so we can easily add more
> data to the struct. As I mentioned in the cover-letter the current
> oob_hotplug handler which the i915 patch adds to the i915 driver does
> not actually do anything with the data.  ATM it is purely there to
> demonstrate that the ability to pass relevant data is there now
> (which was an issue with the previous attempt). I believe the current
> code is fine as a PoC of "pass event data" once GPU drivers actually
> start doing something with the data we can extend or outright replace
> it without issues.

Ah, if there is nothing using that information yet, then just don't
pass it at all for now. As you said, it's kernel internal API, we can
change it later if needed.

> > All of that, and more, is already available in the Configuration VDO
> > Status VDO that the we have negotiated with the DP partner. Both those
> > VDOs are part of struct typec_displayport_data. I think we should
> > simply supply that structure to the DRM code instead of picking those
> > details out of it...
> 
> I'm not sure I like the idea of passing the raw VDO, but if the
> DRM folks think that would be useful we can certainly add it.

Why are you against passing all the data that we have? What is the
benefit in picking only certain details out of an object that has a
standard format, and constructing a customised object for those
details instead?


thanks,

-- 
heikki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
