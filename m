Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54438C612B9
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 11:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9500210E0CE;
	Sun, 16 Nov 2025 10:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RgJbXTWe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7C710E0F6
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 10:52:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6721044642;
 Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34B67C19423;
 Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763290345;
 bh=qsGCtEk6WzluqKeFoHg53wFve+N+m+ibvws3FvZDkSo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=RgJbXTWexVuwL2Vu5gnmNjlm74qLnYiN6zjgb7PjiBHmrQztPYZP/M1cJTG4yxRTp
 ae0FT3plzKexY1VewjUV7QYCmb18fwWo7lTndrAoxidfGppMYauaiVTy1VGmWVV2Kv
 C7OQHi+jbeHc8nfcX+POB8NY3deHzrmemJ/2fNQhLaTuuiPNk3GT+RsZgmO/TToe48
 r/Di//pwbS4iq4AoOIgIL3ApG5PCAYmVl7UdjYuq9iaj4sDc6NJ38cCe8Mwi0rwHyH
 TM0vM1hq6EjSESUBNulQ7/4m5kmdRrVv/wzZrTWrXmLnEYIEfRGoRieJTjXo+d/l3W
 NwP8pU31frtzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 2C15BCEBF61;
 Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 16 Nov 2025 11:52:07 +0100
Subject: [PATCH v2 2/6] drm/bridge: simple: add the Parade PS185HDM
 DP-to-HDMI bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-asus_usbc_dp-v2-2-cc8f51136c9f@hotmail.com>
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
In-Reply-To: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763290343; l=945;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=lOwUKlnZWvBGuZzv+yAV11vLtSXDOnT6l1naKVDPm98=;
 b=KeTmdssRRamJCQIgZoutDL6TdRGTm08erGUsWcT8KNW6xLav1onjBFM1b1bIsbAiVHgLhSv1r
 ZZjHf1fHA2LCclKfBO1GZd17K5lP4kjudM4pKsPe1+cwpjkkGpbUhnD
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
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
Reply-To: maud_spierings@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maud Spierings <maud_spierings@hotmail.com>

The Parade PS185HDM is a transparent Displayport to HDMI bridge.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index e4d0bc2200f8..90abda199cea 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -261,6 +261,11 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &default_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
 		},
+	}, {
+		.compatible = "parade,ps185hdm",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "radxa,ra620",
 		.data = &(const struct simple_bridge_info) {

-- 
2.51.2


