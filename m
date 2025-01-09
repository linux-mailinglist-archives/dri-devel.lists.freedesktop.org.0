Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE83A0737A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 11:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC60810ED53;
	Thu,  9 Jan 2025 10:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YP2hGYZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DABF10ED53
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 10:38:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C9DB1BF20C;
 Thu,  9 Jan 2025 10:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736419117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKgFPO+Rh1KOhaMMkBZKNFUCZJOyXbfXEXGGNEOMVG8=;
 b=YP2hGYZO5ngGfo0AvGrIz3Hpm3+2yE+2igYz8io9SdGDFtDRbGanv91vwzQA+AdjCEul8M
 bUHBSg7W8WBpQ4DkfYYN0SXvmKDHGLOa0hTP+zfQo1sfLFQczD08evufS6y3Zpegq19uhq
 T2BNJQYyBVRY39PUW2CjPre/GbG1gxCew9jHsLAA4mBikxqziLcgrNgJTMnN+lb135esH+
 ZyEv3goWy2dr1l7WWc8F9mHd/bGl6xVTjE1sxJ5WUdAHtxaUxJi+/v7tivv84RX7R7jl7t
 PRV2sMyB0LIDOF5BkEjjmXdk0LDoxdtsmmjH05i+Jjn/wEl/pvhrwKz8uC0WBA==
Date: Thu, 9 Jan 2025 11:38:34 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 3/3] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20250109113834.04299a74@bootlin.com>
In-Reply-To: <20250108184442.64f38fbc@bootlin.com>
References: <20250108101907.410456-1-herve.codina@bootlin.com>
 <20250108101907.410456-4-herve.codina@bootlin.com>
 <115787605.nniJfEyVGO@steina-w>
 <20250108184442.64f38fbc@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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

Hi Alexander,

On Wed, 8 Jan 2025 18:44:42 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> > >  #include <drm/drm_atomic_helper.h>
> > >  #include <drm/drm_bridge.h>
> > > +#include <drm/drm_drv.h> /* DRM_MODESET_LOCK_ALL_BEGIN() needs drm_drv_uses_atomic_modeset() */    
> > 
> > Shouldn't this include be added to include/drm/drm_modeset_lock.h instead?  
> 
> Yes indeed. I will change that in the next iteration.

I tried to add '#include <drm/drm_drv.h>' in include/drm/drm_modeset_lock.h
but it breaks the build in several places.

First, I cannot add it at the begining of drm_modeset_lock.h.
The inclusion path leads to:
  drm_modeset_lock.h
    drm/drm_drv.h
      drm/drm_device.h
        drm/drm_mode_config.h
           struct drm_mode_config definition

The struct drm_mode_config needs the struct drm_modeset_lock defined.
struct drm_modeset_lock is defined in drm_modeset_lock.h.

Even if I don't like to add include files in the middle of a header filer,
I tried to include drm/drm_drv.h just before the DRM_MODESET_LOCK_ALL_BEGIN()
definition in drm_modeset_lock.h.

This also breaks the build in several places. For instance:
  In file included from ./include/drm/drm_modeset_lock.h:162,
                   from ./include/drm/drm_mode_config.h:32,
                   from ./include/drm/drm_device.h:9,
                   from drivers/gpu/drm/drm_dumb_buffers.c:26:
  ./include/drm/drm_drv.h: In function ‘drm_core_check_all_features’:
  ./include/drm/drm_drv.h:522:28: error: invalid use of undefined type ‘const struct drm_device’
    522 |         u32 supported = dev->driver->driver_features & dev->driver_features;
        |                            ^~

I stop here, go back and choose to keep '#include <drm/drm_drv.h>' in ti-sn65dsi83.c

Is that ok for you?

Best regards,
Hervé
