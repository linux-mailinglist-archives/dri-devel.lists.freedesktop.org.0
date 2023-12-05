Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEF780563A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D7A10E509;
	Tue,  5 Dec 2023 13:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917DA10E509
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:40:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC03A9D5;
 Tue,  5 Dec 2023 14:40:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1701783603;
 bh=qqqCfEhf80hGt/I7ULRldCLeyjjb3TUwo3J4hJoLvHc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZF2hrJ7+yBcW2xS6XAIzU+xFMu2VtYz3WE3qthCOKSX/3jiHp0YIjp1tWAEHnPo5s
 VzB4qsVC+EYlYbWkaqzS8OlQVfReJ4lVmXgTda2EEv0ouG55fQEjPSF/DY/hrJ9Mtm
 EpZBETyaNmKNEwcwXGVY2wURGz1jpiRRjdJbl3Uk=
Date: Tue, 5 Dec 2023 15:40:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm: renesas: shmobile: Call
 drm_helper_force_disable_all() at shutdown time
Message-ID: <20231205134050.GG17394@pendragon.ideasonboard.com>
References: <0a13f43d1e519b88e0762cce178d7852b7dba2b1.1701775726.git.geert+renesas@glider.be>
 <20231205121617.GF17394@pendragon.ideasonboard.com>
 <CAMuHMdWziG0T6XdtcyvLz2si7Ai6sQN0tDU1345nSouz2tUq8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWziG0T6XdtcyvLz2si7Ai6sQN0tDU1345nSouz2tUq8A@mail.gmail.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 05, 2023 at 02:31:24PM +0100, Geert Uytterhoeven wrote:
> On Tue, Dec 5, 2023 at 1:16 PM Laurent Pinchart wrote:
> > On Tue, Dec 05, 2023 at 12:30:02PM +0100, Geert Uytterhoeven wrote:
> > > From: Douglas Anderson <dianders@chromium.org>
> > >
> > > Based on grepping through the source code, this driver appears to be
> > > missing a call to drm_atomic_helper_shutdown() at system shutdown time.
> > > This is important because drm_helper_force_disable_all() will cause
> > > panels to get disabled cleanly which may be important for their power
> > > sequencing.  Future changes will remove any custom powering off in
> > > individual panel drivers so the DRM drivers need to start getting this
> > > right.
> > >
> > > The fact that we should call drm_atomic_helper_shutdown() in the case of
> > > OS shutdown comes straight out of the kernel doc "driver instance
> > > overview" in drm_drv.c.
> > >
> > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c8b3c307a6192efabb4cbb06b195f15@changeid
> > > [geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown/]
> > > [geert: shmob_drm_remove() already calls drm_atomic_helper_shutdown]
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!
> 
> > > Panel-simple does print two new warnings:
> > >
> > >     +panel-simple panel: Skipping disable of already disabled panel
> > >     +panel-simple panel: Skipping unprepare of already unprepared panel
> >
> > Have you investigated where this comes from ?
> 
> Meh, I knew I forgot something ;-)
> 
> The panel is unprepared and disabled a first time from shmob_drm's
> .shutdown() callback:
> 
>   shmob_drm_shutdown
>     drm_atomic_helper_shutdown
>       drm_atomic_helper_disable_all
>         drm_atomic_commit
>           drm_atomic_helper_commit
>             commit_tail
>               drm_atomic_helper_commit_tail
>                 drm_atomic_helper_commit_modeset_disables
>                   disable_outputs
>                     drm_atomic_bridge_chain_disable
>                         drm_panel_disable
>                     drm_atomic_bridge_chain_post_disable
>                         drm_panel_unprepare
> 
> And a second time from simple_panel's .shutdown() callback():
> 
>   panel_simple_platform_shutdown
>     panel_simple_shutdown
>       drm_panel_disable
>       drm_panel_unprepare

That looks like what Doug mentioned should be removed in the commit
message of this patch (a confirmation would be nice). It should be fine
for now.

-- 
Regards,

Laurent Pinchart
