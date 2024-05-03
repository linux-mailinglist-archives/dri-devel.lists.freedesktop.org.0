Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619C8BB618
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E891B112A4E;
	Fri,  3 May 2024 21:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="B13p1mqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29B91132AB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:38:13 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1e651a9f3ffso690325ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772292; x=1715377092;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X9J+mwbNCcE7m50P9Dlsv1H2Zyb5eg1SoTrNCCSKKxs=;
 b=B13p1mqx6X9HsyFVl6VEH+DIjTw3aDo5MnFEmsqDzpYj3vLTJ+aE2JeVdntK/i0/io
 k39sQyEqZX1nCTwj+sCx//EdcqwXsXYb+BJDFMt+wMo5tXqvnQiPFDdm2uVmYWUmLjCL
 TZGuQW8+kHQcLpovjwVwuCbBsVsfEQVu9PhsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772292; x=1715377092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X9J+mwbNCcE7m50P9Dlsv1H2Zyb5eg1SoTrNCCSKKxs=;
 b=DdbHFy6giFeYg16rO4BQY0Jl1n5dNIZYpq14EAKIvQQoXg+Xhu9EqMox/O0HbPzc3V
 do86zHO79JD96Ifl+tzXSXzcHhr+U/hI7bcKFejFQAorpplp1hCoKDmc/W7yWXV9Gi7I
 RPbAkBzDnsFBskLchSgqfWb1L+oqbPs5Cv1Uc6xM5Pi7/WKUM4b7jnkGKPpc5sQ8M7Lg
 IFGFO9NSRuMPZ4o4xjkj1+oFjHcFPg4LcBNNI6Weu+Gm0yLjP0bmihfHoiA0gEGB8nSb
 IUaHu20EAsQrxtZVWPHFz6UmRXTdJMxrjP2wvGcVKUUOHW7Z0RCGvFXzGKWkHfq898CG
 YOsw==
X-Gm-Message-State: AOJu0YxyxzW28ecIoU8laPKXosmK4467kYhK1QftQNYw146haezBAV71
 AUIY1BtIsNzCnjw8FFWv1bQCxQ9Z7J9jXE6PJlro6NhdVIUsW60ySOY05btJ5VWq/ACiytS0Mrx
 rmA==
X-Google-Smtp-Source: AGHT+IEhvNbol5zNlkCIgLPtF12l61bvixPmv0EHaY4itQnvJImVMXDJ99WT0lhGIYbPhxxJaaynFw==
X-Received: by 2002:a17:902:da8c:b0:1e3:cfc5:589e with SMTP id
 j12-20020a170902da8c00b001e3cfc5589emr4661779plx.64.1714772292404; 
 Fri, 03 May 2024 14:38:12 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:38:11 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 46/48] drm/panel: sony-acx565akm: Don't double-check
 enabled state in disable
Date: Fri,  3 May 2024 14:33:27 -0700
Message-ID: <20240503143327.RFT.v2.46.I6a51b36831a5c7b2b82bccf8c550cf0d076aa541@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
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

The acx565akm seems to do some unique stuff with the "enabled"
state. Specifically:
1. It seems to detect the enabled state based on how the bootloader
   left the panel.
2. It uses the enabled state to prevent certain sysfs files from
   accessing a disabled panel.

We'll leave the "enabled" state tracking for this. However, we can at
least get rid of the double-check when trying to disable.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-sony-acx565akm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index 3d6a286056a0..a9a545a56404 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -454,9 +454,6 @@ static int acx565akm_power_on(struct acx565akm_panel *lcd)
 
 static void acx565akm_power_off(struct acx565akm_panel *lcd)
 {
-	if (!lcd->enabled)
-		return;
-
 	acx565akm_set_display_state(lcd, 0);
 	acx565akm_set_sleep_mode(lcd, 1);
 	lcd->enabled = false;
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

