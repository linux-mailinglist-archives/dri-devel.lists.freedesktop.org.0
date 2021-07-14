Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB933C88BB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 18:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AC56E428;
	Wed, 14 Jul 2021 16:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCC16E428
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 16:34:13 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 v18-20020a17090ac912b0290173b9578f1cso3916599pjt.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 09:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DHfXFlYPkOoEXPCCOLBKjOdjj5fhvAcbLcnpmyX6Rzs=;
 b=kzM/wJxX/ARXMgLYgwtXIUaYeElUlpzngpkjkLSnAFhe6tby3cVK4MyJPwScuo5eW3
 5bH2un75y+GNEXV3PFulv+VgLwmoWP/5K7N2R8Uy3OGANaOfLwgRRK6jvLNqSUXBPpiG
 s9SiyydCO7rx8EwBxrJKhq+cqU3hpS2eCK7Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DHfXFlYPkOoEXPCCOLBKjOdjj5fhvAcbLcnpmyX6Rzs=;
 b=YQj3qWKnwsqQrdZ1CS/pl3bQg/VBEIDp/XCmK6cn2KvynadhOq16pHVePDE25duf+O
 cIYaVBAZ5CipXuYWw+QiUuTD+f1sdUSsmF/p8V7kq4+WeW627MJslxP/RVxF4Y68qCIk
 NgsIIXfAb/IitCOf2LJ+JaQmn6gTJueJfA+V3pSs6qQEOjBlkiwehlfFbEodYmO4DX79
 pqbeEf5oCige8+2jcqpHpoi3qseeHn9TGS1v0xWeocTnvkJrJswSnMVFZ7RRyGJU34E3
 dtR0THMi2aL6ktldqDE6wZPhsCGAlZ0LK/Z0WzaUlQk3xcI2ymGyQLH8mDc3zBWKQZ1P
 pcCw==
X-Gm-Message-State: AOAM532Xk8r9MaQ+GJzEwEbNH1lpUqjOJHT1Iwf/a7npUiEEVzN5auLX
 aTW5t25osTL3t4acI9uR0zZQ2w==
X-Google-Smtp-Source: ABdhPJzmUrgaB1ssMYupE7CPM/xJFTXlef32hZaN4mLbp6prJuQdZAtJzNFkwHikZe/83e0nrMjQMQ==
X-Received: by 2002:a17:90a:e288:: with SMTP id
 d8mr10667424pjz.226.1626280453172; 
 Wed, 14 Jul 2021 09:34:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:5a9d:ef42:7eb4:5fea])
 by smtp.gmail.com with ESMTPSA id q14sm3257620pff.209.2021.07.14.09.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 09:34:12 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rajeev Nandan <rajeevny@codeaurora.org>, Lyude Paul <lyude@redhat.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH] drm/panel-simple: Power the panel when probing DP AUX
 backlight
Date: Wed, 14 Jul 2021 09:33:50 -0700
Message-Id: <20210714093334.1.Idb41f87e5abae4aee0705db7458b0097fc50e7ab@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
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
Cc: David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When I tried booting up a device that needed the DP AUX backlight, I
found an error in the logs:
  panel-simple-dp-aux: probe of aux-ti_sn65dsi86.aux.0 failed with error -110

The aux transfers were failing because the panel wasn't powered. Just
like when reading the EDID we need to power the panel when trying to
talk to it. Add the needed pm_runtime calls.

After I do this I can successfully probe the panel and adjust the
backlight on my board.

Fixes: bfd451403d70 ("drm/panel-simple: Support DP AUX backlight")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index e0a05f366ce6..9b286bd4444f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -827,7 +827,10 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 		goto disable_pm_runtime;
 
 	if (!panel->base.backlight && panel->aux) {
+		pm_runtime_get_sync(dev);
 		err = drm_panel_dp_aux_backlight(&panel->base, panel->aux);
+		pm_runtime_mark_last_busy(dev);
+		pm_runtime_put_autosuspend(dev);
 		if (err)
 			goto disable_pm_runtime;
 	}
-- 
2.32.0.93.g670b81a890-goog

