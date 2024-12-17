Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0FE9F4DFB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D391310E02B;
	Tue, 17 Dec 2024 14:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iFNOpBKp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBED10E98C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 14:39:53 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9BB8DC1153
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 14:32:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id BEB8E1C000C;
 Tue, 17 Dec 2024 14:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734445941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RJk9qBtezG93whbc4qcM7rABQiYrdK5pxBplOn1zues=;
 b=iFNOpBKpS32h7qqai9Zn0/dxy6KYb0atFUdgcfFCy5B2vm8+BS9yeQPXRQwgLfJ4yJ1A5g
 3aullRb7dbf/GVFAF1Nr0nIhFHIXtbRTmjKjW0Al2Xm+iidCvcz1zGigsv50bV/RxBBxJQ
 iYhqTMRBKpvrE/u5KS1/4FrAVo5YdWBIvNiyd3xa//xuMBiGhZjpuYH8XGNBQAECIJFKbD
 UclH+990s8FZJc7ENQ6HQyhvpu4ytGd9iuk/OPfdoXYkvunydIiEKPwG5sCk9P5k9E2s6s
 kTNVwu9wFyXmsq5QnJW1b+4qq3LLNJeln2Kqz3alj7h4wEhU9FHKe38Bs+lzWg==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 0/3] Add support for errors recovery in the TI SN65DSI83
 bridge driver
Date: Tue, 17 Dec 2024 15:32:12 +0100
Message-ID: <20241217143216.658461-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.47.0
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

Hi,

Usually the TI SN65DSI83 recovers from error by itself but during ESD
tests, we have some cases where the TI SN65DSI83 didn't recover.

In order to handle those cases, this series adds support for a recovery
mechanism.

Compare to the previous iteration, this v2 series mainly:
  - Rebase patches on top of v6.13-rc3.
  - Reset the output path where the bridge is located instead of the
    full pipeline.
  - Add more information in a commit log.

Best regards,
Hervé Codina

Changes v1 -> v2
  v1: https://lore.kernel.org/lkml/20241024095539.1637280-1-herve.codina@bootlin.com/

  - Patch 1:
    Add 'Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>'
    Add 'Acked-by: Conor Dooley <conor.dooley@microchip.com>'

  - Patch 2 (new patch in v2)
    Introduce drm_atomic_helper_disable_connector()

  - Patch 3 (patch 2 in v1)
    Reset the output path instead of the full pipeline.
    Update and add more information related to the bridge in commit log.

Herve Codina (3):
  dt-bindings: display: bridge: sn65dsi83: Add interrupt
  drm/atomic-helpers: Introduce drm_atomic_helper_disable_connector()
  drm: bridge: ti-sn65dsi83: Add error recovery mechanism

 .../bindings/display/bridge/ti,sn65dsi83.yaml |   3 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 142 ++++++++++++++++++
 drivers/gpu/drm/drm_atomic_helper.c           |  67 +++++++++
 include/drm/drm_atomic_helper.h               |   2 +
 4 files changed, 214 insertions(+)

-- 
2.47.0

