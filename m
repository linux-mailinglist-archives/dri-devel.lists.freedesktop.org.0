Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C735B9C33A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 22:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E173310E7EE;
	Wed, 24 Sep 2025 20:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RQGlBQRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9AF10E7EE
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 20:53:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D108F7E0;
 Wed, 24 Sep 2025 22:52:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1758747141;
 bh=MUc6lson1HlINLrSuNuMoqq46cZPFAq3OSyeSYOl/7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RQGlBQRLPpXTEl+t256I6kd4KsXo3TjgZ4dwclNYtJNr/H+0HH+TO3o/ZBHCwWRG7
 +QgB2grp/DuKKvbap4PmaZ3Wq1dAub5JnSho3XxbS/LM9LPXkzH+dDvv9R3G04spZb
 P1kTyOsHYzhqK6VdxVJesP9fupEKAgl2gFmAme9k=
Date: Wed, 24 Sep 2025 23:53:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 7/9] drm/rcar-du: dsi: Clean up handling of DRM mode flags
Message-ID: <20250924205311.GA14773@pendragon.ideasonboard.com>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-8-marek.vasut+renesas@mailbox.org>
 <20250923132616.GH20765@pendragon.ideasonboard.com>
 <lzimjanf6sajxusigstmc7lpeujcq63yff5gyw22hh2bnsbt4h@cbpoc3u257wg>
 <ddae2f06-b800-4d21-83ea-f06aa4b1f2ba@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ddae2f06-b800-4d21-83ea-f06aa4b1f2ba@mailbox.org>
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

On Wed, Sep 24, 2025 at 04:36:00AM +0200, Marek Vasut wrote:
> On 9/24/25 3:18 AM, Sebastian Reichel wrote:
> 
> Hello Sebastian,
> 
> > On Tue, Sep 23, 2025 at 04:26:16PM +0300, Laurent Pinchart wrote:
> >> I wonder if the DRM_MODE_FLAG_P[HV]SYNC flags are always the exact
> >> opposite of DRM_MODE_FLAG_N[HV]SYNC. It's probably fine to assume that
> >> here. A quick grep showed one panel driver setting both the N and P
> >> flags (drivers/gpu/drm/panel/panel-sitronix-st7789v.c, see
> >> t28cp45tn89_mode, which I assume is a bug - Sebastian, could you check
> >> that ?).
> > 
> > Yeah, it was supposed to be
> > 
> > static const struct drm_display_mode t28cp45tn89_mode = {
> >      ...
> >      .flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NHSYNC
> > };
> > 
> > The driver works with the panel, because the driver defaults to
> > DRM_MODE_FLAG_N[HV]SYNC and ignores the related flags, so just the
> > DRM_MODE_FLAG_P[HV]SYNC one is applied:
> > 
> > static int st7789v_prepare(struct drm_panel *panel)
> > {
> >      ...
> > 
> > 	if (ctx->info->mode->flags & DRM_MODE_FLAG_PVSYNC)
> > 		polarity |= ST7789V_RGBCTRL_VSYNC_HIGH;
> > 	if (ctx->info->mode->flags & DRM_MODE_FLAG_PHSYNC)
> > 		polarity |= ST7789V_RGBCTRL_HSYNC_HIGH;
> > 
> >      ...
> > }
> > 
> > Greetings and thanks for the bug report,
> 
> Will you send a patch ? If so, please CC me, so I can provide RB.

Feel free to include my

    Reported-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

in that patch.

-- 
Regards,

Laurent Pinchart
