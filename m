Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973DDC9A4E0
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F203F10E58A;
	Tue,  2 Dec 2025 06:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ekP/unp1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CA710E58A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 06:29:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (113x43x203x98.ap113.ftth.arteria-hikari.net [113.43.203.98])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8DD793E6;
 Tue,  2 Dec 2025 07:27:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764656837;
 bh=VXzIPngFdacIDB87BOh+DyMPuMgW2UL2yvGKdB6Akqo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ekP/unp1qwNd/3Pk75lngsPPNLUJWaMpPPgy9xJEUs72B9FLPo+gGPAaGrSw5+ESs
 oM9gLwccqIOJdXIpmrnMph3Z9ZIQGXO5l/pfIGCtB0OGU2L6vpYeN9gMcizmM3ifOp
 4V99jpxyFRBBbftE2eYRs0albkJaC6hRnU2YBifQ=
Date: Tue, 2 Dec 2025 15:29:11 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vicente Bergas <vicencb@gmail.com>
Cc: Aradhya Bhatia <aradhya.bhatia@linux.dev>, airlied@gmail.com,
 alexander.sverdlin@siemens.com, andrzej.hajda@intel.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 jernej.skrabec@gmail.com, Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 lumag@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, nm@ti.com,
 rfoss@kernel.org, simona@ffwll.ch, tomi.valkeinen@ideasonboard.com,
 tzimmermann@suse.de, vigneshr@ti.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Damon Ding <damon.ding@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Linux Rockchip Support List <linux-rockchip@lists.infradead.org>,
 Devarsh Thakkar <devarsht@ti.com>, Linus Walleij <linusw@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v13 3/4] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
Message-ID: <20251202062911.GA24150@pendragon.ideasonboard.com>
References: <CAAMcf8BfxMJx+5ttEXx0kONP2OYWSLFqEYF6rfVBKoRg5TKZzQ@mail.gmail.com>
 <bea50d14-2311-46ad-bb30-9d60a4c5e3a2@linux.dev>
 <ff21cbd1-dc77-43ae-85a8-dc6a56a1cefa@linux.dev>
 <CAAMcf8Di8sc_XVZAnzQ9sUiUf-Ayvg2yjhx2dWmvvCnfF3pBRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAMcf8Di8sc_XVZAnzQ9sUiUf-Ayvg2yjhx2dWmvvCnfF3pBRA@mail.gmail.com>
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

+Linus, Marek and Tomi.

On Mon, Dec 01, 2025 at 08:34:37PM +0100, Vicente Bergas wrote:
> On Mon, Oct 6, 2025 at 5:30 PM Aradhya Bhatia <aradhya.bhatia@linux.dev> wrote:
> >
> > +rockchip maintainers
> >
> > Hi Vicente, all,
> 
> Hi everybody,
> please, can some expert on this platform take a look at this bug?

There are similar issues with MCDE and R-Car DU, see
https://lore.kernel.org/all/CAD++jLkNCH=8VmwXh0UJS5QZ9wB-iP2kinytT+__fq0L1PzoZQ@mail.gmail.com/

I think we should revert commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
and work on a clean solution. It broke too many drivers.

> > I went through the drivers and the affected areas in the gru-kevin
> > chromebook pipeline last week, but nothing has stood out.
> >
> >
> > Pipeline:
> >
> > rockchip,display-subsystem / rk3399-vop (Big/Lite) (CRTC) ->
> > rk3399-edp (Encoder) -> analogix_dp_core (Bridge) ->
> > sharp,lq123p (edp-panel)
> >
> > I am unable to debug this further since I do not have the hardware.
> >
> > I could use some help, especially from folks who understand the hardware
> > requirements better.
> >
> >
> > On 11/09/25 09:01, Aradhya Bhatia wrote:
> > > Hi Vicente,
> > >
> > > Thank you for the bisection and reporting the issue.
> > >
> > > On 10/09/25 16:17, Vicente Bergas wrote:
> > >> Hi,
> > >> this patch causes a regression. It has been reported in
> > >> https://bugzilla.kernel.org/show_bug.cgi?id=220554
> > >>
> > >> It affects the gru/kevin platform (arm64,RK3399) with the Panfrost DRM driver.
> > >
> > > I believe the Panfrost DRM driver may only be for the GPU.
> > >
> > > Based on the dts files in arm64/rockchip/, this is the pipeline of the
> > > gru-kevin setup that I understand.
> > >
> > >       rk3399-vop (Big/Lite) -> rk3399-edp -> sharp,lq123p (edp-panel)
> > >
> > > The setup seems to be using the drm/rockchip drivers for the display
> > > controller and for the bridge.
> > >
> > >>
> > >> When it boots in console mode, the blinking of the cursor keeps the display on.
> > >> If it is turned off via /sys/class/graphics/fbcon/cursor_blink, then
> > >> the display briefly shows each key press presented on screen for less
> > >> than one second and then powers off.
> > >>
> > >> When starting the graphical mode (wayland), if there are no
> > >> applications drawing on the screen, the only way to keep the display
> > >> on is by continuously moving the mouse.
> > >>
> > >
> > > Okay!
> > >
> > > I will have a look through the drivers. In the meanwhile, please do
> > > report back if you find any other observations.

-- 
Regards,

Laurent Pinchart
