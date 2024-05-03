Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5B78BB61A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687AC1132AB;
	Fri,  3 May 2024 21:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fw/KaX40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6A6112A4E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:38:15 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1ecff927a45so1157755ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772294; x=1715377094;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ekjI+s+uLAWB4kUzVZhMVrRRrlC73fq00flN601bwaM=;
 b=fw/KaX40zJK1SCDzoyV7SJH/5BMvy0h2Akbq/4wa5TvL0q0FCi75JMV2eUAz+E4uUu
 cl2uM6POPZQJ0QV/eKIDAygElABe+Kq6p5l/zZhZ89J67iHyz3172dlrBcY9UgSLO6oQ
 sx555j01UpOoC2L2aCFuVF36WtkgDqMWJYnxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772294; x=1715377094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ekjI+s+uLAWB4kUzVZhMVrRRrlC73fq00flN601bwaM=;
 b=siad5XP40Gz7yZYJm3i002gZH472MQ3ywOdUhugVtdHCXoxrJmEFPrvZ28WLNX4CHQ
 uslLKm4yxPYyf/OjbxAUj9GbTCkC0ysCIhqx88wWJIn/MmvAvWJ0SCnFr2xJlHmHoMIw
 pMA/56nCj14/Qwd41injJLyQlYRu3fu6+q+v4A6LE1S8FzeY2SN/VEytYnCYWdSS2IPA
 oxmEzOChlI4f/Hh97BlnPWcaV7RwdQx04t8RRwZ+KJPFxtmBSRVp+WsWVmil38AT6d2E
 YoiHcQyI6IB99irCggDYDp7F1aZZm22NiNAvCj+4tM6wUew7282sZcoRBts2zcl3/AJM
 bcsg==
X-Gm-Message-State: AOJu0YxPGB28B2soCEOBmHq+Q42vbzVjT7q5f1fxXR/aXP9Tler9jZTM
 Zv3iwOS5IiQwVNkfVtDkjkO5MK/kb5Kv1oF+FW+YUPAJ8survkHQ24c2G4F8hXbWWGHbyaCm/yy
 ygw==
X-Google-Smtp-Source: AGHT+IFguT0/xs4KCtngccJNg5AiVarM5W9ebMgGc4GgQxudEnwAFv+ycO9TzXkPPacW4rwdnnJR0g==
X-Received: by 2002:a17:902:bb17:b0:1e9:470:87e6 with SMTP id
 im23-20020a170902bb1700b001e9047087e6mr3553894plb.23.1714772294293; 
 Fri, 03 May 2024 14:38:14 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:38:13 -0700 (PDT)
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
Subject: [RFT PATCH v2 47/48] drm/panel: sony-acx565akm: Don't call disable at
 remove
Date: Fri,  3 May 2024 14:33:28 -0700
Message-ID: <20240503143327.RFT.v2.47.I2513fd6824929a17c1ccd18a797b98a1a1063559@changeid>
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

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

A grep through mainline for compatible strings used by this driver
indicates that it is used by TI OMAP boards. The TI OMAP driver
appears to be correctly calling drm_atomic_helper_shutdown() so we can
remove the calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-sony-acx565akm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index a9a545a56404..73ba93ff00fe 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -652,9 +652,6 @@ static void acx565akm_remove(struct spi_device *spi)
 
 	if (lcd->has_bc)
 		acx565akm_backlight_cleanup(lcd);
-
-	drm_panel_disable(&lcd->panel);
-	drm_panel_unprepare(&lcd->panel);
 }
 
 static const struct of_device_id acx565akm_of_match[] = {
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

