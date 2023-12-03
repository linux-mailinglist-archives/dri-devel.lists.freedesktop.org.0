Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A17802355
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A847210E29D;
	Sun,  3 Dec 2023 11:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294F410E29C
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:43:36 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40bda47b7c1so14844225e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701603814; x=1702208614; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SxbKBXKaOzx3/nX++/IEYvlJe8A11NOZYUGsnN9FBBY=;
 b=BDWS+IVprhoEA78cJiZLApz+qlosDXSIt+lFB7NKA5dAvgnZ6OS2DaFRsuPTVMaCaO
 2zaPsUq0OngD5Osn9hBz0o96S1yaELyzC95rWHBn/sOPLdxaIT/ukDICdVJjYMiy+stM
 sozIBOrOXQAbjTb2kp195LDYbJIp0Mgt/ZlbYtwQV2oMytY5oqMh5VMCot/GzsRoaK69
 neEKk2ldQ7Xiw4jeULzz4vD+OtmdBy9oKT1iSNaw6mLhmaMc/+YxJI959MZrJEyoOWql
 hZWs2nmugVN5G+FF8JAZb+sroDrVfM+K2vQdfhRGCKTjsNmWEkyyo2QQ7lyIdyo8NG2A
 ftMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701603814; x=1702208614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SxbKBXKaOzx3/nX++/IEYvlJe8A11NOZYUGsnN9FBBY=;
 b=liO22HIZX7Sg2H6AdEqRWYQHufkCKLOkpi+pK2HPWQtYoHIBEG0zz322caaJ8Bt4yr
 Cw+G0SRJfsY/twpS6u060xCQuEg8oZonYs7infgEhkc9aAzY2pNbAr/Wudoj4UANcAfe
 5j0RW3Z2xLeFcfF48CZI0oapgoh70kI7VlkjXPZebrp7cjtSy7cD7T3NiHaN1jD8dZHO
 8kay/+o1/KF45gVflHA7O09ah+5IDN0tBAk8plyWzq1YfVO8sLH4HGCL3u9a8AE9/OYd
 HRELRzI3PmWN+NuVL3oZ39Udqq7N4Er5OM2CiQGV88Tsybx0J/8QHS/MS9wWSYMRyj6q
 384A==
X-Gm-Message-State: AOJu0YzAD9QdRAkYcczpGr86aMHIXqcokJk1X0iFRyLQ82RhaUjGk2IX
 hljryV/NST78iPyZz8xXkN/XhA==
X-Google-Smtp-Source: AGHT+IFdlXbi66bdK9azUEA/kFeRtMy70HvUZr1Nq1VwrzdZy0ztuHZBa7GKWBHTMGCpnYETs9x7YA==
X-Received: by 2002:a05:600c:2d4c:b0:40b:5f03:b428 with SMTP id
 a12-20020a05600c2d4c00b0040b5f03b428mr914549wmg.330.1701603814301; 
 Sun, 03 Dec 2023 03:43:34 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a2e90d1000000b002c993c5d4c6sm894666ljg.105.2023.12.03.03.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:43:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH RESEND 0/6] drm: simplify support for transparent DRM bridges
Date: Sun,  3 Dec 2023 14:43:27 +0300
Message-Id: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Greg, could you please ack the last patch to be merged through the
drm-misc tree? You have acked patch 3, but since that time I've added
patches 4-6.

Supporting DP/USB-C can result in a chain of several transparent
bridges (PHY, redrivers, mux, etc). All attempts to implement DP support
in a different way resulted either in series of hacks or in device tree
not reflecting the actual hardware design. This results in drivers
having similar boilerplate code for such bridges.

Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
bridge can either be probed from the bridge->attach callback, when it is
too late to return -EPROBE_DEFER, or from the probe() callback, when the
next bridge might not yet be available, because it depends on the
resources provided by the probing device. Device links can not fully
solve this problem since there are mutual dependencies between adjancent
devices.

Last, but not least, this results in the the internal knowledge of DRM
subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.

To solve all these issues, define a separate DRM helper, which creates
separate aux device just for the bridge. During probe such aux device
doesn't result in the EPROBE_DEFER loops. Instead it allows the device
drivers to probe properly, according to the actual resource
dependencies. The bridge auxdevs are then probed when the next bridge
becomes available, sparing drivers from drm_bridge_attach() returning
-EPROBE_DEFER.

Changes since v5:
 - Removed extra semicolon in !DRM_AUX_HPD_BRIDGE stubs definition.

Changes since v4:
 - Added documentation for new API (Sima)
 - Added generic code to handle "last mile" DP bridges implementing just
   the HPD functionality.
 - Rebased on top of linux-next to be able to drop #ifdef's around
   drm_bridge->of_node

Changes since v3:
 - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
 - Renamed it to aux-bridge (since there is already a simple_bridge driver)
 - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
 - Added missing kfree and ida_free (Dan Carpenter)

Changes since v2:
 - ifdef'ed bridge->of_node access (LKP)

Changes since v1:
 - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge


Dmitry Baryshkov (6):
  drm/bridge: add transparent bridge helper
  phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
  usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
  drm/bridge: implement generic DP HPD bridge
  soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
  usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE

 drivers/gpu/drm/bridge/Kconfig                |  17 ++
 drivers/gpu/drm/bridge/Makefile               |   2 +
 drivers/gpu/drm/bridge/aux-bridge.c           | 140 +++++++++++++++
 drivers/gpu/drm/bridge/aux-hpd-bridge.c       | 164 ++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                  |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  44 +----
 drivers/soc/qcom/Kconfig                      |   1 +
 drivers/soc/qcom/pmic_glink_altmode.c         |  33 +---
 drivers/usb/typec/mux/Kconfig                 |   2 +-
 drivers/usb/typec/mux/nb7vpq904m.c            |  44 +----
 drivers/usb/typec/tcpm/Kconfig                |   1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c |  41 +----
 include/drm/bridge/aux-bridge.h               |  37 ++++
 13 files changed, 383 insertions(+), 145 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.c
 create mode 100644 include/drm/bridge/aux-bridge.h

-- 
2.39.2

