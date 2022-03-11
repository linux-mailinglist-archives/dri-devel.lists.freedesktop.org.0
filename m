Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0024D5E87
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 10:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B3610E873;
	Fri, 11 Mar 2022 09:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C6610E091
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 09:34:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id E511A1F4649E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646991277;
 bh=6IuTiAPuhKDYgNwCLKRyc4SunUJTB6ruZFYFsOvvpvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gD8SJkWPQ7AVcDYe+nWxXfobtI4INoYCVxW2ZB+Ymm9w2+8CaNz1q4SOTOz0LYPjz
 hGE5rXOAurREVi3IW7YQ+311vbeuCvhAZEtGwT1UQ6JGNN4jw9I5SVByaHfedUpRgk
 8tl6I1ycOfeVe6h3U6FpZHRJQ4a08lXbIc0faRsAqCq1QccSYUlhyRTPdgqB7lD/KD
 nlgN6VZ5BncUXMpaEJHhVlgNMh78y/7kD8lLHl4E8MWn0XAm+B4cW/SdglvOY5S+SS
 JRf3BVt9wetOW7qBA0Od2XtzFbiAg08uBp+EtWKh8s9Wzyz3ipXIE1sm44716SVvX1
 7EEsvho0zxjdg==
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2 RESEND] drm/bridge: Add extra checks in pre_enable and
 post_enable
Date: Fri, 11 Mar 2022 10:34:06 +0100
Message-Id: <20220311093406.4068019-3-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311093406.4068019-1-ricardo.canuelo@collabora.com>
References: <20220311093406.4068019-1-ricardo.canuelo@collabora.com>
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
 kernel@collabora.com
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

