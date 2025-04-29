Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF289AA0827
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 12:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4031510E416;
	Tue, 29 Apr 2025 10:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="naSIwO8A";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="pYPYSarC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FCA10E416
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 10:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1745921377; x=1777457377;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iSnB+tiO7RJY6/v5TqZgypWMYIiKGFl49Mks0edXerk=;
 b=naSIwO8A4l9Uc2WXSBvZ5xjtgxy481negkfF9hyVkwWu0TDXSPxuv0Ub
 9s9jIv8gfTrXvvFJmdV5d1mvIZn9assvcgBzlEGVH9Hkw3vQx6pWhpxe8
 9jQcvUzNXzLNQZ+xy1h3K1dq7hWbQCyeLumzLCg0folM9XiGAz3wbOl+q
 gF2hmdqzeplZX7vaDmd3b4yOZjihtXhDyiwlMX3BlgmBKx55h2brX4PiZ
 Nw0v0F0ilt5bsDZ8z/um5pNc0vic5Btg9Rl0s2s5jaYej9ie+93sE6voZ
 FIpz8ADS1HN8huMzLYsy1adRl+ryqKBa9BHv/+srq8HZ8L/HmZ9rmB4ox A==;
X-CSE-ConnectionGUID: 2oTZPV+dSOOsxLVCJYAMkQ==
X-CSE-MsgGUID: 8xZ4UqzESUiszoQuMgVlRg==
X-IronPort-AV: E=Sophos;i="6.15,248,1739833200"; d="scan'208";a="43779882"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 29 Apr 2025 12:09:29 +0200
X-CheckPoint: {6810A559-B-22EE63B7-E8AF8A9B}
X-MAIL-CPID: 219F0D8F3AD959829E5A5445EFFD28B2_3
X-Control-Analysis: str=0001.0A006396.6810A558.0045, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 658B4160E51; Tue, 29 Apr 2025 12:09:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1745921364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iSnB+tiO7RJY6/v5TqZgypWMYIiKGFl49Mks0edXerk=;
 b=pYPYSarCiS7YLzsLmIEXC7QY79PIP9YZfAi+DPC2mCufP2/ezomg7Bcpzre93c5Q5EMkIZ
 1WGkI8x+nprBZjyk0OaYhLFHZsN1NRxTDCR6d1Hd+6o4RXmAIhDbJOsLKL2yxcA+7Uy9L5
 Xzy9OVOLC/Rrtrqvj3dWfxSPVp0U3KdOWEnox7QSpHdoqk4lr1NuiNI+qGPs0BSeMYxPz0
 anJ4VMTsnJRMiTnYG9YbcbjH/orFmCG4rZI3b7RnTMwvWC5jtbHKqUkc6lK/n9R/mxvZUb
 9xdxcrLkZBoW19+TV0FNj2Am5UGkBcLvKAW/vMC/iP72f12vHcd91qUqYc5oRA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm: lcdif: Use dev_err_probe()
Date: Tue, 29 Apr 2025 12:09:18 +0200
Message-ID: <20250429100919.1180404-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

Use dev_err_probe() to add a reason for deferred probe. This can
especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index d5996efaf34bb..99e632d4a0e9b 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -164,15 +164,17 @@ static int lcdif_load(struct drm_device *drm)
 
 	lcdif->clk = devm_clk_get(drm->dev, "pix");
 	if (IS_ERR(lcdif->clk))
-		return PTR_ERR(lcdif->clk);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk), "Failed to get pix clock\n");
 
 	lcdif->clk_axi = devm_clk_get(drm->dev, "axi");
 	if (IS_ERR(lcdif->clk_axi))
-		return PTR_ERR(lcdif->clk_axi);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_axi),
+				     "Failed to get axi clock\n");
 
 	lcdif->clk_disp_axi = devm_clk_get(drm->dev, "disp_axi");
 	if (IS_ERR(lcdif->clk_disp_axi))
-		return PTR_ERR(lcdif->clk_disp_axi);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_disp_axi),
+				     "Failed to get disp_axi clock\n");
 
 	platform_set_drvdata(pdev, drm);
 
-- 
2.43.0

