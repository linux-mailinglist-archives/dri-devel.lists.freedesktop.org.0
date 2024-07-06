Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7099092927F
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2024 12:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F01B10E111;
	Sat,  6 Jul 2024 10:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hujt5RDU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCEB10E14D
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2024 10:24:14 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1fa2ea1c443so17641235ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jul 2024 03:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720261453; x=1720866253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wukxN0PIXiJkpvJy8jm2igAsjxWST6oYyCh6lRk67BQ=;
 b=Hujt5RDUgJaN+61bnzjZZJYniMWjwWBgwRr7kM9hzLCvTW+Pto1WotRgqYuQz1Cw+F
 mOafrwTugVBvcMX8Unb+ZocS5mZ3h2LHzXTOziZ6Xfn4o6GIHJHGhshS7HtrpmDiBtRL
 JnK2QYQoIm4R5J+MP6aPZGUy5mbwYuiYZzIYz8Icu5wg4RdNLxCuPhvtuJ2z413eWtkF
 is7AionV3uc3Bidqafld9yZjHZOsGNJaZxQhUjlP8HamWHGZY80c/ZcNcmq+YL67ERdJ
 ynIngQPUkf/bdNkl2mI5GCTftCrEcwbp3UzU8BOrY3LQ5kSfhAV/9ut6zLGP3LNLI/7T
 GXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720261453; x=1720866253;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wukxN0PIXiJkpvJy8jm2igAsjxWST6oYyCh6lRk67BQ=;
 b=s4StLe8CfqpwqhpF7+H5jKXgZwlRnloHqM77lhIg1CqPagS0pyBpcZ/bYxqWD4wdyz
 kaJh+sPhgtYvMCwHnvC9Ww1lZgg+1yJJmUMDvMHggMGbDjvC9u2dai9LAwZVNdWNGe7O
 UkmN3Bu0mLXu0J9b58Nya8pRZ8SownytNfmUxTU04rKDSZwFDOLamSbHVSdPR23wn8xA
 0LgLx/u0cY3Mt1D8yg5ehyR8c/825KOfcvtOtXmg4ELrEChZa9aDd6F17wZR3zWiKm3v
 BAlrivbG+FyfPnrCdSFsBRPk+twEp1ngF5fq6nlLtky3LplTCoj48ihSZLa8NocGirEG
 CaTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7Y6UJMvJz4u7FK28hMjt/ZL+e1TY95/1WA6/2IV9XVrpHcX7PB5YxYyJbhMmyzz/HbOPWDU0jfNvLdE5LTvHBkyLFKWB88aQPQyxHV+fK
X-Gm-Message-State: AOJu0YzC4bV3Aev/UEx10Wrg+VFe2EAQ2ZF/5ixGf3xb6PhqN9xTW/zj
 7sh4u92JOGovheQyQwvEGdNA4yaKqEEtby953607m45Zuu18RoB6
X-Google-Smtp-Source: AGHT+IGRVGt0AwBNkvSk99WrI8NjrmtZs3O2g4U++wOVairspqjrDCMDgAyi3brqtmPuxNpVtbT3UQ==
X-Received: by 2002:a17:902:ecc6:b0:1fb:5808:73af with SMTP id
 d9443c01a7336-1fb5808756fmr27183725ad.61.1720261453365; 
 Sat, 06 Jul 2024 03:24:13 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fb67e04f64sm9126625ad.214.2024.07.06.03.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jul 2024 03:24:12 -0700 (PDT)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 0/5] drm/panel: st7701: Add Anbernic RG28XX panel support
Date: Sat,  6 Jul 2024 19:23:31 +0900
Message-ID: <20240706102338.99231-1-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Add support for the display panel of the Anbernic RG28XX, a handheld
gaming device from Anbernic. "RG28XX" is the actual name of the device.

This panel is driven by a variant of the ST7701 driver IC internally,
and is connected via an RGB parallel interface for image transmission and
an SPI interface for configuration.

Since the current code of the panel driver for ST7701 variants only
supports MIPI DSI as the configuration interface, add support for SPI
as well.

v3:
  - Split commits
  - Remove unnecessary changes
  - Change Kconfig dependency and adjust for it
  - Fix incorrect device variable in st7701_get_modes()

v2:
  - Update dt-bindings
  - Rename DSI_CMD* macros to ST7701_CMD*
  - Rename ST7701_DSI macro to ST7701_WRITE
  - Fix incorrect dev_err_probe() usage
  - Remove GPIOD_FLAGS_BIT_NONEXCLUSIVE flag
  - Remove st7701_remove() and st7701_spi_remove()
  - Call drm_panel_disable() and drm_panel_unprepare() on cleanup

Hironori KIKUCHI (5):
  drm/panel: st7701: Rename macros
  drm/panel: st7701: Decouple DSI and DRM parts
  dt-bindings: display: st7701: Add Anbernic RG28XX panel
  drm/panel: st7701: Add support for SPI for configuration
  drm/panel: st7701: Add Anbernic RG28XX panel support

 .../display/panel/sitronix,st7701.yaml        |   69 +-
 drivers/gpu/drm/panel/Kconfig                 |    3 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 1074 ++++++++++-------
 3 files changed, 734 insertions(+), 412 deletions(-)

-- 
2.45.2

