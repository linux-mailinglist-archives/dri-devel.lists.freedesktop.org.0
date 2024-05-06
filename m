Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAFD8BCF2C
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2B210F081;
	Mon,  6 May 2024 13:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="LoMLE/RA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4A410E7C7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:38:29 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-34e6aaa4f51so195632f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 06:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715002707; x=1715607507; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=05pEfdeTjP/gT4q1VDqtZ2Mm8b7W7bMEgQ0JTj2r+x4=;
 b=LoMLE/RA5DRTToJURS2eF15hd/EWK4YdPLx2mVTly9mXNGP5YEliBfmKlydc7Kbn0q
 S7uX0tjv4a9osIU1d6m7EWW3FPPm7mi7gCiGNUQsa9TUz6e8vTqH+/7lIlo4QnHHwtpJ
 a9xVMZ3awOgcHlrsORtnyRii7lHC8VM9T9T+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715002707; x=1715607507;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=05pEfdeTjP/gT4q1VDqtZ2Mm8b7W7bMEgQ0JTj2r+x4=;
 b=ekT95TiSyRW3KKlV30ZDIo2zQHhPnSW9IcHQ5i2118t8kmUUL3x+32S56XbNo2jQyn
 3CbimmHVk2X2aVxUUNpy1QfdfIlHlZwRB6NWxkRhs12+fRnYde0PzNJpYzS3CcHewERC
 tLmcby7PnNygzKdjFbiILe/FQXLbOsZcxGaowZB4zsTBgJb8y6K2r0qcWsufTXrswbl+
 nphkqL5jKbC66nzi47uMV71eO/W0gaMQlR0qLVyjvjJh2Xjlx2vmpFS913t1qvKcajvR
 2mrBKAgTXO6fqwnyy2paoAk8D+jpcmvAaSd2CVHYNgSBkcSF2hb3MloAUbap/QzYeu5n
 aQkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXahgFh03B2YylK8YMudqmrW0dLTI1RRMDgdCQHV8NyK+umuwWRFUI+XnAOwtKbA87bUylteI+QpfLGrqMGBl5Cuv3zRbq4M5DtwrOmI62O
X-Gm-Message-State: AOJu0YwEkITllcM19oPMxE54pTjYfR3eF+H3VTbP6w6lU9M0xF7frbAl
 w7wrXwsFb83113PORKviHXegsy1jS+eC/yJ3O8XKoXjxdkaAyZqpo5pSbpac54w=
X-Google-Smtp-Source: AGHT+IH7ayM64/spWVTg0bt9PNCN0djXyEwU/JmnpSrNT6A7B8ioiDdqWIOL0raGgmZcVRIsEpla+w==
X-Received: by 2002:a05:600c:46cf:b0:41a:bb50:92bb with SMTP id
 q15-20020a05600c46cf00b0041abb5092bbmr7391993wmo.0.1715002707370; 
 Mon, 06 May 2024 06:38:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0041bd85cd3f2sm16051523wmp.19.2024.05.06.06.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 06:38:26 -0700 (PDT)
Date: Mon, 6 May 2024 15:38:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506-dazzling-nippy-rhino-eabccd@houat>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Mon, May 06, 2024 at 02:05:12PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Mon, May 06, 2024 at 01:49:17PM GMT, Hans de Goede wrote:
> > Hi dma-buf maintainers, et.al.,
> > 
> > Various people have been working on making complex/MIPI cameras work OOTB
> > with mainline Linux kernels and an opensource userspace stack.
> > 
> > The generic solution adds a software ISP (for Debayering and 3A) to
> > libcamera. Libcamera's API guarantees that buffers handed to applications
> > using it are dma-bufs so that these can be passed to e.g. a video encoder.
> > 
> > In order to meet this API guarantee the libcamera software ISP allocates
> > dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
> > the Fedora COPR repo for the PoC of this:
> > https://hansdegoede.dreamwidth.org/28153.html
> 
> For the record, we're also considering using them for ARM KMS devices,
> so it would be better if the solution wasn't only considering v4l2
> devices.
> 
> > I have added a simple udev rule to give physically present users access
> > to the dma_heap-s:
> > 
> > KERNEL=="system", SUBSYSTEM=="dma_heap", TAG+="uaccess"
> > 
> > (and on Rasperry Pi devices any users in the video group get access)
> > 
> > This was just a quick fix for the PoC. Now that we are ready to move out
> > of the PoC phase and start actually integrating this into distributions
> > the question becomes if this is an acceptable solution; or if we need some
> > other way to deal with this ?
> > 
> > Specifically the question is if this will have any negative security
> > implications? I can certainly see this being used to do some sort of
> > denial of service attack on the system (1). This is especially true for
> > the cma heap which generally speaking is a limited resource.
> 
> There's plenty of other ways to exhaust CMA, like allocating too much
> KMS or v4l2 buffers. I'm not sure we should consider dma-heaps
> differently than those if it's part of our threat model.

So generally for an arm soc where your display needs cma, your render node
doesn't. And user applications only have access to the later, while only
the compositor gets a kms fd through logind. At least in drm aside from
vc4 there's really no render driver that just gives you access to cma and
allows you to exhaust that, you need to be a compositor with drm master
access to the display.

Which means we're mostly protected against bad applications, and that's
not a threat the "user physically sits in front of the machine accounts
for", and which giving cma access to everyone would open up. And with
flathub/snaps/... this is very much an issue.

So you need more, either:

- cgroups limits on dma-buf and dma-buf heaps. This has been bikeshedded
  for years and is just not really moving.

- An allocator service which checks whether you're allowed to allocate
  these special buffers. Android does that through binder.

Probably also some way to nuke applications that refuse to release buffers
when they're no longer the right application. cgroups is a lot more
convenient for that.
-Sima

> > But devices tagged for uaccess are only opened up to users who are 
> > physcially present behind the machine and those can just hit
> > the powerbutton, so I don't believe that any *on purpose* DOS is part of
> > the thread model. 
> 
> How would that work for headless devices?
> 
> Maxime



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
