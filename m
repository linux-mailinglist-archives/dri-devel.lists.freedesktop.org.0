Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D7E8FC07A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C36E10E643;
	Wed,  5 Jun 2024 00:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UeXEFVQc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D1A10E640
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:44 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-702555eb23bso3060602b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547083; x=1718151883;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sysQzdwXJkfbSDELyE+0q9H4w1SnddVJlaF6DxjB+qk=;
 b=UeXEFVQchXAqBy3QtpzK0DOuC/O+ce5xQnJd4e0MUiy4U5RGBGgkX6UJIVnozykPhq
 nZPtFCRE9OK/kxbmpNrtmy0LiCJJCl1kQaPAeyCWgcbs7Iz3BFzrF6QJT9tAl9FGVG1p
 MvZLUwDbfru2AYzJ6Yovfo4lo4sv14OJi1e10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547083; x=1718151883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sysQzdwXJkfbSDELyE+0q9H4w1SnddVJlaF6DxjB+qk=;
 b=scs91ZoolBE0z9RbgpARsawLGl8nNIzqfPYOSzvk3DNEnRj/E9a1+fKe+81zjUq2ss
 Pa/M6zd76bAgtpAUz6NchKweyygM2GNQoBMDWKqRkcESbFwhcc0Kg5QUKadLP/9UVQCe
 rrqHwXesMs6WPeKlN+aV+f/DRlLDNGyxDi5G8EdF6ahVVqt6sP5vp/COkmuyCLUlTAGv
 BwA4fMsKprpXRPCFOxiZXq/o4CP1ngZlPRjfvmcNx6D4+zw0mVWR43xnJLnZ6vEf6WG4
 DyVghZNYnpnguJG5HQjRVuaZ9YPTMdxpq3qBNlLxwLhNyFzIMzljNP5rBzLCeXntNt20
 7uqQ==
X-Gm-Message-State: AOJu0YzEJ20jf+zjPJpuYdjDdBZfX0ojuuqiRJWSi7Nj5KapgRLjBbWB
 +pBpQKdpT7w+8K/k2SUfLnRItehS7y5akFRKogpvsRuTY280HaY4KznFFMP0lIISeRHlOM8vkiU
 =
X-Google-Smtp-Source: AGHT+IHwO5H/zzgdm51Mput5e8kDxkReWlPt+ysnTlv9tYtyUriDJs0DOGcaXJK8sR0lU669dWg0YA==
X-Received: by 2002:a05:6a21:6da9:b0:1af:a37e:367e with SMTP id
 adf61e73a8af0-1b2b6f81145mr1642375637.15.1717547082896; 
 Tue, 04 Jun 2024 17:24:42 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/24] drm/panel: panasonic-vvx10f034n00: Don't call
 disable at shutdown/remove
Date: Tue,  4 Jun 2024 17:23:00 -0700
Message-ID: <20240604172305.v3.14.I1562c864ee35a9c166765488c95104b7e4e562da@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
References: <20240605002401.2848541-1-dianders@chromium.org>
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

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

Unfortunately, grepping mainline for this panel's compatible string
shows no hits, so we can't be 100% sure if the DRM modeset driver used
with this panel has been fixed. If it is found that the DRM modeset
driver hasn't been fixed then this patch could be temporarily reverted
until it is.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Werner Johansson <werner.johansson@sonymobile.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 822ca2f971eb..d1c5c9bc3c56 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -222,10 +222,6 @@ static void wuxga_nt_panel_remove(struct mipi_dsi_device *dsi)
 	struct wuxga_nt_panel *wuxga_nt = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = drm_panel_disable(&wuxga_nt->base);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
@@ -233,13 +229,6 @@ static void wuxga_nt_panel_remove(struct mipi_dsi_device *dsi)
 	wuxga_nt_panel_del(wuxga_nt);
 }
 
-static void wuxga_nt_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct wuxga_nt_panel *wuxga_nt = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&wuxga_nt->base);
-}
-
 static struct mipi_dsi_driver wuxga_nt_panel_driver = {
 	.driver = {
 		.name = "panel-panasonic-vvx10f034n00",
@@ -247,7 +236,6 @@ static struct mipi_dsi_driver wuxga_nt_panel_driver = {
 	},
 	.probe = wuxga_nt_panel_probe,
 	.remove = wuxga_nt_panel_remove,
-	.shutdown = wuxga_nt_panel_shutdown,
 };
 module_mipi_dsi_driver(wuxga_nt_panel_driver);
 
-- 
2.45.1.288.g0e0cd299f1-goog

