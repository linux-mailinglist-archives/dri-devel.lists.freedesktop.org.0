Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C526A9002B7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 13:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0D110EC08;
	Fri,  7 Jun 2024 11:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="s/GLjwNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD6310EC09
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 11:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1717761248; bh=KmeA7Hp+ectQHT1nWYvVe5FCdGO/t++fiRlpFmSeqG4=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=s/GLjwNjTMvYUbTNV1Pq5ffs6tfHij1lsbCAVnymUN+S0JREZJT3PZjykzKAg4MDk
 9+JxVBOVTgofYptMakEJ3+Bq+yLU8RVxQpk5+P5gPUTiPVs4A2REIzPZjBeOZ800v3
 sZrYGgO4Jx3JADgNKZEd6wYnCQseima4IlfNj28c=
Date: Fri, 7 Jun 2024 13:54:08 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 0/3] Move blender setup from individual planes to crtc
 commit in sun4i-drm
Message-ID: <fpkbzbcuzwl5nqixhffzf3jjjungym3xba3xtpxqxnzza447dd@izuewtsaprsp>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240224150604.3855534-1-megi@xff.cz>
 <wynuwtyn2skchb7gc5qixql2pxnb2nqvbmrda6s53u7nt5ki7n@hqb46kttkhee>
 <2725781.mvXUDI8C0e@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2725781.mvXUDI8C0e@jernej-laptop>
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

Hi Maxime,

On Sun, Apr 21, 2024 at 09:52:58PM GMT, Jernej Škrabec wrote:
> Dne petek, 19. april 2024 ob 15:36:17 GMT +2 je Ondřej Jirman napisal(a):
> > Hi,
> > 
> > On Sat, Feb 24, 2024 at 04:05:57PM GMT, megi xff wrote:
> > > From: Ondrej Jirman <megi@xff.cz>
> > > 
> > > This series refactors blender setup from individual planes to a common
> > > place where it can be performed at once and is easier to reason about.
> > > 
> > > In the process this fixes a few bugs that allowed blender pipes to be
> > > disabled while corresponding DRM planes were requested to be enabled.
> > > 
> > > Please take a look. :)
> > > 
> > > v2:
> > > - use regmap_write where possible
> > > - add review tags
> > 
> > It would be nice to have this applied.
> 
> Maxime,
> 
> do you mind applying?

Pretty please :) It would be nice if this did not miss another merge cycle.

Maxime, this is the solution you hinted at back in 2019:

https://lore.kernel.org/all/20191003113802.tyecgkb6r3piin35@gilmour/

Let's get this fixed. Or anyone else who can pull this to DRM tree.

Thanks and kind regards,
	o.

> Best regards,
> Jernej
> 
> > 
> > Kind regards,
> > 	o.
> > 
> > > Thank you very much,
> > > 	Ondřej Jirman
> > > 
> > > Ondrej Jirman (3):
> > >   drm/sun4i: Unify sun8i_*_layer structs
> > >   drm/sun4i: Add more parameters to sunxi_engine commit callback
> > >   drm/sun4i: Fix layer zpos change/atomic modesetting
> > > 
> > >  drivers/gpu/drm/sun4i/sun4i_backend.c  |  4 +-
> > >  drivers/gpu/drm/sun4i/sun4i_crtc.c     |  2 +-
> > >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 70 ++++++++++++++++++++-
> > >  drivers/gpu/drm/sun4i/sun8i_mixer.h    | 20 ++++++
> > >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 85 +++----------------------
> > >  drivers/gpu/drm/sun4i/sun8i_ui_layer.h | 20 ++----
> > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 86 +++-----------------------
> > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.h | 20 ++----
> > >  drivers/gpu/drm/sun4i/sunxi_engine.h   | 13 +++-
> > >  9 files changed, 125 insertions(+), 195 deletions(-)
> > > 
> > 
> 
> 
> 
> 
