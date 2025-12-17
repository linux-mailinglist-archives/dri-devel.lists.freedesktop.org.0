Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC066CC82C4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 15:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE2A10ECEF;
	Wed, 17 Dec 2025 14:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="F0CiiNN/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E6310ECF0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 14:26:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 427BE4E41C61;
 Wed, 17 Dec 2025 14:26:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 16AD96072F;
 Wed, 17 Dec 2025 14:26:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E1866102F0AE0; Wed, 17 Dec 2025 15:25:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765981561; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=to5iMxlqbo+pcsR8bNTm6k5Dmpabhv622hhzqTz8TTc=;
 b=F0CiiNN/SEpf0zrbWcF6F4oxhc5QhsKITa3SgfDtBpPHN99SuY6z9+SldYbyV/KgdhnT5t
 3G6MeSyxnuBvDGtFcZk5Iywy6lQVOisnkSRA2vWS66aGC3FaeRF67vWBXmeLtncwtrrZpU
 o9CfFQgk3RpuxmpchCS4j/9wf1zLZ/gV4M/KxRLMt7R2YS+PJwpShaCZkxWmsNjzvhJakB
 3L2izt1hNmLP07szLly4Hll48At7/XO3cj9yBeFhbuFbMIBlvzvBBvxrIHJ8o9yiZNUFRC
 F7rOvJCaEIhIbPqBxmpx5J5XLpl9CGddpfReLroTamMk9jFFo9+IcpOC4tXa/A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:25:57 +0100
Message-Id: <DF0K7RO8E02J.1RCQAZSDLE2PD@bootlin.com>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 14/20] drm/tilcdc: Modernize driver initialization
 and cleanup paths
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-14-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-14-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> Refactor the driver initialization to use modern DRM managed resource
> APIs, simplifying the code.
>
> The tilcdc_init and tilcdc_fini wrapper functions are removed since they
> served no purpose after the component framework was eliminated. Their
> logic is integrated directly into probe and remove.
>
> Key changes:
> - Use devm_drm_dev_alloc() instead of drm_dev_alloc().
> - Use drmm_mode_config_init() instead of drm_mode_config_init().
> - Align the remove path with the probe error path to ensure consistent
>   cleanup ordering in both success and failure cases.
> - Adjust platform_set_drvdata() to store the private structure instead
>   of the drm_device, matching the new allocation pattern.
>
> These changes reduce error-prone code while maintaining the same
> functional behavior.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Overall looks good:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

However the diff is not very readable dues to the code moved around. I
suspect this could have been split in multiple patches: some just moving
code around and no functional changes, others doing the actual work but
without moving around code so the diff is more readable.

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
