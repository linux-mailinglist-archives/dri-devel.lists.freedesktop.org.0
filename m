Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E8D60F410
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 11:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EAD10E5BD;
	Thu, 27 Oct 2022 09:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cavan.codon.org.uk (irc.codon.org.uk [IPv6:2a00:1098:84:22e::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD1910E5B8;
 Thu, 27 Oct 2022 09:52:50 +0000 (UTC)
Received: by cavan.codon.org.uk (Postfix, from userid 1000)
 id 841D440A8B; Thu, 27 Oct 2022 10:52:49 +0100 (BST)
Date: Thu, 27 Oct 2022 10:52:49 +0100
From: Matthew Garrett <mjg59@srcf.ucam.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 02/31] drm/i915: Don't register backlight when another
 backlight should be used (v2)
Message-ID: <20221027095249.GA28666@srcf.ucam.org>
References: <20221025193248.GA21457@srcf.ucam.org>
 <144cd47e-42dc-2b84-1a90-ea5e080e08a3@redhat.com>
 <20221025204043.GA23306@srcf.ucam.org>
 <cb5add36-c13c-ccd5-1b4b-71b45163a170@redhat.com>
 <20221025234040.GA27673@srcf.ucam.org>
 <fa6cc1d9-6740-b495-2c72-cae18c429ca6@redhat.com>
 <20221026204920.GA15326@srcf.ucam.org>
 <099dee98-8aeb-af36-828c-110f5ac6e9a3@redhat.com>
 <20221027091123.GA28089@srcf.ucam.org>
 <933be908-0bc2-56cc-8d6f-38f2d208ef20@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <933be908-0bc2-56cc-8d6f-38f2d208ef20@redhat.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@redhat.com>,
 Len Brown <lenb@kernel.org>, Daniel Dadap <ddadap@nvidia.com>,
 Jani Nikula <jani.nikula@intel.com>,
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

On Thu, Oct 27, 2022 at 11:39:38AM +0200, Hans de Goede wrote:

> The *only* behavior which actually is new in 6.1 is the native GPU
> drivers now doing the equivalent of:
> 
> 	if (acpi_video_get_backlight_type() != acpi_backlight_native)
> 		return;
> 
> In their backlight register paths (i), which is causing the native
> backlight to disappear on your custom laptop setup and on Chromebooks
> (with the Chromebooks case being already solved I hope.).

It's causing the backlight control to vanish on any machine that isn't 
((acpi_video || vendor interface) || !acpi). Most machines that fall 
into that are either weird or Chromebooks or old, but there are machines 
that fall into that.

(I wrote https://mjg59.livejournal.com/127103.html over 12 years ago, so 
please do assume that I'm familiar with the complexities here :) )

> I agree this is a possible solution if this turns out to break more
> systems and there is no other easy/clean way to fix those. But I would
> greatly prefer to keep this change and stop the IMHO bad kernel behavior
> of "registering multiple backlight-devices for a single panel and then
> let userspace sort it out".

If we're not able to make a correct policy decision in the kernel then 
punting it to userland seems like the right thing to do? The kernel 
absolutely *should* make the right decision where it has enough 
information to do so, but in this case the code that's making that 
decision doesn't have the full set of information.
