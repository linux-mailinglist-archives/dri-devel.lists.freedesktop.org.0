Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF95372CC3
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 17:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2B86EB1D;
	Tue,  4 May 2021 15:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6A96EB1C;
 Tue,  4 May 2021 15:10:35 +0000 (UTC)
IronPort-SDR: eQ8i6oo0VmnLpZ0fqOWkIaOlTvTX10NljOgSDXl+gLwnySKDrpYHOKioM/U8FA7bTAI6iI7eOp
 k1+I6l5pA5yw==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="195950528"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="195950528"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 08:10:34 -0700
IronPort-SDR: nLyJdrNp3CNGXSAwYbytKe0ckXjGML1xV1KD42EwKj701NzYv1e0EzfkSWgA11DN4YaWBR70DR
 6krTNmyrau8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="531093933"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 04 May 2021 08:10:30 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 04 May 2021 18:10:29 +0300
Date: Tue, 4 May 2021 18:10:29 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 4/9] drm/connector: Add support for out-of-band hotplug
 notification (v2)
Message-ID: <YJFj5Vk7xOcj+ISZ@kuha.fi.intel.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503154647.142551-5-hdegoede@redhat.com>
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

> +/**
> + * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> + * @connector: connector to report the event on
> + * @data: data related to the event
> + *
> + * On some hardware a hotplug event notification may come from outside the display
> + * driver / device. An example of this is some USB Type-C setups where the hardware
> + * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
> + * status bit to the GPU's DP HPD pin.
> + *
> + * This function can be used to report these out-of-band events after obtaining
> + * a drm_connector reference through calling drm_connector_find_by_fwnode().
> + */
> +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> +				     struct drm_connector_oob_hotplug_event_data *data)
> +{
> +	struct drm_connector *connector;
> +
> +	connector = drm_connector_find_by_fwnode(connector_fwnode);
> +	if (IS_ERR(connector))
> +		return;
> +
> +	if (connector->funcs->oob_hotplug_event)
> +		connector->funcs->oob_hotplug_event(connector, data);
> +
> +	drm_connector_put(connector);
> +}
> +EXPORT_SYMBOL(drm_connector_oob_hotplug_event);

So it does looks like the "data" parameter is not needed at all:

void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
{
	struct drm_connector *connector;

	connector = drm_connector_find_by_fwnode(connector_fwnode);
	if (IS_ERR(connector))
		return;

	if (connector->funcs->oob_hotplug_event)
		connector->funcs->oob_hotplug_event(connector);

	drm_connector_put(connector);
}

thanks,

-- 
heikki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
