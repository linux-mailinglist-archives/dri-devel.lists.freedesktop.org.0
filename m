Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124D15233C6
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 15:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2135710FADF;
	Wed, 11 May 2022 13:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BE410FADF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 13:16:02 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id gh6so4082455ejb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 06:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=yKAX1BFitoF5KnIE0atLfue5Z05Vzelo2xc7M7PzQVc=;
 b=Uven7JTz762OOS3tIRaxkeeai+ObuaVDKDLwAeDRBCUN6bYFLFApz3TVF/1+VDO5TY
 IzqFAx87iX/LKixBIaJlt4Iih8fknchC+UWxXykiAGVO+NCAyhNBsyM6Ot9suClErx2v
 i3VjKym9eq6P1dW2YnbQOX6Ny5L5C9mf+cRz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=yKAX1BFitoF5KnIE0atLfue5Z05Vzelo2xc7M7PzQVc=;
 b=YztBizP8Q7wpzFzK7pFSV2MUmDkpN2bMsdwFFMWxucUKaoq22BjeQPtgvVQ/uLREtt
 g0ORgtR7KSsrpPxC5Mr8umFZy9+zDHqfGs58kQLilsx1G5MOZ6WHVB4+930BrMQvqAWF
 Ja0Xu71Ne7Nlcxi6vhWmh5hdpVhm1QnF4frkTSkbYNDxozVFaf1sCsyuHN9fPlGsYHrd
 jTkwKJzUXpYc+aYDi2sjXMiKtA8pRgBRAQ2909eZBDvCYgzyoc2RVccSEjELOlrHFJGr
 8ytGzFmywjxRLepr2KAeLIkwBiogBz9PVsJIV/L5ui9W6aPZ8sIz4puXSm3yZao4jQzJ
 jeew==
X-Gm-Message-State: AOAM530MZ9/w1O8EI27T1MNxOusORKQI5kUrdJpqXf9T4uhQSdGc9yfv
 SgeF/mpo7JbARZrLFicMOxKkMw==
X-Google-Smtp-Source: ABdhPJyyc2xJQFzy80r3nQdKXjSgniAcs50KbR6WAfiJEpH171gpXCA+L0Q5OZzggqfw/NhHZNKwpA==
X-Received: by 2002:a17:907:6e8b:b0:6fa:82f5:14bd with SMTP id
 sh11-20020a1709076e8b00b006fa82f514bdmr12877746ejc.182.1652274960045; 
 Wed, 11 May 2022 06:16:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 md26-20020a170906ae9a00b006f3ef214e26sm974974ejb.140.2022.05.11.06.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 06:15:58 -0700 (PDT)
Date: Wed, 11 May 2022 15:15:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
Message-ID: <Ynu3DJJJV7TaSzfl@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <51254d3d-af8d-61b3-e8a2-8fd0e583e783@suse.de>
 <2c59cd79-76d4-7829-e1db-88bc31396c8a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c59cd79-76d4-7829-e1db-88bc31396c8a@redhat.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 09, 2022 at 10:00:41PM +0200, Javier Martinez Canillas wrote:
> Hello Thomas,
> 
> On 5/9/22 20:32, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 09.05.22 um 18:33 schrieb Javier Martinez Canillas:
> >> On 5/9/22 17:51, Andrzej Hajda wrote:
> >>
> >> [snip]
> >>
> >>>>>> +
> >>>>> Regarding drm:
> >>>>> What about drm_fb_helper_fini? It calls also framebuffer_release and is
> >>>>> called often from _remove paths (checked intel/radeon/nouveau). I guess
> >>>>> it should be fixed as well. Do you plan to fix it?
> >>>>>
> >>>> I think you are correct. Maybe we need something like the following?
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> >>>> index d265a73313c9..b09598f7af28 100644
> >>>> --- a/drivers/gpu/drm/drm_fb_helper.c
> >>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
> >>>> @@ -631,7 +631,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
> >>>>           if (info) {
> >>>>                   if (info->cmap.len)
> >>>>                           fb_dealloc_cmap(&info->cmap);
> >>>> -               framebuffer_release(info);
> > 
> > After reviewing that code,  drm_fb_helper_fini() appears to be called 
> > from .fb_destroy (see drm_fbdev_release).  The code is hard to follow 
> > though.  If there another way of releasing the framebuffer here?
> > 
> 
> Andrzej mentioned intel/radeon/nouveau as example, I only looked at i915
> and the call chain is the following as far as I can tell:
> 
> struct pci_driver i915_pci_driver = {
> ...
>         .remove = i915_pci_remove,
> ...
> };
> 
> 
> i915_driver_remove
>   intel_modeset_driver_remove_noirq
>     intel_fbdev_fini
>       intel_fbdev_destroy
>         drm_fb_helper_fini
>           framebuffer_release
>               
> So my underdestanding is that if a program has the emulated fbdev device
> opened and the i915 module is removed, then a use-after-free would be
> triggered on drm_fbdev_fb_destroy() once the program closes the device:
> 
> drm_fbdev_fb_destroy
>   drm_fbdev_release(info->par); <-- info was already freed on .remove

Yeah the old drivers that haven't switched over to the drm_client based
fbdev emulations are all kinds of wrong and release it too early.

Note that they don't use the provided ->remove hook, since that would
result in double-cleanup like you point out. Those old drivers work more
like all the other fbdev drivers where all the cleanup is done in
->remove, and if it's a real hotunplug you just die in fire :-/

Switching them all over to the drm_client based fbdev helpers and
unexporting these old (dangerous!) functions would be really neat. But
it's also a loooooot of work, and generally those big drivers don't get
hotunplugged.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
