Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFB99AF506
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 00:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E101610E3C3;
	Thu, 24 Oct 2024 22:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aDsd6eet";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECD010E3C3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 22:03:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 85F5B5C59E5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 22:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B90C4CEE9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 22:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729807428;
 bh=rvm0sqyM2Iuo+G/JA+hU3fSOwR/fA93E6NiMqCWY8ZM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aDsd6eetFsT76YujCvqrxSBlJhCRJNUngo87sX6virrURSXimyoeFnMa5ZKEoB2vS
 sloVjhcFws7WV2JObyvAvI+z4ZXexaOdiAuky+EswMc/HKZBxCf28NsCXTkRhx3s1O
 gOvPEpZT0eeit87A36FG+IfjCUsl0z6fQ0m5oRi/dIqEpVkdnaUWdO/0NESausgkHM
 MN3Y15ywDOzTv0c/VI4cqnDNKt6fVbE47tJ5q8W4OavsZ+bOOL/3PSOYYhi/0yw+jc
 DJkXNG/LBk4yCWyBALyDoKgYqrJZ0ZYGXB2N1aOQStWWGzKjjghAcjTQGyPlgkDKXZ
 MHAZrVHT8uIkQ==
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-539e4b7409fso1522122e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 15:03:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXgwOwP3RZg0+SJLBXnPQOYhmf/XezPVwd3Bk8i+qxlw+iul0lOk2UQrMn3b4CwaDe/AaJWnfszewc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmAObIGxaKenSNDou88J/wT2QwKWB5m1L+mF8YFhabt5vrCEg8
 n2Mf2R8LI4aMrP1aDbbFkku7ssbX5RN2be/Yz4d5Br141nBmj8qEXKfIfRUSyG091/9NzzDM4gk
 eZ6yoRk8nZuruP3mmvUIlA62cAw==
X-Google-Smtp-Source: AGHT+IGF6eWZ0+7n7HQRyqqTejSHhmgOHjWsU/iJM8V90fYyb1ZIuNBy89dtclskBrr3PVViovbrpowh66UndWkfyZM=
X-Received: by 2002:a05:6512:3d0e:b0:536:7a79:b4df with SMTP id
 2adb3069b0e04-53b2371753fmr1240151e87.14.1729807426772; Thu, 24 Oct 2024
 15:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 24 Oct 2024 17:03:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKcznR3WoVjUpnWCs6KFW-DAXW1Nvr2_Usb_OzPkkoVuQ@mail.gmail.com>
Message-ID: <CAL_JsqKcznR3WoVjUpnWCs6KFW-DAXW1Nvr2_Usb_OzPkkoVuQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] of: property: add
 of_graph_get_next_port/port_endpoint()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Oct 23, 2024 at 9:19=E2=80=AFPM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Rob, Saravana, Tomi, Laurent, Sakari, Mark
>
> This is v8 patch-set
>
> Current Of-graph has "endpoint base" for loop, but doesn't have
> "port base" loop. "endpoint base" loop only is not enough.
> This patch-set add new "port base" for loop, and use it.
>
> v7 -> v8
>         - add Acked-by from Sakari/Helge
>         - tidyup comment line
>
> v6 -> v7
>         - based on latest linus/master branch
>         - remove "ports" base functions
>         - use "port" base function on "endpoint" function ([3/9])
>         - tidyup [1/9] explanation
>
> v5 -> v6
>         - based on latest linus/master branch
>         - [9/9]: fixed compile warrning
>
> v4 -> v5
>         - tidyup comments
>         - [8/9]: parent NULL check was removed
>         - [9/9]: use for_each_of_graph_port()
>
> v3 -> v4
>         - new for_each loop includes __free()
>          - comment indicates to use return_ptr() or no_free_ptr() if
>            it need to continue to use node
>          - each driver based on it
>         - care "prev" leak on of_graph_get_next_ports()
>         - of_graph_get_next_port_endpoint() indicates WARN() if port
>           has non-endpoint node
>         - tidyup each git-log
>
> v2 -> v3
>         - return NULL if it it doesn't have ports / port
>         - add visible comment on of_graph_get_next_ports()
>
> v1 -> v2
>         - add each Reviewed-by / Acked-by
>         - tidyup/update Kernel Docs
>         - use prev as parameter
>         - update git-log explanation
>         - remove extra changes
>
> Kuninori Morimoto (9):
>   of: property: add of_graph_get_next_port()
>   of: property: add of_graph_get_next_port_endpoint()
>   of: property: use new of_graph functions
>   ASoC: test-component: use new of_graph functions
>   ASoC: audio-graph-card: use new of_graph functions
>   ASoC: audio-graph-card2: use new of_graph functions
>   gpu: drm: omapdrm: use new of_graph functions
>   fbdev: omapfb: use new of_graph functions
>   media: xilinx-tpg: use new of_graph functions
>
>  drivers/gpu/drm/omapdrm/dss/dpi.c             |   3 +-
>  drivers/gpu/drm/omapdrm/dss/sdi.c             |   3 +-
>  drivers/media/platform/xilinx/xilinx-tpg.c    |  14 +--
>  drivers/of/property.c                         |  99 ++++++++++++++---
>  drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   3 +-
>  drivers/video/fbdev/omap2/omapfb/dss/dss-of.c |  66 -----------
>  drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  20 ++--
>  drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   3 +-
>  include/linux/of_graph.h                      |  49 +++++++++
>  include/video/omapfb_dss.h                    |   8 --
>  sound/soc/generic/audio-graph-card.c          |   2 +-
>  sound/soc/generic/audio-graph-card2.c         | 104 ++++++++----------
>  sound/soc/generic/test-component.c            |   3 +-
>  13 files changed, 205 insertions(+), 172 deletions(-)

Applied, thanks.

Rob
