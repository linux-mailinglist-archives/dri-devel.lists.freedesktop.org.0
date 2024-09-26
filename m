Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC64D986C29
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 07:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D2A10EA8A;
	Thu, 26 Sep 2024 05:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="I+rmzrvV";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LUHlaxKZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1877010EA8A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 05:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1727330160; x=1758866160;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dcOUiEE5g3NV+cMDqNVSOiaDkO9NmLB5/4wRl4dB+Xg=;
 b=I+rmzrvVNLWsp7apgJ9J4zsbIN9sf6d8bpXugfPekQoY9/8RgzEqo5tg
 bE1j6x6NtDMzzMzuv9bLIg68/rDfPLOpxOawLcr1kSc3PyQXsNjntb7k5
 2PxhS6zNw/RwJnzgX1bdqrDPUMizex5ksLU7WLB9xQQsbjz+ejDx8Q2pK
 KXdITvjppCRtG4nBSA0U0+UWXtUnKLWs1mvKQ6gs74SDx/EjgseQ+7Ce1
 0uCxiCyEAShSY9eGiMDyGvOpU4hCP3311+z5yeVYLdfrY0XKilLLSwl5C
 DCI1nzD0DRMunNhNrH0sowFWf8rN7bY4DBMtPEWGtH/4GQC977xv5bnz5 Q==;
X-CSE-ConnectionGUID: K9ZMYA8PQTOcSOikJnf/gQ==
X-CSE-MsgGUID: TbSP+5B2T/ixF8n4hw/wdQ==
X-IronPort-AV: E=Sophos;i="6.10,259,1719871200"; d="scan'208";a="39129814"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 26 Sep 2024 07:55:58 +0200
X-CheckPoint: {66F4F76E-8-D1F0B501-D0091591}
X-MAIL-CPID: 4342E026DBA5EC3A08DE4B8B2B6CDA52_0
X-Control-Analysis: str=0001.0A682F27.66F4F76E.0068, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D4C13160A3D; Thu, 26 Sep 2024 07:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1727330154; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=dcOUiEE5g3NV+cMDqNVSOiaDkO9NmLB5/4wRl4dB+Xg=;
 b=LUHlaxKZ5SuWy4RwNB2Z0v21/zukRiQGpioZeB0HPEdnHcphzxMGgKFZRlJNN2mNX/tmgR
 BDJjkGjUMJFQ3weQ7YS3wK/YiyTuGBwQrwFGhbZN0fHLQYh4XNi4hVcdA9rdVmJzcd3zFF
 uMD4nuYnBzbkr+nj3dtNPtglJf5KcSRtotD0hPI29ghh9LVixu3Rc89C61SyM5NnJhqsl5
 QxmGwMJ3aNpVpM7fNgydBo1WRlRgaTPHOQHqlv3w3peIw/M9nl+ylczbG3IBwZ8Qp7ebUu
 qg1ilEUhKznPQ7MV/vX4E00k5ugloIwTPw4oAEH60jIVML2YYXyTUGar2Vfrlw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Schiffer <matthias.schiffer@tq-group.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm: fsl-dcu: Use dev_err_probe
Date: Thu, 26 Sep 2024 07:55:50 +0200
Message-Id: <20240926055552.1632448-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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

fsl_dcu_drm_modeset_init can return -EPROBE_DEFER, so use dev_err_probe
to remove an invalid error message and add it to deferral description.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index ab6c0c6cd0e2e..dd820f19482ad 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -103,10 +103,8 @@ static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 	int ret;
 
 	ret = fsl_dcu_drm_modeset_init(fsl_dev);
-	if (ret < 0) {
-		dev_err(dev->dev, "failed to initialize mode setting\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev->dev, ret, "failed to initialize mode setting\n");
 
 	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
 	if (ret < 0) {
-- 
2.34.1

