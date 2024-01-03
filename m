Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AAD822F49
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 15:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2200B10E0AA;
	Wed,  3 Jan 2024 14:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.217])
 by gabe.freedesktop.org (Postfix) with ESMTP id 442AF10E0AA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 14:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Now9Y
 nDkaSsHEHrDFSFBcDE8yy3D0lUh+jYhNHjxB6g=; b=Jw9L9SfNrJBd4s6kWTjbX
 G/ntiwm+fC8VvvhmuPERdxVtxQK8bkSWqPrNVs5hF20pSDgh3d/uAbyBuKQjvJ34
 OekV8+HhsDiGuef0nqAG7WqQtNxod2BR87QxgShcCfOaUssL6//mu6HPnn4OBcGn
 Qg2L+oOycNOqJSZRvVMHCw=
Received: from ubuntu22.localdomain (unknown [117.176.219.50])
 by zwqz-smtp-mta-g4-1 (Coremail) with SMTP id _____wDnL+uEbJVlwe6uAA--.29037S2;
 Wed, 03 Jan 2024 22:17:42 +0800 (CST)
From: chenguanxi11234@163.com
To: neil.armstrong@linaro.org
Subject: [PATCH linux-next] drm/panel: samsung: Simplify with dev_err_probe()
Date: Wed,  3 Jan 2024 22:17:38 +0800
Message-Id: <061ed94a003362bb7d7e9d3e4d38358c5b91c8a3.1704186827.git.chen.haonan2@zte.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnL+uEbJVlwe6uAA--.29037S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF1DJF47Xw4fXw18AF43ZFb_yoWkAFX_C3
 45u3WfuwsrGF4Igr17Aa17ArWIka9Y9F4kuwnYk3W7tw1DG3W3JFykJFyDJw17WF47uF90
 y3WfXFWFvF4fGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8AWrJUUUUU==
X-Originating-IP: [117.176.219.50]
X-CM-SenderInfo: xfkh0wxxdq5xirrsjki6rwjhhfrp/1tbiQAlY+mVOAw9xcAABsM
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
Cc: cgel.zte@gmail.com, linux-kernel@vger.kernel.org, mripard@kernel.org,
 Chen Haonan <chen.haonan2@zte.com.cn>, yang.guang5@zte.com.cn,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen Haonan <chen.haonan2@zte.com.cn>

dev_err_probe() can check if the error code is -EPROBE_DEFER 
and can return the error code, replacing dev_err() with it 
simplifies the code.

Signed-off-by: Chen Haonan <chen.haonan2@zte.com.cn>
---
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
index 79f611963c61..f4103e762b53 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
@@ -194,10 +194,8 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
 	s6->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						GPIOD_OUT_HIGH);
 	if (IS_ERR(s6->reset_gpio)) {
-		ret = PTR_ERR(s6->reset_gpio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to request GPIO (%d)\n", ret);
-		return ret;
+		return dev_err_probe(dev, PTR_ERR(s6->reset_gpio),
+							 "failed to request GPIO\n");
 	}
 
 	drm_panel_init(&s6->panel, dev, &s6d16d0_drm_funcs,
-- 
2.25.1

