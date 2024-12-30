Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D109B9FE568
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 11:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7704510E134;
	Mon, 30 Dec 2024 10:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OWs2UC+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A814310E134
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 10:51:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E4EC5A40BED;
 Mon, 30 Dec 2024 10:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10D2EC4CED0;
 Mon, 30 Dec 2024 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735555861;
 bh=FHX44NfuqHsRhNqKIEA7P8klIRZxZ2CMSvwoXzcowJU=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=OWs2UC+O5qWaG1nmfxL5LPatRo45ad7KP4l0x/23o/Fi7txIJKfF8IYZrXa2eKmAC
 UH8N8MPdP1wAAVUQ1CuolxpFVNAm0TIttgJOlsSThOSMrvbRy221yIs4cjx7qZo+FM
 f1LnVsjztKzBdTrCUfqkcIBoq7w5sQrKAOD21gdOKfHif8z4Zigm/N2na/9u6mfjT3
 JmLbFt3dABDVGrcNYOfury25xyP3bbFFjkAVWE7RtG1EVnowv6IZapkWYXoKZtAfXX
 uh7+4pNfncl8mJZSxNSAg54Flzp+Xog5R2PXX/91oeYCW1ePSz8vqL5t+VIg8jnuzY
 d+C+6yrVuH2rw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 030E0E77188;
 Mon, 30 Dec 2024 10:51:01 +0000 (UTC)
From: Hermes Wu via B4 Relay
 <devnull+Hermes.wu.ite.corp-partner.google.com@kernel.org>
Subject: [PATCH RESEND v7 00/10] drm/bridge: it6505: fix HDCP CTS fail
 items and add MCCS support
Date: Mon, 30 Dec 2024 18:51:18 +0800
Message-Id: <20241230-v7-upstream-v7-0-e0fdd4844703@ite.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACZ7cmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQwND3TJz3dKC4pKi1MRcXXPT1MQUozSjNFMzcyWgjoKi1LTMCrBp0Up
 BrsGufi5KsbW1APA3I45lAAAA
X-Change-ID: 20241101-v7-upstream-75ead2f2f567
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Pin-yen Lin <treapking@chromium.org>, 
 Kenneth Hung <Kenneth.Hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>, 
 Hermes Wu <Hermes.wu@ite.com.tw>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735555881; l=2980;
 i=Hermes.wu@ite.corp-partner.google.com; s=20241230;
 h=from:subject:message-id;
 bh=FHX44NfuqHsRhNqKIEA7P8klIRZxZ2CMSvwoXzcowJU=;
 b=nA6dZOmqjcBrHFVz8qqJjkJG5zys+Bn/dxwQ+Jxs4UfQF0McEXuei8ZpB0jLeTYikveuC17Lt
 bQ+tHrnCx5tAZyheJbOGS1jsMUEbB+Wu3AdbT76AjWDyR10skb0X4Js
X-Developer-Key: i=Hermes.wu@ite.corp-partner.google.com; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for
 Hermes.wu@ite.corp-partner.google.com/20241230 with auth_id=307
X-Original-From: Hermes Wu <Hermes.wu@ite.corp-partner.google.com>
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
Reply-To: Hermes.wu@ite.corp-partner.google.com
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

Change-Id: I7f14eeb18ae70b17ef7e1a8622c590427b0ff2ed
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
Hermes Wu <Hermes.wu@ite.corp-partner.google.com>


