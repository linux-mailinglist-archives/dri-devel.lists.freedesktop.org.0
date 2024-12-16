Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6709F3DC9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 23:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1EA10E0AD;
	Mon, 16 Dec 2024 22:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Nl/1ALuF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A3710E0AD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 22:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734389682;
 bh=NH3AgonOJDLYtaMkD1sV08KHOIcuLuMJl/JutU6HH7U=;
 h=From:Subject:Date:To:Cc:From;
 b=Nl/1ALuFWj3sUR3E4s/v6QMzrysbxrVcF5j3O7Wd2Y3monQfvs6cMST3MZT2wMggZ
 CWUqDl+pGrrVsF6m7H6I0jq/iwAElHQ0v8Q/JxDOv5iEm6YJjpJWEmDTGoyYtoKpJF
 4QNfLEWdHwdc4WjY0Jv2HR5tInnWGQJfgBKaN0Vw0rRlbGH6NMowkE2mjw1dj5uCPu
 CAi7OIJTUXm0LupMHNwfDgw9ww0wWlB6TzCDh5j/DwenGXyzpP64L+VslCxpqcIjnJ
 QbiFNytHL246GcB873p9TW+bqIgJJ8MOjJ8qetYJF76rh++0Qw3Uz6DwUIWfn4lbA9
 too6snvtzUTeQ==
Received: from localhost (unknown [188.27.48.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9430217E3830;
 Mon, 16 Dec 2024 23:54:42 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v3 0/2] Fix ycbcr_420_allowed inconsistency for HDMI
 bridges
Date: Tue, 17 Dec 2024 00:54:06 +0200
Message-Id: <20241217-bridge-conn-fmt-prio-v3-0-3ecb3c8fc06f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI6vYGcC/4XNTQrDIBAF4KsU17U4Gn/aVe9RuohGGyHRoEFaQ
 u5ek02hUMqs3oP3zYKyTd5mdDksKNnis4+hBnY8INO34WGx72pGlNAGgBGsk+9qa2II2I0znpK
 P2HCQBhoibcdRnU7JOv/c2du95t7nOabX/qXA1v4BC+B6jdBCMAfSsauJw9DqmNqTiSPa0EI/E
 CXiB0QrpLhRIDk9a6W+oXVd31MPNtsFAQAA
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
Cristian Ciocaltea (2):
      drm/bridge-connector: Prioritize supported_formats over ycbcr_420_allowed
      drm/connector: hdmi: Validate supported_formats matches ycbcr_420_allowed

 drivers/gpu/drm/display/drm_bridge_connector.c | 8 ++++++--
 drivers/gpu/drm/drm_bridge.c                   | 4 ++++
 drivers/gpu/drm/drm_connector.c                | 3 +++
 3 files changed, 13 insertions(+), 2 deletions(-)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20241130-bridge-conn-fmt-prio-c517c1407ed5

