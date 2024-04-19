Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C066D8AAF95
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 15:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D20910FEEF;
	Fri, 19 Apr 2024 13:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="P5wnIWlP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 348 seconds by postgrey-1.36 at gabe;
 Fri, 19 Apr 2024 13:42:08 UTC
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C648C10FEEF
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 13:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1713533777; bh=m+aW3ZV1GbE1e9yfgDFlcGvNARGgqlrucJS6VWZSudI=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=P5wnIWlPxezCqS2wvKd6KcgnwYxU+XsjnFt1xIkJTx20A17TE15EBcLuNpCOoDYTg
 emXzPzvLZcjc6Xsxsz7PDpNeXjd2K7Umcx+vH7JxALRvh9aTEY9SA5u8qu+mh959mq
 HcUbOxybGwzDSnFgggrKIbiola9mUZSyr2J8ISbc=
Date: Fri, 19 Apr 2024 15:36:17 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 0/3] Move blender setup from individual planes to crtc
 commit in sun4i-drm
Message-ID: <wynuwtyn2skchb7gc5qixql2pxnb2nqvbmrda6s53u7nt5ki7n@hqb46kttkhee>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240224150604.3855534-1-megi@xff.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240224150604.3855534-1-megi@xff.cz>
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

Hi,

On Sat, Feb 24, 2024 at 04:05:57PM GMT, megi xff wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> This series refactors blender setup from individual planes to a common
> place where it can be performed at once and is easier to reason about.
> 
> In the process this fixes a few bugs that allowed blender pipes to be
> disabled while corresponding DRM planes were requested to be enabled.
> 
> Please take a look. :)
> 
> v2:
> - use regmap_write where possible
> - add review tags

It would be nice to have this applied.

Kind regards,
	o.

> Thank you very much,
> 	Ondřej Jirman
> 
> Ondrej Jirman (3):
>   drm/sun4i: Unify sun8i_*_layer structs
>   drm/sun4i: Add more parameters to sunxi_engine commit callback
>   drm/sun4i: Fix layer zpos change/atomic modesetting
> 
>  drivers/gpu/drm/sun4i/sun4i_backend.c  |  4 +-
>  drivers/gpu/drm/sun4i/sun4i_crtc.c     |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 70 ++++++++++++++++++++-
>  drivers/gpu/drm/sun4i/sun8i_mixer.h    | 20 ++++++
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 85 +++----------------------
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.h | 20 ++----
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 86 +++-----------------------
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.h | 20 ++----
>  drivers/gpu/drm/sun4i/sunxi_engine.h   | 13 +++-
>  9 files changed, 125 insertions(+), 195 deletions(-)
> 
> -- 
> 2.44.0
> 
