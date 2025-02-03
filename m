Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFD8A25F4F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 16:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E28910E4F2;
	Mon,  3 Feb 2025 15:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mJk7tTzD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A4E10E4F2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 15:56:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D6134429D;
 Mon,  3 Feb 2025 15:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738598202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMBSA0Upt0iWcWNJa/KoKNpe46eJc1eQwBVOZ/c9pa4=;
 b=mJk7tTzD5p1/KsRJo5NYRYupbAphhwab+KDnoBVsu4F1TqNKfScnCpG00DHs8LnlF5tEKa
 NrHLC5TUjJwn/Zmf9VJcrpIvOuaLrwYZxKDljGf3aUEg+qJRJpOfb0gTtjftW8sQQisyCX
 W4lcA2ez1zhh9+CnpBhfALHBHI/1bPaVfHz3XQPFHm2Zp4tqlBTTLcJ46CjTC21Yz5CaPs
 /zmB3We8WAQ6lLNYYs1smcMhCC9S5T3gYnCfJPYQ5qb9YC22kE6iPA1QdsBj2HLtI9Yo48
 4jBAcHdwdnY/492edQzfvbxvRvy0zdL5csDYx2ItvVf/wwmSIZK9Kzl1FhLofw==
Date: Mon, 3 Feb 2025 16:56:38 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel
 Maintenance <kernel-list@raspberrypi.com>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 0/4] Add support for errors recovery in the TI
 SN65DSI83 bridge driver
Message-ID: <20250203165638.6db36f7c@bootlin.com>
In-Reply-To: <20250203145824.155869-1-herve.codina@bootlin.com>
References: <20250203145824.155869-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejiedvieekkedtjeekffejveelhedtfeehtefgudfhffffiedvfedvhfeiheeujeenucffohhmrghinhepudegqdhrtgdurdhmhidpkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopegrlhgvgigrnhguvghrrdhsthgvihhnsegvfidrthhqqdhgrhhouhhprdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlr
 dhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
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

Hi all,

Oops, this series doesn't apply on top of v6.14-rc1. My bad, sorry about
that.

Please ignore this series. I will send soon a new iteration fixed.

Apologies,
Hervé

On Mon,  3 Feb 2025 15:58:19 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi,
> 
> Usually the TI SN65DSI83 recovers from error by itself but during ESD
> tests, we have some cases where the TI SN65DSI83 didn't recover.
> 
> In order to handle those cases, this series adds support for a recovery
> mechanism.
> 
> Compare to the previous iteration, this v4 series:
>   - rebase on top of v6.14-rc1
>   - disable/re-enable irq in the failure detection and reset process
>   - Split the patch moving reset_pipe() from VC4 to a new helper
>   - Rename the new helper to drm_atomic_helper_reset_crtc()
>   - Remove state duplication and use bridge.encoder->crtc
> 
> Best regards,
> Hervé Codina
> 
> Changes v3 -> v4
>   v3: https://lore.kernel.org/lkml/20250108101907.410456-1-herve.codina@bootlin.com/
> 
>   - Patch 1:
>     No changes
> 
>   - Patch 2 and 3 (patch 2 in v3):
>     Rename the helper to drm_atomic_helper_reset_crtc()
>     Split the patch available in v3 in two patches.
> 
>   - Patch 4 (patch 3 in v3):
>     Take into account commit d2b8c6d549570 ("drm/bridge: ti-sn65dsi83:
>     Add ti,lvds-vod-swing optional properties"), available in v6.14-rc1.
>     Disable irq when a fault is detected and re-enable it after the pipe
>     reset.
>     Remove state duplication and use bridge.encoder->crtc directly
> 
> Changes v2 -> v3
>   v2: https://lore.kernel.org/lkml/20241217143216.658461-1-herve.codina@bootlin.com/
> 
>   - Patch 1:
>     No changes
> 
>   - Patch 2 (new in v3)
>     Move reset_pipe() from VC4 HDMI driver to a new atomic helper
> 
>   - Patch 3
>     Use the new drm_atomic_helper_reset_pipe()
> 
>   Patch removed in v3
>     - Patch 2 in v2
>       No more needed
> 
> Changes v1 -> v2
>   v1: https://lore.kernel.org/lkml/20241024095539.1637280-1-herve.codina@bootlin.com/
> 
>   - Patch 1:
>     Add 'Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>'
>     Add 'Acked-by: Conor Dooley <conor.dooley@microchip.com>'
> 
>   - Patch 2 (new patch in v2)
>     Introduce drm_atomic_helper_disable_connector()
> 
>   - Patch 3 (patch 2 in v1)
>     Reset the output path instead of the full pipeline.
>     Update and add more information related to the bridge in commit log.
> 
> Herve Codina (4):
>   dt-bindings: display: bridge: sn65dsi83: Add interrupt
>   drm/atomic-helper: Introduce drm_atomic_helper_reset_crtc()
>   drm/vc4: hdmi: Use drm_atomic_helper_reset_crtc()
>   drm: bridge: ti-sn65dsi83: Add error recovery mechanism
> 
>  .../bindings/display/bridge/ti,sn65dsi83.yaml |   3 +
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 131 ++++++++++++++++++
>  drivers/gpu/drm/drm_atomic_helper.c           |  41 ++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.c                |  30 +---
>  include/drm/drm_atomic_helper.h               |   2 +
>  5 files changed, 178 insertions(+), 29 deletions(-)
> 

