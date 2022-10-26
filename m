Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C8360EA8A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 22:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C1410E0D0;
	Wed, 26 Oct 2022 20:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cavan.codon.org.uk (irc.codon.org.uk [IPv6:2a00:1098:84:22e::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FA010E0D0;
 Wed, 26 Oct 2022 20:49:22 +0000 (UTC)
Received: by cavan.codon.org.uk (Postfix, from userid 1000)
 id CF10840A8A; Wed, 26 Oct 2022 21:49:20 +0100 (BST)
Date: Wed, 26 Oct 2022 21:49:20 +0100
From: Matthew Garrett <mjg59@srcf.ucam.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 02/31] drm/i915: Don't register backlight when another
 backlight should be used (v2)
Message-ID: <20221026204920.GA15326@srcf.ucam.org>
References: <f914ceb3-94bd-743c-f8b6-0334086e731a@gmail.com>
 <42a5f2c9-a1dc-8fc0-7334-fe6c390ecfbb@redhat.com>
 <20221024203057.GA28675@srcf.ucam.org>
 <8f53b8b6-ead2-22f5-16f7-65b31f7cc05c@redhat.com>
 <20221025193248.GA21457@srcf.ucam.org>
 <144cd47e-42dc-2b84-1a90-ea5e080e08a3@redhat.com>
 <20221025204043.GA23306@srcf.ucam.org>
 <cb5add36-c13c-ccd5-1b4b-71b45163a170@redhat.com>
 <20221025234040.GA27673@srcf.ucam.org>
 <fa6cc1d9-6740-b495-2c72-cae18c429ca6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa6cc1d9-6740-b495-2c72-cae18c429ca6@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Pan@freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xinhui <Xinhui.Pan@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 26, 2022 at 11:59:28AM +0200, Hans de Goede wrote:

> Ok, so this is a local customization to what is already a custom BIOS
> for a custom motherboard. There is a lot of custom in that sentence and
> TBH at some point things might become too custom for them to be expected
> to work OOTB.

But it *did* work OOTB before. You broke it. I accept that I'm a 
ludicrously weird corner case here, but there are going to be other 
systems that are also affected by this.

> I'm afraid things are not that simple. I assume that with
> "if ACPI backlight control is expected to work" you mean don't
> use ACPI backlight control when (acpi_osi_is_win8() && native_available)
> evaluates to true because it is known to be broken on some of
> those systems because Windows 8 stopped using it ?

Correct.

> Unfortunately something similar applies to vendor interfaces,
> When Windows XP started using (and mandating for certification
> IIRC) ACPI backlight control, vendors still kept their own
> vendor specific EC/smbios/ACPI/WMI backlight interfaces around for
> a long long time, except they were often no longer tested.

The current situation (both before your patchset and with its current 
implementation) is that vendor is preferred to native, so if the vendor 
interface is present then we're already using it.

> > The 
> > problem you're dealing with is that the knowledge of whether or not 
> > there's a vendor interface isn't something the core kernel code knows 
> > about. What you're proposing here is effectively for us to expose 
> > additional information about whether or not there's a vendor interface 
> > in the system firmware, but since we're talking in some cases about 
> > hardware that's almost 20 years old, we're not realistically going to 
> > get those old machines fixed.
> 
> I don't understand why you keep talking about the old vendor interfaces,
> at least for the chromebook part of this thread the issue is that
> the i915 driver no longer registers the intel_backlight device which
> is a native device type, which is caused by the patch this email
> thread is about (and old vendor interfaces do not come into play
> at all here). So AFAICT this is a native vs acpi backlight control
> issue ?

I'm referring to your proposed patch that changed the default from 
backlight_vendor to backlight_native, which would fix my machine and 
Chromebooks but break anything that relies on the vendor interfaces.

> I really want to resolve your bug, but I still lack a lot of info,
> like what backlight interface you were actually using in 6.0 ?

Native.

>         {
>          .callback = video_detect_force_video,
>          /* ThinkPad X201s */
>          .matches = {
>                 DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>                 DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X201s"),
>                 },
>         },
> 
> will trigger.

In this case you'd break anyone else running the system who isn't using 
the hacked EC and different ACPI tables - obviously there's ways round 
this, but realistically since I'm (as far as I know) the only person in 
this situation it makes more sense for me to add a kernel parameter than 
carry around an exceedingly niche DMI quirk. I'm fine with that. But the 
point I'm trying to make is that the machines *are* telling you whether 
they'd prefer vendor or native, and you're not taking that into account 
in the video_detect code.
