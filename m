Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1C6862244
	for <lists+dri-devel@lfdr.de>; Sat, 24 Feb 2024 03:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B668110ECF7;
	Sat, 24 Feb 2024 02:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="DSybjcX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1B210ECF7
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Feb 2024 02:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1708741243; bh=C9KTnoIvzRirFFoTDsfaGkbmhPKX12ljHuTJlzd3+zE=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=DSybjcX9AMbSWU68OgBepSRjYo9ujw93XLgZS/y7mGfXOoL3gocWSDxffIWE9ar6t
 8K50jFqwd7EF7CPrf/tOvhAS8SM1uYQVZKoMBG0yMKMgGtyeMu09UwQP4VQWQbIxro
 Q8d4nN2Enei26NrAreLFaTImyqwvDI82JjlB8VVY=
Date: Sat, 24 Feb 2024 03:20:43 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/sun4i: Fix layer zpos change/atomic modesetting
Message-ID: <5h7jcwsdlpe7w2xylbhlw2asfww3znqlmlnszwvvosz5ssokkq@dxhn4v4sy4nq>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240216190430.1374132-1-megi@xff.cz>
 <20240216190430.1374132-4-megi@xff.cz>
 <inuhwnlexpt6dpre4uailtvytjhms4uqeerzehbntczurhcxol@fc4nvkdwffdd>
 <2448947.jE0xQCEvom@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2448947.jE0xQCEvom@jernej-laptop>
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

On Thu, Feb 22, 2024 at 09:02:53PM +0100, Jernej Škrabec wrote:
> Dne sreda, 21. februar 2024 ob 14:45:20 CET je Maxime Ripard napisal(a):
> > Hi,
> > 
> > On Fri, Feb 16, 2024 at 08:04:26PM +0100, Ondřej Jirman wrote:
> > > From: Ondrej Jirman <megi@xff.cz>
> > > 
> > > Identical configurations of planes can lead to different (and wrong)
> > > layer -> pipe routing at HW level, depending on the order of atomic
> > > plane changes.
> > > 
> > > For example:
> > > 
> > > - Layer 1 is configured to zpos 0 and thus uses pipe 0. No other layer
> > >   is enabled. This is a typical situation at boot.
> > > 
> > > - When a compositor takes over and layer 3 is enabled,
> > >   sun8i_ui_layer_enable() will get called with old_zpos=0 zpos=1, which
> > >   will lead to incorrect disabling of pipe 0 and enabling of pipe 1.
> > > 
> > > What happens is that sun8i_ui_layer_enable() function may disable
> > > blender pipes even if it is no longer assigned to its layer.
> > > 
> > > To correct this, move the routing setup out of individual plane's
> > > atomic_update into crtc's atomic_update, where it can be calculated
> > > and updated all at once.
> > > 
> > > Remove the atomic_disable callback because it is no longer needed.
> > > 
> > > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > 
> > I don't have enough knowledge about the mixers code to comment on your
> > patch, so I'll let Jernej review it. However, this feels to me like the
> > pipe assignment is typically the sort of things that should be dealt
> > with device-wide, and in atomic_check.
> 
> In DE2 and DE3.0, you cannot move planes between mixers (crtcs), because each
> one is hardwired to specific mixer. Movable planes are the feature of DE3.3
> and one of the pain points for upstreaming the code. Anyway, this commit only
> addresses current issue of enabling and disabling planes and handling zpos.
> 
> In atomic check you can only precalculate final register values, but I don't
> see any benefit doing that. I think that this code elegantly solves current
> issue of enabling or disabling wrong plane in certain situations, so:
> 
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Note, if there is new revision, please rewrite blender regmap_update_bits()
> to regmap_write(). Since there is HW issue with reads, I would like to
> get rid of regmap_update_bits() calls eventually.

I've looked into it and I can probably rewrite these quite readily:

+	regmap_update_bits(mixer->engine.regs,
+			   SUN8I_MIXER_BLEND_ROUTE(bld_base),
+			   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(0) |
+			   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(1) |
+			   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(2) |
+			   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(3),
+			   route);

The mask here covers all implemented bits in the register.

+	regmap_update_bits(mixer->engine.regs,
+			   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
+			   SUN8I_MIXER_BLEND_PIPE_CTL_EN(0) |
+			   SUN8I_MIXER_BLEND_PIPE_CTL_EN(1) |
+			   SUN8I_MIXER_BLEND_PIPE_CTL_EN(2) |
+			   SUN8I_MIXER_BLEND_PIPE_CTL_EN(3),
+			   pipe_en);
+

The mask here doesn't cover BLD_FILL_COLOR_CTL.Px_FCEN bits that implement solid
color filling. But those can be 0 anyway except for pipe0 which is hardcoded by
the driver to 1, I think:

631         /*
632          * Set fill color of bottom plane to black. Generally not needed
633          * except when VI plane is at bottom (zpos = 0) and enabled.
634          */
635         regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
636                      SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));

I will not be able to get rid of regmap_update_bits in sun8i_layer_enable
because that register there has other important things in it like framebuffer
pixel format, etc.

kind regards,
	o.

> Best regards,
> Jernej
> 
> > 
> > If I'm talking non-sense, it would be great to mention at least why that
> > can't be an option in the commit log.
> > 
> > Maxime
> > 
> 
> 
> 
> 
