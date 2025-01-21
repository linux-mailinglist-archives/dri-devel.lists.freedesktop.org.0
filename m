Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B619A177F5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 08:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6F910E4E1;
	Tue, 21 Jan 2025 07:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kgLdmUVe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58C910E4E1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 07:02:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F28545C5574;
 Tue, 21 Jan 2025 07:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2232CC4CEDF;
 Tue, 21 Jan 2025 07:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737442920;
 bh=Wn2iXU7nWwg+gmqoVND1k8Mrs/mrTenyjHWWjgn/L7I=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=kgLdmUVe4FDq/4nF/SspI8rnGKPrtuPhhqZdmfDkmQ4StjLM0RQj8t2PUi9xIybz+
 O6O6P2eZBlaMlr3HjY/nR1ATAbDwqMnUhJS5qy/ljsxdQrbvz492NXOEZ8IKZ5MTHG
 pYr1ueqsNCyY9B/niM4lPhBbCOlGEADI9Nt5SMTIyfYTbd4WjgKhwXxRs/eFGB+26R
 u0F7YeyV3Tc5NAKKDmJyevUVDZn4GP8kat0vHAFBxTk1+GMo7IR9Ut2DIXb3islQwE
 cH+IXIc75UkmaofTt7QXlQ5ZtQfwn9XgZUQS2Bzv5HGBlPKxIthCFYJVInQRauiLY4
 PDgRWb4cRcJWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0A31BC02182;
 Tue, 21 Jan 2025 07:02:00 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 21 Jan 2025 15:01:51 +0800
Subject: [PATCH v4] drm/bridge: it6505: fix HDCP V match check is not
 performed correctly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-fix-hdcp-v-comp-v4-1-185f45c728dc@ite.com.tw>
X-B4-Tracking: v=1; b=H4sIAF5Gj2cC/4XNQQ7CIBAF0KsY1tLAACm48h7GBYWpZWHbQIOap
 neXNjHRdOHyz/x5M5OEMWAip8NMIuaQwtCXII8H4jrb35AGXzIBBopxVtM2PGnn3UgzdcN9pKK
 xGoWvrW8FKVdjxFLZxMu15C6kaYiv7UHm6/Rj6Z2VOeXUSCY15xqU8+cwYVVW1fQgK5bhGzB7A
 ApQe4fMKqNAtDtA/AFEATgojb4BaWzzAyzL8gY27iWFMQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737442945; l=2084;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=dUqXlNgYAl2Ay3XuEGf25rTzX7c3cUgN/Ydq0aXRSw0=;
 b=nhbLadf23YE4qooMAxAUwjrpv7qAIZFRU5IYDckSVOaGDmJ7mdEbwcLIJhd4fRDiDwexc8PKJ
 IOu5RI71KYrAZUdYsCaaoksnZrYbLNnHp4cYAL1uz4AbJlG07knRRND
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

Fix a typo where V compare incorrectly compares av[] with av[] itself,
which can result in HDCP failure.

The loop of V compare is expected to iterate for 5 times
which compare V array form av[0][] to av[4][].
It should check loop counter reach the last statement "i == 5"
before return true

Fixes: 0989c02c7a5c ("drm/bridge: it6505: fix HDCP CTS compare V matching")
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Changes in v4:
- Fix a typo where V compare incorrectly compares av[] with av[] itself
- Link to v3: https://lore.kernel.org/r/20250109-fix-hdcp-v-comp-v3-1-1258edb249ab@ite.com.tw

Changes in v3:
- The V value compare loop from i = 0 to i = 4 and shall exit with i == 5 
  if all V element matches
- Link to v2: https://lore.kernel.org/r/20250109-fix-hdcp-v-comp-v2-1-7dce0a59523f@ite.com.tw

Changes in v2:
- pull the check of statment "i" out of V value check loop 
- Link to v1: https://lore.kernel.org/r/20250108-fix-hdcp-v-comp-v1-1-9404811825cd@ite.com.tw
---
 drivers/gpu/drm/bridge/ite-it6505.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 88ef76a37fe6accacdd343839ff2569b31b18ceb..76dabca04d0d191b3bdee23c6a3e55f4b6d3bad4 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2250,12 +2250,13 @@ static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
 			continue;
 		}
 
-		for (i = 0; i < 5; i++) {
+		for (i = 0; i < 5; i++)
 			if (bv[i][3] != av[i][0] || bv[i][2] != av[i][1] ||
-			    av[i][1] != av[i][2] || bv[i][0] != av[i][3])
+			    bv[i][1] != av[i][2] || bv[i][0] != av[i][3])
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


