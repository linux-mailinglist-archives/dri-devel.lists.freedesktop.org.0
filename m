Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA17D25D2A2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F056EB1D;
	Fri,  4 Sep 2020 07:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0BB6EB1D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 07:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 2331BFB03;
 Fri,  4 Sep 2020 09:47:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e_2jAfQnGV8S; Fri,  4 Sep 2020 09:47:02 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 2AF5945B81; Fri,  4 Sep 2020 09:47:02 +0200 (CEST)
Date: Fri, 4 Sep 2020 09:47:02 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] drm/panel: Add panel driver for the Mantix
 MLAF057WE51-X DSI panel
Message-ID: <20200904074702.GA124270@bogon.m.sigxcpu.org>
References: <20200831112924.GA512743@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200831112924.GA512743@mwanda>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Mon, Aug 31, 2020 at 02:29:24PM +0300, Dan Carpenter wrote:
> Hello Guido G=FCnther,
> =

> The patch 72967d5616d3: "drm/panel: Add panel driver for the Mantix
> MLAF057WE51-X DSI panel" from Aug 17, 2020, leads to the following
> static checker warning:
> =

> 	drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c:205 mantix_get_modes()
> 	error: we previously assumed 'mode' could be null (see line 204)
> =

> drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
>    197  static int mantix_get_modes(struct drm_panel *panel,
>    198                              struct drm_connector *connector)
>    199  {
>    200          struct mantix *ctx =3D panel_to_mantix(panel);
>    201          struct drm_display_mode *mode;
>    202  =

>    203          mode =3D drm_mode_duplicate(connector->dev, &default_mode=
);
>    204          if (!mode) {
>    205                  dev_err(ctx->dev, "Failed to add mode %ux%u@%u\n",
>    206                          default_mode.hdisplay, default_mode.vdisp=
lay,
>    207                          drm_mode_vrefresh(mode));
>                                                   ^^^^
> This will lead to a NULL dereference.

Thanks, i'll fold a fix for this into some other upcoming changes to
this driver.
Cheers,
 -- Guido

> =

>    208                  return -ENOMEM;
>    209          }
>    210  =

>    211          drm_mode_set_name(mode);
>    212  =

>    213          mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFE=
RRED;
>    214          connector->display_info.width_mm =3D mode->width_mm;
>    215          connector->display_info.height_mm =3D mode->height_mm;
>    216          drm_mode_probed_add(connector, mode);
>    217  =

>    218          return 1;
>    219  }
> =

> regards,
> dan carpenter
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
