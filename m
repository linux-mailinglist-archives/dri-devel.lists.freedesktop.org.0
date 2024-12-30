Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0475D9FE573
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 11:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5255610E100;
	Mon, 30 Dec 2024 10:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bW1xoArp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF53110E491
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 10:51:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A371CA40C21;
 Mon, 30 Dec 2024 10:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4F31C4CED0;
 Mon, 30 Dec 2024 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735555861;
 bh=Zl6JqppBNbMmE/iNTWjkyJ9wCrCrJmqXcVDW5n1uzUE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=bW1xoArpyPevgQS7B42MvberX0vBlmS8mheBivXpy4aoBp/Ms8UV7rbZIFOGroy7Y
 zy70R6OTe441XXwaWNhyEJmeAKrxtza1Utzw0GXsZ+I5bV+Vww7/1vZP8uPf3WAp7T
 2B4ZLHfdjDvwMmLF4SPxaZ6kkD/RvN4lECz2SGWFMkEv2eQefDYOPd0CAa7maakeMx
 r9MaU3Gdir3O4cbjLZImsllxkrNpFaCMvPNPqeSgu+GibyBjhfE5ldmKL3gZBsN7g+
 HVsG4J/cZNBIy/6mMPMkifKTchJUUastCNJi27ftx41G6QPK8asAc4eucjZnhS5in6
 q2BvE9do88YHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A918DE7718F;
 Mon, 30 Dec 2024 10:51:01 +0000 (UTC)
From: Hermes Wu via B4 Relay
 <devnull+Hermes.wu.ite.corp-partner.google.com@kernel.org>
Date: Mon, 30 Dec 2024 18:51:26 +0800
Subject: [PATCH RESEND v7 08/10] drm/bridge: it6505: fix HDCP CTS compare V
 matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-v7-upstream-v7-8-e0fdd4844703@ite.corp-partner.google.com>
References: <20241230-v7-upstream-v7-0-e0fdd4844703@ite.corp-partner.google.com>
In-Reply-To: <20241230-v7-upstream-v7-0-e0fdd4844703@ite.corp-partner.google.com>
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
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735555881; l=2090;
 i=Hermes.wu@ite.corp-partner.google.com; s=20241230;
 h=from:subject:message-id;
 bh=ZSAKlMN3TX9Z+Nap4xZYSRAsF5UPHncEdZ0YN4lKi7Q=;
 b=WuRbK6hOZmf6izaD3T8mR5orAibOS2VZShKTA/6ppdVymvVLra0zvNnxMgb35Ovu0ic2NbecA
 pG0iwvyjigkBk2b/L4GUosRGvlI2CJoND0H8NVf9sO5ZeR900b4wOG2
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

From: Hermes Wu <Hermes.wu@ite.com.tw>

When HDCP negotiation with a repeater device.
Checking SHA V' matching must retry 3 times before restarting HDCP.

Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 4ed4899227602a4574a13ffa22442dcc4a5c2092..2b8f208d1e17eebe3287ab0aa71180176dd0574e 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2058,7 +2058,7 @@ static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
 {
 	struct device *dev = it6505->dev;
 	u8 av[5][4], bv[5][4];
-	int i, err;
+	int i, err, retry;
 
 	i = it6505_setup_sha1_input(it6505, it6505->sha1_input);
 	if (i <= 0) {
@@ -2067,22 +2067,28 @@ static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
 	}
 
 	it6505_sha1_digest(it6505, it6505->sha1_input, i, (u8 *)av);
+	/*1B-05 V' must retry 3 times */
+	for (retry = 0; retry < 3; retry++) {
+		err = it6505_get_dpcd(it6505, DP_AUX_HDCP_V_PRIME(0), (u8 *)bv,
+				      sizeof(bv));
 
-	err = it6505_get_dpcd(it6505, DP_AUX_HDCP_V_PRIME(0), (u8 *)bv,
-			      sizeof(bv));
+		if (err < 0) {
+			dev_err(dev, "Read V' value Fail %d", retry);
+			continue;
+		}
 
-	if (err < 0) {
-		dev_err(dev, "Read V' value Fail");
-		return false;
-	}
+		for (i = 0; i < 5; i++) {
+			if (bv[i][3] != av[i][0] || bv[i][2] != av[i][1] ||
+			    av[i][1] != av[i][2] || bv[i][0] != av[i][3])
+				break;
 
-	for (i = 0; i < 5; i++)
-		if (bv[i][3] != av[i][0] || bv[i][2] != av[i][1] ||
-		    bv[i][1] != av[i][2] || bv[i][0] != av[i][3])
-			return false;
+			DRM_DEV_DEBUG_DRIVER(dev, "V' all match!! %d, %d", retry, i);
+			return true;
+		}
+	}
 
-	DRM_DEV_DEBUG_DRIVER(dev, "V' all match!!");
-	return true;
+	DRM_DEV_DEBUG_DRIVER(dev, "V' NOT match!! %d", retry);
+	return false;
 }
 
 static void it6505_hdcp_wait_ksv_list(struct work_struct *work)

-- 
2.34.1


