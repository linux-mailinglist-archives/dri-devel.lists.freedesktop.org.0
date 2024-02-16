Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3930A8586C0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 21:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BEC10E296;
	Fri, 16 Feb 2024 20:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ny0EannU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EDC10E296
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 20:31:24 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1d51ba18e1bso25786355ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 12:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708115483; x=1708720283;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t1QGMxYLAPKWTt9tAmquOnzICTheF4ZELz33st39yQM=;
 b=Ny0EannU45R7QqfMNY3B85p8qzpX+jDPOwufOKK0EwBenm8Fz3h8XyqDvCNgN4KrMS
 6Pywib8EOLFNIVl+p4oUb1hMmhUkywpx53BhtHqLn6jwJGHxT6OriwYVFT78Rld8DTik
 uKQEE+bfUDK2FLKpCy0fs4xUelBssfw6F1o/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708115483; x=1708720283;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t1QGMxYLAPKWTt9tAmquOnzICTheF4ZELz33st39yQM=;
 b=F1Cu7SoarPmaov5bvJ4lnkNQfe6PTt1mb5OZVaL4NA2GJ4EDl2jvFtNi1ld5ng5myD
 ++hZsAMMjBdx8P+lz7LFI29753ZZA9TKUsrDeD4lKCFb1kuPE9XP7VfugF8zMvGtLoYN
 DLTGDtxyCm+vL9EaWG8d8mUtkjhSPnPMsMbdEevEUth7vdnIOkqtGMB9XTThJU6qgix3
 Pq89M9S1HSNfCvdUypj9lri+dXNqmkVohlKZoe3Y3lapWUps+bU97abnprXImZAywCp1
 lMX27biBpDblGfjLZgej+K9MGeZ6MJ2eVdoXbEMkioEHLQimdy8+yofW1TVfu9j/f8eH
 9HEg==
X-Gm-Message-State: AOJu0Yx7h+yX8gnrcs/7mNPmu81kGIGNWIZZgxtuHyEQpMf/TXbiNaiU
 GdJO52hk3L+/avF/B/0YiOv4mr1aZ7LlgdQu0yKMUaM31/JsWMThtayfCW8jKDiZHRy6z9uhYZs
 chRgW
X-Google-Smtp-Source: AGHT+IGUbn1iYkQLFfxLEFg8HdmzNiQ64QZ+0XQ0PfIFQHFg5DYWMKahwJDc3Zqky4rFFvT6nDE9PQ==
X-Received: by 2002:a17:902:d486:b0:1db:b36c:7165 with SMTP id
 c6-20020a170902d48600b001dbb36c7165mr2073885plg.14.1708115483260; 
 Fri, 16 Feb 2024 12:31:23 -0800 (PST)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:b6bd:4419:377:da7a])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a170902e99300b001d944b3c5f1sm256966plb.178.2024.02.16.12.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 12:31:22 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: boe-tv101wum-nl6: make use of prepare_prev_first
Date: Fri, 16 Feb 2024 12:31:12 -0800
Message-ID: <20240216123111.1.I71c103720909790e1ec5a3f5bd96b18ab7b596fa@changeid>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
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

The panel on sc7180-trogdor-wormdingler and
sc7180-trogdor-quackingstick hasn't been coming up since commit
9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up DSI hosts
at modeset"). Let's add "prepare_prev_first" as has been done for many
other DSI panels.

Fixes: 9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up DSI hosts at modeset")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This of course gets into debates about getting a nicer solution that
doesn't involve adding "prepare_prev_first" to every DSI panel out
there, maybe building on Dmitry's work [1]. While it would be nice if
we could get there, getting this landed is easy to backport to stable
trees and gets the panel working again.

[1] https://lore.kernel.org/r/20231016165355.1327217-4-dmitry.baryshkov@linaro.org

 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index c4c0f08e9202..bc08814954f9 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1871,6 +1871,8 @@ static int boe_panel_add(struct boe_panel *boe)
 
 	gpiod_set_value(boe->enable_gpio, 0);
 
+	boe->base.prepare_prev_first = true;
+
 	drm_panel_init(&boe->base, dev, &boe_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 	err = of_drm_get_panel_orientation(dev->of_node, &boe->orientation);
-- 
2.44.0.rc0.258.g7320e95886-goog

