Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A736B67DAF2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 01:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4846A10E010;
	Fri, 27 Jan 2023 00:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B7D10E010
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 00:52:26 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id fi26so3450692edb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 16:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dJOlXvxt/36mhDoKKtTcHi3UscUgi/2yAxB/faYJnd8=;
 b=LkPFurpLYoghBa1anakoas3K/Xd+PMO4YCNxlwlFkjlHpZoCrVo2DNlQtVX0C7DK/l
 ft/CJnbtQE9CLr++LczeysWQqWviHeRu0HRnzdj6fOdekOWhu+CyXaHhiip/8vcR/5Cx
 /XRfyTqJf/TVOMsIWwkfmXXRNZjBQHXTxab4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dJOlXvxt/36mhDoKKtTcHi3UscUgi/2yAxB/faYJnd8=;
 b=yyXwRe5HC1L/xW3aPNIsv18xWnjmkF60VtnzpFRs2IG2xRLX+gYGG9VDyjm+jC2SJg
 txIV4uAnhL+wY4QEjTrvl6YPIfg2g7Fx1mBpB/6JmNdvkxWXZ17UMbHfW4KZHASjZv1i
 JbQVf4rpXWd2CXrPfDBmMzzE9CsomoXwuKSS3bke25jOqC6vLYWGKRuA2JmlnxU0mvnP
 ru1oQtwm3ujFHuPzAri0ruXqAs1B8XCy17pYoK9Y268UVIYH4xt2xLy7vZWIagxZyFng
 Kj825AuOUdSmdPmmODZMr16R4S8OVa8lF0JYmvkvBeSrWHnwkqH2V0xTqa1SJ3zFFezn
 u28w==
X-Gm-Message-State: AFqh2kpV1acU6acz7qQkH8yxGQJE1YSfAgPS+/civ2rgZfsNKLg8a9ME
 GSo2Q/nyusjPZQ7PQ/U2T9oCUl/2TF31f84PpNc=
X-Google-Smtp-Source: AMrXdXu2m5TxPKRg7VPaIj1bMTl6xfco1KHk4fJs9bI8fOEn8mq/ePl7dTRjRkww1iKxinJHZxbJTg==
X-Received: by 2002:a05:6402:f07:b0:493:b55d:d7f2 with SMTP id
 i7-20020a0564020f0700b00493b55dd7f2mr47036023eda.14.1674780744587; 
 Thu, 26 Jan 2023 16:52:24 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 dm23-20020a05640222d700b0049eea46c909sm1501164edb.37.2023.01.26.16.52.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 16:52:23 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso2368830wmq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 16:52:22 -0800 (PST)
X-Received: by 2002:a7b:c38d:0:b0:3da:fd7c:98c2 with SMTP id
 s13-20020a7bc38d000000b003dafd7c98c2mr1635847wmj.93.1674780742639; Thu, 26
 Jan 2023 16:52:22 -0800 (PST)
MIME-Version: 1.0
References: <20230106030108.2542081-1-swboyd@chromium.org>
 <CAD=FV=U0Bwx4HzCSL8EE-+ngGLZ-NqpbC+J9jby84FKBOB_ddQ@mail.gmail.com>
In-Reply-To: <CAD=FV=U0Bwx4HzCSL8EE-+ngGLZ-NqpbC+J9jby84FKBOB_ddQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Jan 2023 16:52:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VMebqPd2ozLzY65Kba9snLKQ-KKd684O0cGQzyP0kcwQ@mail.gmail.com>
Message-ID: <CAD=FV=VMebqPd2ozLzY65Kba9snLKQ-KKd684O0cGQzyP0kcwQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed
 during disable
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jan 18, 2023 at 1:34 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Jan 5, 2023 at 7:01 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > The unprepare sequence has started to fail after moving to panel bridge
> > code in the msm drm driver (commit 007ac0262b0d ("drm/msm/dsi: switch to
> > DRM_PANEL_BRIDGE")). You'll see messages like this in the kernel logs:
> >
> >    panel-boe-tv101wum-nl6 ae94000.dsi.0: failed to set panel off: -22
> >
> > This is because boe_panel_enter_sleep_mode() needs an operating DSI link
> > to set the panel into sleep mode. Performing those writes in the
> > unprepare phase of bridge ops is too late, because the link has already
> > been torn down by the DSI controller in post_disable, i.e. the PHY has
> > been disabled, etc. See dsi_mgr_bridge_post_disable() for more details
> > on the DSI .
> >
> > Split the unprepare function into a disable part and an unprepare part.
> > For now, just the DSI writes to enter sleep mode are put in the disable
> > function. This fixes the panel off routine and keeps the panel happy.
> >
> > My Wormdingler has an integrated touchscreen that stops responding to
> > touch if the panel is only half disabled too. This patch fixes it. And
> > finally, this saves power when the screen is off because without this
> > fix the regulators for the panel are left enabled when nothing is being
> > displayed on the screen.
> >
> > Fixes: 007ac0262b0d ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
> > Fixes: a869b9db7adf ("drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel")
> > Cc: yangcong <yangcong5@huaqin.corp-partner.google.com>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Jitao Shi <jitao.shi@mediatek.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Rob Clark <robdclark@chromium.org>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > index 857a2f0420d7..c924f1124ebc 100644
> > --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > @@ -1193,14 +1193,11 @@ static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
> >         return 0;
> >  }
> >
> > -static int boe_panel_unprepare(struct drm_panel *panel)
> > +static int boe_panel_disable(struct drm_panel *panel)
> >  {
> >         struct boe_panel *boe = to_boe_panel(panel);
> >         int ret;
> >
> > -       if (!boe->prepared)
> > -               return 0;
> > -
> >         ret = boe_panel_enter_sleep_mode(boe);
> >         if (ret < 0) {
> >                 dev_err(panel->dev, "failed to set panel off: %d\n", ret);
> > @@ -1209,6 +1206,16 @@ static int boe_panel_unprepare(struct drm_panel *panel)
> >
> >         msleep(150);
> >
> > +       return 0;
> > +}
> > +
> > +static int boe_panel_unprepare(struct drm_panel *panel)
> > +{
> > +       struct boe_panel *boe = to_boe_panel(panel);
> > +
> > +       if (!boe->prepared)
> > +               return 0;
> > +
> >         if (boe->desc->discharge_on_disable) {
> >                 regulator_disable(boe->avee);
> >                 regulator_disable(boe->avdd);
> > @@ -1528,6 +1535,7 @@ static enum drm_panel_orientation boe_panel_get_orientation(struct drm_panel *pa
> >  }
> >
> >  static const struct drm_panel_funcs boe_panel_funcs = {
> > +       .disable = boe_panel_disable,
> >         .unprepare = boe_panel_unprepare,
> >         .prepare = boe_panel_prepare,
> >         .enable = boe_panel_enable,
>
> As mentioned by Stephen, my initial reaction was that this felt
> asymmetric. We were moving some stuff from unprepare() to disable()
> and it felt like that would mean we would also need to move something
> from prepare() to enable. Initially I thought maybe that "something"
> was all of boe_panel_init_dcs_cmd() but I guess that didn't work.
>
> I don't truly have a reason that this _has_ to be symmetric. I was
> initially worried that there might be some place where we call
> pre_enable(), then never call enable() / disable(), and then call
> post_disable(). That could have us in a bad state because we'd never
> enter sleep mode / turn the display off. However (as I think I've
> discovered before and just forgot), I don't think this is possible
> because we always call pre-enable() and enable() together. Also, as
> mentioned by Sam, we're about to fully shut the panel's power off so
> (unless it's on a shared rail) it probably doesn't really matter.
>
> Thus, I'd be OK with:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'm also happy to land this (adding Cc: stable) to drm-misc-fixes if
> nobody has any objections (also happy if someone else wants to land
> it). I guess the one worry I have is that somehow this could break
> something for one of the other 8 panels that this driver supports (or
> it could have bad interactions with the display controller used on a
> board with one of these panels?). Maybe we should have "Cc: stable"
> off just to give it extra bake time? ...and maybe even push to
> drm-misc-next instead of -fixes again to give extra bake time?

This thread has gone silent. I'll plan to land the patch in
drm-misc-next early next week, maybe Monday, _without_ Ccing stable,
so we have the longest possible bake time. If anyone has objections,
please yell.

-Doug
