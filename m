Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9906E9D3792
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 10:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940AC10E177;
	Wed, 20 Nov 2024 09:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b="LyIVzIBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBC110E177
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 09:53:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43152b79d25so44995825e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 01:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1732096423; x=1732701223;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oJLDnW4xgZ8CURNC2nEQvItuWPLm2zclX2H1mWV132I=;
 b=LyIVzIBAWhmDDkb/FlEilzzLe2h6Eb3tO3dcVOZ4ceso2INLnPFUmFlUS313Lcgq+8
 sspvTi3jKDYoL9yyXx6Pf82Ay4KYA7pDvbFBEe1Um17kytLIRFoHnJ62zi9480AtPFIN
 RC1GiMuPzWysLIwc8yTfHEOeP84VcTG3KL3w91lMIIgAnAWcNcwX8/riCLSajuUT974G
 TSfqtfFZFKE0yvIG7Mt+GQ8RuyZt83b/f+2PWNvtL6BsFnZSY3sFdwf141Lfp8sXdAFn
 DCE65Cjslt9KUdNOAczcRnxMW+UNegYK+qtLFc3oRx7YH094NKgGAincE+RDELNf92TC
 uX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732096423; x=1732701223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oJLDnW4xgZ8CURNC2nEQvItuWPLm2zclX2H1mWV132I=;
 b=kUtLCHMuV/ZmcdPRL/df8UwcoKMnuuJFMrKtfPrW7THVg/sOtnf7iHWRGGlXqpdkkj
 UEWEYUdd9ro0bWj7RfAc/HLhmkIkwp+mGyDJIg9D43yNMa5eLo8oRAsSRuaAUjXM2+lM
 vhDaZWmZmRGhooeza2LTa0jTWqRd6w93H8ThoPInhLEnD0upwDN3Aj+BziTnuoYNpww+
 351JZimTUwDmzQel0KAvluqhsUGseAzNOUEYkOP0/nTJyfmjWM41tNH/V+5m69/s0yao
 p1TvHjagvi14OceoBvo9DpawrQCi8tgaaSX9ulgiGoKAbjhByV1M/CEiKtFQ0usg/OcK
 3uDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx3gggL8M0xeE9Td66fS4G1nRtsACPcEpxDvAgghX25pDoz7CQUW1uyMNSY3qTobK4xoaX+YtC3lM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvawwShL8psJ19WRboUgSLLVUPa9pYDjSY0wqyXbld+vSz7euT
 iqbJa/T0qwqpoMbvOXg7lU/F+oCDPO07VW6drZuMzGg3FafyVo6H82LeE9jGJBOGygaqsU/w0AX
 Rr74=
X-Google-Smtp-Source: AGHT+IFGYjEIekWosK3N1x9ZAj53wDHPjVwwCvrEQHprGAlHK6CAfM14PoWKCxOAsPnnpRIJDBdzbg==
X-Received: by 2002:a05:600c:1d83:b0:431:5bf2:2d4 with SMTP id
 5b1f17b1804b1-4334f02c7c6mr16575515e9.29.1732096422784; 
 Wed, 20 Nov 2024 01:53:42 -0800 (PST)
Received: from fedora.. ([91.90.172.13]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b45d4288sm13108335e9.23.2024.11.20.01.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 01:53:42 -0800 (PST)
From: Daniel Semkowicz <dse@thaumatec.com>
To: heiko@sntech.de
Cc: Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quentin.schulz@cherry.de, rfoss@kernel.org,
 robh@kernel.org, tzimmermann@suse.de, Daniel Semkowicz <dse@thaumatec.com>
Subject: Re: [PATCH 0/3] drm/rockchip: Add driver for the new DSI2 controller
Date: Wed, 20 Nov 2024 10:52:58 +0100
Message-ID: <20241120095326.9854-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106123304.422854-1-heiko@sntech.de>
References: <20241106123304.422854-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello Heiko,

> This series adds a bridge and glue driver for the DSI2 controller found
> in the rk3588 soc from Rockchip, that is based on a Synopsis IP block.
> 
> As the manual states:
> The Display Serial Interface 2 (DSI-2) is part of a group of communication
> protocols defined by the MIPI Alliance. The MIPI DSI-2 Host Controller is
> a digital core that implements all protocol functions defined in the
> MIPI DSI-2 Specification.
> 
> 
> While the driver structure is very similar to the previous DSI controller,
> the programming model of the core is quite different, with a completely
> new register set.
> 
> Another notable difference is that the phy interface is variable now too
> in its width and some other settings.
> 
> 
> Heiko Stuebner (3):
>   drm/bridge/synopsys: Add MIPI DSI2 host controller bridge
>   dt-bindings: display: rockchip: Add schema for RK3588 DW DSI2
>     controller
>   drm/rockchip: Add MIPI DSI2 glue driver for RK3588
> 
>  .../rockchip/rockchip,rk3588-mipi-dsi2.yaml   |  119 ++
>  drivers/gpu/drm/bridge/synopsys/Kconfig       |    6 +
>  drivers/gpu/drm/bridge/synopsys/Makefile      |    1 +
>  .../gpu/drm/bridge/synopsys/dw-mipi-dsi2.c    | 1034 +++++++++++++++++
>  drivers/gpu/drm/rockchip/Kconfig              |   10 +
>  drivers/gpu/drm/rockchip/Makefile             |    1 +
>  .../gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c  |  524 +++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    2 +
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |    1 +
>  include/drm/bridge/dw_mipi_dsi2.h             |   94 ++
>  10 files changed, 1792 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
>  create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
>  create mode 100644 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
>  create mode 100644 include/drm/bridge/dw_mipi_dsi2.h
> 
> -- 
> 2.45.2

Thank you for this work!

Sucessfuly tested this series with DSI/LVDS bridge.

Test configuration was described in the thread "[PATCH v3 0/2] MIPI DSI
phy for rk3588":
https://lore.kernel.org/all/20241120093702.9018-1-dse@thaumatec.com/

Tested-by: Daniel Semkowicz <dse@thaumatec.com>

Kind regards
Daniel

