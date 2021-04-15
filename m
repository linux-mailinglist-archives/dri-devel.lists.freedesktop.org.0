Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A585935FFBF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBF36E4E3;
	Thu, 15 Apr 2021 01:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9675D6E4E3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 01:56:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DE7951E;
 Thu, 15 Apr 2021 03:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1618451811;
 bh=RULpcO7goqO0tGQ9PD90rkJ16ACguP4Uv0uAXLxJS80=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hvJF7tDBDz5uJdDJmmSklEK+F1jlEOxEyTS+Ptbi7XKRiLqCEnsXNb0i5hWONjl5L
 GOzvZVW56GQRUS/hTD+cpTkA9+WE3SLCLAJbRt0HF8HeT70KD16VpwHH38+hfP/cm/
 GKiysRfSAX+Qyng50zl+/6u7ocU7KV3MMqoK4hCQ=
Date: Thu, 15 Apr 2021 04:56:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 01/12] drm/bridge: Fix the stop condition of
 drm_bridge_chain_pre_enable()
Message-ID: <YHedYnUrcnhRDnie@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid>
 <YGpeo9LV4uAh1B7u@pendragon.ideasonboard.com>
 <CAD=FV=UN38EiYMiwNjysBS6dReKDaf+g2GcgaVt9iF1mTRKg7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=UN38EiYMiwNjysBS6dReKDaf+g2GcgaVt9iF1mTRKg7A@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Wed, Apr 14, 2021 at 06:19:13PM -0700, Doug Anderson wrote:
> On Sun, Apr 4, 2021 at 5:50 PM Laurent Pinchart wrote:
> > On Fri, Apr 02, 2021 at 03:28:35PM -0700, Douglas Anderson wrote:
> > > The drm_bridge_chain_pre_enable() is not the proper opposite of
> > > drm_bridge_chain_post_disable(). It continues along the chain to
> > > _before_ the starting bridge. Let's fix that.
> > >
> > > Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> > > ---
> > >
> > > (no changes since v1)
> > >
> > >  drivers/gpu/drm/drm_bridge.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > > index 64f0effb52ac..044acd07c153 100644
> > > --- a/drivers/gpu/drm/drm_bridge.c
> > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > @@ -522,6 +522,9 @@ void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
> > >       list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> > >               if (iter->funcs->pre_enable)
> > >                       iter->funcs->pre_enable(iter);
> > > +
> > > +             if (iter == bridge)
> > > +                     break;
> >
> > This looks good as it matches drm_atomic_bridge_chain_disable().
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks for your review here and several of the other patches. Can you
> suggest any plan for getting them landed? It would at least be nice to
> get the non-controversial ones landed.

Do you have commit access to drm-misc ? If not, given your
contributions, I think you qualify for it.

> > I'm curious though, given that the bridge passed to the function should
> > be the one closest to the encoder, does this make a difference ?
> 
> Yes, that's how I discovered it originally. Let's see. So if I don't
> have this patch but have the rest of the series then I get a splat at
> bootup. This shows that dsi_mgr_bridge_pre_enable() must be "earlier"
> in the chain than my bridge chip. Here's the splat:

Right, I think it's caused by a later patch in the series calling this
function with a different bridge than the one closest to the encoder.

>  msm_dsi_host_get_phy_clk_req: unable to calc clk rate, -22
>  ------------[ cut here ]------------
>  disp_cc_mdss_ahb_clk status stuck at 'off'
>  WARNING: CPU: 7 PID: 404 at drivers/clk/qcom/clk-branch.c:92
> clk_branch_toggle+0x194/0x280
>  Modules linked in: joydev
>  CPU: 7 PID: 404 Comm: frecon Tainted: G    B             5.12.0-rc3-lockdep+ #2
>  Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
>  pstate: 60400089 (nZCv daIf +PAN -UAO -TCO BTYPE=--)
>  pc : clk_branch_toggle+0x194/0x280
>  lr : clk_branch_toggle+0x190/0x280
>  ...
>  Call trace:
>   clk_branch_toggle+0x194/0x280
>   clk_branch2_enable+0x28/0x34
>   clk_core_enable+0x2f4/0x6b4
>   clk_enable+0x54/0x74
>   dsi_phy_enable_resource+0x80/0xd8
>   msm_dsi_phy_enable+0xa8/0x4a8
>   enable_phy+0x9c/0xf4
>   dsi_mgr_bridge_pre_enable+0x23c/0x4b0
>   drm_bridge_chain_pre_enable+0xac/0xe4
>   ti_sn_bridge_connector_get_modes+0x134/0x1b8
>   drm_helper_probe_single_connector_modes+0x49c/0x1358
>   drm_mode_getconnector+0x460/0xe98
>   drm_ioctl_kernel+0x144/0x228
>   drm_ioctl+0x418/0x7cc
>   drm_compat_ioctl+0x1bc/0x230
>   __arm64_compat_sys_ioctl+0x14c/0x188
>   el0_svc_common+0x128/0x23c
>   do_el0_svc_compat+0x50/0x60
>   el0_svc_compat+0x24/0x34
>   el0_sync_compat_handler+0xc0/0xf0
>   el0_sync_compat+0x174/0x180

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
