Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E3636ABCE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 07:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2269C6E062;
	Mon, 26 Apr 2021 05:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BAF6E062
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 05:20:25 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id g125so443785iof.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Apr 2021 22:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zpMkjz9KyykiFO6l5ZQQuINgIfMM9OaiAAxRnjrTqLo=;
 b=diwNewPbdQFBq8nbfkdx9BlVdn6q+QQ7rkY5vw2F1FJFAl9k5Sx3CJGLUbm8kEplp1
 pKV4i/aMsoZXuMwyoElTvs0J6OWy9/je+pyvdyU40uSSP2iAOhtOnWp73VtHbaYdOvF5
 /almRjcvW7teXIf1nHh/cuafbPEmiyXMjiWfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zpMkjz9KyykiFO6l5ZQQuINgIfMM9OaiAAxRnjrTqLo=;
 b=aVfrwmXcqQ6+LXnWFQKUo5xH4Q0xtXsnzUVHl4fTkyQkxP0p/LtX+tPq26PsCEdB4d
 iRA9PiA8mONjnAbSm4I0OoU3MqJQptdKBsKpwJi+vM8D1dCj9NX+KHxu9/gXqF0frYX9
 LhCone96trruvRjNsJ26zj5dZwrv2YREpbGM8WrRhkoKI2oFO+gH02bxEnMLBh+KLzww
 c1OMrXw0/AWeAoVb97/NexDwmxnzaebhz2qnqQkLGpD+hJHDYdRx49wMK/tSzp/6jkYk
 TSZBoZHvi+0XtYbJoLvlXjnWGuiKa9OYpG03G7I7Yfaj5SGXsISp9obwEolKMGCNeyQH
 qB4w==
X-Gm-Message-State: AOAM531pNMFKzKfqLSsZGwOYJbRGA79xj7Gt5uQd6loH9KgsX4cV8n/H
 41s9n4qLVf8vQ+bLIpSgCJYXUWNO/HWMzpejzhKy0A==
X-Google-Smtp-Source: ABdhPJzl+nlI65EpIE3bLCS7G3KC95MAVHm0nvQs80CqTwdYNWAv1l/fLJqKJxUcdszePkWtP+JyptF55LMMQziX0SY=
X-Received: by 2002:a02:a40a:: with SMTP id c10mr14239901jal.98.1619414424923; 
 Sun, 25 Apr 2021 22:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210409045314.3420733-1-hsinyi@chromium.org>
 <CAMavQKJUpYP8jo2JDGMYNBGtbPSSO7z9BAComm5JQoty=HPtJg@mail.gmail.com>
In-Reply-To: <CAMavQKJUpYP8jo2JDGMYNBGtbPSSO7z9BAComm5JQoty=HPtJg@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 26 Apr 2021 13:19:59 +0800
Message-ID: <CAJMQK-govRgDfKhzxhe-GPBQ27EEfpmsxbbNH6X=6CTni=uqRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mediatek: set panel orientation before
 drm_dev_register().
To: Sean Paul <sean@poorly.run>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 9:53 PM Sean Paul <sean@poorly.run> wrote:
>
> On Fri, Apr 9, 2021 at 12:53 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > drm_dev_register() sets connector->registration_state to
> > DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> > drm_connector_set_panel_orientation() is first called after
> > drm_dev_register(), it will fail several checks and results in following
> > warning. So set panel orientation in dsi before drm_dev_register() is
> > called.
> >
> > [    4.480976] ------------[ cut here ]------------
> > [    4.485603] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:45 __drm_mode_object_add+0xb4/0xbc
> > <snip>
> > [    4.609772] Call trace:
> > [    4.612208]  __drm_mode_object_add+0xb4/0xbc
> > [    4.616466]  drm_mode_object_add+0x20/0x2c
> > [    4.620552]  drm_property_create+0xdc/0x174
> > [    4.624723]  drm_property_create_enum+0x34/0x98
> > [    4.629241]  drm_connector_set_panel_orientation+0x64/0xa0
> > [    4.634716]  boe_panel_get_modes+0x88/0xd8
> > [    4.638802]  drm_panel_get_modes+0x2c/0x48
> > [    4.642887]  panel_bridge_get_modes+0x1c/0x28
> > [    4.647233]  drm_bridge_connector_get_modes+0xa0/0xd4
> > [    4.652273]  drm_helper_probe_single_connector_modes+0x218/0x700
> > [    4.658266]  drm_mode_getconnector+0x1b4/0x45c
> > [    4.662699]  drm_ioctl_kernel+0xac/0x128
> > [    4.666611]  drm_ioctl+0x268/0x410
> > [    4.670002]  drm_compat_ioctl+0xdc/0xf0
> > [    4.673829]  __arm64_compat_sys_ioctl+0xc8/0x100
> > [    4.678436]  el0_svc_common+0xf4/0x1c0
> > [    4.682174]  do_el0_svc_compat+0x28/0x3c
> > [    4.686088]  el0_svc_compat+0x10/0x1c
> > [    4.689738]  el0_sync_compat_handler+0xa8/0xcc
> > [    4.694171]  el0_sync_compat+0x178/0x180
> > [    4.698082] ---[ end trace b4f2db9d9c88610b ]---
> > [    4.702721] ------------[ cut here ]------------
> > [    4.707329] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:243 drm_object_attach_property+0x48/0xb8
> > <snip>
> > [    4.833830] Call trace:
> > [    4.836266]  drm_object_attach_property+0x48/0xb8
> > [    4.840958]  drm_connector_set_panel_orientation+0x84/0xa0
> > [    4.846432]  boe_panel_get_modes+0x88/0xd8
> > [    4.850516]  drm_panel_get_modes+0x2c/0x48
> > [    4.854600]  panel_bridge_get_modes+0x1c/0x28
> > [    4.858946]  drm_bridge_connector_get_modes+0xa0/0xd4
> > [    4.863984]  drm_helper_probe_single_connector_modes+0x218/0x700
> > [    4.869978]  drm_mode_getconnector+0x1b4/0x45c
> > [    4.874410]  drm_ioctl_kernel+0xac/0x128
> > [    4.878320]  drm_ioctl+0x268/0x410
> > [    4.881711]  drm_compat_ioctl+0xdc/0xf0
> > [    4.885536]  __arm64_compat_sys_ioctl+0xc8/0x100
> > [    4.890142]  el0_svc_common+0xf4/0x1c0
> > [    4.893879]  do_el0_svc_compat+0x28/0x3c
> > [    4.897791]  el0_svc_compat+0x10/0x1c
> > [    4.901441]  el0_sync_compat_handler+0xa8/0xcc
> > [    4.905873]  el0_sync_compat+0x178/0x180
> > [    4.909783] ---[ end trace b4f2db9d9c88610c ]---
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index ae403c67cbd9..45a702ee09f3 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -205,6 +205,7 @@ struct mtk_dsi {
> >         u32 irq_data;
> >         wait_queue_head_t irq_wait_queue;
> >         const struct mtk_dsi_driver_data *driver_data;
> > +       enum drm_panel_orientation orientation;
> >  };
> >
> >  static inline struct mtk_dsi *bridge_to_dsi(struct drm_bridge *b)
> > @@ -966,6 +967,8 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
> >         }
> >         drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> >
> > +       drm_connector_set_panel_orientation(dsi->connector, dsi->orientation);
> > +
> >         return 0;
> >
> >  err_cleanup_encoder:
> > @@ -1029,6 +1032,12 @@ static int mtk_dsi_probe(struct platform_device *pdev)
> >                         ret = PTR_ERR(dsi->next_bridge);
> >                         goto err_unregister_host;
> >                 }
> > +
> > +               ret = of_drm_get_panel_orientation(panel->dev->of_node, &dsi->orientation);
> > +               if (ret) {
> > +                       dev_err(dev, "failed to get panel orientation %d\n", ret);
> > +                       return ret;
> > +               }
>
> I don't think this is the right place to mine orientation since it
> duplicates the call from the panel driver.
>
> Instead, how about splitting out
> property_create_enum/attach_orientation_property from
> set_panel_orientation such that you can attach the property (with
> UNKNOWN value) in the connector init and then leave the panel to set
> it properly in get_modes (I kind of disagree with populating this in
> get_modes as well, but I don't think there's anywhere else to stick it
> right now)?
>
> AFAICT orientation is the only property which has the create/attach
> calls in the set function which seems like a perfect recipe for this
> type of failure.
>
>
> Sean
>

Thanks for the review. It is updated in v2.

> >         }
> >
> >         dsi->driver_data = of_device_get_match_data(dev);
> > --
> > 2.31.1.295.g9ea45b61b8-goog
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
