Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F17066D1EA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 23:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CEE10E171;
	Mon, 16 Jan 2023 22:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1184E10E171
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 22:49:44 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id g2so14623358ila.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 14:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WhKn9vpYj0ZxiZSSc4tqPnBzXR7eLC6wvgnbJOEQQzI=;
 b=KoEiHaFyDKGFL7NUGQ+gD4XhR37U2DYUP57cNixKU2ojj75snLWqSstDcSwABrVX3L
 +XrKiuVr8faxh50TCjhbfVGxMHN6MtFOBGlbQhFVu+KuaaMeRmzwM3DcCu4z4Dasc2mA
 fmWh1gtJTB/FXBX9mOiJwiUfv5sv9gjKrVTfW/JTVEGGQfuE/MzFIEtEFlDzRKsOcQbq
 riikEW1UhMwf1CarxcisIvbykyZDbVBElr0zW+QnKKe2jjlRoxZXI1qgYOQGUALMV1v4
 bg+G/7CCBnrVvU34fKfR/M7pY8w427NXjOMrQZewNE9G7mTEywR2fQb0aomNQHMAgyJU
 DORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WhKn9vpYj0ZxiZSSc4tqPnBzXR7eLC6wvgnbJOEQQzI=;
 b=E66jejRPF5F4AVcyVkBU5bB7jF8KSfqqMmoowpsdN7F2jP+xaGvNt+wqVh0LeXOc8R
 sGz8wxDdU4DxRYsiEzm0vnv5gJW9KLrjnwyG+JEWQX+iyxDV/kMQwryWgh3OOrYciLO+
 a93zWzR1/9stHGSHGVmKEevUnZagTWqBNYoM85TaG805xDclWTOvJHxllIlbSmyMa0Iq
 qecBLgqDYghAit1rOT/8qQhIhhSF6DvAJUx5SYHMO0SW6itj4oHbZtitGVBsmIJqmf1N
 wyu3r/IvdOX/IIDoHf+u2WAT59z/JWY72LJgANEBthNGUEK2QZ0JeMN43th9a4l01H2s
 Ykhw==
X-Gm-Message-State: AFqh2koyO5VGaGmnQs7WRf10U0hX6VHm1vBiGGN5Z+XzhdGTGPoTn3ye
 fMm8BJ9grNqXvDEStTCbLtI=
X-Google-Smtp-Source: AMrXdXudPsOAWAYaLNzN3PgDBvrB4kU+FJrVcGLr98Gc5ePGYTXAxagy9IiXqMDwAMCQMl/kQKY/Jw==
X-Received: by 2002:a92:c54f:0:b0:30d:976d:bbe7 with SMTP id
 a15-20020a92c54f000000b0030d976dbbe7mr528265ilj.4.1673909383338; 
 Mon, 16 Jan 2023 14:49:43 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::6be])
 by smtp.gmail.com with ESMTPSA id
 z25-20020a056638215900b003a3dd1c7be7sm1791803jaj.128.2023.01.16.14.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 14:49:42 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Vinay Simha BN <simhavcs@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 0/3] drm/mipi-dsi: 16-bit Brightness Endianness Fix
Date: Mon, 16 Jan 2023 17:49:06 -0500
Message-Id: <20230116224909.23884-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb@connolly.tech>, Richard Acayan <mailingradian@gmail.com>,
 Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v2 (20230114010006.50471-1-mailingradian@gmail.com):
 - patch vtdr6130 to use _large (3/3)
 - remove Change-Id again (1/3)
 - change patch subject (1-2/3)
 - correct function name in patch description (2/3)
 - add Tested-by tags (1-2/3)

Changes since v1 (20230113041848.200704-1-mailingradian@gmail.com):
 - move 16-bit brightness handling to new functions and revert API
   change (1/2)
 - remove Change-Id in compliance with checkpatch.pl (1/2)
 - separate panel driver changes (2/2)

This series adds proper support for 16-bit MIPI DSI brightness and
cleans up existing panel drivers with 16-bit brightness.

Both setting and getting works on an external S6E3FA7
(max_brightness = 1023) panel driver with the first patch.

Even though this originally fixed both 8-bit and 16-bit brightness, the
8-bit fix is omitted for now because it affects ~13 panels that would
need to be tested:

    panel-asus-z00t-tm5p5-n35596.c
    panel-boe-bf060y8m-aj0.c
    panel-dsi-cm.c
    panel-ebbg-ft8719.c
    panel-jdi-fhd-r63452.c
    panel-jdi-lt070me05000.c
    panel-novatek-nt35510.c
    panel-novatek-nt35560.c
    panel-orisetech-otm8009a.c
    panel-raydium-rm67191.c
    panel-samsung-s6e63j0x03.c
    panel-sony-acx565akm.c
    panel-sony-tulip-truly-nt35521.c

Daniel Mentz (1):
  drm/mipi-dsi: Fix byte order of 16-bit DCS set/get brightness

Richard Acayan (2):
  drm/panel: sofef00: Use 16-bit brightness function
  drm/panel: vtdr6130: Use 16-bit brightness function

 drivers/gpu/drm/drm_mipi_dsi.c                | 52 +++++++++++++++++++
 drivers/gpu/drm/panel/panel-samsung-sofef00.c |  9 +---
 .../gpu/drm/panel/panel-visionox-vtdr6130.c   |  5 +-
 include/drm/drm_mipi_dsi.h                    |  4 ++
 4 files changed, 59 insertions(+), 11 deletions(-)

-- 
2.39.0

