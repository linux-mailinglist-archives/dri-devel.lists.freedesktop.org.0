Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6E0C9A4F2
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A1610E58B;
	Tue,  2 Dec 2025 06:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Oxmw/eRn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41F010E58B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 06:31:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (113x43x203x98.ap113.ftth.arteria-hikari.net [113.43.203.98])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2BD963E6;
 Tue,  2 Dec 2025 07:29:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764656956;
 bh=Kdmy8TdrzSNJKiZ8vJjSNH20thJ8Y6f+b8It7q4D1S8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oxmw/eRnAb2mFiqHEGruD/X0DNhV/XxXAr+GZt3Ae4IFhoSu1KMs81RK5gFD8JpiB
 M6eYOwnglkCfKGETjtaIqKRhBiIM0RKIcuc/sUQ6MxYegIEy8fGt7WSq0Ky3YMHAdE
 ffKPhDQq7DjKgPMaDxzrZJkrqdMXYcnFfS0cJqbs=
Date: Tue, 2 Dec 2025 15:31:09 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/3] RFT: drm/rcar-du: Modify custom commit tail
Message-ID: <20251202063109.GH4301@pendragon.ideasonboard.com>
References: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
 <20251120-mcde-drm-regression-thirdfix-v3-3-24b1e9886bbf@linaro.org>
 <20251121024206.GC11519@pendragon.ideasonboard.com>
 <CAD++jLkNCH=8VmwXh0UJS5QZ9wB-iP2kinytT+__fq0L1PzoZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkNCH=8VmwXh0UJS5QZ9wB-iP2kinytT+__fq0L1PzoZQ@mail.gmail.com>
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

On Fri, Nov 21, 2025 at 09:17:26AM +0100, Linus Walleij wrote:
> On Fri, Nov 22, 2025 at 3:42 AM Laurent Pinchart wrote:
> 
> > > This is needed on R-Car DU, where the CRTC provides clock to LVDS
> > > and DSI, and has to be started before a bridge may call .prepare,
> > > which may trigger e.g. a DSI transfer.
> >
> > Is there an issue with LVDS ? The LVDS encoder receivers its pixel clock
> > from the CRTC the same way any encoder does (except on R-Car D3 and E3
> > where the encoder *provides* the pixel clock to the CRTC, which is
> > handled through explicit function calls from the CRTC to the LVDS
> > encoder). There's no command mode with LVDS. Is the concern that we may
> > have an external LVDS to DSI bridge ?
> 
> Question to Marek, this commit text is from his original patch (which
> I modified heavily so almost only the commit message is left...)

Marek, could you comment on this ?

> > > -     /* Apply the atomic update. */
> > > -     drm_atomic_helper_commit_modeset_disables(dev, old_state);
> > > +     /*
> > > +      * Apply the atomic update.
> > > +      *
> > > +      * We need special ordering to make sure the CRTC disabled last
> > > +      * and enabled first. We do this with modified versions of the
> > > +      * common modeset_disables/enables functions.
> > > +      */
> > > +
> > > +     /* Variant of drm_atomic_helper_commit_modeset_disables() */
> > > +     drm_encoder_bridge_disable(dev, state);
> > > +     drm_encoder_bridge_post_disable(dev, state);
> > > +     drm_crtc_disable(dev, state);
> >
> > I think we have a fundamental issue here. Commit c9b1150a68d9
> > ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> > states that
> >
> >     The definition of bridge pre_enable hook says that,
> >     "The display pipe (i.e. clocks and timing signals) feeding this bridge
> >     will not yet be running when this callback is called".
> >
> > This is right, and the above sequence does not comply with the
> > documentation, which is a concern. Quite clearly the bridge API isn't up
> > to the task here. I don't know how we'll fix it, the pre/post
> > enable/disable operations are really a hack and don't scale, and fixing
> > that will likely not be a simple task.
> 
> Well in the v1 patch I tried to go with this definition, if:
> 
> 1. The display pipe is not running and
> 2. The hardware is such that DSI will not work unless the display
>     pipe is running then it follows logically that:
> 
> 3. We cannot send DSI commands in bridge prepare()/unprepare()
>    execution paths.
> 
> Thus the v1 patch moves all DSI commands to the enable/disable
> callbacks. It fixes the regression, too.
> 
> We would need to comb over the existing DSI bridges and panels
> to convert them to this semantic if we wanna be strict, what I
> did was to just fix all panels used by this one hardware. I'm pretty
> sure the same can be done of any R-Car DU-related panel/bridge.

I just noticed a similar issue was reported for the Rockchip display
drivers, see [1]. That's three platforms broken by commit
c9b1150a68d9362a0827609fc0dc1664c0d8bfe1 and there may be more we
haven't noticed yet. I think we should revert the commit and work on a
proper solution on top.

[1] https://lore.kernel.org/r/CAAMcf8Di8sc_XVZAnzQ9sUiUf-Ayvg2yjhx2dWmvvCnfF3pBRA@mail.gmail.com

> > The short term question is how to deal with the regression that
> > c9b1150a68d9 caused in the MCDE and R-Car DU drivers. This patch
> > probably works. The complexity makes me worry that we'll introduce other
> > regressions, but it can be argued that we're merely restoring the
> > previous order of operations, which should therefore be safe. I'm still
> > concerned about maintainability though. Commit c9b1150a68d9 should
> > probably have been rejected, we should have developed a proper solution
> > instead :-(
> 
> Yeah, it's a bit of a mess when regressions get detected late.
> I'm also worried about more regressions popping up. They will
> all be with DSI panels/bridges I think.

-- 
Regards,

Laurent Pinchart
