Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8433B49CEFA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C768D10E1A2;
	Wed, 26 Jan 2022 15:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2600910E1A2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 15:54:55 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id l68so296996ybl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 07:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ucO1sywroR8yC1kKoTBiQwAGK1EFu2UMuTi0r7LNQIo=;
 b=bkfSFVLpoc6F7iLkxcpBcXx2o3G6hm4Z+hE4OUgSCnsFyEaVhYlJPeanRVtdbeN1/V
 cRcb0pc3koRUAO7syLgmgyuWsFkjsiPXuN/0sQyOnHYU9CYyV9j2CYCeVolJj8SRmXqS
 xCfVHEkgRO1Qa3/cA1fAEq4prdInJTiby+Vl7pqDU0limDYL1mqtyAHVBEaP0cPPf+Pn
 ryh9N7ypb5UysIXgld2n9SoLlEEja+/LVbWlA9EFvxdy1ASMXoO7mu4Utl33dRYCPNx7
 CThvEu/3CN5FWs7o+0JKwOipJXEgjZsv9DbolBXKiMWK1Q+AibgNIDpQkqfhGBS2Em08
 TKiQ==
X-Gm-Message-State: AOAM533VwGCcOxSLcgQ1Kv0iHpICZYN7oZsr2Gk3ESJPaAchOD6XK4UR
 KCbyjB7HJbs+Z3iPbQ1owcuSlPxfW2vtyclXl74=
X-Google-Smtp-Source: ABdhPJymVLAX8wg62RwdJAXxUEjDxYZbfFYeCSGaFYiOUyaot4fh9pGEqFr1JLabhRbIJtmemdXujcnWT0rb+wSx+UM=
X-Received: by 2002:a25:3793:: with SMTP id
 e141mr36739114yba.624.1643212494095; 
 Wed, 26 Jan 2022 07:54:54 -0800 (PST)
MIME-Version: 1.0
References: <20220123091004.763775-1-ztong0001@gmail.com>
 <6a0233cd-d931-8a36-3b9e-08b774cec7b0@redhat.com>
In-Reply-To: <6a0233cd-d931-8a36-3b9e-08b774cec7b0@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 26 Jan 2022 16:54:43 +0100
Message-ID: <CAJZ5v0h51v9fFrJRuaFpSn7J2UEHndEj0f3zpmw=RvgsvAhtvw@mail.gmail.com>
Subject: Re: acpi_get_devices() crash when acpi_disabled==true (was [PATCH v2]
 drm/privacy-screen: honor acpi=off in detect_thinkpad_privacy_screen)
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
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Tong Zhang <ztong0001@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-acpi <linux-acpi@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 2:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> On 1/23/22 10:10, Tong Zhang wrote:
> > when acpi=off is provided in bootarg, kernel crash with
> >
> > [    1.252739] BUG: kernel NULL pointer dereference, address: 0000000000000018
> > [    1.258308] Call Trace:
> > [    1.258490]  ? acpi_walk_namespace+0x147/0x147
> > [    1.258770]  acpi_get_devices+0xe4/0x137
> > [    1.258921]  ? drm_core_init+0xc0/0xc0 [drm]
> > [    1.259108]  detect_thinkpad_privacy_screen+0x5e/0xa8 [drm]
> > [    1.259337]  drm_privacy_screen_lookup_init+0xe/0xe85 [drm]
> >
> > The reason is that acpi_walk_namespace expects acpi related stuff
> > initialized but in fact it wouldn't when acpi is set to off. In this case
> > we should honor acpi=off in detect_thinkpad_privacy_screen().
> >
> > Signed-off-by: Tong Zhang <ztong0001@gmail.com>
>
> Thank you for catching this and thank you for your patch. I was about to merge
> this, but then I realized that this might not be the best way to fix this.
>
> A quick grep shows 10 acpi_get_devices() calls outside of drivers/acpi,
> and at a first glance about half of those are missing an acpi_disabled
> check. IMHO it would be better to simply add an acpi_disabled check to
> acpi_get_devices() itself.
>
> Rafael, do you agree ?

Yes, I do.

> Note the just added chrome privacy-screen check uses
> acpi_dev_present(), this is also used in about 10 places outside
> of drivers/acpi and AFAIK none of those do an acpi_disabled check.
>
> acpi_dev_present() uses bus_find_device(&acpi_bus_type, ...)
> but the acpi_bus_type does not get registered when acpi_disabled
> is set. In the end this is fine though since bus_find_device
> checks for the bus not being registered and then just returns
> NULL.

Right.

> > ---
> > v2: fix typo in previous commit -- my keyboard is eating letters
> >
> >  drivers/gpu/drm/drm_privacy_screen_x86.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
> > index a2cafb294ca6..e7aa74ad0b24 100644
> > --- a/drivers/gpu/drm/drm_privacy_screen_x86.c
> > +++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
> > @@ -33,6 +33,9 @@ static bool __init detect_thinkpad_privacy_screen(void)
> >       unsigned long long output;
> >       acpi_status status;
> >
> > +     if (acpi_disabled)
> > +             return false;
> > +
> >       /* Get embedded-controller handle */
> >       status = acpi_get_devices("PNP0C09", acpi_set_handle, NULL, &ec_handle);
> >       if (ACPI_FAILURE(status) || !ec_handle)
>
