Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D2D984223
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 11:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE73B10E688;
	Tue, 24 Sep 2024 09:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QjZU8boB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C8210E688
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 09:31:06 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53654e2ed93so6073975e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 02:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727170264; x=1727775064; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yWBIbFHZNiPI/HNmpMhvRGObId3eaCn9wFIzXYkz7to=;
 b=QjZU8boBcS+WrbMCQNl35NXSSMX6edH+8eovS78CrXL18BDJoYfuaKreXUoGLBCUn4
 Rfy3LYZLFM0Uydrv2HYxRNG5ZOICYjk9/ptABLPZMBE9ZOv6PJnhAggymd3lxJK6nKcv
 o49lXX9wH1yudwIHNMB2Ca8o8Nm56jab0fxitVs4K3ZOFp6eF34EBzsUc+DpUD02KSpC
 4zWdcOdD3PhZjF6rB/85VqCvEjl6Ip7CxuqckykuZ+AO6YBFc9SUNLRingS0B1ZFfF+r
 UAIUsYJs/9QTlB7MLzq8NDcl+fbqTkMAGp0Y88NhTeVnzPYfyatTu6soqdJh2ZhwxPH6
 J06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727170264; x=1727775064;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yWBIbFHZNiPI/HNmpMhvRGObId3eaCn9wFIzXYkz7to=;
 b=gwuQn2COTvxH7gw3kcE23gXrTNspOj8k6J3UNbGxPQJPsFnZKN5ZykCBwHGnxyEERR
 DpnhmeqQPz3rqg64QulglkhBgD5lRfXqlFGIxR39UPAqIkrTmsVtEIW6C3JIwWNCCtqI
 LktPTjjaTL8iwpFdcLhSb0cWHjZxwSFOBlhtOEgEwb90SKLR51A/U7mRVkj8MR+ZKFLF
 jpRsrZ6NhxxewcSjV5XNWJjH4NXlSwbh7yP3Of31fGCff+QV8H8ozlLDyKcsY78hSBUp
 nMgqdml2u8Gp3hLy4nETsqlEq5zbLyN8QDoYttSV9fWW0G9MIlIIXIOEh0s/TuqTBimk
 SSDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+hrdraC9H7EcBW5WpsiLTsaxyzxYhaPEs45bQg7zieRW+ak8oXW6XZckanOwBSwpsS4drBl1Prg4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyfle6UGjYdwr32QvbQfpGd9wrCC9JXWgJelX9fkktjCmMkJSYU
 iY3gUGYqC/Zy8tcKiMwvymjevz8u5vTYPz9bZTooYOwpTqAb6jzAePZzmSHhq1c=
X-Google-Smtp-Source: AGHT+IHl/avwAYPIhb6TlrUBum/ZYPGtpNgmakP+vyGoMgDMX9PZ7T3T0XlPukXCsWcNZg9FyHE4qw==
X-Received: by 2002:a05:6512:220f:b0:530:aa4b:81c7 with SMTP id
 2adb3069b0e04-536ad3d5526mr6590279e87.59.1727170264125; 
 Tue, 24 Sep 2024 02:31:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a864029dsm150753e87.120.2024.09.24.02.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 02:31:03 -0700 (PDT)
Date: Tue, 24 Sep 2024 12:31:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, mripard@kernel.org,
 Sandor Yu <Sandor.yu@nxp.com>, kernel@pengutronix.de, linux-imx@nxp.com,
 oliver.brown@nxp.com, sam@ravnborg.org
Subject: Re: [PATCH v17 1/8] drm: bridge: Cadence: Create mhdp helper driver
Message-ID: <vlqcv7pdhyf6rjmkm2ccyvg3fv64gcp536zppns6nc3xpzuew6@j3qrwextsp33>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
 <6e2e4951aa4c69eed68af231c2b0b2ce302b2358.1727159906.git.Sandor.yu@nxp.com>
 <2773403.mvXUDI8C0e@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2773403.mvXUDI8C0e@steina-w>
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

On Tue, Sep 24, 2024 at 10:41:26AM GMT, Alexander Stein wrote:
> Hi Sandor,
> 
> Am Dienstag, 24. September 2024, 09:36:46 CEST schrieb Sandor Yu:
> > MHDP8546 mailbox access functions will be share to other mhdp driver
> > and Cadence HDP-TX HDMI/DP PHY drivers.
> > Create a new mhdp helper driver and move all those functions into.
> > 
> > cdns_mhdp_reg_write() is renamed to cdns_mhdp_dp_reg_write(),
> > because it use the DPTX command ID DPTX_WRITE_REGISTER.
> > 
> > New cdns_mhdp_reg_write() is created with the general command ID
> > GENERAL_REGISTER_WRITE.
> > 
> > Rewrite cdns_mhdp_set_firmware_active() in mhdp8546 core driver,
> > use cdns_mhdp_mailbox_send() to replace cdns_mhdp_mailbox_write()
> > same as the other mailbox access functions.
> > 
> > Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mutex
> > to prevent race conditions in mailbox access by multi drivers.
> > 
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> > v16->v17:
> > - Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mutex
> > 
> > v12->v16:
> >  *No change.
> > 
> > V11->v12:
> > - Move status initialize out of mbox_mutex.
> > - Reorder API functions in alphabetical.
> > - Add notes for malibox access functions.
> > - Add year 2024 to copyright.
> > 
> >  drivers/gpu/drm/bridge/cadence/Kconfig        |   4 +
> >  drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
> >  .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c | 307 +++++++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 425 ++++--------------
> >  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  47 +-
> >  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |  36 +-
> >  include/drm/bridge/cdns-mhdp-helper.h         |  94 ++++
> >  7 files changed, 507 insertions(+), 407 deletions(-)
> >  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> >  create mode 100644 include/drm/bridge/cdns-mhdp-helper.h
> > 
> > diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
> > index cced81633ddcd..e0973339e9e33 100644
> > --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> > +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> > @@ -21,6 +21,9 @@ config DRM_CDNS_DSI_J721E
> >  	  the routing of the DSS DPI signal to the Cadence DSI.
> >  endif
> >  
> > +config CDNS_MHDP_HELPER
> > +	tristate
> > +
> >  config DRM_CDNS_MHDP8546
> >  	tristate "Cadence DPI/DP bridge"
> >  	select DRM_DISPLAY_DP_HELPER
> > @@ -28,6 +31,7 @@ config DRM_CDNS_MHDP8546
> >  	select DRM_DISPLAY_HELPER
> >  	select DRM_KMS_HELPER
> >  	select DRM_PANEL_BRIDGE
> > +	select CDNS_MHDP_HELPER
> >  	depends on OF
> >  	help
> >  	  Support Cadence DPI to DP bridge. This is an internal
> > diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
> > index c95fd5b81d137..087dc074820d7 100644
> > --- a/drivers/gpu/drm/bridge/cadence/Makefile
> > +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> > @@ -2,6 +2,7 @@
> >  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> >  cdns-dsi-y := cdns-dsi-core.o
> >  cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) += cdns-dsi-j721e.o
> > +obj-$(CONFIG_CDNS_MHDP_HELPER) += cdns-mhdp-helper.o
> >  obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
> >  cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
> >  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> > new file mode 100644
> > index 0000000000000..c60a6b69a5343
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> > @@ -0,0 +1,307 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2023, 2024 NXP Semiconductor, Inc.
> > + *
> > + */
> > +#include <drm/bridge/cdns-mhdp-helper.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/module.h>
> > +
> > +/* Protects mailbox communications with the firmware */
> > +DEFINE_MUTEX(mhdp_mailbox_mutex);
> 
> This is not enough if the driver is built as a module:
> 
> > ERROR: modpost: "mhdp_mailbox_mutex"
> > [drivers/gpu/drm/bridge/cadence/cdns-mhdp8546.ko] undefined! ERROR:
> > modpost: "mhdp_mailbox_mutex"
> > [drivers/gpu/drm/bridge/cadence/cdns-mhdp8501.ko] undefined!
> 
> Not sure if EXPORT_SYMBOL_GPL() on a mutex is considered good style.

Absolutely no. The API should wrap register access, using the mutex
whether required, rather than exporting the mutex for everybody else to
use.

> 
> Best regards,
> Alexander
> 
> > [snip]
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
> 
> 

-- 
With best wishes
Dmitry
