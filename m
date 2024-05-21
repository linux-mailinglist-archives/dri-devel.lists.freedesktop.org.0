Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB04E8CB190
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 17:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBD710EC93;
	Tue, 21 May 2024 15:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JuM6Mlq6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802B510EC93
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 15:42:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79F6B150E;
 Tue, 21 May 2024 17:42:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1716306123;
 bh=Wzp8U0x/I8sGmZ5v/VZqkhRsn4w7093y01qjtT5BQdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JuM6Mlq6qkbWUBlomT3fhYWQw85C4s/iyTLpdoHctqBE+5nX7ed3B7ex5fQaTH4JP
 Jil01J72OrOnEQQ04CD/Oh3TZ+6njSW2CUb0ELZHyladV5LGdOqrdovSGvJ/1Is/AI
 wzx5/eY0MIlhDJQ3SJJXwCG0gFrvC8TFkrz2vKTs=
Date: Tue, 21 May 2024 18:42:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alex Bee <knaerzche@gmail.com>
Cc: keith <keith.zhao@starfivetech.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, xingyu.wu@starfivetech.com,
 p.zabel@pengutronix.de, jack.zhu@starfivetech.com,
 shengyang.chen@starfivetech.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 02/10] drm/bridge: add common api for inno hdmi
Message-ID: <20240521154206.GA1935@pendragon.ideasonboard.com>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-3-keith.zhao@starfivetech.com>
 <58ddfc8f-1995-4f41-9d63-35a00c6f92b9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <58ddfc8f-1995-4f41-9d63-35a00c6f92b9@gmail.com>
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

On Tue, May 21, 2024 at 05:36:43PM +0200, Alex Bee wrote:
> Hi Keith,
> 
> thanks a lot for working on this. See some general remarks below
>
> Am 21.05.24 um 12:58 schrieb keith:
> > Add INNO common api so that it can be used by vendor
> > drivers which implement vendor specific extensions to Innosilicon HDMI.
> > 
> > Signed-off-by: keith <keith.zhao@starfivetech.com>
> > ---
> >   MAINTAINERS                                   |   2 +
> >   drivers/gpu/drm/bridge/Kconfig                |   2 +
> >   drivers/gpu/drm/bridge/Makefile               |   1 +
> >   drivers/gpu/drm/bridge/innosilicon/Kconfig    |   6 +
> >   drivers/gpu/drm/bridge/innosilicon/Makefile   |   2 +
> >   .../gpu/drm/bridge/innosilicon/inno-hdmi.c    | 587 ++++++++++++++++++
> >   .../gpu/drm/bridge/innosilicon/inno-hdmi.h    |  97 +++
> >   include/drm/bridge/inno_hdmi.h                |  69 ++
> >   8 files changed, 766 insertions(+)
> >   create mode 100644 drivers/gpu/drm/bridge/innosilicon/Kconfig
> >   create mode 100644 drivers/gpu/drm/bridge/innosilicon/Makefile
> >   create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c
> >   create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.h
> >   create mode 100644 include/drm/bridge/inno_hdmi.h
> > 
> ....
> 
> > +	drm_encoder_helper_add(encoder, pdata->helper_private);
> > +
> > +	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
> > +
> > +	drm_connector_helper_add(&hdmi->connector,
> > +				 &inno_hdmi_connector_helper_funcs);
> > +
> > +	drmm_connector_init(drm, &hdmi->connector,
> > +			    &inno_hdmi_connector_funcs,
> > +			    DRM_MODE_CONNECTOR_HDMIA,
> > +			    hdmi->ddc);
> > +
>
> I really don't want to anticipate bridge maintainer's feedback, but new
> bridge drivers must not contain connector creation. That must happen
> somewhere else.

You're absolutely right :-) Connector creation should be handled by the
drm_bridge_connector helper. The HDMI bridge driver should focus on the
HDMI bridge itself.

> Also I'm neither seeing any drm_brige struct nor drm_bridge_funcs, which
> are both essential for a bridge driver. I don't think moving a part of a
> driver to .../drm/bridge/ makes it a bridge driver.
> 
> > +	drm_connector_attach_encoder(&hdmi->connector, encoder);
> > +
> > +	return 0;
> > +}
> > +
> ....
> 

-- 
Regards,

Laurent Pinchart
