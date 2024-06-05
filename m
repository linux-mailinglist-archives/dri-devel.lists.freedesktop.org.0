Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9161B8FC06D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3DC10E627;
	Wed,  5 Jun 2024 00:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WhIF0vo4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8078E10E627
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:21 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1f4a5344ec7so2936805ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547060; x=1718151860;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zGL1XAJY8XhKpAWsqPFbzgWXo/pkMzXKNmiwvtJp4Hk=;
 b=WhIF0vo4553MAItkLC2RZAheyWcfpPJv2dVg/8lneM2n3kNy2FzjQOCF6y1MTHWFcQ
 Vr2B1wmfUBvV1AEVxqGzst8z8jDuUgulMLiS9GalJp/Fa8nhIIZg9/OSorN8iJUn+kqY
 fn7O7v2HFiCd6t63Vw6XhoQa4yext+vjs7SHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547060; x=1718151860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zGL1XAJY8XhKpAWsqPFbzgWXo/pkMzXKNmiwvtJp4Hk=;
 b=AWES7+JFSbly+LIUDCtrP14ot8IMsfKIt8viBvnUsN7crCkY5co5MVUSDOlhq6Sq9i
 ySMipoCDJVPMy8jQ7e9+HmIneG7FKjbsXyanm1LaXSRJPuXTeOtGcUwSV2+rbASyra8v
 tgTjqmGpn9a9XYJHXQD7OaeG0rFmrvUGfriDpXBUrZYUM5r/71s7shEKKOjGFT8uF6fR
 eFj7DpyOR9eA08WNE+eRdp8qFecLlkGMt3HdD9dkdN3Mvr1Oy5iKrJBuR+rwo8qRgPi/
 1cCAIy13wyIptLgnwJkxWTAK1vB6rM5yBiQjhANUNj20Wp89yPa9j7UoPgK+rRhqyjqh
 oBAA==
X-Gm-Message-State: AOJu0YyEThS+BMBbEJsw78jUlQPucBOPj9o7AddLBh6kNguolNAs8rc5
 nRtQGF5Xd/8rbgKm6F+1Nh5+ReLe4UdShS+kRjLrtfCf1c9BXnlbjxpwLefYgb2yZaMa8ts/z0E
 =
X-Google-Smtp-Source: AGHT+IHoXvg8VOvFaoaofPi1Wy0+ieuiJmAHAvk6TPPRDaDW+DtShADzHcHhWak9Q2qUznFX99fpfQ==
X-Received: by 2002:a17:903:1ca:b0:1f4:8a31:5a4c with SMTP id
 d9443c01a7336-1f6a56ebf71mr12680595ad.24.1717547060328; 
 Tue, 04 Jun 2024 17:24:20 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:19 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jacobe Zang <jacobe.zang@wesion.com>, Nicolas Belin <nbelin@baylibre.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/24] drm/panel: khadas-ts050: Don't call
 unprepare+disable at shutdown/remove
Date: Tue,  4 Jun 2024 17:22:50 -0700
Message-ID: <20240604172305.v3.4.I1ee65e7905bf5bf46a0e6c5126ac3c7aa25cb80b@changeid>
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

Cc: Jacobe Zang <jacobe.zang@wesion.com>
Cc: Nicolas Belin <nbelin@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-khadas-ts050.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index e35762ebdbd1..14932cb3defc 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -880,16 +880,6 @@ static void khadas_ts050_panel_remove(struct mipi_dsi_device *dsi)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
 
 	drm_panel_remove(&khadas_ts050->base);
-	drm_panel_disable(&khadas_ts050->base);
-	drm_panel_unprepare(&khadas_ts050->base);
-}
-
-static void khadas_ts050_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct khadas_ts050_panel *khadas_ts050 = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&khadas_ts050->base);
-	drm_panel_unprepare(&khadas_ts050->base);
 }
 
 static struct mipi_dsi_driver khadas_ts050_panel_driver = {
@@ -899,7 +889,6 @@ static struct mipi_dsi_driver khadas_ts050_panel_driver = {
 	},
 	.probe = khadas_ts050_panel_probe,
 	.remove = khadas_ts050_panel_remove,
-	.shutdown = khadas_ts050_panel_shutdown,
 };
 module_mipi_dsi_driver(khadas_ts050_panel_driver);
 
-- 
2.45.1.288.g0e0cd299f1-goog

