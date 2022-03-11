Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171354D5E86
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 10:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED58910E869;
	Fri, 11 Mar 2022 09:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08EC10E091
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 09:34:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 43B4C1F4649B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646991276;
 bh=PEG3axVN//YyYVluyyyZUdTkTfte6RZExlKRrKGNNGg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IOIevA2nantASE3yYn/YUjQS5gP8DD6vEldy8ZnQb7KvSWDexaKr23Q1H3WWldHVX
 ilMRsF/w8dhmsry9dwQLfOy74iekWPbrKv7KmwjLbbymuI2OupBFSkb0a0Yz6wcVYt
 eJttIa1fKq1b9rKZnUfRuveC31R3UQ4sqv5aNCGlEiO3fcFGAtfhrZJKiLoQ41KAzc
 BuGtK0m5eqWa4/7L+i4DCr+9g3CzUy7kEfBv/ebnRbUDdEXply9m6eEh/Yo3PKNic4
 9wSSwSlwtBBz6x0ComHm5IrbBXghXwrwqHzMnOBxMa+Ep6dqpMnr7Ey5Lh+ediB8wS
 fxrSGXNY4OdkQ==
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2 RESEND] drm/bridge: parade-ps8640: avoid race condition on
 driver unbinding
Date: Fri, 11 Mar 2022 10:34:05 +0100
Message-Id: <20220311093406.4068019-2-ricardo.canuelo@collabora.com>
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

When unbinding a DRM master driver there's a race condition that
sometimes results in an invalid vm access when userspace (gnome-shell)
issues a DRM_IOCTL_MODE_GETCONNECTOR ioctl right after a bridge has been
removed from an encoder's bridge chain.

This means that once a bridge has been disabled and gone through
ps8640_post_disable(), if ps8640_bridge_get_edid() runs afterwards as a
result of that ioctl call it will call drm_bridge_chain_pre_enable()
and drm_bridge_chain_post_disable() again in a bridge that has been
already detached.

Setting `ps_bridge->pre_enabled = false` at a later stage of the
bringdown path and calling drm_bridge_chain_pre_enable() inside
ps8640_bridge_get_edid() only if needed avoid this, although a proper
subsystem-wide fix would be the proper solution, since the same type of
race conditions might happen somewhere else.

Tested on an Acer Chromebook R13 (Elm, MT8173) with Debian Sid.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 3f17337ee389..a927787a89bf 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -434,8 +434,6 @@ static void ps8640_post_disable(struct drm_bridge *bridge)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 
-	ps_bridge->pre_enabled = false;
-
 	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
 	pm_runtime_put_sync_suspend(&ps_bridge->page[PAGE0_DP_CNTL]->dev);
 }
@@ -487,6 +485,7 @@ static void ps8640_bridge_detach(struct drm_bridge *bridge)
 	drm_dp_aux_unregister(&ps_bridge->aux);
 	if (ps_bridge->link)
 		device_link_del(ps_bridge->link);
+	ps_bridge->pre_enabled = false;
 }
 
 static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
@@ -508,7 +507,8 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 	 * EDID, for this chip, we need to do a full poweron, otherwise it will
 	 * fail.
 	 */
-	drm_bridge_chain_pre_enable(bridge);
+	if (poweroff)
+		drm_bridge_chain_pre_enable(bridge);
 
 	edid = drm_get_edid(connector,
 			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
-- 
2.25.1

