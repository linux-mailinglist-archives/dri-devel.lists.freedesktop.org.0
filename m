Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B51787DB59
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 20:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0E810FAA7;
	Sat, 16 Mar 2024 19:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="D9DxHyYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr
 [80.12.242.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8659710FAA7
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 19:51:29 +0000 (UTC)
Received: from fedora.home ([92.140.202.140]) by smtp.orange.fr with ESMTPA
 id la3vrEPOXk8gIla3vrpUVD; Sat, 16 Mar 2024 20:51:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1710618687;
 bh=SjbNtOBQ+cS5fJj7smJylRnTlii80ZoATXXlQUbJZNQ=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=D9DxHyYrkaOm5kE1mLlkXYRjXycXxsTBWVhnZ8Z9aVjjq+D6t1RBVaxow3EeogIP5
 IM8Xv/gAhp/8W0xITHPIPKeeeMDDP1e2QqRPDB90yamocgV2NaU+1sN+IooU3WZJv/
 5OjbTL/v2Y9NagH5qxNgBXRLe0a5NPm+eb8SyBwWD+YvsW2IR9Dh2pz4BmvkBixD+/
 G8a4e+q30hS8hVo+0UJJ4APTF0fifdeurMlzzvjpN87gJzeWJBFvwZASjlRzKyC1Wk
 uOj5Aufzu3x9taZdnIWltPU9E9HRp5PihX25hIsMzVEWvPGp2L/4MSHZGgsplBKvci
 t72o/8I9nifHw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 16 Mar 2024 20:51:27 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: lt9611uxc: Fix an error handling path in
 lt9611uxc_probe()
Date: Sat, 16 Mar 2024 20:51:21 +0100
Message-ID: <e09122722190d052cee792a9246c274510f3b928.1710618660.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If lt9611uxc_audio_init() fails, some resources still need to be released
before returning the error code.

Use the existing error handling path.

Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index f4f593ad8f79..d0c77630a2f9 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -965,7 +965,11 @@ static int lt9611uxc_probe(struct i2c_client *client)
 		}
 	}
 
-	return lt9611uxc_audio_init(dev, lt9611uxc);
+	ret = lt9611uxc_audio_init(dev, lt9611uxc);
+	if (ret)
+		goto err_remove_bridge;
+
+	return 0;
 
 err_remove_bridge:
 	free_irq(client->irq, lt9611uxc);
-- 
2.44.0

