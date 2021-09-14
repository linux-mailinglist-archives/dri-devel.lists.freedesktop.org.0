Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B010340B28D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 17:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EEC6E4F4;
	Tue, 14 Sep 2021 15:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9915F6E4F4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 15:08:13 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u15so14717305wru.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 08:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CRIlQg+upo5hP8weBxz0PNmeSI1bR0RemM+MM+p+Is0=;
 b=WIPErERmvzG8kE+ee3gXEEaoYRJv5QdAd6mEUXBL1KiRLiBqfHT99QafcJEsV5HQRE
 EyxBpxCwwlSJTmhJLueVm9BDnrqkSpOWCvzem0bbVGlCwj6Uk6gNuaiJG5UGDNpuS5mL
 oZbVBZH/yTYcYVqsLKoffx7F5Wg3XXotg/OwQRSsRZ+739oVRz2CE+sMMnWOwgWvsTPS
 G5JUUr5Rs22DDBvIyc/XSk9Q2u1E3IZKdoY+s9nbedyu6asgEULeAijPb918sjmFwaVn
 6OFA+zvQRmxBZSYZkhkmjVp5xtk87vDER4PZ9tOpQ132GQLmgBlAXm59c8vx3ohTPvWW
 ZNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CRIlQg+upo5hP8weBxz0PNmeSI1bR0RemM+MM+p+Is0=;
 b=DNW/usPKfcPwdVk/UcEc2n39eK7ejUSh9viLZHzc8mp7vklHMXTyTeCz2cnhiVyp0x
 cbi6UytkXURwihDRluN50VuAgA8/tfYq4tA41YiFzr9aL1m7yH7qpTYiz2YzyVFzvwen
 ZqGy+TPNYbPb6LTIA1S9k+QMAQTPQmfPbiDwvTfkDwMS8xOBFsrqjiogSsh5A8efW1Yt
 DQliXseAnE4VIk9z6geKX/B1eS7a9EipvDZVxsMprpZovDQjooKhK95w/embSKgCwcwD
 mkE5Iteh8eqIB5Hd8ZHOqSs5kWrIrU6/gJ58BJXP42ESrw4ZDU4t5I4znlQ6ZwumwP4i
 ZPjw==
X-Gm-Message-State: AOAM5334YSIhFx7NI+0jrIQXJvnq/bsrvHm3H/qEMm0fpZNEvOeSBe/S
 YirzISph6EpE75JRASvKZw==
X-Google-Smtp-Source: ABdhPJxFKWizTvgkbxISpyz7IpsBM8Sxby+VDRXDNDfqeOTD9NprIar1qRNoqr847/8XwV7/VlJmrA==
X-Received: by 2002:a5d:6ca2:: with SMTP id a2mr19329229wra.291.1631632092081; 
 Tue, 14 Sep 2021 08:08:12 -0700 (PDT)
Received: from alex-ThinkPad-E480.. ([2a02:810b:f40:4200:b79e:d9e1:c821:37f2])
 by smtp.googlemail.com with ESMTPSA id
 k1sm10589441wrz.61.2021.09.14.08.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 08:08:11 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: Jonathan McDowell <noodles@earth.li>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alex Bee <knaerzche@gmail.com>
Subject: [PATCH] drm/rockchip: handle non-platform devices in
 rockchip_drm_endpoint_is_subdriver
Date: Tue, 14 Sep 2021 17:07:56 +0200
Message-Id: <20210914150756.85190-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.30.2
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

As discussed at [1] rockchip_drm_endpoint_is_subdriver will currently always
return -ENODEV for non-platform-devices (e.g. external i2c bridges), what
makes them never being considered in rockchip_rgb_init.

As suggested at [1] this additionally adds a of_device_is_available for
the node found, which will work for both platform and non-platform devices.
Also we can return early for non-platform-devices if they are enabled,
as rockchip_sub_drivers contains exclusively platform-devices.

[1] https://lore.kernel.org/all/20210316182753.GA25685@earth.li/

Suggested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index bfba9793d238..81a5ec30ef4f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -275,10 +275,17 @@ int rockchip_drm_endpoint_is_subdriver(struct device_node *ep)
 		return -ENODEV;
 
 	/* status disabled will prevent creation of platform-devices */
+	if (!of_device_is_available(node)) {
+		of_node_put(node);
+		return -ENODEV;
+	}
+
 	pdev = of_find_device_by_node(node);
 	of_node_put(node);
+
+	/* enabled non-platform-devices can immediately return here */
 	if (!pdev)
-		return -ENODEV;
+		return false;
 
 	/*
 	 * All rockchip subdrivers have probed at this point, so

base-commit: 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f
-- 
2.30.2

