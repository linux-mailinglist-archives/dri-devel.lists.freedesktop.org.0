Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45829BACB7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 07:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD8B10E37A;
	Mon,  4 Nov 2024 06:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d8BjxGkN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833CD10E07F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 06:44:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B9FBD5C4D1E;
 Mon,  4 Nov 2024 06:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3ACCAC4CECE;
 Mon,  4 Nov 2024 06:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730702646;
 bh=N2BEphD6E+ts757yq9dfmmqSySIs2TwDaeNZtjT8DQ8=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=d8BjxGkNhwqEQ1w/TPSJgwkgN/et1iaMVP1zw14U5aA4CnDnOYrzSpqTSkkaqkPmE
 jbwcjpi5PdzeHjdBbpenFsKGFzoii2ae5TB2B6DeWesRFo4kcDFa9NQYv8NlhCe2NQ
 OqRKlAcLWpxEmANuT3dYxw51TSOhLOkZ+9lM1AZO9QfKBma4I/L2vfBETzdQj+sEa5
 zWbmU4iwlq/GUtJi8AzLyiujbcJZjtLqK6lIcIK+GKWJMsrlpz+RD8WPFu0eD+/BUt
 YDzZ/ACxBi6IVCQc37gLD84l04iAWuQNqhU8OCdLduPvvKZA7CHMVqlkwLr6HpWL0G
 9LxqTaZRGb5JA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 21B5ED111AD;
 Mon,  4 Nov 2024 06:44:06 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH v7 00/10] drm/bridge: it6505: fix HDCP CTS fail items and
 add MCCS support
Date: Mon, 04 Nov 2024 14:43:30 +0800
Message-Id: <20241104-v7-upstream-v7-0-8b71fd0f1d2d@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABJtKGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQwND3TJz3dKC4pKi1MRcXXPT1MQUozSjNFMzcyWgjoKi1LTMCrBp0bG
 1tQBAzplEXQAAAA==
X-Change-ID: 20241101-v7-upstream-75ead2f2f567
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hermes Wu <hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Pin-yen Lin <treapking@chromium.org>, 
 Kenneth Hung <Kenneth.Hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>, 
 Hermes Wu <Hermes.wu@ite.com.tw>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730702658; l=2910;
 i=Hermes.wu@ite.com.tw; s=20241101; h=from:subject:message-id;
 bh=N2BEphD6E+ts757yq9dfmmqSySIs2TwDaeNZtjT8DQ8=;
 b=SnEN66Llgw53Ax04tEB9EPogFfgJEnebxA2xp/6yJ0r/3ojcYg2jVR1CrBzaKZ/7O0Gzl+QKt
 IDXftIsWc6pCifgJ3F51AP/xEG0oehgeu4c1MWR8K3g1EszvJUWRpfD
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=FOYYbsP2Nlw6mjB3rLFYSLmAiENzj4AWQly5XTcDuMM=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241101 with
 auth_id=268
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
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
Reply-To: Hermes.wu@ite.com.tw
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are lots of failure items while running HDCP CTS using UNIGRAF DPR-100.
In Order to fix those failures, HDCP flow needs to be changed.

The DisplayPort AUX protocol supports I2C transport.
In Order to support MCCS via the aux channel, the aux-i2c operation is added.

v6->v7
	-[3/10] add header <linux/bitfield.h> included

	links:
	https://lore.kernel.org/all/20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw/

v5->v6:
	-keep the commit message wrapped at 72-75 chars.
	-[10/10] fix return variable being used without being initialized

v4->v5:
	-add more messages for changes.
	-[2/10] modified AUX transfer data size judgment.
		change for-loop to do-while.
	-[7/10] change for-loop to do-while.
	-[9/10] change wait timer with timer_after()

	links:
	https://lore.kernel.org/all/20240926074755.22176-4-Hermes.Wu@ite.com.tw/
	https://lore.kernel.org/all/20240926075134.22394-1-Hermes.Wu@ite.com.tw/

v3->v4:
	-split changes  into patches.

v2->v3:
	-split aux read  KSV function to a patch.
	-[1/3] new in v3
	-[2/3] add description of patch

v1->v2:
	- ignored.

To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Hermes Wu <hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>
Cc: Pet Weng <Pet.Weng@ite.com.tw> 

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Hermes Wu (10):
      drm/bridge: it6505: Change definition of AUX_FIFO_MAX_SIZE
      drm/bridge: it6505: improve AUX operation for edid read
      drm/bridge: it6505: add AUX operation for HDCP KSV list read
      drm/bridge: it6505: Change definition MAX_HDCP_DOWN_STREAM_COUNT
      drm/bridge: it6505: fix HDCP Bstatus check
      drm/bridge: it6505: fix HDCP encryption when R0 ready
      drm/bridge: it6505: fix HDCP CTS KSV list read with UNIGRAF DPR-100.
      drm/bridge: it6505: fix HDCP CTS compare V matching
      drm/bridge: it6505: fix HDCP CTS KSV list wait timer
      drm/bridge: it6505: add I2C functionality on AUX

 drivers/gpu/drm/bridge/ite-it6505.c | 335 ++++++++++++++++++++++++++++++------
 1 file changed, 278 insertions(+), 57 deletions(-)
---
base-commit: 4d1c251e8889b4629789425fe85adfc6d39666ac
change-id: 20241101-v7-upstream-75ead2f2f567

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


