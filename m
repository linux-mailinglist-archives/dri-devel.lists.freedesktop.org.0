Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29493866D6A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 10:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D881A10EF94;
	Mon, 26 Feb 2024 09:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="ajxHPNc+";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="SYY/3zp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B22510EF91
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1708938076; x=1740474076;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1dfSttFAckwOQAmC1ve5LgiPNLJsHK4JP7XZDTkYNuA=;
 b=ajxHPNc+6Xn1Cwr/XwbSVl+4OIDCcl2KNi9VZw5HCMNUT8rqNiXKLiZl
 z1KmGmPcYJSv3XcKgnthDo/m/sFxvZGDR4UKGn8q9vJU5Q3szJq6QMVZZ
 RMhj1HtCsA6QvrwKVErJv7YzyeB2gaUTwjXMENct+3rox/g+ovbYllVo9
 KvJz3aun8tZAAzegJXkIS48C8CWKBzXpOwU1wrWPkCzuIJlJu+xl7lkNV
 ujU27taj3QFzXdvOlUVnfb7+cifPDE3AonaxpTqvPVaD9lElQVvZlTMld
 ZGjn0/deXBGim7n35O8Py3VWT4QF/VV3R1OKmxYOZFjxvVqMogaKjHsqd A==;
X-IronPort-AV: E=Sophos;i="6.06,185,1705359600"; d="scan'208";a="35589021"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 26 Feb 2024 10:01:13 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 08F11161427; Mon, 26 Feb 2024 10:01:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1708938069; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=1dfSttFAckwOQAmC1ve5LgiPNLJsHK4JP7XZDTkYNuA=;
 b=SYY/3zp7x8QiKOHJcB7rCv+tbl44IANZ19yC++/0yXIFGaNJht1DExfMIudv0YEJsgcTBc
 1zVxrLvigteiBy5ovJvSZSqeuHsKgd27UHkG2IAcVwUliifs7Q/UfP9AlrNxJPzNztl6bc
 m4s/ZKYvK2zchPUylpzkp0C4Vou/1c8o3+UNw/RXixLWXqV94Zo58VjhQqKA1FzC1PqB9X
 ntxhnIWtwK3aUe+CER7IZAw0eaK9ByEilq9Feowl+oDBFdh1/29P+65MPGqDF2LwD2/win
 WKNPk48agcvc9+H9npwk5nSDFu3IKjdKCZbqqXT0e2AxwJ4cvbPK9PJU7b9ULA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/1] drm/bridge: Silence error messages upon probe deferral
Date: Mon, 26 Feb 2024 09:59:18 +0100
Message-Id: <20240226085918.264205-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

When -EPROBE_DEFER is returned do not raise an error, but silently return
this error instead. Fixes error like this:
[drm:drm_bridge_attach] *ERROR* failed to attach bridge
  /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517
[drm:drm_bridge_attach] *ERROR* failed to attach bridge
  /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
---
Changes in v3:
* Adjust the indentation
* Proper line breaks in commit messages

 drivers/gpu/drm/drm_bridge.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 521a71c61b164..08b474d82c9fc 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -353,13 +353,15 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	bridge->encoder = NULL;
 	list_del(&bridge->chain_node);
 
+	if (ret != -EPROBE_DEFER) {
 #ifdef CONFIG_OF
-	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
-		  bridge->of_node, encoder->name, ret);
+		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
+			  bridge->of_node, encoder->name, ret);
 #else
-	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
-		  encoder->name, ret);
+		DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
+			  encoder->name, ret);
 #endif
+	}
 
 	return ret;
 }
-- 
2.34.1

