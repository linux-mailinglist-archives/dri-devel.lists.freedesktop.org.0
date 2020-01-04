Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C03EA130205
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE74D6E413;
	Sat,  4 Jan 2020 11:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3FB6E39E
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 04:52:16 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 20so10217521wmj.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 20:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ub5U+JKXs6CYQnvfA4X/Orw9wDGKxgKMlDkpDNe+uK4=;
 b=rqYpO+5gTgY8euwKKzgtoX3RIlkudSRJUQZl2Y1V04ooefFgLrDKPRWK6zd3V7UdA/
 XrVwXMslhSV/BOLZ8Q4CL2sYfEs2PJuLykoPtFzfqRe8gLuwKe2+SDxGl3UXSOHyWmfn
 AXRpqXhYeqYH5Su6uOLs1+RQ2zKsGQ7g1CdufM0IydM1p07gvAropie6j+hMk77sayky
 lM844h83iOSMRVtTVO+SB6jS3+uKwXZ/Z3t0iKNCblDo4pmSRiUqVuRzZY24NsVqp+WU
 NSFyU9Uzgrb+rSu/l8ecb9zHCkRHGNVbWeP8DegmpdPQF5WkwUvf5mUr5sZHl1+4wpB/
 G2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=Ub5U+JKXs6CYQnvfA4X/Orw9wDGKxgKMlDkpDNe+uK4=;
 b=gBzOj/7GRsbBO9XgbDDgFYuL5zfhPRMYSmFQvfz86gV8DeKiLGpKV8MKfHj+5ndpLl
 9vNxDRjjtiUIEDhwVwPNUeOa9wFYprmwBBdEIxSvs2HV9qQfKelR0aoERwt8BQiub3f7
 M7lzWhciXEtIp3cidRI6DvTAeTvoVH81hLS6QcSqkQgfg5dYTBWOeVzTQVwkChVtFxbp
 1rlEDkdBCSLu0kq/HZuj6ooLK7ux/BlS1/t4HPJ2Aj3qm35mb+9vQR7PsljLFSkEwAJb
 dSDV86mZ5vYCdel8PRDn5wzzggA+lQ8XZw1nEkmiZttde3qNiM7YOVeoCh2X5SGVMUfe
 Hkig==
X-Gm-Message-State: APjAAAXNpcQChiBL0N/n/5xwh2O6JtG6HRai1768CNWSYcwAQ0ad10gt
 hjnhkuS6prWTf08ooT84HaI=
X-Google-Smtp-Source: APXvYqyTsk/O6OnZ4nTzziWFvRy41Ja62tD4CeLndXooiMF5USLRJbio1BgUghIno6tGSM92bS1yxQ==
X-Received: by 2002:a1c:9849:: with SMTP id a70mr21535806wme.76.1578113534714; 
 Fri, 03 Jan 2020 20:52:14 -0800 (PST)
Received: from chinchilla (dutchdutch.xs4all.nl. [80.101.94.16])
 by smtp.gmail.com with ESMTPSA id g7sm63293888wrq.21.2020.01.03.20.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 20:52:13 -0800 (PST)
Date: Sat, 4 Jan 2020 05:52:11 +0100
From: Matthijs van Duin <matthijsvanduin@gmail.com>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
Message-ID: <20200104045211.GA10025@chinchilla>
Mail-Followup-To: Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org,
 "H . Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>
References: <20191221005711.47314-1-tony@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191221005711.47314-1-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2019 at 04:57:11PM -0800, Tony Lindgren wrote:
> On my droid4 I noticed bad constant tearing on the LCD with stellarium in
> landscape mode with xorg-video-omap rotated with xrandr --rotate right.
> Every second or so update gets squeezed down in size to only the top half
> of the LCD panel.

Odd, there's not really a good reason for rotation to have any effect on
whether tearing happens or not.

BTW, with "top half", I assume you mean the top of the screen (i.e.
right side of the display), not the top of the display (i.e. left side
of the screen) ?


> This issue does not happen with xrandr --rotate normal, or when HDMI
> display is also connected.

Ehhhh, mirroring onto HDMI fixes the problem?  Strange


> Looking around what might affect BO_TILED, I noticed Matthijs had this
> change in his earlier pyra tiler patches. The earlier patch "XXX omapdrm:
> force tiled buffers to be pinned and page-aligned" has no commit log
> though, so I'm not sure what other issues this might fix.

This is just part of a hacky patch series to improve performance for
userspace access to tiled buffers.  Page alignment has no effect by
itself, but it's necessary to allow the tiled memory allocated by
tiled_reserve_2d() to be mapped directly into userspace instead of using
the really slow "usergart" mechanism.

You can find the full patch series in github.com/mvduin/linux branch
4.15/patch/tiler-fast (based on mainline 4.15-rc6):

ae664249050b ARM: introduce pgprot_device()
fc1e8ffd1334 drm: omapdrm: improve choice of memory type for tiled memory
   these improve performance on omap5/dra7 by mapping tiled buffers as
   "device" memory by default instead of the pointlessly slow "strongly
   ordered" which is currently used as a workaround for the
   incompatibility between TILER and the bizarre way the ARM Cortex-A15
   implements loads from normal non-cacheable memory.

3d4c98cc47dd XXX omapdrm: factor out _omap_gem_(un)pin
70593563f531 XXX omapdrm: force tiled buffers to be pinned and page-aligned
e061e454afd5 XXX omapdrm: fast userspace mapping of tiled buffers
   these greatly improve performance of userspace access to tiled
   buffers (on all devices that use tiler) at the expense of using more
   tiler virtual memory.  note that tiler virtual memory is a less
   scarce resource on omap5/dra7 where 2d and 1d mappings have separate
   page tables than on omap4 where they share a page table.

None of this should have any impact on tearing.


Matthijs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
