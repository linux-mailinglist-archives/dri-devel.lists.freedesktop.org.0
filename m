Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D85E6D8424
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 18:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3074910E0BB;
	Wed,  5 Apr 2023 16:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846FC10E0BB
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 16:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680713678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7oq6EGlBnkOylLqaxEYM/Gk/HlPbQ+uLWsUc2iC2TOw=;
 b=UzqwQlnyAI39wnFdr0sxlkeEi7Z/CzwNw+XlKrMXl3weix2+8teAxeZb8LwnHVv70IJYxt
 wVJ4923AzsHSaw68UQHQu6QmwMHSdwN37xHHaYHzL4GWTCbXUO1NQ4kAxDNrI/CtoMzN50
 gRdfObzSwH7TAzHPjLTtEATSmaXLaO0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-gwOC_5MHP-C2NGkoxI7DwA-1; Wed, 05 Apr 2023 12:54:37 -0400
X-MC-Unique: gwOC_5MHP-C2NGkoxI7DwA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m5-20020a05600c4f4500b003ee8db23ef9so19191051wmq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 09:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680713676;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7oq6EGlBnkOylLqaxEYM/Gk/HlPbQ+uLWsUc2iC2TOw=;
 b=fbohyV5+fG7hZWAQTZFK9/go36zcVm8NLrGFaeYGSsGFwCME3Uy2DpZ+n6hIl6tY+R
 y4yRwXUIkXHiehVFvs8HA7CQp5LbxjpOZc3qhRsj+YjRgRTg/4r4gVXVkFTXqpU+be1I
 lxdJfJNeTLo8DmKkYjCJ2l7F8BOHkEDMxJN7usHOqHhhytZHBNRWSp49prp3u/+qgDyN
 Ny3ywE/nNoJ6oqDbK32RCxbTyQRqEEx7BVigBKNYX2nGwDlgMACiFQihVntILglPPowL
 cKybtSN3z0TjCB9WI8JeEF5nOOOtiYyrdMCmAXZe9Y+SlSMqpxGJ5iw7V9tH31V1rTcU
 tD8g==
X-Gm-Message-State: AAQBX9cRKspivdV+w9XEiWaMM4xp0eSnGvdggswskF+89KxvQtbeeV0i
 qSDoeSqcF4r6H1AG53cVHOH9btCW4cm8i9elVg5dUwMV1jfr/ZIPDyqDEGI1XHYvdK5td3USSet
 ywpFPSco8pv3ksF6kM59h5M4syrA+
X-Received: by 2002:a5d:4904:0:b0:2e4:b9a3:4419 with SMTP id
 x4-20020a5d4904000000b002e4b9a34419mr4760599wrq.51.1680713676256; 
 Wed, 05 Apr 2023 09:54:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350YsWV1NZsm9PL9d146nk9+8BMVfIjYv3w+AWqlIEM2c8h5CeLBmJjgyrxOtEe+CW3pyVVa0sQ==
X-Received: by 2002:a5d:4904:0:b0:2e4:b9a3:4419 with SMTP id
 x4-20020a5d4904000000b002e4b9a34419mr4760585wrq.51.1680713675983; 
 Wed, 05 Apr 2023 09:54:35 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u17-20020adfed51000000b002c6e8af1037sm15332930wro.104.2023.04.05.09.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:54:34 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
In-Reply-To: <ZC2beu/9inolwIlr@phenom.ffwll.local>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
 <3813a2f5-c74a-4760-34ce-1c88f187c91c@suse.de>
 <ZC04hoHywz0ySzAW@phenom.ffwll.local>
 <3fd03c4c-3be6-e56b-faec-bd67a58cda09@suse.de>
 <ZC1BlNCbXPlmAhj0@phenom.ffwll.local>
 <eee11545-2a78-4556-be82-5178ea09d0d8@suse.de>
 <877cuqd1f8.fsf@minerva.mail-host-address-is-not-set>
 <ZC11J3og4Kc9ta6m@phenom.ffwll.local>
 <242ab20f-affe-b55a-6068-5ea634705cf6@suse.de>
 <ZC2beu/9inolwIlr@phenom.ffwll.local>
Date: Wed, 05 Apr 2023 18:54:33 +0200
Message-ID: <87bkk29smu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel@ffwll.ch> writes:

> On Wed, Apr 05, 2023 at 04:32:19PM +0200, Thomas Zimmermann wrote:

[...]

>> > > > 	/*
>> > > > 	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
>> > > > 	 * otherwise the vga fbdev driver falls over.
>> > > > 	 */
>> > > > 	ret = vga_remove_vgacon(pdev);
>> > 
>> > This isn't enough, we also nuke stuff that's mapping the vga fb range.

Ah, also need aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE) then.

[...]

>> int aperture_remove_legacy_vga_devices(struct pci_dev *pdev)
>> {
>> 	aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE);
>> 
>> 	return vga_remove_vgacon(pdev);
>> }
>> 
>> And that can be called from gma500 and the pci aperture helper.
>
> But you still pass a pci_dev to that helper. Which just doesn't make any
> sense to me (assuming your entire point is that this isn't just a normal
> pci device but some special legacy vga thing), but if we go with (void)
> then there's more refactoring to do because the vga_remove_vgacon also
> wants a pdev.
>
> All so that we don't call aperture_detach_devices() on a bunch of pci
> bars, which apparently is not problem for any other driver, but absolutely
> is a huge problem for gma500 somehow.
>
> I don't understand why.
>

Yeah, agreed that if vga_remove_vgacon() isn't enough and another helper
is needed then starts to get a little silly. Maybe one option is to add a
3rd param to aperture_remove_conflicting_pci_devices() and skip the logic
to iterate over PCI bars and call aperture_remove_conflicting_devices() ?

> Consider this me throwing in the towel. If you&Javier are convinced this
> makes sense please type it up and merge it, but I'm not going to type
> something that just doesn't make sense to me.

Honestly, I would just go with the double drm_aperture_remove_*() helper
calls (your original patch) unless that causes real issues. There is no
point on blocking all your series just for this IMO.

Then latter if Thomas has strong opinions can send a follow-up patch for
the gma500 driver and the aperture helpers.

> -Daniel
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

