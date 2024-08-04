Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26828946C96
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 08:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5171710E051;
	Sun,  4 Aug 2024 06:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ANJ4JoB7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF55D10E051
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 06:16:00 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3db51133978so2506772b6e.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Aug 2024 23:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722752160; x=1723356960; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W+PeTNFmfRiiVfdD4fTEqR8T2Gwq0tebxgkS79dVtbw=;
 b=ANJ4JoB7WzUp4vJB7ittYMhwHcWqV9TBDWG05UE57VB+XyEnh19C/dTZOEsXSSSbCo
 qX12rfdBfBc4LOQ6+BiJ46cib33+4bKr+8L45wkWo1OcDiYPcNRytr7BjS3Jz0kNlE6A
 Rv5AOXETUc5OQ1T/WQlvRqOQEemjvqfIG1+a4AN+8XjrEx21HnNRIk+7BWCfSrUCZUPW
 +BTf4lHzileTHhpbQ+3oCs7rKJbf/sikxqEqqgSWIcNoM+JxmICcXUc3NNPsGhs1NbzO
 kYli0g6huDjpOxOw/7bmnJawmsSppLmg1RVEd/4u2uQMvAT60VzCOPs3piTvJPDPHwjw
 tJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722752160; x=1723356960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W+PeTNFmfRiiVfdD4fTEqR8T2Gwq0tebxgkS79dVtbw=;
 b=bVVFJEBcxi78g3IKpm1D4c2p/2lEke3jsJhPquEzle0lUmAaE+TzmGYH5YdTwSmJS9
 ZlV0GpNu/HrSENeZ6znIorwxW7ymBr0D/Ome+hR9Dh2wQ+lFCUeDphiOdTVICkUdV+CS
 b2wBCGzepgopI//Aqv21PfD1G6OC647STWENae2h6qkveYqUGku3UwN5Fes3ZU9ga9rk
 PfQVge3s8j8yl2lMq6hXBQyKtziB6p/MWrm0C+Kibrfu7d4HDpmZCKNQtOD/PLmZ6iPw
 x9QQHXBqQmYuxguOQUaHGAHhX8XDZ0SjmHNaUqKGocVaITydHlxs0yqtvMQ0tivRXeGT
 4WHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBrbesvzBapv2YPgkPyoqoTbuEt7xN9NbWiw9i9hXOXGPikg9H6qgNDmh4rcS4mie31LAu+1oPdMZy/rrbZ2VA3StmSKYYtJGRRsSENQYj
X-Gm-Message-State: AOJu0YwHgEsSD4bzNY8uWDC/+WPu+ZZhCijer0nLdMVmhjw98Fgig/F4
 zpIVEdFUy9Ixl/ADN0LLOPSSiuJbau3b1wv8Ka68LbArq0M7Saho
X-Google-Smtp-Source: AGHT+IEMOeP1zK3q0PzdphJcoR2q9nwUOvs8Wff6/AmNerTKEGhqJokdQYaqcv/6lU4GTPuPMIwNPg==
X-Received: by 2002:a05:6808:159d:b0:3da:ac85:3bd5 with SMTP id
 5614622812f47-3db557ef9bemr11211096b6e.8.1722752160006; 
 Sat, 03 Aug 2024 23:16:00 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f29ef4sm44194195ad.14.2024.08.03.23.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 23:15:59 -0700 (PDT)
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
Subject: [PATCH v4 0/5] drm/panel: st7701: Add Anbernic RG28XX panel support
Date: Sun,  4 Aug 2024 15:14:44 +0900
Message-ID: <20240804061503.881283-1-kikuchan98@gmail.com>
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

v4:
  - Update a commit message for dt-bindings

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

