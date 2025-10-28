Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6CDC1368F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 08:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF13A10E08E;
	Tue, 28 Oct 2025 07:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="WKEHaCuk";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="ClfkBYFX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0946610E08E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 07:58:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-4dvf.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761638319; 
 b=pJA64NCyMoi0JymNASyzDi26J97qACf0ioO8BNq46fkBLFpbiZRm44HdpFpkIKOmL0mUfshmVV
 joZB1A1z5iHF8u9ZYDUdK1Z5QnbuLODD00sKzoAdfJg9SLCS7JrxQ+kPQzVKA4f2tOdL1bav5t
 k1kchbnbn9O7MBK7LwQW8PjvEU79hRKnF55bTxGDs31V+0R7rPCUoAXTO+InYHbl9htSgb6oJY
 xXQzBy0UuJIbyRFoaGoKkonpm7AGxj7JtFw2MJ0d9hx6qYKorDEBIPVC5OebEanD0uoRtzoYt4
 wpKraINBnN3giVs+shQvt5BnvbTCDGTEVfJMF99GnghtfA==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-4dvf.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-4dvf.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761638319; 
 bh=iEY4Wt1Q2As11SfIf0/Sluu+mH2O6nSTVRG/jlw/s+s=;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
 To:From:DKIM-Signature:DKIM-Signature;
 b=c1TXE0w/9ScOZzLQQf7yDn8l3qamIZUAeJcFnvlSzzNGAB9ID/eVd9fTzDdl2IoakBdQnY2Yvs
 bUlUO/9snRRcSfkIVKbY+Yl6vywFRyip9wUGdKzV2JyUmqnG4Jjs5bRmmCj6RHGX+4AYdsaVzP
 t8yx+3uJWlkON3Pq7zzjC0F7vRQIE+K1M2Pui8AssXW1ZjWMvcmYyxfU37znN/fgz2wLilEkjx
 Sn4Vi70uZiyYnlLZpty98z7wtB4oqiRh6n5thrgy3QIuW3Nmt3dxKJjsSHbX/8MtQjFQRQJ50S
 PSdwh0RSjgbRWqBXDQIrOIvMr9QJLB75NuHHN1mVoG1MPg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
 List-Unsubscribe:Content-Transfer-Encoding;
 bh=zdfLZeLr5NvufMpcLIsBqTthOwjM4I46IsO/Ts8RIWE=; b=WKEHaCukcSZmk2MB++UspaoqC8
 MQCtu/S/NREJt7W50JrUhFQIZ5CdzNw9998eP3O9qpWyrj1psRwWAZ5JV4E/mt5huvRruaPqzr8Kq
 kAo4Dsz9sErtnOxGNGH2zWEAzI55VSkCieY1eQ/YdYhAsqiUbdBdujRlCldgB1Zw9kZc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-4dvf.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vDebD-00000000JdI-2Ok2
 for dri-devel@lists.freedesktop.org; Tue, 28 Oct 2025 07:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=zdfLZeLr5NvufMpcLIsBqTthOwjM4I46IsO/Ts8RIWE=; b=ClfkBYFXsfPZoGUrAKm6wwrL8U
 0zjVtmTjsdovD2/5iy3S07INI/dq3tPMKjgIVJh+4zSfrNHzW4bmUZJmIVqhtBpQxebkaD/TP505H
 uPbAkefTqhyeHburXaz+Sl2c4WKBDsBXYz4mXe7sLTBogltkk27UVLS6bDnRCo27AkC4=;
Received: from [87.17.42.198] (port=60166 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vDear-00000000Lap-143e; Tue, 28 Oct 2025 07:58:13 +0000
From: Francesco Valla <francesco@valla.it>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
Date: Tue, 28 Oct 2025 08:58:05 +0100
Message-ID: <2756316.lGaqSPkdTl@fedora.fritz.box>
In-Reply-To: <yq4btdc5qqukuqps7y53dratmu64ghyifgprlndnk5rbgml4of@rvca75sncvsm>
References: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
 <yq4btdc5qqukuqps7y53dratmu64ghyifgprlndnk5rbgml4of@rvca75sncvsm>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2568004.XAFRqVoOGU";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 3f1fe8909906a1353f2b170d17410810
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vDebD-00000000JdI-2Ok2-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4dvf.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

--nextPart2568004.XAFRqVoOGU
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Francesco Valla <francesco@valla.it>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
Date: Tue, 28 Oct 2025 08:58:05 +0100
Message-ID: <2756316.lGaqSPkdTl@fedora.fritz.box>
MIME-Version: 1.0

Hi,

On Monday, 27 October 2025 at 11:09:56 Maxime Ripard <mripard@kernel.org> wrote:
> Hi,
> 
> On Mon, Oct 27, 2025 at 12:03:00AM +0100, Francesco Valla wrote:
> > this patchset adds a new DRM client offering splash functionalities,
> > able to draw to screen:
> > 
> >   - a colored background;
> 
> So, I like that part, and we were recently discussing about this.
> 
> >   - a single-line text message, which can be set through sysfs or
> >     directly from the kernel command line;
> >   - a very simple progress bar, which can be driven through sysfs;
> >   - a static image (optional).
> 
> But there's no reason to have all that in the kernel, and we already
> have userspace components to do so (plymouth being the main "mainstream"
> one).
> 

I get that for the "text message" and "progress bar" parts. I still have
some uses for them, that however may not be adherent to upstream philosophy.

> > Once compiled inside the kernel, the client can be enabled through the
> > command line specifying the drm_client_lib.active=splash parameter.
> > 
> > == Motivation ==
> > 
> > The motivation behind this work is to offer to embedded system
> > developers a new path for a simple activation of the display(s)
> > connected to their system, with the following usecases:
> > 
> >   - bootsplash - possibly displaying even before init;
> >   - early activation of the display pipeline, in particular whenever one
> >     component of the pipeline (e.g.: a panel) takes a non-negligible
> >     time to initialize;
> >   - recovery systems, where the splash client can offer a simple feedback
> >     for unattended recovery tasks;
> >   - update systems, where the splash client can offer a simple feedback
> >     for unattended update tasks.
> 
> If plymouth cannot be used by embedded systems for some reason, then you
> should work on a plymouth alternative.
> 

Thing is: any possible alternative would still start after userspace has
been loaded, checked (in case of secure boot, which is ubiquitous now)
and initialized. This means, at least in my usecases, several hundreds of
milliseconds after userspace start, to be summed to the panel initialization
time.

> > While the first seems the most obvious one, it was the second that acted
> > as the driver, as in the past I had to implement a ugly workaround using
> > a systemd generator to kickstart the initialization of a display and
> > shave ~400ms of boot time.
> > 
> > The last 2 usecase, instead, are the reason I dropped the "boot" part
> > from bootsplash.
> > 
> > == Implementation details ==
> > 
> > The design is quite simple, with a kernel thread doing the heavylifting
> > for the rendering part and some locking to protect interactions with it.
> > 
> > The splash image is loaded using the firmware framework, with the client
> > expecting to find a binary dump having the right dimensions (width and
> > height) and FOURCC format for each modeset. Given a 1920x1080 RGB888
> > modeset, the client will for example search for a firmware named:
> > 
> >    drm_splash_1920x1080_RG24.raw
> > 
> > If the firmware cannot be loaded directly, the NOUEVENT sysfs fallback
> > mechanism is used to let userspace load the appropriate image.
> > 
> > == Testing ==
> > 
> > Testing was done on qemu (both with vkms and bochs drivers), on a HDMI
> > display connected to a Beagleplay and on a ILI9341 SPI display connected
> > to a i.MX93 FRDM board. All these platforms revealed different
> > weaknesses that were hopefully removed.
> > 
> > == Open points / issues ==
> > 
> > The reason for this being an RFC is that there are several open points:
> > 
> >   - Support for tiled connectors should be there, but has not been
> >     tested. Any idea on how to test it?
> 
> Did you mean tiled formats?
> 

No, AFAIU the tiled connectors are different connectors that feed different
panels, which however are part of a single logical screen. Support for this
setup is present at drm level [1], but I'm not familiar with it.

I've only found this used inside the i915 Intel driver [2].

> >   - I'm not entirely convinced that using the firmware framework to load
> >     the images is the right path. The idea behind it was to re-use the
> >     compressed firmware support, but then I discovered it is not there
> >     for built-in firmware.
> 
> Yeah, firmware loading for this has a few issues (being tedious to setup
> for when built-in being one). I think just going the fbdev penguin road
> is a better choice: you provide the path, and it's embedded in the
> kernel directly.
> 

Yes, this is already working, but if large-ish images are used, the loading
time for them defeats the entire purpose of an in-kernel splash.

> >   - Again on the firmware loading: CONFIG_LOADPIN would interfere with
> >     sysfs loading.
> >   - And again: FW_ACTION_NOUEVENT only has one user inside the kernel,
> >     leading me to think it is de-facto deprecated. And still, uevents
> >     for firmware loading seem frowned upon these days... 
> >   - Generating binary dumps for... basically any format is not so
> >     straightforward. I crafted a Python tool with AI help which seems
> >     to work quite well, but I honestly did not yet understood which is
> >     the policy for AI-generated code inside the kernel, so it is not
> >     included in this patch set. All client code is genuine, though.
> 
> BMP is simple enough to support so we should probably use that instead
> of a custom format.
> 
> Maxime
> 


Thank you!

Regards,
Francesco


[1] https://elixir.bootlin.com/linux/v6.17.5/source/include/drm/drm_connector.h#L2253
[2] https://elixir.bootlin.com/linux/v6.17.5/source/drivers/gpu/drm/drm_connector.c#L2739


--nextPart2568004.XAFRqVoOGU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRUrtjevJ039mawAeLir2xSXEi5AAUCaQB3jQAKCRDir2xSXEi5
AFnSAQC9C4qNTZxuzclFDDCR37ko3jNFdZTX3yJfD8TIeTHZzQD/aVd9TRgWztp0
2tBumHqBgLdhZcyZQNGyt5HWFk7XcQU=
=5pI2
-----END PGP SIGNATURE-----

--nextPart2568004.XAFRqVoOGU--



