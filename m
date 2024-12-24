Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C089FC13F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 19:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB8B10E48F;
	Tue, 24 Dec 2024 18:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bomyqqyl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E026310E48F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 18:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1735064577;
 bh=jAFb17WiglcXqROhm1UFDinGC0D36h9W5e3s5HYPpeU=;
 h=From:Subject:Date:To:Cc:From;
 b=bomyqqylwXu0jgN8X2X+LPdWAFDrmd0bWZ+VEGe46pFU0mg+19uZP1I0F30adjUXV
 of2X0NvzW4E2In13KjE0+7ZMJHdMos87t7sQbjVOQqcGfichDjgxDMgXdOp3KtjJC1
 CHdSB6vCLg7PEpXV0xYGvoAqWk107TNO7exyku7xtER7QUjumicPE3rn8FfIQbPhFL
 CcqxmjcSEq64z5iEere056+kHJgjQSAW2xlxu5xdoXNNhbuMWPKcKh+0Wpl/RWbLs2
 wSEJ1kEb2MF3c3ionRXDMWbgfN7F2OVcuYprzUjkd84GyrsYEJx2flGMmkbL2aaC5T
 7zcJ4xlcyS/Fw==
Received: from localhost (unknown [84.232.140.38])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3594E17E15AD;
 Tue, 24 Dec 2024 19:22:57 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v4 0/4] Fix ycbcr_420_allowed inconsistency for HDMI
 bridges
Date: Tue, 24 Dec 2024 20:22:40 +0200
Message-Id: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPD7amcC/4XNQQ6CMBAF0KuQrq3ptNBWV97DuKBDK02AkkKIh
 nB3CxuNkZhZ/Z/8NzMZbPR2IOdsJtFOfvChSyE/ZATrsrtb6quUCWc8BxCMmuir1GLoOurakfb
 RB4oFKIScKVsVJE37aJ1/bOz1lnLthzHE5/ZlgrX9A05A0+XSSCkcKCcuGJqmNCGWRwwtWdGJv
 yHO5A7EE6QL1KAKfjJa/4LEBwRqBxKUUWHRCNQOmXTf0LIsL5AR7fZOAQAA
X-Change-ID: 20241130-bridge-conn-fmt-prio-c517c1407ed5
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

Bridges with DRM_BRIDGE_OP_HDMI set in drm_bridge->ops are expected to
rely on drm_bridge->supported_formats to advertise the supported
colorspaces, including HDMI_COLORSPACE_YUV420.

However, when drm_bridge_connector gets initialised, only
drm_bridge->ycbcr_420_allowed is considered in the process of adjusting
the drm_connector->ycbcr_420_allowed, which effectively discards the
formats advertised by the HDMI bridge.

This patchset tries to address the issue by prioritizing
supported_formats over ycbcr_420_allowed.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v4:
- Moved the adjustment of bridge connector's supported_formats to a
  separate patch (Dmitry)
- Collected Dmitry's R-b tag for patch "drm/connector: hdmi: Validate
  supported_formats matches ycbcr_420_allowed"
- Rebased series onto drm-misc-next-2024-12-19
- Added new patch to extend HDMI connector output format tests (Maxime)
- Link to v3: https://lore.kernel.org/r/20241217-bridge-conn-fmt-prio-v3-0-3ecb3c8fc06f@collabora.com

Changes in v3:
- Simplified the inconsistency handling by overwriting ycbcr_420_allowed
  for HDMI bridges before adding them to the global bridge list
- Added a 2nd patch to check if supported_formats matches
  ycbcr_420_allowed on HDMI connector initialization (Dmitry)
- Link to v2: https://lore.kernel.org/r/20241206-bridge-conn-fmt-prio-v2-1-85c817529b88@collabora.com

Changes in v2:
- Wrapped HDMI_COLORSPACE_YUV420 flag in the BIT() macro to properly
  check its presence in supported_formats
- Ensured YUV420 gets removed from the bitmask passed to
  drmm_connector_hdmi_init() when ycbcr_420_allowed is not set
- Link to v1: https://lore.kernel.org/r/20241130-bridge-conn-fmt-prio-v1-1-146b663f17f3@collabora.com

---
Cristian Ciocaltea (4):
      drm/bridge: Prioritize supported_formats over ycbcr_420_allowed
      drm/bridge-connector: Sync supported_formats with computed ycbcr_420_allowed
      drm/connector: hdmi: Validate supported_formats matches ycbcr_420_allowed
      drm/tests: connector: Add ycbcr_420_allowed tests

 drivers/gpu/drm/display/drm_bridge_connector.c |  8 +++-
 drivers/gpu/drm/drm_bridge.c                   |  4 ++
 drivers/gpu/drm/drm_connector.c                |  3 ++
 drivers/gpu/drm/tests/drm_connector_test.c     | 60 ++++++++++++++++++++++++++
 4 files changed, 73 insertions(+), 2 deletions(-)
---
base-commit: 1e93f594285faef57651a0c89f61a7d976db7def
change-id: 20241130-bridge-conn-fmt-prio-c517c1407ed5

