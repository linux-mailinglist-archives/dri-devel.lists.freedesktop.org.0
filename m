Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439EE35FF32
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5786E989;
	Thu, 15 Apr 2021 01:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB646E989
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 01:19:30 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id y12so17011314qtx.11
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 18:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8aPyvheTo359M1XDribOD0pZhfeuF44YjhQwSBPOIAw=;
 b=hS2JR6sElgLAeSGeeiC5NWKU6wJRmnDZZwZmROkbPRe18b3qtT1n+5v07HhUKGaCpI
 h42fJ2GHWGoGhhhKrYomCGkV+pb05xvk1n9OUFq5pOBr152EvEXvhdKx+JmLpEPZZVvy
 LQUPTj550/2FqR3G/xrsZcVXYBV8n6AwO44fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8aPyvheTo359M1XDribOD0pZhfeuF44YjhQwSBPOIAw=;
 b=s6ZKmmzpMKMtOC/v9Q98I9at6B/IoMqIQUnON8chl6yyDrb5oTri8qhoKVinguzGxc
 ged/LB1//JngP/CKQzfxX6LiVcBx5/RYFT5SCXyQHd2duoOadu8DrIMt/yy5BBd0c47e
 0+MlMfkugu85vJIAXCfDYpMIndqeYtMYvDGfZtyw5V5JQrfOZrPpjqTOoA36qZOvOoF0
 Xk6jbEY5K6DWbo7A2ytiN5AEVa6rxA7o4odM1z9W77srYTxHXNxwKCdsm1hbXOICRLFn
 Rg1soCXdg/T0dg1FRas3jakkMcdK+AEhO8fRgMASJdSeFi0kBaTqMHXNsEbEUfKCmLaN
 mJCQ==
X-Gm-Message-State: AOAM531kj4BN5v1xk3W2zBAyBlyx4RVsh0oA8DurvvUqfSVg1/O3xaI5
 F3z7k6s8mh19apqJdlpiHdH5H4I0mhVmdw==
X-Google-Smtp-Source: ABdhPJxB3cTrWpcCuNZk5W3HSSacGry1itViOJs1dis6G7pHUfW0a1pHTnMP/pnVfAVA/Sui1GF7vw==
X-Received: by 2002:ac8:d03:: with SMTP id q3mr867316qti.183.1618449569468;
 Wed, 14 Apr 2021 18:19:29 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id p10sm825946qtl.17.2021.04.14.18.19.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 18:19:26 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id n12so24267277ybf.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 18:19:25 -0700 (PDT)
X-Received: by 2002:a25:58d5:: with SMTP id m204mr1191125ybb.32.1618449565216; 
 Wed, 14 Apr 2021 18:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid>
 <YGpeo9LV4uAh1B7u@pendragon.ideasonboard.com>
In-Reply-To: <YGpeo9LV4uAh1B7u@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Apr 2021 18:19:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UN38EiYMiwNjysBS6dReKDaf+g2GcgaVt9iF1mTRKg7A@mail.gmail.com>
Message-ID: <CAD=FV=UN38EiYMiwNjysBS6dReKDaf+g2GcgaVt9iF1mTRKg7A@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] drm/bridge: Fix the stop condition of
 drm_bridge_chain_pre_enable()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

Hi,

On Sun, Apr 4, 2021 at 5:50 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> Thank you for the patch.
>
> On Fri, Apr 02, 2021 at 03:28:35PM -0700, Douglas Anderson wrote:
> > The drm_bridge_chain_pre_enable() is not the proper opposite of
> > drm_bridge_chain_post_disable(). It continues along the chain to
> > _before_ the starting bridge. Let's fix that.
> >
> > Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> > ---
> >
> > (no changes since v1)
> >
> >  drivers/gpu/drm/drm_bridge.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 64f0effb52ac..044acd07c153 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -522,6 +522,9 @@ void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
> >       list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> >               if (iter->funcs->pre_enable)
> >                       iter->funcs->pre_enable(iter);
> > +
> > +             if (iter == bridge)
> > +                     break;
>
> This looks good as it matches drm_atomic_bridge_chain_disable().
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for your review here and several of the other patches. Can you
suggest any plan for getting them landed? It would at least be nice to
get the non-controversial ones landed.


> I'm curious though, given that the bridge passed to the function should
> be the one closest to the encoder, does this make a difference ?

Yes, that's how I discovered it originally. Let's see. So if I don't
have this patch but have the rest of the series then I get a splat at
bootup. This shows that dsi_mgr_bridge_pre_enable() must be "earlier"
in the chain than my bridge chip. Here's the splat:

 msm_dsi_host_get_phy_clk_req: unable to calc clk rate, -22
 ------------[ cut here ]------------
 disp_cc_mdss_ahb_clk status stuck at 'off'
 WARNING: CPU: 7 PID: 404 at drivers/clk/qcom/clk-branch.c:92
clk_branch_toggle+0x194/0x280
 Modules linked in: joydev
 CPU: 7 PID: 404 Comm: frecon Tainted: G    B             5.12.0-rc3-lockdep+ #2
 Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
 pstate: 60400089 (nZCv daIf +PAN -UAO -TCO BTYPE=--)
 pc : clk_branch_toggle+0x194/0x280
 lr : clk_branch_toggle+0x190/0x280
 ...
 Call trace:
  clk_branch_toggle+0x194/0x280
  clk_branch2_enable+0x28/0x34
  clk_core_enable+0x2f4/0x6b4
  clk_enable+0x54/0x74
  dsi_phy_enable_resource+0x80/0xd8
  msm_dsi_phy_enable+0xa8/0x4a8
  enable_phy+0x9c/0xf4
  dsi_mgr_bridge_pre_enable+0x23c/0x4b0
  drm_bridge_chain_pre_enable+0xac/0xe4
  ti_sn_bridge_connector_get_modes+0x134/0x1b8
  drm_helper_probe_single_connector_modes+0x49c/0x1358
  drm_mode_getconnector+0x460/0xe98
  drm_ioctl_kernel+0x144/0x228
  drm_ioctl+0x418/0x7cc
  drm_compat_ioctl+0x1bc/0x230
  __arm64_compat_sys_ioctl+0x14c/0x188
  el0_svc_common+0x128/0x23c
  do_el0_svc_compat+0x50/0x60
  el0_svc_compat+0x24/0x34
  el0_sync_compat_handler+0xc0/0xf0
  el0_sync_compat+0x174/0x180
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
