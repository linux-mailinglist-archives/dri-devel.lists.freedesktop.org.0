Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD13E7681DC
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 22:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B7010E037;
	Sat, 29 Jul 2023 20:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA50510E037
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 20:43:11 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fe1c285690so4119376e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 13:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690663389; x=1691268189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jDXmcqoxmADeVwH/tIKhJpnlMjbMtWv3iZzEIatWUZw=;
 b=HkMSKw6/PCLIipl8FiTm78l3ypb7hctz3Xfn/gOmLxJ/fYuTukfw1ejsn/q0zK9UsT
 SH116GxJEl/Q3dsvRSUzTfiDC/m3WqJJ3uXeM43aHy2kibo+wXbS5rzAV+OUEeggBXAb
 NoLaD9pQT/8b09UhE7o3an3Z2kFRUna54v5EhMcUJHgw7kNzD2v0NRvJyaP1r9BjbDvx
 nhd1YOfm7+SDwoa6D+RNDhefq9NwGHjXs0YcGumW1kjNN+gUq4CRXEZ5+jshOemMmtp8
 9+yr+9hi3uY1prDiJaMnNe6FofthZLm+kJmx4+Wkcd68hdrIwL/92SRyPp2qmqzMuwu8
 UxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690663389; x=1691268189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jDXmcqoxmADeVwH/tIKhJpnlMjbMtWv3iZzEIatWUZw=;
 b=HA80iLtSrZw7sxarpmLknpUXbORIgGvrbZ9OA3Fzzbk/eeNWlMpdrghYfpliBgliGo
 Uz+flKuZvxuHAoJ8KSvuKnaqXTJKpxEsDRm6TaELgghJm+AbmlRvTcPVKN45hZXHBhvi
 P74Qt3EbLNrVnyUJRfriAXjf7LQ1CLJ9MNsyz3Ra3FYvTRpPIX7ZZkF5KxIxeC96aER/
 clKbk70AmelRw5sIKPHgdqAqOAxRL/B/JBfn0iuBVKDfAvsP85p5smUd+zQS3QJ16fzu
 0SX3dtzKEbU3hCzsz3CIuKEtTHq/1G+OItq61aeXF/eiMQ2zAr95meilp5AOiKmOKOof
 zJEw==
X-Gm-Message-State: ABy/qLYb5v2aK28xDwRJSivCi7jSrYtlFkrgOfNYjXyi51MAiHDwwCbh
 NUtUyCf1tTKbbVktQXWUBfYe6g==
X-Google-Smtp-Source: APBJJlEG7RXwuvRy6gHyJpQWKQOXsq5ExDxgmuPzEO/9ZMBjN/9HwLfl4RJQVaeeQPngeNEsL7Yydg==
X-Received: by 2002:a2e:b0d1:0:b0:2b9:4ac9:6071 with SMTP id
 g17-20020a2eb0d1000000b002b94ac96071mr3844531ljl.10.1690663389536; 
 Sat, 29 Jul 2023 13:43:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a2e9614000000b002b9af8422a8sm1705177ljh.130.2023.07.29.13.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 13:43:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] drm/display: simplify support for transparent DRM bridges
Date: Sat, 29 Jul 2023 23:43:04 +0300
Message-Id: <20230729204307.268587-1-dmitry.baryshkov@linaro.org>
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
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Supporting DP/USB-C can result in a chain of several transparent
bridges (PHY, redrivers, mux, etc). This results in drivers having
similar boilerplate code for such bridges.

Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
bridge can either be probed from the bridge->attach callback, when it is
too late to return -EPROBE_DEFER, or from the probe() callback, when the
next bridge might not yet be available, because it depends on the
resources provided by the probing device.

Last, but not least, this results in the the internal knowledge of DRM
subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.

To solve all these issues, define a separate DRM helper, which creates
separate aux device just for the bridge. During probe such aux device
doesn't result in the EPROBE_DEFER loops. Instead it allows the device
drivers to probe properly, according to the actual resource
dependencies. The bridge auxdevs are then probed when the next bridge
becomes available, sparing drivers from drm_bridge_attach() returning
-EPROBE_DEFER.

Proposed merge strategy: immutable branch with the drm commit, which is
then merged into PHY and USB subsystems together with the corresponding
patch.

Dmitry Baryshkov (3):
  drm/display: add transparent bridge helper
  phy: qcom: qmp-combo: switch to DRM_SIMPLE_BRIDGE
  usb: typec: nb7vpq904m: switch to DRM_SIMPLE_BRIDGE

 drivers/gpu/drm/display/Kconfig             |   9 ++
 drivers/gpu/drm/display/Makefile            |   2 +
 drivers/gpu/drm/display/drm_simple_bridge.c | 120 ++++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                |   3 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c   |  44 +------
 drivers/usb/typec/mux/Kconfig               |   3 +-
 drivers/usb/typec/mux/nb7vpq904m.c          |  44 +------
 include/drm/display/drm_simple_bridge.h     |  19 ++++
 8 files changed, 156 insertions(+), 88 deletions(-)
 create mode 100644 drivers/gpu/drm/display/drm_simple_bridge.c
 create mode 100644 include/drm/display/drm_simple_bridge.h

-- 
2.39.2

