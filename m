Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F5E1AE3D2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 19:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25F96E2A0;
	Fri, 17 Apr 2020 17:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341A96E2A0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 17:33:44 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5300208E4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 17:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587144823;
 bh=mbO3g0ndIHqGlmqlQGolAW9tH9DRusvYtgnVwXC5+g0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ALfW9eh9qAJ8fZiNE08TRagAIHFyBsQx5/VSbIaRBUTuoBOH1Oco5D//LogpoReVH
 klDG0QUoiRrD8EfqH7MCJPP7HL9376dxxswdbJ+Aq8tQxguabJykFyX15gaQAAKZNB
 9rcKp5uxEOl+vlCapJimHte0cijPfW7QkeULlxSU=
Received: by mail-qv1-f43.google.com with SMTP id p13so1283280qvt.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 10:33:43 -0700 (PDT)
X-Gm-Message-State: AGi0PuZKaelRdg2PLOF/wqjwfi2MEN5dXvczbld5tkn2VuSJJcTXLcYi
 aOVEZfDMBaYCqeuPSYjz74rjYy8mU/X4ayh+Qg==
X-Google-Smtp-Source: APiQypJwxUzjNMg0EVWDJL1880iNDj2VwwzK98md7RPwzqAgUD+RKwDBdD66IFnTOjp4yoytvr5+78K8XvkZ3eo9b34=
X-Received: by 2002:a0c:b651:: with SMTP id q17mr3615708qvf.135.1587144822462; 
 Fri, 17 Apr 2020 10:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200409013947.12667-1-robh@kernel.org>
 <20200409013947.12667-4-robh@kernel.org>
 <20200409143448.GC4673@ravnborg.org>
In-Reply-To: <20200409143448.GC4673@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 17 Apr 2020 12:33:29 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+pKubwZmmxr+EFVH_goDZ7zgeL912ChKsXS0P_tG-7Kg@mail.gmail.com>
Message-ID: <CAL_Jsq+pKubwZmmxr+EFVH_goDZ7zgeL912ChKsXS0P_tG-7Kg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: pl111: Move VExpress setup into versatile init
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

On Thu, Apr 9, 2020 at 9:34 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> On Wed, Apr 08, 2020 at 07:39:47PM -0600, Rob Herring wrote:
> > Since the VExpress setup in pl111_vexpress.c is now just a single
> > function call, let's move it into pl111_versatile.c and we can further
> > simplify pl111_versatile_init() by moving the other pieces for VExpress
> > into pl111_vexpress_clcd_init().
> >
> > Cc: Eric Anholt <eric@anholt.net>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> Patch looks good - nits below, but anyway:
>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
>
> > ---
> >  drivers/gpu/drm/pl111/Makefile          |   1 -
> >  drivers/gpu/drm/pl111/pl111_versatile.c | 122 ++++++++++++++++++++----
> >  drivers/gpu/drm/pl111/pl111_vexpress.c  |  96 -------------------
> >  drivers/gpu/drm/pl111/pl111_vexpress.h  |  22 -----
> >  4 files changed, 102 insertions(+), 139 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/pl111/pl111_vexpress.c
> >  delete mode 100644 drivers/gpu/drm/pl111/pl111_vexpress.h
> >
> > diff --git a/drivers/gpu/drm/pl111/Makefile b/drivers/gpu/drm/pl111/Makefile
> > index 0c70f0e91d21..67d430d433e0 100644
> > --- a/drivers/gpu/drm/pl111/Makefile
> > +++ b/drivers/gpu/drm/pl111/Makefile
> > @@ -3,7 +3,6 @@ pl111_drm-y +=        pl111_display.o \
> >               pl111_versatile.o \
> >               pl111_drv.o
> >
> > -pl111_drm-$(CONFIG_ARCH_VEXPRESS) += pl111_vexpress.o
> >  pl111_drm-$(CONFIG_ARCH_NOMADIK) += pl111_nomadik.o
> >  pl111_drm-$(CONFIG_DEBUG_FS) += pl111_debugfs.o
> >
> > diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
> > index 8c2551088f26..1b55f977e945 100644
> > --- a/drivers/gpu/drm/pl111/pl111_versatile.c
> > +++ b/drivers/gpu/drm/pl111/pl111_versatile.c
> > @@ -11,7 +11,6 @@
> >  #include <linux/vexpress.h>
> >
> >  #include "pl111_versatile.h"
> > -#include "pl111_vexpress.h"
> >  #include "pl111_drm.h"
> >
> >  static struct regmap *versatile_syscon_map;
> > @@ -309,13 +308,110 @@ static const struct pl111_variant_data pl111_vexpress = {
> >       .broken_clockdivider = true,
> >  };
> >
> > +#define VEXPRESS_FPGAMUX_MOTHERBOARD         0x00
> > +#define VEXPRESS_FPGAMUX_DAUGHTERBOARD_1     0x01
> > +#define VEXPRESS_FPGAMUX_DAUGHTERBOARD_2     0x02
> > +
> > +static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
> > +                                 struct pl111_drm_dev_private *priv)
> > +{
> > +     struct platform_device *pdev;
> > +     struct device_node *root;
> > +     struct device_node *child;
> > +     struct device_node *ct_clcd = NULL;
> > +     struct regmap *map;
> > +     bool has_coretile_clcd = false;
> > +     bool has_coretile_hdlcd = false;
> > +     bool mux_motherboard = true;
> > +     u32 val;
> > +     int ret;
> > +
> > +     if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
> > +             return -ENODEV;
> Thats was a simple way to get out of this.
> Maybe a WARN() was in place, because should we ever hit this?

We didn't warn before if misconfigured. Adding an error print at the
caller should be enough.

> > +
> > +     /*
> > +      * Check if we have a CLCD or HDLCD on the core tile by checking if a
> > +      * CLCD or HDLCD is available in the root of the device tree.
> > +      */
> > +     root = of_find_node_by_path("/");
> > +     if (!root)
> > +             return -EINVAL;
> > +
> > +     for_each_available_child_of_node(root, child) {
> > +             if (of_device_is_compatible(child, "arm,pl111")) {
> > +                     has_coretile_clcd = true;
> > +                     ct_clcd = child;
> > +                     break;
> > +             }
> > +             if (of_device_is_compatible(child, "arm,hdlcd")) {
> > +                     has_coretile_hdlcd = true;
> > +                     of_node_put(child);
> > +                     break;
> > +             }
> > +     }
> > +
> > +     of_node_put(root);
> > +
> > +     /*
> > +      * If there is a coretile HDLCD and it has a driver,
> > +      * do not mux the CLCD on the motherboard to the DVI.
> > +      */
> > +     if (has_coretile_hdlcd && IS_ENABLED(CONFIG_DRM_HDLCD))
> > +             mux_motherboard = false;
> > +
> > +     /*
> > +      * On the Vexpress CA9 we let the CLCD on the coretile
> > +      * take precedence, so also in this case do not mux the
> > +      * motherboard to the DVI.
> > +      */
> > +     if (has_coretile_clcd)
> > +             mux_motherboard = false;
> > +
> > +     if (mux_motherboard) {
> > +             dev_info(dev, "DVI muxed to motherboard CLCD\n");
> > +             val = VEXPRESS_FPGAMUX_MOTHERBOARD;
> > +     } else if (ct_clcd == dev->of_node) {
> > +             dev_info(dev,
> > +                      "DVI muxed to daughterboard 1 (core tile) CLCD\n");
> > +             val = VEXPRESS_FPGAMUX_DAUGHTERBOARD_1;
> > +     } else {
> > +             dev_info(dev, "core tile graphics present\n");
> > +             dev_info(dev, "this device will be deactivated\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     /* Call into deep Vexpress configuration API */
> > +     pdev = of_find_device_by_node(np);
> > +     if (!pdev) {
> > +             dev_err(dev, "can't find the sysreg device, deferring\n");
> > +             return -EPROBE_DEFER;
> > +     }
> > +
> > +     map = devm_regmap_init_vexpress_config(&pdev->dev);
> > +     if (IS_ERR(map)) {
> > +             platform_device_put(pdev);
> > +             return PTR_ERR(map);
> > +     }
> > +
> > +     ret = regmap_write(map, 0, val);
> > +     platform_device_put(pdev);
> > +     if (ret) {
> > +             dev_err(dev, "error setting DVI muxmode\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     priv->variant = &pl111_vexpress;
> > +     dev_info(dev, "initializing Versatile Express PL111\n");
> > +
> > +     return 0;
> > +}
> > +
> >  int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
> >  {
> >       const struct of_device_id *clcd_id;
> >       enum versatile_clcd versatile_clcd_type;
> >       struct device_node *np;
> >       struct regmap *map;
> > -     int ret;
> >
> >       np = of_find_matching_node_and_match(NULL, versatile_clcd_of_match,
> >                                            &clcd_id);
> > @@ -326,17 +422,10 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
> >       versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
> >
> >       /* Versatile Express special handling */
> > -     if (IS_ENABLED(CONFIG_VEXPRESS_CONFIG) && versatile_clcd_type == VEXPRESS_CLCD_V2M) {
> > -             struct platform_device *pdev;
> > -             /* Call into deep Vexpress configuration API */
> > -             pdev = of_find_device_by_node(np);
> > -             if (!pdev) {
> > -                     dev_err(dev, "can't find the sysreg device, deferring\n");
> > -                     of_node_put(np);
> > -                     return -EPROBE_DEFER;
> > -             }
> > -             map = devm_regmap_init_vexpress_config(&pdev->dev);
> > -             platform_device_put(pdev);
> > +     if (versatile_clcd_type == VEXPRESS_CLCD_V2M) {
> > +             int ret = pl111_vexpress_clcd_init(dev, np, priv);
> > +             of_node_put(np);
> > +             return ret;
> It is often in error situations one return early, but in this case it is
> a normal case. Maybe a small comment?

I'm adding a print here to address your other comments and I think
that should be sufficient. I'll also move this up so the Vexpress
handling is before everything else.

>
>
> >       } else {

And I don't need this else.

> >               map = syscon_node_to_regmap(np);
> >       }
> > @@ -380,13 +469,6 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
> >               priv->variant_display_disable = pl111_realview_clcd_disable;
> >               dev_info(dev, "set up callbacks for RealView PL111\n");
> >               break;
> > -     case VEXPRESS_CLCD_V2M:
> > -             priv->variant = &pl111_vexpress;
> > -             dev_info(dev, "initializing Versatile Express PL111\n");
> > -             ret = pl111_vexpress_clcd_init(dev, priv, map);
> > -             if (ret)
> > -                     return ret;
> > -             break;
>
> The switch no longer includes VEXPRESS_CLCD_V2M - because we will never
> reach the switch in this case.
> I guess some gcc falgs may cause a warning that not all enums are
> accounted for. But then again, the default may supress it.

Yes, default suppresses that.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
