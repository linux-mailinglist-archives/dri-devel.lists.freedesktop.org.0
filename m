Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BFAA17445
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 22:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B12310E494;
	Mon, 20 Jan 2025 21:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qx8ObFF6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F22910E03E;
 Mon, 20 Jan 2025 21:48:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20F09594;
 Mon, 20 Jan 2025 22:47:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1737409643;
 bh=r0+g+ZCdK0POCZwWz1AJHnqADua8SHS7THl9ygGv/U4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qx8ObFF6Z0aGnE6eqxVtR+8rHY8H/PHUzl17vLOFqrT1yjU4z2VRencmL5SQdFZBI
 bNpRtG3+GVLzUw5iQkjiCUk1+2rWJHAZD4uQESj31UkByyTD5Zd+WvQGA/AeXAlD1n
 xN3HHnYLDDIzI2IByGlRx6/VJIfO5Pkud8i0z6AA=
Date: Mon, 20 Jan 2025 23:48:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Brian Starkey <brian.starkey@arm.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
Message-ID: <20250120214817.GA27438@pendragon.ideasonboard.com>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
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

On Tue, Dec 17, 2024 at 11:13:05AM +0100, Michel Dänzer wrote:
> On 2024-12-17 10:14, Brian Starkey wrote:
> > On Sun, Dec 15, 2024 at 03:53:14PM +0000, Marek Olšák wrote:
> >> The comment explains the problem with DRM_FORMAT_MOD_LINEAR.
> >>
> >> Signed-off-by: Marek Olšák <marek.olsak@amd.com>
> >>
> >> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> >> index 78abd819fd62e..8ec4163429014 100644
> >> --- a/include/uapi/drm/drm_fourcc.h
> >> +++ b/include/uapi/drm/drm_fourcc.h
> >> @@ -484,9 +484,27 @@ extern "C" {
> >>   * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the DRM_ADDFB2 ioctl),
> >>   * which tells the driver to also take driver-internal information into account
> >>   * and so might actually result in a tiled framebuffer.
> >> + *
> >> + * WARNING:
> >> + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR, but only
> >> + * support a certain pitch alignment and can't import images with this modifier
> >> + * if the pitch alignment isn't exactly the one supported. They can however
> >> + * allocate images with this modifier and other drivers can import them only
> >> + * if they support the same pitch alignment. Thus, DRM_FORMAT_MOD_LINEAR is
> >> + * fundamentically incompatible across devices and is the only modifier that
> >> + * has a chance of not working. The PITCH_ALIGN modifiers should be used
> >> + * instead.
> >>   */
> >>  #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)
> >>
> >> +/* Linear layout modifiers with an explicit pitch alignment in bytes.
> >> + * Exposing this modifier requires that the pitch alignment is exactly
> >> + * the number in the definition.
> >> + */
> >> +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, 1)
> > 
> > Why do we want this to be a modifier? All (?) of the other modifiers
> > describe properties which the producer and consumer need to know in
> > order to correctly fill/interpret the data.
> > 
> > Framebuffers already have a pitch property which tells the
> > producer/consumer how to do that for linear buffers.
> 
> At this point, the entity which allocates a linear buffer on device A
> to be shared with another device B can't know the pitch restrictions
> of B. If it guesses incorrectly, accessing the buffer with B won't
> work, so any effort allocating the buffer and producing its contents
> will be wasted.
> 
> > Modifiers are meant to describe framebuffers, and this pitch alignment
> > requirement isn't really a framebuffer property - it's a device
> > constraint. It feels out of place to overload modifiers with it.
> > 
> > I'm not saying we don't need a way to describe constraints to
> > allocators, but I question if modifiers the right mechanism to
> > communicate them?
>
> While I agree with your concern in general, AFAIK there's no other
> solution for this even on the horizon, after years of talking about
> it. The solution proposed here seems like an acceptable stop gap,
> assuming it won't result in a gazillion linear modifiers.

Flipping that argument, the reason why we still have no solution is
because we've constantly accepted stop-gap measures. Maybe it's time to
stop. It may feel a bit unfair to Marek that everybody until know got
away with hacks, but I don't think he would be left alone designing a
proper solution.

-- 
Regards,

Laurent Pinchart
