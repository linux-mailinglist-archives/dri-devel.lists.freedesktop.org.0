Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014EA4C9B09
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 03:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B6010E1D0;
	Wed,  2 Mar 2022 02:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A099A10E1D0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 02:11:50 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 z2-20020a17090a6d0200b001bef22367dbso1137235pjj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 18:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F209WZI5vXfOkAuKwi/GeBW/6ePfEyIdvCWtsBXsuzo=;
 b=iu79tfZfv3syKE43Jc12ubc5bbfcm39Ba+iZqiH3YF6xx2VPj3Kue+5S3kBvepBO5q
 kdqhPnMePsk0a9w8OIsw9SA9VZIf2pxacttjWVOEkepKtTZDlhYIL9v+fhG0XVWGlEwh
 Se8dU2iquV0Zmid8y13HZf9VaAMALn+8EStJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F209WZI5vXfOkAuKwi/GeBW/6ePfEyIdvCWtsBXsuzo=;
 b=6MB+2Uyp//jJh3m2SHuYqc9FXoyFy5JU5gnA70egpPKScSnSM40kvGQZdXAGNli766
 wdgzKxMl33X1h9FAn+0ZT2ILN0GbsMuJgBn2bNKt/XR+EDFW3yUycj2be+qFP3i/40lY
 neXqIi941IXUayUvX52gtZcg2ggtzNSSMtd5NSvurp04QL6f6PyV2wCqBL5R3QKceICi
 6yL6KpfylQwLlwrAfWsV3IN310vl6dslAd7rorMIrjFwOBF0nEXTCaF9jrvZug2n4nvk
 j0GyH/0cTP8aqURzS8P8AdFU6DM2PaiYDW+NgapzvnnQB1NI8fuqAP82nxu+p+ClTppr
 8xXA==
X-Gm-Message-State: AOAM533ttFhtgoK5buG9SNzv/ALk8QHd52YgmikxMJDNXtZRIKMjExuK
 s0KZt6fHSSvBWl5yu7mpfmB/lw==
X-Google-Smtp-Source: ABdhPJwkV2kz8kBnK1WvzDVCNJRbzW5x17kwBoiaU5GguV6QDiHBp0jHTeZkBJ3WlYzD/yEyKxFkhQ==
X-Received: by 2002:a17:90a:4609:b0:1bc:f41e:5390 with SMTP id
 w9-20020a17090a460900b001bcf41e5390mr23827824pjg.27.1646187110276; 
 Tue, 01 Mar 2022 18:11:50 -0800 (PST)
Received: from localhost ([2620:15c:202:201:ddf3:7c12:38c:3c61])
 by smtp.gmail.com with UTF8SMTPSA id
 f15-20020a056a0022cf00b004f3b99a6c43sm18651207pfj.219.2022.03.01.18.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 18:11:49 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v4 1/2] drm/bridge: analogix_dp: Grab runtime PM reference for
 DP-AUX
Date: Tue,  1 Mar 2022 18:11:38 -0800
Message-Id: <20220301181107.v4.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 Brian Norris <briannorris@chromium.org>, Doug Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the display is not enable()d, then we aren't holding a runtime PM
reference here. Thus, it's easy to accidentally cause a hang, if user
space is poking around at /dev/drm_dp_aux0 at the "wrong" time.

Let's get a runtime PM reference, and check that we "see" the panel.
Don't force any panel power-up, etc., because that can be intrusive, and
that's not what other drivers do (see
drivers/gpu/drm/bridge/ti-sn65dsi86.c and
drivers/gpu/drm/bridge/parade-ps8640.c.)

Fixes: 0d97ad03f422 ("drm/bridge: analogix_dp: Remove duplicated code")
Cc: <stable@vger.kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Signed-off-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Add Doug's Reviewed-by

Changes in v3:
- Avoid panel power-up; just check for HPD state, and let the rest
  happen "as-is" (e.g., time out, if the caller hasn't prepared things
  properly)

Changes in v2:
- Fix spelling in Subject
- DRM_DEV_ERROR() -> drm_err()
- Propagate errors from un-analogix_dp_prepare_panel()

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b7d2e4449cfa..16be279aed2c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1632,8 +1632,19 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
 				       struct drm_dp_aux_msg *msg)
 {
 	struct analogix_dp_device *dp = to_dp(aux);
+	int ret;
+
+	pm_runtime_get_sync(dp->dev);
+
+	ret = analogix_dp_detect_hpd(dp);
+	if (ret)
+		goto out;
 
-	return analogix_dp_transfer(dp, msg);
+	ret = analogix_dp_transfer(dp, msg);
+out:
+	pm_runtime_put(dp->dev);
+
+	return ret;
 }
 
 struct analogix_dp_device *
-- 
2.35.1.574.g5d30c73bfb-goog

