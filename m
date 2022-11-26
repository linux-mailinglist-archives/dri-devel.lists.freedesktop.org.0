Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A20D6397F5
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 20:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D188F10E176;
	Sat, 26 Nov 2022 19:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D2410E124
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 01:59:42 +0000 (UTC)
Received: from kwepemi500015.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NJvzX5nQRzRpSh;
 Sat, 26 Nov 2022 09:59:04 +0800 (CST)
Received: from huawei.com (10.175.101.6) by kwepemi500015.china.huawei.com
 (7.221.188.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 26 Nov
 2022 09:59:38 +0800
From: Lu Wei <luwei32@huawei.com>
To: <thierry.reding@gmail.com>, <sam@ravnborg.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <marijn.suijten@somainline.org>,
 <angelogioacchino.delregno@somainline.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND net] drm/panel: Fix return value check in
 nt35950_probe()
Date: Sat, 26 Nov 2022 11:04:15 +0800
Message-ID: <20221126030415.4177465-1-luwei32@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500015.china.huawei.com (7.221.188.92)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 26 Nov 2022 19:03:23 +0000
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

In function nt35950_probe(), mipi_dsi_device_register_full() is called
to create a MIPI DSI device. If it fails, a pointer encoded with an
error will be returned, so use IS_ERR() to check the return value.
Besides, use PTR_ERR to return the actual errno.

Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
Signed-off-by: Lu Wei <luwei32@huawei.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt35950.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
index 3a844917da07..d850b081fd72 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
@@ -579,9 +579,9 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
 		}
 
 		nt->dsi[1] = mipi_dsi_device_register_full(dsi_r_host, info);
-		if (!nt->dsi[1]) {
+		if (IS_ERR(nt->dsi[1])) {
 			dev_err(dev, "Cannot get secondary DSI node\n");
-			return -ENODEV;
+			return PTR_ERR(nt->dsi[1]);
 		}
 		num_dsis++;
 	}
-- 
2.31.1

