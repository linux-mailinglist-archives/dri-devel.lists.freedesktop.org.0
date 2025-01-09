Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69607A06E5B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 07:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5587A10E0CA;
	Thu,  9 Jan 2025 06:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gw2YQ2rN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5232A10E0CA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 06:39:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8FCB7A40433;
 Thu,  9 Jan 2025 06:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2319C4CED2;
 Thu,  9 Jan 2025 06:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736404782;
 bh=IAno5pKTx2K+AER7WFysKsBBPJnJbbX9HJm6cKM74eY=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=gw2YQ2rNL2I3qBaF4OwRxQBIUpHE0ab5tpcxqvkg69B6Gyj5VlSGrrDuv/5ZNf7NG
 Hp7o+29mYTsVSD+3oUAKQB2bzVMDSd/Xr1t+OUHQVZIVxJHEizVhQs3o0G44nV5kwd
 faUvx51PEioYMz4SpioSFNkdL7OxfdW9kFU0zmKlwDxeuGoVznd3VzP9JvXkhfywjb
 jsMnosYmlRjTLAb24JSmFrW3c0JNpOLfwLwdH7wRwxkWd135KdIiVtFeAgohYpfA0K
 lLn6i/HlbyxDGMLgnHx7WP+2T1913R6sAHmSWHk9XZB3FwcKophCq/+ooYjiESHz7b
 rgbWgZkE+uu4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A7637E77197;
 Thu,  9 Jan 2025 06:39:42 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Thu, 09 Jan 2025 14:40:08 +0800
Subject: [PATCH v3] drm/bridge: it6505: fix HDCP V match check is not
 performed correctly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-fix-hdcp-v-comp-v3-1-1258edb249ab@ite.com.tw>
X-B4-Tracking: v=1; b=H4sIAEdvf2cC/2XNTQ6CMBAF4KuQrh3SHxqKK+5hXNR2kC4E0pKqI
 dzdgcREw/LNvPlmYQljwMTOxcIi5pDCOFBQp4K53g53hOApM8ml5oLX0IUX9N5NkMGNjwnUzRp
 Uvra+U4yupohU2cXLlXIf0jzG9/4gi236tczBygIENBWvjBBGaufbMGNJq3J+sg3L8hdojoAko
 PYOudWNlqr7A9Z1/QBPq1XN8AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736404808; l=1793;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=ZQI2HqzPneYgfzuW3Jkd0no7yYlB8RqeAikI2gt6gAg=;
 b=Ww30Kk4kRj7A+HK87WjQj3bCC0NVLEq24nfdTnwIF3WeV9pLX7QWmKviUx06mpITJxWrKsI6c
 hnG372CyOL+B1dM3Cbj97HJt+tPmco+ecNlRHvUvwcdo+DqTxJt8Zj5
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
It should check loop counter reach the last statement "i == 5"
before return true

Fixes: 0989c02c7a5c ("drm/bridge: it6505: fix HDCP CTS compare V matching")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Changes in v3:
- The V value compare loop from i = 0 to i = 4 and shall exit with i == 5 
  if all V element matches
- Link to v2: https://lore.kernel.org/r/20250109-fix-hdcp-v-comp-v2-1-7dce0a59523f@ite.com.tw

Changes in v2:
- pull the check of statment "i" out of V value check loop 
- Link to v1: https://lore.kernel.org/r/20250108-fix-hdcp-v-comp-v1-1-9404811825cd@ite.com.tw
---
 drivers/gpu/drm/bridge/ite-it6505.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 88ef76a37fe6accacdd343839ff2569b31b18ceb..2f82fbc0b8bf8c322c088dc257720c6825651bb8 100644
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
+		if (i == 5) {
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


