Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0459BCC0D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 12:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D5D10E013;
	Tue,  5 Nov 2024 11:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mX/Kqtzs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA86310E05B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 11:42:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 740B122E;
 Tue,  5 Nov 2024 12:42:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730806949;
 bh=soLQYbCpLZIaLFegrpwrQUNBdV9uOBFxjT17f4CUFPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mX/KqtzsUGkkvGouOFOgJwVM6iriVdICrtOToTY6ko1kjUmQrqc8Ch+7eqTps3bcP
 OIYbukYWrHB8MLT1i354Td7nyKWeQsvohWhldAirLVSQ/ybOLZKf5X4ekQtYMjCj3Z
 H6x9fzoK+OD0ttwdFghiqEryJB1fFAATsEm5gqdc=
Date: Tue, 5 Nov 2024 13:42:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Liu Ying <victor.liu@nxp.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v5 04/13] media: uapi: Add
 MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
Message-ID: <20241105114229.GO27775@pendragon.ideasonboard.com>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <20241104032806.611890-5-victor.liu@nxp.com>
 <ixckmdku6yriieo4ezzsepg5nflltzkvqbt7ylref4mu6a4t26@crooexpf3v57>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ixckmdku6yriieo4ezzsepg5nflltzkvqbt7ylref4mu6a4t26@crooexpf3v57>
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

On Mon, Nov 04, 2024 at 02:00:56PM +0200, Dmitry Baryshkov wrote:
> On Mon, Nov 04, 2024 at 11:27:57AM +0800, Liu Ying wrote:
> > Add two media bus formats that identify 30-bit RGB pixels transmitted
> > by a LVDS link with five differential data pairs, serialized into 7
> > time slots, using standard SPWG/VESA or JEIDA data mapping.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v5:
> > * No change.
> > 
> > v4:
> > * No change.
> > 
> > v3:
> > * New patch.
> > 
> >  .../media/v4l/subdev-formats.rst              | 156 +++++++++++++++++-
> >  include/uapi/linux/media-bus-format.h         |   4 +-
> >  2 files changed, 157 insertions(+), 3 deletions(-)
> 
> Laurent, Hans, can we please hear your opinion on this patch?
> 
> Ideally we'd like to merge it together with the rest of the series
> through drm-misc (or via an immutable tag/branch from your side).

I'm fine merging it through drm-misc, but creating an immutable branch
on the DRM side would be nice, just to make sure we can pull it in
linux-media in the unlikely case where we would have a conflicting patch
for the next kernel version.

> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index d2a6cd2e1eb2..2a94371448dc 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -2225,7 +2225,7 @@ The following table list existing packed 48bit wide RGB formats.
> >      \endgroup
> >  
> >  On LVDS buses, usually each sample is transferred serialized in seven
> > -time slots per pixel clock, on three (18-bit) or four (24-bit)
> > +time slots per pixel clock, on three (18-bit) or four (24-bit) or five (30-bit)

s/ or four/, four/

with that,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> >  differential data pairs at the same time. The remaining bits are used
> >  for control signals as defined by SPWG/PSWG/VESA or JEIDA standards. The
> >  24-bit RGB format serialized in seven time slots on four lanes using
> > @@ -2246,11 +2246,12 @@ JEIDA defined bit mapping will be named
> >        - Code
> >        -
> >        -
> > -      - :cspan:`3` Data organization
> > +      - :cspan:`4` Data organization
> >      * -
> >        -
> >        - Timeslot
> >        - Lane
> > +      - 4
> >        - 3
> >        - 2
> >        - 1
> > @@ -2262,6 +2263,7 @@ JEIDA defined bit mapping will be named
> >        - 0
> >        -
> >        -
> > +      -
> >        - d
> >        - b\ :sub:`1`
> >        - g\ :sub:`0`
> > @@ -2270,6 +2272,7 @@ JEIDA defined bit mapping will be named
> >        - 1
> >        -
> >        -
> > +      -
> >        - d
> >        - b\ :sub:`0`
> >        - r\ :sub:`5`
> > @@ -2278,6 +2281,7 @@ JEIDA defined bit mapping will be named
> >        - 2
> >        -
> >        -
> > +      -
> >        - d
> >        - g\ :sub:`5`
> >        - r\ :sub:`4`
> > @@ -2286,6 +2290,7 @@ JEIDA defined bit mapping will be named
> >        - 3
> >        -
> >        -
> > +      -
> >        - b\ :sub:`5`
> >        - g\ :sub:`4`
> >        - r\ :sub:`3`
> > @@ -2294,6 +2299,7 @@ JEIDA defined bit mapping will be named
> >        - 4
> >        -
> >        -
> > +      -
> >        - b\ :sub:`4`
> >        - g\ :sub:`3`
> >        - r\ :sub:`2`
> > @@ -2302,6 +2308,7 @@ JEIDA defined bit mapping will be named
> >        - 5
> >        -
> >        -
> > +      -
> >        - b\ :sub:`3`
> >        - g\ :sub:`2`
> >        - r\ :sub:`1`
> > @@ -2310,6 +2317,7 @@ JEIDA defined bit mapping will be named
> >        - 6
> >        -
> >        -
> > +      -
> >        - b\ :sub:`2`
> >        - g\ :sub:`1`
> >        - r\ :sub:`0`
> > @@ -2319,6 +2327,7 @@ JEIDA defined bit mapping will be named
> >        - 0x1011
> >        - 0
> >        -
> > +      -
> >        - d
> >        - d
> >        - b\ :sub:`1`
> > @@ -2327,6 +2336,7 @@ JEIDA defined bit mapping will be named
> >        -
> >        - 1
> >        -
> > +      -
> >        - b\ :sub:`7`
> >        - d
> >        - b\ :sub:`0`
> > @@ -2335,6 +2345,7 @@ JEIDA defined bit mapping will be named
> >        -
> >        - 2
> >        -
> > +      -
> >        - b\ :sub:`6`
> >        - d
> >        - g\ :sub:`5`
> > @@ -2343,6 +2354,7 @@ JEIDA defined bit mapping will be named
> >        -
> >        - 3
> >        -
> > +      -
> >        - g\ :sub:`7`
> >        - b\ :sub:`5`
> >        - g\ :sub:`4`
> > @@ -2351,6 +2363,7 @@ JEIDA defined bit mapping will be named
> >        -
> >        - 4
> >        -
> > +      -
> >        - g\ :sub:`6`
> >        - b\ :sub:`4`
> >        - g\ :sub:`3`
> > @@ -2359,6 +2372,7 @@ JEIDA defined bit mapping will be named
> >        -
> >        - 5
> >        -
> > +      -
> >        - r\ :sub:`7`
> >        - b\ :sub:`3`
> >        - g\ :sub:`2`
> > @@ -2367,6 +2381,7 @@ JEIDA defined bit mapping will be named
> >        -
> >        - 6
> >        -
> > +      -
> >        - r\ :sub:`6`
> >        - b\ :sub:`2`
> >        - g\ :sub:`1`
> > @@ -2377,6 +2392,7 @@ JEIDA defined bit mapping will be named
> >        - 0x1012
> >        - 0
> >        -
> > +      -
> >        - d
> >        - d
> >        - b\ :sub:`3`
> > @@ -2385,6 +2401,7 @@ JEIDA defined bit mapping will be named
> >        -
> >        - 1
> >        -
> > +      -
> >        - b\ :sub:`1`
> >        - d
> >        - b\ :sub:`2`
> > @@ -2393,6 +2410,7 @@ JEIDA defined bit mapping will be named
> >        -
> >        - 2
> >        -
> > +      -
> >        - b\ :sub:`0`
> >        - d
> >        - g\ :sub:`7`
> > @@ -2401,6 +2419,7 @@ JEIDA defined bit mapping will be named
> >        -
> >        - 3
> >        -
> > +      -
> >        - g\ :sub:`1`
> >        - b\ :sub:`7`
> >        - g\ :sub:`6`
> > @@ -2409,6 +2428,7 @@ JEIDA defined bit mapping will be named
> >        -
> >        - 4
> >        -
> > +      -
> >        - g\ :sub:`0`
> >        - b\ :sub:`6`
> >        - g\ :sub:`5`
> > @@ -2417,6 +2437,7 @@ JEIDA defined bit mapping will be named
> >        -
> >        - 5
> >        -
> > +      -
> >        - r\ :sub:`1`
> >        - b\ :sub:`5`
> >        - g\ :sub:`4`
> > @@ -2425,10 +2446,141 @@ JEIDA defined bit mapping will be named
> >        -
> >        - 6
> >        -
> > +      -
> > +      - r\ :sub:`0`
> > +      - b\ :sub:`4`
> > +      - g\ :sub:`3`
> > +      - r\ :sub:`2`
> > +    * .. _MEDIA-BUS-FMT-RGB101010-1X7X5-SPWG:
> > +
> > +      - MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG
> > +      - 0x1026
> > +      - 0
> > +      -
> > +      - d
> > +      - d
> > +      - d
> > +      - b\ :sub:`1`
> > +      - g\ :sub:`0`
> > +    * -
> > +      -
> > +      - 1
> > +      -
> > +      - b\ :sub:`9`
> > +      - b\ :sub:`7`
> > +      - d
> > +      - b\ :sub:`0`
> > +      - r\ :sub:`5`
> > +    * -
> > +      -
> > +      - 2
> > +      -
> > +      - b\ :sub:`8`
> > +      - b\ :sub:`6`
> > +      - d
> > +      - g\ :sub:`5`
> > +      - r\ :sub:`4`
> > +    * -
> > +      -
> > +      - 3
> > +      -
> > +      - g\ :sub:`9`
> > +      - g\ :sub:`7`
> > +      - b\ :sub:`5`
> > +      - g\ :sub:`4`
> > +      - r\ :sub:`3`
> > +    * -
> > +      -
> > +      - 4
> > +      -
> > +      - g\ :sub:`8`
> > +      - g\ :sub:`6`
> > +      - b\ :sub:`4`
> > +      - g\ :sub:`3`
> > +      - r\ :sub:`2`
> > +    * -
> > +      -
> > +      - 5
> > +      -
> > +      - r\ :sub:`9`
> > +      - r\ :sub:`7`
> > +      - b\ :sub:`3`
> > +      - g\ :sub:`2`
> > +      - r\ :sub:`1`
> > +    * -
> > +      -
> > +      - 6
> > +      -
> > +      - r\ :sub:`8`
> > +      - r\ :sub:`6`
> > +      - b\ :sub:`2`
> > +      - g\ :sub:`1`
> >        - r\ :sub:`0`
> > +    * .. _MEDIA-BUS-FMT-RGB101010-1X7X5-JEIDA:
> > +
> > +      - MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA
> > +      - 0x1027
> > +      - 0
> > +      -
> > +      - d
> > +      - d
> > +      - d
> > +      - b\ :sub:`5`
> > +      - g\ :sub:`4`
> > +    * -
> > +      -
> > +      - 1
> > +      -
> > +      - b\ :sub:`1`
> > +      - b\ :sub:`3`
> > +      - d
> >        - b\ :sub:`4`
> > +      - r\ :sub:`9`
> > +    * -
> > +      -
> > +      - 2
> > +      -
> > +      - b\ :sub:`0`
> > +      - b\ :sub:`2`
> > +      - d
> > +      - g\ :sub:`9`
> > +      - r\ :sub:`8`
> > +    * -
> > +      -
> > +      - 3
> > +      -
> > +      - g\ :sub:`1`
> >        - g\ :sub:`3`
> > +      - b\ :sub:`9`
> > +      - g\ :sub:`8`
> > +      - r\ :sub:`7`
> > +    * -
> > +      -
> > +      - 4
> > +      -
> > +      - g\ :sub:`0`
> > +      - g\ :sub:`2`
> > +      - b\ :sub:`8`
> > +      - g\ :sub:`7`
> > +      - r\ :sub:`6`
> > +    * -
> > +      -
> > +      - 5
> > +      -
> > +      - r\ :sub:`1`
> > +      - r\ :sub:`3`
> > +      - b\ :sub:`7`
> > +      - g\ :sub:`6`
> > +      - r\ :sub:`5`
> > +    * -
> > +      -
> > +      - 6
> > +      -
> > +      - r\ :sub:`0`
> >        - r\ :sub:`2`
> > +      - b\ :sub:`6`
> > +      - g\ :sub:`5`
> > +      - r\ :sub:`4`
> >  
> >  .. raw:: latex
> >  
> > diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> > index d4c1d991014b..ff62056feed5 100644
> > --- a/include/uapi/linux/media-bus-format.h
> > +++ b/include/uapi/linux/media-bus-format.h
> > @@ -34,7 +34,7 @@
> >  
> >  #define MEDIA_BUS_FMT_FIXED			0x0001
> >  
> > -/* RGB - next is	0x1026 */
> > +/* RGB - next is	0x1028 */
> >  #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
> >  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
> >  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
> > @@ -68,6 +68,8 @@
> >  #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
> >  #define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
> >  #define MEDIA_BUS_FMT_RGB101010_1X30		0x1018
> > +#define MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG	0x1026
> > +#define MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA	0x1027
> >  #define MEDIA_BUS_FMT_RGB666_1X36_CPADLO	0x1020
> >  #define MEDIA_BUS_FMT_RGB888_1X36_CPADLO	0x1021
> >  #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019

-- 
Regards,

Laurent Pinchart
