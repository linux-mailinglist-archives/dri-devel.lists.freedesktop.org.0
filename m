Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F4A7C4545
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 01:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E4610E3FB;
	Tue, 10 Oct 2023 23:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2071210E08C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 23:10:21 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2bff776fe0bso80487651fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 16:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696979419; x=1697584219; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1PVwEVZvfBSDD5d8UZhpkgKfPZQ+0l26q5U0eEBP3cM=;
 b=OMuncPx0LKlKV6U+ZlNrwhr3wd7xUwVayKBHc/TuWw+uNW9tSlmiCiyOBkf3s4RyhL
 ZeHLSEx9nFtQmZanDJv0kljCytyd3ogumLi/sXPPVWiTk4d7JDjf7XLoqdWx2UhkZVJX
 FsLSo3SVVlnV2JGNdV2aa0Hc5ZoVEaRuDQEFq9tcMSqo7k9ZnCrnwFO+qogUejFQGZ46
 pBFj/3D9MGs+Rt/lpgIfqMDrbhJPuov8DSS9H/jWjhfm51zb3vAJ2XaQw7Lxsjrd40v2
 oXeCO0oCjDzfojckfdgWT2HOO/1OSAQK8qA9kYrArKk7YiMhiEm0scmCITAMauyj7s18
 9rHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696979419; x=1697584219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1PVwEVZvfBSDD5d8UZhpkgKfPZQ+0l26q5U0eEBP3cM=;
 b=akCSwjWhAg4ZfxlfEuX66etuoLdf/3fVlGNg3eYcKei11LjEsXWtQClooeIgSHviUC
 AOcy0DhGHtrC+QK2ylN+jetXALpnD5m4Ta5Aao4XGi5pskAJl9SkbM9Hwc6mmz0lNY1T
 O+fVdwzWIuVIzqA7hjYuHJypOmHcpsSWyPcO3kOn9mioxC3L2Z7r+J+f/cylxlZ+HVkI
 qK1RYyPikWRhGhkZerXMUsS8dggr4sfvkDKfuJq93qmyIfevpYUxLl9UYbBivlMRJLX/
 jBVGj6x6p95OLITyOOzeQ1AQ0WGt6i5Cp+gaHVxp/rj8+bzKObpbgNuamsCULVJQeu8X
 ZBkg==
X-Gm-Message-State: AOJu0YxdgfkUd+owlE7lhhK25mRvi0Z5K6RRtI/99tqgd+RBOkjOCPw4
 HQ2/4Tp0Jt+kux72Y/2iM/t6xg==
X-Google-Smtp-Source: AGHT+IHzC7VAJwHBIwZnsBz9+yJMjFzhwQb9W4iUEnN/3lFIYSrR0mUHG3GMEpkhU798pd11+uJUDw==
X-Received: by 2002:a2e:8816:0:b0:2bc:db99:1775 with SMTP id
 x22-20020a2e8816000000b002bcdb991775mr16410708ljh.26.1696979419245; 
 Tue, 10 Oct 2023 16:10:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a2e8788000000b002bcdbfe36b9sm2658033lji.111.2023.10.10.16.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 16:10:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 0/3 RESEND] drm: simplify support for transparent DRM
 bridges
Date: Wed, 11 Oct 2023 02:10:15 +0300
Message-Id: <20231010231018.77381-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Resending since the discussion with Laurent has died with no response
received for more than three weeks]

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

Changes since v3:
 - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
 - Renamed it to aux-bridge (since there is already a simple_bridge driver)
 - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
 - Added missing kfree and ida_free (Dan Carpenter)

Changes since v2:
 - ifdef'ed bridge->of_node access (LKP)

Changes since v1:
 - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge

Dmitry Baryshkov (3):
  drm/bridge: add transparent bridge helper
  phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
  usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE

 drivers/gpu/drm/bridge/Kconfig            |   9 ++
 drivers/gpu/drm/bridge/Makefile           |   1 +
 drivers/gpu/drm/bridge/aux-bridge.c       | 132 ++++++++++++++++++++++
 drivers/phy/qualcomm/Kconfig              |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c |  44 +-------
 drivers/usb/typec/mux/Kconfig             |   2 +-
 drivers/usb/typec/mux/nb7vpq904m.c        |  44 +-------
 include/drm/bridge/aux-bridge.h           |  19 ++++
 8 files changed, 167 insertions(+), 86 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
 create mode 100644 include/drm/bridge/aux-bridge.h

-- 
2.39.2

