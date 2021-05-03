Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9076371385
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 12:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327FF6E0CA;
	Mon,  3 May 2021 10:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9E76E87F;
 Mon,  3 May 2021 08:00:29 +0000 (UTC)
IronPort-SDR: UAj9ZbMI8tpKbIlWdUa8xF9kyC9XLm595s7d9CbMQXQW3SvJU9Ct+Sy5Cie+T84fJuiDbehLI8
 9ZQSq1vG2Y+Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9972"; a="194546034"
X-IronPort-AV: E=Sophos;i="5.82,268,1613462400"; d="scan'208";a="194546034"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 01:00:28 -0700
IronPort-SDR: 0BtbVBvW4cKwxyUMXLuMNzqQR8eNMkGREOUVxBr1myj9cvQZmdyv3RaoH6saWoxMkb2gW4mAbU
 vEVYOaACypdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,268,1613462400"; d="scan'208";a="530292089"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 03 May 2021 01:00:21 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Mon, 03 May 2021 11:00:20 +0300
Date: Mon, 3 May 2021 11:00:20 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH 4/9] drm/connector: Add support for out-of-band hotplug
 notification
Message-ID: <YI+tlE35i+6F/WUO@kuha.fi.intel.com>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428215257.500088-5-hdegoede@redhat.com>
X-Mailman-Approved-At: Mon, 03 May 2021 10:16:50 +0000
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
 platform-driver-x86@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Wed, Apr 28, 2021 at 11:52:52PM +0200, Hans de Goede wrote:
> +/**
> + * struct drm_connector_oob_hotplug_event_data: OOB hotplug event data
> + *
> + * Contains data about out-of-band hotplug events, signalled through
> + * drm_connector_oob_hotplug_event().
> + */
> +struct drm_connector_oob_hotplug_event_data {
> +	/**
> +	 * @connected: New connected status for the connector.
> +	 */
> +	bool connected;
> +	/**
> +	 * @dp_lanes: Number of available displayport lanes, 0 if unknown.
> +	 */
> +	int dp_lanes;
> +	/**
> +	 * @orientation: Connector orientation.
> +	 */
> +	enum typec_orientation orientation;
> +};

I don't think the orientation is relevant. It will always be "normal"
from DP PoW after muxing, no?

I'm also not sure those deatils are enough in the long run. Based on
what I've understood from our graphics team guys, for example knowing
if multi-function is preferred may be important in some cases.

+Imre.

All of that, and more, is already available in the Configuration VDO
Status VDO that the we have negotiated with the DP partner. Both those
VDOs are part of struct typec_displayport_data. I think we should
simply supply that structure to the DRM code instead of picking those
details out of it...

>  /**
>   * struct drm_tv_connector_state - TV connector related states
>   * @subconnector: selected subconnector
> @@ -1110,6 +1132,15 @@ struct drm_connector_funcs {
>  	 */
>  	void (*atomic_print_state)(struct drm_printer *p,
>  				   const struct drm_connector_state *state);
> +
> +	/**
> +	 * @oob_hotplug_event:
> +	 *
> +	 * This will get called when a hotplug-event for a drm-connector
> +	 * has been received from a source outside the display driver / device.
> +	 */
> +	void (*oob_hotplug_event)(struct drm_connector *connector,
> +				  struct drm_connector_oob_hotplug_event_data *data);

So I would not try to generalise this like that. This callback should
be USB Type-C DP altmode specific:

	void (*oob_hotplug_event)(struct drm_connector *connector,
                                  struct typec_displayport_data *data);

Or like this if the orientation can really be reversed after muxing:

	void (*oob_hotplug_event)(struct drm_connector *connector,
				  struct typec_altmode *altmode,
                                  struct typec_displayport_data *data);

You can now check the orientation separately with
typec_altmode_get_orientation() if necessary.


thanks,

-- 
heikki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
