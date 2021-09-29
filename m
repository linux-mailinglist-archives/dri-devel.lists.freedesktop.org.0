Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAF341CE51
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 23:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2526E288;
	Wed, 29 Sep 2021 21:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D8D6E288
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 21:41:59 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id h3so4079265pgb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 14:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=abMqKB2u9rMv7oTMhh3m+4tF/IOseMheczHvshPya7I=;
 b=m2TpfLPcLu9QNlpl9HdlKoBc8s1yHlw4a109KsDKLctrx7o8muqZD1eHvNnSMFttA4
 fG/Qr03uUF4rZlyD2y5we7iu/kBHcB7kAcgNqqFQxqqdqXM4LcSJU7E1Kk2EQDquxze3
 ukoem9hVnnoq3QW4dNuZ5rJ+R/K06pjADNQPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=abMqKB2u9rMv7oTMhh3m+4tF/IOseMheczHvshPya7I=;
 b=Dw6mHyKjw3ko1gFIpg8dVub0R9mcwZh9Qp8jPsm5NKmMF6mifwVvfU4Fmuhymsg9D2
 wnyWOSEJJ08bkY+HIWQne95iRIR4QTqKd2G1GzYGBo/kMM08QCxUKDIP034L0Bk991y2
 1A0ozdJomDlt3NbLD1f3HqVDwGYngnetaSBNFaDuRAVzg6V3hA1tFfDXMkankbdYH0er
 rC/tNhRlpXrQUhZc+z7JS7RRZBfLEFMSL6k8YZz1KQN+X1qGgvEsUa6SELmMF4rl1dj/
 x9THHYLrhq9B7v7OoBTiCDz7CQ4rku9ZJYO4tNP/qLEyOclHVV94pA6cvH65JV5iK4I9
 kt0A==
X-Gm-Message-State: AOAM532Yvdbt6xXAO0JVYgpkK+64QXG+AoxdVF4f58SmKVPGxICOGu1A
 BYuQw6tKAcNDqQe1vTNj3bcu0Q==
X-Google-Smtp-Source: ABdhPJz6ktUCSGWMztTH+AFVhmEQXYShJtqGc2SK/UWNTJBqVnMthbvvG3CKCGzYVePbkfPuK8YC7Q==
X-Received: by 2002:a63:1d5c:: with SMTP id d28mr1797415pgm.143.1632951718606; 
 Wed, 29 Sep 2021 14:41:58 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:1bde:f4ad:4338:e765])
 by smtp.gmail.com with UTF8SMTPSA id p9sm698691pfo.153.2021.09.29.14.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 14:41:57 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Brian Norris <briannorris@chromium.org>, stable@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] drm/brdige: analogix_dp: Grab runtime PM reference for DP-AUX
Date: Wed, 29 Sep 2021 14:41:03 -0700
Message-Id: <20210929144010.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
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

If the display is not enable()d, then we aren't holding a runtime PM
reference here. Thus, it's easy to accidentally cause a hang, if user
space is poking around at /dev/drm_dp_aux0 at the "wrong" time.

Let's get the panel and PM state right before trying to talk AUX.

Fixes: 0d97ad03f422 ("drm/bridge: analogix_dp: Remove duplicated code")
Cc: <stable@vger.kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 .../gpu/drm/bridge/analogix/analogix_dp_core.c  | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b7d2e4449cfa..a1b553904b85 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1632,8 +1632,23 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
 				       struct drm_dp_aux_msg *msg)
 {
 	struct analogix_dp_device *dp = to_dp(aux);
+	int ret, ret2;
 
-	return analogix_dp_transfer(dp, msg);
+	ret = analogix_dp_prepare_panel(dp, true, false);
+	if (ret) {
+		DRM_DEV_ERROR(dp->dev, "Failed to prepare panel (%d)\n", ret);
+		return ret;
+	}
+
+	pm_runtime_get_sync(dp->dev);
+	ret = analogix_dp_transfer(dp, msg);
+	pm_runtime_put(dp->dev);
+
+	ret2 = analogix_dp_prepare_panel(dp, false, false);
+	if (ret2)
+		DRM_DEV_ERROR(dp->dev, "Failed to unprepare panel (%d)\n", ret2);
+
+	return ret;
 }
 
 struct analogix_dp_device *
-- 
2.33.0.685.g46640cef36-goog

