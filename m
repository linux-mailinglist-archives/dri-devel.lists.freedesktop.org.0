Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252AB631DD6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 11:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E00010E1A7;
	Mon, 21 Nov 2022 10:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EB210E1A4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 10:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669025474; x=1700561474;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3PSOM4S3o1YjG9zFLfF1qbHWEVgNTxGOoPxNHnw1cLU=;
 b=UXSm+jHtshixmWKESV4/G+ltAejV9wCpl1zqe3etQopfwgzz0bo1Hkuy
 rnpiLZW/3ayUXPZOegy+UUIG6JnXg6n4nMpRRU0CbW3TYIdUUmLg+BHEr
 RrUCz6S0N2yILZQnBBQCf3ZNCSPZc5J8XFY0QzQlrsFqqvG/jtzno7R8w
 Foh+yLM1S51vjNnc11R6jrCuvyiuRkH0swabBAGO6HE9AnL5nnoTCf25H
 CBUAWTv5zAAvpdLy5h404c81fvkcI9QNivJZuZ+yLD83Kn08rtLx+6EqD
 Gm3f5bxLfcmKvIxHG++bxaYrn7JlhLZ54wzxOVz4F19uedlhZW4pB9gq/ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="293913254"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="293913254"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 02:10:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="729955054"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="729955054"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 02:10:49 -0800
Date: Mon, 21 Nov 2022 11:10:47 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: DRM-managed resources / devm_drm_dev_alloc leaking resources
Message-ID: <20221121101047.GA648920@linux.intel.com>
References: <20221117165311.vovrc7usy4efiytl@houat>
 <20221118161558.ym7sif4tkr5srk2b@houat>
 <Y3i6hi71mh18miHs@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3i6hi71mh18miHs@phenom.ffwll.local>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Sat, Nov 19, 2022 at 12:14:14PM +0100, Daniel Vetter wrote:
> On Fri, Nov 18, 2022 at 05:15:58PM +0100, Maxime Ripard wrote:
> > Hi,
> > 
> > Javier and I looked into it some more today, and I think we have a
> > better idea of what is going on.
> > 
> > On Thu, Nov 17, 2022 at 05:53:11PM +0100, Maxime Ripard wrote:
> > > After trying to get more kunit tests for KMS, I found out that the
> > > recent kunit helpers we merged to create a DRM device [1] are broken and
> > > won't free their device-managed and DRM-managed resources.
> > > 
> > > With some help from Thomas, we've dug into this and it turns out that if
> > > we allocate a device with root_device_register, initialise our drm
> > > device with devm_drm_dev_alloc(), register it using drm_dev_register(),
> > > unregister it using drm_dev_unregister/drm_dev_unplug and then remove
> > > the parent device, neither the device managed nor the DRM managed
> > > actions are run.
> > > 
> > > root_device_register initializes the device by eventually calling
> > > device_initialize() which sets the initial reference count of the root
> > > device to 1 [2]. devm_drm_dev_alloc() then comes in, drm_dev_init() will
> > > increase the root device refcount [3] and initialize our DRM device to 1
> > > [4]. drm_dev_register(), through drm_minor_register() and device_add(),
> > > will increase the root device refcount [5].
> > > 
> > > When unrolling things, drm_dev_unregister(), through
> > > drm_minor_unregister() and device_del(), will give up its reference [6].
> > > root_device_unregister(), through device_unregister(), will also give up
> > > its own [7].
> > > 
> > > So we end up with this for the reference counts:
> > > 
> > > +------------------------+-------------+------------+
> > > |         funcs          | root device | DRM device |
> > > +------------------------+-------------+------------+
> > > | root_device_register   |           1 | N/A        |
> > > | devm_drm_dev_alloc     |           2 | 1          |
> > > | drm_dev_register       |           3 | 1          |
> > > | drm_dev_unregister     |           2 | 1          |
> > > | root_device_unregister |           1 | 1          |
> > > +------------------------+-------------+------------+
> > > 
> > > If we go back to the list of reference taken, the root device reference
> > > and the initial drm_device reference, both taken by devm_drm_dev_alloc()
> > > through drm_dev_init(), haven't been put back.
> > > 
> > > If we look at the drm_dev_init code(), we can see that it sets up a
> > > DRM-managed action [8] that will put back the device reference [9]. The
> > > DRM-managed code is executed by the drm_managed_cleanup() function, that
> > > is executed as part of a release hook [10] executed once we give up the
> > > final reference to the DRM device [11].
> > > 
> > > If we go back a little, the final reference to the DRM device is
> > > actually the initial one setup by devm_drm_dev_alloc(). This function
> > > has superseded drm_dev_alloc(), with the documentation that we do need a
> > > final drm_dev_put() to put back our final reference [12].
> > > 
> > > devm_drm_dev_alloc() is a more convenient variant that has been
> > > introduced explicitly to not require that drm_dev_put(), and states it
> > > as such in the documentation [13]. It does so by adding a device-managed
> > > action that will call drm_dev_put() [14].
> > > 
> > > Device-managed actions are ran as part devres_release_all() that is
> > > called by device_release() [15], itself being run when the last
> > > reference on the device is put back [16][17][18].
> > > 
> > > So if we sum things up, the DRM device will only give its last root
> > > device reference when the last DRM device reference will be put back,
> > > and the last DRM device reference will be put back when the last device
> > > reference will be put back, which sounds very circular to me, with both
> > > ending up in a deadlock scenario.
> > > 
> > > I've added two kunit tests that demonstrate the issue: we register a
> > > device, allocate and register a DRM device, register a DRM-managed
> > > action, remove the DRM device and the parent device, and wait for the
> > > action to execute. drm_register_unregister_with_devm_test() uses the
> > > broken(?) devm_drm_dev_alloc and is failing.
> > > drm_register_unregister_test uses the deprecated drm_dev_alloc() that
> > > requires an explicit call to drm_dev_put() which works fine.
> > > 
> > > It's also worth noting that Thomas tested with simpledrm and it seems to
> > > work fine.
> > 
> > Indeed, the transition from simpledrm to a full-blown DRM driver handles
> > this properly. It's using a platform_device_unregister() [1] and
> > eventually device_del() [2][3]. That part is handled just like
> > root_device_unregister() [4][5]. Basically, both will call device_del(),
> > and then device_put(), so device_del() is called while holding a
> > reference.
> > 
> > As we've seen before, at this point the DRM driver still holds a
> > reference to the device as well.
> > 
> > device_del() will call bus_remove_device() [6], which will be skipped
> > for the root device since it doesn't have a bus [7].
> > 
> > It will then call device_release_driver() [8], which is basically forwarded
> > to __device_release_driver() [9][10], that will call device_unbind_cleanup() [11].
> > 
> > device_unbind_cleanup() calls devres_release_all() directly [12], that
> > runs all the device-managed actions [13]. And it does so WHILE THERE'S
> > STILL A REFCOUNT OF 2!
> > 
> > I would expect the call to devres_release_all to happen only in
> > device_release, once all the device reference have been put back. Not 4
> > functions in as a side effect, and while there's still some active
> > references.
> 
> So maybe I'm missing something, but devm is tied to the device's
> existence, not to the lifetime of the struct device.

Yes, devm_ resources can be released even if somebody is keeping
positive reference to struct device FWICT, after bus->remove() you
can not access them.

> Or well, it's complicated, there's actually two cleanups, once when doing
> the hotunplug/unregister, and once when the final struct device cleanup
> happens. This is why devm_drm_dev_alloc absolutely must be in the former
> cleanup group, otherwise you have the loop you've described.

There are 2 separate managed resources list: one in drm_device and one
in struct device. Those are cleaned up separately.

But if we are talking about struct device there is only one cleanup.
However it can happen from few entry points that ended up on:
device_unbind_cleanup() -> devres_release_all()

And there is a problem when mixing devm_ and drmm_, because you have
to correctly chose devm_ resources and avoid those which can still be
accessed via drm callbacks. Or block access tho those after
bus->remove / sysfs unbind. Not sure it this is related to original,
problem presented here by Maxime though. Just my thoughts from
converting intel_vpu to use drmm.

Regards
Stanislaw
