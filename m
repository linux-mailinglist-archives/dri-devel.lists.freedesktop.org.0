Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF7A9526F0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 02:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2B410E32E;
	Thu, 15 Aug 2024 00:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XDP5loxy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFAB10E32E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 00:34:21 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-201cd78c6a3so3558095ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 17:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723682061; x=1724286861;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+xjN9kIEu5wH5/2WbxCA/p/bZEADNVbfHtt+xxi3fKI=;
 b=XDP5loxyvEFHU5TM+9QIEH/LFD0i5YdrwMULzbBhvk3e3iUPh6Swy68RsdvpdX0VMf
 3JS41WDI/eSlr/nV0JU4ZetmFYcru/ESkA/hXAwsNOhJD62fWxVvbcxA+uYTD6d+5Pfo
 oXBmqxWxC6/JDFOIDyygGDvLU6CDf/BD+0kvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723682061; x=1724286861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+xjN9kIEu5wH5/2WbxCA/p/bZEADNVbfHtt+xxi3fKI=;
 b=eNt+U6ZKWWANsfsCsLeyutoimh9tlxcNLv940+7hRO9jTJ9CP6ORYYvniF/RSNwf8o
 9aLcBx0f7ZyEPIPOqTfCKjqO+S+hBUk8R+u2UuGBUVIIi6gP6gpJwRwoLtWLELQ3r/LX
 0eghCgEg1np8acY3hF/dgUOMyS92QxDE1tN1EPmi36gll8XVS4CdU9GHKvu/3joM7cfP
 U3iyzFv8hZy2Pso9vond/QPgomNDD2m3AKZh8sut3z7BeVY7Nn2GQBggpGNmBQ1jxBNM
 rpvzJLrnx5LNZ3kr9ap/UNNvuNxOJbaSyEFCHRDtr030F7uzHt/FLZXt+d9xjJAVt4Sj
 Uo7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKyv0H6fU2fX76dQuDFMtNjhV8td6zGAdfwRduSCMXmDUVHHR8hzeB1BQ6chmSwl/57ZUL3ysCAVFnB4eZi7Yacp2xj2G9vjfALlOrfDwG
X-Gm-Message-State: AOJu0YxJMLiavAX6zEnNOlUY+lE4fSUXJR0B8mDkoWA4a/P4R+Ef4wS6
 yJ80xGVgPoclwpC6T9AjqHoH7+Bw56u8LEnqoQ9nYcJLfVi0YdJ+1qb7hG6Khg==
X-Google-Smtp-Source: AGHT+IEjqvtfOX9G1jrFlNd9tSXOoFbJa4G48NKyJpa5AH9EMXwfrR+9p7yCc2aO3g9MrGDIaHGkdg==
X-Received: by 2002:a17:903:32d1:b0:201:e7e6:acb1 with SMTP id
 d9443c01a7336-201e7e6b02dmr31351645ad.59.1723682061223; 
 Wed, 14 Aug 2024 17:34:21 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-201f038b4c1sm1983875ad.207.2024.08.14.17.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 17:34:20 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 00/11] platform/chrome: Add DT USB/DP muxing/topology
 support
Date: Wed, 14 Aug 2024 17:34:05 -0700
Message-ID: <20240815003417.1175506-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
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

This series adds support for fully describing the USB/DP topology on
ChromeOS Trogdor devices in DT. Trogdor devices have a single DP phy in
the AP that is muxed to one of two usb type-c connectors depending on
which port asserts HPD first to the EC. We'd like to know which port is
connected to an external monitor to provide a better experience to the
user about things like which type-c port is displaying DP or which
type-c hub is acting up, etc. Describing the connection all the way from
the source to the connector will allow us to do this.

DRM core patches: These are used to implement lane assignment for DP
altmode configurations through the drm_bridge code. The typec code will
use this to tell the DP phy how many lanes of DP to drive and which
lanes to drive out to the USB type-c connector. Adding support for lane
assignment allows us to implement DP muxing as well, physically
splitting the DP lanes on the DP phy so that hardware doesn't have to
use an analog mux to steer two DP lanes to one or the other type-c port.

DRM aux hpd patches: These implement an auxiliary device for USB type-c
DP alternate mode. I took Dmitry's suggestion and moved the code that
does the remapping into this driver. The existing hpd bridge is wrapped
so as to avoid changing the current users.

Cros EC typec patches: This ties together everything that comes before it in
this series. The EC typec driver registers the drm_dp_typec_bridge that
can signal HPD from the type-c connector through the bridge chain, mux
the DP phy in software so that we don't have to use an analog mux, and
implement orientation control for boards like Kukui that directly
connect the DP phy to the type-c port, necessitating lane assignment to
flip the lanes to match the cable orientation.

I'm thinking of working in changes so that the drm_dp_typec_bridge
registers a 'struct typec_mux_dev' as well. If that is done then we can
register a drm_dp_typec_bridge from the port manager and let the type-c
framework drive the pin assignment and orientation directly instead of
calling it from the port manager layer. To get there I need to add the
ability for a 'struct typec_mux_dev' to associate with more than one
typec_port (technically already done) and then make sure that the
cros_ec_typec driver doesn't try to enable DP altmode on the type-c port
that isn't muxed for DP. I'm working on this now but I'm sending this
out to get some feedback because I've reached a good stopping place.

Changes from v1: https://lore.kernel.org/r/20240210070934.2549994-1-swboyd@chromium.org
 * Too many to count!
 * Split out the DRM bits into this series
 * Moved the logic into dp-aux-hpd bridge driver
 * Drive the bridge from cros_ec_typec driver instead of globbing onto
   the ACPI centric cros-typec-switch driver
 * During that process drop a lot of patches that aren't needed anymore
 * Move the DT graph and other properties to the cros-ec-typec binding
 * Skip mode-switch/orientation-switch properties because we're not
   registering typec structs anymore

Stephen Boyd (11):
  drm/atomic-helper: Introduce lane remapping support to bridges
  drm/bridge: Verify lane assignment is going to work during
    atomic_check
  drm/bridge: aux-hpd: Support USB Type-C DP altmodes via DRM lane
    assignment
  drm/bridge: dp_typec: Support USB Type-C orientation
  drm/bridge: dp_typec: Add "no-hpd" support
  drm/bridge: dp_typec: Allow users to hook hpd notify path
  dt-bindings: chrome: Add ports to google,cros-ec-typec for DP altmode
  platform/chrome: cros_ec_typec: Add support for signaling DP HPD via
    drm_bridge
  platform/chrome: cros_ec_typec: Support DP muxing via DRM lane
    assignment
  platform/chrome: cros_ec_typec: Support DP orientation
  platform/chrome: cros_ec_typec: Handle lack of HPD information

 .../bindings/chrome/google,cros-ec-typec.yaml | 260 +++++++++++++
 .../bindings/mfd/google,cros-ec.yaml          |   7 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c       | 368 +++++++++++++++++-
 drivers/gpu/drm/drm_atomic_state_helper.c     |   2 +
 drivers/gpu/drm/drm_bridge.c                  |  50 +++
 drivers/platform/chrome/Kconfig               |   1 +
 drivers/platform/chrome/cros_ec_typec.c       | 208 +++++++++-
 drivers/platform/chrome/cros_ec_typec.h       |   8 +-
 include/drm/bridge/aux-bridge.h               |  62 +++
 include/drm/drm_atomic.h                      |  31 ++
 include/drm/drm_bridge.h                      |   4 +
 11 files changed, 983 insertions(+), 18 deletions(-)


base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
-- 
https://chromeos.dev

