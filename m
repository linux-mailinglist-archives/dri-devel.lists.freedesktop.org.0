Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1AD8AD4B3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 21:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769DE10F7BD;
	Mon, 22 Apr 2024 19:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Y3anQZO7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [95.215.58.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EA910F7BD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 19:19:19 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1713813557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=fGsjHAbYUFtiS1u1KaAmxhWdCq3KEXLTWvKx+cfURAU=;
 b=Y3anQZO7sdEhrz4psncVP8rNbsfXyEDVRF0idXP8S2tF4kNTCG9oQ7zMG2e5TaHBQ3oz0P
 welkurB8yGQXAbyxtQfKoSYHXcetBeWenWL3etbtJYysQRInyi73fYvRfoAkjEf84AYONj
 WzD2BuNJILqNZoLfnAnjKr/eB3HV/DI=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Phong LE <ple@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v4 0/9] drm/bridge: Allow using fwnode API to get the next
 bridge
Date: Tue, 23 Apr 2024 03:18:54 +0800
Message-Id: <20240422191903.255642-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Currently, the various display bridge drivers rely on OF infrastructures
to works very well, yet there are platforms and/or devices absence of 'OF'
support. Such as virtual display drivers, USB display apapters and ACPI
based systems etc.

Add fwnode based helpers to fill the niche, this allows part of the display
bridge drivers to work across systems. As the fwnode API has wider coverage
than DT counterpart and the fwnode graphs are compatible with the OF graph,
so the provided helpers can be used on all systems in theory. Assumed that
the system has valid fwnode graphs established before drm bridge drivers
are probed, and there has fwnode assigned to involved drm bridge instance.

Tested on TI BeaglePlay board.

v1 -> v2:
	 * Modify it66121 to switch togather
	 * Drop the 'side-by-side' implement
	 * Add drm_bridge_find_next_bridge_by_fwnode() helper
	 * Add drm_bridge_set_node() helper

v2 -> v3:
	 * Read kernel-doc and improve function comments (Dmitry)
	 * Drop the 'port' argument of it66121_read_bus_width() (Dmitry)
	 * drm-bridge: sii902x get nuked

v3 -> v4:
	 * drm-bridge: tfp410 get nuked
	 * Add platform module alias
	 * Rebase and improve commit message and function comments

Sui Jingfeng (9):
  drm/bridge: Allow using fwnode API to get the next bridge
  drm/bridge: simple-bridge: Use fwnode API to acquire device properties
  drm/bridge: simple-bridge: Add platform module alias
  drm-bridge: display-connector: Use fwnode API to acquire device
    properties
  drm/bridge: display-connector: Add platform module alias
  drm-bridge: sii902x: Use fwnode API to acquire device properties
  drm-bridge: it66121: Use fwnode API to acquire device properties
  drm/bridge: tfp410: Use fwnode API to acquire device properties
  drm/bridge: tfp410: Add platform module alias

 drivers/gpu/drm/bridge/display-connector.c | 25 ++++----
 drivers/gpu/drm/bridge/ite-it66121.c       | 57 ++++++++++-------
 drivers/gpu/drm/bridge/sii902x.c           | 43 ++++---------
 drivers/gpu/drm/bridge/simple-bridge.c     | 23 ++++---
 drivers/gpu/drm/bridge/ti-tfp410.c         | 42 ++++++------
 drivers/gpu/drm/drm_bridge.c               | 74 ++++++++++++++++++++++
 include/drm/drm_bridge.h                   | 16 +++++
 7 files changed, 185 insertions(+), 95 deletions(-)

-- 
2.34.1

