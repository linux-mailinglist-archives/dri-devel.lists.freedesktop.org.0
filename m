Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685749FC140
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 19:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CA610E492;
	Tue, 24 Dec 2024 18:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QRIeVJGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DD910E492
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 18:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1735064579;
 bh=8Jjsz71p+pO8R2vGeUCl3K9s4kVlr0+rbkAwH2pfcyw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QRIeVJGgbTqmETgLxMj53o2T/6zEBeKO/gt3vvKujzDRDQY8PiHCmUVPTotOjXnwi
 /oUzBSgJtiOM3xsXnUOAoYi9mH6l5Fhe4zseJSCcZwi9x5fAcOJrqFxCbBYhmIa1UL
 UR/XqMWK2sAtZGo2fgO5PIiPm77CX6vkeE6wu7zK0t8k78BSkEcIjQydDg4Cp1Obgr
 gWSeO0JwPW7IdhSvgU7dnDUEfhez9unl2cR9/V3hDuvgqbK6Vu5iKIKT6YRZfx0wiG
 MbA30O1Ot78vVALYN9ohfHWzNLK2cvx7WY8SnEr8VDCDBZ8dKwLCmLxL+LaaRMXfJC
 KgIe+z53WDDOA==
Received: from localhost (unknown [84.232.140.38])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EF73B17E15AF;
 Tue, 24 Dec 2024 19:22:58 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 24 Dec 2024 20:22:41 +0200
Subject: [PATCH v4 1/4] drm/bridge: Prioritize supported_formats over
 ycbcr_420_allowed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-bridge-conn-fmt-prio-v4-1-a9ceb5671379@collabora.com>
References: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
In-Reply-To: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

Bridges having DRM_BRIDGE_OP_HDMI set in their ->ops are supposed to
rely on the ->supported_formats bitmask to advertise the permitted
colorspaces, including HDMI_COLORSPACE_YUV420.

However, a new flag ->ycbcr_420_allowed has been recently introduced,
which brings the necessity to require redundant and potentially
inconsistent information to be provided on HDMI bridges initialization.

Adjust ->ycbcr_420_allowed for HDMI bridges according to
->supported_formats, right before adding them to the global bridge list.
This keeps the initialization process straightforward and unambiguous,
thereby preventing any further confusion.

Fixes: 3ced1c687512 ("drm/display: bridge_connector: handle ycbcr_420_allowed")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c6af46dd02bfa9e15b59e4c460debdd7fd84be44..241a384ebce39b4a3db58c208af27960904fc662 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -207,6 +207,10 @@ void drm_bridge_add(struct drm_bridge *bridge)
 {
 	mutex_init(&bridge->hpd_mutex);
 
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
+		bridge->ycbcr_420_allowed = !!(bridge->supported_formats &
+					       BIT(HDMI_COLORSPACE_YUV420));
+
 	mutex_lock(&bridge_lock);
 	list_add_tail(&bridge->list, &bridge_list);
 	mutex_unlock(&bridge_lock);

-- 
2.47.0

