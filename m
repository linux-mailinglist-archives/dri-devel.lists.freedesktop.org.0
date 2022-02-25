Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF574C46D8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 14:45:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACE610E48B;
	Fri, 25 Feb 2022 13:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2BA10E48B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 13:45:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 38B651F45F94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645796741;
 bh=6IuTiAPuhKDYgNwCLKRyc4SunUJTB6ruZFYFsOvvpvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=furnXzpdMdgCyVoYEJ4jDsNkBjXVwWUIBhNi74Q0yGH4QrCYy2xcC23hpHNo4n5G1
 y8Ob0c1jgVIFTYAcUYS0VgI+V4cihoITEyo8tyqT6WCgnBVRZAwEIIomHmYKBxSzBt
 Dht/iRxyKUmfqcBqP4xEmfexO2cMyX4S0ivgJEH+iaqsHPSzatnnyPqq1iRfrV4b4u
 qfp/5GFOhhwNbEnaYRe9iWYSMgpbdoygnLQc8OU1T8IM4sTQQYPQz75DX31oGd8161
 ibLHJGZwlRfOAm0FWAFpDkxesQSeTlLajZta2f58kEj2pvFTU9sy/6WHJQ3UtXQ8ic
 0d/WRZ7lQBuGw==
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/bridge: Add extra checks in pre_enable and post_enable
Date: Fri, 25 Feb 2022 14:45:04 +0100
Message-Id: <20220225134504.457245-3-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225134504.457245-1-ricardo.canuelo@collabora.com>
References: <20220225134504.457245-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, andrzej.hajda@intel.com,
 kernel@collabora.com,
 =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Depending on the bridge code, certain userspace events during a driver
teardown (such as a DRM ioctl call) might cause a race condition where
the drm_bridge_chain_pre_enable() and drm_bridge_chain_post_enable()
functions could be called for a bridge that has just been detached and
removed from the bridge chain of an encoder.

This change makes these functions a bit more robust by bailing out if
the bridge has already been detached.

Tested on an Acer Chromebook R13 (Elm, MT8173) with Debian Sid.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
---
 drivers/gpu/drm/drm_bridge.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c96847fc0ebc..e074aa456dd1 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -529,7 +529,7 @@ void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
 {
 	struct drm_encoder *encoder;
 
-	if (!bridge)
+	if (!bridge || !bridge->dev)
 		return;
 
 	encoder = bridge->encoder;
@@ -585,7 +585,7 @@ void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
 	struct drm_encoder *encoder;
 	struct drm_bridge *iter;
 
-	if (!bridge)
+	if (!bridge || !bridge->dev)
 		return;
 
 	encoder = bridge->encoder;
-- 
2.25.1

