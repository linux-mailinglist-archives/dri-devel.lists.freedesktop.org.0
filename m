Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7897C340CAC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 19:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1186E953;
	Thu, 18 Mar 2021 18:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs2.siol.net [185.57.226.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2E86E953
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 18:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 199C05247A2;
 Thu, 18 Mar 2021 19:16:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id mwt1eS0ZtrPn; Thu, 18 Mar 2021 19:16:35 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id ADAA2524723;
 Thu, 18 Mar 2021 19:16:35 +0100 (CET)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net
 [86.58.17.133]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 3033D524863;
 Thu, 18 Mar 2021 19:16:34 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 00/18] drm/vc4: hdmi: Add Support for the YUV output
Date: Thu, 18 Mar 2021 19:16:33 +0100
Message-ID: <4209616.oJxVDHRhuA@kista>
In-Reply-To: <20210317154352.732095-1-maxime@cerno.tech>
References: <20210317154352.732095-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Dne sreda, 17. marec 2021 ob 16:43:34 CET je Maxime Ripard napisal(a):
> Hi,
> 
> Here's an attempt at support the HDMI YUV output on the BCM2711 SoC found on
> the RaspberryPi4.
> 
> I took the same approach than what dw-hdmi did already, turning a bunch of
> functions found in that driver into helpers since they were fairly generic.
> 
> However, it feels a bit clunky overall and there's a few rough edges that
> should be addressed in a generic manner:
> 
>   - while the format negociation makes sense for a bridge, it feels a bit
>     over-engineered for a simple encoder where that setting could be a 
simple
>     switch (and possibly a property?)

Property could work, but possible values should be then limited to cross 
section of HW and connected display capabilities.

> 
>   - more importantly, whether we're choosing an YUV output or not is 
completely
>     hidden away from the userspace even though it might have some effect on 
the
>     visual quality output (thinking about YUV420 and YUV422 here mostly).

IMO driver should select highest achievable quality. So in case of YUV420 and 
YUV422, later should be selected. This should be the case even if the property 
is implemented.

Best regards,
Jernej

> 
>   - Similarly, the list we report is static and the userspace cannot change 
or
>     force one mode over the other. We will always pick YUV444 over RGB444 if
>     both are available for example.
> 
> While the first one might just be due to a lack of helpers, the second and
> third ones are also feeling a bit inconsistent with how we're handling the
> 10/12 bit output for example
> 
> Let me know what you think,
> Maxime
> 
> Maxime Ripard (18):
>   drm: Introduce new HDMI helpers
>   drm/bridge: Add HDMI output fmt helper
>   drm/bridge: dw-hdmi: Use helpers
>   drm/vc4: txp: Properly set the possible_crtcs mask
>   drm/vc4: crtc: Skip the TXP
>   drm/vc4: Rework the encoder retrieval code
>   drm/vc4: hdmi: Add full range RGB helper
>   drm/vc4: hdmi: Use full range helper in csc functions
>   drm/vc4: hdmi: Remove limited_rgb_range
>   drm/vc4: hdmi: Convert to bridge
>   drm/vc4: hdmi: Move XBAR setup to csc_setup
>   drm/vc4: hdmi: Replace CSC_CTL hardcoded value by defines
>   drm/vc4: hdmi: Define colorspace matrices
>   drm/vc4: hdmi: Change CSC callback prototype
>   drm/vc4: hdmi: Rework the infoframe prototype
>   drm/vc4: hdmi: Support HDMI YUV output
>   drm/vc4: hdmi: Move the pixel rate calculation to a helper
>   drm/vc4: hdmi: Force YUV422 if the rate is too high
> 
>  drivers/gpu/drm/Makefile                  |   2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 268 ++-------------
>  drivers/gpu/drm/drm_bridge.c              | 118 +++++++
>  drivers/gpu/drm/drm_hdmi.c                | 170 +++++++++
>  drivers/gpu/drm/vc4/vc4_crtc.c            |  59 +++-
>  drivers/gpu/drm/vc4/vc4_drv.c             |  41 +++
>  drivers/gpu/drm/vc4/vc4_drv.h             |  26 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c            | 399 +++++++++++++++-------
>  drivers/gpu/drm/vc4/vc4_hdmi.h            |  13 +-
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h       |   6 +
>  drivers/gpu/drm/vc4/vc4_regs.h            |  19 ++
>  drivers/gpu/drm/vc4/vc4_txp.c             |   2 +-
>  include/drm/drm_bridge.h                  |   6 +
>  include/drm/drm_hdmi.h                    |  24 ++
>  14 files changed, 770 insertions(+), 383 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_hdmi.c
>  create mode 100644 include/drm/drm_hdmi.h
> 
> -- 
> 2.30.2
> 
> 


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
