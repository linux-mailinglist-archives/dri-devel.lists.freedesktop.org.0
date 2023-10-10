Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCFE7BFBF6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 14:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FA710E33E;
	Tue, 10 Oct 2023 12:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0813B10E33E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 12:59:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32d1302681cso72707f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 05:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1696942776; x=1697547576; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MvrFx99beQ1OVFt4yHCD5kP6ijOdkh8tyq+4YO1gphg=;
 b=i6OUbiFccexxF6mtD2jUhLI2WoOTLwDvOOPbNV6YFKOgdTfCgYbasFDzV93cS/MlB0
 7gFymQNRqs1BclmZOAYwSP7ovKpMBSJf5ljudrx93wHvYCRKiG45DhOT+LB5U902uYgc
 d2rCKrs87baB+kgmEi7KFtXrCSmhw/pfKEGzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696942776; x=1697547576;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MvrFx99beQ1OVFt4yHCD5kP6ijOdkh8tyq+4YO1gphg=;
 b=X3Dov4IzZF+OceSanUIar9MzZtsHqYqid3cMNhXLIr85qg3FGBjAscHxZndV0r2CUb
 QrZZQpgSOiCQ0lpktELGHHUP07k4yxzNjqVULPNrEmR9IJ1Hry26XpuS6pm7gSQrBGn3
 rPB6/vu46JfVRsbom/iAi4KoiI4IVUv5O007fHpZgaEVmPTOjfg2bn8Aw1dkd4iTlN1u
 kYqHXGrgM69mZ097MqLD2DvAqoFQmBoWZlWjeOsOm7DnzHc2H9EGLzDsf7a/U+RYqEiD
 TSQXIRJ4A+XkTHOwK1sr7OR/0J0s440wIOmpeEEdrVV+uSitjfVYw9A0fzzty4Kos1hQ
 9kYA==
X-Gm-Message-State: AOJu0YxAmCMghUmz8N2xKuuwvrRgbL9KLMJlMmXw6iqbceM+PxiKgFuR
 /oUbtgR4uc/ks/9wOdYpdLo9UQ==
X-Google-Smtp-Source: AGHT+IG/r6Qa+ugPJtFgduVsUIlDNJMeV9U4atrx6f6LFyQDkmPp7Mqpxtw2ge65QN8JdDdqiWyubw==
X-Received: by 2002:adf:f08a:0:b0:31d:3669:1c48 with SMTP id
 n10-20020adff08a000000b0031d36691c48mr14570505wro.7.1696942776266; 
 Tue, 10 Oct 2023 05:59:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05600c230b00b004053a6b8c41sm14031351wmo.12.2023.10.10.05.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 05:59:35 -0700 (PDT)
Date: Tue, 10 Oct 2023 14:59:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Message-ID: <ZSVKtbkm6Sq_kkk7@phenom.ffwll.local>
References: <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <cd54b5ab-5ac8-4569-991c-bf6e062e6400@suse.de>
 <63wdz6ns6wsu3avztqebmeo4aa4ltwmmmywlam3xe6fmftcf3p@5icc2cvy6xvh>
 <0a6c2a07-bf44-409a-8a09-827410f011a6@tronnes.org>
 <5l4wotvmflkl42ms2wbw6mcz7bevk246abouj33fjn5wzfh72i@3vhxratfu3xi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5l4wotvmflkl42ms2wbw6mcz7bevk246abouj33fjn5wzfh72i@3vhxratfu3xi>
X-Operating-System: Linux phenom 6.5.0-1-amd64 
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 10, 2023 at 02:15:47PM +0200, Maxime Ripard wrote:
> On Tue, Oct 10, 2023 at 01:29:52PM +0200, Noralf Trønnes wrote:
> > 
> > 
> > On 10/10/23 11:25, Maxime Ripard wrote:
> > > 
> > > 
> > > On Tue, Oct 10, 2023 at 10:55:09AM +0200, Thomas Zimmermann wrote:
> > >>>> So if I understand correctly, drm_panic would pre-allocate a plane/commit,
> > >>>> and use that when a panic occurs ?
> > >>>
> > >>> And have it checked already, yes. We would only wait for a panic to
> > >>> happen to pull the trigger on the commit.
> > >>>
> > >>>> I have two concern about this approach:
> > >>>> - How much memory would be allocated for this ? a whole framebuffer can be
> > >>>> big for just this use case.
> > >>
> > >> As I outlined in my email at [1], there are a number of different scenarios.
> > >> The question of atomic state and commits is entirely separate from the DRM
> > >> panic handler. We should not throw them together. Whatever is necessary is
> > >> get a scanout buffer, should happen on the driver side of
> > >> get_scanout_buffer, not on the drm_panic side.
> > >>
> > >> [1] https://lore.kernel.org/dri-devel/39bd4c35-8a61-42ee-8675-ccea4f5d4ac6@suse.de/T/#m22f116e9438e00a5f0a9dc43987d4153424f8be1
> > >>
> > >>>
> > >>> I'dd expect a whole framebuffer for the current
> > >>> configuration/resolution. It would be typically 4MB for a full-HD system
> > >>> which isn't a lot really and I guess we can always add an option to
> > >>> disable the mechanism if needed.
> > >>>
> > >>>> - I find it risky to completely reconfigure the hardware in a panic handler.
> > >>>
> > >>> I would expect to only change the format and base address of the
> > >>> framebuffer. I guess it can fail, but it doesn't seem that different to
> > >>> the async plane update we already have and works well.
> > >>
> > >> The one thing I don't understand is: Why should we use atomic commits in the
> > >> first place? It doesn't make sense for firmware-based drivers.
> > > 
> > > Because this is generic infrastructure that is valuable for any drivers
> > > and not only firmware-based drivers?
> > > 
> > >> In some drivers, even the simple ast, we hold locks during the regular
> > >> commit. Trying to run the panic commit concurrently will likely give a
> > >> deadlock.
> > > 
> > > You're in the middle of a panic. Don't take any locks and you won't deadlock.
> > > 
> > >> In the end it's a per-driver decision, but in most cases, the driver can
> > >> easily switch to a default mode with some ad-hoc code.
> > > 
> > > When was the last time a per-driver decision has been a good thing? I'm
> > > sorry, but the get_scanout_buffer approach buffer won't work for any
> > > driver out there.
> > > 
> > > I'm fine with discussing alternatives if you don't like the ones I
> > > suggested, but they must allow the panic handler infrastructure to work
> > > with any driver we have, not just 4.
> > > 
> > 
> > Why can't we use the model[1] suggested by Daniel using a draw_pixel
> > callback giving drivers full control on how they can put a pixel on the
> > display?
> 
> I share kind of the same general ideas/conclusions: "qthe idea is that
> all the fb selection and lookup is handled in shared code (and with
> proper locking, but only for atomic drivers)."
> 
> 2016 is a bit old though and multiple developments happened since
> (secure playback is a thing now, framebuffer compression too), so I
> still think that their expectation that the framebuffer is accessible to
> / writable by the CPU no longer holds true.

I think largely it should still be ok, because the idea behind the draw_xy
callback was that the driver could take care of anything special, like
- tiling
- clearing compression bits so that just writing the raw pixels works (if
  your compression format allows for that)
- handling any differences in how the pixels need to be written, like
  cache flushing, mmio_write vs normal memory, amd also has peek/poke
  registers to be able to write even into unmappable memory

What would probably be a good idea is to do an s/void */uinptr_t/ over my
interface proposal, or maybe an even more opaque cookie since really the
only thing you can do is get the void * that ->panic_vmap returns and pass
it into ->panic_draw_xy.

I thought (but I didn't dig through details) that the panic fb struct is
essentially meant to serve this purpose in the current series?

> > This will even work for the AMD debug interface.
> > In the linear CPU accessible buffer case, we can provide a helper for
> > that, maybe we can do helpers for other common cases as well.
> 
> Yeah, their idea of a panic_draw would work great for that.
> 
> > Adding to that we would need a panic_setup/enter and panic_teardown/exit
> > callback.
> 
> What for?

So panic teardown would be for testing in CI, to make it non-destructive
and clean up anything panic_vmap (or _enter or whatever you call it) has
done. I thought John Oggness was also looking into how the new panic
handlers/consoles could be made testable in the panic paths, including
lock stealing and getting called from nmi.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
