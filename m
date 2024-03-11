Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2BB877C00
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 09:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4088D10EA9A;
	Mon, 11 Mar 2024 08:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ELkA1rAv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com
 [91.218.175.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F87110EA9A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 08:58:13 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710147490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xbTltqoLlmFssK6yUo+EQC4DqOFHNmiIvuznM++ubag=;
 b=ELkA1rAvL8X3fhBwm/BggL/K/gCJmwY/bRxMmagZI8Q/f2bxox3Ki7/+UXRyHWXDCzmpaw
 7r33pZoipgUM/mx8Rz45cc60eNt8nr5zbjvamrB6ESw2932aEIQ0TSo23IkuVsZR1qPh8A
 /8pL3PYukDW+tfc5iKKVCEb8geXxaAA=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Phong LE <ple@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v3 0/5] drm/bridge: Allow using fwnode API to get the next
 bridge
Date: Mon, 11 Mar 2024 16:56:54 +0800
Message-Id: <20240311085659.244043-1-sui.jingfeng@linux.dev>
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

Currently, the various drm bridge drivers relay on OF infrastructures to
works very well. Yet there are platforms and/or devices absence of OF
support. Such as virtual display drivers, USB display apapters and ACPI
based systems etc.

Add fwnode based helpers to fill the niche, this allows part of the drm
display bridge drivers to work across systems. As the fwnode based API
has wider coverage than DT and the fwnode graphs are compatible with
the OF graph, so the provided helpers can be used on all systems in theory.
Assumed that the system has valid fwnode graphs established before the
drm bridge driver is probed, and there is a fwnode assigned to the instance
of specific drm bridge driver.

Tested on TI BeaglePlay board and other platforms.

v1 -> v2:
	 * Modify it66121 to switch togather
	 * Drop the 'side-by-side' implement
	 * Add drm_bridge_find_next_bridge_by_fwnode() helper
	 * Add drm_bridge_set_node() helper

v2 -> v3:
	 * Read kernel-doc and improve function comments
	 * Drop the 'port' argument of it66121_read_bus_width() (Dmitry)
	 * Do more by covertering the sii902x drm bridge drviers

Sui Jingfeng (5):
  drm/bridge: Add fwnode based helpers to get the next bridge
  drm/bridge: simple-bridge: Use fwnode API to acquire device properties
  drm-bridge: display-connector: Use fwnode API to acquire device
    properties
  drm-bridge: it66121: Use fwnode API to acquire device properties
  drm-bridge: sii902x: Use fwnode API to acquire device properties

 drivers/gpu/drm/bridge/display-connector.c | 24 ++++----
 drivers/gpu/drm/bridge/ite-it66121.c       | 63 ++++++++++---------
 drivers/gpu/drm/bridge/sii902x.c           | 43 +++++--------
 drivers/gpu/drm/bridge/simple-bridge.c     | 22 +++----
 drivers/gpu/drm/drm_bridge.c               | 72 ++++++++++++++++++++++
 include/drm/drm_bridge.h                   | 16 +++++
 6 files changed, 159 insertions(+), 81 deletions(-)


base-commit: 3fde6df89bac97416ce1c82b14237a1a67ce3285
-- 
2.34.1

