Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7017BA06D16
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 05:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4757010ECDD;
	Thu,  9 Jan 2025 04:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XWlK5cjF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FFA10ECDD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 04:36:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 583855C555B;
 Thu,  9 Jan 2025 04:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0ED67C4CED2;
 Thu,  9 Jan 2025 04:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736397376;
 bh=gmwGfEvW8c1KEWfp2VObwEEegjNuvEx/+EDVZbG7+00=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=XWlK5cjFhPcpwioHw4fc1XycPYwXg+1NJUzM+vnjpJaytJL9mpbVu3b8OqMSp6CJo
 MTu7Wl1m9q+0FwE42VRbdcCFj8Gg8qAEpv9ne3SG8xHSiMsv8IMWciwnPAFhPnRq7z
 rLzVuw27UPK3r3Wf69RfHg8UkiKR0ts/LbIFnj20rH3NEsihZ7VZMGftZ8ENaizke3
 MkegC0HRGKFMirnafxnExNASXb+RSubLD/yVPgDEVs13Az7YrhqEwSlhls39lBsD1+
 EvR05en3YCjXM2HgC5vmbdYwL4bXrEQ6RzEhH8Fuvs2mlk+JnnxO7nJ64Q9vxrpvAZ
 xSH+n9gWnOKrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 00B8BE77197;
 Thu,  9 Jan 2025 04:36:16 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Thu, 09 Jan 2025 12:36:23 +0800
Subject: [PATCH v2] drm/bridge: it6505: fix HDCP V match check is not
 performed correctly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-fix-hdcp-v-comp-v2-1-7dce0a59523f@ite.com.tw>
X-B4-Tracking: v=1; b=H4sIAEZSf2cC/2WNQQ6CMBBFr0Jm7ZC2QKiuuIdhge1gZyGQtqka0
 rtbSVy5fH/+f7NDIM8U4FLt4Clx4HUpoE4VGDctd0K2hUEJ1Qkpepz5hc6aDROa9bFhc5s0Nba
 f7NxAWW2eSuUwXsfCjkNc/ft4kOQ3/bn0nytJlHhuRaul1KozduBIdTnV8QljzvkDS2x+qK8AA
 AA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736397401; l=1566;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=EkBgkfoeDLP1LIGeFj8kxcbiBg0jOTcKAZtPNxZo1Us=;
 b=2HjXDrMwWjjLJAL2u6vN+KktIl36gJRFDbsZLDXC5MrIazjNtqvRI7OAbrmI3+uib0fX/h8fW
 XIFreCRFdgLD9/jGcQMmSyNQbzL9FLGzC3j+WuUq4GoDzoCMn5ACErj
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Changes in v2:
- pull the check of statment "i" out of V value check loop 
- Link to v1: https://lore.kernel.org/r/20250108-fix-hdcp-v-comp-v1-1-9404811825cd@ite.com.tw
---
 drivers/gpu/drm/bridge/ite-it6505.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 88ef76a37fe6accacdd343839ff2569b31b18ceb..a7c33270a2b75d7c8ab85f6165b367a7c1a364a3 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2250,12 +2250,13 @@ static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
 			continue;
 		}
 
-		for (i = 0; i < 5; i++) {
+		for (i = 0; i < 5; i++)
 			if (bv[i][3] != av[i][0] || bv[i][2] != av[i][1] ||
 			    av[i][1] != av[i][2] || bv[i][0] != av[i][3])
 				break;
 
-			DRM_DEV_DEBUG_DRIVER(dev, "V' all match!! %d, %d", retry, i);
+		if (i == 4) {
+			DRM_DEV_DEBUG_DRIVER(dev, "V' all match!! %d", retry);
 			return true;
 		}
 	}

---
base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
change-id: 20250107-fix-hdcp-v-comp-3ba8e3d7adf3

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


