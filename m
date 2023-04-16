Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E7B6E35FD
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 10:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDE110E2AC;
	Sun, 16 Apr 2023 08:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hust.edu.cn (unknown [202.114.0.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7523210E2AC
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 08:10:15 +0000 (UTC)
Received: from liber-MS-7D42.. ([10.12.190.56])
 (user=gangecen@hust.edu.cn mech=LOGIN bits=0)
 by mx1.hust.edu.cn  with ESMTP id 33G89Eu5003804-33G89Eu6003804
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 16 Apr 2023 16:09:20 +0800
From: Gencen Gan <gangecen@hust.edu.cn>
To: Emma Anholt <emma@anholt.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Gan Gecen <gangecen@hust.edu.cn>
Subject: [PING PATCH] drm/pl111: fix drm and dev leak when irq request failed.
Date: Sun, 16 Apr 2023 16:09:07 +0800
Message-Id: <20230416080907.3895808-1-gangecen@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: gangecen@hust.edu.cn
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
Cc: hust-os-kernel-patches@googlegroups.com,
 Cheng Ziqiu <chengziqiu@hust.edu.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch reports:
	pl111_amba_probe() warn: missing unwind goto?

Code segment for dev_put is:
	dev_put:
		drm_dev_put(drm);
		of_reserved_mem_device_release(dev);

When err happened, jumping to dev_put will release
drm and dev resources allocated or initialized 
before. But after devm_request_irq() failed, it
returns directly without releasing drm and dev, 
which may cause memory leak.

Fixes: 3f9d6bccff6c ("drm/pl111: fix drm and dev leak when irq request failed")
Signed-off-by: Gan Gecen <gangecen@hust.edu.cn>
Reviewed-by: Cheng Ziqiu <chengziqiu@hust.edu.cn>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 00deba0b7271..52945f7e0aef 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -297,7 +297,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 			       variant->name, priv);
 	if (ret != 0) {
 		dev_err(dev, "%s failed irq %d\n", __func__, ret);
-		return ret;
+		goto dev_put;
 	}
 
 	ret = pl111_modeset_init(drm);
-- 
2.34.1
