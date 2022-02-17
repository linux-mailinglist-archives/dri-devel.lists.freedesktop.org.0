Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5A04BACD1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 23:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D3910E88B;
	Thu, 17 Feb 2022 22:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5E810E88B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 22:42:06 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id 75so6242779pgb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 14:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/pFhxh4a1mIJWKVvwWf0TWI0PzyzDNvxgd8MaYxtB4g=;
 b=DRjZUlF38aKhKGF1HEEXpShz5dNW4rV1EZ3PJsdeXyBLxzGJJMj2+9g6pi+MiKGhYt
 H+9E29WZ8V4Np9zsahnlGJmkvOu6FMFXZxC9SU+qF5bJdkcsbldinSAPqonRI6Ftb1Dz
 YKCtyN3JvqpZZ/nc5796hnay3gO0nfEdVSefs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/pFhxh4a1mIJWKVvwWf0TWI0PzyzDNvxgd8MaYxtB4g=;
 b=TWZjpDIrrNqy5eR/dYAkz+dWnQYR9y3F/HgO45Q4IirPTinlx7LMXBlGV16hs03rQV
 FVy3VZlV1oYZd+2DN3HQnUpysNtpXRXEE+/+2NuVftKKYirHqwkHJqPXTZhGjYhvdIk9
 hy9aPSWY5Sb1OELE8Uh2ih0nHW5bFvUlz47kKB7q0iyaFsWTWu32yBwggQ2NZDPMvclg
 IdcQIJvTe1eqkkcgykkdgXv6jStXytlIlZDT/R6jr3YLOSbKQzQnKByPhQYhuGOpYPZT
 XsWriyRH/lY9oOdSgFkSQT1xp92A/BuiDQM2VlXBPUF1ULTQXYAOZTskkMwQL+X8oZnl
 4vOA==
X-Gm-Message-State: AOAM533LFmCUDJ7tUaXYEhMS8ENKIUKasm3TjBrzu31DNH1I36XZSSlr
 5kWjVkR+0FAuXTyhDmXH93iaag==
X-Google-Smtp-Source: ABdhPJx0I/9dms8bGvA0MQ9aczlCf/u6f2qI/Tw9lU7d6SMBvt5gmujVGb3LwnbbS//bPCI4KYGOjg==
X-Received: by 2002:aa7:83c2:0:b0:4e0:91c1:6795 with SMTP id
 j2-20020aa783c2000000b004e091c16795mr4885484pfn.54.1645137726160; 
 Thu, 17 Feb 2022 14:42:06 -0800 (PST)
Received: from localhost ([2620:15c:202:201:677e:1914:4c14:1662])
 by smtp.gmail.com with UTF8SMTPSA id u1sm628435pfg.151.2022.02.17.14.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 14:42:05 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 1/2] drm/bridge: analogix_dp: Grab runtime PM reference for
 DP-AUX
Date: Thu, 17 Feb 2022 14:41:45 -0800
Message-Id: <20220217144136.v3.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
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
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Doug Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
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
---

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
2.35.1.265.g69c8d7142f-goog

