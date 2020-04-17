Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F62A1AE3EC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 19:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813AD6E121;
	Fri, 17 Apr 2020 17:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B87A6E124
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 17:43:31 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5157D206F9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 17:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587145411;
 bh=IWA91rnd7DCpei0UmWDuuHsPYJS5PswBsXNqf1I/niM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Pt6wA/969eDisaL2JzYfgBP6eOp0melahjfTfCi9H8EnLElbCxdvrIpAP5QQSevBM
 QXKkHqle4SxaXu46mg+7MIVWhvyOK+bANS8DDykJGLWDi9AJiRCZKix5mRwXs+cLd2
 1RtwKes8OaezhnY7F0va/WgCzhFc+ZG9M3mNaieE=
Received: by mail-qk1-f176.google.com with SMTP id s63so3306355qke.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 10:43:31 -0700 (PDT)
X-Gm-Message-State: AGi0Pubo+zlTTuhKyHR7tZ9y+7mxE5qw6Gxo9bj2/8a5u+msWnGk0hrn
 9WfZYj2xyJZxY+upx+Tv4FVF8B3GG9xMeVIINA==
X-Google-Smtp-Source: APiQypKOFSzSrXp6TtG4ec8JhJUSBFuVeKwbSs75yAmLse130PcTkwzUaoj4aHrENTDYOHXuApeoXqGddN79f1x41JE=
X-Received: by 2002:a37:cc1:: with SMTP id 184mr4446305qkm.254.1587145410403; 
 Fri, 17 Apr 2020 10:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200409013947.12667-1-robh@kernel.org>
 <20200409013947.12667-3-robh@kernel.org>
 <20200409141603.GB4673@ravnborg.org>
In-Reply-To: <20200409141603.GB4673@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 17 Apr 2020 12:43:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJGZ5jX+-xkVmK5-uJU5hJg3tEa52RanYjY_sF_n+7PsA@mail.gmail.com>
Message-ID: <CAL_JsqJGZ5jX+-xkVmK5-uJU5hJg3tEa52RanYjY_sF_n+7PsA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm: pl111: Simplify vexpress init
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 9, 2020 at 9:16 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> On Wed, Apr 08, 2020 at 07:39:46PM -0600, Rob Herring wrote:
> > The init VExpress variants currently instantiates a 'muxfpga' driver for
> > the sole purpose of getting a regmap for it. There's no reason to
> > instantiate a driver and doing so just complicates things. The muxfpga
> > driver also isn't unregistered properly on module unload. Let's
> > just simplify all this this by just calling
> > devm_regmap_init_vexpress_config() directly.
> >
> > Cc: Eric Anholt <eric@anholt.net>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Procastinating, so I took a look at this.
> Nice simplification - on nit below.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  drivers/gpu/drm/pl111/pl111_versatile.c | 21 +++----------
> >  drivers/gpu/drm/pl111/pl111_vexpress.c  | 42 -------------------------
> >  drivers/gpu/drm/pl111/pl111_vexpress.h  |  7 -----
> >  3 files changed, 4 insertions(+), 66 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
> > index 09aeaffb7660..8c2551088f26 100644
> > --- a/drivers/gpu/drm/pl111/pl111_versatile.c
> > +++ b/drivers/gpu/drm/pl111/pl111_versatile.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/regmap.h>
> > +#include <linux/vexpress.h>
> >
> >  #include "pl111_versatile.h"
> >  #include "pl111_vexpress.h"
> > @@ -325,17 +326,8 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
> >       versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
> >
> >       /* Versatile Express special handling */
> > -     if (versatile_clcd_type == VEXPRESS_CLCD_V2M) {
> > +     if (IS_ENABLED(CONFIG_VEXPRESS_CONFIG) && versatile_clcd_type == VEXPRESS_CLCD_V2M) {
> >               struct platform_device *pdev;
> > -
> > -             /* Registers a driver for the muxfpga */
> > -             ret = vexpress_muxfpga_init();
> > -             if (ret) {
> > -                     dev_err(dev, "unable to initialize muxfpga driver\n");
> > -                     of_node_put(np);
> > -                     return ret;
> > -             }
> > -
> >               /* Call into deep Vexpress configuration API */
> >               pdev = of_find_device_by_node(np);
> >               if (!pdev) {
> > @@ -343,13 +335,8 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
> >                       of_node_put(np);
> >                       return -EPROBE_DEFER;
> >               }
> > -             map = dev_get_drvdata(&pdev->dev);
> > -             if (!map) {
> > -                     dev_err(dev, "sysreg has not yet probed\n");
> > -                     platform_device_put(pdev);
> > -                     of_node_put(np);
> > -                     return -EPROBE_DEFER;
> > -             }
> > +             map = devm_regmap_init_vexpress_config(&pdev->dev);
> > +             platform_device_put(pdev);
> >       } else {
> >               map = syscon_node_to_regmap(np);
> >       }
>
> On the following line there is:
>         if (IS_ERR(map)) {
>                 dev_err(dev, "no Versatile syscon regmap\n");
>                 return PTR_ERR(map);
>         }
>
> The error message no longer tell if this was
> devm_regmap_init_vexpress_config() or syscon_node_to_regmap() that
> caused the error.

Hopefully you'd know what platform you are on.

In any case, it's changed after patch 3.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
