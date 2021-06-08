Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D23FB39EE90
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 08:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69126EAA8;
	Tue,  8 Jun 2021 06:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87546EA1C;
 Tue,  8 Jun 2021 06:12:13 +0000 (UTC)
IronPort-SDR: F3rqjgr5s7EDsfy7e66/xemqtSb2XHjw0mq7CJd1vv096vwVU3ZBs1Ct7xVn4FxTm3/wJWMgf1
 QTZY9ObekwTA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="201760557"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="201760557"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 23:12:13 -0700
IronPort-SDR: whekhH+DUY/L22S5XiQsTkHvvJod+1Jj3xQiVW1tsjKQSjaC4sRJHyZGYR8ZUEaVAP8Sdj+7EQ
 ig9yJmLawE3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="481822230"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 07 Jun 2021 23:12:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 08 Jun 2021 09:12:06 +0300
Date: Tue, 8 Jun 2021 09:12:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH 2/4] drm/uAPI: Add "active bpc" as feedback channel for
 "max bpc" drm property
Message-ID: <YL8KNshbrHt3FBFa@intel.com>
References: <20210604171723.10276-1-wse@tuxedocomputers.com>
 <20210604171723.10276-3-wse@tuxedocomputers.com>
 <YLpiVFiBrgH29rki@intel.com>
 <bef099db-f662-9005-6e36-ce056257f537@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bef099db-f662-9005-6e36-ce056257f537@tuxedocomputers.com>
X-Patchwork-Hint: comment
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 07, 2021 at 08:46:47AM +0200, Werner Sembach wrote:
> 
> Am 04.06.21 um 19:26 schrieb Ville Syrjälä:
> > On Fri, Jun 04, 2021 at 07:17:21PM +0200, Werner Sembach wrote:
> >> Add a new general drm property "active bpc" which can be used by graphic drivers
> >> to report the applied bit depth per pixel back to userspace.
> >>
> >> While "max bpc" can be used to change the color depth, there was no way to check
> >> which one actually got used. While in theory the driver chooses the best/highest
> >> color depth within the max bpc setting a user might not be fully aware what his
> >> hardware is or isn't capable off. This is meant as a quick way to double check
> >> the setup.
> >>
> >> In the future, automatic color calibration for screens might also depend on this
> >> information available.
> >>
> >> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> >> ---
> >>   drivers/gpu/drm/drm_atomic_uapi.c |  2 ++
> >>   drivers/gpu/drm/drm_connector.c   | 40 +++++++++++++++++++++++++++++++
> >>   include/drm/drm_connector.h       | 15 ++++++++++++
> >>   3 files changed, 57 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> >> index 268bb69c2e2f..7ae4e40936b5 100644
> >> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> >> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> >> @@ -873,6 +873,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
> >>   		*val = 0;
> >>   	} else if (property == connector->max_bpc_property) {
> >>   		*val = state->max_requested_bpc;
> >> +	} else if (property == connector->active_bpc_property) {
> >> +		*val = state->active_bpc;
> >>   	} else if (connector->funcs->atomic_get_property) {
> >>   		return connector->funcs->atomic_get_property(connector,
> >>   				state, property, val);
> >> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> >> index 7631f76e7f34..5f42a5be5822 100644
> >> --- a/drivers/gpu/drm/drm_connector.c
> >> +++ b/drivers/gpu/drm/drm_connector.c
> >> @@ -1195,6 +1195,13 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
> >>    *	drm_connector_attach_max_bpc_property() to create and attach the
> >>    *	property to the connector during initialization.
> >>    *
> >> + * active bpc:
> >> + *	This read-only range property is used by userspace check the bit depth
> >> + *	actually applied by the GPU driver after evaluation all hardware
> >> + *	capabilities and max bpc. Drivers to use the function
> >> + *	drm_connector_attach_active_bpc_property() to create and attach the
> >> + *	property to the connector during initialization.
> >> + *
> >>    * Connectors also have one standardized atomic property:
> >>    *
> >>    * CRTC_ID:
> >> @@ -2150,6 +2157,39 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
> >>   }
> >>   EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
> >>   
> >> +/**
> >> + * drm_connector_attach_active_bpc_property - attach "active bpc" property
> >> + * @connector: connector to attach active bpc property on.
> >> + * @min: The minimum bit depth supported by the connector.
> >> + * @max: The maximum bit depth supported by the connector.
> >> + *
> >> + * This is used to check the applied bit depth on a connector.
> >> + *
> >> + * Returns:
> >> + * Zero on success, negative errno on failure.
> >> + */
> >> +int drm_connector_attach_active_bpc_property(struct drm_connector *connector,
> >> +					  int min, int max)
> >> +{
> >> +	struct drm_device *dev = connector->dev;
> >> +	struct drm_property *prop;
> >> +
> >> +	prop = connector->active_bpc_property;
> >> +	if (!prop) {
> >> +		prop = drm_property_create_range(dev, 0, "active bpc", min, max);
> > Should be immutable.
> Yes. I didn't know if there is a way to do this (or just don't define a 
> set-function), but I think I found the define for this.
> >
> > Also wondering what the semantics of this should be when eg. DSC
> > is active?
> I'm unfamiliar how the inner workings of DSC (I guess Display Stream 
> Compression?) are. But doesn't it also have color depth?

Some number of bits go into the compressor, smaller/equal number
of bits come out. Not sure if the choice of the input bpc affects
what the sink does when decompressing or not.

> 
> The active bpc should be what the GPU tells the display to actually show 
> the user when he looks at just one pixel.
> 
> So dithering computed on the host should not be included (aka when the 
> gpu sends a premade picture to the screen and tells it the lesser pbc), 
> while FRC dithering computed in the display firmware should be included 
> (since the GPU can't really tell the difference between FRC displays and 
> True 10-Bit displays, can't it?)

Not sure. Haven't checked if there's something in some standard for
that.

-- 
Ville Syrjälä
Intel
