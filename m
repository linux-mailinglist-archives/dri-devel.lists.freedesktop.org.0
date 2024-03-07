Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D5687550F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 18:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7A110ED0F;
	Thu,  7 Mar 2024 17:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Mjk8nk87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F4A10F4F4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 17:23:49 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1709832226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6Nm/uDkNQN3qDQ6YQBwJh6NMCjNuXTvF9sGoyipKdK0=;
 b=Mjk8nk87KIWz31gLfjlrhov8j4QOnypvKVjK2CuTQF/7mNO8SBMKpH6PfmpQJGkCgVEFhn
 sUwZnHzKPyRCpoLM3U4S+4EPsERhRFiq1uX0CLS9U3iN7YQknRcZPfaJCoz9lsDQXykbXG
 zY7VPYygSWXHZl3seSwEhcnqM2iIVEc=
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
Subject: [PATCH v2 0/4] drm/bridge: Allow using fwnode API to get the next
 bridge
Date: Fri,  8 Mar 2024 01:23:30 +0800
Message-Id: <20240307172334.1753343-1-sui.jingfeng@linux.dev>
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
works very well. Yet there are platforms and/or don not has OF support.
Such as virtual display drivers, USB display apapters and ACPI based
systems etc. Add fwnode based helpers to fill the niche, this may allows
part of the drm display bridge drivers to work across systems. As the
fwnode based API has wider coverage than DT, it can be used on all systems
in theory. Assumed that the system has valid fwnode graphs established
before drm bridge driver is probed, the fwnode graphs are compatible with
the OF graph.

Tested on TI BeaglePlay board and other platforms.

v1 at https://patchwork.freedesktop.org/series/129040/

v2:
	 * Modify it66121 to switch togather
	 * Drop the 'side-by-side' implement
	 * Add drm_bridge_find_next_bridge_by_fwnode() helper
	 * Add drm_bridge_set_node() helper

Sui Jingfeng (4):
  drm/bridge: Add fwnode based helpers to get the next bridge
  drm/bridge: simple-bridge: Use fwnode API to acquire device properties
  drm-bridge: display-connector: Use fwnode API to acquire device
    properties
  drm-bridge: it66121: Use fwnode API to acquire device properties

 drivers/gpu/drm/bridge/display-connector.c | 24 ++++----
 drivers/gpu/drm/bridge/ite-it66121.c       | 63 +++++++++++---------
 drivers/gpu/drm/bridge/simple-bridge.c     | 22 ++++---
 drivers/gpu/drm/drm_bridge.c               | 68 ++++++++++++++++++++++
 include/drm/drm_bridge.h                   | 16 +++++
 5 files changed, 142 insertions(+), 51 deletions(-)

-- 
2.34.1

