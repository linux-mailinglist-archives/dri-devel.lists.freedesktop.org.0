Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1583188B346
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 22:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4778C10EB25;
	Mon, 25 Mar 2024 21:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="CjibLeRm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BEC10EB1C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 21:57:04 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1e0511a4383so34716665ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711403823; x=1712008623;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NhZQWaJshhfD9wSXRNVLw92v4FQ+jJkjj3c/jVf2VJg=;
 b=CjibLeRmz9+tEUbFgsvT7XEYnL5dKUZPXUhHP3F5E1xWvZV+sfRns67dTgjIFYjVSs
 vRknGGhNI8sC8J7+1OCzOV017GUb+2pwXiG8z4YrIqg3V13JvkV4CdomgiGYLXW8xljS
 UxQjfVPS1goACwiaMnV2x1mL9F7ANF3shcAes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711403823; x=1712008623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NhZQWaJshhfD9wSXRNVLw92v4FQ+jJkjj3c/jVf2VJg=;
 b=Xu6OsCMs6w6QBDOkqUzsA02SneclcLApfTl5hO1wzHM97RjGzCRe8I7IOugysCR8gq
 CvJN/Hi1yj61mTpRzCjqRGGEkAY2oM0HoOAhkDNzvMLAGosw5iPqtF8YkT+kvHex8QKP
 7ZuIcdMT9259qL2ZrUymwGLMoBuC9fjbXhcJfkRH0IGNaKKqlHk67YQakHDmp7HLK/YM
 mD1dS7FuoAEXaHZUVzGVb/LwOsL910cHa10guLfgwEZsa6Z9tnnfR6Bolyza2/lDQDVI
 7Cy/SWLL3rCFHmpl5Gce81n/S+GtKrmQqpa66ck0JEUevUMjTGE1BsC6JzaTnlvANieu
 sYOA==
X-Gm-Message-State: AOJu0Yy/ln5B50EAxsiI3uaeQBOv8P6xYtXusCZsuD7ByuFAhpVpEjy8
 lrxj5EQrxfYnAfYkhq9prwbpxTTACEnSuc1ifa0v3NEh8+k4P7azo3Oml+DUkC3URtXlhE+3mhY
 =
X-Google-Smtp-Source: AGHT+IG1pvV8JIModEf24NBBDg2YYgu41Tt2PrJ+H3EuIJzXqbRq4KaflfyB/AcYHVm8d9sODDNTeg==
X-Received: by 2002:a17:902:cecb:b0:1e0:a678:5b55 with SMTP id
 d11-20020a170902cecb00b001e0a6785b55mr7152128plg.11.1711403823404; 
 Mon, 25 Mar 2024 14:57:03 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:f21b:7dde:93cc:b987])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a170902e54600b001def0897284sm5207866plf.76.2024.03.25.14.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 14:57:02 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Pin-yen Lin <treapking@chromium.org>,
 Prahlad Kilambi <prahladk@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm-panel: If drm_panel_dp_aux_backlight() fails,
 don't fail panel probe
Date: Mon, 25 Mar 2024 14:56:27 -0700
Message-ID: <20240325145626.3.I552e8af0ddb1691cc0fe5d27ea3d8020e36f7006@changeid>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240325215631.3804796-1-dianders@chromium.org>
References: <20240325215631.3804796-1-dianders@chromium.org>
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

If we're using the AUX channel for eDP backlight and it fails to probe
for some reason, let's _not_ fail the panel probe.

At least one case where we could fail to init the backlight is because
of a dead or physically missing panel. As talked about in detail in
the earlier patch in this series, ("drm/panel-edp: If we fail to
powerup/get EDID, use conservative timings"), this can cause the
entire system's display pipeline to fail to come up and that's
non-ideal.

If we fail to init the backlight for some transitory reason, we should
dig in and see if there's a way to fix this (perhaps retries?). Even
in that case, though, having a panel whose backlight is stuck at 100%
(the default, at least in the panel Samsung ATNA33XC20 I tested) is
better than having no panel at all.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
If needed, I could split this into two patches: one for each of the
two panels that use drm_panel_dp_aux_backlight(). Since they both go
through drm-misc, though, it doesn't feel worth it.

 drivers/gpu/drm/panel/panel-edp.c                | 8 +++++++-
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 9 +++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 607cdd6feda9..0bf66d9dd5b8 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -944,8 +944,14 @@ static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 		err = drm_panel_dp_aux_backlight(&panel->base, panel->aux);
 		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
+
+		/*
+		 * Warn if we get an error, but don't consider it fatal. Having
+		 * a panel where we can't control the backlight is better than
+		 * no panel.
+		 */
 		if (err)
-			goto err_finished_pm_runtime;
+			dev_warn(dev, "failed to register dp aux backlight: %d\n", err);
 	}
 
 	drm_panel_add(&panel->base);
diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 9c336c71562b..6828a4f24d14 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -328,9 +328,14 @@ static int atana33xc20_probe(struct dp_aux_ep_device *aux_ep)
 	ret = drm_panel_dp_aux_backlight(&panel->base, aux_ep->aux);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
+
+	/*
+	 * Warn if we get an error, but don't consider it fatal. Having
+	 * a panel where we can't control the backlight is better than
+	 * no panel.
+	 */
 	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to register dp aux backlight\n");
+		dev_warn(dev, "failed to register dp aux backlight: %d\n", ret);
 
 	drm_panel_add(&panel->base);
 
-- 
2.44.0.396.g6e790dbe36-goog

