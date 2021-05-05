Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F729373820
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 11:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBE26E116;
	Wed,  5 May 2021 09:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4481C6E116;
 Wed,  5 May 2021 09:50:55 +0000 (UTC)
IronPort-SDR: /mHbGW+kG99X7rWbiA08t2NZgnz6Iiezpy194/I+1HBjfnJLNr2KJ4uuPjdSGh19tvT/WhDA83
 keMh8rd1MSXw==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="196135725"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="196135725"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 02:50:54 -0700
IronPort-SDR: KmhCI3dzVEZ+ZbXjihfmYAKWqO9AFO7gzEVcFElUZ26IIHJ9fT/4SnE8b2p+bkRvMpbu26xskr
 gSWYHZXXc6qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="531649779"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 05 May 2021 02:50:50 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Wed, 05 May 2021 12:50:49 +0300
Date: Wed, 5 May 2021 12:50:49 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 4/9] drm/connector: Add support for out-of-band hotplug
 notification (v2)
Message-ID: <YJJqeVzS8do3F8wx@kuha.fi.intel.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-5-hdegoede@redhat.com>
 <YJFj5Vk7xOcj+ISZ@kuha.fi.intel.com>
 <326621fe-cc4e-ad77-c87e-922a655bfbc8@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <326621fe-cc4e-ad77-c87e-922a655bfbc8@redhat.com>
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

On Tue, May 04, 2021 at 05:35:49PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 5/4/21 5:10 PM, Heikki Krogerus wrote:
> >> +/**
> >> + * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> >> + * @connector: connector to report the event on
> >> + * @data: data related to the event
> >> + *
> >> + * On some hardware a hotplug event notification may come from outside the display
> >> + * driver / device. An example of this is some USB Type-C setups where the hardware
> >> + * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
> >> + * status bit to the GPU's DP HPD pin.
> >> + *
> >> + * This function can be used to report these out-of-band events after obtaining
> >> + * a drm_connector reference through calling drm_connector_find_by_fwnode().
> >> + */
> >> +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> >> +				     struct drm_connector_oob_hotplug_event_data *data)
> >> +{
> >> +	struct drm_connector *connector;
> >> +
> >> +	connector = drm_connector_find_by_fwnode(connector_fwnode);
> >> +	if (IS_ERR(connector))
> >> +		return;
> >> +
> >> +	if (connector->funcs->oob_hotplug_event)
> >> +		connector->funcs->oob_hotplug_event(connector, data);
> >> +
> >> +	drm_connector_put(connector);
> >> +}
> >> +EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
> > 
> > So it does looks like the "data" parameter is not needed at all:
> 
> Well Imre did indicate that having the number of lanes is useful, so
> for the next version I'll drop the orientation but I plan to keep
> the number of lanes if that is ok with you.
> 
> Not having passing along this info was one of the reasons why my
> previous attempt at this was nacked, so dropping it all together
> feels wrong.

If you need to pass any information to the function, then you need to
pass all the information that we have. Don't start with abstraction.
First create a dedicated API, and then, only if we really have another
user for it, we can add an abstraction layer that both users can use.
All cases are going to be different. We don't know how the abstraction
/ generalisation should look like before we have at least two real
users (ideally more than two, actually). Right now we can not even say
for sure that generalising the API is even possible.

I would not make a huge deal out of this unless I wasn't myself being
told by guys like Greg KH in the past to drop my attempts to
"generalize" things from the beginning when I only had a single user.
By doing so you'll not only force all ends, the source of the data
(the typec drivers in this case) as well as the consumer (i915), to be
always changed together, it will also confuse things. We are not
always going to be able to tell the lane count for example like we can
with USB Type-C, so i915 can't really rely on that information.

Right now we also don't know what exact details i915 (or what ever GPU
driver) needs. We can only say for sure that some details are going to
be needed. Trying to guess and cherry-pick the details now does not
makes sense because of that reason too.

So just make this API USB Type-C DP Alt Mode specific API first, and
supply it everything we have.


thanks,

-- 
heikki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
