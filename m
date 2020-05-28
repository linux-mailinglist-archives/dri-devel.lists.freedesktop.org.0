Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9091E5A97
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 10:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724506E123;
	Thu, 28 May 2020 08:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6326E03F;
 Thu, 28 May 2020 08:19:48 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 9F17E5C3E05;
 Thu, 28 May 2020 10:19:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1590653986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rjuIwLc6TgSpZuJvVE/30CTZKhSVc37Hl85RakLKn9g=;
 b=F5TSa2VAlySusy3/XgAtm7su4QHvXn56ywvfPAkr2cD5TRk0cZnjr6MJ1/MIHt34VhkjFK
 6n0gSHfGIv3HQh8V9JkzhVhGhlpV7XqT1Opf0j6Xax9NjzEHcJWwI+MHdY4QcpY/MIiD8H
 VHlrjn0q9+ZNX9qwDgqRo9v3vg2n5eM=
MIME-Version: 1.0
Date: Thu, 28 May 2020 10:19:46 +0200
From: Stefan Agner <stefan@agner.ch>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/mxsfb: Call drm_crtc_vblank_on/off
In-Reply-To: <CAKMK7uGzbadiY1EQKQvQcBND4Ja73WZRF8-DoxLJNTsGBJS0jw@mail.gmail.com>
References: <20200527094757.1414174-1-daniel.vetter@ffwll.ch>
 <20200528054643.GQ206103@phenom.ffwll.local>
 <7911368105b92200b661f0fed39f5642@agner.ch>
 <CAKMK7uGzbadiY1EQKQvQcBND4Ja73WZRF8-DoxLJNTsGBJS0jw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <c8294901e201cd40a41111b05ecccd43@agner.ch>
X-Sender: stefan@agner.ch
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

On 2020-05-28 10:06, Daniel Vetter wrote:
> On Thu, May 28, 2020 at 9:56 AM Stefan Agner <stefan@agner.ch> wrote:
>>
>> Hi Daniel,
>>
>> On 2020-05-28 07:46, Daniel Vetter wrote:
>> > On Wed, May 27, 2020 at 11:47:56AM +0200, Daniel Vetter wrote:
>> >> mxsfb has vblank support, is atomic, but doesn't call
>> >> drm_crtc_vblank_on/off as it should. Not good.
>> >>
>> >> With my next patch to add the drm_crtc_vblank_reset to helpers this
>> >> means not even the very first crtc enabling will vblanks work anymore,
>> >> since they'll just stay off forever.
>> >>
>> >> Since mxsfb doesn't have any vblank waits of its own in the
>> >> enable/disable flow, nor an enable/disable_vblank callback we can do
>> >> the on/off as the first respectively last operation, and it should all
>> >> work.
>> >>
>> >> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> >> Cc: Marek Vasut <marex@denx.de>
>> >> Cc: Stefan Agner <stefan@agner.ch>
>> >> Cc: Shawn Guo <shawnguo@kernel.org>
>> >> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> >> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> >> Cc: Fabio Estevam <festevam@gmail.com>
>> >> Cc: NXP Linux Team <linux-imx@nxp.com>
>> >> Cc: linux-arm-kernel@lists.infradead.org
>> >
>> > Ping for some ack/review on this one here, it's holding up the subsystem
>> > wide fix in patch 2.
>>
>> Sorry for the delay.
>>
>> I guess that has the same effect as patch 14 in Laurent's patchset would
>> have:
>> https://lore.kernel.org/dri-devel/20200309195216.31042-15-laurent.pinchart@ideasonboard.com/
> 
> Uh, looking at that patch I realized that mxsfb indeed calls
> drm_vblank_init before mode_config.num_crtc is set. Which means it
> never had working vblank support in upstream. That also explains the
> lack of fireworks, since all other drivers that actually do initialize
> vblank support have the drm_crtc_vblank_on/off calls - without them
> the driver doesn't survive for very long.
> 
> tldr; I don't need this patch here to apply the 2nd one, so no
> conflict potential at all. And the patch from Laurent does fix up
> everything correctly, so we should be good.

Uh I see, that is somehow unfortunate and fortunate at the same time!

Ok, I hope we get this cleaned up soon.

--
Stefan

> -Daniel
> 
>> But should be rather trivial to rebase. So until Laurent's patchset is
>> ready, we can go with this fix.
>>
>> Acked-by: Stefan Agner <stefan@agner.ch>
>>
>> --
>> Stefan
>>
>> >
>> > Thanks, Daniel
>> >
>> >> ---
>> >>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 2 ++
>> >>  1 file changed, 2 insertions(+)
>> >>
>> >> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> >> index 497cf443a9af..1891cd6deb2f 100644
>> >> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> >> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> >> @@ -124,6 +124,7 @@ static void mxsfb_pipe_enable(struct drm_simple_display_pipe *pipe,
>> >>      drm_panel_prepare(mxsfb->panel);
>> >>      mxsfb_crtc_enable(mxsfb);
>> >>      drm_panel_enable(mxsfb->panel);
>> >> +    drm_crtc_vblank_on(&pipe->crtc);
>> >>  }
>> >>
>> >>  static void mxsfb_pipe_disable(struct drm_simple_display_pipe *pipe)
>> >> @@ -133,6 +134,7 @@ static void mxsfb_pipe_disable(struct drm_simple_display_pipe *pipe)
>> >>      struct drm_crtc *crtc = &pipe->crtc;
>> >>      struct drm_pending_vblank_event *event;
>> >>
>> >> +    drm_crtc_vblank_off(&pipe->crtc);
>> >>      drm_panel_disable(mxsfb->panel);
>> >>      mxsfb_crtc_disable(mxsfb);
>> >>      drm_panel_unprepare(mxsfb->panel);
>> >> --
>> >> 2.26.2
>> >>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
