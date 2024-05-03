Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAA68BB103
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 18:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FD411313C;
	Fri,  3 May 2024 16:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="EeAisheX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C66113141
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 16:41:21 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714754479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=v/sfvCbsExxR+80Czjk0cax2wbMTf4eS83WNGKM8GpY=;
 b=EeAisheXkb40MSY0xLwm1raY+tGiU3GikmftKAiCst/fXFaiY/FNr51n9FB9macOr0HV3P
 OKTQCq4qrCswtQldOHHTkV1BN21B4/NQYKYEiCcG7qoCZYO7T6BK0czEcZM7QqZTPPgJec
 hsUvLi1AbTHJeZRUQ81+MZ3opH4DA/Q=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v5 00/10] drm/bridge: Allow using fwnode API to get the next
 bridge
Date: Sat,  4 May 2024 00:40:56 +0800
Message-Id: <20240503164106.1172650-1-sui.jingfeng@linux.dev>
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

v4 -> v5:
	 * Modify sii9234, ch7033 and ANX7688
	 * Trivial fixes

Sui Jingfeng (10):
  drm/bridge: Allow using fwnode APIs to get the next bridge
  drm/bridge: Add a helper to setup both the of_node and fwnode of drm
    bridge
  drm/bridge: simple-bridge: Use fwnode APIs to acquire device
    properties
  drm/bridge: display-connector: Use fwnode APIs to acquire device
    properties
  drm/bridge: sii902x: Switch to use fwnode APIs to acquire device
    properties
  drm-bridge: it66121: Use fwnode APIs to acquire device properties
  drm/bridge: tfp410: Use fwnode APIs to acquire device properties
  drm/bridge: sii9234: Use fwnode APIs to abstract DT dependent API away
  drm/bridge: ch7033: Switch to use fwnode based APIs
  drm/bridge: anx7688: Switch to use drm_bridge_set_node() helper

 drivers/gpu/drm/bridge/chrontel-ch7033.c   | 14 ++--
 drivers/gpu/drm/bridge/cros-ec-anx7688.c   |  3 +-
 drivers/gpu/drm/bridge/display-connector.c | 25 ++++----
 drivers/gpu/drm/bridge/ite-it66121.c       | 57 ++++++++++-------
 drivers/gpu/drm/bridge/sii902x.c           | 45 +++++--------
 drivers/gpu/drm/bridge/sii9234.c           |  8 ++-
 drivers/gpu/drm/bridge/simple-bridge.c     | 23 +++----
 drivers/gpu/drm/bridge/ti-tfp410.c         | 41 ++++++------
 drivers/gpu/drm/drm_bridge.c               | 74 ++++++++++++++++++++++
 include/drm/drm_bridge.h                   | 18 +++++-
 10 files changed, 201 insertions(+), 107 deletions(-)

-- 
2.34.1

