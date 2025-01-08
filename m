Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC30FA057EE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 11:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CC010E846;
	Wed,  8 Jan 2025 10:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fML3M+Zl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7719E10E82C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 10:19:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 3A385FF80A;
 Wed,  8 Jan 2025 10:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736331560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ALgIVfCLQTLBbTDsLiWU4YPVyURu8kYumWn08CK6dJc=;
 b=fML3M+ZlOxI6Ga49iJgvjKR0kLBARcGGCbqomOEHZptqddWFt2bjLleDkhLuUsuYahExU7
 fIvmrtExY9La4Uau2e006eYRyWwPQdorb+TPj2A2M0b2zKdSOk64MihkWeUwfi4kw1ZE3A
 vGc/clakM/4JzqTreTXlwMsyKp0801vB/FEnd7JpRD6NoDdYQLHq2MQcy+e//Eoo29HxgQ
 8nqdCZ1tLHX6wzNw5yekfJmpdiVbSou0+Y+zPWgtBHNAAJI7nu6hzEEOWb1PvJEaEdfQME
 aIY52OUcM5AWFgVhwZtYPWkj0QkBdDgi4j8FjhAVPTJ/4mk5UW1c7O1ttu3seQ==
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
Subject: [PATCH v3 0/3] Add support for errors recovery in the TI SN65DSI83
 bridge driver
Date: Wed,  8 Jan 2025 11:18:59 +0100
Message-ID: <20250108101907.410456-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.47.1
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

Compare to the previous iteration, this v3 series:
  - move reset_pipe() from the VC4 HDMI driver to an new atomic helper
  - Use this new helper

Best regards,
Hervé Codina

Changes v2 -> v3
  v2: https://lore.kernel.org/lkml/20241217143216.658461-1-herve.codina@bootlin.com/

  - Patch 1:
    No changes

  - Patch 2 (new in v3)
    Move reset_pipe() from VC4 HDMI driver to a new atomic helper

  - Patch 3
    Use the new drm_atomic_helper_reset_pipe()

  Patch removed in v3
    - Patch 2 in v2
      No more needed

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
  drm/vc4: Move reset_pipe() to an atomic helper
  drm: bridge: ti-sn65dsi83: Add error recovery mechanism

 .../bindings/display/bridge/ti,sn65dsi83.yaml |   3 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 147 ++++++++++++++++++
 drivers/gpu/drm/drm_atomic_helper.c           |  41 +++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  30 +---
 include/drm/drm_atomic_helper.h               |   2 +
 5 files changed, 194 insertions(+), 29 deletions(-)

-- 
2.47.1

