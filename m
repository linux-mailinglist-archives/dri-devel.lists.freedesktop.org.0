Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD10AE0D5B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 21:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C98610E11A;
	Thu, 19 Jun 2025 19:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VqJa+ewG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7713A10E105
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 19:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750360656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WNxeSCCnet4CkHdiyZTAAA1x8X2Y0UCpmMOTSw5+y8Q=;
 b=VqJa+ewG4ANahctR5JOj5H5443f7ok+FvWFZUY8+yQyAcUWz8772G6fUD0x4Trz9opZkQ8
 ZIBRrSw+kkToRc8W+Rd7s6OtBeSzgKz46M7Hz87NJ1QSMyFY+ptlni2aH6DQy++PC57IRj
 yMpcvl7b3c9CNUgyKO5FJZ5sScNgR0U=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-400-w8KCcdW6PGyi6iZAp38mQA-1; Thu,
 19 Jun 2025 15:17:32 -0400
X-MC-Unique: w8KCcdW6PGyi6iZAp38mQA-1
X-Mimecast-MFC-AGG-ID: w8KCcdW6PGyi6iZAp38mQA_1750360647
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DBFE31800287; Thu, 19 Jun 2025 19:17:25 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8720C19560A3; Thu, 19 Jun 2025 19:17:14 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH v2 00/16] Use drm_panel_get/put() in of_drm_find_panel()
 and its callers
Date: Thu, 19 Jun 2025 14:15:52 -0500
Message-Id: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOhhVGgC/3WNzQqDMBCEX0X23JQk/lR68j2KSJps6kJNZCPSI
 r57U+m1MAx8c/hmg4RMmOBabMC4UqIYMuhTAXY04YGCXGbQUteyUaW4VyL6wfE0eApumE3AZ25
 elDCuvtjKt62RFrJgZvT0OuS3PvNIaYn8Pr5W9V1/WvnfuSohhW1KjSqnVK5jdKNZzjZO0O/7/
 gFd/HAlwgAAAA==
X-Change-ID: 20250613-b4-of_drm_find_panel_part1-ad57c4f88a0c
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750360565; l=2637;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ZRNWhl8tPiNTSHULKlMX4iESdr8yY7z89H/qS9FJwy0=;
 b=Me2aDfseSSjZKBVpcXSnUNCCs9+uXI061gfe7inuN4RHWSfozagYa7azYKoJZFsAPN+vtWMQi
 myeZo0xBVRuAOyI4/S7anI0CzZlg6ddvE/fGlnFUC6pTGERGIA6vnNJ
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

of_drm_find_panel() returns a pointer to a panel which the caller
holds to either do panel setup with the prepare(), enable() like
panel helpers or for APIs like devm_drm_panel_bridge_add(),
devm_drm_panel_bridge_add_typed() which expect a panel.
Either way, once the driver no longer needs the panel,
put it down with a drm_panel_put()

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Changes in v2:
- Get the missing reference in of_drm_find_panel()
- Add changes to all drivers that call of_drm_find_panel() 
- Link to v1: https://lore.kernel.org/r/20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com

---
Anusha Srivatsa (16):
      drm/panel: get/put panel reference in drm_panel_add/remove()
      drm/panel: get the panel returned by of_drm_find_panel()
      drm/panel/samsung-dsicm: Keep up with refcounting
      drm/panel/sun4i: Keep up with refcounting
      drm/panel/exynos: Keep up with refcounting
      drm/panel/rcar_du_encoder: Keep up with refcounting
      drm/panel/rz-du: Keep up with refcounting
      drm/bridge/lvds-codec: Keep up with refcounting
      drm/bridge/fsl-ldb: Keep up with refcounting.
      drm/panel/omapdrm: Keep up with refcounting
      drm/panel/sti: Keep up with refcounting
      drm/drm_of: Keep up with refcounting
      drm/fsl-dcu: Keep up with refcounting
      drm/mcde: Keep up with refcounting
      drm/bridge/analogix: Keep up with refcounting
      drm/tegra: Keep up with refcounting

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 1 +
 drivers/gpu/drm/bridge/fsl-ldb.c                   | 3 +++
 drivers/gpu/drm/bridge/lvds-codec.c                | 1 +
 drivers/gpu/drm/bridge/samsung-dsim.c              | 1 +
 drivers/gpu/drm/drm_of.c                           | 2 ++
 drivers/gpu/drm/drm_panel.c                        | 6 ++++++
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            | 1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          | 1 +
 drivers/gpu/drm/mcde/mcde_dsi.c                    | 5 ++++-
 drivers/gpu/drm/omapdrm/dss/output.c               | 6 ++++--
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c  | 2 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   | 1 +
 drivers/gpu/drm/sti/sti_dvo.c                      | 2 ++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             | 2 ++
 drivers/gpu/drm/tegra/dsi.c                        | 1 +
 15 files changed, 32 insertions(+), 3 deletions(-)
---
base-commit: 60ba94338047bb5410a3626ced3380afe9285ed8
change-id: 20250613-b4-of_drm_find_panel_part1-ad57c4f88a0c

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

