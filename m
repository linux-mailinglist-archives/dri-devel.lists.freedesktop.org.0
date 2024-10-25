Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1663B9AFB99
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 09:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7671510EA15;
	Fri, 25 Oct 2024 07:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1019 seconds by postgrey-1.36 at gabe;
 Fri, 25 Oct 2024 07:55:59 UTC
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5F510EA15
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 07:55:59 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XZZQ501sSzQsDN;
 Fri, 25 Oct 2024 15:38:05 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
 by mail.maildlp.com (Postfix) with ESMTPS id E58E01401F3;
 Fri, 25 Oct 2024 15:38:58 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 25 Oct
 2024 15:38:57 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <neil.armstrong@linaro.org>, <quic_jesszhan@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH 1/2] drm/i2c/ch7006: Add a check to prevent NULL pointer
 dereference
Date: Fri, 25 Oct 2024 15:34:07 +0800
Message-ID: <20241025073408.27481-2-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241025073408.27481-1-zhangzekun11@huawei.com>
References: <20241025073408.27481-1-zhangzekun11@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)
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

drm_mode_duplicate() could return NULL due to lack of memory,
which will then call NULL pointer dereference. Add a check to
prevent it.

Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/gpu/drm/i2c/ch7006_drv.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index 131512a5f3bd..a2942f497c60 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -232,12 +232,16 @@ static int ch7006_encoder_get_modes(struct drm_encoder *encoder,
 	int n = 0;
 
 	for (mode = ch7006_modes; mode->mode.clock; mode++) {
+		struct drm_display_mode *new_mode;
+
 		if (~mode->valid_scales & 1<<priv->scale ||
 		    ~mode->valid_norms & 1<<priv->norm)
 			continue;
 
-		drm_mode_probed_add(connector,
-				drm_mode_duplicate(encoder->dev, &mode->mode));
+		new_mode = drm_mode_duplicate(encoder->dev, &mode->mode);
+		if (!new_mode)
+			continue;
+		drm_mode_probed_add(connector, new_mode);
 
 		n++;
 	}
-- 
2.17.1

