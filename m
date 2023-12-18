Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD53817AC9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0102B10E392;
	Mon, 18 Dec 2023 19:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AF410E390
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1702926927; x=1734462927;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L1IZpJnkrjKw6gk/ZULIbhgFejfVx0y7LY8i+plpv0U=;
 b=UaXpE2io0C7zEBR4V9XVeB9dp8CGPhaYH/GcqL5HnKuUJG5r+LXoma4+
 xYM5r/tlc6+Tmb4enK73YigoXrL69MOZNnz2o5Kr1kYLv9Ibi4FiehyXV
 rKpfdp4+2gzcSHqyW3GNZD0kfizOSJ5yOrem48qS7Vz1v/Zp2/ckUPxCC
 w6ysVhIYt0+Fo85lDQisCxSiMSPcZmZCD2tozBv1BjRUXLdAieNP5M1Nj
 F8D7oZ2NdS8RF+rMVEwO4BglP7jt8/vlmJpJZ5LcajsT6tPjNfJgRClLG
 yBqFk3wR2tpD46esc3oIZYmNLVHmjapDDP6/Ol6gqn2gSHs3Pxmb7b+8I Q==;
X-IronPort-AV: E=Sophos;i="6.04,285,1695679200"; d="scan'208";a="34559829"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Dec 2023 11:57:20 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 630C4280075;
 Mon, 18 Dec 2023 11:57:20 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 0/6] dev_err_probe usage for imx8qxp DPU pipeline
Date: Mon, 18 Dec 2023 11:57:12 +0100
Message-Id: <20231218105718.2445136-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

while working on i.MX8QXP DPU/LVDS output I come across these fixes simplifying
the code and improving debugging, while also creating less noise.
It touches several files as the output pipeline is rather complex.

Best regards,
Alexander

Alexander Stein (6):
  drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
  drm/bridge: imx: imx8qxp-ldb: Use dev_err_probe
  drm/bridge: imx: imx-ldb-helper: Use dev_err_probe
  drm/bridge: imx8qxp-pixel-link: Use dev_err_probe
  drm/bridge: dpu-dprc: Use dev_err_probe
  drm/bridge: dpu-core: Don't print error on -EPROBE_DEFER

 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c   | 13 ++-----
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c      | 37 ++++++-------------
 .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 19 +++-------
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c  | 26 ++++---------
 drivers/gpu/drm/imx/dpu/dpu-core.c            |  7 ++--
 drivers/gpu/drm/imx/dpu/dpu-dprc.c            | 12 +++---
 6 files changed, 39 insertions(+), 75 deletions(-)

-- 
2.34.1

