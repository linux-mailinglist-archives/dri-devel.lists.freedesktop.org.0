Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BD8AC3E0A
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 12:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FF110E2FD;
	Mon, 26 May 2025 10:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="djykV4Lr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114AF10E2FD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 10:49:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 330EC7E6;
 Mon, 26 May 2025 12:48:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1748256523;
 bh=w7VKIU8NnqyjQvkqkLPKDk49GnoKd3o1S/upuQ6J118=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=djykV4LrIM8V/L45q9W1sIokBsApt4v9E6YwdYXqzRmVe4QYw2LT8eZM2fsW47x50
 Q2QGaGm/Lmih+akZcNVTrEE6HzIdJg5PBKZfMeNnv0tJ6x8DM4P9vid58q4JimCvvm
 YUZIdhGMkAC0IQmu7PXL4C96/pw17dRI1vM+Td64=
Date: Mon, 26 May 2025 12:49:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Maxime Ripard <mripard@kernel.org>, tomm.merciai@gmail.com,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>, Adam Ford <aford173@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set()
 with atomic_enable()
Message-ID: <20250526104902.GB17743@pendragon.ideasonboard.com>
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
 <20250526-cryptic-blue-mussel-ac57fe@houat>
 <91d8a288-1f2d-469c-a596-6265893584ae@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <91d8a288-1f2d-469c-a596-6265893584ae@bp.renesas.com>
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

On Mon, May 26, 2025 at 11:58:37AM +0200, Tommaso Merciai wrote:
> Hi Maxime,
> Thanks for your comment.
> 
> On 26/05/25 11:26, Maxime Ripard wrote:
> > Hi,
> > 
> > On Mon, May 26, 2025 at 10:54:52AM +0200, Tommaso Merciai wrote:
> >> After adv7511_mode_set() was merged into .atomic_enable(), only the
> >> native resolution is working when using modetest.
> >>
> >> This is caused by incorrect timings: adv7511_mode_set() must not be
> >> merged into .atomic_enable().
> >>
> >> Move adv7511_mode_set() back to the .mode_set() callback in
> >> drm_bridge_funcs to restore correct behavior.
> >>
> >> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI connector helpers")
> >> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> >> Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
> >> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > 
> > Explaining why, both in the commit log and the comments, would be nice.
> > Because I can't think of any good reason it just can't work for that
> > bridge.
> 
> Sorry, let me clarify and share with you some details:
> 
> adv7511_mode_set:
>   - Is setting up timings registers for the DSI2HDMI bridge in our case
>     we are using ADV7535 bridge.
> 
> rzg2l_mipi_dsi_atomic_enable:
>   - Is setting up the vclock for the DSI ip
> 
> Testing new/old implementation a bit we found the following:
> 
> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
> [   49.273134] adv7511_mode_set_old: drm_mode_vrefresh(mode) = 56
> [   49.281006] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
> 
> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
> [   74.076881] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
> [   74.092130] adv7511_mode_set: drm_mode_vrefresh(adj_mode) = 56
> 
> Same result but different timing (in function call perspective):
> 
>   - old: adv7511_mode_set() is call before rzg2l_mipi_dsi_atomic_enable()
>   - new: adv7511_mode_set() is call after rzg2l_mipi_dsi_atomic_enable()

What is "old" and "new" here ? Is it before and after Dmitry's patch, or
before and after yours ? Please be precise when describing problems.

> What do you think? Thanks in advance.

You're only explaining above what the "old" and "new" behaviours are,
and claiming one of them is causing an issue, but you're not explaining
*why* it causes an issue. That's what your commit message is expected to
detail.

-- 
Regards,

Laurent Pinchart
