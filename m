Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A08E58FC071
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E8E10E638;
	Wed,  5 Jun 2024 00:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="J+tC51sf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EFA10E632
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:26 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-6d4bf8eb8e2so771557a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547065; x=1718151865;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B1A9rs7TtWcsH1JSfCCKsqVamskJmPgnyBU2yqNCV6s=;
 b=J+tC51sfNSF13Cvse+r7u+t+rU0TDSrgwzxiEd3yP2jYHz1H5kPmtshjctVu4pPJK3
 P70aU0wxyyVA8CrsBjbW3kqf7YO2i1+SztPglsNR52fRaitXSBbKbZ1oOeMlz6SrzRnV
 3hA+DWKUAyMLqvsSs46HHXQzKFQpgTn4hUMwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547065; x=1718151865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B1A9rs7TtWcsH1JSfCCKsqVamskJmPgnyBU2yqNCV6s=;
 b=Rg4kMIwFJzKrWp3wiTQOroQaragV9fvYk31XaCOi5UR0NdPECLoWNMEyIb+OE1u5g3
 jDzuQYxOv2462rxIFs4JvNPID09LzM08rXvsYFADaZSf3gLgncFS8pLYXoy6eg+7Yh1j
 nz1Fzl5zV726zO1lN9Rm5HG6zCi0tsAzd9ZkUH5sH/STLZpm7f8toWtr/pV4esX0ZMWy
 eXSn2PTArDmVNK+t/Igz0C1a7ZclNvkNGB47HGT1m16y0icMuUnQkE2N8I0obueh8bfT
 ORblwcxwaYvLTwi63TuDgW/NQqWACYGQ7O3avGSj7V2ALT3i2btcTkUv5GyRu//Z3ZOr
 8zMQ==
X-Gm-Message-State: AOJu0YzElLf73Zl2Ugv5CcDwWLuDBWs321Od72JvqXj3Md2BrKnVdyy9
 u6Pjj95HrFCoiFzQyNnpwIaC+0Pu7gNuH1wDy2/BiULmJdxNLOp3u9TIzSTVYenApr95L2wkYXU
 =
X-Google-Smtp-Source: AGHT+IGG+wEJhjmnOFnR17XFhvwO5ykeAXaDODSuz04Uiik7Ku3I2gOkgMKqETtCi2Cc8JKNST2MxA==
X-Received: by 2002:a17:90a:db81:b0:2b6:7e55:2aad with SMTP id
 98e67ed59e1d1-2c27daf65c1mr1092784a91.7.1717547064767; 
 Tue, 04 Jun 2024 17:24:24 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:24 -0700 (PDT)
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
 Stefan Mavrodiev <stefan@olimex.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/24] drm/panel: olimex-lcd-olinuxino: Don't call
 unprepare+disable at remove
Date: Tue,  4 Jun 2024 17:22:52 -0700
Message-ID: <20240604172305.v3.6.I4c79deffb7551ecfb0378302f8dee1275fd1c060@changeid>
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

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
index 8a687d3ba236..94ae8c8270b8 100644
--- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
@@ -251,9 +251,6 @@ static void lcd_olinuxino_remove(struct i2c_client *client)
 	struct lcd_olinuxino *panel = i2c_get_clientdata(client);
 
 	drm_panel_remove(&panel->panel);
-
-	drm_panel_disable(&panel->panel);
-	drm_panel_unprepare(&panel->panel);
 }
 
 static const struct of_device_id lcd_olinuxino_of_ids[] = {
-- 
2.45.1.288.g0e0cd299f1-goog

