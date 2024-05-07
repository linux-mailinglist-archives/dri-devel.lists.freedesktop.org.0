Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 625848BEC10
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 21:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CEB10F070;
	Tue,  7 May 2024 19:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bTqPEHGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2E610F070
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 19:00:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00003904;
 Tue,  7 May 2024 20:59:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715108400;
 bh=GDwAYu/twxHFJyJubt68lvyNQC2ZvWpd20JmJtBYftw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bTqPEHGCS1bKBi/ARZITdItVGikTTU7cM85mrkBdZnR/yGebvzebLe3WXMLdd3r92
 KXapBLFs6wt3UPe41WTJXLLmUPmGl9OMezFJcUg+gtSSl657qWRx6tXa2cPDeHkgBP
 G8DOhp7iaMGl1hoY4bFJxgCo8thY6sQ2DQsqePtc=
Date: Tue, 7 May 2024 21:59:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Maxime Ripard <mripard@redhat.com>, Hans de Goede <hdegoede@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
Message-ID: <20240507185954.GD20390@pendragon.ideasonboard.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
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

On Mon, May 06, 2024 at 03:38:24PM +0200, Daniel Vetter wrote:
> On Mon, May 06, 2024 at 02:05:12PM +0200, Maxime Ripard wrote:
> > On Mon, May 06, 2024 at 01:49:17PM GMT, Hans de Goede wrote:
> > > Hi dma-buf maintainers, et.al.,
> > > 
> > > Various people have been working on making complex/MIPI cameras work OOTB
> > > with mainline Linux kernels and an opensource userspace stack.
> > > 
> > > The generic solution adds a software ISP (for Debayering and 3A) to
> > > libcamera. Libcamera's API guarantees that buffers handed to applications
> > > using it are dma-bufs so that these can be passed to e.g. a video encoder.
> > > 
> > > In order to meet this API guarantee the libcamera software ISP allocates
> > > dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
> > > the Fedora COPR repo for the PoC of this:
> > > https://hansdegoede.dreamwidth.org/28153.html
> > 
> > For the record, we're also considering using them for ARM KMS devices,
> > so it would be better if the solution wasn't only considering v4l2
> > devices.
> > 
> > > I have added a simple udev rule to give physically present users access
> > > to the dma_heap-s:
> > > 
> > > KERNEL=="system", SUBSYSTEM=="dma_heap", TAG+="uaccess"
> > > 
> > > (and on Rasperry Pi devices any users in the video group get access)
> > > 
> > > This was just a quick fix for the PoC. Now that we are ready to move out
> > > of the PoC phase and start actually integrating this into distributions
> > > the question becomes if this is an acceptable solution; or if we need some
> > > other way to deal with this ?
> > > 
> > > Specifically the question is if this will have any negative security
> > > implications? I can certainly see this being used to do some sort of
> > > denial of service attack on the system (1). This is especially true for
> > > the cma heap which generally speaking is a limited resource.
> > 
> > There's plenty of other ways to exhaust CMA, like allocating too much
> > KMS or v4l2 buffers. I'm not sure we should consider dma-heaps
> > differently than those if it's part of our threat model.
> 
> So generally for an arm soc where your display needs cma, your render node
> doesn't. And user applications only have access to the later, while only
> the compositor gets a kms fd through logind. At least in drm aside from
> vc4 there's really no render driver that just gives you access to cma and
> allows you to exhaust that, you need to be a compositor with drm master
> access to the display.
> 
> Which means we're mostly protected against bad applications, and that's
> not a threat the "user physically sits in front of the machine accounts
> for", and which giving cma access to everyone would open up. And with
> flathub/snaps/... this is very much an issue.
> 
> So you need more, either:
> 
> - cgroups limits on dma-buf and dma-buf heaps. This has been bikeshedded
>   for years and is just not really moving.
> 
> - An allocator service which checks whether you're allowed to allocate
>   these special buffers. Android does that through binder.

I would split the latter into a centralized frame buffer allocator
library for userspace (James Jones' Unix device memory allocator comes
to mind), providing dma-buf instances using whatever backend is
available and suitable (DMA heaps would likely be one of them), and a
safe way to make this allocator available to applications. Exposing it
through some system services could be useful, but with proper tracking
and accounting of memory allocated through DMA heaps (and DRM, and V4L2)
we could possibly do with just a library.

What I really want is to move memory allocation for devices to a
separate component, and make everything else a consumer of those
buffers.

> Probably also some way to nuke applications that refuse to release buffers
> when they're no longer the right application. cgroups is a lot more
> convenient for that.
> 
> > > But devices tagged for uaccess are only opened up to users who are 
> > > physcially present behind the machine and those can just hit
> > > the powerbutton, so I don't believe that any *on purpose* DOS is part of
> > > the thread model. 
> > 
> > How would that work for headless devices?

-- 
Regards,

Laurent Pinchart
