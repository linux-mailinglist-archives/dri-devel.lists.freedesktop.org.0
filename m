Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D047859054
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 16:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA2A10E4A7;
	Sat, 17 Feb 2024 15:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Sk6Bj7qn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243F610E3C5;
 Sat, 17 Feb 2024 15:03:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4B8F2CE09F2;
 Sat, 17 Feb 2024 15:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF3FC43399;
 Sat, 17 Feb 2024 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708182183;
 bh=RYGrgArfEQO1hz4ZDJrYc151D2jwcPj4HsJMgduGqdg=;
 h=From:To:Cc:Subject:Date:From;
 b=Sk6Bj7qnkUtxpPu7r0OWOEKX33/NEitQ5TtRnYdKJx+5sZ2r+IdHyM4505BXrMdz7
 GQebIt2mgAB3H+iuiVvivn25osbNIPGGdUUA6Sy7we/HmOoNHmvZ29aY/D1v/3OXKD
 P0bwBYQVv0Ddw4ZaTUT+gKpRcQrYUqIJMifT/Fi8HGaiNqwKjJbCouYHnoGUUkhJwI
 Bbf7tsUiicb0WSQafeUfOO4SvhcBn4jAy7CpR1tGSBqOarXQ+/gZF8xYjmsOgZNnzD
 AqUCkvJtcEa+vQ7aB1sdYH+ZhJa3h5ARzbrw4zE8XlUbS07GjIwzvSopeuJnp/v7Nw
 PeCQwYiphYhEw==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan+linaro@kernel.org>) id 1rbMDW-000000001Vm-1iMa;
 Sat, 17 Feb 2024 16:03:02 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
Date: Sat, 17 Feb 2024 16:02:22 +0100
Message-ID: <20240217150228.5788-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.0
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

Starting with 6.8-rc1 the internal display sometimes fails to come up on
machines like the Lenovo ThinkPad X13s and the logs indicate that this
is due to a regression in the DRM subsystem [1].

This series fixes a race in the pmic_glink_altmode driver which was
exposed / triggered by the transparent DRM bridges rework that went into
6.8-rc1 and that manifested itself as a bridge failing to attach and
sometimes triggering a NULL-pointer dereference.

The intermittent hard resets that have also been reported since 6.8-rc1
unfortunately still remains and suggests that we are dealing with two
separate regressions. There is some indication that also the hard resets
(e.g. due to register accesses to unclocked hardware) are also due to
changes in the DRM subsystem as it happens around the time that the eDP
panel and display controller would be initialised during boot (the
runtime PM rework?). This remains to be verified, however.

Included is also a fix for a related OF node reference leak in the
aux-hpd driver found through inspection when reworking the driver.

The use-after-free bug is triggered by a probe deferral and highlighted
some further bugs in the involved drivers, which were registering child
devices before deferring probe. This behaviour is not correct and can
both trigger probe deferral loops and potentially also further issues
with the DRM bridge implementation.

This series can either go through the Qualcomm SoC tree (pmic_glink) or
the DRM tree. The PHY patches do not depend on the rest of the series
and could possibly be merged separately through the PHY tree.

Whichever gets this to mainline the fastest.

Johan


[1] https://lore.kernel.org/lkml/ZctVmLK4zTwcpW3A@hovoldconsulting.com/


Johan Hovold (5):
  drm/bridge: aux-hpd: fix OF node leaks
  drm/bridge: aux-hpd: separate allocation and registration
  soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
  phy: qcom-qmp-combo: fix drm bridge registration
  phy: qcom-qmp-combo: fix type-c switch registration

Rob Clark (1):
  soc: qcom: pmic_glink: Fix boot when QRTR=m

 drivers/gpu/drm/bridge/aux-hpd-bridge.c   | 70 ++++++++++++++++++-----
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 16 +++---
 drivers/soc/qcom/pmic_glink.c             | 21 +++----
 drivers/soc/qcom/pmic_glink_altmode.c     | 16 +++++-
 include/drm/bridge/aux-bridge.h           | 15 +++++
 5 files changed, 102 insertions(+), 36 deletions(-)

-- 
2.43.0

