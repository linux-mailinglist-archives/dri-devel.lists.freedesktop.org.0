Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D7749D3D1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBD210E123;
	Wed, 26 Jan 2022 20:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C854810E1CD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 20:48:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A871478;
 Wed, 26 Jan 2022 21:48:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1643230124;
 bh=Uh4quTXO8ggoPqMF9e0DaR/yL2ESz4My27btKuymGkI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=hfTPSZwi2hyv78hnsASd+mZg/BSTbSBmIbzBJJaQ2w76r/vd+QE+zjSM1MyYNCdtP
 2OOnIWDtyzLZPNr848JLklHOayOq8niKtwzU5Y95phZa46nk7oTCEnGTxtdRJjUX3X
 cd1L6HTi5B6lYeJ9qo6Dyu0O4dY9IxD8+O4KlauE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220126202956.18364-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220126202956.18364-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Drop LVDS device tree backward compatibility
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Wed, 26 Jan 2022 20:48:41 +0000
Message-ID: <164323012179.2048960.11974119461239009438@Monstersaurus>
User-Agent: alot/0.10
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
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2022-01-26 20:29:56)
> The rcar-du driver goes to great lengths to preserve device tree
> backward compatibility for the LVDS encoders by patching old device
> trees at runtime.
>=20
> The last R-Car Gen2 platform was converted to the new bindings commit
> edb0c3affe5214a2 ("ARM: dts: r8a7793: Convert to new LVDS DT bindings"),
> in v4.17, and the last RZ/G1 platform converted in commit
> 6a6a797625b5fe85 ("ARM: dts: r8a7743: Convert to new LVDS DT bindings"),
> in v5.0. Both are older than commit 58256143cff7c2e0 ("clk: renesas:
> Remove R-Car Gen2 legacy DT clock support"), in v5.5, which removes
> support for legacy bindings for clocks. The LBDS compatibility code is

s/LBDS/LVDS/

> thus not needed anymore. Drop it.

Oh, I'm almost sad to see such exotic code go...

But code gone is less code to worry about so:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/gpu/drm/rcar-du/Makefile              |   6 -
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  15 +-
>  drivers/gpu/drm/rcar-du/rcar_du_of.c          | 323 ------------------
>  drivers/gpu/drm/rcar-du/rcar_du_of.h          |  20 --
>  .../drm/rcar-du/rcar_du_of_lvds_r8a7790.dts   |  69 ----
>  .../drm/rcar-du/rcar_du_of_lvds_r8a7791.dts   |  43 ---
>  .../drm/rcar-du/rcar_du_of_lvds_r8a7793.dts   |  43 ---
>  .../drm/rcar-du/rcar_du_of_lvds_r8a7795.dts   |  43 ---
>  .../drm/rcar-du/rcar_du_of_lvds_r8a7796.dts   |  43 ---
>  9 files changed, 1 insertion(+), 604 deletions(-)
>  delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
>  delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
>  delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
>  delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
>  delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
>  delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
>  delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
>=20
> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/M=
akefile
> index 286bc81b3e7c..e7275b5e7ec8 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -6,12 +6,6 @@ rcar-du-drm-y :=3D rcar_du_crtc.o \
>                  rcar_du_kms.o \
>                  rcar_du_plane.o \
> =20
> -rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)    +=3D rcar_du_of.o \
> -                                          rcar_du_of_lvds_r8a7790.dtb.o \
> -                                          rcar_du_of_lvds_r8a7791.dtb.o \
> -                                          rcar_du_of_lvds_r8a7793.dtb.o \
> -                                          rcar_du_of_lvds_r8a7795.dtb.o \
> -                                          rcar_du_of_lvds_r8a7796.dtb.o
>  rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)     +=3D rcar_du_vsp.o
>  rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) +=3D rcar_du_writeback.o
> =20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar=
-du/rcar_du_drv.c
> index 5a8131ef81d5..71a9df5a4834 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -28,7 +28,6 @@
> =20
>  #include "rcar_du_drv.h"
>  #include "rcar_du_kms.h"
> -#include "rcar_du_of.h"
>  #include "rcar_du_regs.h"
> =20
>  /* ---------------------------------------------------------------------=
--------
> @@ -699,19 +698,7 @@ static struct platform_driver rcar_du_platform_drive=
r =3D {
>         },
>  };
> =20
> -static int __init rcar_du_init(void)
> -{
> -       rcar_du_of_init(rcar_du_of_table);
> -
> -       return platform_driver_register(&rcar_du_platform_driver);
> -}
> -module_init(rcar_du_init);
> -
> -static void __exit rcar_du_exit(void)
> -{
> -       platform_driver_unregister(&rcar_du_platform_driver);
> -}
> -module_exit(rcar_du_exit);
> +module_platform_driver(rcar_du_platform_driver);
> =20
>  MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
>  MODULE_DESCRIPTION("Renesas R-Car Display Unit DRM Driver");
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c b/drivers/gpu/drm/rcar-=
du/rcar_du_of.c
> deleted file mode 100644
> index afef69669bb4..000000000000
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of.c
> +++ /dev/null
> @@ -1,323 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * rcar_du_of.c - Legacy DT bindings compatibility
> - *
> - * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.co=
m>
> - *
> - * Based on work from Jyri Sarha <jsarha@ti.com>
> - * Copyright (C) 2015 Texas Instruments
> - */
> -
> -#include <linux/init.h>
> -#include <linux/kernel.h>
> -#include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <linux/of_fdt.h>
> -#include <linux/of_graph.h>
> -#include <linux/slab.h>
> -
> -#include "rcar_du_crtc.h"
> -#include "rcar_du_drv.h"
> -#include "rcar_du_of.h"
> -
> -/* ---------------------------------------------------------------------=
--------
> - * Generic Overlay Handling
> - */
> -
> -struct rcar_du_of_overlay {
> -       const char *compatible;
> -       void *begin;
> -       void *end;
> -};
> -
> -#define RCAR_DU_OF_DTB(type, soc)                                      \
> -       extern char __dtb_rcar_du_of_##type##_##soc##_begin[];          \
> -       extern char __dtb_rcar_du_of_##type##_##soc##_end[]
> -
> -#define RCAR_DU_OF_OVERLAY(type, soc)                                  \
> -       {                                                               \
> -               .compatible =3D "renesas,du-" #soc,                      =
 \
> -               .begin =3D __dtb_rcar_du_of_##type##_##soc##_begin,      =
 \
> -               .end =3D __dtb_rcar_du_of_##type##_##soc##_end,          =
 \
> -       }
> -
> -static int __init rcar_du_of_apply_overlay(const struct rcar_du_of_overl=
ay *dtbs,
> -                                          const char *compatible)
> -{
> -       const struct rcar_du_of_overlay *dtb =3D NULL;
> -       unsigned int i;
> -       int ovcs_id;
> -
> -       for (i =3D 0; dtbs[i].compatible; ++i) {
> -               if (!strcmp(dtbs[i].compatible, compatible)) {
> -                       dtb =3D &dtbs[i];
> -                       break;
> -               }
> -       }
> -
> -       if (!dtb)
> -               return -ENODEV;
> -
> -       ovcs_id =3D 0;
> -       return of_overlay_fdt_apply(dtb->begin, dtb->end - dtb->begin,
> -                                   &ovcs_id);
> -}
> -
> -static int __init rcar_du_of_add_property(struct of_changeset *ocs,
> -                                         struct device_node *np,
> -                                         const char *name, const void *v=
alue,
> -                                         int length)
> -{
> -       struct property *prop;
> -       int ret =3D -ENOMEM;
> -
> -       prop =3D kzalloc(sizeof(*prop), GFP_KERNEL);
> -       if (!prop)
> -               return -ENOMEM;
> -
> -       prop->name =3D kstrdup(name, GFP_KERNEL);
> -       if (!prop->name)
> -               goto out_err;
> -
> -       prop->value =3D kmemdup(value, length, GFP_KERNEL);
> -       if (!prop->value)
> -               goto out_err;
> -
> -       of_property_set_flag(prop, OF_DYNAMIC);
> -
> -       prop->length =3D length;
> -
> -       ret =3D of_changeset_add_property(ocs, np, prop);
> -       if (!ret)
> -               return 0;
> -
> -out_err:
> -       kfree(prop->value);
> -       kfree(prop->name);
> -       kfree(prop);
> -       return ret;
> -}
> -
> -/* ---------------------------------------------------------------------=
--------
> - * LVDS Overlays
> - */
> -
> -RCAR_DU_OF_DTB(lvds, r8a7790);
> -RCAR_DU_OF_DTB(lvds, r8a7791);
> -RCAR_DU_OF_DTB(lvds, r8a7793);
> -RCAR_DU_OF_DTB(lvds, r8a7795);
> -RCAR_DU_OF_DTB(lvds, r8a7796);
> -
> -static const struct rcar_du_of_overlay rcar_du_lvds_overlays[] __initcon=
st =3D {
> -       RCAR_DU_OF_OVERLAY(lvds, r8a7790),
> -       RCAR_DU_OF_OVERLAY(lvds, r8a7791),
> -       RCAR_DU_OF_OVERLAY(lvds, r8a7793),
> -       RCAR_DU_OF_OVERLAY(lvds, r8a7795),
> -       RCAR_DU_OF_OVERLAY(lvds, r8a7796),
> -       { /* Sentinel */ },
> -};
> -
> -static struct of_changeset rcar_du_lvds_changeset;
> -
> -static void __init rcar_du_of_lvds_patch_one(struct device_node *lvds,
> -                                            const struct of_phandle_args=
 *clk,
> -                                            struct device_node *local,
> -                                            struct device_node *remote)
> -{
> -       unsigned int psize;
> -       unsigned int i;
> -       __be32 value[4];
> -       int ret;
> -
> -       /*
> -        * Set the LVDS clocks property. This can't be performed by the o=
verlay
> -        * as the structure of the clock specifier has changed over time,=
 and we
> -        * don't know at compile time which binding version the system we=
 will
> -        * run on uses.
> -        */
> -       if (clk->args_count >=3D ARRAY_SIZE(value) - 1)
> -               return;
> -
> -       of_changeset_init(&rcar_du_lvds_changeset);
> -
> -       value[0] =3D cpu_to_be32(clk->np->phandle);
> -       for (i =3D 0; i < clk->args_count; ++i)
> -               value[i + 1] =3D cpu_to_be32(clk->args[i]);
> -
> -       psize =3D (clk->args_count + 1) * 4;
> -       ret =3D rcar_du_of_add_property(&rcar_du_lvds_changeset, lvds,
> -                                     "clocks", value, psize);
> -       if (ret < 0)
> -               goto done;
> -
> -       /*
> -        * Insert the node in the OF graph: patch the LVDS ports remote-e=
ndpoint
> -        * properties to point to the endpoints of the sibling nodes in t=
he
> -        * graph. This can't be performed by the overlay: on the input si=
de the
> -        * overlay would contain a phandle for the DU LVDS output port th=
at
> -        * would clash with the system DT, and on the output side the con=
nection
> -        * is board-specific.
> -        */
> -       value[0] =3D cpu_to_be32(local->phandle);
> -       value[1] =3D cpu_to_be32(remote->phandle);
> -
> -       for (i =3D 0; i < 2; ++i) {
> -               struct device_node *endpoint;
> -
> -               endpoint =3D of_graph_get_endpoint_by_regs(lvds, i, 0);
> -               if (!endpoint) {
> -                       ret =3D -EINVAL;
> -                       goto done;
> -               }
> -
> -               ret =3D rcar_du_of_add_property(&rcar_du_lvds_changeset,
> -                                             endpoint, "remote-endpoint",
> -                                             &value[i], sizeof(value[i])=
);
> -               of_node_put(endpoint);
> -               if (ret < 0)
> -                       goto done;
> -       }
> -
> -       ret =3D of_changeset_apply(&rcar_du_lvds_changeset);
> -
> -done:
> -       if (ret < 0)
> -               of_changeset_destroy(&rcar_du_lvds_changeset);
> -}
> -
> -struct lvds_of_data {
> -       struct resource res;
> -       struct of_phandle_args clkspec;
> -       struct device_node *local;
> -       struct device_node *remote;
> -};
> -
> -static void __init rcar_du_of_lvds_patch(const struct of_device_id *of_i=
ds)
> -{
> -       const struct rcar_du_device_info *info;
> -       const struct of_device_id *match;
> -       struct lvds_of_data lvds_data[2] =3D { };
> -       struct device_node *lvds_node;
> -       struct device_node *soc_node;
> -       struct device_node *du_node;
> -       char compatible[22];
> -       const char *soc_name;
> -       unsigned int i;
> -       int ret;
> -
> -       /* Get the DU node and exit if not present or disabled. */
> -       du_node =3D of_find_matching_node_and_match(NULL, of_ids, &match);
> -       if (!du_node || !of_device_is_available(du_node)) {
> -               of_node_put(du_node);
> -               return;
> -       }
> -
> -       info =3D match->data;
> -       soc_node =3D of_get_parent(du_node);
> -
> -       if (WARN_ON(info->num_lvds > ARRAY_SIZE(lvds_data)))
> -               goto done;
> -
> -       /*
> -        * Skip if the LVDS nodes already exists.
> -        *
> -        * The nodes are searched based on the compatible string, which we
> -        * construct from the SoC name found in the DU compatible string.=
 As a
> -        * match has been found we know the compatible string matches the
> -        * expected format and can thus skip some of the string manipulat=
ion
> -        * normal safety checks.
> -        */
> -       soc_name =3D strchr(match->compatible, '-') + 1;
> -       sprintf(compatible, "renesas,%s-lvds", soc_name);
> -       lvds_node =3D of_find_compatible_node(NULL, NULL, compatible);
> -       if (lvds_node) {
> -               of_node_put(lvds_node);
> -               return;
> -       }
> -
> -       /*
> -        * Parse the DU node and store the register specifier, the clock
> -        * specifier and the local and remote endpoint of the LVDS link f=
or
> -        * later use.
> -        */
> -       for (i =3D 0; i < info->num_lvds; ++i) {
> -               struct lvds_of_data *lvds =3D &lvds_data[i];
> -               unsigned int port;
> -               char name[7];
> -               int index;
> -
> -               sprintf(name, "lvds.%u", i);
> -               index =3D of_property_match_string(du_node, "clock-names"=
, name);
> -               if (index < 0)
> -                       continue;
> -
> -               ret =3D of_parse_phandle_with_args(du_node, "clocks",
> -                                                "#clock-cells", index,
> -                                                &lvds->clkspec);
> -               if (ret < 0)
> -                       continue;
> -
> -               port =3D info->routes[RCAR_DU_OUTPUT_LVDS0 + i].port;
> -
> -               lvds->local =3D of_graph_get_endpoint_by_regs(du_node, po=
rt, 0);
> -               if (!lvds->local)
> -                       continue;
> -
> -               lvds->remote =3D of_graph_get_remote_endpoint(lvds->local=
);
> -               if (!lvds->remote)
> -                       continue;
> -
> -               index =3D of_property_match_string(du_node, "reg-names", =
name);
> -               if (index < 0)
> -                       continue;
> -
> -               of_address_to_resource(du_node, index, &lvds->res);
> -       }
> -
> -       /* Parse and apply the overlay. This will resolve phandles. */
> -       ret =3D rcar_du_of_apply_overlay(rcar_du_lvds_overlays,
> -                                      match->compatible);
> -       if (ret < 0)
> -               goto done;
> -
> -       /* Patch the newly created LVDS encoder nodes. */
> -       for_each_child_of_node(soc_node, lvds_node) {
> -               struct resource res;
> -
> -               if (!of_device_is_compatible(lvds_node, compatible))
> -                       continue;
> -
> -               /* Locate the lvds_data entry based on the resource start=
. */
> -               ret =3D of_address_to_resource(lvds_node, 0, &res);
> -               if (ret < 0)
> -                       continue;
> -
> -               for (i =3D 0; i < ARRAY_SIZE(lvds_data); ++i) {
> -                       if (lvds_data[i].res.start =3D=3D res.start)
> -                               break;
> -               }
> -
> -               if (i =3D=3D ARRAY_SIZE(lvds_data))
> -                       continue;
> -
> -               /* Patch the LVDS encoder. */
> -               rcar_du_of_lvds_patch_one(lvds_node, &lvds_data[i].clkspe=
c,
> -                                         lvds_data[i].local,
> -                                         lvds_data[i].remote);
> -       }
> -
> -done:
> -       for (i =3D 0; i < info->num_lvds; ++i) {
> -               of_node_put(lvds_data[i].clkspec.np);
> -               of_node_put(lvds_data[i].local);
> -               of_node_put(lvds_data[i].remote);
> -       }
> -
> -       of_node_put(soc_node);
> -       of_node_put(du_node);
> -}
> -
> -void __init rcar_du_of_init(const struct of_device_id *of_ids)
> -{
> -       rcar_du_of_lvds_patch(of_ids);
> -}
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.h b/drivers/gpu/drm/rcar-=
du/rcar_du_of.h
> deleted file mode 100644
> index 8dd3fbe96650..000000000000
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of.h
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * rcar_du_of.h - Legacy DT bindings compatibility
> - *
> - * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.co=
m>
> - */
> -#ifndef __RCAR_DU_OF_H__
> -#define __RCAR_DU_OF_H__
> -
> -#include <linux/init.h>
> -
> -struct of_device_id;
> -
> -#if IS_ENABLED(CONFIG_DRM_RCAR_LVDS)
> -void __init rcar_du_of_init(const struct of_device_id *of_ids);
> -#else
> -static inline void rcar_du_of_init(const struct of_device_id *of_ids) { }
> -#endif /* CONFIG_DRM_RCAR_LVDS */
> -
> -#endif /* __RCAR_DU_OF_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts b/driver=
s/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
> deleted file mode 100644
> index 8bee4e787a0a..000000000000
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * rcar_du_of_lvds_r8a7790.dts - Legacy LVDS DT bindings conversion for =
R8A7790
> - *
> - * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.co=
m>
> - */
> -
> -/dts-v1/;
> -/plugin/;
> -
> -&{/} {
> -       #address-cells =3D <2>;
> -       #size-cells =3D <2>;
> -
> -       lvds@feb90000 {
> -               compatible =3D "renesas,r8a7790-lvds";
> -               reg =3D <0 0xfeb90000 0 0x1c>;
> -
> -               ports {
> -                       #address-cells =3D <1>;
> -                       #size-cells =3D <0>;
> -
> -                       port@0 {
> -                               reg =3D <0>;
> -                               lvds0_input: endpoint {
> -                               };
> -                       };
> -                       port@1 {
> -                               reg =3D <1>;
> -                               lvds0_out: endpoint {
> -                               };
> -                       };
> -               };
> -       };
> -
> -       lvds@feb94000 {
> -               compatible =3D "renesas,r8a7790-lvds";
> -               reg =3D <0 0xfeb94000 0 0x1c>;
> -
> -               ports {
> -                       #address-cells =3D <1>;
> -                       #size-cells =3D <0>;
> -
> -                       port@0 {
> -                               reg =3D <0>;
> -                               lvds1_input: endpoint {
> -                               };
> -                       };
> -                       port@1 {
> -                               reg =3D <1>;
> -                               lvds1_out: endpoint {
> -                               };
> -                       };
> -               };
> -       };
> -};
> -
> -&{/display@feb00000/ports} {
> -       port@1 {
> -               endpoint {
> -                       remote-endpoint =3D <&lvds0_input>;
> -               };
> -       };
> -       port@2 {
> -               endpoint {
> -                       remote-endpoint =3D <&lvds1_input>;
> -               };
> -       };
> -};
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts b/driver=
s/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
> deleted file mode 100644
> index 92c0509971ec..000000000000
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * rcar_du_of_lvds_r8a7791.dts - Legacy LVDS DT bindings conversion for =
R8A7791
> - *
> - * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.co=
m>
> - */
> -
> -/dts-v1/;
> -/plugin/;
> -
> -&{/} {
> -       #address-cells =3D <2>;
> -       #size-cells =3D <2>;
> -
> -       lvds@feb90000 {
> -               compatible =3D "renesas,r8a7791-lvds";
> -               reg =3D <0 0xfeb90000 0 0x1c>;
> -
> -               ports {
> -                       #address-cells =3D <1>;
> -                       #size-cells =3D <0>;
> -
> -                       port@0 {
> -                               reg =3D <0>;
> -                               lvds0_input: endpoint {
> -                               };
> -                       };
> -                       port@1 {
> -                               reg =3D <1>;
> -                               lvds0_out: endpoint {
> -                               };
> -                       };
> -               };
> -       };
> -};
> -
> -&{/display@feb00000/ports} {
> -       port@1 {
> -               endpoint {
> -                       remote-endpoint =3D <&lvds0_input>;
> -               };
> -       };
> -};
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts b/driver=
s/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
> deleted file mode 100644
> index c8b93f21de0f..000000000000
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * rcar_du_of_lvds_r8a7793.dts - Legacy LVDS DT bindings conversion for =
R8A7793
> - *
> - * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.co=
m>
> - */
> -
> -/dts-v1/;
> -/plugin/;
> -
> -&{/} {
> -       #address-cells =3D <2>;
> -       #size-cells =3D <2>;
> -
> -       lvds@feb90000 {
> -               compatible =3D "renesas,r8a7793-lvds";
> -               reg =3D <0 0xfeb90000 0 0x1c>;
> -
> -               ports {
> -                       #address-cells =3D <1>;
> -                       #size-cells =3D <0>;
> -
> -                       port@0 {
> -                               reg =3D <0>;
> -                               lvds0_input: endpoint {
> -                               };
> -                       };
> -                       port@1 {
> -                               reg =3D <1>;
> -                               lvds0_out: endpoint {
> -                               };
> -                       };
> -               };
> -       };
> -};
> -
> -&{/display@feb00000/ports} {
> -       port@1 {
> -               endpoint {
> -                       remote-endpoint =3D <&lvds0_input>;
> -               };
> -       };
> -};
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts b/driver=
s/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
> deleted file mode 100644
> index 16c2d03cb016..000000000000
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * rcar_du_of_lvds_r8a7795.dts - Legacy LVDS DT bindings conversion for =
R8A7795
> - *
> - * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.co=
m>
> - */
> -
> -/dts-v1/;
> -/plugin/;
> -
> -&{/soc} {
> -       #address-cells =3D <2>;
> -       #size-cells =3D <2>;
> -
> -       lvds@feb90000 {
> -               compatible =3D "renesas,r8a7795-lvds";
> -               reg =3D <0 0xfeb90000 0 0x14>;
> -
> -               ports {
> -                       #address-cells =3D <1>;
> -                       #size-cells =3D <0>;
> -
> -                       port@0 {
> -                               reg =3D <0>;
> -                               lvds0_input: endpoint {
> -                               };
> -                       };
> -                       port@1 {
> -                               reg =3D <1>;
> -                               lvds0_out: endpoint {
> -                               };
> -                       };
> -               };
> -       };
> -};
> -
> -&{/soc/display@feb00000/ports} {
> -       port@3 {
> -               endpoint {
> -                       remote-endpoint =3D <&lvds0_input>;
> -               };
> -       };
> -};
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts b/driver=
s/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
> deleted file mode 100644
> index 680e923ac036..000000000000
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * rcar_du_of_lvds_r8a7796.dts - Legacy LVDS DT bindings conversion for =
R8A7796
> - *
> - * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.co=
m>
> - */
> -
> -/dts-v1/;
> -/plugin/;
> -
> -&{/soc} {
> -       #address-cells =3D <2>;
> -       #size-cells =3D <2>;
> -
> -       lvds@feb90000 {
> -               compatible =3D "renesas,r8a7796-lvds";
> -               reg =3D <0 0xfeb90000 0 0x14>;
> -
> -               ports {
> -                       #address-cells =3D <1>;
> -                       #size-cells =3D <0>;
> -
> -                       port@0 {
> -                               reg =3D <0>;
> -                               lvds0_input: endpoint {
> -                               };
> -                       };
> -                       port@1 {
> -                               reg =3D <1>;
> -                               lvds0_out: endpoint {
> -                               };
> -                       };
> -               };
> -       };
> -};
> -
> -&{/soc/display@feb00000/ports} {
> -       port@3 {
> -               endpoint {
> -                       remote-endpoint =3D <&lvds0_input>;
> -               };
> -       };
> -};
> --=20
> Regards,
>=20
> Laurent Pinchart
>
