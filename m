Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA6296B6D1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CA910E717;
	Wed,  4 Sep 2024 09:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fjiksoh/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8291110E716
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 09:36:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DCC2DA433BD;
 Wed,  4 Sep 2024 09:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45089C4CEC2;
 Wed,  4 Sep 2024 09:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725442566;
 bh=LxkNSYAofDOvfm/1x55QP/ob58WB2jeme7PmvxzQTxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fjiksoh/7cDs5GAQtGkF7NbvnZvYCQXencrq4xsA3j8WLlB5ZuhafJ9Vxjm3ZDbwH
 GUh0CvwTi2GHEpHVM44sRvCEWC8sT0VAKXN7l89dwztEdpArFDCkp2KCHsS0vTHPPC
 r8l3OrP+06WDLdb0jQSBqTOD7W64qAA4kqkYkjE9vYnrYowoV7xu79/GHYQnmyywC4
 XW3WHlGlZFOWro4shc+uMwsp5VeFQTizl6UasNkYoMWfRuDxWFL26r2MHgOvsfLEx1
 8dKjtp7Va87ug3+24UIMvgmCZXw3juGcUHKjHsfADBFfQ9L70JyVtTPGydZclGRGzn
 +ZZ0F9aF6JDIw==
Date: Wed, 4 Sep 2024 09:35:59 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, devicetree@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 16/18] platform/chrome: cros_ec_typec: Add support for
 signaling DP HPD via drm_bridge
Message-ID: <Ztgp_8UxEgBCiEMz@google.com>
References: <20240901040658.157425-1-swboyd@chromium.org>
 <20240901040658.157425-17-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240901040658.157425-17-swboyd@chromium.org>
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

On Sat, Aug 31, 2024 at 09:06:54PM -0700, Stephen Boyd wrote:
> We can imagine that logically the EC is a device that has some number of
> DisplayPort (DP) connector inputs, some number of USB3 connector inputs,
> and some number of USB type-c connector outputs. If you squint enough it
> looks like a USB type-c dock. Logically there's a crossbar pin
> assignment capability within the EC that can assign USB and DP lanes to
> USB type-c lanes in the connector (i.e. USB type-c pin configurations).
> In reality, the EC is a microcontroller that has some TCPCs and
> redrivers connected to it over something like i2c and DP/USB from the AP
> is wired directly to those ICs, not the EC.
> 
> [...]
> 
> Cc: Prashant Malani <pmalani@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
