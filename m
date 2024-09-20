Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 625C697D654
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 15:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60AF10E0E3;
	Fri, 20 Sep 2024 13:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kYEq2aok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA5010E0E3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 13:41:34 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-535be093a43so2708493e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 06:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726839692; x=1727444492; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cy8eJSiB/nOK0MNLeFOudgQDV58ne9sCKlAuyt+d5bs=;
 b=kYEq2aokjjt6RFMzfEh84AZHO8clACtiAwS0HymSOSjLQsFKZ9sFNOdchjBEua7M+y
 C6sYv8JOjeJ2VyhRq+rqgor3NrtRP/RU9L7HFLJpNJd1J4qLZmO5S27yTCAgdPtlAmMq
 R+/x0tVBcPWjjx/PN4ZlIadv8SteSoaWsbzXLlL5MCo6w+bjJWKbtoXZcu1/ZCqg3tF/
 tnMx2pnoMOr8xJ/kNGCg2U1Pxzp0+79is2vQZ8AmWQrJfxx9SqQ9Gsha2LMm2lWxQXDk
 603TBgSKrp47QCfvo5bSFYhG9DWozU13oNuPKRmwWsYPbjRLUc1cYLah3f09CZEJ/fQF
 kPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726839692; x=1727444492;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cy8eJSiB/nOK0MNLeFOudgQDV58ne9sCKlAuyt+d5bs=;
 b=EbHBGn71RtbFmeWMuOMmsB/C+D2p9WAH4ctoOqEvuOvyr5/9rnp1dvBTmW0oTNN12K
 yMFfs5y8Y4szdewBs6I7I5yKq7pfj20UImDYDgXBLamjD30jI1jYVTr/pok22rE625Pm
 4cLvKHxzY21BXhM2GjUkTC6bBDZRuUPa07Md7CjPYhHUj/7HTpDgkRa5Kbq24LTMrPjq
 lagtaE8xcOa9eGDyUY6R0XeTs3fJf8Xc2oPkWV3TEOj2+sgwyiRqEYMwJAqCyhNnr6Zq
 jjFcrkrYObkpe9tHLKLqv0ONjB0JvCsXBusGhPkwWE+ok+YjGoXaMDGxH0Jj9P21N2qI
 sMXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHZUtxrg+5tQavW3+Z3ziDOsZY9cK9CqZlt8/k2yXYeG8TTAGsuznF3IozcKQt77sQkKxkkr7GBMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA3c9pPZMSUf/tneRV/LJSNSynYfBa4opc2gum4XyOAxg3J8Uh
 0EMFeGhEKrVWhXPB3tKQpvnbugJGD/pYS/0VvaghlmxTQDYSIefwmS3RyDJXrHQ=
X-Google-Smtp-Source: AGHT+IE3spKxFlKow+XZEn/pdnVcnC7xAb2KymB9nWls7Ajtm+SQAP7jVkeioCLRLwIL4VXLIlrZbQ==
X-Received: by 2002:a05:6512:3192:b0:52e:7656:a0f4 with SMTP id
 2adb3069b0e04-536ac32012emr1856875e87.41.1726839692396; 
 Fri, 20 Sep 2024 06:41:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704dbc8sm2166041e87.101.2024.09.20.06.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 06:41:31 -0700 (PDT)
Date: Fri, 20 Sep 2024 16:41:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, devicetree@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Guenter Roeck <groeck@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, 
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, 
 linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 01/18] drm/atomic-helper: Introduce lane remapping
 support to bridges
Message-ID: <vbb7uo3xszign2mjkciclrsbajf53btfguwhixueohqpvfiouu@mmk4qdskqjoa>
References: <20240901040658.157425-1-swboyd@chromium.org>
 <20240901040658.157425-2-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240901040658.157425-2-swboyd@chromium.org>
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

On Sat, Aug 31, 2024 at 09:06:39PM GMT, Stephen Boyd wrote:
> Add support to the DRM atomic logic to support lane remapping between
> bridges, encoders and connectors. Typically lane mapping is handled
> statically in firmware, e.g. on DT we use the data-lanes property to
> assign lanes when connecting display bridges. Lane assignment is dynamic
> with USB-C DisplayPort altmodes, e.g. pin conf D assigns 2 lanes of DP
> to pins on the USB-C connector while pin conf C assigns 4 lanes of DP to
> pins on the USB-C connector. The lane assignment can't be set statically
> because the DP altmode repurposes USB-C pins for the DP lanes while also
> limiting the number of DP lanes or their pin assignment at runtime.
> 
> Bridge drivers should point their 'struct drm_bus_cfg::lanes' pointer to
> an allocated array of 'struct drm_lane_cfg' structures and indicate the
> size of this allocated array with 'struct drm_bus_cfg::num_lanes' in
> their atomic_check() callback. The previous bridge in the bridge chain
> can look at this information by calling
> drm_bridge_next_bridge_lane_cfg() in their atomic_check() callback to
> figure out what lanes need to be logically assigned to the physical
> output lanes to satisfy the next bridge's lane assignment.
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: <dri-devel@lists.freedesktop.org>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  2 ++
>  drivers/gpu/drm/drm_bridge.c              | 34 +++++++++++++++++++++++
>  include/drm/drm_atomic.h                  | 31 +++++++++++++++++++++
>  include/drm/drm_bridge.h                  |  4 +++
>  4 files changed, 71 insertions(+)

I have given this a lot of thought in the last several days, thanks for
the interesting problem.

Basically, as I said during LPC, I feel that this is an overkill to be
handled in the drm_bridge layer. In most other usecases the lane
configuration is static and doesn't change. MIPI DSI standard, for
example, explicitly disallows that: "The number of Lanes used shall be a
static parameter.  It shall be fixed at the time of system design or
initial configuration and may not change dynamically." (MIPI DSI 1.3,
section 6.1).

Following the struct drm_connector_hdmi introduction I think we are
getting closer and closer to the struct drm_connector_dp, which should
record all DP-related data to be used by DisplayPort connectors. An
example of a field in this struct-to-be might be `u8 num_lanes`. In the
normal DP / uDP cases it will be static, in case of USB-C AltMode it
will be dynamic and change depending on pinconf being configured.

-- 
With best wishes
Dmitry
