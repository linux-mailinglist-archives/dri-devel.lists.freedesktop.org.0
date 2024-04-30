Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A028B79B4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 16:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5849210FE72;
	Tue, 30 Apr 2024 14:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IddfvIau";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0155A10FE93
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 14:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714487564; x=1746023564;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n6SnZJULFItjuGLEhkqEpmc3jEp8vlsv3OQPTQoqn2s=;
 b=IddfvIaultbKP0uOG0Hj2rGs76BTNW7ymZZ+6exOOqPvFlSHfxAEgU74
 6duoDHDOpY27T7MH5rmYh5UGvYW+OS2bEiayvFrw0Z9+lAfIWuwPV+Qpa
 KJAbUKadPSNvbOol4SAkIv5NIYcJnO+SBv8QEe+3acxTZN1qr7UCFYt3l
 IK3XC1P3Z7WFgLBj19HAMybHgqAPz2gD05xvBUzUBkm9bvmVj82A5GVXt
 tn5uhFwZokDVvXsQ8nKDZcmPVk0le0PJZJTC3wKmPdDkoaiSrRWmY/cHn
 vKr3PT2fWaRqYc3GdmoUxpzWwzjPstQtKkqtl0cXyuRB/qhSCIgNj5gnT A==;
X-CSE-ConnectionGUID: AH0qLGtHSe6IYenWbIk4gg==
X-CSE-MsgGUID: fQeKKEt7SsSJNHdEpDhTlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="35582405"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="35582405"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 07:32:43 -0700
X-CSE-ConnectionGUID: W1vp+tf8TpqYQ2KRWTXqIQ==
X-CSE-MsgGUID: ygYZu9RDSYCCCzXJL4BMHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="26565796"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 07:32:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s1oX7-00000002gzV-26Yp; Tue, 30 Apr 2024 17:32:37 +0300
Date: Tue, 30 Apr 2024 17:32:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [v1,1/3] drm/panel: ili9341: Correct use of device property APIs
Message-ID: <ZjEBBRK7eoY4I0Gg@smile.fi.intel.com>
References: <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
 <c2d41916-0b6c-43b5-98eb-514eb0511f84@linux.dev>
 <ZiqqiAztCaiAgI8e@smile.fi.intel.com>
 <2599705c-0a64-4742-b1d7-330e9fde6e7a@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2599705c-0a64-4742-b1d7-330e9fde6e7a@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 26, 2024 at 04:43:18AM +0800, Sui Jingfeng wrote:
> On 2024/4/26 03:10, Andy Shevchenko wrote:
> > On Fri, Apr 26, 2024 at 02:08:16AM +0800, Sui Jingfeng wrote:
> > > On 2024/4/25 22:26, Andy Shevchenko wrote:
> > > > It seems driver missed the point of proper use of device property APIs.
> > > > Correct this by updating headers and calls respectively.
> > > You are using the 'seems' here exactly saying that you are not 100% sure.

To add here, "seems" is used to show that I have no knowledge on what was
the idea behind this implementation by the original author. Plus my knowledge
in the firmware node / device property APIs and use cases in Linux kernel.

> > > Please allow me to tell you the truth: This patch again has ZERO effect.
> > > It fix nothing. And this patch is has the risks to be wrong.
> > Huh?! Really, stop commenting the stuff you do not understand.
> 
> I'm actually a professional display drivers developer at the downstream
> in the past, despite my contribution to upstream is less. But I believe
> that all panel driver developers know what I'm talking about. So please
> have take a look at my replies.

Okay.

> > > Simple because the "ili9341_probe() ---> ili9341_dbi_prob()" code path
> > > is DT dependent.
> > > 
> > > First of all, the devm_of_find_backlight() is called in ili9341_dbi_probe()
> > > under *non-DT* environment, devm_of_find_backlight() is just a just a
> > > no-op and will return NULL. NULL is not an error code, so ili9341_dbi_probe()
> > > won't rage quit. But the several side effect is that the backlight will
> > > NOT works at all.
> > Is it a problem?
> 
> Yes, it is.
> 
> The core problem is that the driver you are modifying has *implicit* *dependency* on DT.
> The implicit dependency is due to the calling of devm_of_find_backlight(). This function
> is a no-op under non-DT systems.

Okay.

> Therefore, before the devm_of_find_backlight() and
> the device_get_match_data() function can truly DT independent.

True for the first part, not true for the second.

> Removing the "OF" dependency just let the tigers run out from the jail.
> 
> It is not really meant to targeting at you, but I thinks, all of drm_panel drivers
> that has the devm_of_find_backlight() invoked will suffer such concerns.
> In short, the reason is that the *implicit* *dependency* populates and
> the undefined behavior gets triggered.

Still no problem statement. My hardware works nicely on non-DT environment.
(And since it's Arduino-based one, I assume it will work on DT environments
 the very same way.)

> I'm sure you know that device_get_match_data() is same with of_device_get_match_data()
> for DT based systems. For non DT based systems, device_get_match_data() is just *undefined*
> Note that ACPI is not in the scope of the discussion here, as all of the drm bridges and
> panels driver under drivers/gpu/drm/ hasn't the ACPI support yet.

This patch shows exactly how to bring back the ACPI support to one of them
(as it's done for tinyDRM cases).

> Therefore, at present,
> it safe to say that device_get_match_data() is *undefined* under no-DT environment.

This is not true.

> Removing the "OF" dependency hints to us that it allows the driver to be probed as a
> pure SPI device under non DT systems. When device_get_match_data() is called, it returns
> NULL to us now. As a result, the drm driver being modified will tears down.
> 
> See bellow code snippet extracted frompanel-ilitek-ili9341.c:
> 
> 
> ```
> 	ili->conf = of_device_get_match_data(dev);
> 	if (!ili->conf) {
> 		dev_err(dev, "missing device configuration\n");
> 		return -ENODEV;
> 	}
> ```
> 
> > > It is actually considered as fatal bug for *panels* if the backlight of
> > > it is not light up, at least the brightness of *won't* be able to adjust.
> > > What's worse, if there is no sane platform setup code at the firmware
> > > or boot loader stage to set a proper initial state. The screen is complete
> > > dark. Even though the itself panel is refreshing framebuffers, it can not
> > > be seen by human's eye. Simple because of no backlight.
> > Can you imagine that I may have different hardware that considered
> > this is non-fatal error?
> > 
> Yes, I can imagine.
> 
> I believe you have the hardware which make you patch correct to run
> in 99.9% of all cases. But as long as there one bug happened, you patch
> are going to be blamed.
> 
> Because its your patch that open the door, both from the perceptive of
> practice and from the perceptive of the concept (static analysis).
> 
> > > Second, the ili9341_dbi_probe() requires additional device properties to
> > > be able to works very well on the rotation screen case. See the calling
> > > of "device_property_read_u32(dev, "rotation", &rotation)" in
> > > ili9341_dbi_probe() function.
> > Yes, exactly, and how does it object the purpose of this patch?
> 
> Because under *non-DT* environment, your commit message do not give a
> valid description, how does the additional device property can be acquired
> is not demonstrated.
> 
> And it is exactly your patch open the non-DT code path (way or possibility).
> It isn't has such risks before your patch is applied. In other words,
> previously, the driver has the 'OF' dependency as the guard, all of the
> potential risk(or problem) are suppressed. It is a extremely safe policy,
> and it is also a extremely perfect defend.
> 
> And suddenly, you patch release the dangerous tiger from the cage.
> So I think you can imagine...

No, I can't, sorry. I don't see how dangerous will be the use of DRM panel
in a wrong configuration. The same can very well happen on improperly working
hardware (backlight part) or simply when somebody didn't correctly set a DT
or manually use it when it should not be. But again I see *no* problem
statement, only some worries.

And on top of that I made tinyDRM drivers to be accessible on ACPI platforms
and so far I have none complains about the tigers that left the cage.

> > > Combine with those two factors, it is actually can conclude that the
> > > panel-ilitek-ili9394 driver has the *implicit* dependency on 'OF'.
> > > Removing the 'OF' dependency from its Kconfig just trigger the
> > > leakage of such risks.
> > What?!
> > 
> Posting a patch is actually doing the defensive works, such a saying
> may not sound fair for you, but this is just the hash cruel reality.
> Sorry for saying that. :(

So, the summary of your message is that:
- there's no understanding how ACPI (or any other non-DT fwnode based
  environment) can utilise the driver
- there's a worry about some problems which can't be stated clearly
- there's a neglecting of the previous successful cases specific for DRM
  (tinyDRM drivers)

As a result of the false input, the non-constructive conclusion was given.

And note, I converted dozens if not hundredth of drivers that used to be
OF-only and haven't heart any negative feedback before this case. Maybe
we (reviewers of my patches and maintainers who applied them and end users)
miss a BIG DEAL here? Please, elaborate how dropping OF dependency can be
dangerous as a free walking tiger.

> > > My software node related patches can help to reduce part of the potential
> > > risks, but it still need some extra work. And it is not landed yet.

> > Your patch has nothing to do with this series.

I am not going to repeat the above.

> With my patch applied, this is way to meet the gap under non-DT systems.
> Users of this driver could managed to attach(complete) absent properties
> to the SPI device with software node properties. Register the swnode
> properties group into the system prior the panel driver is probed. There
> may need some quirk. But at the least there has a way to go.  When there
> has a way to go, things become self-consistent. Viewed from both the
> practice of viewpoint and the concept of viewpoint.
> 
> And the dangerous tiger will steer its way to the direction of "ACPI
> support is missing". But both of will be safe then.

-- 
With Best Regards,
Andy Shevchenko


