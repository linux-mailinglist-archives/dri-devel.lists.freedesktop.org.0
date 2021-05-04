Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A84A0372CDF
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 17:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451E76E23B;
	Tue,  4 May 2021 15:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F9E6EB29;
 Tue,  4 May 2021 15:22:47 +0000 (UTC)
IronPort-SDR: +JMgtFzb7FYHmISJs6SdtE/EeuotpfDK7cvtckkN+RkHQpZpK043qeCt8aUWEDxHAs+4CfTq++
 DG0ZZQyYq2fg==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="218814414"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="218814414"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 08:22:47 -0700
IronPort-SDR: c2tsf9ETkTY+3YKRnCCN6uOZvrJUlwLHly8GXAmCTUjnCwymTJN/h9YUz7Qnjtjs0kbBiRRYJ1
 hN9w20VMjdOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="531099326"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 04 May 2021 08:22:43 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 04 May 2021 18:22:42 +0300
Date: Tue, 4 May 2021 18:22:42 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/9] drm + usb-type-c: Add support for out-of-band
 hotplug notification (v2)
Message-ID: <YJFmwpdLQghdvkga@kuha.fi.intel.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503154647.142551-1-hdegoede@redhat.com>
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

On Mon, May 03, 2021 at 05:46:38PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of my work on making DP over Type-C work on devices where the
> Type-C controller does not drive the HPD pin on the GPU, but instead
> we need to forward HPD events from the Type-C controller to the DRM driver.
> 
> Changes in v2:
> - Replace the bogus "drm/connector: Make the drm_sysfs connector->kdev
>   device hold a reference to the connector" patch with:
>   "drm/connector: Give connector sysfs devices there own device_type"
>   the new patch is a dep for patch 2/9 see the patches
> 
> - Stop using a class-dev-iter, instead at a global connector list
>   to drm_connector.c and use that to find the connector by the fwnode,
>   similar to how we already do this in drm_panel.c and drm_bridge.c
> 
> - Make drm_connector_oob_hotplug_event() take a fwnode pointer as
>   argument, rather then a drm_connector pointer and let it do the
>   lookup itself. This allows making drm_connector_find_by_fwnode() a
>   drm-internal function and avoids code outside the drm subsystem
>   potentially holding on the a drm_connector reference for a longer
>   period.
> 
> This series not only touches drm subsys files but it also touches
> drivers/usb/typec/altmodes/typec_displayport.c, that file usually
> does not see a whole lot of changes. So I believe it would be best
> to just merge the entire series through drm-misc, Assuming we can
> get an ack from Greg for merging the typec_displayport.c changes
> this way.
> 
> ### 
> 
> As already mentioned in the v1 cover-letter this series replaces
> a previous attempt from quite some time ago. 
> For anyone interested here are the old (2019!) patches for this:
> 
> https://patchwork.freedesktop.org/patch/288491/
> https://patchwork.freedesktop.org/patch/288493/
> https://patchwork.freedesktop.org/patch/288495/
> 
> Last time I posted this the biggest change requested was for more info to
> be included in the event send to the DRM-subsystem, specifically sending
> the following info was requested:
> 
> 1. Which DP connector on the GPU the event is for
> 2. How many lanes are available
> 3. Connector orientation
> 
> This series is basically an entirely new approach, which no longer
> uses the notifier framework at all. Instead the Type-C code looksup
> a connector based on a fwnode (this was suggested by Heikki Krogerus)
> and then calls a new oob_hotplug_event drm_connector_func directly
> on the connector, passing the requested info as argument.
> 
> Info such as the orientation and the number of dp-lanes is now passed
> to the drm_connector_oob_hotplug_event() function as requested in the
> review of the old code, but nothing is done with it for now.
> Using this info falls well outside of my knowledge of the i915 driver
> so this is left to a follow-up patch (I will be available to test
> patches for this).

Thanks for taking care of these! It's really great that you spent the
time to do this series. I'm already thinking about what we can add
after these are in. I think support for re-configuration, so support
for changing the pin-configuration in runtime is going to be needed
soon after these. But first things first (sorry, I'm getting ahead of
myself).


thanks,

-- 
heikki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
