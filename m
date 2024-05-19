Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DB28C96D4
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 23:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7035E10E134;
	Sun, 19 May 2024 21:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NXQFkVsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C3810E134
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 21:32:29 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52388d9ca98so4343262e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 14:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716154347; x=1716759147; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h6cTx436C2E2REDvf6u5AyhHBqM6Jqy3yrhu4B1JLO8=;
 b=NXQFkVsuJqSi5PEKWu4spNVXzluTBOtiQxPLKdo0nYIybVkAv0cITbkHt37k/i0POx
 7Ixjuyr2eQxf+X6P4ueGGVQXTONmezp35L75V5Md6yRUgMMFAK489KzHIK8orSLsPOyw
 snYEakCkv6mc4J9DRguQWo83EOsnh7jJpFdfVvDLAK5GicVeze3igIqRzwM96hFnF0Y4
 rLmK9TF1xk6dkxMP7soCgH/QFtHc1df+qTEznnv6gKW1Xv9YBgjdE+SAs7xB73RSRXD0
 kHY0gNR7rewA6ibh0ItO6RejIxAFYWbPml7z7+1Ol0FF/rpA0NaUd4yFbsdrCb3JJkGu
 Ey5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716154347; x=1716759147;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h6cTx436C2E2REDvf6u5AyhHBqM6Jqy3yrhu4B1JLO8=;
 b=QDup8smdxcR+5il7k74EmFPc/o2JLUwdY99KyCX3nGPgN7AlngUKrtyEN6iKSr+lnC
 vbMHgoCh/5JJyPQsTQdg247dUO/1dfaG8lZmgLS7sZsYJdNNlhIKxMbDN0ICQ7aUg3Sf
 +CPdQB1Ft+NZClX1iTy3P/Il+FH7c5d6WWuFYIJckw2x0ZBBq96kCYD2Y80JIA9+HHvZ
 u9HKc3ZAK4ioUdEUkZ3ijxvGgL2ez/PbJhMxPpLFUNNwBVNnxm190H9So9w+wMjvHMgY
 j4M8+KyGwyY5vL+xY1gNX1aDiMW+4EulL2CxY3VCWXCe0U5gK6/0tAx3TTWOEaL1ZNK/
 LcJA==
X-Gm-Message-State: AOJu0Yxv3xJwLIURv0jLYN3Xxq9fUHpfmTZceBgxZFH3gOF3cK+fBd1F
 A3l+RRromU/Up7vXC0o57fe9cM4y8YuAcfUWwUNtWEmhJLFCI4k8KNvWnC5jego=
X-Google-Smtp-Source: AGHT+IEl+AfDHe6jeNP0rGffE1Nx7ElWbrCEEEd1P7JHtOpvhpylZMlidRdoJmy4duY/0psAGP4rnA==
X-Received: by 2002:a05:6512:61:b0:51c:5570:f570 with SMTP id
 2adb3069b0e04-52210473d4fmr20587823e87.59.1716154347097; 
 Sun, 19 May 2024 14:32:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52434ae5899sm325373e87.119.2024.05.19.14.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 14:32:26 -0700 (PDT)
Date: Mon, 20 May 2024 00:32:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>, 
 Adam Ford <aford173@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
Subject: Re: [PATCH v2] drm/bridge: tc358767: Enable FRMSYNC timing generator
Message-ID: <b72ecjfxdvmfvbgykeojvvb6quylxrrj7qupiqekq4jothaf5z@4ouvmmr6ofzu>
References: <20240514004759.230431-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240514004759.230431-1-marex@denx.de>
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

On Tue, May 14, 2024 at 02:47:24AM +0200, Marek Vasut wrote:
> TC9595 datasheet Video Path0 Control (VPCTRL0) Register bit FRMSYNC description
> says "This bit should be disabled only in video mode transmission where Host
> transmits video timing together with video data and where pixel clock source
> is from DSI clock." . This driver always sources pixel clock from external xtal,
> therefore the FRMSYNC bit must always be enabled, enable it.
> 
> This fixes an actual issue with DSI-to-DPI mode, where the display would
> randomly show subtle pixel flickering, or wobble, or shimmering. This is
> visible on solid gray color, but the degree of the shimmering differs
> between boots, which makes it hard to debug.
> 
> There is a caveat to the FRMSYNC and this bridge pixel PLL, which can only
> generate pixel clock with limited accuracy, it may therefore be necessary
> to reduce the HFP to fit into line length of input pixel data, to avoid any
> possible overflows, which make the output video look striped horizontally.
> 
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: kernel@dh-electronics.com
> ---
> V2: - Use plain DIV_ROUND_UP() instead of custom local one
>     - Add RB from Robert
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
