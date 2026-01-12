Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8F9D15DD5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 00:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F7E10E1DA;
	Mon, 12 Jan 2026 23:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="PQeG/IGz";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MCeBaY4P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C404110E1DA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 23:47:36 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dqpvn6Bpdz9spG;
 Tue, 13 Jan 2026 00:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768261653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=x9QnIHcy9lfGs1gQswZ4b0k66USbs6ylyNIYU06/No8=;
 b=PQeG/IGzDbLlAss3QKaMM5ZsVvpvx9JzpsNgcRvDYs1UxKC2Ij2XyrRYS8sE5HSaF17kor
 fh4EFIeDcUpMdqEYCTL+64LWexNwlbglyyEb2kvgTAevAxxDREIpcxkaWnuFFj7sarDJ6B
 D3BWXUwZ7YFUzmixQqiMuJ+TJB0y9h3GI2mUmc/b0vd7f4AxjD7VwlKvA03DgcnQYGMj7K
 PeO0CoLfHGLKiCRiRfQnZWr1siVik0X/+ZUF+Xw3cW/GJ5n6Cvty+dr12XQomV4WqkGPaw
 YM76AO1VF+z8BD/8a7eJHPWt+CXm1+yprdnKdl9BQDscYYM5a9iW8Yi0XU/ESQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=MCeBaY4P;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768261651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=x9QnIHcy9lfGs1gQswZ4b0k66USbs6ylyNIYU06/No8=;
 b=MCeBaY4PsRtpJL155OyhsWGg0T8tQse+c0Zpq29ExPBwFpNKSZsY0eeI/dJOXhbjPicJij
 bS45LwDcZcIJQjFDkzUq4j4HQIRGlDauLMgqTbvOWIxS4ptIuE+9Zk2Ym7neyU+gCNWSUJ
 UkXWjtAfbU1jRFY0k9hAKTOPujukxvDmm8cJGYPJO8/2u2KmFgoGy/9wjn3hmZgrFkqCUF
 bdilDWl/RIlcF7nRHtLy63SupxNa1XbekaPYHQaxIUVyG+dLQxxy6uwFuqxuDgc4oiAjfG
 lbaQi1iG3WqnOks+lJBLFZv/Epn/CVY5QtaYi3Jics4oh/QbKkacJE/z1a8V6w==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/bridge: waveshare-dsi: Register and attach our DSI device
 at probe
Date: Tue, 13 Jan 2026 00:47:04 +0100
Message-ID: <20260112234726.226092-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 104cfbf733fd29d990d
X-MBO-RS-META: ha7yithpydmaw3hbf7dqxjypeexxkbf1
X-Rspamd-Queue-Id: 4dqpvn6Bpdz9spG
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

In order to avoid any probe ordering issue, the best practice is to move
the secondary MIPI-DSI device registration and attachment to the
MIPI-DSI host at probe time.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Note that this is similar to e.g. commit
6ef7ee48765f ("drm/bridge: sn65dsi83: Register and attach our DSI device at probe")
and pretty much what every other DSI-to-DPI bridge does.
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/bridge/waveshare-dsi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
index 43f4e7412d722..9254446f54958 100644
--- a/drivers/gpu/drm/bridge/waveshare-dsi.c
+++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
@@ -80,11 +80,6 @@ static int ws_bridge_bridge_attach(struct drm_bridge *bridge,
 				   enum drm_bridge_attach_flags flags)
 {
 	struct ws_bridge *ws = bridge_to_ws_bridge(bridge);
-	int ret;
-
-	ret = ws_bridge_attach_dsi(ws);
-	if (ret)
-		return ret;
 
 	return drm_bridge_attach(encoder, ws->next_bridge,
 				 &ws->bridge, flags);
@@ -179,7 +174,7 @@ static int ws_bridge_probe(struct i2c_client *i2c)
 	ws->bridge.of_node = dev->of_node;
 	devm_drm_bridge_add(dev, &ws->bridge);
 
-	return 0;
+	return ws_bridge_attach_dsi(ws);
 }
 
 static const struct of_device_id ws_bridge_of_ids[] = {
-- 
2.51.0

