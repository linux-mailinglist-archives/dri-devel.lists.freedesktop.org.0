Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3F19848CD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 17:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FDA10E2BE;
	Tue, 24 Sep 2024 15:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TBL79evk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1440F10E2BE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 15:43:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B69322000B;
 Tue, 24 Sep 2024 15:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1727192579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=boh+NsTBLdXuPuSw+Ws2TN9M0882PuT2RvMnZj0QorU=;
 b=TBL79evkW0HtYvanMONTX/MlIHDSJGWoXLbHiyXZevjhMPqRXWtJR3phjiYlpzEv5UXKgx
 oQHyN1+JHZR4mhoymDhI+OBgSpJPaGkI+eACnKjWPz4GBIpvuRzdy94Gx+KUmQ4x6n7jMh
 VJa5e0jyMVt3cR89NbHLyZUFiQu8h3DxHIhn++lGpXEYQFv7BQKRdnyjgcUyy1S9mr5b4C
 0kZ+o9iaRXrM4CjPPp1Nog6QJxpBNSCtA4J2FUd3+8JaJ+Cj7D5Qta/LKRrqhu5ZtxgOa6
 sI/qsWG+EYW+DeO/jAExNXW0yb+wGGqzbKA75sz46jCCZtKg3Vz4qCixtl7VSw==
Date: Tue, 24 Sep 2024 17:42:54 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Lee Jones <lee@kernel.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Helge
 Deller <deller@gmx.de>, Paul Kocialkowski <contact@paulk.fr>, =?UTF-8?Q?H?=
 =?UTF-8?Q?erv=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v4 4/8] drm/bridge: hotplug-bridge: add driver to
 support hot-pluggable DSI bridges
Message-ID: <20240924174254.711c7138@booty>
In-Reply-To: <20240917-hotplug-drm-bridge-v4-4-bc4dfee61be6@bootlin.com>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
 <20240917-hotplug-drm-bridge-v4-4-bc4dfee61be6@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Simona, Maxime, Dmitry,

On Tue, 17 Sep 2024 10:53:08 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> This driver implements the point of a DRM pipeline where a connector allows
> removal of all the following bridges up to the panel.

This is a quick feedback of the discussions about hotpluggable DRM
bridges I had with Maxime and Dmitry during the Linux Plumbers
Conference last week, which happened during the discussion I led on
Wednesday afternoon and even more in the hallway.

It was clear that adding refcounting to DRM bridges and handling
gracefully atomic modeset operations during device removal are
prerequisites for a hotpluggable bridge in DRM.

DSI host drivers that keep a pointer to their device also need to be
fixed, but this is well known and was not  discussed.

Simona's proposal of letting removable bridges be owned by the hotplug
connector was not seen as necessarily needed, especially after adding
bridge refcounting. Also Maxime mentioned this idea might conflict with
a use case that had been brought to his attention, involving bridges
and DP MST. So I'm removing this idea from my roadmap -- it can be
re-discussed and brought back if needed.

There was no clear outcome about the question of whether the
hotplug-bridge should still exist as a drm_bridge or rather the DRM
core and the bridge drivers should be extended to handle everything.
Dmitry seemed to think no hotplug bridge should exist at all, and all
bridge drivers should be extended to cope with insertion and removal of
the follofing bridge. Ripard's opinion was "I don't care". In her
e-mail sent a few hours ago (in the v2 thread) Simona also appears as
not having a strong position about this. There will be some time to
clarify this as I'm addressing the previously mentioned issues.

So by now the roadmap involves the following main steps:
 1. add refcounting to DRM bridges (struct drm_bridge)
 2. handle gracefully atomic updates during bridge removal
 3. avoid DSI host drivers to have dangling pointers to DSI devices
 4. finish the hotplug bridge work, moving code to the core and
    potentially removing the hotplug-bridge itself

If you think any other major item is required to support hot-pluggable
DRM bridges, don't hesitate to speak out.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
