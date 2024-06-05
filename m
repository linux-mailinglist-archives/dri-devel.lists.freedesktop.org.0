Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406538FC080
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874B610E651;
	Wed,  5 Jun 2024 00:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VXr4/bJk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8C510E647
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:57 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1f6342c5faaso14001155ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547096; x=1718151896;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S5c4MKTgrGl4hq+d6zD/HFZfQGneGwPo9D4JV91mhW4=;
 b=VXr4/bJkjdMl2jH6tUztBUhoxE8CFkin0cMrOxLr0Q1mx/gJU1KyITg6vHN5IIk5Y0
 qKLulp79lGJ0tzTnVPF1ZfMDeCn7zQ55hyrYH2b1ir+q85Os0tv26gu2DMmoPnam7SAK
 QXtLOJTRzE+R7rn9t0/sWCKPXE02gssf5rxrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547096; x=1718151896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S5c4MKTgrGl4hq+d6zD/HFZfQGneGwPo9D4JV91mhW4=;
 b=TAhuOAsE+I94R6KEJvz9g8iB2ehQ/GEflqsa6zaG2ZOnfR2GnqxQ9AR2zG9ow2nOc0
 zDKXu/1RuL+yK043dyrIZpxwaIPuvKqON+sb2Ap2yq+9AtgceXLi5s/11PMoWHLJZxxq
 IEwscKGRmyVrnEG4SKQCblTfY7HERzhj+kmaYKNalupbRqbVja7ciRbQPVxm5kIOYFm3
 8563GWRxx13fMHREchNCYMVlFHepbQOfX/DTQmxA/g1BwrzS+/UXMHN42mVDDRL9Pu90
 xqzxEa2aibTYErcgZmhRWK1UaleAUmVBKNsNJ5pBBZu3MLfYokblsG4Ysm6OsDYNiBNB
 rlDQ==
X-Gm-Message-State: AOJu0YxC3QiN3Ua8mP4mh6uU1dkpxkzdrbwObnqSi9zQ28/O5vSiPBjg
 JPv/FJInAxJsmg+GjFjKtUfoJoL0D9sRaYndhc7MEBTHzbGu9v8qedYvP/U2p7Arj/1SRj5EJAg
 =
X-Google-Smtp-Source: AGHT+IFBh/0CPO5W8OJJIzJ5oQC9KPttYAyT+WTPZMKapzK/LwmKYkDq0q16vzIBdd7d6vPSCvFMWw==
X-Received: by 2002:a17:902:b18c:b0:1f4:867e:1486 with SMTP id
 d9443c01a7336-1f6a5a26f5amr10618805ad.40.1717547096147; 
 Tue, 04 Jun 2024 17:24:56 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 19/24] drm/panel: sharp-ls043t1le01: Stop tracking prepared
Date: Tue,  4 Jun 2024 17:23:05 -0700
Message-ID: <20240604172305.v3.19.I56849dbe7c906f0cff076dc5286fd05c7e3e9c18@changeid>
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

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

Cc: Werner Johansson <werner.johansson@sonymobile.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index 855e64444daa..c86337954ad7 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -26,8 +26,6 @@ struct sharp_nt_panel {
 
 	struct regulator *supply;
 	struct gpio_desc *reset_gpio;
-
-	bool prepared;
 };
 
 static inline struct sharp_nt_panel *to_sharp_nt_panel(struct drm_panel *panel)
@@ -99,9 +97,6 @@ static int sharp_nt_panel_unprepare(struct drm_panel *panel)
 	struct sharp_nt_panel *sharp_nt = to_sharp_nt_panel(panel);
 	int ret;
 
-	if (!sharp_nt->prepared)
-		return 0;
-
 	ret = sharp_nt_panel_off(sharp_nt);
 	if (ret < 0) {
 		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
@@ -112,8 +107,6 @@ static int sharp_nt_panel_unprepare(struct drm_panel *panel)
 	if (sharp_nt->reset_gpio)
 		gpiod_set_value(sharp_nt->reset_gpio, 0);
 
-	sharp_nt->prepared = false;
-
 	return 0;
 }
 
@@ -122,9 +115,6 @@ static int sharp_nt_panel_prepare(struct drm_panel *panel)
 	struct sharp_nt_panel *sharp_nt = to_sharp_nt_panel(panel);
 	int ret;
 
-	if (sharp_nt->prepared)
-		return 0;
-
 	ret = regulator_enable(sharp_nt->supply);
 	if (ret < 0)
 		return ret;
@@ -152,8 +142,6 @@ static int sharp_nt_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	sharp_nt->prepared = true;
-
 	return 0;
 
 poweroff:
-- 
2.45.1.288.g0e0cd299f1-goog

