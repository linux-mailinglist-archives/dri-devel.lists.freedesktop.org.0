Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA02F3384AF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 05:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80B06E104;
	Fri, 12 Mar 2021 04:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foo.stuge.se (foo.stuge.se [212.116.89.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BA86E104
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 04:32:39 +0000 (UTC)
Received: (qmail 5103 invoked by uid 1000); 12 Mar 2021 04:32:36 -0000
Message-ID: <20210312043236.5102.qmail@stuge.se>
Date: Fri, 12 Mar 2021 04:32:36 +0000
From: Peter Stuge <peter@stuge.se>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
References: <20210310045544.28961.qmail@stuge.se>
 <1894f3f7-bd1d-493e-8d7f-8c10917da51b@tronnes.org>
 <20210311144839.29454.qmail@stuge.se>
 <04a86207-325c-8170-6692-a87ec3b0fe4c@tronnes.org>
 <20210311200226.1166.qmail@stuge.se>
 <CAKb7UvihLX0hgBOP3VBG7O+atwZcUVCPVuBdfmDMpg0NjXe-cQ@mail.gmail.com>
 <20210311225751.2721.qmail@stuge.se>
 <CAKb7UvgRLa=_4vzeFS-ws6T28S_j8yz8Jq_ONowPcBKaBHwYkw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UvgRLa=_4vzeFS-ws6T28S_j8yz8Jq_ONowPcBKaBHwYkw@mail.gmail.com>
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
Cc: hudson@trmm.net, markus@raatikainen.cc,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, th020394@gmail.com,
 lkundrak@v3.sk, pontus.fuchs@gmail.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ilia Mirkin wrote:
> XRGB8888 means that the memory layout should match a 32-bit integer,
> stored as LE, with the low bits being B, next bits being G, etc. This
> translates to byte 0 = B, byte 1 = G, etc. If you're on a BE system,
> and you're handed a XRGB8888 buffer, it still expects that byte 0 = B,
> etc (except as I outlined, some drivers which are from before these
> formats were a thing, sort of do their own thing). Thankfully this is
> equivalent to BGRX8888 (big-endian packing), so you can just munge the
> format.

I understand! Thanks a lot for clarifying.

It makes much more sense to me that the format indeed describes
what is in memory rather than how pixels look to software.


> > > I'm not sure why you guys were talking about BE in the first place,
> >
> > I was worried that the translation didn't consider endianess.
> 
> The translation in gud_xrgb8888_to_color definitely seems suspect.

So to me this means that the gud_pipe translations from XRGB8888 to the
1-bit formats *do* have to adjust for the reversed order on BE.


> There's also a gud_is_big_endian, but I'm guessing this applies to the
> downstream device rather than the host system.

gud_is_big_endian() is a static bool wrapper around defined(__BIG_ENDIAN)
so yes, it applies to the host.

With memory layout being constant I again think gud_xrgb8888_to_color()
needs to take further steps to work correctly also on BE hosts. (Maybe
that's le32_to_cpu(*pix32), maybe drm_fb_swab(), maybe something else?)


> I didn't check if dev->mode_config.quirk_addfb_prefer_host_byte_order
> is set

I can't tell if that's helpful, probably Noralf can.


Thanks a lot

//Peter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
