Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C2D68AA07
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 14:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0BD10E0DF;
	Sat,  4 Feb 2023 13:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD4210E0DF
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Feb 2023 13:30:51 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id cr11so5546394pfb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Feb 2023 05:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FVkdJLwyfwU33wlGnUCxAKm5k44RcZQqior6oaFvcuE=;
 b=XfyrlbJL6GXcFIz5XpUaWJNvkmTsRb5QUwHie4CTObeVqXW0WSWgZA6m9Iq9DOT3a2
 Hw+fBePPOzPq/MrBuP3xBx7m9EbozC6e05a0ai8ItCuv0nrMXj2PYMxbenIv3Taz/vAv
 AqGCtNwKNQHzA5ZI2zvjz+/QxoDgqYACbLgoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FVkdJLwyfwU33wlGnUCxAKm5k44RcZQqior6oaFvcuE=;
 b=PMotDut5lVFVIU2ghJub8NhHmCrwjEw4ef0naDIpkmRTWSCmrIuzCh48ojWk71sn4i
 SwoXQZYE/2rFmc4DGyYSvXqIQeYf0hXWpKWx2geDzJegDBP7oixax8quYSHjlN9faKne
 Dqga05c99FpSKWxgJGH5xdnRn9Jj4WsJzStpnFfm06CUu+YnrA1pO4xF+XlzJIbzFMOa
 U+Znpv+F+nuld9pm2E6C3rguCuL2lbo+j3JS+fFjPwRU+F/W4gAAhl2yFRCvCLccUsvW
 bnRguBdEeJzQR4s3Sj7LVi2f6WOpUxcta6vnZzYH0OstCz161mTVjFzFqysZ4wBmtqXP
 2dvg==
X-Gm-Message-State: AO0yUKVdR+bOQBJiSB0ed1W3Mk0XQkJmN1OVrQbXDzmV6NVaN0/hD/u6
 P4JWL+U/E+kNqloAyqJVAo3gqQ==
X-Google-Smtp-Source: AK7set+9iHtCCYOSfEMYujSJDtSXZN/ujD2frcnZL18RY+S+5asJRhXbTQnQ3sqA2Na2InRuHuRE0Q==
X-Received: by 2002:a62:3286:0:b0:59c:8937:435e with SMTP id
 y128-20020a623286000000b0059c8937435emr784064pfy.28.1675517450787; 
 Sat, 04 Feb 2023 05:30:50 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:c1ad:2bdc:7b5a:72e3])
 by smtp.gmail.com with ESMTPSA id
 144-20020a621596000000b00593ce7ebbaasm3655639pfv.184.2023.02.04.05.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 05:30:50 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v11 0/9] Register Type-C mode-switch in DP bridge endpoints
Date: Sat,  4 Feb 2023 21:30:31 +0800
Message-Id: <20230204133040.1236799-1-treapking@chromium.org>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, linux-acpi@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This series introduces bindings for anx7625/it6505 to register Type-C
mode-switch in their output endpoints, and use data-lanes property to
describe the pin connections.

This series is not directly related to the built-in mux in anx7625,
which automatically switches between the two orientations of a single
Type-C connector. This series adds support of registering mode switches
for two downstream devices, while we use orientation switches for two
orientations of the Type-C connector.

The first two patch modifies fwnode_graph_devcon_matches and
cros_typec_init_ports to enable the registration of the switches.

Patch 4~6 introduce the bindings for anx7625 and the corresponding driver
modifications.

Patch 7~9 add similar bindings and driver changes for it6505.

v10: https://lore.kernel.org/all/20230112042104.4107253-1-treapking@chromium.org/
v9: https://lore.kernel.org/all/20230109084101.265664-1-treapking@chromium.org/
v8: https://lore.kernel.org/all/20230107102231.23682-1-treapking@chromium.org/
v7: https://lore.kernel.org/all/20230105132457.4125372-1-treapking@chromium.org/
v6: https://lore.kernel.org/all/20221124102056.393220-1-treapking@chromium.org/
v5: https://lore.kernel.org/linux-usb/20220622173605.1168416-1-pmalani@chromium.org/

Changes in v11:
- Added missing fwnode_handle_put in drivers/base/property.c
- Collected Acked-by tag
- Use fwnode helpers instead of DT
- Moved the helpers to a new file
- Use "reg" instead of "data-lanes" to determine the port number
- Updated the description of the endpoints in the bindings
- Referenced video-interfaces.yaml instead for the endpoints binding
- Removed duplicated definitions from inherited schema
- Moved the "data-lanes" parsing logics to bridge drivers
- Removed Kconfig dependencies for the bridge drivers
- Updated the usage of the private bridge driver data
- Added a clarification on the anx7625 built-in mux in the cover letter

Changes in v10:
- Collected Reviewed-by and Tested-by tags
- Replaced "void *" with "typec_mux_set_fn_t" for mux_set callbacks
- Print out the node name when errors on parsing DT
- Use dev_dbg instead of dev_warn when no Type-C switch nodes available
- Made the return path of drm_dp_register_mode_switch clearer
- Added a TODO for implementing orientation switch for anx7625
- Updated the commit message for the absence of orientation switch
- Fixed typo in the commit message

Changes in v9:
- Collected Reviewed-by tag
- Fixed subject prefix again
- Changed the naming of the example node for it6505

Changes in v8:
- Fixed the build issue when CONFIG_TYPEC=m
- Fixed some style issues
- Fixed the subject prefixes for the bindings patch
- Fixed the bindings for data-lanes properties

Changes in v7:
- Fix the long comment lines
- Extracted the common codes to a helper function
- Fixed style issues in anx7625 driver
- Removed DT property validation in anx7625 driver.
- Fixed style issues in it6505 driver
- Removed the redundant sleep in it6505 driver
- Removed DT property validation in it6505 driver
- Rebased to drm-misc-next
- Fixed indentations in bindings patches
- Added a new patch to fix indentations in Kconfig

Changes in v6:
- Changed it6505_typec_mux_set callback function to accommodate with
  the latest drm-misc patches
- Changed the driver implementation to accommodate with the new binding
- Dropped typec-switch binding and use endpoints and data-lanes properties
  to describe the pin connections
- Added new patches (patch 1,2,4) to fix probing issues
- Changed the bindings of it6505/anx7625 and modified the drivers
  accordingly
- Merged it6505/anx7625 driver changes into a single patch

Pin-yen Lin (7):
  drm/display: Add Type-C switch helpers
  dt-bindings: display: bridge: anx7625: Add mode-switch support
  drm/bridge: anx7625: Check for Type-C during panel registration
  drm/bridge: anx7625: Register Type C mode switches
  dt-bindings: display: bridge: it6505: Add mode-switch support
  drm/bridge: it6505: Fix Kconfig indentation
  drm/bridge: it6505: Register Type C mode switches

Prashant Malani (2):
  device property: Add remote endpoint to devcon matcher
  platform/chrome: cros_ec_typec: Purge blocking switch devlinks

 .../display/bridge/analogix,anx7625.yaml      |  94 ++++++++-
 .../bindings/display/bridge/ite,it6505.yaml   | 101 ++++++++--
 drivers/base/property.c                       |  16 ++
 drivers/gpu/drm/bridge/Kconfig                |  20 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 162 +++++++++++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.h     |  20 ++
 drivers/gpu/drm/bridge/ite-it6505.c           | 179 +++++++++++++++++-
 drivers/gpu/drm/display/Makefile              |   1 +
 drivers/gpu/drm/display/drm_dp_typec_helper.c | 114 +++++++++++
 drivers/platform/chrome/cros_ec_typec.c       |  10 +
 include/drm/display/drm_dp_helper.h           |  31 +++
 11 files changed, 717 insertions(+), 31 deletions(-)
 create mode 100644 drivers/gpu/drm/display/drm_dp_typec_helper.c

-- 
2.39.1.519.gcb327c4b5f-goog

