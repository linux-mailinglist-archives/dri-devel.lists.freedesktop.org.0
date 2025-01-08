Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53B2A052BB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 06:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF1E10E355;
	Wed,  8 Jan 2025 05:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J+XM6SGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E1210E355
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 05:44:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0E8495C3F39;
 Wed,  8 Jan 2025 05:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C10F6C4CED0;
 Wed,  8 Jan 2025 05:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736315090;
 bh=H8TKNe72LwwgTZTKmN5zb4MNiboPv8kWdjIP8rOTDOU=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=J+XM6SGgTZkO+9w8ZU9/zOEAnjXWMn96BuQM5ldBf4nEuLZ71ubbl8mB44WZIb+xQ
 nkdwkgRhxnL+ecHGAiPNKacmBq/MHdS6kSr3+dYnlb7OxF1SRcj37L9ZQ5BNeNULya
 E4J3iS7Ir0ol1Zyblk0d0nfnBsSpSVM0Q2Ud4WEIRclT08G/N9xdujtL2jmiHsV4Xw
 M/Snydl/FBGN63jkEyrytjjVsiIspBGc4XWCu4j63HgWWjZBOoNDXwlRrCTjw0kO8Z
 35xzeNkYuBvlmuS28ohU6FdbUNMfVyhL6D4rm9kAXG//iiiIYh8hUHbM3o7yhs8up4
 eK4XhnBwJqefQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A90F4E77199;
 Wed,  8 Jan 2025 05:44:50 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 08 Jan 2025 13:45:14 +0800
Subject: [PATCH] drm/bridge: it6505: fix HDCP V match check is not
 performed correctly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-fix-hdcp-v-comp-v1-1-9404811825cd@ite.com.tw>
X-B4-Tracking: v=1; b=H4sIAOkQfmcC/x2MQQqAIBAAvyJ7bkGTMPpKdDBdcw+VKEQg/j3pO
 DAzFQplpgKLqJDp4cL31UENAly010HIvjOMcpykkgYDvxi9S/igu8+EerczaW+sDxp6lTJ15T+
 uW2sfDVAWQWEAAAA=
X-Change-ID: 20250107-fix-hdcp-v-comp-3ba8e3d7adf3
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Hermes Wu <hermes.wu@ite.com.tw>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736315115; l=1308;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=dyqbMaHoVsNvXn2a4OvVKxfPmk0+fIgLG5w+5YquGSw=;
 b=EGl+6seblMN/cphHfmfQmu8+zLNtcMleHGGC73U98PAlFWJbhZUhbWi9bnXbkwWE+NLl4YJxE
 nThd4mrPDQCBAQTS5xdVBUtJist3GUlzl19zpwb1gmXlkAPnpSP6fwt
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
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

From: Hermes Wu <Hermes.wu@ite.com.tw>

The loop of V compare is expected to iterate for 5 times
which compare V array form av[0][] to av[4][].
It should check loop counter reach the last statement before return true

Fixes: 0989c02c7a5c ("drm/bridge: it6505: fix HDCP CTS compare V matching")

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 88ef76a37fe6accacdd343839ff2569b31b18ceb..e87247aea1d2ffbdad192e241056d34fdfb32163 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2254,9 +2254,12 @@ static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
 			if (bv[i][3] != av[i][0] || bv[i][2] != av[i][1] ||
 			    av[i][1] != av[i][2] || bv[i][0] != av[i][3])
 				break;
-
-			DRM_DEV_DEBUG_DRIVER(dev, "V' all match!! %d, %d", retry, i);
-			return true;
+			if (i == 4) {
+				DRM_DEV_DEBUG_DRIVER(dev,
+						     "V' all match!! %d",
+						     retry);
+				return true;
+			}
 		}
 	}
 

---
base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
change-id: 20250107-fix-hdcp-v-comp-3ba8e3d7adf3

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


