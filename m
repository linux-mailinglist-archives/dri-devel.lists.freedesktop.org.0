Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADEB60F6D1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 14:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B74E10E5E6;
	Thu, 27 Oct 2022 12:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AC110E5E6;
 Thu, 27 Oct 2022 12:09:39 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id t25so678515qkm.2;
 Thu, 27 Oct 2022 05:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zob33Kla+RLsm+RvZFRkkpciG4NSOFsYMv+2iMSvbU8=;
 b=c6nvfMWCKTy6m6KpiK9dvSPTbHBH/5CFWHmz9e+GiyVgcCNMtGNu2h16uCsi+jIEdb
 1hRSq76zNWT2Xxaxiv5c1a50y8yn7gzK85rBX3YlNsHstdt0KtWFZFkCO70WwYxSVJbY
 o7bFgLypZmRRSjVE+8gzoDeaVf5SuulW6XJ5/Nt8dmi+6YnhPQZ13EP8mEigWE2jqXXl
 mya5PTXIpImzt5q+ruL7/QDlNAtAJbACzZjJ6RB2eq0ZxQLNr77kC8J7VKDmEa2z2yt/
 r6SqsEd96e6wMUiRMcUCA9+n1eYnN2vGA0QfKH20H0tcHB2j2MIt6JxVVzs5k7tFI1Pv
 cdFA==
X-Gm-Message-State: ACrzQf3WhPZUdqv0HGhupM2ZqWmYJEdRkA3hffF1+a9YJeQloSYASKaz
 uqMeYa2WZUBgKqeRhxX3O+KDVuwrei5P+re7ho8=
X-Google-Smtp-Source: AMsMyM6NeMFZa4GPKFIdb5StMWZOoUw58iXZAY6R77ZAJLEXASKkFV1w1vtNejdRxPCAyFXWVssLUx0L9nTXahQ4MDI=
X-Received: by 2002:a05:620a:4626:b0:6ee:b43:d2bc with SMTP id
 br38-20020a05620a462600b006ee0b43d2bcmr32868704qkb.764.1666872578327; Thu, 27
 Oct 2022 05:09:38 -0700 (PDT)
MIME-Version: 1.0
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
 <20221027095249.GA28666@srcf.ucam.org>
 <6df2016d-ed2d-57fa-dcad-48537732895f@redhat.com>
In-Reply-To: <6df2016d-ed2d-57fa-dcad-48537732895f@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Oct 2022 14:09:27 +0200
Message-ID: <CAJZ5v0jM1JAySagv=u2be1bAmfTt3jJgVnOEjGzskBvZY7k6aw@mail.gmail.com>
Subject: Re: [PATCH v5 02/31] drm/i915: Don't register backlight when another
 backlight should be used (v2)
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Karol Herbst <kherbst@redhat.com>, Daniel Dadap <ddadap@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xinhui <Xinhui.Pan@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 27, 2022 at 12:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 10/27/22 11:52, Matthew Garrett wrote:
> > On Thu, Oct 27, 2022 at 11:39:38AM +0200, Hans de Goede wrote:
> >
> >> The *only* behavior which actually is new in 6.1 is the native GPU
> >> drivers now doing the equivalent of:
> >>
> >>      if (acpi_video_get_backlight_type() != acpi_backlight_native)
> >>              return;
> >>
> >> In their backlight register paths (i), which is causing the native
> >> backlight to disappear on your custom laptop setup and on Chromebooks
> >> (with the Chromebooks case being already solved I hope.).
> >
> > It's causing the backlight control to vanish on any machine that isn't
> > ((acpi_video || vendor interface) || !acpi). Most machines that fall
> > into that are either weird or Chromebooks or old, but there are machines
> > that fall into that.
>
> I acknowledge that their are machines that fall into this category,
> but I expect / hope there to be so few of them that we can just DMI
> quirk our way out if this.
>
> I believe the old group to be small because:
>
> 1. Generally speaking the "native" control method is usually not
> present on the really old (pre ACPI video spec) mobile GPUs.
>
> 2. On most old laptops I would still expect there to be a vendor
> interface too, and if both get registered standard desktop environments
> will prefer the vendor one, so then we need a native DMI quirk to
> disable the vendor interface anyways and we already have a bunch of
> those, so some laptops in this group are already covered by DMI quirks.
>
> And a fix for the Chromebook case is already in Linus' tree, which
> just leaves the weird case, of which there will hopefully be only
> a few.
>
> I do share your worry that this might break some machines, but
> the only way to really find out is to get this code out there
> I'm afraid.
>
> I have just written a blog post asking for people to check if
> their laptop might be affected; and to report various details
> to me of their laptop is affected:
>
> https://hansdegoede.dreamwidth.org/26548.html
>
> Lets wait and see how this goes. If I get (too) many reports then
> I will send a revert of the addition of the:
>
>         if (acpi_video_get_backlight_type() != acpi_backlight_native)
>                 return;
>
> check to the i915 / radeon / amd / nouveau drivers.
>
> (And if I only get a couple of reports I will probably just submit
> DMI quirks for the affected models).

Sounds reasonable to me, FWIW.

And IIUC the check above can be overridden by passing
acpi_backlight=native in the kernel command line, right?
