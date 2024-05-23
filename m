Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47F8CCF7D
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 11:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5B810E468;
	Thu, 23 May 2024 09:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="PJKIdw7G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13A510E468
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 09:41:30 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2e1e8c880ffso12744161fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 02:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1716457289; x=1717062089; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7P0FBG/QIqolUidBUOAk5xSpyavQelBrO3qhLkdkCo4=;
 b=PJKIdw7GvEayio3+2puS7xevCEh9i69dC0qxH/tZMsDJRgwwhaXaxwCmRKR79SEfxx
 /33SApyraI5MiSaSOAU0yrP0eh0/60SypTLcUDl7/3LfI0tQXXy9TzSCcnlWDmnUKNhO
 sQ1BLu3AK1BtAjtKK90MIESJUbo0YtQNMkDqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716457289; x=1717062089;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7P0FBG/QIqolUidBUOAk5xSpyavQelBrO3qhLkdkCo4=;
 b=oO639Z7M1wy/1HEY7KXjutZQyUZMk/NwNJ6NaqX3XAYcXyL1mdmMGrNOC5Ob2s2U8w
 vu3MmrSlvTDFzXN7aayurU+9XBzfluehkYRR3+ziBPo0yVY06zdaYAoY/kE5P9avzzQA
 6BAZ89czKQMZjeeYjPjFoRi1Hp4d2qFTb+vphXtivqH63w2IC7eFxNEQ/o9Oyx0UYuWZ
 L/Nds3jv6/PQqvLhTB62PNFAW3IBsZqE1KQk8bt4szv6S6PL/UQJOqs1kqLMf6deHZWp
 3ct8QGFuqRe3wMwR4Kl6z8S2XN/0Iz98OL7/FNlo30ciJVMGl+P34YqqHhWHWh0ac94C
 JGKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL7bV1mRTcw3kJU31Dg60OawmCQL16Fn4TC7EotLsjgtGZKGVVngswGJ9mSGLwWWoSZUGmQdz/GCdzH1ji0DwuQZJvGp/lchNDwDdMosGm
X-Gm-Message-State: AOJu0Yz2QsktLoJpu/Bni6zp3aMLJc+7bkjicAGu62uWNDeRcxz7KO1H
 8a7g5l02dpLCJfU64/7x7nua7z7kROgvX9vkGq9F5ZYSYSf00hKJacKkMxK7EsM=
X-Google-Smtp-Source: AGHT+IFaHOu/jiCn9us1S7Kl07ly0fz0c0NxfGK+ttvGXc3VpkRIbozFwpms36yompxRaMGcJtJGuA==
X-Received: by 2002:a2e:7214:0:b0:2e8:e8db:34ea with SMTP id
 38308e7fff4ca-2e9496214edmr30640171fa.5.1716457288819; 
 Thu, 23 May 2024 02:41:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100ee806esm20062515e9.3.2024.05.23.02.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 02:41:28 -0700 (PDT)
Date: Thu, 23 May 2024 11:41:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
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
Message-ID: <Zk8PRuDHiS0QZLD-@phenom.ffwll.local>
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
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
 <20240522-thankful-cow-of-freedom-f0cbf8@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522-thankful-cow-of-freedom-f0cbf8@houat>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Wed, May 22, 2024 at 03:34:52PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Mon, May 06, 2024 at 03:38:24PM GMT, Daniel Vetter wrote:
> > On Mon, May 06, 2024 at 02:05:12PM +0200, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Mon, May 06, 2024 at 01:49:17PM GMT, Hans de Goede wrote:
> > > > Hi dma-buf maintainers, et.al.,
> > > > 
> > > > Various people have been working on making complex/MIPI cameras work OOTB
> > > > with mainline Linux kernels and an opensource userspace stack.
> > > > 
> > > > The generic solution adds a software ISP (for Debayering and 3A) to
> > > > libcamera. Libcamera's API guarantees that buffers handed to applications
> > > > using it are dma-bufs so that these can be passed to e.g. a video encoder.
> > > > 
> > > > In order to meet this API guarantee the libcamera software ISP allocates
> > > > dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
> > > > the Fedora COPR repo for the PoC of this:
> > > > https://hansdegoede.dreamwidth.org/28153.html
> > > 
> > > For the record, we're also considering using them for ARM KMS devices,
> > > so it would be better if the solution wasn't only considering v4l2
> > > devices.
> > > 
> > > > I have added a simple udev rule to give physically present users access
> > > > to the dma_heap-s:
> > > > 
> > > > KERNEL=="system", SUBSYSTEM=="dma_heap", TAG+="uaccess"
> > > > 
> > > > (and on Rasperry Pi devices any users in the video group get access)
> > > > 
> > > > This was just a quick fix for the PoC. Now that we are ready to move out
> > > > of the PoC phase and start actually integrating this into distributions
> > > > the question becomes if this is an acceptable solution; or if we need some
> > > > other way to deal with this ?
> > > > 
> > > > Specifically the question is if this will have any negative security
> > > > implications? I can certainly see this being used to do some sort of
> > > > denial of service attack on the system (1). This is especially true for
> > > > the cma heap which generally speaking is a limited resource.
> > > 
> > > There's plenty of other ways to exhaust CMA, like allocating too much
> > > KMS or v4l2 buffers. I'm not sure we should consider dma-heaps
> > > differently than those if it's part of our threat model.
> > 
> > So generally for an arm soc where your display needs cma, your render node
> > doesn't. And user applications only have access to the later, while only
> > the compositor gets a kms fd through logind. At least in drm aside from
> > vc4 there's really no render driver that just gives you access to cma and
> > allows you to exhaust that, you need to be a compositor with drm master
> > access to the display.
> > 
> > Which means we're mostly protected against bad applications, and that's
> > not a threat the "user physically sits in front of the machine accounts
> > for", and which giving cma access to everyone would open up. And with
> > flathub/snaps/... this is very much an issue.
> > 
> > So you need more, either:
> > 
> > - cgroups limits on dma-buf and dma-buf heaps. This has been bikeshedded
> >   for years and is just not really moving.
> 
> For reference, are you talking about:
> 
> https://lore.kernel.org/r/20220502231944.3891435-1-tjmercier@google.com
> 
> Or has there been a new version of that recently?

I think the design feedback from Tejun has changed to that system memory
should be tracked with memcg instead (but that kinda leaves the open of
what to do with cma), and only device memory be tracked with a separate
cgroups controller.

But I'm also not sure whether that would actually solve all the
tracking/isolation requirements people tossed around or just gives us
something that wont get the job done.

Either way, yes I think that was the most recent code.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
