Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1236AD3B04D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6683210E4C7;
	Mon, 19 Jan 2026 16:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pUPvqtSe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDF410E4C6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 16:18:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 00C671A297C;
 Mon, 19 Jan 2026 16:18:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C872B60731;
 Mon, 19 Jan 2026 16:18:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4DE0810B6B16B; Mon, 19 Jan 2026 17:18:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768839515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6IzZqITfxZfsqLMD97cOvLx/oTz7z6A1f/3WBHICk0E=;
 b=pUPvqtSehbxN1xcBr3URpoIUzPLIdZF4ymZLMVtPVq6B+npB/nl1peqzjW3p39QZBEKAE2
 ZTWfkjRz630zT7QEuHuWw2cfvECsBSs9Pj/ZV2ugWXo+B6s+yGT7iPREPZsY2MnbKOgp53
 n2jtpnm8kiqsDutFGsV/2AGTFsIHYaDnCPmV0NIqYzWsJZ4JXmZgpaUEPPSnbnbLl04XXD
 MQlO0OsfnbeuYn5h4REjHALwDvQFmhBbnccS1LSclOWP2Wtiv0B/Mk9BU3+DdNc/SOVaDM
 ia8XbpAeNL3OQd4VA64W43PEkX+DE7zbyYinOHy4P4oJkFNgwmB+Y05Q1YW4Dw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 17:18:31 +0100
Message-Id: <DFSP9XSQ9Q4F.3W0523ABWR97X@bootlin.com>
Subject: Re: [PATCH v4 16/25] drm/tilcdc: Modernize driver initialization
 and cleanup paths
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
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
X-Mailer: aerc 0.20.1
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-16-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-16-2c1c22143087@bootlin.com>
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

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
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

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
