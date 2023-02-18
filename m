Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C54BA69B9A2
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 12:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB23810E170;
	Sat, 18 Feb 2023 11:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19AD10E170
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 11:17:21 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id l17so81486pfu.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 03:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gEF8FEuNLVayQdE5QI9MaMd8Q/7gQJSqUO9M+81Oa5M=;
 b=IaruHdGy8cyFLDUGIOX5pZOCfDLvKQZpLOUwXva2yFbitViwuTKQidiLFpOtPWhzcu
 suiJ6uJgAz2TngEijk5zQdejLa23H2xeo9jIswDVjTdRDMV/LGUV9eYlX3+ou4kJqg+8
 Pi9/8dmPnYdds+GD+VqOdlM6LCxjqZ45E1Hbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gEF8FEuNLVayQdE5QI9MaMd8Q/7gQJSqUO9M+81Oa5M=;
 b=NwiL/U0DBcIh+4EZt9gW0MEjbzABf+eDdw1LfRnXIKIVu2VrZ268kpmpQbVhtcUd4b
 Nykvm7b5OXaATsKzLuPdvcq5GA9XHSlntP2HdZL5lBY9PJLVcnCHaYwl9vbvxeNOPJYV
 8b/qQk8lG9sykYRSo97Sh/Y7jkw/jN+ZUqvFQw8aW2S09rne+0lsyjiWsSZRo/RXeprY
 pQI990bKUnELpuewItlG/FAsvB+UVi3DnM0bN0VI5vi9fn7MNcO0duIiM60Sh+3XP5E2
 s20rnZWd0U+wXEWh8/popoPPu5NXOl/dm4goJ0jH+h2AiDrd67HNSrB8p8RSIFbDmGXP
 sCHQ==
X-Gm-Message-State: AO0yUKVgQhJQpoz1Q4dMkbgOs6rz99ExWdu10N/tZNnqFLbyP1X27FfT
 GcEdGl4Sd7SQHhMTVl7MJkgPIA==
X-Google-Smtp-Source: AK7set+WyXQ3bNUcWSBc3Z7xIjr8Et8u/2+vAwZMWp1xbM5SWXK9wjjgnemRxkn9IVSvnVIBAgswew==
X-Received: by 2002:a62:1b48:0:b0:5ab:bf5d:a0d1 with SMTP id
 b69-20020a621b48000000b005abbf5da0d1mr2435384pfb.7.1676719041279; 
 Sat, 18 Feb 2023 03:17:21 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:88dd:be84:8f65:fec2])
 by smtp.gmail.com with ESMTPSA id
 23-20020aa79157000000b005a8686b72fcsm4457829pfi.75.2023.02.18.03.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 03:17:20 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Benson Leung <bleung@chromium.org>
Subject: [PATCH v3 0/5] Add generic-display-mux driver and bindings
Date: Sat, 18 Feb 2023 19:17:07 +0800
Message-Id: <20230218111712.2380225-1-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
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
Cc: chrome-platform@lists.linux.dev, Nicolas Boichat <drinkcat@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Pin-yen Lin <treapking@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is developed for and tested on MT8173 board, and the layout is:

                                  /-- anx7688
-- MT8173 HDMI bridge -- GPIO mux
                                  \-- native HDMI

v2: https://lore.kernel.org/all/20230116110820.2615650-1-treapking@chromium.org/
v1: https://patchwork.kernel.org/project/dri-devel/cover/20191211061911.238393-1-hsinyi@chromium.org/

Changes in v3:
- Removed ddc-i2c-bus in the gpio-mux bridge bindings
- Added .get_edid callback in generic-gpio-mux driver
- Removed .get_edid callback in mtk_hdmi.c
- Modified anx7688 driver and binding to add a .get_edid callback

Changes in v2:
- Referenced existing dt-binding schemas from graph.yaml
- Added ddc-i2c-bus into the bindings
- Dropped attach/mode_set/enable/disable callbacks
- Fixed style issues
- Removed the special case for the HDMI connector
- Made the driver only read the GPIO status in IRQ handler
- Rebased to drm-misc-next
- Update the license: "GPL v2" --> "GPL"

Nicolas Boichat (2):
  dt-bindings: display: bridge: Add GPIO display mux binding
  drm: bridge: Generic GPIO mux driver

Pin-yen Lin (3):
  dt-bindings: display: bridge: Add ddc-i2c-bus for anx7688
  drm/bridge: Add .get_edid callback for anx7688 driver
  drm/mediatek: Remove .get_edid callback

 .../bridge/google,cros-ec-anx7688.yaml        |   5 +
 .../bindings/display/bridge/gpio-mux.yaml     |  90 +++++++
 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/cros-ec-anx7688.c      |  24 ++
 drivers/gpu/drm/bridge/generic-gpio-mux.c     | 222 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  53 +----
 7 files changed, 365 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
 create mode 100644 drivers/gpu/drm/bridge/generic-gpio-mux.c

-- 
2.39.2.637.g21b0678d19-goog

