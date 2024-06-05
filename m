Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79B58FC074
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF61E10E63D;
	Wed,  5 Jun 2024 00:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JLwgJNlQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4592210E639
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:35 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1f6262c0a22so2662665ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547074; x=1718151874;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/przf+caKegl5qEPPn6pOmHyiCkKABnIFCYoELVro4=;
 b=JLwgJNlQNoLo8eTIMbQbYkAqscymxUjK2e3zJXz1EitK50SkJDfflFVcb5gNgHJvU+
 XEyWhYt1ODA97TA/jhYuTado4yYsJkLdeQHTBgB7Cpd3stVekKDpafGBxNlJjFfmCNpz
 L+szX1TGzMAfCXP5PJjuJ5TksZX+oO1TWlKWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547074; x=1718151874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/przf+caKegl5qEPPn6pOmHyiCkKABnIFCYoELVro4=;
 b=FM21Qs6w9kUNPzjCtiUvRNRY36sJIU/0sU4Hgp9hP3lz+MXQZYMIxvJDH9YrGZfxfF
 Dpy4oGktYTYKbKYxJw4ymG1Q+tj037AT1bw5QKXOurfu7ayO/4grTY8YHoKLZ1WLWwgH
 S2OwqS1LEHX3IkYrcFxFpM0rAUHidMDfOiu4mdFOEhTFe1b7WZTIATh4p7oGDfaZZXeD
 abjeEtyJgDRtLik+YYJ6Zt6L2Eh5y/8P08ksQ/CoRIn6l4+L9y5yE0CqA4EecZ9tBRtt
 JDSZKaih65O1otMGYCL5Ca34A2FV0ulQV/YO8IdYqK9z6bbsPcd+qaa/3AWVBECDsMT4
 /bhg==
X-Gm-Message-State: AOJu0Yz+Gagxg+YjQiYSyDkFpNiwxNQCfH9nqFsgq8gaMIBj1pLz0EZn
 7qnl+x66eHCUwCDvIRLWOgEY62CT3+/wkH+oMBIIaxX9KpKG7Eo31m9xBjaClPYexNy/0BKH3+I
 =
X-Google-Smtp-Source: AGHT+IHez1cc81IZkcpKLDNVF8QX0H0g1tSdXuUZDgWnWy1002HtkjwedjR37Wwq22lEtJMm9Ht9UQ==
X-Received: by 2002:a17:903:18a:b0:1f6:a582:c276 with SMTP id
 d9443c01a7336-1f6a5835237mr15902825ad.11.1717547074236; 
 Tue, 04 Jun 2024 17:24:34 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:33 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/24] drm/panel: tdo-tl070wsh30: Don't call
 unprepare+disable at shutdown/remove
Date: Tue,  4 Jun 2024 17:22:56 -0700
Message-ID: <20240604172305.v3.10.I46ff4e28c260bcd8e81205debd0994e76fd8aeac@changeid>
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

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
index 36f27c664b69..227f97f9b136 100644
--- a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
+++ b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
@@ -208,16 +208,6 @@ static void tdo_tl070wsh30_panel_remove(struct mipi_dsi_device *dsi)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
 
 	drm_panel_remove(&tdo_tl070wsh30->base);
-	drm_panel_disable(&tdo_tl070wsh30->base);
-	drm_panel_unprepare(&tdo_tl070wsh30->base);
-}
-
-static void tdo_tl070wsh30_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct tdo_tl070wsh30_panel *tdo_tl070wsh30 = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&tdo_tl070wsh30->base);
-	drm_panel_unprepare(&tdo_tl070wsh30->base);
 }
 
 static struct mipi_dsi_driver tdo_tl070wsh30_panel_driver = {
@@ -227,7 +217,6 @@ static struct mipi_dsi_driver tdo_tl070wsh30_panel_driver = {
 	},
 	.probe = tdo_tl070wsh30_panel_probe,
 	.remove = tdo_tl070wsh30_panel_remove,
-	.shutdown = tdo_tl070wsh30_panel_shutdown,
 };
 module_mipi_dsi_driver(tdo_tl070wsh30_panel_driver);
 
-- 
2.45.1.288.g0e0cd299f1-goog

