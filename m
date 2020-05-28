Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 457D71E5A5C
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 10:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469456E4CB;
	Thu, 28 May 2020 08:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C686E0D9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 08:06:16 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id l6so24178008oic.9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 01:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UBU5+7fUfcx/BFsQBhJKuGgAPC1pjV/lW8bKyZn/8YA=;
 b=QYw513yKNG+MiOsYHBVbvBHwfuOpFv8wHK2pt2iQfchUEGmOiM53ZBpy2KggA+fbZl
 znVpn1PvRtiAjy3h81HHPcEsaDAJgg/LNL0m4BI1jp5IRtjqyXIgsoql/blnM9HYHY3D
 NvlA4KVcr9SPNgAyceP1K3QdJtQrPf6ntKILU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UBU5+7fUfcx/BFsQBhJKuGgAPC1pjV/lW8bKyZn/8YA=;
 b=jli143Y1uYofiSWFjEmIWWVdRmejf9ZzSkMDj1hvG2r1aZYrIFRQDpU8Vu8wwXOLE4
 mQ7MqHw4hkaNNf61qgE1ALJgZfCvrLVvKZAB9mWbaMGL7quL/HvLE/9fEa/+C90DxiTU
 K4Z3LkXisSQVny2r82zjU3uoMXvXXBkebrTYkVPpPwS66QCmdo0UPWC5szJdjk6rhG5N
 7BLpwIKKFWgHmg2ys099jwCytS5uUkruuZd1XHkvO30rNfSbTwatBi2dFq2btdKKr142
 Q4f+le6GtwtW8YvG37lfwNRda8P6tZnHmSfsnp+vpkI0a2Fz+Rji6OrgBXq1wKNj8U6e
 pCKQ==
X-Gm-Message-State: AOAM530XyQYJdbk8hJV12S6qkAsk/S0SdXfLcrVGimX+POScsCFgxzbt
 mo9FMqNg6hUkQvdNZ+7ROAyjh6vFPkKaaK3QoWkibg==
X-Google-Smtp-Source: ABdhPJxNY7bapakiUxoIiaI893J9SHvaNGZMwx9iHoilvd0U7heMyWEeQwlFecPlwmSYeu0KafaVJUt650OgtPx0t4c=
X-Received: by 2002:aca:4b91:: with SMTP id y139mr1355130oia.128.1590653176190; 
 Thu, 28 May 2020 01:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200527094757.1414174-1-daniel.vetter@ffwll.ch>
 <20200528054643.GQ206103@phenom.ffwll.local>
 <7911368105b92200b661f0fed39f5642@agner.ch>
In-Reply-To: <7911368105b92200b661f0fed39f5642@agner.ch>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 28 May 2020 10:06:04 +0200
Message-ID: <CAKMK7uGzbadiY1EQKQvQcBND4Ja73WZRF8-DoxLJNTsGBJS0jw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mxsfb: Call drm_crtc_vblank_on/off
To: Stefan Agner <stefan@agner.ch>
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
Cc: Marek Vasut <marex@denx.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 28, 2020 at 9:56 AM Stefan Agner <stefan@agner.ch> wrote:
>
> Hi Daniel,
>
> On 2020-05-28 07:46, Daniel Vetter wrote:
> > On Wed, May 27, 2020 at 11:47:56AM +0200, Daniel Vetter wrote:
> >> mxsfb has vblank support, is atomic, but doesn't call
> >> drm_crtc_vblank_on/off as it should. Not good.
> >>
> >> With my next patch to add the drm_crtc_vblank_reset to helpers this
> >> means not even the very first crtc enabling will vblanks work anymore,
> >> since they'll just stay off forever.
> >>
> >> Since mxsfb doesn't have any vblank waits of its own in the
> >> enable/disable flow, nor an enable/disable_vblank callback we can do
> >> the on/off as the first respectively last operation, and it should all
> >> work.
> >>
> >> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >> Cc: Marek Vasut <marex@denx.de>
> >> Cc: Stefan Agner <stefan@agner.ch>
> >> Cc: Shawn Guo <shawnguo@kernel.org>
> >> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> >> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> >> Cc: Fabio Estevam <festevam@gmail.com>
> >> Cc: NXP Linux Team <linux-imx@nxp.com>
> >> Cc: linux-arm-kernel@lists.infradead.org
> >
> > Ping for some ack/review on this one here, it's holding up the subsystem
> > wide fix in patch 2.
>
> Sorry for the delay.
>
> I guess that has the same effect as patch 14 in Laurent's patchset would
> have:
> https://lore.kernel.org/dri-devel/20200309195216.31042-15-laurent.pinchart@ideasonboard.com/

Uh, looking at that patch I realized that mxsfb indeed calls
drm_vblank_init before mode_config.num_crtc is set. Which means it
never had working vblank support in upstream. That also explains the
lack of fireworks, since all other drivers that actually do initialize
vblank support have the drm_crtc_vblank_on/off calls - without them
the driver doesn't survive for very long.

tldr; I don't need this patch here to apply the 2nd one, so no
conflict potential at all. And the patch from Laurent does fix up
everything correctly, so we should be good.
-Daniel

> But should be rather trivial to rebase. So until Laurent's patchset is
> ready, we can go with this fix.
>
> Acked-by: Stefan Agner <stefan@agner.ch>
>
> --
> Stefan
>
> >
> > Thanks, Daniel
> >
> >> ---
> >>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> >> index 497cf443a9af..1891cd6deb2f 100644
> >> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> >> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> >> @@ -124,6 +124,7 @@ static void mxsfb_pipe_enable(struct drm_simple_display_pipe *pipe,
> >>      drm_panel_prepare(mxsfb->panel);
> >>      mxsfb_crtc_enable(mxsfb);
> >>      drm_panel_enable(mxsfb->panel);
> >> +    drm_crtc_vblank_on(&pipe->crtc);
> >>  }
> >>
> >>  static void mxsfb_pipe_disable(struct drm_simple_display_pipe *pipe)
> >> @@ -133,6 +134,7 @@ static void mxsfb_pipe_disable(struct drm_simple_display_pipe *pipe)
> >>      struct drm_crtc *crtc = &pipe->crtc;
> >>      struct drm_pending_vblank_event *event;
> >>
> >> +    drm_crtc_vblank_off(&pipe->crtc);
> >>      drm_panel_disable(mxsfb->panel);
> >>      mxsfb_crtc_disable(mxsfb);
> >>      drm_panel_unprepare(mxsfb->panel);
> >> --
> >> 2.26.2
> >>



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
